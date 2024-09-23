@implementation TargetedSpringLoadedBlinkEffect

- (TargetedSpringLoadedBlinkEffect)initWithTargetView:(id)a3
{
  id v4;
  TargetedSpringLoadedBlinkEffect *v5;
  TargetedSpringLoadedBlinkEffect *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TargetedSpringLoadedBlinkEffect;
  v5 = -[TargetedSpringLoadedBlinkEffect init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_targetView, v4);

  return v6;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  void *v5;
  void *v6;
  CALayer *blinkLayer;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TargetedSpringLoadedBlinkEffect blinkLayer](self, "blinkLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TargetedSpringLoadedBlinkEffect targetView](self, "targetView"));
  if (v6)
  {
    switch((unint64_t)objc_msgSend(v10, "state"))
    {
      case 0uLL:
      case 3uLL:
        goto LABEL_3;
      case 1uLL:
        -[TargetedSpringLoadedBlinkEffect _prepareLayer:forView:](self, "_prepareLayer:forView:", v5, v6);
        blinkLayer = (CALayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
        -[CALayer addSublayer:](blinkLayer, "addSublayer:", v5);
        goto LABEL_4;
      case 2uLL:
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superlayer"));

        if (!v8)
        {
          -[TargetedSpringLoadedBlinkEffect _prepareLayer:forView:](self, "_prepareLayer:forView:", v5, v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
          objc_msgSend(v9, "addSublayer:", v5);

        }
        blinkLayer = (CALayer *)objc_claimAutoreleasedReturnValue(-[TargetedSpringLoadedBlinkEffect blinkAnimation](self, "blinkAnimation"));
        objc_msgSend(v5, "addAnimation:forKey:", blinkLayer, CFSTR("targetedBlinkAnimation"));
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    objc_msgSend(v5, "removeFromSuperlayer");
    blinkLayer = self->_blinkLayer;
    self->_blinkLayer = 0;
LABEL_4:

  }
}

- (void)_prepareLayer:(id)a3 forView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v8, "setFrame:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cornerCurve"));
  objc_msgSend(v8, "setCornerCurve:", v7);

  objc_msgSend(v6, "cornerRadius");
  objc_msgSend(v8, "setCornerRadius:");

}

- (CALayer)blinkLayer
{
  CALayer *blinkLayer;
  CALayer *v4;
  CALayer *v5;
  id v6;
  double v7;

  blinkLayer = self->_blinkLayer;
  if (!blinkLayer)
  {
    v4 = objc_opt_new(CALayer);
    v5 = self->_blinkLayer;
    self->_blinkLayer = v4;

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CALayer setBackgroundColor:](self->_blinkLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

    LODWORD(v7) = 1045220557;
    -[CALayer setOpacity:](self->_blinkLayer, "setOpacity:", v7);
    blinkLayer = self->_blinkLayer;
  }
  return blinkLayer;
}

- (id)blinkAnimation
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v2, "setToValue:", &off_100542430);
  objc_msgSend(v2, "setDuration:", 0.1);
  objc_msgSend(v2, "setAutoreverses:", 1);
  LODWORD(v3) = 2.0;
  objc_msgSend(v2, "setRepeatCount:", v3);
  return v2;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (void)setBlinkLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blinkLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkLayer, 0);
  objc_destroyWeak((id *)&self->_targetView);
}

@end
