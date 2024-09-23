@implementation TVViewFactory

+ (id)imageURLWithDescription:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;

  v3 = a3;
  if (imageURLWithDescription__onceToken != -1)
    dispatch_once(&imageURLWithDescription__onceToken, &__block_literal_global_35);
  objc_msgSend(v3, "imageSize");
  v5 = round(v4 * *(double *)&imageURLWithDescription__sPointMultiplier);
  objc_msgSend(v3, "imageSize");
  v7 = round(v6 * *(double *)&imageURLWithDescription__sPointMultiplier);
  if (objc_msgSend(v3, "centerGrowth"))
  {
    objc_msgSend(v3, "focusSizeIncrease");
    v9 = v7 + v8 * *(double *)&imageURLWithDescription__sPointMultiplier;
  }
  else
  {
    v10 = v7;
    v11 = v5 / v10;
    objc_msgSend(v3, "focusSizeIncrease");
    v12 = v5 <= v7;
    v14 = v7 + v13 * *(double *)&imageURLWithDescription__sPointMultiplier;
    v15 = ceil(v11 * v14);
    v16 = v5 + v13 * *(double *)&imageURLWithDescription__sPointMultiplier;
    v17 = ceil(v16 / v11);
    if (v5 > v7)
      v9 = v17;
    else
      v9 = v14;
    if (v12)
      v5 = v15;
    else
      v5 = v16;
  }
  objc_msgSend(v3, "url");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = vcvtpd_s64_f64(v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = vcvtpd_s64_f64(v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cropCode");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = &stru_24EB8B108;
  objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "urlFormat");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = (const __CFString *)v31;
  else
    v33 = &stru_24EB8B108;
  objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __41__TVViewFactory_imageURLWithDescription___block_invoke()
{
  void *v0;
  double v1;
  BOOL v2;
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayScale");
  v2 = v1 == 2.0;
  v3 = 1.5;
  if (!v2)
    v3 = 2.0;
  imageURLWithDescription__sPointMultiplier = *(_QWORD *)&v3;

}

+ (id)imageProxyWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  TVImageProxy *v6;
  void *v7;
  TVImageProxy *v8;
  TVImageProxy *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "tv_isAppIconURL"))
  {
    if (objc_msgSend(v4, "tv_imageURLType") != 1)
    {
      v9 = [TVImageProxy alloc];
      +[TVURLImageLoader sharedInstance](TVURLImageLoader, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TVImageProxy initWithObject:imageLoader:groupType:](v9, "initWithObject:imageLoader:groupType:", v4, v10, 0);

      -[TVImageProxy setCacheOnLoad:](v8, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [TVImageProxy alloc];
  +[_TVAppIconImageLoader sharedInstance](_TVAppIconImageLoader, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TVImageProxy initWithObject:imageLoader:groupType:](v6, "initWithObject:imageLoader:groupType:", v5, v7, 0);

  -[TVImageProxy setCacheOnLoad:](v8, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
LABEL_7:

  return v8;
}

+ (CGSize)decorateImageProxy:(id)a3 forLayout:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  TVImageScaleDecorator *v27;
  __objc2_class *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  _TVTintedImageDecorator *v39;
  CGSize result;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "decoratorSize");
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  v11 = v5;
  objc_msgSend(v6, "imageTreatment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "padding");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v6, "allowsNonOpaqueShadows");
  objc_msgSend(v6, "focusSizeIncrease");
  v23 = v22;
  objc_msgSend(v6, "borderRadii");
  +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:");
  v25 = v24;
  v26 = objc_msgSend(v6, "scaleMode");
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("postcard")))
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("16x9")))
    {
      v28 = _TVImage16x9Decorator;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("keyframeArt")))
      {
        objc_msgSend(v6, "tintColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          v27 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v8, v10);
          goto LABEL_10;
        }
        v39 = [_TVTintedImageDecorator alloc];
        objc_msgSend(v6, "ikTintColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[_TVTintedImageDecorator initWithTintColor:](v39, "initWithTintColor:", v30);
        goto LABEL_9;
      }
      v28 = _TVImageKeyFrameArtDecorator;
    }
    v29 = [v28 alloc];
    objc_msgSend(v6, "inlineTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithInlineTitle:", v30);
LABEL_9:
    v27 = (TVImageScaleDecorator *)v31;

    goto LABEL_10;
  }
  v8 = v8 + v16 + v20;
  v10 = v10 + v14 + v18;
  v27 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v8, v10);
  v26 = 2;
