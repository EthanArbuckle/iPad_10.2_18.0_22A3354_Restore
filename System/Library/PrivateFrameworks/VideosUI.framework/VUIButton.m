@implementation VUIButton

- (CGSize)_computeSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double imageMaxHeight;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  double v36;
  double v37;
  double v38;
  double v41;
  double v43;
  double v44;
  double v45;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:");
  imageMaxHeight = v6;
  switch(-[VUIButton buttonType](self, "buttonType"))
  {
    case 0uLL:
    case 3uLL:
      -[VUIButton _calculateContentSizeForPrimaryButtonThatFit:](self, "_calculateContentSizeForPrimaryButtonThatFit:", width, height);
      imageMaxHeight = v8;
      goto LABEL_20;
    case 1uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_20;
    case 5uLL:
      if (-[VUIButton _hasTitle](self, "_hasTitle"))
      {
        -[VUIButton textContentView](self, "textContentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sizeThatFits:", width, height);
        imageMaxHeight = v10;

      }
      -[VUIButton padding](self, "padding");
      -[VUIButton padding](self, "padding");
      -[VUIButton minWidth](self, "minWidth");
      -[VUIButton padding](self, "padding");
      v12 = v11;
      -[VUIButton padding](self, "padding");
      v14 = imageMaxHeight + v12 + v13;
      -[VUIButton minHeight](self, "minHeight");
      if (v14 < v15)
        v14 = v15;
      goto LABEL_21;
    case 6uLL:
      if (-[VUIButton _hasImage](self, "_hasImage") && -[VUIButton _hasTitle](self, "_hasTitle"))
      {
        -[VUIButton textContentView](self, "textContentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sizeThatFits:", width, height);
        v18 = v17;

        -[VUIButton imageMargin](self, "imageMargin");
        v20 = imageMaxHeight + v19;
        -[VUIButton imageMargin](self, "imageMargin");
        if (v20 + v21 >= v18)
          imageMaxHeight = v20 + v21;
        else
          imageMaxHeight = v18;
        -[VUIButton imageMargin](self, "imageMargin");
        -[VUIButton textContentView](self, "textContentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "textLayout");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "margin");

      }
      else
      {
        if (-[VUIButton _hasImage](self, "_hasImage"))
        {
          imageMaxHeight = self->_imageMaxHeight;
          goto LABEL_20;
        }
LABEL_18:
        -[VUIButton textContentView](self, "textContentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sizeThatFits:", width, height);
        imageMaxHeight = v25;
      }

LABEL_20:
      -[VUIButton padding](self, "padding");
      -[VUIButton padding](self, "padding");
      -[VUIButton padding](self, "padding");
      v27 = v26;
      -[VUIButton padding](self, "padding");
      v14 = imageMaxHeight + v27 + v28;
LABEL_21:
      -[VUIButton height](self, "height");
      if (v29 > 0.0)
      {
        -[VUIButton height](self, "height");
        v14 = v30;
      }
      -[VUIButton width](self, "width");
      v32 = v31;
      -[VUIButton height](self, "height");
      v34 = v33;
      if (v32 <= 0.0 || v33 <= 0.0)
      {
        -[VUIButton minWidth](self, "minWidth");
        -[VUIButton minHeight](self, "minHeight");
        v45 = v35;
        -[VUIButton maxWidth](self, "maxWidth");
        -[VUIButton maxHeight](self, "maxHeight");
        v37 = v34;
        v38 = v34;
        if (v34 <= 0.0)
        {
          if (height > 0.0 && (height < v36 || v36 <= 0.0))
          {
            v34 = height;
            v37 = v45;
            v38 = height;
          }
          else
          {
            if (v36 <= 0.0)
              v34 = height;
            else
              v34 = v36;
            v37 = v45;
            v38 = v36;
          }
        }
        if (v14 >= v37)
        {
          if (v38 > 0.0 && v34 >= v38 || v34 <= 0.0)
            v41 = v38;
          else
            v41 = v34;
          if (v14 <= v41 || v41 <= 0.0)
            v34 = v14;
          else
            v34 = v41;
        }
        else
        {
          v34 = v37;
        }
      }
      VUICeilValue();
      v44 = v34;
      result.height = v44;
      result.width = v43;
      return result;
    case 8uLL:
      -[VUIButton _calculateContentSizeForCustomButtonThatFit:](self, "_calculateContentSizeForCustomButtonThatFit:", width, height);
      v14 = v24;
      goto LABEL_21;
    default:
      imageMaxHeight = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_20;
  }
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

void __26__VUIButton__updateBorder__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "vuiLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "vuiLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 0.0);

}

