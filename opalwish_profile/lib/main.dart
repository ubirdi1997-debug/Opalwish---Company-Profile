import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/app_constants.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/about_company_screen.dart';
import 'screens/services_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/about_app_screen.dart';

/// OpalWish - Official Company Profile Application
///
/// This app is 100% offline and does not collect any user data.
/// It provides information about OPALWISH (OPC) PRIVATE LIMITED.

void main() {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const OpalWishApp());
}

/// Main application widget
class OpalWishApp extends StatelessWidget {
  const OpalWishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App configuration
      title: AppConstants.appNameShort,
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,

      // Home screen with navigation
      home: const MainNavigationScreen(),
    );
  }
}

/// Main navigation screen with bottom navigation bar
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Current selected navigation index
  int _currentIndex = 0;

  // List of main screens (shown in bottom navigation)
  final List<Widget> _mainScreens = const [
    HomeScreen(),
    AboutCompanyScreen(),
    ServicesScreen(),
    ContactScreen(),
  ];

  // Navigation items for bottom navigation bar
  final List<NavigationItem> _navigationItems = const [
    NavigationItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    NavigationItem(
      icon: Icons.business_outlined,
      activeIcon: Icons.business,
      label: 'About',
    ),
    NavigationItem(
      icon: Icons.design_services_outlined,
      activeIcon: Icons.design_services,
      label: 'Services',
    ),
    NavigationItem(
      icon: Icons.contact_mail_outlined,
      activeIcon: Icons.contact_mail,
      label: 'Contact',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App body - shows current screen based on navigation
      body: IndexedStack(index: _currentIndex, children: _mainScreens),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavigationTap,
          type: BottomNavigationBarType.fixed,
          items: _navigationItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  activeIcon: Icon(item.activeIcon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      ),

      // Navigation drawer for additional screens
      drawer: _buildDrawer(),
    );
  }

  /// Handles navigation tap
  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Builds the navigation drawer with additional menu items
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          // Drawer header
          DrawerHeader(
            decoration: const BoxDecoration(color: AppTheme.primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Company logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.diamond_outlined,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                // App name
                const Text(
                  AppConstants.appNameShort,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                // Company name
                Text(
                  AppConstants.companyName,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Main navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Main screens section
                _buildDrawerItem(
                  icon: Icons.home_outlined,
                  title: 'Home',
                  isSelected: _currentIndex == 0,
                  onTap: () {
                    _onNavigationTap(0);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.business_outlined,
                  title: 'About Company',
                  isSelected: _currentIndex == 1,
                  onTap: () {
                    _onNavigationTap(1);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.design_services_outlined,
                  title: 'Our Services',
                  isSelected: _currentIndex == 2,
                  onTap: () {
                    _onNavigationTap(2);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.contact_mail_outlined,
                  title: 'Contact Us',
                  isSelected: _currentIndex == 3,
                  onTap: () {
                    _onNavigationTap(3);
                    Navigator.pop(context);
                  },
                ),

                const Divider(),

                // Additional screens section header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                    vertical: AppTheme.spacingS,
                  ),
                  child: Text(
                    'More',
                    style: AppTheme.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Privacy Policy
                _buildDrawerItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),

                // About App
                _buildDrawerItem(
                  icon: Icons.info_outline,
                  title: 'About App',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutAppScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Drawer footer
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Icon(Icons.copyright, size: 16, color: AppTheme.textSecondary),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    '${DateTime.now().year} OpalWish',
                    style: AppTheme.bodySmall,
                  ),
                ),
                Text('v${AppConstants.appVersion}', style: AppTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a drawer list item
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppTheme.primaryColor.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      onTap: onTap,
    );
  }
}

/// Data class for navigation items
class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
