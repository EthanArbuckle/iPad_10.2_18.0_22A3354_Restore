@implementation _UISpringLoadedBlinkingEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkLayer, 0);
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  void *v5;
  void *v6;
  void *blinkLayer;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[_UISpringLoadedBlinkingEffect blinkLayer](self, "blinkLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    switch(objc_msgSend(v10, "state"))
    {
      case 0:
      case 3:
        goto LABEL_3;
      case 1:
        -[_UISpringLoadedBlinkingEffect _prepareLayer:forView:](self, "_prepareLayer:forView:", v5, v6);
        objc_msgSend(v6, "layer");
        blinkLayer = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(blinkLayer, "addSublayer:", v5);
        goto LABEL_4;
      case 2:
        objc_msgSend(v5, "superlayer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          -[_UISpringLoadedBlinkingEffect _prepareLayer:forView:](self, "_prepareLayer:forView:", v5, v6);
          objc_msgSend(v6, "layer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addSublayer:", v5);

        }
        -[_UISpringLoadedBlinkingEffect blinkAnimation](self, "blinkAnimation");
        blinkLayer = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAnimation:forKey:", blinkLayer, CFSTR("blinkingAnimation"));
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
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(v16, "cornerCurve");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", v15);

  objc_msgSend(v16, "cornerRadius");
  objc_msgSend(v6, "setCornerRadius:");

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
    v4 = (CALayer *)objc_opt_new();
    v5 = self->_blinkLayer;
    self->_blinkLayer = v4;

    +[UIColor blackColor](UIColor, "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
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

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", &unk_1E1A956F0);
  objc_msgSend(v2, "setDuration:", 0.1);
  objc_msgSend(v2, "setAutoreverses:", 1);
  LODWORD(v3) = 2.0;
  objc_msgSend(v2, "setRepeatCount:", v3);
  return v2;
}

- (void)setBlinkLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blinkLayer, a3);
}

@end
