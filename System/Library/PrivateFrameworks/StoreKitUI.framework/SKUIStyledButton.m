@implementation SKUIStyledButton

- (SKUIStyledButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIStyledButton *result;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStyledButton initWithFrame:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStyledButton;
  result = -[SKUIStyledButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  if (result)
    result->_imageTextPaddingInterior = 5.0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIStyledButton;
  -[SKUIStyledButton dealloc](&v3, sel_dealloc);
}

+ (int64_t)buttonTypeForElement:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v3 = a3;
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5
    && (objc_msgSend(v3, "children"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v8 = objc_msgSend(v7, "elementType"),
        v7,
        v8 == 49))
  {
    v9 = 6;
  }
  else
  {
    v9 = 5;
  }

  return v9;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "sizeForTextSize:buttonType:borderStyle:interiorPadding:", a4, 0, a3.width, a3.height, -1.0);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "sizeForTextSize:buttonType:borderStyle:interiorPadding:", a4, a5, a3.width, a3.height, -1.0);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5 interiorPadding:(double)a6
{
  double height;
  double width;
  id v10;
  void *v11;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v11 = v10;
  switch(a4)
  {
    case 1:
      if (height < 26.0)
        height = 26.0;
      width = width + 0.0;
      goto LABEL_18;
    case 2:
      v12 = 9.0;
      goto LABEL_9;
    case 3:
    case 4:
      v12 = 7.0;
LABEL_9:
      width = width + v12;
      goto LABEL_11;
    case 5:
    case 6:
      v13 = width + 5.0;
      if (a6 >= 0.0)
        width = v13 + 5.0;
      else
        width = v13 + a6;
      goto LABEL_11;
    default:
LABEL_11:
      if (a4 != 1 && v10)
      {
        objc_msgSend(v10, "borderWidth");
        *(float *)&v14 = v14 + v14;
        v15 = floorf(*(float *)&v14);
        objc_msgSend(v11, "contentInset");
        v18 = height + v17 + v16 + v15;
        width = width + v19 + v20 + v15;
        v21 = 44.0;
        if (v18 >= 44.0)
          v21 = v18;
        if (a4 == 7)
          height = v18;
        else
          height = v21;
      }
LABEL_18:

      v22 = width;
      v23 = height;
      result.height = v23;
      result.width = v22;
      return result;
  }
}

+ (BOOL)usesItemOfferAppearanceForButtonType:(int64_t)a3 itemState:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  return a3 == 1 && (objc_msgSend(a4, "state", v4, v5) & 0x47) != 0;
}

- (double)baselineOffset
{
  double result;

  -[SKUIAttributedStringView baselineOffset](self->_attributedStringView, "baselineOffset");
  return result;
}

- (double)firstBaselineOffset
{
  double result;

  -[SKUIAttributedStringView firstBaselineOffset](self->_attributedStringView, "firstBaselineOffset");
  return result;
}

- (BOOL)isUsingItemOfferAppearance
{
  SKUIItemOfferButton *itemOfferButton;

  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
    LOBYTE(itemOfferButton) = -[SKUIItemOfferButton isHidden](itemOfferButton, "isHidden") ^ 1;
  return (char)itemOfferButton;
}

