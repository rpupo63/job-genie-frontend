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
            title: "Automatically apply and get statistics about your journey.",
            subtitle:
                "Give us one Resume and Cover Letter and we'll do all the work for finding you a job.",
          ),

          // HomeFeatures Section: Key Features
          HomeFeatures(
            id: item.id,
            title: 'Apply everywhere, once.',
            subtitle:
                'See how Job-Genie can save you time and increase your odds of getting your dream job.',
            cards: const [
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: "Bypass the Filters",
                subtitle:
                    'Hate keyword filters? We automatically adjust your resume to bypass likely filters by adjusting simple keywords, ensuring a real human sees your application.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Skip the Repetition',
                subtitle:
                    "Sick of reading vague company descriptions to answer repetitive questions? We automatically adjust your cover letter and subsidiary questions to match online sentiment about a company.",
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Get Informed',
                subtitle:
                    'Scared of interviews? We send you information about what a company says about itself and what people are saying about that company.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_faq.svg',
                title: 'See How You Are Doing',
                subtitle:
                    'Want to see if it is just you getting rejected? See how your application is doing relative to other people with similar experience applying for the same roles and your likelihood of getting future jobs.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_features.svg',
                title: 'Pay Us When You Get Paid',
                subtitle:
                    'Trying to avoid monthly costs? We only get paid when you accept an offer, making us incentivized to get you the best job possible.',
              ),
              CardModel(
                source: 'assets/image/icon_inactive_pricing.svg',
                title: 'Apply Passively',
                subtitle:
                    'Constantly looking for greener pastures? We automatically search for the best roles matching your criteria.',
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
