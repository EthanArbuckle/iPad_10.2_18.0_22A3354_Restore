@implementation SBFSpringLoadedInteractionEffect

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFSpringLoadedInteractionEffect)init
{
  SBFSpringLoadedInteractionEffect *v2;
  SBFSpringLoadedInteractionEffect *v3;
  uint64_t v4;
  UISpringLoadedInteractionEffect *blinkEffect;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFSpringLoadedInteractionEffect;
  v2 = -[SBFSpringLoadedInteractionEffect init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_useFastBlinkAnimation = 0;
    objc_msgSend(MEMORY[0x1E0CEA9D0], "_blinkEffect");
    v4 = objc_claimAutoreleasedReturnValue();
    blinkEffect = v3->_blinkEffect;
    v3->_blinkEffect = (UISpringLoadedInteractionEffect *)v4;

  }
  return v3;
}

- (void)setUseFastBlinkAnimation:(BOOL)a3
{
  UISpringLoadedInteractionEffect *blinkEffect;
  UISpringLoadedInteractionEffect *v5;

  self->_useFastBlinkAnimation = a3;
  if (a3)
  {
    blinkEffect = self->_blinkEffect;
    self->_blinkEffect = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA9D0], "_blinkEffect");
    v5 = (UISpringLoadedInteractionEffect *)objc_claimAutoreleasedReturnValue();
    blinkEffect = self->_blinkEffect;
    self->_blinkEffect = v5;
  }

}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v6, "targetItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "targetItem");
  else
    objc_msgSend(v14, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFSpringLoadedInteractionEffect delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetViewForSpringLoadingEffectForView:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetView:", v10);
  if (-[SBFSpringLoadedInteractionEffect useFastBlinkAnimation](self, "useFastBlinkAnimation"))
  {
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "state");
    switch(v12)
    {
      case 3:
        goto LABEL_8;
      case 2:
        -[SBFSpringLoadedInteractionEffect fastBlinkAnimation](self, "fastBlinkAnimation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAnimation:forKey:", v13, CFSTR("fastBlinkingAnimation"));

        break;
      case 0:
LABEL_8:
        objc_msgSend(v11, "removeAnimationForKey:", CFSTR("fastBlinkingAnimation"));
        break;
    }

    goto LABEL_12;
  }
  -[UISpringLoadedInteractionEffect interaction:didChangeWithContext:](self->_blinkEffect, "interaction:didChangeWithContext:", v14, v6);
LABEL_12:

}

- (id)fastBlinkAnimation
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", &unk_1E203B528);
  objc_msgSend(v2, "setDuration:", 0.1);
  objc_msgSend(v2, "setAutoreverses:", 1);
  LODWORD(v3) = 2.0;
  objc_msgSend(v2, "setRepeatCount:", v3);
  return v2;
}

- (BOOL)useFastBlinkAnimation
{
  return self->_useFastBlinkAnimation;
}

- (SBFSpringLoadedInteractionEffectDelegate)delegate
{
  return (SBFSpringLoadedInteractionEffectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end
