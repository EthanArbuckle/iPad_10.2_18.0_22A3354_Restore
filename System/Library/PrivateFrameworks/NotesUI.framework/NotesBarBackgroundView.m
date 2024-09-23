@implementation NotesBarBackgroundView

- (NotesBarBackgroundView)initWithFrame:(CGRect)a3
{
  NotesBarBackgroundView *v3;
  NotesBarBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotesBarBackgroundView;
  v3 = -[NotesBarBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NotesBarBackgroundView commonInit](v3, "commonInit");
  return v4;
}

- (NotesBarBackgroundView)initWithCoder:(id)a3
{
  NotesBarBackgroundView *v3;
  NotesBarBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotesBarBackgroundView;
  v3 = -[NotesBarBackgroundView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[NotesBarBackgroundView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;

  -[NotesBarBackgroundView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[NotesBarBackgroundView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  -[NotesBarBackgroundView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[NotesBarBackgroundView registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  -[NotesBarBackgroundView updateColor](self, "updateColor");
}

- (void)setHasBlur:(BOOL)a3
{
  self->_hasBlur = a3;
  -[NotesBarBackgroundView updateColor](self, "updateColor");
}

- (void)updateColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (!-[NotesBarBackgroundView hasBlur](self, "hasBlur"))
  {
    if (-[NotesBarBackgroundView _overrideUserInterfaceStyle](self, "_overrideUserInterfaceStyle") == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      -[NotesBarBackgroundView color](self, "color");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView ic_appearanceInfo](self, "ic_appearanceInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBarAlpha");
    objc_msgSend(v22, "colorWithAlphaComponent:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesBarBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v20);

    -[NotesBarBackgroundView blurView](self, "blurView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotesBarBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[NotesBarBackgroundView blurView](self, "blurView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
    -[NotesBarBackgroundView setBlurView:](self, "setBlurView:", v6);

    -[NotesBarBackgroundView frame](self, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[NotesBarBackgroundView blurView](self, "blurView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    -[NotesBarBackgroundView blurView](self, "blurView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutoresizingMask:", 18);

  }
  -[NotesBarBackgroundView blurView](self, "blurView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[NotesBarBackgroundView blurView](self, "blurView");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[NotesBarBackgroundView addSubview:](self, "addSubview:");
LABEL_11:

  }
}

- (void)_setOverrideUserInterfaceStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NotesBarBackgroundView;
  -[NotesBarBackgroundView _setOverrideUserInterfaceStyle:](&v4, sel__setOverrideUserInterfaceStyle_, a3);
  -[NotesBarBackgroundView updateColor](self, "updateColor");
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[NotesBarBackgroundView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateColor);

}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)hasBlur
{
  return self->_hasBlur;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