LABEL_10:
  -[TVImageScaleDecorator setCenterGrowth:](v27, "setCenterGrowth:", objc_msgSend(v6, "centerGrowth"));
  -[TVImageScaleDecorator setScaleToSize:](v27, "setScaleToSize:", v8, v10);
  -[TVImageScaleDecorator setPadding:](v27, "setPadding:", v14, v16, v18, v20);
  -[TVImageScaleDecorator setScaleMode:](v27, "setScaleMode:", v26);
  -[TVImageScaleDecorator setFocusedSizeIncrease:](v27, "setFocusedSizeIncrease:", v23);
  if (((v21 & 1) != 0
     || !+[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread"))&& (objc_msgSend(v6, "centerGrowth") & 1) == 0)
  {
    +[TVCornerUtilities radiiFromRadius:](TVCornerUtilities, "radiiFromRadius:", v25);
    -[TVImageScaleDecorator setCornerRadii:](v27, "setCornerRadii:");
  }
  if (v26 == 2)
  {
    objc_msgSend(v6, "backgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVImageScaleDecorator setBgColor:](v27, "setBgColor:", v32);

  }
  objc_msgSend(v11, "decorator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    objc_msgSend(v11, "setDecorator:", v27);
  objc_msgSend(v11, "expectedSize");
  v8 = v34;
  v10 = v35;

LABEL_19:
  v36 = v8;
  v37 = v10;
  result.height = v37;
  result.width = v36;
  return result;
}

+ (id)imageStackViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "configureForMetrics");
  objc_msgSend(v8, "decoratorSize");
  if (v10 >= 0.00000011920929 && v9 >= 0.00000011920929)
  {
    objc_msgSend(v7, "imageProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decorateImageProxy:forLayout:", v12, v8);

    objc_msgSend(0, "tv_setLayout:", v8);
  }

  return 0;
}

+ (id)imageViewWithDescription:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  TVImageScaleDecorator *v46;
  TVImageScaleDecorator *v47;
  _TVTintedImageDecorator *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _TVImageView *v54;
  _TVImageView *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _TVImage16x9Decorator *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "imageProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highlightColor");
  v84 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decoratorSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "padding");
  v17 = v16;
  v19 = v18;
  v82 = v21;
  v83 = v20;
  objc_msgSend(v8, "focusSizeIncrease");
  v81 = v22;
  objc_msgSend(v8, "borderRadii");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = objc_msgSend(v8, "continuousBorder");
  v32 = objc_msgSend(v8, "scaleMode");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  v76 = v19;
  v77 = v17;
  v78 = v30;
  v79 = v28;
  v33 = v15;
  v34 = v26;
  v35 = v24;
  v80 = v11;
  objc_msgSend(v8, "borderColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "borderWidth");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  objc_msgSend(v8, "imageTreatment");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isInBackgroundOrBanner"))
  {
    v46 = objc_alloc_init(TVImageScaleDecorator);
LABEL_14:
    v47 = v46;
    v24 = v35;
    v26 = v34;
    v15 = v33;
    goto LABEL_15;
  }
  if (v36
    && (v40 != *(double *)(MEMORY[0x24BDF7718] + 8)
     || v38 != *MEMORY[0x24BDF7718]
     || v44 != *(double *)(MEMORY[0x24BDF7718] + 24)
     || v42 != *(double *)(MEMORY[0x24BDF7718] + 16)))
  {
    +[TVImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](TVImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v36, v38, v40, v42, v44);
    v46 = (TVImageScaleDecorator *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v45, "isEqualToString:", CFSTR("postcard")))
  {
    v13 = v13 + v76 + v82;
    v15 = v33 + v77 + v83;
    v47 = -[TVImageScaleDecorator initWithScaleToSize:]([TVImageScaleDecorator alloc], "initWithScaleToSize:", v13, v15);
    v32 = 2;
    v24 = v35;
    v26 = v34;
LABEL_15:
    v30 = v78;
    v28 = v79;
    goto LABEL_16;
  }
  v24 = v35;
  v26 = v34;
  v15 = v33;
  v30 = v78;
  v28 = v79;
  if (objc_msgSend(v7, "hasGradient"))
  {
    v48 = [_TVTintedImageDecorator alloc];
    objc_msgSend(v8, "ikTintColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[_TVTintedImageDecorator initWithTintColor:](v48, "initWithTintColor:", v49);
  }
  else
  {
    if (!objc_msgSend(v45, "isEqualToString:", CFSTR("16x9")))
    {
      v47 = objc_alloc_init(TVImageScaleDecorator);
      goto LABEL_16;
    }
    v75 = [_TVImage16x9Decorator alloc];
    objc_msgSend(v8, "inlineTitle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[_TVImage16x9Decorator initWithInlineTitle:](v75, "initWithInlineTitle:", v49);
  }
  v47 = (TVImageScaleDecorator *)v50;

LABEL_16:
  if (v47)
  {
    -[TVImageScaleDecorator setScaleToSize:](v47, "setScaleToSize:", v13, v15);
    -[TVImageScaleDecorator setPadding:](v47, "setPadding:", v77, v76, v83, v82);
    -[TVImageScaleDecorator setFocusedSizeIncrease:](v47, "setFocusedSizeIncrease:", v81);
    -[TVImageScaleDecorator setScaleMode:](v47, "setScaleMode:", v32);
    -[TVImageScaleDecorator setCornerRadii:](v47, "setCornerRadii:", v24, v26, v28, v30);
    -[TVImageScaleDecorator setCornerContinuous:](v47, "setCornerContinuous:", v31);
    if (v32 == 2)
    {
      objc_msgSend(v8, "backgroundColor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVImageScaleDecorator setBgColor:](v47, "setBgColor:", v51);

    }
    objc_msgSend(v10, "decorator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
      objc_msgSend(v10, "setDecorator:", v47);
  }

  v11 = v80;
LABEL_22:
  if (v13 == *MEMORY[0x24BDBF148] && v15 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v55 = 0;
    v56 = (void *)v84;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54 = (_TVImageView *)v9;
    else
      v54 = objc_alloc_init(_TVImageView);
    v55 = v54;
    -[_TVImageView setSemanticContentAttribute:](v54, "setSemanticContentAttribute:", objc_msgSend(v7, "semanticContentAttribute"));
    objc_msgSend(v7, "accessibilityText");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "length");

    if (v58)
    {
      objc_msgSend(v7, "accessibilityText");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView tv_setAccessibilityText:](v55, "tv_setAccessibilityText:", v59);

    }
    objc_msgSend(v7, "siriData");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tv_setSiriData:](v55, "tv_setSiriData:", v60);

    -[_TVImageView setBounds:](v55, "setBounds:", 0.0, 0.0, v13, v15);
    if ((objc_msgSend(v7, "configureForMetrics") & 1) == 0)
    {
      v61 = v11;
      -[_TVImageView setImageProxy:](v55, "setImageProxy:", v10);
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v24, v26, v28, v30);
      -[_TVImageView setCornerRadius:](v55, "setCornerRadius:");
      -[_TVImageView setImageContainsCornerRadius:](v55, "setImageContainsCornerRadius:", 1);
      objc_msgSend(v7, "placeholderImage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVImageView setPlaceholderImage:](v55, "setPlaceholderImage:", v62);

      objc_msgSend(v8, "shadow");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVImageView layer](v55, "layer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v64;
      if (v63)
      {
        objc_msgSend(v64, "setShadowPath:", +[TVMLUtilities shadowPathWithCornerRadii:andScaledSize:](TVMLUtilities, "shadowPathWithCornerRadii:andScaledSize:", v24, v26, v28, v30, v13, v15));

        -[_TVImageView layer](v55, "layer");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "shadowOffset");
        objc_msgSend(v67, "setShadowOffset:");

        -[_TVImageView layer](v55, "layer");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "shadowBlurRadius");
        objc_msgSend(v68, "setShadowRadius:");

        -[_TVImageView layer](v55, "layer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "shadowColor");
        v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v69, "setShadowColor:", objc_msgSend(v70, "CGColor"));

        -[_TVImageView layer](v55, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v64;
        LODWORD(v65) = 1.0;
      }
      else
      {
        LODWORD(v65) = 0;
      }
      objc_msgSend(v64, "setShadowOpacity:", v65);

      v11 = v61;
    }
    if (v32 == 3)
      v71 = 2;
    else
      v71 = 1;
    -[_TVImageView setContentMode:](v55, "setContentMode:", v71);
    -[_TVImageView setContentsPosition:](v55, "setContentsPosition:", 2);
    -[_TVImageView _setTintColor:](v55, "_setTintColor:", v11);
    objc_msgSend(v8, "darkTintColor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVImageView _setDarkTintColor:](v55, "_setDarkTintColor:", v72);

    v56 = (void *)v84;
    -[_TVImageView _setFocusedColor:](v55, "_setFocusedColor:", v84);
    objc_msgSend(v8, "imageSymbolConfiguration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVImageView _setPreferredSymbolConfiguration:](v55, "_setPreferredSymbolConfiguration:", v73);

    -[UIView tv_setLayout:](v55, "tv_setLayout:", v8);
  }

  return v55;
}

@end
