/// App Constants
/// Contains all hardcoded strings and data for the OpalWish Company Profile app.
/// All content is static and works 100% offline.
library;

class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // ─────────────────────────────────────────────────────────────────────────────
  // APP IDENTITY
  // ─────────────────────────────────────────────────────────────────────────────
  static const String appName = 'OpalWish – Official Company Profile';
  static const String appNameShort = 'OpalWish';
  static const String packageName = 'com.opalwish.profile';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // ─────────────────────────────────────────────────────────────────────────────
  // COMPANY IDENTITY
  // ─────────────────────────────────────────────────────────────────────────────
  static const String companyName = 'OPALWISH (OPC) PRIVATE LIMITED';
  static const String companyTagline = 'Official Company Profile Application';

  static const String companyIntroduction =
      'OPALWISH (OPC) PRIVATE LIMITED is a digital technology company '
      'specializing in Android application development, website design, '
      'and digital business solutions.';

  // ─────────────────────────────────────────────────────────────────────────────
  // CONTACT INFORMATION
  // ─────────────────────────────────────────────────────────────────────────────
  static const String contactName = 'Jaswinder Singh Saini';
  static const String contactEmail = 'opalwishopc1997@gmail.com';
  static const String contactPhone = '+91 98760 81332';
  static const String contactPhoneRaw = '+919876081332'; // For dialer intent

  // ─────────────────────────────────────────────────────────────────────────────
  // ABOUT COMPANY CONTENT
  // ─────────────────────────────────────────────────────────────────────────────
  static const String aboutCompanyOverview =
      'OPALWISH (OPC) PRIVATE LIMITED is a registered One Person Company (OPC) '
      'dedicated to delivering high-quality digital technology solutions. '
      'We are committed to helping businesses and individuals succeed in the '
      'digital landscape through innovative and reliable services.';

  static const String aboutCompanyFocus =
      'Our core business focus areas include:\n\n'
      '• Android Application Development\n'
      '• Website Design & Development\n'
      '• Digital Business Solutions\n\n'
      'We work closely with our clients to understand their unique requirements '
      'and deliver customized solutions that meet their specific needs.';

  static const String aboutCompanyValues =
      'At OPALWISH, we believe in:\n\n'
      '• Professionalism – Maintaining the highest standards in all our work\n'
      '• Transparency – Clear and honest communication with our clients\n'
      '• Quality – Delivering solutions that exceed expectations\n'
      '• Innovation – Staying updated with the latest technologies\n'
      '• Client Satisfaction – Putting our clients\' needs first';

  // ─────────────────────────────────────────────────────────────────────────────
  // SERVICES
  // ─────────────────────────────────────────────────────────────────────────────
  static const List<Map<String, String>> services = [
    {
      'title': 'Android App Development',
      'description':
          'We develop professional Android applications tailored to your business needs. '
          'Our apps are built with modern frameworks and follow best practices for '
          'performance, security, and user experience.',
      'icon': 'phone_android',
    },
    {
      'title': 'Website Design & Development',
      'description':
          'We create responsive, modern websites that effectively represent your brand online. '
          'From simple informational sites to complex web applications, we deliver '
          'solutions that engage your audience.',
      'icon': 'web',
    },
    {
      'title': 'Digital Business Solutions',
      'description':
          'We provide comprehensive digital solutions to help businesses streamline '
          'their operations and establish a strong digital presence. Our solutions '
          'are designed to drive growth and efficiency.',
      'icon': 'business_center',
    },
    {
      'title': 'Software-Based Platforms',
      'description':
          'We develop custom software platforms that address specific business challenges. '
          'Our platforms are scalable, secure, and built to evolve with your business needs.',
      'icon': 'devices',
    },
  ];

  // ─────────────────────────────────────────────────────────────────────────────
  // PRIVACY POLICY (Embedded Offline)
  // ─────────────────────────────────────────────────────────────────────────────
  static const String privacyPolicy = '''
PRIVACY POLICY

OPALWISH (OPC) PRIVATE LIMITED respects user privacy.

This application does not collect, store, or share any personal user data.

The app functions entirely offline and is intended only to provide official company information.

Any communication initiated by the user via email or phone is handled externally and is not stored within the app.

─────────────────────────────────────────

DATA COLLECTION

This application does not:
• Collect any personal information
• Track user activity or behavior
• Store any user data locally or remotely
• Use cookies or similar tracking technologies
• Share any information with third parties

─────────────────────────────────────────

OFFLINE FUNCTIONALITY

This app is designed to work 100% offline. It does not:
• Connect to the internet
• Fetch data from external servers
• Require any network permissions

─────────────────────────────────────────

EXTERNAL COMMUNICATION

When you choose to contact us via email or phone using the links provided in this app:
• The email or phone application on your device will be opened
• Any communication you initiate is handled by your device's default applications
• We do not intercept, store, or process this communication within this app

─────────────────────────────────────────

CONTACT

If you have any questions about this privacy policy, please contact us at:

Email: opalwishopc1997@gmail.com
Phone: +91 98760 81332

─────────────────────────────────────────

Last Updated: February 2026
''';

  // ─────────────────────────────────────────────────────────────────────────────
  // ABOUT APP CONTENT
  // ─────────────────────────────────────────────────────────────────────────────
  static const String ownershipStatement =
      'This app is owned and operated by OPALWISH (OPC) PRIVATE LIMITED.';

  static const String aboutAppDescription =
      'This is the official company profile application of OPALWISH (OPC) PRIVATE LIMITED. '
      'The app provides information about our company, services, and contact details. '
      'It is designed to work completely offline and does not collect any user data.';
}
