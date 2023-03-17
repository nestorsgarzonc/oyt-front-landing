import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:oyt_front_widgets/widgets/custom_text_field.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();
  double _containerSize = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _containerSize = 400;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            IntroSection(
              containerSize: _containerSize,
              onJoin: () => _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              ),
            ),
            SectionWidget(
              withBackground: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¿Qué es Waitty?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Waitty es una plataforma que te permite digitalizar tu restaurante, mejorar la atención y la experiencia gastronomica de tus comensales.',
                  ),
                ],
              ),
            ),
            SectionWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crea tu menu digital',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'Por medio de codigos QR o links inteligentes tus comensales pueden acceder a tu menu digital personalizable, ordenar, pagar sus cuentas, interactuar con la mesa y tus meseros en tiempo real.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Lo mejor: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'tus comensales no tienen que descargar alguna aplicación, solo tienen que ingresar a la pagina web que hacemos por ti! 😃',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/dinner.png', height: 280)
                ],
              ),
            ),
            SectionWidget(
              withBackground: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/weaiter.png', height: 280),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mejora la atención de tu restaurante',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'Con la aplicación de mesero mejoras la atención de tu restaurante ya que indicamos que mesa necesita ayuda, pueden ver las ordenes de tus comensales, ver el estado de las mesas, ver la cola de ordenes listas para llevar a la mesa, ordenar por tus comensales y todo en tiempo real.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SectionWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Administra tu restaurante desde cualquier lugar',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'Con la aplicación de administrador podras administrar tu restaurante, generar codigos QR, manejar tus mesas, modificar tu menu, ver datos de tu restaurante en tiempo real.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Flexible(child: Image.asset('assets/admin.png', height: 280))
                ],
              ),
            ),
            SectionWidget(
              withBackground: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unirme a la lista de espera',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Uniendote a la lista de espera podras tener un año gratuito y luego un 20% de descuento de por vida!',
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: CustomTextField(
                          controller: _textController,
                          label: 'Correo electrónico',
                        ),
                      ),
                      const SizedBox(width: 10),
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Unirme'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Recibirás un correo electrónico para unirte a Waitty lo mas pronto posible.',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  SectionWidget({super.key, required this.child, this.withBackground = true});

  final _sectionColor = Colors.deepOrange.withOpacity(0.1);
  final _sectionMargin = const EdgeInsets.symmetric(vertical: 15);
  final Widget child;
  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    final sectionPadding = EdgeInsets.symmetric(
      vertical: 20,
      horizontal: MediaQuery.of(context).size.width * 0.05 + 10,
    );
    return Container(
      width: double.infinity,
      padding: sectionPadding,
      margin: _sectionMargin,
      decoration: BoxDecoration(color: withBackground ? _sectionColor : null),
      child: child,
    );
  }
}

class IntroSection extends StatelessWidget {
  const IntroSection({
    required this.containerSize,
    super.key,
    required this.onJoin,
  });

  final double containerSize;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -200,
            child: Transform.rotate(
              angle: 0.5,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutCubic,
                height: containerSize,
                width: containerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Theme.of(context).primaryColor, Colors.deepOrange],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: MediaQuery.of(context).size.width * 0.05 + 10,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/logo.png', height: 90),
                    ),
                    const Spacer(),
                    Text(
                      'Tu restaurante',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    DefaultTextStyle(
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        pause: const Duration(seconds: 2),
                        animatedTexts: [
                          TyperAnimatedText('al siguiente nivel...')
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Text(
                        '!Digitaliza tu restaurante con nuestra suite de aplicaciones!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: onJoin,
                      child: const Text('Unirme'),
                    ),
                    const Spacer(),
                  ],
                ),
                Flexible(child: Image.asset('assets/dinner.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
