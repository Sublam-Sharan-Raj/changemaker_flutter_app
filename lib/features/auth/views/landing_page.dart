import 'package:auto_route/annotations.dart';
import 'package:changemaker_flutter_app/app_router.dart';
import 'package:changemaker_flutter_app/app_router.gr.dart';
import 'package:changemaker_flutter_app/features/auth/providers/login_provider.dart';
import 'package:changemaker_flutter_app/i18n/strings.g.dart';
import 'package:changemaker_flutter_app/utils/app_utils.dart';
import 'package:changemaker_flutter_app/utils/assets_utils.dart';
import 'package:changemaker_flutter_app/utils/color_utils.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

@RoutePage()
class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginStateNotifierProvider,
      (previous, next) {
        if (next.isSocialLoginLoading) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ref.read(assetsProvider).landingPageBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FittedBox(
                child: Text(
                  'Changemaker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              FittedBox(
                child: Text(
                  'HIP 3D®',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                t.login.reprogramYourSub,
                style: GoogleFonts.dmSans(
                  color: ref.read(colorProvider).secondaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(300.h),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    ref.read(routeProvider).navigate(LoginPageRoute());
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    t.login.login,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Gap(16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    ref.read(routeProvider).navigate(RegisterPageRoute());
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: ref.read(colorProvider).secondaryColor,
                    foregroundColor: Colors.black,
                    elevation: 10,
                  ),
                  child: Text(
                    t.login.register,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .signInUsingGoogle();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: const Iconify(Logos.google_icon),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          AppUtils.showSnackBar('Comming soon');
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: const Iconify(Logos.facebook),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          ref
                              .read(loginStateNotifierProvider.notifier)
                              .signInUsingApple();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        child: const Iconify(Logos.apple),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              TextButton(
                onPressed: () {
                  ref
                      .read(routeProvider)
                      .navigate(const PasswordResetPageRoute());
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: t.login.forgotPassword,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: t.login.clickHereToReset,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DropdownButton(
                value: LocaleSettings.currentLocale.languageCode,
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'de',
                    child: Text('Deutsch'),
                  ),
                ],
                onChanged: (value) {
                  LocaleSettings.setLocaleRaw(value!);
                  setState(() {});
                },
                iconEnabledColor: Colors.white,
                style: GoogleFonts.dmSans(color: Colors.white),
                dropdownColor: ref.read(colorProvider).gradientStartColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
