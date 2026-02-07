import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// About App Screen
/// Displays app information including name, package, version, and ownership.

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            const SizedBox(height: AppTheme.spacingL),

            // App icon
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

            // App name
            Text(
              AppConstants.appNameShort,
              style: AppTheme.headingLarge.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),

            const SizedBox(height: AppTheme.spacingXS),

            // Version badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingXS,
              ),
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Text(
                'Version ${AppConstants.appVersion}',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // App details card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  children: [
                    _buildDetailRow(
                      icon: Icons.label_outline,
                      label: 'App Name',
                      value: AppConstants.appName,
                    ),
                    const Divider(height: AppTheme.spacingL),
                    _buildDetailRow(
                      icon: Icons.inventory_2_outlined,
                      label: 'Package Name',
                      value: AppConstants.packageName,
                    ),
                    const Divider(height: AppTheme.spacingL),
                    _buildDetailRow(
                      icon: Icons.new_releases_outlined,
                      label: 'Version',
                      value:
                          '${AppConstants.appVersion} (Build ${AppConstants.appBuildNumber})',
                    ),
                    const Divider(height: AppTheme.spacingL),
                    _buildDetailRow(
                      icon: Icons.android,
                      label: 'Platform',
                      value: 'Android',
                    ),
                    const Divider(height: AppTheme.spacingL),
                    _buildDetailRow(
                      icon: Icons.code,
                      label: 'Framework',
                      value: 'Flutter',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            // App description card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(width: AppTheme.spacingS),
                        Text('Description', style: AppTheme.headingSmall),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      AppConstants.aboutAppDescription,
                      style: AppTheme.bodyLarge.copyWith(
                        height: 1.6,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Ownership card
            Card(
              color: AppTheme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.copyright,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      'Ownership',
                      style: AppTheme.headingSmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(
                      AppConstants.ownershipStatement,
                      textAlign: TextAlign.center,
                      style: AppTheme.bodyLarge.copyWith(
                        color: Colors.white.withValues(alpha: 0.95),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // App features
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_outline, color: AppTheme.primaryColor),
                        const SizedBox(width: AppTheme.spacingS),
                        Text('App Features', style: AppTheme.headingSmall),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    _buildFeatureItem(
                      icon: Icons.wifi_off,
                      text: '100% Offline functionality',
                    ),
                    _buildFeatureItem(
                      icon: Icons.no_accounts,
                      text: 'No data collection or storage',
                    ),
                    _buildFeatureItem(
                      icon: Icons.block,
                      text: 'No ads or login required',
                    ),
                    _buildFeatureItem(
                      icon: Icons.security,
                      text: 'Privacy-focused design',
                    ),
                    _buildFeatureItem(
                      icon: Icons.verified,
                      text: 'Google Play compliant',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Footer
            Text(
              '© ${DateTime.now().year} ${AppConstants.companyName}',
              textAlign: TextAlign.center,
              style: AppTheme.bodySmall.copyWith(color: AppTheme.textSecondary),
            ),

            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }

  /// Builds a detail row with icon, label, and value
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingS),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
          ),
          child: Icon(icon, color: AppTheme.primaryColor, size: 20),
        ),
        const SizedBox(width: AppTheme.spacingM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTheme.bodySmall),
              const SizedBox(height: AppTheme.spacingXS),
              Text(
                value,
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a feature item with a checkmark
  Widget _buildFeatureItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingS),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(child: Text(text, style: AppTheme.bodyMedium)),
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
        ],
      ),
    );
  }
}
