@implementation VUIVisualEffectLabel

- (VUIVisualEffectLabel)initWithFrame:(CGRect)a3
{
  VUIVisualEffectLabel *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUIVisualEffectLabel;
  v3 = -[VUIVisualEffectLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__VUIVisualEffectLabel_initWithFrame___block_invoke;
    v7[3] = &unk_1E9F99F98;
    objc_copyWeak(&v8, &location);
    -[VUIVisualEffectLabel vui_registerForTraitChanges:withHandler:](v3, "vui_registerForTraitChanges:withHandler:", v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__VUIVisualEffectLabel_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

+ (id)labelWithType:(unint64_t)a3 label:(id)a4 traitCollection:(id)a5 existingVisualEffectLabel:(id)a6
{
  id v8;
  id v9;
  VUIVisualEffectLabel *v10;
  VUIVisualEffectLabel *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a6;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (VUIVisualEffectLabel *)v8;
  else
    v10 = objc_alloc_init(VUIVisualEffectLabel);
  v11 = v10;
  -[VUIVisualEffectLabel visualEffectView](v10, "visualEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
  v15 = v14;

  -[VUIVisualEffectLabel setVisualEffectLabelType:](v11, "setVisualEffectLabelType:", a3);
  -[VUIVisualEffectLabel setVisualEffectView:](v11, "setVisualEffectView:", v15);
  -[VUIVisualEffectLabel setLabel:](v11, "setLabel:", v9);

  return v11;
}

- (void)setLabel:(id)a3
{
  VUILabel *v4;
  VUILabel *label;
  VUILabel *v6;
  VUILabel *v7;
  VUILabel *v8;
  VUILabel *v9;

  v4 = (VUILabel *)a3;
  label = self->_label;
  if (label != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_label;
    self->_label = v6;
    v8 = label;

    -[VUIVisualEffectLabel _updateContentWithNewLabel:oldLabel:](self, "_updateContentWithNewLabel:oldLabel:", self->_label, v8);
    v4 = v9;
  }

}

- (void)setVisualEffectView:(id)a3
{
  UIVisualEffectView *v5;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v7;

  v5 = (UIVisualEffectView *)a3;
  visualEffectView = self->_visualEffectView;
  if (visualEffectView != v5)
  {
    v7 = v5;
    -[UIVisualEffectView removeFromSuperview](visualEffectView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_visualEffectView, a3);
    if (v7)
      -[VUIVisualEffectLabel addSubview:](self, "addSubview:", v7);
    -[VUIVisualEffectLabel setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIVisualEffectView *visualEffectView;
  VUILabel *label;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIVisualEffectLabel;
  -[VUIVisualEffectLabel layoutSubviews](&v5, sel_layoutSubviews);
  -[VUIVisualEffectLabel _configureVisualEffectForTraitCollection](self, "_configureVisualEffectForTraitCollection");
  visualEffectView = self->_visualEffectView;
  -[VUIVisualEffectLabel bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](visualEffectView, "setFrame:");
  label = self->_label;
  -[VUIVisualEffectLabel bounds](self, "bounds");
  -[VUILabel setFrame:](label, "setFrame:");
}

- (void)setDisableClippingOnTallScripts:(BOOL)a3
{
  void *v5;

  if (a3 && CTFontHasExuberatedLineHeight())
  {
    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 0);

  }
  self->_disableClippingOnTallScripts = a3;
}

- (void)_updateContentWithNewLabel:(id)a3 oldLabel:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a4, "removeFromSuperview");
  if (v7)
  {
    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

  }
  -[VUIVisualEffectLabel setNeedsLayout](self, "setNeedsLayout");

}

- (double)vuiBaselineHeight
{
  double result;

  -[VUILabel vuiBaselineHeight](self->_label, "vuiBaselineHeight");
  return result;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  double result;

  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_label, "topMarginToLabel:withBaselineMargin:", a3, a4);
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  double result;

  -[VUILabel vui_baselineOffsetFromBottom](self->_label, "vui_baselineOffsetFromBottom");
  return result;
}

+ (int64_t)_backdropStyleForVisualEffectType:(unint64_t)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  v6 = v5;
  if (a3 == 2)
  {
    if (objc_msgSend(v5, "userInterfaceStyle") == 1)
      v7 = 4015;
    else
      v7 = 4014;
  }
  else if (a3 == 1)
  {
    if (objc_msgSend(v5, "userInterfaceStyle") == 1)
      v7 = 4002;
    else
      v7 = 4007;
  }
  else
  {
    v7 = 0x8000000000000000;
  }

  return v7;
}

- (void)_configureVisualEffectForTraitCollection
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[VUIVisualEffectLabel visualEffectView](self, "visualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    v5 = -[VUIVisualEffectLabel visualEffectLabelType](self, "visualEffectLabelType");
    -[VUIVisualEffectLabel traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_backdropStyleForVisualEffectType:traitCollection:", v5, v6);

    if (v7 != -[VUIVisualEffectLabel blurEffectStyle](self, "blurEffectStyle"))
    {
      -[VUIVisualEffectLabel setBlurEffectStyle:](self, "setBlurEffectStyle:", v7);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (-[VUIVisualEffectLabel visualEffectLabelType](self, "visualEffectLabelType") == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:", v11);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v11;
      }
      v9 = v8;
      -[VUIVisualEffectLabel visualEffectView](self, "visualEffectView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEffect:", v9);

    }
  }
}

- (VUILabel)label
{
  return self->_label;
}

- (BOOL)disableClippingOnTallScripts
{
  return self->_disableClippingOnTallScripts;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (unint64_t)visualEffectLabelType
{
  return self->_visualEffectLabelType;
}

- (void)setVisualEffectLabelType:(unint64_t)a3
{
  self->_visualEffectLabelType = a3;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
