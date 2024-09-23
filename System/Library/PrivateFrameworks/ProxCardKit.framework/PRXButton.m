@implementation PRXButton

+ (PRXButton)buttonWithProximityType:(int64_t)a3
{
  return +[PRXButton buttonWithProximityType:usesLegacyStyling:](PRXButton, "buttonWithProximityType:usesLegacyStyling:", a3, 0);
}

+ (PRXButton)buttonWithProximityType:(int64_t)a3 usesLegacyStyling:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;
  objc_super v35;

  v4 = a4;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BDF76A0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.831373, 0.827451, 0.854902, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  switch(a3)
  {
    case 0:
      v34.receiver = a1;
      v34.super_class = (Class)&OBJC_METACLASS___PRXButton;
      objc_msgSendSuper2(&v34, sel_buttonWithType_, 1);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7880]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scaledFontForFont:compatibleWithTraitCollection:", v11, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      v33.receiver = a1;
      v33.super_class = (Class)&OBJC_METACLASS___PRXButton;
      objc_msgSendSuper2(&v33, sel_buttonWithType_, 0);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setContinuousCornerRadius:", 12.0);
      objc_msgSend(v9, "setBackgroundColor:", v8);
      objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7880]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scaledFontForFont:compatibleWithTraitCollection:", v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v15);

      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitleColor:forState:", v17, 0);

      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitleColor:forState:", v18, 2);

      objc_msgSend(v9, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 12.0);
      if (!v9)
        break;
      goto LABEL_15;
    case 2:
      v35.receiver = a1;
      v35.super_class = (Class)&OBJC_METACLASS___PRXButton;
      objc_msgSendSuper2(&v35, sel_buttonWithType_, 7);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UICloseButtonBackgroundCompact"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageWithTintColor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundImage:forState:", v21, 0);

      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 7, 1, 15.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);
      goto LABEL_14;
    case 3:
      v32.receiver = a1;
      v32.super_class = (Class)&OBJC_METACLASS___PRXButton;
      objc_msgSendSuper2(&v32, sel_buttonWithType_, 1);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7880]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scaledFontForFont:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v22 = (void *)v12;
      objc_msgSend(v9, "titleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFont:", v22);

      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("info"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31.receiver = a1;
      v31.super_class = (Class)&OBJC_METACLASS___PRXButton;
      objc_msgSendSuper2(&v31, sel_systemButtonWithImage_target_action_, v10, 0, 0);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTintColor:", v24);

      objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v25);

      objc_msgSend(v9, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCornerRadius:", 12.0);

      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 7, 1, 15.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);
LABEL_13:

LABEL_14:
      if (v9)
LABEL_15:
        v9[95] = a3;
      break;
    default:
      v9 = 0;
      break;
  }
  objc_msgSend(v9, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v9, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", !v4);

  LODWORD(v29) = 1148846080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v29);

  return (PRXButton *)v9;
}

- (double)_minimumIntrinsicHeight
{
  unint64_t proximityButtonType;
  double result;

  proximityButtonType = self->_proximityButtonType;
  result = 0.0;
  if (proximityButtonType <= 4)
    return dbl_2116376D8[proximityButtonType];
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)PRXButton;
  -[PRXButton intrinsicContentSize](&v10, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[PRXButton _minimumIntrinsicHeight](self, "_minimumIntrinsicHeight");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PRXButton;
  -[PRXButton setHighlighted:](&v6, sel_setHighlighted_);
  if (self->_proximityButtonType == 1)
  {
    v5 = 1.0;
    if (v3)
      v5 = 0.5;
    -[PRXButton setAlpha:](self, "setAlpha:", v5);
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[PRXButton proximityButtonType](self, "proximityButtonType") == 4)
  {
    self->_active = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXButton setBackgroundColor:](self, "setBackgroundColor:", v5);

      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXButton setBackgroundColor:](self, "setBackgroundColor:", v6);

      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    }
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PRXButton setTintColor:](self, "setTintColor:", v7);

  }
}

- (void)toggleActive
{
  -[PRXButton setActive:](self, "setActive:", -[PRXButton isActive](self, "isActive") ^ 1);
}

- (int64_t)proximityButtonType
{
  return self->_proximityButtonType;
}

- (BOOL)isActive
{
  return self->_active;
}

@end
