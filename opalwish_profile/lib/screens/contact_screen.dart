import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Contact Screen
/// Displays contact information with clickable email and phone intents.

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  /// Opens the email client with the pre-filled email address
  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: AppConstants.contactEmail);

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (context.mounted) {
          _showErrorSnackBar(context, 'Could not open email client');
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Could not open email client');
      }
    }
  }

  /// Opens the phone dialer with the pre-filled phone number
  Future<void> _launchPhone(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: AppConstants.contactPhoneRaw);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (context.mounted) {
          _showErrorSnackBar(context, 'Could not open phone dialer');
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Could not open phone dialer');
      }
    }
  }

  /// Shows an error message in a snackbar
  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          children: [
            const SizedBox(height: AppTheme.spacingL),

            // Header section
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.contact_support_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: AppTheme.spacingL),

            Text('Get In Touch', style: AppTheme.headingLarge),

            const SizedBox(height: AppTheme.spacingS),

            Text(
              'We would love to hear from you',
              style: AppTheme.bodyLarge.copyWith(color: AppTheme.textSecondary),
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Contact Name Card
            _buildContactCard(
              icon: Icons.person_outline,
              title: 'Contact Person',
              value: AppConstants.contactName,
              color: AppTheme.primaryColor,
              onTap: null,
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Email Card (Clickable)
            _buildContactCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: AppConstants.contactEmail,
              color: Colors.green,
              onTap: () => _launchEmail(context),
              actionIcon: Icons.open_in_new,
              actionText: 'Tap to send email',
            ),

            const SizedBox(height: AppTheme.spacingM),

            // Phone Card (Clickable)
            _buildContactCard(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: AppConstants.contactPhone,
              color: Colors.blue,
              onTap: () => _launchPhone(context),
              actionIcon: Icons.call,
              actionText: 'Tap to call',
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Note card
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.amber.shade800,
                      size: 24,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Privacy Note',
                            style: AppTheme.labelLarge.copyWith(
                              color: Colors.amber.shade900,
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingXS),
                          Text(
                            'This app does not collect or store any data. '
                            'When you tap on email or phone, your device\'s '
                            'respective app will open.',
                            style: AppTheme.bodyMedium.copyWith(
                              color: Colors.amber.shade900,
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
          ],
        ),
      ),
    );
  }

  /// Builds a contact information card
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    VoidCallback? onTap,
    IconData? actionIcon,
    String? actionText,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingL),
          child: Column(
            children: [
              Row(
                children: [
                  // Icon container
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spacingM),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusM),
                    ),
                    child: Icon(icon, color: color, size: 28),
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spacingXS),
                        Text(
                          value,
                          style: AppTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: onTap != null ? color : AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Action icon
                  if (onTap != null && actionIcon != null)
                    Icon(actionIcon, color: color, size: 24),
                ],
              ),
              // Action text
              if (onTap != null && actionText != null) ...[
                const SizedBox(height: AppTheme.spacingM),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppTheme.spacingS,
                    horizontal: AppTheme.spacingM,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, color: color, size: 16),
                      const SizedBox(width: AppTheme.spacingS),
                      Text(
                        actionText,
                        style: AppTheme.bodySmall.copyWith(
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