void __26__VUIButton__updateBorder__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vuiLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vuiLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vuiLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vuiLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  id v86;

  -[VUIButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[VUIButton padding](self, "padding");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);
  if (!-[VUIButton _hasTitle](self, "_hasTitle") && !-[VUIButton _hasImage](self, "_hasImage"))
  {
    -[VUIButton bounds](self, "bounds");
    v9 = v13;
    v12 = v14;
  }
  v83 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v85 = v83;
  v15 = v9;
  if (-[VUIButton _hasTitle](self, "_hasTitle"))
  {
    -[VUIButton textContentView](self, "textContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeThatFits:", v9, v12);

    v15 = v9;
    VUICeilValue();
    v85 = fmin(v9, v17);
  }
  if (-[VUIButton _hasSubtitle](self, "_hasSubtitle"))
  {
    -[VUIButton subtitleContentView](self, "subtitleContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeThatFits:", v15, v12);

    VUICeilValue();
    v83 = fmin(v15, v19);
  }
  VUIRoundValue();
  v84 = v12;
  if (-[VUIButton _hasImage](self, "_hasImage"))
  {
    if (v85 >= v83)
      v20 = v85;
    else
      v20 = v83;
    -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:", v15, v12);
    v22 = v21;
    -[VUIButton textContentView](self, "textContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "margin");
    v26 = v25;

    -[VUIButton imageMargin](self, "imageMargin");
    v28 = v22 + v26 + v27;
    if (v20 + v28 > v15)
    {
      VUIFloorValue();
      v30 = v29;
      if (-[VUIButton _hasTitle](self, "_hasTitle"))
      {
        -[VUIButton textContentView](self, "textContentView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sizeThatFits:", v30, v84);

      }
      if (-[VUIButton _hasSubtitle](self, "_hasSubtitle"))
      {
        -[VUIButton subtitleContentView](self, "subtitleContentView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sizeThatFits:", v30, v84);

      }
    }
    if (-[VUIButton _hasTitle](self, "_hasTitle"))
    {
      VUIRoundValue();
      if (-[VUIButton imageTrailsTextContent](self, "imageTrailsTextContent"))
        v33 = -0.0;
      else
        v33 = v28;
    }
    else
    {
      VUIRoundValue();
      VUIRoundValue();
    }
    -[VUIButton bounds](self, "bounds", v33);
    -[VUIButton vuiIsRTL](self, "vuiIsRTL");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    -[VUIButton imageView](self, "imageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

    v12 = v84;
  }
  if (-[VUIButton _hasTitle](self, "_hasTitle"))
  {
    -[VUIButton textContentView](self, "textContentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "textLayout");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "margin");

    -[VUIButton _hasSubtitle](self, "_hasSubtitle");
    -[VUIButton bounds](self, "bounds");
    -[VUIButton vuiIsRTL](self, "vuiIsRTL");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    -[VUIButton textContentView](self, "textContentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v46;
    v12 = v84;
    objc_msgSend(v53, "setFrame:", v54, v48, v50, v52);

    if (-[VUIButton _hasSubtitle](self, "_hasSubtitle"))
    {
      -[VUIButton bounds](self, "bounds");
      -[VUIButton vuiIsRTL](self, "vuiIsRTL");
      VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v62 = v61;
      -[VUIButton subtitleContentView](self, "subtitleContentView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v56;
      v12 = v84;
      objc_msgSend(v63, "setFrame:", v64, v58, v60, v62);

    }
  }
  if (-[VUIButton _hasBackgroundImage](self, "_hasBackgroundImage"))
  {
    -[VUIButton imageMaxWidth](self, "imageMaxWidth");
    v66 = v65;
    -[VUIButton imageMaxHeight](self, "imageMaxHeight");
    v68 = v67;
    if (v66 == *MEMORY[0x1E0C9D820] && v67 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[VUIButton backgroundImageView](self, "backgroundImageView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "vui_sizeThatFits:", v9, v12);
      v66 = v70;
      v68 = v71;

    }
    -[VUIButton _centerWithViewSize:withParentSize:](self, "_centerWithViewSize:withParentSize:", v66, v68, v9, v12);
    -[VUIButton bounds](self, "bounds");
    -[VUIButton vuiIsRTL](self, "vuiIsRTL");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v73 = v72;
    v75 = v74;
    v77 = v76;
    v79 = v78;
    -[VUIButton backgroundImageView](self, "backgroundImageView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);

  }
  if (-[VUIButton buttonType](self, "buttonType") == 5
    || -[VUIButton buttonShape](self, "buttonShape") == 2
    || -[VUIButton buttonShape](self, "buttonShape") == 1)
  {
    -[VUIButton frame](self, "frame");
    v82 = v81 * 0.5;
    -[VUIButton layer](self, "layer");
    v86 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setCornerRadius:", v82);

  }
}

- (BOOL)_hasTitle
{
  void *v2;
  BOOL v3;

  -[VUIButton textContentView](self, "textContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (VUILabel)textContentView
{
  return self->_textContentView;
}

- (void)_configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;

  -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", v3);

  -[VUIButton cornerRadius](self, "cornerRadius");
  -[VUIButton setCornerRadius:](self, "setCornerRadius:");
  -[VUIButton shadow](self, "shadow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIButton layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton shadow](self, "shadow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shadowOffset");
    objc_msgSend(v5, "setShadowOffset:");

    -[VUIButton layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton shadow](self, "shadow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shadowBlurRadius");
    objc_msgSend(v7, "setShadowRadius:");

    -[VUIButton layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton shadow](self, "shadow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shadowColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    -[VUIButton layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 0);

    -[VUIButton layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1.0;
    objc_msgSend(v13, "setShadowOpacity:", v14);

  }
  if (-[VUIButton buttonType](self, "buttonType") == 6
    || !-[VUIButton buttonType](self, "buttonType")
    || -[VUIButton buttonType](self, "buttonType") == 3)
  {
    v15 = 1;
LABEL_7:
    -[VUIButton _setPointerInteractionEnabled:](self, "_setPointerInteractionEnabled:", v15);
    goto LABEL_8;
  }
  if (!-[VUIButton usesSymbolPointerInteraction](self, "usesSymbolPointerInteraction"))
  {
    v15 = 0;
    goto LABEL_7;
  }
LABEL_8:
  if (-[VUIButton buttonType](self, "buttonType") == 3)
    -[VUIButton _setupBlurEffectBackdropView](self, "_setupBlurEffectBackdropView");
  if (-[VUIButton buttonType](self, "buttonType") == 6)
    -[VUIButton _setupBarButtonItem](self, "_setupBarButtonItem");
  -[VUIButton _updateBorder](self, "_updateBorder");
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "buttonBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setVuiBackgroundColor:", v1);

  if (objc_msgSend(WeakRetained, "buttonType") == 3)
    objc_msgSend(WeakRetained, "_setupBlurEffectBackdropView");
  objc_msgSend(WeakRetained, "_updateBorder");

}

- (double)width
{
  return self->_width;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  UIVisualEffectView *backdropView;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    -[VUIButton _computeSizeThatFits:](self, "_computeSizeThatFits:", a3.width, a3.height);
    width = v7;
    height = v8;
  }
  else
  {
    backdropView = self->_backdropView;
    if (backdropView)
    {
      -[VUIButton bounds](self, "bounds");
      -[UIVisualEffectView setFrame:](backdropView, "setFrame:");
      if (-[VUIButton buttonType](self, "buttonType") == 6)
      {
        -[VUIButton bounds](self, "bounds");
        v10 = CGRectGetHeight(v16) * 0.5;
        -[VUIButton setCornerRadius:](self, "setCornerRadius:", v10);
        -[VUIButton layer](self, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCornerRadius:", v10);

      }
    }
    -[VUIButton _updateLayout](self, "_updateLayout");
    -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", v12);

  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)usesSymbolPointerInteraction
{
  return self->_usesSymbolPointerInteraction;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  double result;
  objc_super v11;

  if (-[VUIButton buttonType](self, "buttonType") == 1
    && (-[VUIButton textContentView](self, "textContentView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    -[VUIButton textContentView](self, "textContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topMarginWithBaselineMargin:", a3);
    v9 = v8;

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIButton;
    -[UIView topMarginWithBaselineMargin:](&v11, sel_topMarginWithBaselineMargin_, a3);
  }
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIButton;
  -[VUIButton tintColorDidChange](&v3, sel_tintColorDidChange);
  if (-[VUIButton tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
  {
    -[VUIButton saturateTintColorAndBackgroundColor](self, "saturateTintColorAndBackgroundColor");
    self->_isTintColorAndBackgroundColorSaturated = 1;
  }
  else if (self->_isTintColorAndBackgroundColorSaturated)
  {
    -[VUIButton revertTintColor](self, "revertTintColor");
    self->_isTintColorAndBackgroundColorSaturated = 0;
  }
}

- (VUILabel)subtitleContentView
{
  return self->_subtitleContentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIButton vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setUberButtonType:(unint64_t)a3
{
  if (self->_uberButtonType != a3)
  {
    self->_uberButtonType = a3;
    if (self->_buttonType == 3)
      -[VUIButton _setupBlurEffectBackdropView](self, "_setupBlurEffectBackdropView");
  }
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIButton;
  -[VUIButton setTintColor:](&v7, sel_setTintColor_, v4);
  if (-[VUIButton tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
  {
    -[VUIButton setImageTintColor:](self, "setImageTintColor:", v4);
  }
  else
  {
    -[VUIButton textContentView](self, "textContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    -[VUILabel textLayout](self->_textContentView, "textLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v4);
    objc_msgSend(v6, "setDarkColor:", v4);
    -[VUIButton setImageTintColor:](self, "setImageTintColor:", v4);
    -[VUIImageView _setTintColor:](self->_imageView, "_setTintColor:", v4);

  }
}

- (void)setTextContentView:(id)a3
{
  unint64_t v5;
  VUILabel *v6;

  v6 = (VUILabel *)a3;
  -[VUIButton vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v6, self->_textContentView);
  if (self->_textContentView != v6)
    objc_storeStrong((id *)&self->_textContentView, a3);
  v5 = -[VUIButton buttonType](self, "buttonType");
  if (v5 == 6 || v5 == 1)
    -[VUILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](self->_textContentView, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
  -[VUIButton vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setSubtitleContentView:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIButton vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_subtitleContentView);
  if (self->_subtitleContentView != v5)
    objc_storeStrong((id *)&self->_subtitleContentView, a3);
  -[VUIButton vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setSelectActionHandler:(id)a3
{
  void *v4;
  id selectActionHandler;

  if (self->_selectActionHandler != a3)
  {
    v4 = _Block_copy(a3);
    selectActionHandler = self->_selectActionHandler;
    self->_selectActionHandler = v4;

  }
}

- (void)setScrolledNonUberPercentage:(double)a3
{
  id v4;

  if (a3 == 0.0)
  {
    -[UIVisualEffectView setHidden:](self->_backdropView, "setHidden:", 0);
    -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", 0);
  }
  else
  {
    -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", self->_buttonBackgroundColor);
    -[VUIButton backdropView](self, "backdropView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setImageView:(id)a3 forHighlightedState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v11 = v6;
  if (v4)
  {
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    -[VUIImageView bounds](self->_imagesViewDefaultState, "bounds");
    objc_msgSend(v11, "setBounds:", v8, v10);
    -[VUIButton setImagesViewHighlightedState:](self, "setImagesViewHighlightedState:", v11);
  }
  else
  {
    -[VUIButton setImageView:](self, "setImageView:", v6);
  }

}

- (void)setImageView:(id)a3
{
  VUIImageView *v5;
  UIImage *v6;
  UIImage *originalImage;
  VUIImageView *imagesViewDefaultState;

  v5 = (VUIImageView *)a3;
  -[VUIButton vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_imageView);
  if (self->_imageView != v5)
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    -[VUIImageView image](self->_imageView, "image");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    originalImage = self->_originalImage;
    self->_originalImage = v6;

  }
  -[VUIButton vui_setNeedsLayout](self, "vui_setNeedsLayout");
  imagesViewDefaultState = self->_imagesViewDefaultState;
  self->_imagesViewDefaultState = v5;

}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (void)setImageMaxWidth:(double)a3
{
  self->_imageMaxWidth = a3;
}

- (void)setImageMaxHeight:(double)a3
{
  self->_imageMaxHeight = a3;
}

- (void)setHasDisclaimerText:(BOOL)a3
{
  self->_hasDisclaimerText = a3;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIButton;
  -[VUIButton setEnabled:](&v7, sel_setEnabled_);
  -[VUIButton textContentView](self, "textContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[VUIButton subtitleContentView](self, "subtitleContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)setCornerRadius:(double)a3
{
  UIVisualEffectView *backdropView;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    backdropView = self->_backdropView;
    if (!backdropView)
      goto LABEL_5;
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](backdropView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, a3);
    -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v9)
      {
LABEL_5:
        -[VUIButton vuiLayer](self, "vuiLayer");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCornerRadius:", a3);

      }
    }
  }
}

- (void)setButtonType:(unint64_t)a3
{
  UIVisualEffectView *backdropView;

  if (self->_buttonType != a3)
  {
    if (!a3)
    {
      -[UIVisualEffectView removeFromSuperview](self->_backdropView, "removeFromSuperview");
      backdropView = self->_backdropView;
      self->_backdropView = 0;

    }
    self->_buttonType = a3;
    -[VUIButton _configure](self, "_configure");
  }
}

- (void)setButtonShape:(unint64_t)a3
{
  self->_buttonShape = a3;
}

- (void)setButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
  -[VUIButton _updateBorder](self, "_updateBorder");
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
  -[VUIButton _updateBorder](self, "_updateBorder");
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (double)minWidth
{
  return self->_minWidth;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIButton;
  -[VUIButton layoutSubviews](&v5, sel_layoutSubviews);
  -[VUIButton bounds](self, "bounds");
  -[VUIButton vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[VUIButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (VUIButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  VUIButton *v5;
  VUIButton *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VUIButton;
  v5 = -[VUIButton initWithFrame:](&v19, sel_initWithFrame_, a3, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_buttonType = a3;
    v5->_supportsLongPress = 0;
    -[VUIButton _configure](v5, "_configure");
    v6->_allowsUberTinting = 1;
    -[VUIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", v6, sel__buttonTapped_, 64);
    -[VUIButton setShowsLargeContentViewer:](v6, "setShowsLargeContentViewer:", 1);
    objc_initWeak(&location, v6);
    v22[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke;
    v16[3] = &unk_1E9F99F98;
    objc_copyWeak(&v17, &location);
    -[VUIButton vui_registerForTraitChanges:withHandler:](v6, "vui_registerForTraitChanges:withHandler:", v7, v16);

    v21 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke_2;
    v14[3] = &unk_1E9F99F98;
    objc_copyWeak(&v15, &location);
    -[VUIButton vui_registerForTraitChanges:withHandler:](v6, "vui_registerForTraitChanges:withHandler:", v9, v14);

    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __41__VUIButton_initWithType_interfaceStyle___block_invoke_3;
    v12[3] = &unk_1E9F99F98;
    objc_copyWeak(&v13, &location);
    -[VUIButton vui_registerForTraitChanges:withHandler:](v6, "vui_registerForTraitChanges:withHandler:", v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (UIEdgeInsets)imageMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageMargin.top;
  left = self->_imageMargin.left;
  bottom = self->_imageMargin.bottom;
  right = self->_imageMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)height
{
  return self->_height;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)buttonShape
{
  return self->_buttonShape;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)_updateBorder
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  UIColor *borderColor;
  UIColor *v7;
  double borderWidth;
  UIVisualEffectView *backdropView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__VUIButton__updateBorder__block_invoke;
  aBlock[3] = &unk_1E9F98DF0;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __26__VUIButton__updateBorder__block_invoke_2;
  v17[3] = &unk_1E9F98DF0;
  v17[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(v17);
  borderColor = self->_borderColor;
  if (!borderColor)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  if (borderColor == v7)
  {

    goto LABEL_7;
  }
  borderWidth = self->_borderWidth;

  if (borderWidth == 0.0)
  {
LABEL_7:
    v4[2](v4);
LABEL_8:
    v14 = v5;
    goto LABEL_9;
  }
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    -[VUIButton vuiLayer](self, "vuiLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

    -[VUIButton vuiLayer](self, "vuiLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderWidth:", self->_borderWidth);

    goto LABEL_8;
  }
  -[UIVisualEffectView vuiLayer](backdropView, "vuiLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

  -[UIVisualEffectView vuiLayer](self->_backdropView, "vuiLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderWidth:", self->_borderWidth);

  -[UIVisualEffectView vuiLayer](self->_backdropView, "vuiLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", self->_cornerRadius);

  -[UIVisualEffectView vuiLayer](self->_backdropView, "vuiLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  v14 = v4;
LABEL_9:
  ((void (*)(void))v14[2])();

}

- (void)_setupBarButtonItem
{
  uint64_t v3;
  UIVisualEffectView *backdropView;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
  v3 = objc_claimAutoreleasedReturnValue();
  backdropView = self->_backdropView;
  v6 = (id)v3;
  if (backdropView)
  {
    -[UIVisualEffectView setEffect:](backdropView, "setEffect:", v3);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v3);
    objc_msgSend(v5, "setEffect:", v6);
    -[VUIButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
    -[VUIButton setBackdropView:](self, "setBackdropView:", v5);
    -[UIVisualEffectView setHidden:](self->_backdropView, "setHidden:", 1);

  }
}

- (void)_setPointerInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  UIPointerInteraction *pointerInteraction;
  UIPointerInteraction *v6;
  UIPointerInteraction *v7;
  UIPointerInteraction *v8;

  v3 = a3;
  pointerInteraction = self->_pointerInteraction;
  if (v3)
  {
    if (!pointerInteraction)
    {
      v6 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
      v7 = self->_pointerInteraction;
      self->_pointerInteraction = v6;

      -[VUIButton addInteraction:](self, "addInteraction:", self->_pointerInteraction);
    }
  }
  else if (pointerInteraction)
  {
    -[VUIButton removeInteraction:](self, "removeInteraction:");
    v8 = self->_pointerInteraction;
    self->_pointerInteraction = 0;

  }
}

- (CGSize)_imageSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VUIButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)_hasSubtitle
{
  void *v2;
  BOOL v3;

  -[VUIButton subtitleContentView](self, "subtitleContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasImage
{
  void *v2;
  BOOL v3;

  -[VUIButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasBackgroundImage
{
  void *v2;
  BOOL v3;

  -[VUIButton backgroundImageView](self, "backgroundImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_backgroundImagesViewHighlightedState, 0);
  objc_storeStrong((id *)&self->_backgroundImagesViewDefaultState, 0);
  objc_storeStrong((id *)&self->_imagesViewHighlightedState, 0);
  objc_storeStrong((id *)&self->_imagesViewDefaultState, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, 0);
  objc_storeStrong(&self->_longPressActionHandler, 0);
  objc_storeStrong(&self->_selectActionHandler, 0);
  objc_storeStrong((id *)&self->_imageHighlightColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_selectionImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleContentView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

}

void __41__VUIButton_initWithType_interfaceStyle___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");

}

- (void)setUsesSymbolPointerInteraction:(BOOL)a3
{
  self->_usesSymbolPointerInteraction = a3;
  -[VUIButton _setPointerInteractionEnabled:](self, "_setPointerInteractionEnabled:");
}

- (void)applySelectionImage
{
  -[VUIButton _crossFadeButtonImageTo:](self, "_crossFadeButtonImageTo:", self->_selectionImage);
}

- (void)restoreOriginalImage
{
  -[VUIButton _crossFadeButtonImageTo:](self, "_crossFadeButtonImageTo:", self->_originalImage);
}

- (void)setBackgroundImageView:(id)a3
{
  UIView *v5;
  UIView *backgroundImageView;
  void *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  backgroundImageView = self->_backgroundImageView;
  v9 = v5;
  if (backgroundImageView != v5)
  {
    -[UIView removeFromSuperview](backgroundImageView, "removeFromSuperview");
    -[VUIButton subviews](self, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIButton vui_insertSubview:belowSubview:oldView:](self, "vui_insertSubview:belowSubview:oldView:", v9, v8, self->_backgroundImageView);
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    objc_storeStrong((id *)&self->_backgroundImagesViewDefaultState, a3);

  }
}

- (void)setBackgroundImage:(id)a3 forHighlightedState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v11 = v6;
  if (v4)
  {
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    -[VUIImageView bounds](self->_backgroundImagesViewDefaultState, "bounds");
    objc_msgSend(v11, "setBounds:", v8, v10);
    -[VUIButton setBackgroundImagesViewHighlightedState:](self, "setBackgroundImagesViewHighlightedState:", v11);
  }
  else
  {
    -[VUIButton setBackgroundImageView:](self, "setBackgroundImageView:", v6);
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIButton;
  -[VUIButton setHighlighted:](&v18, sel_setHighlighted_);
  if ((-[VUIButton isHidden](self, "isHidden") & 1) == 0)
  {
    -[VUIButton alpha](self, "alpha");
    if (v5 != 0.0)
    {
      v6 = -[VUIButton buttonType](self, "buttonType") == 6;
      if (v3)
      {
        if (v6)
        {
          if (-[VUIButton buttonType](self, "buttonType") == 6)
            -[VUIButton setAlpha:](self, "setAlpha:", 0.5);
        }
        else
        {
          -[VUIButton highlightColor](self, "highlightColor");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", v7);

        }
        if (self->_imagesViewHighlightedState)
          -[VUIButton setImageView:](self, "setImageView:");
        v8 = 744;
      }
      else
      {
        if (v6)
        {
          if (-[VUIButton buttonType](self, "buttonType") == 6)
            -[VUIButton setAlpha:](self, "setAlpha:", 1.0);
        }
        else
        {
          -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIButton setVuiBackgroundColor:](self, "setVuiBackgroundColor:", v9);

        }
        if (self->_imagesViewDefaultState)
          -[VUIButton setImageView:](self, "setImageView:");
        v8 = 736;
      }
      if (*(Class *)((char *)&self->super.super.super.super.isa + v8))
        -[VUIButton setBackgroundImageView:](self, "setBackgroundImageView:");
      -[VUIButton textContentView](self, "textContentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHighlighted:", v3);

      if (!-[VUIButton buttonType](self, "buttonType") || -[VUIButton buttonType](self, "buttonType") == 3)
      {
        -[VUIButton imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "vui_setSelected:animated:withAnimationCoordinator:", v3, 0, 0);

      }
      if (self->_backdropView)
      {
        -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_27;
        v13 = (void *)v12;
        -[VUIButton buttonBackgroundColor](self, "buttonBackgroundColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v15)
        {
LABEL_27:
          -[VUIButton layer](self, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0.0;
          if (v3)
            -[VUIButton cornerRadius](self, "cornerRadius", 0.0);
          objc_msgSend(v16, "setCornerRadius:", v17);

        }
      }
    }
  }
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_backdropGroupName != v5)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    -[UIVisualEffectView _setGroupName:](self->_backdropView, "_setGroupName:", v5);
  }

}

- (void)setSupportsLongPress:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_supportsLongPress != a3)
  {
    v3 = a3;
    self->_supportsLongPress = a3;
    -[VUIButton _removeLongPressGestureIfNeeded](self, "_removeLongPressGestureIfNeeded");
    if (v3)
      -[VUIButton _addLongPressGesture](self, "_addLongPressGesture");
  }
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_highlightColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    v5 = v6;
  }

}

- (double)vuiBaselineHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[VUIButton textContentView](self, "textContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[VUIButton _computeSizeThatFits:](self, "_computeSizeThatFits:", *MEMORY[0x1E0C9D820], v6);
    v8 = v7;
    objc_msgSend(v3, "vui_sizeThatFits:", v5, v6);
    v10 = (v8 - v9) * 0.5;
    objc_msgSend(v3, "vuiBaselineHeight");
    v4 = v11 + v10;
  }

  return v4;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v6 = a3;
  if (-[VUIButton buttonType](self, "buttonType") == 1
    && (-[VUIButton textContentView](self, "textContentView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    -[VUIButton textContentView](self, "textContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topMarginToLabel:withBaselineMargin:", v6, a4);
    v11 = v10;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIButton;
    -[UIView topMarginWithBaselineMargin:](&v14, sel_topMarginWithBaselineMargin_, a4);
    v11 = v12;
  }

  return v11;
}

- (double)vui_baselineOffsetFromBottom
{
  void *v3;
  char isKindOfClass;
  void *v5;
  double v6;
  double v7;

  if (-[VUIButton buttonType](self, "buttonType") != 1)
    return 0.0;
  -[VUIButton textContentView](self, "textContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0.0;
  -[VUIButton textContentView](self, "textContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_baselineOffsetFromBottom");
  v7 = v6;

  return v7;
}

- (void)vui_prepareForReuse
{
  -[VUIImageView setImage:](self->_imageView, "setImage:", 0);
  -[VUILabel setVuiText:](self->_textContentView, "setVuiText:", 0);
}

- (void)saturateTintColorAndBackgroundColor
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIButton imageTintColor](self, "imageTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[VUIImageView _setTintColor:](self->_imageView, "_setTintColor:", v4);
  -[VUILabel setTextColor:](self->_textContentView, "setTextColor:", v4);

}

- (void)revertTintColor
{
  void *v3;

  if (self->_imageView)
  {
    -[VUIButton imageTintColor](self, "imageTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageView _setTintColor:](self->_imageView, "_setTintColor:", v3);

  }
  -[VUILabel revertTintColor](self->_textContentView, "revertTintColor");
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  double result;
  objc_super v11;

  if (-[VUIButton buttonType](self, "buttonType") == 1
    && (-[VUIButton textContentView](self, "textContentView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    -[VUIButton textContentView](self, "textContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomMarginWithBaselineMargin:", a3);
    v9 = v8;

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIButton;
    -[UIView bottomMarginWithBaselineMargin:](&v11, sel_bottomMarginWithBaselineMargin_, a3);
  }
  return result;
}

- (void)_crossFadeButtonImageTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (v4)
  {
    -[VUIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      objc_initWeak(&location, self);
      -[VUIButton imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __37__VUIButton__crossFadeButtonImageTo___block_invoke;
      v9[3] = &unk_1E9F9A938;
      objc_copyWeak(&v11, &location);
      v10 = v4;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v9, 0, 0.200000003);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

}

void __37__VUIButton__crossFadeButtonImageTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

}

- (CGSize)_calculateContentSizeForCustomButtonThatFit:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[VUIButton _hasImage](self, "_hasImage") && -[VUIButton _hasTitle](self, "_hasTitle"))
  {
    -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
    v7 = v6;
    v9 = v8;
    v10 = width - v6;
    -[VUIButton textContentView](self, "textContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", v10, height);
    v13 = v12;
    v15 = v14;

    if (v9 >= v15)
      v15 = v9;
    -[VUIButton imageMargin](self, "imageMargin");
    v17 = v7 + v16;
    -[VUIButton textContentView](self, "textContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "margin");
    v21 = v13 + v17 + v20;

    goto LABEL_9;
  }
  if (!-[VUIButton _hasImage](self, "_hasImage"))
  {
    -[VUIButton textContentView](self, "textContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeThatFits:", width, height);
    v21 = v24;
    v15 = v25;
LABEL_9:

    v22 = v21;
    v23 = v15;
    goto LABEL_10;
  }
  -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
LABEL_10:
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)_calculateContentSizeForPrimaryButtonThatFit:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[VUIButton _hasImage](self, "_hasImage") && -[VUIButton _hasTitle](self, "_hasTitle"))
  {
    -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
    v7 = v6;
    v9 = v8;
    -[VUIButton textContentView](self, "textContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "margin");
    v13 = v12;

    -[VUIButton imageMargin](self, "imageMargin");
    v15 = width - v7 - v13 - v14;
    -[VUIButton textContentView](self, "textContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeThatFits:", v15, height);
    v18 = v17;
    v20 = v19;

    if (v9 >= v20)
      v20 = v9;
    -[VUIButton imageMargin](self, "imageMargin");
    v22 = v7 + v21;
    -[VUIButton textContentView](self, "textContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "margin");
    v26 = v18 + v22 + v25;

    goto LABEL_9;
  }
  if (!-[VUIButton _hasImage](self, "_hasImage"))
  {
    -[VUIButton textContentView](self, "textContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeThatFits:", width, height);
    v26 = v29;
    v20 = v30;
LABEL_9:

    v27 = v26;
    v28 = v20;
    goto LABEL_10;
  }
  -[VUIButton _calculateContentSizeForImageThatFit:](self, "_calculateContentSizeForImageThatFit:", width, height);
LABEL_10:
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)_calculateContentSizeForImageThatFit:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[VUIButton _imageSizeThatFits:](self, "_imageSizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[VUIButton imageMargin](self, "imageMargin");
  v9 = v7 + v8;
  -[VUIButton imageMargin](self, "imageMargin");
  v11 = v9 + v10;
  v12 = v5;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)_addLongPressGesture
{
  id v3;

  if (-[VUIButton supportsLongPress](self, "supportsLongPress"))
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_buttonLongPressed_);
    objc_msgSend(v3, "setNumberOfTouchesRequired:", 1);
    -[VUIButton addGestureRecognizer:](self, "addGestureRecognizer:", v3);
    -[VUIButton setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v3);

  }
}

- (void)_removeLongPressGestureIfNeeded
{
  void *v3;
  void *v4;

  -[VUIButton longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIButton longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIButton removeGestureRecognizer:](self, "removeGestureRecognizer:", v4);

    -[VUIButton setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", 0);
  }
}

- (void)buttonLongPressed:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 1)
  {
    -[VUIButton longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4 != v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    -[VUIButton longPressActionHandler](self, "longPressActionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIButton longPressActionHandler](self, "longPressActionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, VUIButton *))v4)[2](v4, self);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  void (**v5)(id, VUIButton *);

  -[VUIButton selectActionHandler](self, "selectActionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIButton selectActionHandler](self, "selectActionHandler");
    v5 = (void (**)(id, VUIButton *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  VUIButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  VUIButton *v13;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  if ((-[VUIButton isHidden](self, "isHidden", a4) & 1) != 0 || (-[VUIButton alpha](self, "alpha"), v7 == 0.0))
  {
    v8 = 0;
  }
  else
  {
    -[VUIButton bounds](self, "bounds");
    v10 = fmax(44.0 - v9, 0.0);
    v12 = fmax(44.0 - v11, 0.0);
    -[VUIButton bounds](self, "bounds");
    v17 = CGRectInset(v16, v10 * -0.5, v12 * -0.5);
    v15.x = x;
    v15.y = y;
    if (CGRectContainsPoint(v17, v15))
      v13 = self;
    else
      v13 = 0;
    v8 = v13;
  }
  return v8;
}

- (CGPoint)_centerWithViewSize:(CGSize)a3 withParentSize:(CGSize)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = (a4.width - a3.width) * 0.5;
  v5 = (a4.height - a3.height) * 0.5;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_setupBlurEffectBackdropView
{
  id v3;
  void *v4;
  unint64_t uberButtonType;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIVisualEffectView *v9;
  void *v10;
  void *v11;
  UIVisualEffectView *backdropView;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_backdropView)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    -[VUIButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v3, 0);
    -[VUIButton layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMasksToBounds:", 1);

    -[VUIButton setBackdropView:](self, "setBackdropView:", v3);
  }
  uberButtonType = self->_uberButtonType;
  if (uberButtonType == 1)
  {
    -[UIVisualEffectView setAllowsBlurring:](self->_backdropView, "setAllowsBlurring:", 1);
    backdropView = self->_backdropView;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 50.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](backdropView, "setBackgroundEffects:", v13);

  }
  else
  {
    if (uberButtonType)
      return;
    -[UIVisualEffectView setAllowsBlurring:](self->_backdropView, "setAllowsBlurring:", 0);
    -[VUIButton traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    if (v7 == 2)
      v8 = 14;
    else
      v8 = 19;
    v9 = self->_backdropView;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v9, "setBackgroundEffects:", v11);
  }

}

- (CGRect)_barButtonPointerShapeRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;

  -[VUIButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIButton padding](self, "padding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (-[VUIButton _hasImage](self, "_hasImage") && !-[VUIButton _hasTitle](self, "_hasTitle")
    || -[VUIButton _hasImage](self, "_hasImage") && !-[VUIButton _hasTitle](self, "_hasTitle"))
  {
    v8 = v8 - v14 - v18;
    v10 = v10 - v12 - v16;
    v4 = v14;
    v6 = v12;
  }
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  return CGRectInset(v19, -6.0, -6.0);
}

- (CGRect)_symbolButtonPointerShapeRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[VUIButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6 * 1.4;
  v10 = v8 * 1.4;
  -[VUIButton bounds](self, "bounds");
  v12 = (v11 - v9) * 0.5;
  -[VUIButton bounds](self, "bounds");
  v14 = (v13 - v10) * 0.5 + (v9 - v10) * -0.5;
  if (v9 > v10)
    v15 = v9;
  else
    v15 = v10;
  if (v9 > v10)
  {
    v16 = v12;
  }
  else
  {
    v14 = (v13 - v10) * 0.5;
    v16 = v12 + (v10 - v9) * -0.5;
  }
  v17 = v15;
  result.size.height = v17;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v16;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[VUIButton buttonType](self, "buttonType") == 6)
    {
      -[VUIButton _barButtonPointerShapeRect](self, "_barButtonPointerShapeRect");
      v6 = (void *)MEMORY[0x1E0DC3508];
    }
    else
    {
      if (!-[VUIButton usesSymbolPointerInteraction](self, "usesSymbolPointerInteraction"))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v5);
        objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[VUIButton _symbolButtonPointerShapeRect](self, "_symbolButtonPointerShapeRect");
      v6 = (void *)MEMORY[0x1E0DC3508];
    }
    objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(v9, "setVisiblePath:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v5, v9);
    objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (id)largeContentTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIButton accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[VUIButton accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIButton textContentView](self, "textContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIButton textContentView](self, "textContentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)largeContentImage
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  void *v7;

  -[VUIButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[VUIButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      return v7;
    }
    -[VUIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (BOOL)allowsUberTinting
{
  return self->_allowsUberTinting;
}

- (void)setAllowsUberTinting:(BOOL)a3
{
  self->_allowsUberTinting = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)hasDisclaimerText
{
  return self->_hasDisclaimerText;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (unint64_t)uberButtonType
{
  return self->_uberButtonType;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (UIImage)selectionImage
{
  return self->_selectionImage;
}

- (void)setSelectionImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectionImage, a3);
}

- (double)imageMaxWidth
{
  return self->_imageMaxWidth;
}

- (double)imageMaxHeight
{
  return self->_imageMaxHeight;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIColor)imageHighlightColor
{
  return self->_imageHighlightColor;
}

- (void)setImageHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageHighlightColor, a3);
}

- (void)setImageMargin:(UIEdgeInsets)a3
{
  self->_imageMargin = a3;
}

- (BOOL)imageTrailsTextContent
{
  return self->_imageTrailsTextContent;
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
  self->_imageTrailsTextContent = a3;
}

- (id)selectActionHandler
{
  return self->_selectActionHandler;
}

- (BOOL)supportsLongPress
{
  return self->_supportsLongPress;
}

- (id)longPressActionHandler
{
  return self->_longPressActionHandler;
}

- (void)setLongPressActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (UIColor)adjustmentModeNormalTintColor
{
  return self->_adjustmentModeNormalTintColor;
}

- (void)setAdjustmentModeNormalTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, a3);
}

- (BOOL)isTintColorAndBackgroundColorSaturated
{
  return self->_isTintColorAndBackgroundColorSaturated;
}

- (void)setIsTintColorAndBackgroundColorSaturated:(BOOL)a3
{
  self->_isTintColorAndBackgroundColorSaturated = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (VUIImageView)imagesViewDefaultState
{
  return self->_imagesViewDefaultState;
}

- (void)setImagesViewDefaultState:(id)a3
{
  objc_storeStrong((id *)&self->_imagesViewDefaultState, a3);
}

- (VUIImageView)imagesViewHighlightedState
{
  return self->_imagesViewHighlightedState;
}

- (void)setImagesViewHighlightedState:(id)a3
{
  objc_storeStrong((id *)&self->_imagesViewHighlightedState, a3);
}

- (VUIImageView)backgroundImagesViewDefaultState
{
  return self->_backgroundImagesViewDefaultState;
}

- (void)setBackgroundImagesViewDefaultState:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImagesViewDefaultState, a3);
}

- (VUIImageView)backgroundImagesViewHighlightedState
{
  return self->_backgroundImagesViewHighlightedState;
}

- (void)setBackgroundImagesViewHighlightedState:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImagesViewHighlightedState, a3);
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

@end
