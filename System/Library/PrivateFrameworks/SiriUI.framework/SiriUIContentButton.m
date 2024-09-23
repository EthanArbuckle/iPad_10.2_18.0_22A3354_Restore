@implementation SiriUIContentButton

+ (id)button
{
  return (id)objc_msgSend(a1, "buttonWithType:", 0);
}

+ (id)buttonWithRole:(int64_t)a3
{
  void *v4;

  objc_msgSend(a1, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRole:", a3);
  return v4;
}

+ (id)buttonWithLightWeightFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_dynamicLightWeightBodySizeFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v6, 2);

  return v2;
}

+ (id)buttonWithMediumWeightFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_dynamicMediumWeightBodySizeFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v6, 2);

  return v2;
}

+ (id)buttonWithImageMask:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  if (a4)
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_transparantButtonColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v10, 0);

  if (a4)
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingHighlightColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_transparantHighlightedButtonColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v12, 1);

  return v7;
}

+ (id)buttonWithImageTemplate:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setImage:forState:", v6, 0);
  objc_msgSend(v7, "_setIsRenderingImageTemplate:", 1);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultColorForTemplate:", v9);

    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingHighlightColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_transparantButtonColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultColorForTemplate:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "siriui_transparantHighlightedButtonColor");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightColorForTemplate:", v11);

  return v7;
}

+ (id)eyesFreeButtonWithImageTemplate:(id)a3 style:(int64_t)a4
{
  void *v4;

  +[SiriUIContentButton buttonWithImageTemplate:style:](SiriUIContentButton, "buttonWithImageTemplate:style:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentVerticalAlignment:", 3);
  objc_msgSend(v4, "setContentHorizontalAlignment:", 3);
  return v4;
}

- (SiriUIContentButton)initWithFrame:(CGRect)a3
{
  char *v3;
  SiriUIContentButton *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SiriUIContentButton;
  v3 = -[SiriUIContentButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (SiriUIContentButton *)v3;
  if (v3)
  {
    v5 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)(v3 + 792) = *MEMORY[0x24BDF7718];
    *(_OWORD *)(v3 + 808) = v5;
    objc_msgSend(v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    -[SiriUIContentButton titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setBackgroundColor:](v4, "setBackgroundColor:", v9);

    -[SiriUIContentButton setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    -[SiriUIContentButton setUsePlatterStyle:](v4, "setUsePlatterStyle:", SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets());
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIContentButton;
  -[SiriUIContentButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SiriUIContentButton _updateStyling](self, "_updateStyling");
}

- (void)setUsePlatterStyle:(BOOL)a3
{
  if (self->_usePlatterStyle != a3)
  {
    self->_usePlatterStyle = a3;
    -[SiriUIContentButton _updateStyling](self, "_updateStyling");
  }
}

- (void)setRole:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SiriUIContentButton;
  -[SiriUIContentButton setRole:](&v17, sel_setRole_);
  switch(a3)
  {
    case 0:
    case 2:
      -[SiriUIContentButton titleLabel](self, "titleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "siriUI_dynamicSubHeadlineMediumSizeFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFont:", v6);

      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIContentButton setTitleColor:forState:](self, "setTitleColor:forState:", v7, 0);

      objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      -[SiriUIContentButton titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "siriUI_dynamicSubHeadlineEmphasizedSizeFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v10);

      objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIContentButton setTitleColor:forState:](self, "setTitleColor:forState:", v11, 0);

      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
      -[SiriUIContentButton titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6A70], "siriUI_dynamicSubHeadlineEmphasizedSizeFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v13);

      objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIContentButton setTitleColor:forState:](self, "setTitleColor:forState:", v14, 0);

      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v15 = (void *)v8;
      -[SiriUIContentButton setBackgroundColor:](self, "setBackgroundColor:", v8);

      break;
    default:
      break;
  }
  -[SiriUIContentButton titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextAlignment:", 1);

}

- (void)_updateStyling
{
  void *v3;
  void *v4;
  int v5;
  int *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  UIColor *overrideTextColor;
  void *v12;
  id v13;

  if (!-[SiriUIContentButton isHighlighted](self, "isHighlighted")
    || (-[SiriUIContentButton imageView](self, "imageView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "image"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if (self->_isRenderingImageTemplate)
    {
      v5 = -[SiriUIContentButton isHighlighted](self, "isHighlighted");
      v6 = &OBJC_IVAR___SiriUIContentButton__defaultColorForTemplate;
      if (v5)
        v6 = &OBJC_IVAR___SiriUIContentButton__highlightColorForTemplate;
      v7 = *(id *)((char *)&self->super.super.super.super.super.isa + *v6);
      -[SiriUIContentButton imageView](self, "imageView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTintColor:", v7);
      goto LABEL_18;
    }
    if (-[SiriUIContentButton role](self, "role") == 3)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[SiriUIContentButton role](self, "role") == 1)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      }
      else
      {
        -[SiriUIContentButton role](self, "role");
        objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
      }
      v8 = objc_claimAutoreleasedReturnValue();
    }
LABEL_29:
    v13 = (id)v8;
    -[SiriUIContentButton setBackgroundColor:](self, "setBackgroundColor:", v8);
    goto LABEL_30;
  }
  if (-[SiriUIContentButton role](self, "role") == 3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = v9;
    v10 = 0.75;
    goto LABEL_17;
  }
  if (-[SiriUIContentButton role](self, "role") == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (-[SiriUIContentButton role](self, "role") != 2)
  {
    overrideTextColor = self->_overrideTextColor;
    if (overrideTextColor)
    {
      -[SiriUIContentButton setTitleColor:forState:](self, "setTitleColor:forState:", overrideTextColor, 0);
    }
    else
    {
      if (self->_usePlatterStyle)
        objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextHighlightColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIContentButton setTitleColor:forState:](self, "setTitleColor:forState:", v12, 0);

    }
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v10 = 0.15;
LABEL_17:
  objc_msgSend(v9, "colorWithAlphaComponent:", v10);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setBackgroundColor:](self, "setBackgroundColor:", v7);
LABEL_18:

LABEL_30:
}

- (void)configureRoleForConfirmationOptions:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  SiriUIContentButton *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_23;
  }
  v6 = v4;
  v7 = 0;
  v8 = *(_QWORD *)v29;
  v9 = *MEMORY[0x24BE826D0];
  v10 = *MEMORY[0x24BE826C8];
  v26 = *MEMORY[0x24BE826C0];
  *(_QWORD *)&v5 = 136315394;
  v25 = v5;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v3);
      v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
      objc_msgSend(v12, "type", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v9);

      if (v14)
      {
        if (v7)
        {
          v15 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v33 = "-[SiriUIContentButton configureRoleForConfirmationOptions:]";
            v34 = 2112;
            v35 = v12;
            _os_log_error_impl(&dword_21764F000, v15, OS_LOG_TYPE_ERROR, "%s Warning: Duplicated confirm confirmationOption included in SAUIConfirmationOptions : %@", buf, 0x16u);
          }
        }
        v16 = v12;

        objc_msgSend(v16, "buttonRole");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v10);

        if (v18)
        {
          v19 = self;
          v20 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v16, "buttonRole");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v26);

        if (v22)
        {
          v19 = self;
          v20 = 3;
LABEL_14:
          -[SiriUIContentButton setRole:](v19, "setRole:", v20);
        }
        else
        {
          -[SiriUIContentButton setRole:](self, "setRole:", 0);
          v23 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v33 = "-[SiriUIContentButton configureRoleForConfirmationOptions:]";
            v34 = 2112;
            v35 = v16;
            _os_log_impl(&dword_21764F000, v23, OS_LOG_TYPE_DEFAULT, "%s %@ does not specify primary or destructive roles.", buf, 0x16u);
          }
        }
        v7 = v16;
      }
      ++v11;
    }
    while (v6 != v11);
    v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    v6 = v24;
  }
  while (v24);
