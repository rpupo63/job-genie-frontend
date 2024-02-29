part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Background.parallax(
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: Env.controller.node,
          onKey: Env.controller.onKey,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: NavigationHeader(),
            drawer: NavigationDrawer.of(context),
            body: InteractiveScrollViewer(
              scrollToId: Env.controller.instance,
              scrollDirection: Axis.vertical,
              children: [
                ...Env.navigations.to(HomePage.scrollContent),
                ScrollContent(
                  id: 'footer',
                  child: const NavigationFooter(),
                )
              ],
            ),
            floatingActionButton: HomePage.floatingButton(),
          ),
        ),
      ),
    );
  }

  static Widget floatingButton() {
    return ValueListenableBuilder(
      valueListenable: Env.controller,
      builder: (_, value, child) {
        return TweenAnimationBuilder(
          tween: Tween(end: value == Env.navigations.last.id ? 0.0 : 1.0),
          duration: Constants.duration,
          builder: (_, value, child) {
            return Transform.translate(
              offset: Offset(0.0, value * kToolbarHeight * 2.0),
              child: child,
            );
          },
          child: child,
        );
      },
      child: Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              DButton(
                onTap: () => launchUrl(Uri.parse('https://github.com'
                    '/Nialixus'
                    '/flutter_landing_page')),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View the source code in',
                        style: context.text.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const DImage(
                        source: 'https://assets.stickpng.com'
                            '/images'
                            '/629b7adc7c5cd817694c3231.png',
                        size: Size(80.0, 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () => Env.controller.onTap(
                  context,
                  id: Env.navigations.first.id,
                ),
                child: Seo.link(
                  anchor: 'Go back to top',
                  href: '/?section=${Env.navigations.first.id}',
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    semanticLabel: 'Go back to top',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static ScrollContent scrollContent(
    int index,
    NavigationModel item,
  ) {
    return ScrollContent(
        id: item.id,
        child: [
          // HomeStarter Section: Introduction
          HomeStarter(
            id: item.id,
            title: "Explore Key Features or Benefits",
            subtitle:
                "Submit your resume and cover letter only once. Apply automatically and get reports. Look for the best opportunities passively.",
          ),

          // HomeFeatures Section: Key Features
          HomeFeatures(
            id: item.id,
            title: 'Key Features',
            subtitle:
                'Explore Why Our Product is the Ideal Solution for Your Needs',
            cards: const [
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: "Discover the World's Wonders",
                subtitle:
                    'Embark on a mesmerizing journey to breathtaking destinations and uncover the hidden gems that make our planet truly extraordinary. 🚀',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Unleash Your Creativity',
                subtitle:
                    'Ignite your creative spark and let your imagination run wild with our vast collection of inspiring content, designed to fuel your artistic passions. 🎨',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Elevate Your Taste Buds',
                subtitle:
                    'Indulge in a delectable culinary journey that tantalizes your palate, as we guide you through a world of flavors and culinary adventures. 🍰',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: 'Master Your Fitness Journey',
                subtitle:
                    'Take control of your health and wellness goals with our expert guidance, tailored workouts, and nutrition tips to help you achieve the best version of yourself. 🏸',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Unlock Adventure Awaits',
                subtitle:
                    'Embark on thrilling adventures and create unforgettable moments as we guide you through an exciting world of experiences, from adrenaline-pumping escapades to serene getaways. 🏔',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Stay Informed and Inspired',
                subtitle:
                    'Get the latest news, insights, and motivation from our team of experts and thought leaders. Stay informed, stay inspired, and stay ahead of the curve. 🗞',
              ),
            ],
          ),
/*
          // HomePricing Section: Pricing Plans
          HomePricing(
            id: item.id,
            title: 'Choose the Perfect Plan',
            subtitle:
                'Explore the benefits and features of each plan to make the right choice for your business.',
            plans: const [
              // HomePricingModel items representing pricing plans
              HomePricingModel(
                title: 'Basic Plan',
                price: 0,
                benefits:
                    "Affordable pricing for individuals and small businesses.\nEssential features to get started quickly.\n24/7 customer support for any assistance you need.",
                type: HomePricingType.forever,
              ),
              HomePricingModel(
                title: 'Pro Plan',
                price: 15,
                benefits:
                    "Ideal for growing businesses looking for advanced features.\nEnhanced performance and scalability.\nPriority support and access to premium resources.",
                type: HomePricingType.month,
              ),
              HomePricingModel(
                title: 'Premium Plan',
                price: 120,
                benefits:
                    "Experience the ultimate package with exclusive features.\nAdvanced tools and customizations for your business.\nDedicated account manager for personalized assistance.",
                type: HomePricingType.year,
              ),
            ],
          ),

          // HomeFAQ Section: Frequently Asked Questions
          HomeFAQ(
            id: item.id,
            title: 'Frequently Asked Questions',
            subtitle: 'Answers to Common Inquiries Regarding Payment Options',
            cards: const [
              // CardModel items representing frequently asked questions
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: "Find the Right Jobs for You",
                subtitle:
                    'Find the best jobs for you, sorted by role preferences, pay, location, and your qualifications.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Bypass Resume Filters',
                subtitle:
                    'Get automatic adjustments to your resume based on the job you apply to, ensuring you get past any key word filters.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Automatically Apply to Jobs',
                subtitle:
                    'Simply give us your application materials and we will apply to jobs for you, filling out annoying forms along the way and customizing question responses based on your cover letter and resume.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: 'Get Acceptance Odds',
                subtitle:
                    'Get the odds of you being accepted to the roles you apply to based on a review of your application, other applicants, and company information.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Passively Search for Jobs',
                subtitle:
                    'Scared of getting fired in an uncertain economy or constantly searching for the next best thing? We automatically search for the best roles for you and give you odds of getting in, so you have all the info you need before you apply.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Stay Informed and Inspired',
                subtitle:
                    'Get the latest news, insights, and motivation from our team of experts and thought leaders. Stay informed, stay inspired, and stay ahead of the curve.',
              ),
            ],
          ),*/
        ][index]);
  }
}
