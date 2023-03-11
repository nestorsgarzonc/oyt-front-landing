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
                    '¿Qué es On Your Table?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'On Your Table es una plataforma que te digitalizar tu restaurante, mejorar la atención de tu restaurante y mejorar la experiencia gastronomica de tus comensales.',
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
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'Por medio de codigos QR o links inteligentes tus comensales pueden acceder a tu menu digital personalizable, ordenar, pagar sus cuentas, interactuar con la mesa y tus meseros en tiempo real.',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'Lo mejor: tus comensales no tienen que descargar alguna aplicación todo desde una pagina web que hacemos por ti.',
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
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'Con la aplicación de mesero mejoras la atención de tu restaurante ya que tus meseros saben que mesa necesita su ayuda, pueden ver las ordenes de tus comensales, ver el estado de las mesas, ordenar por tus comensales, ver la cola de ordenes listas para llevar a la mesa de tu comensal y todo en tiempo real.',
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
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'Con la aplicación de administrador podras administrar tu restaurante, generar codigos QR, administrar tus mesas, modificar tu menu, ver metricas y datos de tu restaurante en tiempo real.',
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
                  Text(
                    'Uniendote a la lista de espera tendras un año gratuito y luego un 20% de descuento de por vida!',
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
                        child: Text('Unirme'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Recibirás un correo electrónico para unirte a On Your Table lo mas pronto posible.',
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
    final _sectionPadding = EdgeInsets.symmetric(
      vertical: 20,
      horizontal: MediaQuery.of(context).size.width * 0.05 + 10,
    );
    return Container(
      width: double.infinity,
      padding: _sectionPadding,
      margin: _sectionMargin,
      decoration: BoxDecoration(color: withBackground ? _sectionColor : null),
      child: child,
    );
  }
}

class IntroSection extends StatelessWidget {
  const IntroSection({required this.containerSize, super.key, required this.onJoin});

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
                    Row(
                      children: [
                        Icon(Icons.restaurant, color: Colors.deepOrange),
                        const SizedBox(width: 10),
                        Text(
                          'On Your Table',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Tu restaurante',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        pause: const Duration(seconds: 2),
                        animatedTexts: [TyperAnimatedText('al siguiente nivel...')],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Text(
                        '!Digitaliza tu restaurante con nuestra suite de aplicaciones!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(onPressed: onJoin, child: Text('Unirme')),
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