LABEL_23:
  -[SiriUIContentButton _updateStyling](self, "_updateStyling");

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIEdgeInsets *p_hitTestEdgeInsets;
  BOOL v9;
  BOOL v10;
  double left;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  p_hitTestEdgeInsets = &self->_hitTestEdgeInsets;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.top, *MEMORY[0x24BDF7718]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x24BDF7718] + 16)))), 0xFuLL))) & 1) != 0|| !-[SiriUIContentButton isEnabled](self, "isEnabled")|| -[SiriUIContentButton isHidden](self, "isHidden"))
  {
    v17.receiver = self;
    v17.super_class = (Class)SiriUIContentButton;
    v9 = -[SiriUIContentButton pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    -[SiriUIContentButton bounds](self, "bounds");
    left = self->_hitTestEdgeInsets.left;
    v19.origin.x = v13 + left;
    v19.origin.y = p_hitTestEdgeInsets->top + v14;
    v19.size.width = v15 - (left + self->_hitTestEdgeInsets.right);
    v19.size.height = v16 - (p_hitTestEdgeInsets->top + self->_hitTestEdgeInsets.bottom);
    v18.x = x;
    v18.y = y;
    v9 = CGRectContainsPoint(v19, v18);
  }
  v10 = v9;

  return v10;
}

- (void)setOverrideTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTextColor, a3);
  -[SiriUIContentButton _updateStyling](self, "_updateStyling");
}

- (void)_setIsRenderingImageTemplate:(BOOL)a3
{
  self->_isRenderingImageTemplate = a3;
}

- (void)setDefaultColorForTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultColorForTemplate, a3);
  -[SiriUIContentButton _updateTintColor](self, "_updateTintColor");
}

- (void)setHighlightColorForTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColorForTemplate, a3);
  -[SiriUIContentButton _updateTintColor](self, "_updateTintColor");
}

- (void)_updateTintColor
{
  int v3;
  void *v4;
  int *v5;
  id v6;

  if (self->_isRenderingImageTemplate)
  {
    v3 = -[SiriUIContentButton isHighlighted](self, "isHighlighted");
    -[SiriUIContentButton imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = &OBJC_IVAR___SiriUIContentButton__defaultColorForTemplate;
    if (v3)
      v5 = &OBJC_IVAR___SiriUIContentButton__highlightColorForTemplate;
    objc_msgSend(v4, "setTintColor:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v5));

  }
}

+ (id)buttonWithImageMask:(id)a3
{
  return (id)objc_msgSend(a1, "buttonWithImageMask:style:", a3, 0);
}

+ (id)buttonWithImageTemplate:(id)a3
{
  return (id)objc_msgSend(a1, "buttonWithImageTemplate:style:", a3, 0);
}

- (BOOL)usePlatterStyle
{
  return self->_usePlatterStyle;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_highlightColorForTemplate, 0);
  objc_storeStrong((id *)&self->_defaultColorForTemplate, 0);
}

@end
