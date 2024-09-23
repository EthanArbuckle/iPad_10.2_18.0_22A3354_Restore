@implementation _UIAlertControllerModernTVActionBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIAlertControllerModernTVActionBackgroundView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerModernTVActionBackgroundView *v3;
  _UIAlertControllerModernTVActionBackgroundView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_UIAlertControllerModernTVActionBackgroundView;
  v3 = -[_UIAlertControllerTVBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIAlertControllerTVBackgroundView shadowView](v3, "shadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowExpansion:", 35.0);

    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 0, 1.0);
    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 1, 0.75);
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, sel__userInterfaceStyleChanged);

  }
  return v4;
}

- (void)_updateBackgroundColor
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[_UIAlertControllerTVBackgroundView isHighlighted](self, "isHighlighted");
  -[_UIAlertControllerTVBackgroundView backgroundView](self, "backgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v3
    && !-[_UIAlertControllerModernTVActionBackgroundView shouldUseTintColorAsHighlightColor](self, "shouldUseTintColorAsHighlightColor"))
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIView tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  double v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  uint64_t v21;
  BOOL v22;

  v3 = a3;
  if (-[_UIAlertControllerTVBackgroundView isHighlighted](self, "isHighlighted") != a3)
  {
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", -[_UIAlertControllerTVBackgroundView isHighlighted](self, "isHighlighted"), -[_UIAlertControllerTVBackgroundView isPressed](self, "isPressed"));
    v6 = v5;
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", v3, -[_UIAlertControllerTVBackgroundView isPressed](self, "isPressed"));
    v8 = v7;
    if (-[_UIAlertControllerModernTVActionBackgroundView shouldUseTintColorAsHighlightColor](self, "shouldUseTintColorAsHighlightColor"))
    {
      -[UIView tintColor](self, "tintColor");
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3)
    {
      v11 = v9;
    }
    else
    {
      -[UIView tintColor](self, "tintColor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke;
    aBlock[3] = &unk_1E16C07C8;
    aBlock[4] = self;
    v13 = v11;
    v20 = v13;
    v22 = v3;
    v21 = v8;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      if (v3)
        v15 = 0.1;
      else
        v15 = 0.2;
      -[_UIAlertControllerTVBackgroundView backgroundView](self, "backgroundView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", v6);

      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __65___UIAlertControllerModernTVActionBackgroundView_setHighlighted___block_invoke_2;
      v17[3] = &unk_1E16B1BF8;
      v18 = v14;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, v15);

    }
    else
    {
      v14[2](v14);
    }
    -[_UIAlertControllerTVBackgroundView setIsHighlighted:](self, "setIsHighlighted:", v3);

  }
}

- (void)updateCompositingForHighlighted:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a3 || !-[_UIAlertControllerModernTVActionBackgroundView vibrantCompositing:](self, "vibrantCompositing:", 0))
  {
    -[_UIAlertControllerTVBackgroundView backgroundView](self, "backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCompositingFilter:", 0);

    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupOpacity:", 1);

    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v13 = 1;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    v6 = v5 == 1000 || v5 == 2;
    v7 = (id *)MEMORY[0x1E0CD2EA0];
    if (!v6)
      v7 = (id *)MEMORY[0x1E0CD2E98];
    v8 = *v7;
    -[_UIAlertControllerTVBackgroundView backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v8);

    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v13 = 0;
  }
  objc_msgSend(v12, "setAllowsGroupBlending:", v13);

}

- (void)_userInterfaceStyleChanged
{
  -[_UIAlertControllerModernTVActionBackgroundView updateCompositingForHighlighted:](self, "updateCompositingForHighlighted:", -[_UIAlertControllerTVBackgroundView isHighlighted](self, "isHighlighted"));
}

- (void)setVibrantCompositing:(BOOL)a3 forState:(unint64_t)a4
{
  _BOOL8 v5;
  NSMutableDictionary *vibrancies;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;

  v5 = a3;
  vibrancies = self->_vibrancies;
  if (!vibrancies)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_vibrancies;
    self->_vibrancies = v8;

    vibrancies = self->_vibrancies;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](vibrancies, "setObject:forKey:", v10, v11);

  -[_UIAlertControllerModernTVActionBackgroundView updateCompositingForHighlighted:](self, "updateCompositingForHighlighted:", -[_UIAlertControllerTVBackgroundView isHighlighted](self, "isHighlighted"));
}

- (BOOL)vibrantCompositing:(unint64_t)a3
{
  NSMutableDictionary *vibrancies;
  void *v4;
  void *v5;
  char v6;

  vibrancies = self->_vibrancies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](vibrancies, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.2;
}

- (double)_shadowRadius
{
  return 11.0;
}

- (BOOL)shouldUseTintColorAsHighlightColor
{
  return self->_shouldUseTintColorAsHighlightColor;
}

- (void)setShouldUseTintColorAsHighlightColor:(BOOL)a3
{
  self->_shouldUseTintColorAsHighlightColor = a3;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancies, 0);
}

@end
