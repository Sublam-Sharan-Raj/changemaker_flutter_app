import 'package:auto_route/auto_route.dart';
import 'package:changemaker_flutter_app/common/widgets/background_gradient_widget.dart';
import 'package:changemaker_flutter_app/features/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage(name: 'ProfileRoute')
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BackgroundGradientWidget(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              const Gap(16),
              Text(
                ref.read(authStateNotifierProvider).user?.displayName ?? '',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1654110455429-cf322b40a906?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1180',
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                height: 145.r,
                width: 145.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
