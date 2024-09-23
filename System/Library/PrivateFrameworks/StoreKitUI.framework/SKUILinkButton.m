@implementation SKUILinkButton

+ (SKUILinkButton)buttonWithArrowStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  objc_super v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUILinkButton buttonWithArrowStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___SKUILinkButton;
  objc_msgSendSuper2(&v17, sel_buttonWithType_, 1);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13[94] = a3;
  objc_msgSend(v13, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 1);

  objc_msgSend(v13, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineBreakMode:", 4);

  objc_msgSend(v13, "_reloadIcons");
  return (SKUILinkButton *)v13;
}

- (SKUILinkButton)initWithArrowStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUILinkButton *v13;
  SKUILinkButton *v14;
  void *v15;
  void *v16;
  objc_super v18;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILinkButton initWithArrowStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUILinkButton;
  v13 = -[SKUILinkButton init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_arrowStyle = a3;
    -[SKUILinkButton titleLabel](v13, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 1);

    -[SKUILinkButton titleLabel](v14, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLineBreakMode:", 4);

    -[SKUILinkButton _reloadIcons](v14, "_reloadIcons");
  }
  return v14;
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUILinkButton;
  -[SKUILinkButton setTitleColor:forState:](&v5, sel_setTitleColor_forState_, a3, a4);
  -[SKUILinkButton _reloadIcons](self, "_reloadIcons");
}

- (void)tintColorDidChange
{
  objc_super v3;

  -[SKUILinkButton _reloadIcons](self, "_reloadIcons");
  v3.receiver = self;
  v3.super_class = (Class)SKUILinkButton;
  -[SKUILinkButton tintColorDidChange](&v3, sel_tintColorDidChange);
}

- (void)sizeToFit
{
  -[SKUILinkButton sizeThatFits:](self, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  -[SKUILinkButton frame](self, "frame");
  -[SKUILinkButton setFrame:](self, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SKUILinkButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton imageForState:](self, "imageForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  -[SKUILinkButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton titleForState:](self, "titleForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  v10 = width == *MEMORY[0x1E0C9D820];
  v11 = height == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v10 && v11)
    v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  else
    v12 = height;
  if (v10 && v11)
    v13 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  else
    v13 = width;
  objc_msgSend(v6, "sizeThatFits:", v13, v12);
  v15 = v14;
  v17 = v16;
  -[SKUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
  v19 = v13 - (v15 + v18);
  objc_msgSend(v8, "sizeThatFits:", v19, v12);
  v22 = v21;
  if (v20 >= v19)
    v20 = v19;
  v23 = v15 + v20;
  -[SKUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
  v25 = ceil(v24 + v23);
  if (width >= v25)
    width = v25;
  if (v22 >= v17)
    v26 = v22;
  else
    v26 = v17;
  v27 = ceil(v26);
  if (height >= v27)
    height = v27;

  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  float v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;

  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
  v42.receiver = self;
  v42.super_class = (Class)SKUILinkButton;
  -[SKUILinkButton layoutSubviews](&v42, sel_layoutSubviews);
  -[SKUILinkButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SKUILinkButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton titleLabel](self, "titleLabel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v7 && v8)
  {
    -[SKUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
    v13 = v4 - v12;
  }
  else
  {
    v13 = v4;
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v15 = *MEMORY[0x1E0C9D820];
    v16 = v4;
    if (!v7)
      goto LABEL_6;
  }
  objc_msgSend(v7, "sizeThatFits:", v13, v6);
  v15 = v17;
  v14 = v18;
  v16 = v13 - v17;
LABEL_6:
  v41 = v4;
  if (v9)
  {
    objc_msgSend(v9, "sizeThatFits:", v16, v6);
    v11 = v20;
    if (v19 >= v16)
      v10 = v16;
    else
      v10 = v19;
  }
  -[SKUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft", *(_QWORD *)&v6);
  v22 = v15 + v10 + v21;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v25 = (v40 - v14) * 0.5;
    v26 = v11;
    v27 = roundf(v25);
    v28 = (v41 - v22) * 0.5;
    v29 = roundf(v28);
    if (v24)
      v30 = v29;
    else
      v30 = v22 + v29 - v15;
    -[SKUILinkButton titleLabel](self, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lineHeight");
    v34 = v33;

    if (v34 <= 14.0)
      v35 = v27 + 1.0;
    else
      v35 = v27;
    v11 = v26;
    objc_msgSend(v7, "setFrame:", v30, v35, v15, v14);
  }
  if (v9)
  {
    objc_msgSend(v9, "frame");
    v36 = (v40 - v11) * 0.5;
    v37 = roundf(v36);
    v38 = (v41 - v22) * 0.5;
    v39 = roundf(v38);
    if (v24)
      v39 = v22 + v39 - v10;
    objc_msgSend(v9, "setFrame:", v39, v37, v10, v11);
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 1);

}

- (double)_linkImagePaddingLeft
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;

  result = 4.0;
  switch(self->_arrowStyle)
  {
    case 0:
    case 1:
    case 5:
      -[SKUILinkButton titleLabel](self, "titleLabel", 4.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "font");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lineHeight");
      v6 = v5;

      result = 3.0;
      if (v6 < 13.0)
        result = 2.0;
      break;
    case 3:
      result = 3.0;
      break;
    case 4:
      result = 7.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_reloadIcons
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  switch(self->_arrowStyle)
  {
    case 0:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronTerms");
      goto LABEL_9;
    case 1:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSeeAll");
      goto LABEL_9;
    case 2:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("MoreDisclosureTriangleMask");
      goto LABEL_9;
    case 3:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("SearchFilterDisclosureChevron");
      goto LABEL_9;
    case 4:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSwooshTitle");
      goto LABEL_9;
    case 5:
      v3 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSeeAllLeft");
LABEL_9:
      objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }
  -[SKUILinkButton titleColorForState:](self, "titleColorForState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (-[SKUILinkButton tintColor](self, "tintColor"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "_flatImageWithColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[SKUILinkButton setImage:forState:](self, "setImage:forState:", v7, 0);
  -[SKUILinkButton titleColorForState:](self, "titleColorForState:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "_flatImageWithColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[SKUILinkButton setImage:forState:](self, "setImage:forState:", v9, 1);

}

- (int64_t)arrowStyle
{
  return self->_arrowStyle;
}

+ (void)buttonWithArrowStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArrowStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
