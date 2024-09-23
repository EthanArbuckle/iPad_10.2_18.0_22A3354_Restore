@implementation VUIImageView

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[VUIImageView bounds](self, "bounds");
  -[VUIImageView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (void)_loadImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  VUIImageProxy *imageProxy;
  id v8;
  VUIImageProxy *v9;
  id *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id from;
  id location;

  -[VUIImageView bounds](self, "bounds");
  -[VUIImageView _imageProxyWithSize:sizeComputationOnly:](self, "_imageProxyWithSize:sizeComputationOnly:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", self->_imageProxy) & 1) == 0)
    objc_storeStrong((id *)&self->_imageProxy, v6);
  imageProxy = self->_imageProxy;
  v8 = objc_initWeak(&location, imageProxy);

  if (imageProxy)
  {
    -[VUIImageProxy setCacheOnLoad:](self->_imageProxy, "setCacheOnLoad:", +[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread") ^ 1);
    objc_initWeak(&from, self);
    v9 = self->_imageProxy;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __26__VUIImageView__loadImage__block_invoke;
    v16[3] = &unk_1E9F2B728;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    -[VUIImageProxy setCompletionHandler:](v9, "setCompletionHandler:", v16);
    -[VUIImageProxy setImageDirection:](self->_imageProxy, "setImageDirection:", -[UIView vuiIsRTL](self, "vuiIsRTL"));
    -[VUIImageProxy load](self->_imageProxy, "load");
    objc_destroyWeak(&v18);
    v10 = &v17;
  }
  else
  {
    -[VUIImageView completion](self, "completion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_7;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[VUIImageView completion](self, "completion");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, 0, 1);

      -[VUIImageView setCompletion:](self, "setCompletion:", 0);
      -[VUIImageView setImageLoaded:](self, "setImageLoaded:", 0);
      goto LABEL_7;
    }
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __26__VUIImageView__loadImage__block_invoke_2;
    v13[3] = &unk_1E9F2B750;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v13);
    objc_destroyWeak(&v15);
    v10 = &v14;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&from);
LABEL_7:
  objc_destroyWeak(&location);

}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (VUIImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (id)completion
{
  return self->_completion;
}

- (void)setFrame:(CGRect)a3
{
  UIImageView *imageView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIImageView;
  -[VUIImageView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  imageView = self->_imageView;
  -[VUIImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
  -[VUIImageView computeCornerRadii](self, "computeCornerRadii");
}

- (void)computeCornerRadii
{
  double v3;

  if (self->__imageShape == 1)
  {
    -[VUIImageView frame](self, "frame");
    -[VUIImageView setCornerRadius:](self, "setCornerRadius:", v3 * 0.22);
  }
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  VUIImageProxy *v27;
  double v28;
  double v29;
  BOOL v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UIImageView *imageView;
  double v39;
  double v40;
  void (**v43)(void);
  double v44;
  double v45;
  CGPath *v46;
  double v47;
  double v48;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[VUIImageView resourceOrSymbolSize](self, "resourceOrSymbolSize");
  v9 = v8;
  v11 = v10;
  if (!-[VUIImageView isResourceImage](self, "isResourceImage"))
  {
    -[VUIImageView isSymbolImage](self, "isSymbolImage");
LABEL_20:
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (width == *MEMORY[0x1E0C9D820] && height == v18)
    {
      v27 = self->_imageProxy;
    }
    else
    {
      -[VUIImageView _imageProxyWithSize:sizeComputationOnly:](self, "_imageProxyWithSize:sizeComputationOnly:", v4, width, height);
      v27 = (VUIImageProxy *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v27;
    -[VUIImageProxy expectedSize](v27, "expectedSize");
    v30 = v28 == v17 && v29 == v18;
    if (v30
      && ((-[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height), v28 == v17)
        ? (v31 = v29 == v18)
        : (v31 = 0),
          v31))
    {
      -[VUIImageView bounds](self, "bounds");
      v14 = v32;
      v16 = v33;
    }
    else
    {
      v14 = v28;
      v16 = v29;
    }
    goto LABEL_37;
  }
  if (v9 <= 0.0 || v11 <= 0.0)
    goto LABEL_20;
  -[VUIImageView image](self, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v17 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v21 = (v16 != v18 || v14 != v17) && v14 < v9 && v16 < v11;
  if (!v21 || !-[VUIImageView isResourceImage](self, "isResourceImage"))
  {
    v16 = v11;
    v14 = v9;
  }
  if (-[VUIImageView shouldScaleToSize](self, "shouldScaleToSize"))
  {
    -[UIView vuiTraitCollection](self, "vuiTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUICoreUtilities scaleContentSizeValue:forTraitCollection:](VUICoreUtilities, "scaleContentSizeValue:forTraitCollection:", v22, v14);
    v14 = v23;

    -[UIView vuiTraitCollection](self, "vuiTraitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUICoreUtilities scaleContentSizeValue:forTraitCollection:](VUICoreUtilities, "scaleContentSizeValue:forTraitCollection:", v24, v16);
    v16 = v25;
LABEL_37:

  }
  if (!v4)
  {
    -[VUIImageView bounds](self, "bounds");
    v35 = v34;
    v37 = v36;
    imageView = self->_imageView;
    -[VUIImageView bounds](self, "bounds");
    -[UIImageView setFrame:](imageView, "setFrame:");
    if (self->_imageContainsShadow)
    {
      v39 = self->_previousSize.width;
      v40 = self->_previousSize.height;
      if ((v39 != v17 || v40 != v18) && (v35 != v39 || v37 != v40))
      {
        if (self->_shadowPathUpdater)
        {
          -[VUIImageView shadowPathUpdater](self, "shadowPathUpdater");
          v43 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v43[2]();
        }
        else
        {
          -[VUIImageView bounds](self, "bounds");
          v46 = +[VUICoreUtilities shadowPathWithCornerRadii:andScaledSize:](VUICoreUtilities, "shadowPathWithCornerRadii:andScaledSize:", self->_shadowRadii.topLeft, self->_shadowRadii.topRight, self->_shadowRadii.bottomLeft, self->_shadowRadii.bottomRight, v44, v45);
          -[VUIImageView layer](self, "layer");
          v43 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setShadowPath:", v46);
        }

      }
    }
    self->_previousSize.width = v35;
    self->_previousSize.height = v37;
    -[VUIImageView computeCornerRadii](self, "computeCornerRadii");
  }
  v47 = v14;
  v48 = v16;
  result.height = v48;
  result.width = v47;
  return result;
}

- (CGSize)resourceOrSymbolSize
{
  double width;
  double height;
  CGSize result;

  width = self->_resourceOrSymbolSize.width;
  height = self->_resourceOrSymbolSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isSymbolImage
{
  return self->_symbolImage;
}

- (BOOL)isResourceImage
{
  return self->_resourceImage;
}

- (void)_updateCornerRadius
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v9;
  id v10;

  if (!self->_continuousCorners)
  {
    if (!self->_imageContainsCornerRadius || (v3 = 0.0, !self->_image))
    {
      -[VUIImageView cornerRadius](self, "cornerRadius");
      v3 = v4;
    }
    -[UIImageView layer](self->_imageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", v3);

    v6 = -[UIImageView vuiContentMode](self->_imageView, "vuiContentMode");
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v9 = v3 > 0.0 || v6 != 1;
    objc_msgSend(v7, "setMasksToBounds:", v9);

  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[VUIImageView setVuiContentMode:](self, "setVuiContentMode:", self->_imageContentMode);
  -[VUIImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:", v5);

}

- (void)setVuiContentMode:(unint64_t)a3
{
  if (self->_imageContentMode != a3)
  {
    self->_imageContentMode = a3;
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", VUIUIViewContentModeFromVUIContentMode(a3));
    -[VUIImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)_updateFlatImageWithImage:(id)a3
{
  id v4;
  _BOOL4 rendersImageAsTemplates;
  void *v6;
  id v7;

  v4 = a3;
  rendersImageAsTemplates = self->_rendersImageAsTemplates;
  v7 = v4;
  if (self->_rendersImageAsTemplates)
  {
    objc_msgSend(v4, "vuiTemplateImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_storeStrong((id *)&self->_flatImage, v4);
  if (rendersImageAsTemplates)

  -[VUIImageView _updateImageView](self, "_updateImageView");
}

- (void)_updateImageView
{
  UIColor *focusedColor;
  UIColor *v4;
  UIImage *placeholderImage;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  unint64_t imageContentMode;
  double v11;
  double v12;
  uint64_t v14;

  if (self->_image)
  {
    if (self->_selected && (focusedColor = self->__focusedColor) != 0 || (focusedColor = self->__tintColor) != 0)
    {
      v4 = focusedColor;
      -[UIImageView setVuiTintColor:](self->_imageView, "setVuiTintColor:", v4);
    }
    else
    {
      v4 = 0;
    }
    -[VUIImageView setVuiBackgroundColor:](self, "setVuiBackgroundColor:", 0);
    -[UIImageView setImage:](self->_imageView, "setImage:", self->_flatImage);
    goto LABEL_10;
  }
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  if (!self->_placeholderColor)
  {
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
      goto LABEL_11;
    v4 = placeholderImage;
    -[UIColor imageAsset](v4, "imageAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && -[UIColor imageOrientation](v4, "imageOrientation") == 4)
    {
      v7 = -[UIView vuiIsRTL](self, "vuiIsRTL");

      if (!v7)
      {
LABEL_18:
        -[UIImageView setImage:](self->_imageView, "setImage:", v4);
        imageContentMode = self->_imageContentMode;
        -[UIImage size](self->_placeholderImage, "size");
        if (v12 == 1.0 && v11 == 1.0)
          v14 = 2;
        else
          v14 = imageContentMode;
        -[UIImageView setVuiContentMode:](self->_imageView, "setVuiContentMode:", v14);
LABEL_10:

        goto LABEL_11;
      }
      -[UIColor imageAsset](v4, "imageAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithLayoutDirection:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithTraitCollection:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (UIColor *)v9;
    }

    goto LABEL_18;
  }
  -[VUIImageView setVuiBackgroundColor:](self, "setVuiBackgroundColor:");
LABEL_11:
  -[VUIImageView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)setVuiBackgroundColor:(id)a3
{
  -[UIImageView setVuiBackgroundColor:](self->_imageView, "setVuiBackgroundColor:", a3);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_animatesShadowChanges || (objc_msgSend(v7, "isEqualToString:", CFSTR("shadowPath")) & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)VUIImageView;
    -[VUIImageView actionForLayer:forKey:](&v17, sel_actionForLayer_forKey_, v6, v8);
LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "shadowPath");
  if (!v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIImageView;
    -[VUIImageView actionForLayer:forKey:](&v16, sel_actionForLayer_forKey_, v6, v8);
    goto LABEL_8;
  }
  v10 = v9;
  objc_msgSend(v6, "animationForKey:", CFSTR("bounds.size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v12, "setKeyPath:", CFSTR("shadowPath"));
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setFromPath:", v10);
    objc_msgSend(v13, "setAnimationToRun:", v12);
    objc_msgSend(v13, "setKey:", CFSTR("shadowPath"));

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VUIImageView;
    -[VUIImageView actionForLayer:forKey:](&v15, sel_actionForLayer_forKey_, v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v13;
}

void __26__VUIImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    objc_msgSend(v7, "setEnableCache:", 1);
    objc_msgSend(v7, "uiImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      VUICDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __26__VUIImageView__loadImage__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v8, v11);

    }
    v10 = 0;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __26__VUIImageView__loadImage__block_invoke_21;
  v16[3] = &unk_1E9F2B700;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v12 = WeakRetained;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v21 = a4;
  v14 = v8;
  v19 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x1DF08E588](v16);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v15[2](v15);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  objc_destroyWeak(&v20);
}

- (void)setImageProxy:(id)a3 clearingExisting:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  VUIImageProxy **p_imageProxy;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  _BOOL8 v14;
  _BOOL4 v15;
  BOOL v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  VUIImageProxy *v25;

  v6 = a4;
  v25 = (VUIImageProxy *)a3;
  v9 = a5;
  p_imageProxy = &self->_imageProxy;
  if (self->_imageProxy != v25 || self->_completion != v9)
  {
    -[VUIImageView window](self, "window");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = -[UIView vuiIsRTL](self, "vuiIsRTL");

      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    -[VUIImageProxy setImageDirection:](v25, "setImageDirection:", v14);
    v15 = -[VUIImageProxy isEqual:](v25, "isEqual:", *p_imageProxy);
    v16 = -[VUIImageView isImageLoaded](self, "isImageLoaded");
    if (v15)
    {
      if (!v16)
      {
        -[VUIImageView completion](self, "completion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[VUIImageView completion](self, "completion");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[VUIImageView image](self, "image");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD, _QWORD))v18)[2](v18, v19, 0, 0);

        }
      }
      -[VUIImageView setCompletion:](self, "setCompletion:", v9);
      if (-[VUIImageView isImageLoaded](self, "isImageLoaded"))
      {
        -[VUIImageView completion](self, "completion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[VUIImageView completion](self, "completion");
          v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[VUIImageView image](self, "image");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD, uint64_t))v21)[2](v21, v22, 0, 1);

          -[VUIImageView setCompletion:](self, "setCompletion:", 0);
        }
      }
    }
    else
    {
      if (!v16)
        -[VUIImageProxy cancel](*p_imageProxy, "cancel");
      -[VUIImageView setImageLoaded:](self, "setImageLoaded:", 0);
      if (!-[VUIImageProxy isOfSameOriginAs:](*p_imageProxy, "isOfSameOriginAs:", v25) && v6)
        -[VUIImageView _setImage:](self, "_setImage:", 0);
      -[VUIImageView setCompletion:](self, "setCompletion:", v9);
      objc_storeStrong((id *)&self->_imageProxy, a3);
      -[VUIImageView window](self, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        -[VUIImageView _loadImage](self, "_loadImage");
    }
  }
  -[VUIImageProxy object](v25, "object");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_storeStrong((id *)&self->_latestImageURL, v24);

}

void __30__VUIImageView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTintColor");

}

- (void)setSymbolImage:(id)a3 withSymbolTransition:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[VUIImageView setImageProxy:](self, "setImageProxy:", 0);
  -[UIImageView setSymbolImage:withContentTransition:](self->_imageView, "setSymbolImage:withContentTransition:", v7, v6);

  -[VUIImageView _setImage:](self, "_setImage:", v7);
}

- (void)vui_willMoveToWindow:(id)a3
{
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIImageView;
  -[UIView vui_willMoveToWindow:](&v6, sel_vui_willMoveToWindow_);
  v5 = -[VUIImageView isImageLoaded](self, "isImageLoaded");
  if (a3)
  {
    if (!v5)
      -[VUIImageView _loadImage](self, "_loadImage");
  }
  else if (!v5)
  {
    -[VUIImageProxy cancel](self->_imageProxy, "cancel");
  }
}

- (unint64_t)vuiContentMode
{
  return self->_imageContentMode;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIImageView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSymbolImage:(BOOL)a3
{
  self->_symbolImage = a3;
}

- (void)setShadowRadii:(_VUICornerRadii)a3
{
  self->_shadowRadii = a3;
}

- (void)setResourceOrSymbolSize:(CGSize)a3
{
  self->_resourceOrSymbolSize = a3;
}

- (void)setResourceImage:(BOOL)a3
{
  self->_resourceImage = a3;
}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[VUIImageView _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_placeholderColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    -[VUIImageView _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setImageProxy:(id)a3
{
  -[VUIImageView setImageProxy:completion:](self, "setImageProxy:completion:", a3, 0);
}

- (void)setImageContainsShadow:(BOOL)a3
{
  self->_imageContainsShadow = a3;
}

- (void)setImageContainsCornerRadius:(BOOL)a3
{
  if (self->_imageContainsCornerRadius != a3)
  {
    self->_imageContainsCornerRadius = a3;
    -[VUIImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setImage:(id)a3
{
  id v4;

  v4 = a3;
  -[VUIImageView setImageProxy:](self, "setImageProxy:", 0);
  -[VUIImageView _setImage:](self, "_setImage:", v4);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[VUIImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    -[UIImageView layer](self->_imageView, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBorderWidth:", a3);

  }
}

- (void)setBorderColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_borderColor != v6)
  {
    objc_storeStrong((id *)&self->_borderColor, a3);
    -[UIImageView layer](self->_imageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderColor:", -[UIColor CGColor](objc_retainAutorelease(v6), "CGColor"));

  }
}

- (void)setAnimatesShadowChanges:(BOOL)a3
{
  self->_animatesShadowChanges = a3;
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (VUIImageView)initWithFrame:(CGRect)a3
{
  VUIImageView *v3;
  VUIImageView *v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VUIImageView;
  v3 = -[VUIImageView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageContentMode = 1;
    v5 = (void *)MEMORY[0x1E0CEA658];
    -[VUIImageView bounds](v3, "bounds");
    objc_msgSend(v5, "vui_imageViewWithFrame:");
    v6 = objc_claimAutoreleasedReturnValue();
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    -[UIImageView setVuiClipsToBounds:](v4->_imageView, "setVuiClipsToBounds:", 1);
    -[UIImageView setVuiContentMode:](v4->_imageView, "setVuiContentMode:", v4->_imageContentMode);
    v4->_previousSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[UIView vui_addSubview:oldView:](v4, "vui_addSubview:oldView:", v4->_imageView, 0);
    objc_initWeak(&location, v4);
    v14[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __30__VUIImageView_initWithFrame___block_invoke;
    v10[3] = &unk_1E9F2B6D8;
    objc_copyWeak(&v11, &location);
    -[UIView vui_registerForTraitChanges:withHandler:](v4, "vui_registerForTraitChanges:withHandler:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)dealloc
{
  objc_super v3;

  -[VUIImageProxy setCompletionHandler:](self->_imageProxy, "setCompletionHandler:", 0);
  -[VUIImageProxy cancel](self->_imageProxy, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)VUIImageView;
  -[VUIImageView dealloc](&v3, sel_dealloc);
}

- (void)_updateTintColor
{
  UIColor *focusedColor;
  UIColor *v4;
  UIColor *v5;

  if (self->_selected && (focusedColor = self->__focusedColor) != 0 || (focusedColor = self->__tintColor) != 0)
    v4 = focusedColor;
  else
    v4 = 0;
  v5 = v4;
  -[UIImageView setVuiTintColor:](self->_imageView, "setVuiTintColor:", v4);
  self->_rendersImageAsTemplates = v5 != 0;
  if (self->_image)
    -[VUIImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:");

}

- (void)_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__tintColor, a3);
  -[VUIImageView _updateTintColor](self, "_updateTintColor");
}

- (void)_setFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->__focusedColor, a3);
  -[VUIImageView _updateImageView](self, "_updateImageView");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->_dynamicProxyProvider, 0);
  objc_storeStrong((id *)&self->_latestImageURL, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong(&self->_shadowPathUpdater, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_flatHighlightImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
  objc_storeStrong((id *)&self->__focusedColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
  -[VUIImageView setImageProxy:clearingExisting:completion:](self, "setImageProxy:clearingExisting:completion:", a3, 1, a4);
}

- (id)vuiBackgroundColor
{
  return (id)-[UIImageView vuiBackgroundColor](self->_imageView, "vuiBackgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  -[UIImageView setVuiBackgroundColor:](self->_imageView, "setVuiBackgroundColor:", a3);
}

- (id)backgroundColor
{
  return (id)-[UIImageView vuiBackgroundColor](self->_imageView, "vuiBackgroundColor");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;

  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:");
  -[UIImageView layer](self->_imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", a3 > 0.0);

  self->_continuousCorners = a3 > 0.0;
}

- (double)_continuousCornerRadius
{
  double result;

  result = 0.0;
  if (self->_continuousCorners)
    return 1.0;
  return result;
}

- (void)_setContentRectInPixels:(CGRect)a3 forContentSize:(CGSize)a4
{
  -[UIImageView _setContentRectInPixels:forContentSize:](self->_imageView, "_setContentRectInPixels:forContentSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
}

- (void)_resetContentRect
{
  -[UIImageView _resetContentRect](self->_imageView, "_resetContentRect");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIImageView;
  -[VUIImageView setHighlighted:](&v5, sel_setHighlighted_);
  -[VUIImageView vui_setHighlighted:](self, "vui_setHighlighted:", v3);
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  CAFilter *highlightFilter;
  BOOL v6;
  void *v7;
  void *v8;
  CAFilter *v9;
  CAFilter *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a3;
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:");
  highlightFilter = self->_highlightFilter;
  if (self->__focusedColor)
    v6 = !v3;
  else
    v6 = 1;
  if (v6)
  {
    if (!highlightFilter)
      return;
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v21, "removeObjectIdenticalTo:", self->_highlightFilter);
LABEL_16:
    -[UIImageView layer](self->_imageView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v19, "setFilters:", v20);

    return;
  }
  if (!highlightFilter)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v9 = (CAFilter *)objc_claimAutoreleasedReturnValue();
    v10 = self->_highlightFilter;
    self->_highlightFilter = v9;

    -[CAFilter setValue:forKey:](self->_highlightFilter, "setValue:forKey:", -[UIColor CGColor](self->__focusedColor, "CGColor"), CFSTR("inputColor"));
  }
  -[UIImageView layer](self->_imageView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", self->_highlightFilter);

  if ((v13 & 1) == 0)
  {
    -[UIImageView layer](self->_imageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v21 = v18;

    objc_msgSend(v21, "addObject:", self->_highlightFilter);
    goto LABEL_16;
  }
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a3;
  self->_selected = a3;
  -[VUIImageView _updateImageView](self, "_updateImageView");
  if (-[VUIImageView _enableEdgeAntialiasingOnSelected](self, "_enableEdgeAntialiasingOnSelected"))
  {
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsEdgeAntialiasing:", v5);

    -[UIImageView layer](self->_imageView, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEdgeAntialiasingMask:", 3);

  }
}

- (id)_imageProxyWithSize:(CGSize)a3 sizeComputationOnly:(BOOL)a4
{
  void (**dynamicProxyProvider)(id, BOOL, __n128, __n128);
  VUIImageProxy *v6;

  dynamicProxyProvider = (void (**)(id, BOOL, __n128, __n128))self->_dynamicProxyProvider;
  if (dynamicProxyProvider)
  {
    dynamicProxyProvider[2](dynamicProxyProvider, a4, (__n128)a3, *(__n128 *)&a3.height);
    v6 = (VUIImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_imageProxy;
  }
  return v6;
}

- (void)_reloadImageForLayoutDirectionChange
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  -[VUIImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[UIView vuiIsRTL](self, "vuiIsRTL");
    -[VUIImageView imageProxy](self, "imageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "imageDirection");

    if (v6 != v4)
      -[VUIImageView _loadImage](self, "_loadImage");
  }
  else
  {
    -[VUIImageView setImageLoaded:](self, "setImageLoaded:", 0);
  }
}

void __26__VUIImageView__loadImage__block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "imageProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

    WeakRetained = v8;
    if (v4)
    {
      if (*(_QWORD *)(a1 + 40) && *(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v8, "_setImage:");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:", CFSTR("VUIImageViewImageDidLoadNotification"), v8);

      }
      objc_msgSend(v8, "setImageLoaded:", *(unsigned __int8 *)(a1 + 64));
      objc_msgSend(v8, "completion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v8;
      if (v6)
      {
        objc_msgSend(v8, "completion");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

        WeakRetained = v8;
        if (*(_BYTE *)(a1 + 64))
        {
          objc_msgSend(v8, "setCompletion:", 0);
          WeakRetained = v8;
        }
      }
    }
  }

}

void __26__VUIImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (id)WeakRetained[79] == v2)
  {
    objc_msgSend(WeakRetained, "completion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, 0, 1);

    objc_msgSend(WeakRetained, "setCompletion:", 0);
    objc_msgSend(WeakRetained, "setImageLoaded:", 0);
  }

}

- (id)_imageView
{
  return self->_imageView;
}

- (void)_setImageShape:(int64_t)a3
{
  self->__imageShape = a3;
  -[VUIImageView computeCornerRadii](self, "computeCornerRadii");
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return -[UIImageView vuiSymbolConfiguration](self->_imageView, "vuiSymbolConfiguration");
}

- (void)_setPreferredSymbolConfiguration:(id)a3
{
  -[UIImageView setVuiSymbolConfiguration:](self->_imageView, "setVuiSymbolConfiguration:", a3);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)shouldScaleToSize
{
  return self->_shouldScaleToSize;
}

- (void)setShouldScaleToSize:(BOOL)a3
{
  self->_shouldScaleToSize = a3;
}

- (BOOL)imageContainsShadow
{
  return self->_imageContainsShadow;
}

- (BOOL)animatesShadowChanges
{
  return self->_animatesShadowChanges;
}

- (_VUICornerRadii)shadowRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_shadowRadii.topLeft;
  topRight = self->_shadowRadii.topRight;
  bottomLeft = self->_shadowRadii.bottomLeft;
  bottomRight = self->_shadowRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (id)shadowPathUpdater
{
  return self->_shadowPathUpdater;
}

- (void)setShadowPathUpdater:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (BOOL)imageContainsCornerRadius
{
  return self->_imageContainsCornerRadius;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (NSURL)latestImageURL
{
  return self->_latestImageURL;
}

- (id)dynamicProxyProvider
{
  return self->_dynamicProxyProvider;
}

- (void)setDynamicProxyProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (UIColor)_focusedColor
{
  return self->__focusedColor;
}

- (int64_t)_imageShape
{
  return self->__imageShape;
}

- (BOOL)_enableEdgeAntialiasingOnSelected
{
  return self->__enableEdgeAntialiasingOnSelected;
}

- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3
{
  self->__enableEdgeAntialiasingOnSelected = a3;
}

- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5
{
  -[UIImageView addSymbolEffect:options:animated:](self->_imageView, "addSymbolEffect:options:animated:", a3, a4, a5);
}

void __26__VUIImageView__loadImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D951F000, log, OS_LOG_TYPE_ERROR, "%@ was unable to load image: %@", (uint8_t *)&v3, 0x16u);
}

@end
