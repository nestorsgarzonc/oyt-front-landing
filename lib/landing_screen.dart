import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

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
                    'Waitty es una plataforma que te permite digitalizar tu restaurante, mejorar la atención y la experiencia gastronómica de tus comensales.',
                  ),
                ],
              ),
            ),
            SectionWidget(
              child: ResponsiveFlex(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crea tu menú digital',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'Por medio de códigos QR o links inteligentes tus comensales pueden acceder a tu menú digital personalizable, ordenar, pagar sus cuentas e interactuar con la mesa y tus meseros en tiempo real.',
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
                                    'tus comensales no tienen que descargar ninguna aplicación ¡Solo tienen que ingresar a la página web que hacemos por ti! 😃',
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
              child: ResponsiveFlex(
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
                          'Con la aplicación de mesero mejoras la atención de tu restaurante, ya que indicamos cuál mesa necesita ayuda, mostramos las órdenes de tus comensales, el estado de las mesas, la cola de órdenes listas para llevar a la mesa y agregar productos que se les hayan olvidado a tus clientes ¡Y todo esto en tiempo real!',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SectionWidget(
              child: ResponsiveFlex(
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
                          'Con la aplicación de administrador podrás administrar tu restaurante, generar códigos QR, manejar tus mesas, modificar tu menú y ver datos de tu restaurante en tiempo real.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/admin.png',
                    width: 280,
                  )
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
                    '¡Uniéndote a esta lista podrás tener un año gratuito y luego un 20% de descuento de por vida!',
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  ResponsiveFlex(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      SizedBox(
                        width: 500,
                        child: CustomTextField(
                          controller: _textController,
                          label: 'Correo electrónico',
                          onFieldSubmitted: (_) => _onJoin(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(width: 10, height: 10),
                      FilledButton(
                        onPressed: _onJoin,
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

  Future<void> _onJoin() async {
    try {
      if (_textController.text.isEmpty) {
        return;
      }
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      final email = _textController.text;
      _textController.clear();
      const endpoint = 'https://oyt-backend.herokuapp.com/api/client';
      final body = jsonEncode({'email': email});
      final headers = {
        'Content-Type': 'application/json',
      };
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: body,
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Error al unirse a la lista de espera');
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Te has unido a la lista de espera!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      Navigator.of(context).pop();
    }
  }
}

class ResponsiveFlex extends StatelessWidget {
  const ResponsiveFlex({
    super.key,
    required this.children,
    this.verticalDirection,
  });

  final List<Widget> children;
  final VerticalDirection? verticalDirection;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      verticalDirection: verticalDirection ??
          (isMobile ? VerticalDirection.up : VerticalDirection.down),
      children: children
          .expand(
            (e) => [e, const SizedBox(width: 10, height: 10)],
          )
          .toList(),
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
                        '¡Digitaliza tu restaurante con nuestra suite de aplicaciones!',
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
                if (MediaQuery.of(context).size.width > 650)
                  Flexible(child: Image.asset('assets/dinner.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    this.autofocus = false,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.validator,
    this.decoration,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.hintText,
    super.key,
    this.prefixIcon,
    this.contentPadding,
    this.onChanged,
    this.enabled = true,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final int maxLines;
  final int? minLines;
  final String label;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            prefixIcon: prefixIcon,
            hintText: hintText,
            contentPadding: contentPadding,
          ),
    );
  }
}
