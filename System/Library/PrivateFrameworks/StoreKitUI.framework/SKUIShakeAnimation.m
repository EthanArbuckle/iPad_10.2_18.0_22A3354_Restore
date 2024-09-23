@implementation SKUIShakeAnimation

- (SKUIShakeAnimation)initWithOptions:(id)a3
{
  id v4;
  SKUIShakeAnimation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShakeAnimation initWithOptions:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIShakeAnimation;
  v5 = -[SKUIShakeAnimation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", 0x1E73B3530);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_shouldErase = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v4, "objectForKey:", 0x1E73B3550);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v7, "BOOLValue");
    else
      v8 = 1;
    v5->_shouldVibrate = v8;

  }
  return v5;
}

- (void)animatePINInputControl:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = v4;
  v6 = v4;
  if (self->_shouldErase)
  {
    objc_msgSend(v4, "setText:", 0);
    v5 = v6;
  }
  -[SKUIShakeAnimation animateView:](self, "animateView:", v5);

}

- (void)animateView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void (*v26)(uint64_t);
  id v27;

  objc_msgSend(a3, "layer");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAllAnimations");
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 1.20000005);
  objc_msgSend(v4, "setStiffness:", 1200.0);
  objc_msgSend(v4, "setDamping:", 12.0);
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v9);

  objc_msgSend(v4, "setDuration:", 0.860000014);
  objc_msgSend(v4, "setVelocity:", 0.0);
  v10 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v27, "position");
  v13 = v12 + 60.0;
  *(float *)&v13 = v13;
  objc_msgSend(v11, "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v14);

  objc_msgSend(v27, "addAnimation:forKey:", v4, CFSTR("position"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1036831949;
  LODWORD(v17) = 0.25;
  LODWORD(v18) = 0.25;
  LODWORD(v19) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v17, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v20);

  objc_msgSend(v15, "setDuration:", 0.0700000003);
  objc_msgSend(v15, "setFillMode:", v10);
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v27, "position");
  v23 = v22 + -60.0;
  *(float *)&v23 = v23;
  objc_msgSend(v21, "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v24);

  objc_msgSend(v27, "addAnimation:forKey:", v15, CFSTR("force"));
  if (self->_shouldVibrate)
  {
    v25 = (void *)SKUIAudioToolboxFramework();
    v26 = (void (*)(uint64_t))SKUIWeakLinkedSymbolForString("AudioServicesPlaySystemSound", v25);
    if (v26)
      v26(4095);
  }

}

- (void)initWithOptions:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShakeAnimation initWithOptions:]";
}

@end
