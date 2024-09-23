@implementation VUIImageFactory

+ (id)makeImageProxyWithDescriptor:(id)a3
{
  void *v3;
  void *v4;

  +[VUIImageFactory URLFromDescriptor:](VUIImageFactory, "URLFromDescriptor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[VUIImageFactory _imageProxyWithURL:](VUIImageFactory, "_imageProxyWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_imageProxyWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VUIImageProxy *v6;
  void *v7;
  VUIImageProxy *v8;
  VUIImageProxy *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "vuicore_isAppIconURL"))
  {
    if (objc_msgSend(v4, "vuicore_imageURLType") != 1)
    {
      v9 = [VUIImageProxy alloc];
      +[VUIURLImageLoader sharedInstance](VUIURLImageLoader, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[VUIImageProxy initWithObject:imageLoader:groupType:](v9, "initWithObject:imageLoader:groupType:", v4, v10, 0);

      -[VUIImageProxy setCacheOnLoad:](v8, "setCacheOnLoad:", +[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread") ^ 1);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [VUIImageProxy alloc];
  +[VUIAppIconImageLoader sharedInstance](VUIAppIconImageLoader, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIImageProxy initWithObject:imageLoader:groupType:](v6, "initWithObject:imageLoader:groupType:", v5, v7, 0);

  -[VUIImageProxy setCacheOnLoad:](v8, "setCacheOnLoad:", +[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread") ^ 1);
LABEL_7:

  return v8;
}

+ (id)URLFromSource:(id)a3 extension:(id)a4 p3Specifier:(id)a5 cropCode:(id)a6 imageSize:(CGSize)a7 displayScaleIsPointMultiplier:(BOOL)a8 centerGrowth:(BOOL)a9 focusSizeIncrease:(double)a10
{
  _BOOL4 v11;
  double height;
  double width;
  id v19;
  __CFString *v20;
  id v21;
  __CFString *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;

  v11 = a9;
  height = a7.height;
  width = a7.width;
  v19 = a3;
  v20 = (__CFString *)a4;
  v21 = a5;
  v22 = (__CFString *)a6;
  if (URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__onceToken == -1)
  {
    if (a8)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "vui_scale");
      v25 = v24;

      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__onceToken, &__block_literal_global_8);
    if (a8)
      goto LABEL_3;
  }
  v25 = *(double *)&URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__sPointMultiplier;
LABEL_6:
  v26 = fabs(round(width * v25));
  v27 = round(height * v25);
  v28 = fabs(v27);
  if (v11)
  {
    v29 = v28 + a10 * v25;
  }
  else
  {
    v30 = v27;
    v31 = round(v26 / fabsf(v30) * 100.0) / 100.0;
    if (v26 <= v28)
    {
      v29 = v28 + a10 * v25;
      v26 = round(v29 * v31);
    }
    else
    {
      v26 = v26 + a10 * v25;
      v29 = round(v26 / v31);
    }
  }
  v32 = (void *)MEMORY[0x1E0CB3500];
  v33 = v19;
  objc_msgSend(v32, "whitespaceAndNewlineCharacterSet");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringByTrimmingCharactersInSet:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v36) = vcvtpd_s64_f64(v26);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v39) = vcvtpd_s64_f64(v29);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v42 = v22;
  else
    v42 = &stru_1E9F2D140;
  objc_msgSend(v41, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v44 = v20;
  else
    v44 = &stru_1E9F2D140;
  objc_msgSend(v43, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_makeSourceStringFromSource:p3Specifier:", v45, v21);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (id)_makeSourceStringFromSource:(id)a3 p3Specifier:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (-[__CFString length](v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "vui_main");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "vui_canRepresentDisplayGamutP3");

    v9 = &stru_1E9F2D140;
    if (v8)
    {
      if (v6)
        v10 = v6;
      else
        v10 = &stru_1E9F2D140;
      v9 = v10;
    }
  }
  else
  {
    v9 = &stru_1E9F2D140;
  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{p3}"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_makeImageViewWithDescriptor:(id)a3 proxy:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  VUIImageView *v10;
  void *v11;
  void *v12;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  VUIImageScaleDecorator *v30;
  VUIImageScaleDecorator *v31;
  void *v32;
  void *v33;
  VUIImageView *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  VUIImageView *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  uint64_t v59;
  void *v61;
  void *v62;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingSize");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "borderRadii");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v7, "scaleMode");
    v26 = objc_msgSend(v7, "optimizedImageRendering");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "borderColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "borderWidth");
      v29 = v28;
      if (objc_msgSend(v7, "decoratorType") == 1 || (v26 & 1) != 0 || !v27 || v29 <= 0.0)
      {
        v30 = objc_alloc_init(VUIImageScaleDecorator);
      }
      else
      {
        +[VUIImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](VUIImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v27, v29, v29, v29, v29);
        v30 = (VUIImageScaleDecorator *)objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;
      if (v30)
      {
        -[VUIImageScaleDecorator setScaleToSize:](v30, "setScaleToSize:", v14, v16);
        -[VUIImageScaleDecorator setScaleMode:](v31, "setScaleMode:", v25);
        if ((v26 & 1) == 0)
        {
          -[VUIImageScaleDecorator setCornerRadii:](v31, "setCornerRadii:", v18, v20, v22, v24);
          -[VUIImageScaleDecorator setCornerContinuous:](v31, "setCornerContinuous:", objc_msgSend(v7, "continuousBorder"));
        }
        if (v25 == 2)
        {
          objc_msgSend(v7, "backgroundColor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIImageScaleDecorator setBgColor:](v31, "setBgColor:", v32);

        }
        objc_msgSend(v8, "decorator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          objc_msgSend(v8, "setDecorator:", v31);
          objc_msgSend(v8, "setOptimizedImageRendering:", v26);
        }
      }

    }
    if (v14 == *MEMORY[0x1E0C9D820] && v16 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v10 = 0;
LABEL_52:

      goto LABEL_53;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = (VUIImageView *)v9;
    else
      v35 = objc_alloc_init(VUIImageView);
    v10 = v35;
    objc_msgSend(v7, "accessibilityText", v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");

    if (v37)
    {
      objc_msgSend(v7, "accessibilityText");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView vui_setAccessibilityText:](v10, "vui_setAccessibilityText:", v38);

      -[UIView vui_isAccessibilityElement:](v10, "vui_isAccessibilityElement:", 1);
    }
    if ((objc_msgSend(v7, "sizeComputationOnly") & 1) == 0)
      -[VUIImageView setBounds:](v10, "setBounds:", 0.0, 0.0, v14, v16);
    if ((objc_msgSend(v7, "sizeComputationOnly") & 1) == 0)
      -[VUIImageView setImageProxy:clearingExisting:completion:](v10, "setImageProxy:clearingExisting:completion:", v8, objc_msgSend(v7, "clearsExisting"), 0);
    if ((_DWORD)v26)
    {
      +[VUICoreUtilities radiusFromCornerRadii:](VUICoreUtilities, "radiusFromCornerRadii:", v18, v20, v22, v24);
      -[VUIImageView setCornerRadius:](v10, "setCornerRadius:");
      objc_msgSend(v7, "borderColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageView setBorderColor:](v10, "setBorderColor:", v39);

      objc_msgSend(v7, "borderWidth");
      -[VUIImageView setBorderWidth:](v10, "setBorderWidth:");
      if (objc_msgSend(v7, "scaleMode") == 1)
      {
        v40 = v10;
        v41 = 1;
LABEL_38:
        -[VUIImageView setVuiContentMode:](v40, "setVuiContentMode:", v41);
        goto LABEL_39;
      }
      if (objc_msgSend(v7, "scaleMode") == 3)
      {
        v40 = v10;
        v41 = 2;
        goto LABEL_38;
      }
    }
    else
    {
      -[VUIImageView setImageContainsCornerRadius:](v10, "setImageContainsCornerRadius:", 1);
    }
LABEL_39:
    objc_msgSend(v7, "placeholderSrc");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeholderColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v12;
    v44 = v25;
    if (v43)
    {
      -[VUIImageView setPlaceholderColor:](v10, "setPlaceholderColor:", v43);
    }
    else if (objc_msgSend(v42, "length"))
    {
      objc_msgSend(v7, "accessibilityText");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUICoreUtilities imageForResource:accessibilityDescription:](VUICoreUtilities, "imageForResource:accessibilityDescription:", v42, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIImageView setPlaceholderImage:](v10, "setPlaceholderImage:", v46);
    }
    objc_msgSend(v7, "shadow");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      -[VUIImageView setImageContainsShadow:](v10, "setImageContainsShadow:", 1);
      -[VUIImageView setAnimatesShadowChanges:](v10, "setAnimatesShadowChanges:", objc_msgSend(v7, "animatesShadowChanges"));
      -[VUIImageView setShadowRadii:](v10, "setShadowRadii:", v18, v20, v22, v24);
      -[VUIImageView layer](v10, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setMasksToBounds:", 0);

      -[VUIImageView layer](v10, "layer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "containerSize");
      objc_msgSend(v49, "setShadowPath:", +[VUICoreUtilities shadowPathWithCornerRadii:andScaledSize:](VUICoreUtilities, "shadowPathWithCornerRadii:andScaledSize:", v18, v20, v22, v24, v50, v51));

      -[VUIImageView layer](v10, "layer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "shadowOffset");
      objc_msgSend(v52, "setShadowOffset:");

      -[VUIImageView layer](v10, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "shadowBlurRadius");
      objc_msgSend(v53, "setShadowRadius:");

      -[VUIImageView layer](v10, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "shadowColor");
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v54, "setShadowColor:", objc_msgSend(v55, "CGColor"));

      -[VUIImageView layer](v10, "layer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      LODWORD(v58) = 1.0;
    }
    else
    {
      -[VUIImageView setImageContainsShadow:](v10, "setImageContainsShadow:", 0);
      -[VUIImageView setAnimatesShadowChanges:](v10, "setAnimatesShadowChanges:", 0);
      -[VUIImageView setShadowRadii:](v10, "setShadowRadii:", 0.0, 0.0, 0.0, 0.0);
      -[VUIImageView layer](v10, "layer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      LODWORD(v58) = 0;
    }
    objc_msgSend(v56, "setShadowOpacity:", v58);
    v11 = v61;

    if (v44 == 3)
      v59 = 2;
    else
      v59 = 1;
    -[VUIImageView setVuiContentMode:](v10, "setVuiContentMode:", v59);
    -[VUIImageView setContentsPosition:](v10, "setContentsPosition:", 2);
    -[VUIImageView _setTintColor:](v10, "_setTintColor:", v61);
    v12 = v62;
    -[VUIImageView _setFocusedColor:](v10, "_setFocusedColor:", v62);
    if (objc_msgSend(v7, "loadsImmediately"))
      -[VUIImageView _loadImage](v10, "_loadImage");

    goto LABEL_52;
  }
  v10 = 0;
LABEL_53:

  return v10;
}

void __135__VUIImageFactory_URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease___block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "vui_scale");
  v2 = v1;

  v3 = 2.0;
  if (v2 == 2.0)
    v3 = 1.5;
  URLFromSource_extension_p3Specifier_cropCode_imageSize_displayScaleIsPointMultiplier_centerGrowth_focusSizeIncrease__sPointMultiplier = *(_QWORD *)&v3;
}

+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "type");
  +[VUIImageFactory _getResourceImageFromDescriptor:](VUIImageFactory, "_getResourceImageFromDescriptor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;
  v11 = v7 == 1;
  v12 = v7 == 1;
  v13 = !v11;
  objc_msgSend(v9, "setImage:", v8);
  objc_msgSend(v10, "setSymbolImage:", v13);
  objc_msgSend(v10, "setResourceImage:", v12);
  objc_msgSend(v5, "size");
  objc_msgSend(v10, "setResourceOrSymbolSize:");
  objc_msgSend(v5, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setTintColor:", v14);

  objc_msgSend(v5, "highlightColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setFocusedColor:", v15);

  objc_msgSend(v5, "borderRadii");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (!+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:"))
  {
    +[VUICoreUtilities radiusFromCornerRadii:](VUICoreUtilities, "radiusFromCornerRadii:", v17, v19, v21, v23);
    objc_msgSend(v10, "setCornerRadius:");
  }
  if (objc_msgSend(v5, "scaleMode") == 1)
  {
    v24 = 1;
LABEL_15:
    objc_msgSend(v10, "setVuiContentMode:", v24);
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "scaleMode") == 3)
  {
    v24 = 2;
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v5, "accessibilityText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
  {
    objc_msgSend(v10, "vui_setAccessibilityText:", v25);
    objc_msgSend(v10, "vui_isAccessibilityElement:", 1);
  }

LABEL_19:
  return v10;
}

+ (id)makeImageViewWithDescriptor:(id)a3 imageProxy:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = v8;
    if (!v10)
    {
      +[VUIImageFactory makeImageProxyWithDescriptor:](VUIImageFactory, "makeImageProxyWithDescriptor:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[VUIImageFactory _makeImageViewWithDescriptor:proxy:existingView:](VUIImageFactory, "_makeImageViewWithDescriptor:proxy:existingView:", v7, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)makeImageViewWithDescriptor:(id)a3 existingView:(id)a4
{
  return (id)objc_msgSend(a1, "makeImageViewWithDescriptor:imageProxy:existingView:", a3, 0, a4);
}

+ (id)_getResourceImageFromDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && objc_msgSend(v4, "length"))
  {
    if (!objc_msgSend(v3, "type"))
    {
      v9 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v3, "symbolConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessibilityText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", v5, v7, v10);
      v8 = objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(v3, "accessibilityText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUICoreUtilities imageForResource:accessibilityDescription:](VUICoreUtilities, "imageForResource:accessibilityDescription:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "shouldRenderAsTemplate"))
    {
      objc_msgSend(v7, "vuiTemplateImage");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:

      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)URLFromDescriptor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v13;
  double v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "src");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "src");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "p3Specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cropCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadSize");
    if (v11 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      objc_msgSend(v3, "boundingSize");
    else
      objc_msgSend(v3, "downloadSize");
    +[VUIImageFactory URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:](VUIImageFactory, "URLFromSource:extension:p3Specifier:cropCode:imageSize:displayScaleIsPointMultiplier:centerGrowth:focusSizeIncrease:", v6, v7, v8, v9, objc_msgSend(v3, "displayScaleIsPointMultiplier"), 0, v13, v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)makeImageWithImage:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;
  objc_msgSend(v7, "setImage:", v5);

  return v8;
}

@end
