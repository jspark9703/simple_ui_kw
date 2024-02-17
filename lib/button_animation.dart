import 'dart:async';
import 'package:flutter/material.dart';

class AnimationButton extends StatefulWidget {
  final IconData iconTarget;
  final Color? targetColor;
  final double? targetSize;
  final VoidCallback onChanged;
  final IconData icon;
  final Color? iconColor;
  final double? size;
  final Duration? duration;
  final Curve curve;
  final double iconSize;

  const AnimationButton({super.key, 
    required this.iconTarget,
    this.targetColor = Colors.black,
    this.targetSize = 70,
    required this.onChanged,
    this.icon = Icons.favorite,
    this.iconColor = const Color(0xFFF5F5F5),
    this.size = 70,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.iconSize = 120,
  });

  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconSizeAnimation;
  late Animation _curve;
  bool _isTapped = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _curve = CurvedAnimation(parent: _animationController, curve: widget.curve);
    _iconSizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          weight: widget.iconSize,
          tween: Tween<double>(
            begin: widget.iconSize - 20,
            end: widget.iconSize,
          ),
        ),
        TweenSequenceItem(
          weight: widget.iconSize,
          tween: Tween<double>(
            begin: widget.iconSize,
            end: widget.iconSize - 20,
          ),
        ),
      ],
    ).animate(_curve as Animation<double>);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => GestureDetector(
        onTap: () => onAct(),
        child: buttonBody(context),
      ),
    );
  }

  // ignore: sized_box_for_whitespace
  Container buttonBody(BuildContext context) => Container(
        height: widget.size,
        width: widget.size,
        child: Stack(
          children: <Widget>[
            Center(
                child: Icon(widget.iconTarget,
                    size: widget.targetSize, color: widget.targetColor)),
            Center(child: buildAnimatedIcon()),
          ],
        ),
      );

  AnimatedOpacity buildAnimatedIcon() => AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _isTapped ? 1 : 0,
        child: Icon(widget.icon,
            size: _iconSizeAnimation.value, color: widget.iconColor),
      );

  void onAct() {
    setState(() => _isTapped = true);
    Timer(
      const Duration(milliseconds: 80),
      () => _animationController.forward(),
    );
    widget.onChanged();
    Timer(const Duration(seconds: 1), () {
      setState(() => _isTapped = false);
      _animationController.reverse();
    });
  }
}
