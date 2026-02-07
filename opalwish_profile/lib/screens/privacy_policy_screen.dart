import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Privacy Policy Screen
/// Displays the embedded offline privacy policy text.

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Card(
              color: AppTheme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                      ),
                      child: const Icon(
                        Icons.privacy_tip_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Privacy Matters',
                            style: AppTheme.headingSmall.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingXS),
                          Text(
                            'This app collects no personal data',
                            style: AppTheme.bodyMedium.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Key highlights
            _buildHighlightCard(
              icon: Icons.wifi_off,
              title: '100% Offline',
              description: 'No internet connection required or used',
              color: Colors.green,
            ),

            const SizedBox(height: AppTheme.spacingM),

            _buildHighlightCard(
              icon: Icons.no_accounts,
              title: 'No Data Collection',
              description: 'We do not collect any personal information',
              color: Colors.blue,
            ),

            const SizedBox(height: AppTheme.spacingM),

            _buildHighlightCard(
              icon: Icons.security,
              title: 'No Tracking',
              description: 'No analytics or user tracking of any kind',
              color: Colors.orange,
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Full privacy policy text
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.article_outlined,
                          color: AppTheme.primaryColor,
                          size: 24,
                        ),
                        const SizedBox(width: AppTheme.spacingM),
                        Text(
                          'Full Privacy Policy',
                          style: AppTheme.headingSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    const Divider(),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      AppConstants.privacyPolicy,
                      style: AppTheme.bodyMedium.copyWith(height: 1.8),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            // Company name footer
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.verified_user,
                    color: AppTheme.primaryColor.withValues(alpha: 0.5),
                    size: 40,
                  ),
                  const SizedBox(height: AppTheme.spacingS),
                  Text(
                    AppConstants.companyName,
                    textAlign: TextAlign.center,
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }

  /// Builds a highlight card for key privacy features
  Widget _buildHighlightCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.labelLarge.copyWith(color: color),
                  ),
                  const SizedBox(height: AppTheme.spacingXS),
                  Text(
                    description,
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.check_circle, color: color, size: 24),
          ],
        ),
      ),
    );
  }
}
