import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Home Screen
/// Displays the company name, app statement, and a short professional introduction.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appNameShort)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppTheme.spacingL),

            // Company logo placeholder - using an icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.diamond_outlined,
                size: 64,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Company name
            Text(
              AppConstants.companyName,
              textAlign: TextAlign.center,
              style: AppTheme.headingLarge.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),

            const SizedBox(height: AppTheme.spacingS),

            // App statement
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingS,
              ),
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Text(
                AppConstants.companyTagline,
                textAlign: TextAlign.center,
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Divider with decoration
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingM,
                  ),
                  child: Icon(
                    Icons.business,
                    color: AppTheme.textSecondary.withValues(alpha: 0.5),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Introduction card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 40,
                      color: AppTheme.primaryColor.withValues(alpha: 0.7),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text('About Us', style: AppTheme.headingSmall),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      AppConstants.companyIntroduction,
                      textAlign: TextAlign.center,
                      style: AppTheme.bodyLarge.copyWith(height: 1.6),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Quick info cards
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.phone_android,
                    title: 'Mobile Apps',
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.web,
                    title: 'Websites',
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.business_center,
                    title: 'Digital Solutions',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacingXL),
          ],
        ),
      ),
    );
  }

  /// Builds a small info card for the quick info section
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.all(AppTheme.spacingXS),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: AppTheme.spacingS),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTheme.bodySmall.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
