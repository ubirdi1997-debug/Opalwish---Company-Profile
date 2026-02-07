import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';

/// Services Screen
/// Displays the company's services with clear descriptions.

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  /// Maps service icon names to IconData
  IconData _getIconForService(String iconName) {
    switch (iconName) {
      case 'phone_android':
        return Icons.phone_android;
      case 'web':
        return Icons.web;
      case 'business_center':
        return Icons.business_center;
      case 'devices':
        return Icons.devices;
      default:
        return Icons.star;
    }
  }

  /// Returns a color for each service based on index
  Color _getColorForIndex(int index) {
    final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Services')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Card(
              color: AppTheme.primaryColor.withValues(alpha: 0.05),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(AppTheme.radiusM),
                      ),
                      child: const Icon(
                        Icons.miscellaneous_services,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('What We Offer', style: AppTheme.headingMedium),
                          const SizedBox(height: AppTheme.spacingXS),
                          Text(
                            'Professional digital solutions tailored to your needs',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.textSecondary,
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

            // Services list
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppConstants.services.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppTheme.spacingM),
              itemBuilder: (context, index) {
                final service = AppConstants.services[index];
                final color = _getColorForIndex(index);
                final icon = _getIconForService(service['icon'] ?? 'star');

                return _ServiceCard(
                  title: service['title'] ?? '',
                  description: service['description'] ?? '',
                  icon: icon,
                  color: color,
                  index: index + 1,
                );
              },
            ),

            const SizedBox(height: AppTheme.spacingXL),

            // Bottom note
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.amber.shade700,
                      size: 32,
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Text(
                        'We customize our services to meet your specific requirements. '
                        'Contact us to discuss your project needs.',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
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
}

/// Individual service card widget
class _ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final int index;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Service number badge
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '$index',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                // Service icon
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingS),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: AppTheme.spacingM),
                // Service title
                Expanded(child: Text(title, style: AppTheme.headingSmall)),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            // Colored accent line
            Container(
              height: 3,
              width: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            // Service description
            Text(
              description,
              style: AppTheme.bodyLarge.copyWith(
                height: 1.6,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