- (void)setBorderStyle:(id)a3
{
  SKUIButtonBorderStyle *v4;
  SKUIButtonBorderStyle *borderStyle;
  SKUIShapeView *borderView;
  SKUIShapeView *v7;
  SKUIShapeView *v8;
  SKUIShapeView *v9;
  void *v10;
  uint64_t v11;
  SKUIAttributedStringView *attributedStringView;
  void *v13;

  if (self->_borderStyle != a3)
  {
    v4 = (SKUIButtonBorderStyle *)objc_msgSend(a3, "copy");
    borderStyle = self->_borderStyle;
    self->_borderStyle = v4;

    borderView = self->_borderView;
    if (self->_borderStyle)
    {
      if (!borderView)
      {
        v7 = objc_alloc_init(SKUIShapeView);
        v8 = self->_borderView;
        self->_borderView = v7;

        v9 = self->_borderView;
        -[SKUIStyledButton backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIShapeView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SKUIShapeView setUserInteractionEnabled:](self->_borderView, "setUserInteractionEnabled:", 0);
        -[SKUIStyledButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_borderView, 0);
        borderView = self->_borderView;
      }
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }
    -[SKUIShapeView setHidden:](borderView, "setHidden:", v11);
    attributedStringView = self->_attributedStringView;
    -[SKUIStyledButton _textBackgroundColor](self, "_textBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIAttributedStringView setBackgroundColor:](attributedStringView, "setBackgroundColor:", v13);

    -[SKUIStyledButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonType:(int64_t)a3
{
  SKUIImageView *imageView;
  SKUIImageView *v5;

  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    if ((unint64_t)(a3 - 5) > 1)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        -[SKUIImageView removeFromSuperview](imageView, "removeFromSuperview");
        v5 = self->_imageView;
        self->_imageView = 0;

      }
    }
    else
    {
      -[SKUIStyledButton _reloadImageView](self, "_reloadImageView");
    }
    -[SKUIStyledButton _reloadDisclosureImage](self, "_reloadDisclosureImage");
    -[SKUIStyledButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleLayout:(id)a3
{
  -[SKUIStyledButton setTitleLayout:forceRefresh:](self, "setTitleLayout:forceRefresh:", a3, 0);
}

- (void)setTitleLayout:(id)a3 forceRefresh:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  SKUIAttributedStringView *attributedStringView;
  SKUIAttributedStringView *v9;
  SKUIAttributedStringView *v10;
  SKUIAttributedStringView *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[SKUIStyledButton titleLayout](self, "titleLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v6 != v13 || v4)
  {
    attributedStringView = self->_attributedStringView;
    if (!attributedStringView)
    {
      v9 = objc_alloc_init(SKUIAttributedStringView);
      v10 = self->_attributedStringView;
      self->_attributedStringView = v9;

      v11 = self->_attributedStringView;
      -[SKUIStyledButton _textBackgroundColor](self, "_textBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIAttributedStringView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      -[SKUIAttributedStringView setUserInteractionEnabled:](self->_attributedStringView, "setUserInteractionEnabled:", 0);
      -[SKUIStyledButton addSubview:](self, "addSubview:", self->_attributedStringView);
      attributedStringView = self->_attributedStringView;
    }
    -[SKUIAttributedStringView setLayout:](attributedStringView, "setLayout:", v13);
    -[SKUIStyledButton _reloadOverrideTextColor](self, "_reloadOverrideTextColor");
    -[SKUIStyledButton _reloadDisclosureImage](self, "_reloadDisclosureImage");
    v7 = v13;
  }

}

- (void)setUsesTintColor:(BOOL)a3
{
  if (self->_usesTintColor != a3)
  {
    self->_usesTintColor = a3;
    -[SKUIStyledButton _reloadOverrideTextColor](self, "_reloadOverrideTextColor");
  }
}

- (SKUIAttributedStringLayout)titleLayout
{
  return -[SKUIAttributedStringView layout](self->_attributedStringView, "layout");
}

- (void)setItemOfferDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_itemOfferDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_itemOfferDelegate, obj);
    -[SKUIItemOfferButton setItemOfferDelegate:](self->_itemOfferButton, "setItemOfferDelegate:", obj);
  }

}

- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  int v13;
  id *p_itemOfferButton;
  SKUIItemOfferButton *itemOfferButton;
  BOOL v16;
  SKUIItemOfferButton *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id WeakRetained;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend((id)objc_opt_class(), "usesItemOfferAppearanceForButtonType:itemState:", self->_buttonType, v11);
  if ((v13 & 1) != 0)
  {
    p_itemOfferButton = (id *)&self->_itemOfferButton;
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton)
    {
      if (!-[SKUIItemOfferButton setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:](itemOfferButton, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v10, v11, v12, v6))
      {
        v16 = 0;
LABEL_8:
        -[SKUIAttributedStringView setHidden:](self->_attributedStringView, "setHidden:", 1);
        goto LABEL_9;
      }
    }
    else
    {
      v17 = [SKUIItemOfferButton alloc];
      -[SKUIStyledButton bounds](self, "bounds");
      v18 = -[SKUIItemOfferButton initWithFrame:](v17, "initWithFrame:");
      v19 = *p_itemOfferButton;
      *p_itemOfferButton = (id)v18;

      objc_msgSend(*p_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__cancelConfirmationAction_, 0x10000);
      objc_msgSend(*p_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__itemOfferButtonAction_, 0x20000);
      objc_msgSend(*p_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__showConfirmationAction_, 0x40000);
      v20 = *p_itemOfferButton;
      -[SKUIStyledButton backgroundColor](self, "backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBackgroundColor:", v21);

      v22 = *p_itemOfferButton;
      WeakRetained = objc_loadWeakRetained((id *)&self->_itemOfferDelegate);
      objc_msgSend(v22, "setItemOfferDelegate:", WeakRetained);

      objc_msgSend(*p_itemOfferButton, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v10, v11, v12, v6);
      -[SKUIStyledButton addSubview:](self, "addSubview:", *p_itemOfferButton);
    }
    -[SKUIStyledButton setNeedsLayout](self, "setNeedsLayout");
    v16 = 1;
    goto LABEL_8;
  }
  v16 = -[SKUIStyledButton isUsingItemOfferAppearance](self, "isUsingItemOfferAppearance");
  -[SKUIAttributedStringView setHidden:](self->_attributedStringView, "setHidden:", 0);
  p_itemOfferButton = (id *)&self->_itemOfferButton;
LABEL_9:
  objc_msgSend(*p_itemOfferButton, "setHidden:", v13 ^ 1u);

  return v16;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SKUIStyledButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUIStyledButton;
    -[SKUIStyledButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[SKUIStyledButton _reloadOverrideTextColor](self, "_reloadOverrideTextColor");
    -[SKUIStyledButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIStyledButton;
  -[SKUIStyledButton touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  SKUIItemOfferButton *itemOfferButton;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (-[SKUIStyledButton isTouchInside](self, "isTouchInside"))
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton || -[SKUIItemOfferButton isHidden](itemOfferButton, "isHidden"))
      -[SKUIStyledButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStyledButton;
  -[SKUIStyledButton touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, v7);

}

- (CGRect)hitRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  objc_super v14;
  CGRect result;

  if (self->_useBigHitTarget)
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIStyledButton;
    -[SKUIStyledButton hitRect](&v14, sel_hitRect);
    top = self->_bigHitInsets.top;
    left = self->_bigHitInsets.left;
    v6 = v5 + left;
    v8 = v7 + top;
    v10 = v9 - (left + self->_bigHitInsets.right);
    v12 = v11 - (top + self->_bigHitInsets.bottom);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIStyledButton;
    -[SKUIStyledButton hitRect](&v13, sel_hitRect);
  }
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SKUIShapeView *borderView;
  void *v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  void *attributedStringView;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  CGFloat v56;
  double v57;
  double imageTextPaddingInterior;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  float v67;
  float v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  SKUIAttributedStringView *v74;
  double v75;
  CGFloat v76;
  CGFloat MaxX;
  float v78;
  double v79;
  SKUIAttributedStringView *v80;
  void *v81;
  double v82;
  SKUIAttributedStringView *v83;
  UIImageView *disclosureImageView;
  int v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  double v93;
  CGFloat rect;
  CGFloat recta;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  -[SKUIStyledButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  borderView = self->_borderView;
  if (borderView && (-[SKUIShapeView isHidden](borderView, "isHidden") & 1) == 0)
  {
    -[SKUIShapeView layer](self->_borderView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStyledButton _borderFillColor](self, "_borderFillColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setFillColor:", objc_msgSend(v13, "CGColor"));

    -[SKUIButtonBorderStyle borderWidth](self->_borderStyle, "borderWidth");
    objc_msgSend(v12, "setLineWidth:");
    -[SKUIButtonBorderStyle bezierPathWithBounds:](self->_borderStyle, "bezierPathWithBounds:", v4, v6, v8, v10);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setPath:", objc_msgSend(v14, "CGPath"));

    -[SKUIStyledButton _borderColor](self, "_borderColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    -[SKUIShapeView setFrame:](self->_borderView, "setFrame:", v4, v6, v8, v10);
    -[SKUIButtonBorderStyle contentInset](self->_borderStyle, "contentInset");
    v4 = v4 + v16;
    v6 = v6 + v17;
    v8 = v8 - (v16 + v18);
    v10 = v10 - (v17 + v19);

  }
  switch(self->_buttonType)
  {
    case 0:
    case 7:
      -[SKUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      v36 = v35;
      v38 = v37;
      *(float *)&v35 = v4 + (v8 - v35) * 0.5;
      v39 = floorf(*(float *)&v35);
      *(float *)&v37 = v6 + (v10 - v37) * 0.5;
      v40 = floorf(*(float *)&v37);
      attributedStringView = self->_attributedStringView;
      v42 = v4;
      v43 = v6;
      goto LABEL_28;
    case 1:
      -[SKUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      v71 = v70;
      v73 = v72;
      *(float *)&v70 = (v8 - v70) * 0.5;
      *(float *)&v72 = (v10 - v72) * 0.5;
      v74 = self->_attributedStringView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(floorf(*(float *)&v70), floorf(*(float *)&v72), v71, v73, v4, v6, v8, v10);
      -[SKUIAttributedStringView setFrame:](v74, "setFrame:");
      -[SKUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v4, v6, v8, v10);
      break;
    case 2:
    case 3:
    case 4:
      v96 = v6;
      v20 = MEMORY[0x1E0C9D648];
      v21 = *MEMORY[0x1E0C9D648];
      -[SKUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      v23 = v22;
      v25 = v24;
      *(float *)&v22 = (v10 - v24) * 0.5;
      v26 = floorf(*(float *)&v22);
      -[UIImageView sizeThatFits:](self->_disclosureImageView, "sizeThatFits:", v8, v10);
      v28 = v27;
      v30 = v29;
      v98 = v4;
      v92 = v26;
      rect = v27;
      v91 = v25;
      if (self->_buttonType == 3)
      {
        v31 = *(_QWORD *)(v20 + 8);
        v32 = v21;
        v33 = v30;
        v89 = v21;
        v21 = CGRectGetMaxX(*(CGRect *)(&v28 - 2)) + 2.0;
        if (v23 >= v8 - v21)
          v34 = v8 - v21;
        else
          v34 = v23;
      }
      else
      {
        if (v23 >= v8 - v27 + -2.0)
          v34 = v8 - v27 + -2.0;
        else
          v34 = v23;
        v101.origin.x = v21;
        v101.origin.y = v26;
        v101.size.width = v34;
        v101.size.height = v25;
        v89 = CGRectGetMaxX(v101) + 2.0;
      }
      v65 = v30;
      -[SKUIAttributedStringView layout](self->_attributedStringView, "layout", *(_QWORD *)&v89);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v66, "numberOfLines") == 1 && self->_buttonType != 2)
      {
        -[SKUIAttributedStringView layout](self->_attributedStringView, "layout");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "baselineOffset");
        *(float *)&v82 = v82 + v92 - v30;
        v68 = ceilf(*(float *)&v82);

        v69 = v92;
        v65 = v30;
      }
      else
      {
        v67 = (v10 - v30) * 0.5;
        v68 = floorf(v67);
        v69 = v92;
      }
      v83 = self->_attributedStringView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21, v69, v34, v91, v98, v96, v8, v10);
      -[SKUIAttributedStringView setFrame:](v83, "setFrame:");
      disclosureImageView = self->_disclosureImageView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v90, v68, rect, v65, v98, v96, v8, v10);
      -[UIImageView setFrame:](disclosureImageView, "setFrame:");
      -[SKUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);

      break;
    case 5:
    case 6:
      -[SKUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      v45 = v44;
      v47 = v46;
      *(float *)&v44 = (v10 - v46) * 0.5;
      v48 = floorf(*(float *)&v44);
      -[SKUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v8, v10);
      v50 = v49;
      v52 = v51;
      v97 = v6;
      v99 = v4;
      recta = v49;
      if (self->_buttonType == 6)
      {
        v93 = v48;
        v53 = *MEMORY[0x1E0C9D648];
        v54 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v55 = *MEMORY[0x1E0C9D648];
        v56 = v54;
        v57 = v52;
        imageTextPaddingInterior = 0.0;
        if (CGRectGetMaxX(*(CGRect *)(&v50 - 2)) > 0.0)
          imageTextPaddingInterior = self->_imageTextPaddingInterior;
        v100.origin.x = v53;
        v100.origin.y = v54;
        v100.size.width = recta;
        v100.size.height = v52;
        v59 = imageTextPaddingInterior + CGRectGetMaxX(v100);
        -[SKUIStyledButton buttonPadding](self, "buttonPadding");
        v61 = v59 + v60;
        if (v45 >= v8 - (v59 + v60))
          v45 = v8 - (v59 + v60);
        -[SKUIStyledButton buttonPadding](self, "buttonPadding");
        v63 = v62;
        v64 = v93;
      }
      else
      {
        v75 = self->_imageTextPaddingInterior;
        if (v45 >= v8 - v49 - v75)
          v45 = v8 - v49 - v75;
        -[SKUIStyledButton buttonPadding](self, "buttonPadding");
        v61 = v76;
        v102.origin.x = v76;
        v102.origin.y = v48;
        v102.size.width = v45;
        v102.size.height = v47;
        MaxX = CGRectGetMaxX(v102);
        v64 = v48;
        v63 = MaxX + self->_imageTextPaddingInterior;
      }
      v78 = (v10 - v52) * 0.5;
      v79 = self->_imageYAdjustment + floorf(v78);
      v80 = self->_attributedStringView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v61, v64, v45, v47, v99, v97, v8, v10);
      v104 = CGRectIntegral(v103);
      -[SKUIAttributedStringView setFrame:](v80, "setFrame:", v104.origin.x, v104.origin.y, v104.size.width, v104.size.height);
      attributedStringView = self->_imageView;
      v39 = v63;
      v40 = v79;
      v36 = recta;
      v38 = v52;
      v42 = v99;
      v43 = v97;
LABEL_28:
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v39, v40, v36, v38, v42, v43, v8, v10);
      objc_msgSend(attributedStringView, "setFrame:");
      -[SKUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
      break;
    default:
      break;
  }
  v85 = -[SKUIStyledButton isEnabled](self, "isEnabled");
  v86 = 1.0;
  if (v85)
    v87 = 1.0;
  else
    v87 = 0.25;
  -[SKUIShapeView setAlpha:](self->_borderView, "setAlpha:", v87);
  if ((v85 & 1) == 0)
  {
    -[SKUIButtonBorderStyle fillColor](self->_borderStyle, "fillColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88)
      v86 = 1.0;
    else
      v86 = 0.25;

  }
  -[SKUIAttributedStringView setAlpha:](self->_attributedStringView, "setAlpha:", v86);
  -[UIImageView setAlpha:](self->_disclosureImageView, "setAlpha:", v86);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  objc_super v7;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  if (self->_useBigHitTarget)
  {
    -[SKUIStyledButton hitRect](self, "hitRect", a4);
    v8.x = x;
    v8.y = y;
    return CGRectContainsPoint(v9, v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIStyledButton;
    return -[SKUIStyledButton pointInside:withEvent:](&v7, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  SKUIAttributedStringView *attributedStringView;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIStyledButton;
  v4 = a3;
  -[SKUIStyledButton setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);
  attributedStringView = self->_attributedStringView;
  -[SKUIStyledButton _textBackgroundColor](self, "_textBackgroundColor", v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIAttributedStringView setBackgroundColor:](attributedStringView, "setBackgroundColor:", v6);

  -[SKUIShapeView setBackgroundColor:](self->_borderView, "setBackgroundColor:", v4);
  -[UIImageView setBackgroundColor:](self->_disclosureImageView, "setBackgroundColor:", v4);
  -[SKUIItemOfferButton setBackgroundColor:](self->_itemOfferButton, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  id v14;
  void *borderView;
  id v16;
  _QWORD v17[6];
  objc_super v18;

  v3 = a3;
  if (-[SKUIStyledButton isHighlighted](self, "isHighlighted") != a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)SKUIStyledButton;
    -[SKUIStyledButton setHighlighted:](&v18, sel_setHighlighted_, v3);
    if (self->_borderView
      && (-[SKUIButtonBorderStyle fillColor](self->_borderStyle, "fillColor"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      -[SKUIShapeView layer](self->_borderView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompositingFilter:", v8);

      objc_msgSend(v7, "removeAnimationForKey:", CFSTR("borderAnimation"));
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStyledButton setBackgroundColor:](self, "setBackgroundColor:", v9);

      -[SKUIStyledButton bringSubviewToFront:](self, "bringSubviewToFront:", self->_borderView);
      v10 = 0.47;
      if (v3 && !self->_didInitialHighlightForTouch)
      {
        self->_didInitialHighlightForTouch = 1;
        v10 = 0.01;
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("fillColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", self);
      objc_msgSend(v11, "setDuration:", v10);
      objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      UIAnimationDragCoefficient();
      *(float *)&v13 = 1.0 / v12;
      objc_msgSend(v11, "setSpeed:", v13);
      if (v3)
      {
        -[SKUIShapeView backgroundColor](self->_borderView, "backgroundColor");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "setFromValue:", objc_msgSend(v14, "CGColor"));

        objc_msgSend(v11, "setToValue:", objc_msgSend(v7, "strokeColor"));
      }
      else
      {
        objc_msgSend(v11, "setFromValue:", objc_msgSend(v7, "strokeColor"));
        -[SKUIShapeView backgroundColor](self->_borderView, "backgroundColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "setToValue:", objc_msgSend(v16, "CGColor"));

      }
      objc_msgSend(v7, "addAnimation:forKey:", v11, CFSTR("borderAnimation"));

    }
    else
    {
      v6 = 1.0;
      if (v3 && (v6 = 0.2, !self->_didInitialHighlightForTouch))
      {
        borderView = self->_borderView;
        if (borderView
          || (-[SKUIAttributedStringView setAlpha:](self->_attributedStringView, "setAlpha:", 0.2),
              -[UIImageView setAlpha:](self->_disclosureImageView, "setAlpha:", 0.2),
              (borderView = self->_imageView) != 0))
        {
          objc_msgSend(borderView, "setAlpha:", 0.2);
        }
        self->_didInitialHighlightForTouch = 1;
      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __35__SKUIStyledButton_setHighlighted___block_invoke;
        v17[3] = &unk_1E73A4960;
        v17[4] = self;
        *(double *)&v17[5] = v6;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v17, 0, 0.47, 0.0);
      }
    }
  }
}

void *__35__SKUIStyledButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *result;
  double *v4;
  double v5;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v2 + 512);
  if (result)
  {
    v4 = (double *)(a1 + 40);
  }
  else
  {
    v5 = *(double *)(a1 + 40);
    v4 = (double *)(a1 + 40);
    objc_msgSend(*(id *)(v2 + 464), "setAlpha:", v5);
    objc_msgSend(*(id *)(*((_QWORD *)v4 - 1) + 536), "setAlpha:", *v4);
    result = *(void **)(*((_QWORD *)v4 - 1) + 552);
    if (!result)
      return result;
  }
  return (void *)objc_msgSend(result, "setAlpha:", *v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SKUIImageView *imageView;
  void *v16;
  double v17;
  double v18;
  int64_t buttonType;
  double v20;
  double v21;
  double v22;
  SKUIButtonBorderStyle *borderStyle;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SKUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[UIImageView image](self->_disclosureImageView, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIImageView sizeThatFits:](self->_disclosureImageView, "sizeThatFits:", width, height);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  imageView = self->_imageView;
  if (imageView)
  {
    -[SKUIImageView image](imageView, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SKUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
      v12 = v17;
      v14 = v18;
    }
  }
  buttonType = self->_buttonType;
  if ((unint64_t)(buttonType - 2) < 3)
  {
    if (v9 < v14)
      v9 = v14;
    v22 = v12 + 2.0;
  }
  else if ((unint64_t)(buttonType - 5) >= 2)
  {
    if (buttonType != 1)
      goto LABEL_16;
    if (-[SKUIStyledButton isUsingItemOfferAppearance](self, "isUsingItemOfferAppearance"))
    {
      -[SKUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", width, height);
      v7 = v34;
      v9 = v35;
      goto LABEL_16;
    }
    if (v9 < 26.0)
      v9 = 26.0;
    v22 = 0.0;
  }
  else
  {
    -[SKUIStyledButton buttonPadding](self, "buttonPadding");
    if (v9 < v14)
      v9 = v14;
    v22 = v20 + v21 + v12 + self->_imageTextPaddingInterior;
  }
  v7 = v7 + v22;
LABEL_16:
  borderStyle = self->_borderStyle;
  if (borderStyle && self->_buttonType != 1)
  {
    -[SKUIButtonBorderStyle borderWidth](borderStyle, "borderWidth");
    *(float *)&v24 = v24 + v24;
    v25 = floorf(*(float *)&v24);
    -[SKUIButtonBorderStyle contentInset](self->_borderStyle, "contentInset");
    v28 = v9 + v27 + v26 + v25;
    v7 = v7 + v29 + v30 + v25;
    v31 = 44.0;
    if (v28 >= 44.0)
      v31 = v28;
    if (self->_buttonType == 7)
      v9 = v28;
    else
      v9 = v31;
  }
  v32 = v7;
  v33 = v9;
  result.height = v33;
  result.width = v32;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  if (-[SKUIStyledButton _usesTintColor](self, "_usesTintColor"))
  {
    -[SKUIStyledButton _reloadOverrideTextColor](self, "_reloadOverrideTextColor");
    -[SKUIStyledButton _reloadDisclosureImage](self, "_reloadDisclosureImage");
  }
  -[SKUIShapeView layer](self->_borderView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStyledButton _borderFillColor](self, "_borderFillColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  -[SKUIStyledButton _borderColor](self, "_borderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  v6.receiver = self;
  v6.super_class = (Class)SKUIStyledButton;
  -[SKUIStyledButton tintColorDidChange](&v6, sel_tintColorDidChange);

}

- (void)_cancelConfirmationAction:(id)a3
{
  -[SKUIStyledButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
}

- (void)_itemOfferButtonAction:(id)a3
{
  -[SKUIStyledButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
}

- (void)_showConfirmationAction:(id)a3
{
  -[SKUIStyledButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIShapeView layer](self->_borderView, "layer", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SKUIStyledButton isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStyledButton setBackgroundColor:](self, "setBackgroundColor:", v6);

    -[SKUIStyledButton bringSubviewToFront:](self, "bringSubviewToFront:", self->_borderView);
  }
  else
  {
    objc_msgSend(v8, "setCompositingFilter:", 0);
    -[SKUIShapeView backgroundColor](self->_borderView, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStyledButton setBackgroundColor:](self, "setBackgroundColor:", v7);

    -[SKUIStyledButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_borderView);
  }

}

- (id)_borderColor
{
  void *v3;
  void *v4;
  void *v5;

  -[SKUIButtonBorderStyle borderColor](self->_borderStyle, "borderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "colorType") == 1)
      -[SKUIStyledButton tintColor](self, "tintColor");
    else
      objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_borderFillColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[SKUIButtonBorderStyle fillColor](self->_borderStyle, "fillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "colorType") == 1)
      -[SKUIStyledButton tintColor](self, "tintColor");
    else
      objc_msgSend(v4, "color");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIStyledButton backgroundColor](self, "backgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_reloadImageView
{
  SKUIImageView *v3;
  SKUIImageView *v4;
  SKUIImageView *imageView;

  if (!self->_imageView)
  {
    v3 = [SKUIImageView alloc];
    -[SKUIStyledButton bounds](self, "bounds");
    v4 = -[SKUIImageView initWithFrame:](v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    -[SKUIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
    -[SKUIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
    -[SKUIStyledButton addSubview:](self, "addSubview:", self->_imageView);
  }
}

- (void)_reloadDisclosureImage
{
  __int128 v3;
  int64_t buttonType;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *disclosureImageView;
  UIImageView *v13;
  UIImageView *v14;
  UIImageView *v15;
  void *v16;
  UIImageView *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v22.c = v3;
  *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  buttonType = self->_buttonType;
  switch(buttonType)
  {
    case 4:
      v5 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("ChevronSeeAll");
      goto LABEL_6;
    case 3:
      v9 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      CGAffineTransformMakeScale(&v22, -1.0, 1.0);
      break;
    case 2:
      v5 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("SearchFilterDisclosureChevron");
LABEL_6:
      objc_msgSend(v5, "imageNamed:inBundle:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(v8, "imageFlippedForRightToLeftLayoutDirection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  disclosureImageView = self->_disclosureImageView;
  if (v11)
  {
    if (!disclosureImageView)
    {
      v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v14 = self->_disclosureImageView;
      self->_disclosureImageView = v13;

      v15 = self->_disclosureImageView;
      -[SKUIStyledButton backgroundColor](self, "backgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v15, "setBackgroundColor:", v16);

      v17 = self->_disclosureImageView;
      v21 = v22;
      -[UIImageView setTransform:](v17, "setTransform:", &v21);
      -[SKUIStyledButton addSubview:](self, "addSubview:", self->_disclosureImageView);
    }
  }
  else
  {
    -[UIImageView setHidden:](disclosureImageView, "setHidden:", 1);
  }
  -[SKUIStyledButton _textColor](self, "_textColor");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v11 && v18)
  {
    -[UIImageView setTintColor:](self->_disclosureImageView, "setTintColor:", v18);
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v20;
  }
  -[UIImageView setImage:](self->_disclosureImageView, "setImage:", v11);

}

- (void)_reloadOverrideTextColor
{
  SKUIAttributedStringView *attributedStringView;
  id v4;

  if (-[SKUIStyledButton isEnabled](self, "isEnabled")
    && -[SKUIStyledButton _usesTintColor](self, "_usesTintColor"))
  {
    attributedStringView = self->_attributedStringView;
    -[SKUIStyledButton tintColor](self, "tintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIAttributedStringView setTextColor:](attributedStringView, "setTextColor:", v4);

  }
  else
  {
    -[SKUIAttributedStringView setTextColor:](self->_attributedStringView, "setTextColor:", 0);
  }
}

- (id)_textBackgroundColor
{
  if (self->_borderStyle)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[SKUIStyledButton backgroundColor](self, "backgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_textColor
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SKUIStyledButton isEnabled](self, "isEnabled")
    && -[SKUIStyledButton _usesTintColor](self, "_usesTintColor"))
  {
    -[SKUIStyledButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIAttributedStringView layout](self->_attributedStringView, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1140], 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (BOOL)_usesTintColor
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_usesTintColor)
    return 1;
  -[SKUIAttributedStringView layout](self->_attributedStringView, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1140], 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5 == 0;

  }
  else
  {
    v2 = 1;
  }

  return v2;
}

- (UIEdgeInsets)bigHitInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bigHitInsets.top;
  left = self->_bigHitInsets.left;
  bottom = self->_bigHitInsets.bottom;
  right = self->_bigHitInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (SKUIButtonBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (double)imageTextPaddingInterior
{
  return self->_imageTextPaddingInterior;
}

- (void)setImageTextPaddingInterior:(double)a3
{
  self->_imageTextPaddingInterior = a3;
}

- (SKUIImageView)imageView
{
  return self->_imageView;
}

- (double)imageYAdjustment
{
  return self->_imageYAdjustment;
}

- (void)setImageYAdjustment:(double)a3
{
  self->_imageYAdjustment = a3;
}

- (SKUIItemOfferButtonDelegate)itemOfferDelegate
{
  return (SKUIItemOfferButtonDelegate *)objc_loadWeakRetained((id *)&self->_itemOfferDelegate);
}

- (BOOL)useBigHitTarget
{
  return self->_useBigHitTarget;
}

- (void)setUseBigHitTarget:(BOOL)a3
{
  self->_useBigHitTarget = a3;
}

- (BOOL)usesTintColor
{
  return self->_usesTintColor;
}

- (UIEdgeInsets)buttonPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_buttonPadding.top;
  left = self->_buttonPadding.left;
  bottom = self->_buttonPadding.bottom;
  right = self->_buttonPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setButtonPadding:(UIEdgeInsets)a3
{
  self->_buttonPadding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemOfferDelegate);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_attributedStringView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStyledButton initWithFrame:]";
}

@end
