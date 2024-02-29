part of '../home.dart';

class HomeStarter extends StatefulWidget {
  final String id, title, subtitle;

  const HomeStarter({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _HomeStarterState createState() => _HomeStarterState();
}

class _HomeStarterState extends State<HomeStarter> {
  late TextEditingController emailController;

  Future<void> recordEmail(String userEmail) async {
    final response = await http.post(BaseAPI().waitlistPath,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": userEmail}));

    if (response.statusCode == 200) {
      // Handle success (e.g., show a success message)
      print("Nice-u");
    } else {
      // Handle error (e.g., show an error message)
      print("Buttcheeks");
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height - (context.isDesktop ? 0.0 : kToolbarHeight),
      constraints: const BoxConstraints(minHeight: 600.0),
      child: Builder(
        builder: (context) {
          if (context.isDesktop) {
            // For desktop layout
            return Padding(
              padding: const EdgeInsets.all(Constants.spacing),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Animate(
                      effects: const [
                        SlideEffect(
                          begin: Offset(0.0, 0.25),
                          end: Offset.zero,
                          delay: Constants.duration,
                          duration: Duration(milliseconds: 750),
                        ),
                        FadeEffect(
                          delay: Constants.duration,
                          duration: Duration(milliseconds: 750),
                        ),
                      ],
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: introduction(
                          context,
                          title: widget.title,
                          subtitle: widget.subtitle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Constants.spacing),
                  Expanded(
                    child: thumbnail(),
                  ),
                ],
              ),
            );
          } else {
            // For mobile and tablet layout
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                thumbnail(),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        context.color.primary,
                        context.color.primary,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(Constants.spacing),
                  child: Animate(
                    effects: const [
                      SlideEffect(
                        begin: Offset(0.0, 0.25),
                        end: Offset.zero,
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      ),
                      FadeEffect(
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      ),
                    ],
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: introduction(
                        context,
                        title: widget.title,
                        subtitle: widget.subtitle,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> introduction(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return [
      MergeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the title
            Seo.text(
              text: title,
              style: TextTagStyle.h2,
              child: Text(
                title,
                semanticsLabel: title,
                style: context.text.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            // Display the subtitle
            Seo.text(
              text: subtitle,
              style: TextTagStyle.p,
              child: Text(
                '\n$subtitle',
                semanticsLabel: subtitle,
                style: context.text.bodySmall,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(Constants.spacing),
        child: Wrap(
          runSpacing: Constants.spacing * 0.5,
          spacing: Constants.spacing * 0.5,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            // Display email input area
            Semantics(
              label: 'Enter Your Email Address to Join the Waitlist',
              textField: true,
              child: ExcludeSemantics(
                excluding: true,
                child: DTextArea(
                  controller: emailController, // Use the controller here
                  isDense: false,
                  textAlign: TextAlign.start,
                  cursorColor: context.color.background,
                  borderRadius: BorderRadius.circular(Constants.spacing * 0.5),
                  borderSideIdle: BorderSide.none,
                  backgroundColor: context.color.onBackground.withOpacity(0.5),
                  hintText: 'Enter Your Email Address',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Constants.spacing,
                  ),
                  textStyle: context.text.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.color.surface,
                  ),
                  hintStyle: context.text.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.color.surface.withOpacity(0.5),
                  ),
                  borderSideActive: BorderSide(
                    color: context.color.background.withOpacity(0.75),
                  ),
                  placeholder: DButton.text(
                      text: 'Enter Your Email Address | Join Waitlist',
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.spacing,
                        vertical: Constants.spacing * 0.75,
                      ),
                      style: context.text.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                      onTap: () {}),
                  // Display "Join Waitlist" button
                  suffixIcon: DButton.text(
                    onTap: () => recordEmail(emailController.toString()),
                    text: 'Join Waitlist',
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.spacing,
                      vertical: Constants.spacing * 0.7,
                    ),
                    style: context.text.bodyMedium?.copyWith(
                      color: context.color.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    borderRadius:
                        BorderRadius.circular(Constants.spacing * 0.25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  static Widget thumbnail() {
    return Animate(
      effects: const [
        // Slide in animation effect
        SlideEffect(
          begin: Offset(0.0, -0.25),
          end: Offset.zero,
          delay: Constants.duration,
          duration: Duration(milliseconds: 750),
        ),

        // Fade in animation effect
        FadeEffect(
          delay: Constants.duration,
          duration: Duration(milliseconds: 750),
        ),
      ],
      child: Transform(
        transform: Matrix4.identity()
          //..rotateZ(3.14 * 0.15)
          ..scale(1.25),
        alignment: Alignment.center,
        child: Semantics(
          label: 'Flutter Landing Page Thumbnail',
          image: true,
          child: Seo.image(
              alt: 'Flutter Landing Page Thumbnail',
              src: '/assets/assets/image/thumbnail.png',
              child: const DImage(source: 'assets/image/thumbnail.png')),
        ),
      ),
    );
  }
}
