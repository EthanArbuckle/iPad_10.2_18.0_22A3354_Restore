@implementation SKUIItemOfferButton

- (SKUIItemOfferButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIItemOfferButton *v8;
  uint64_t v9;
  UIColor *cloudTintColor;
  uint64_t v11;
  UIColor *confirmationColor;
  NSString *offerButtonStateDescription;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemOfferButton initWithFrame:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIItemOfferButton;
  v8 = -[SKUIItemOfferButton initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v9 = objc_claimAutoreleasedReturnValue();
    cloudTintColor = v8->_cloudTintColor;
    v8->_cloudTintColor = (UIColor *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0980392157, 0.670588235, 0.125490196, 1.0);
    v11 = objc_claimAutoreleasedReturnValue();
    confirmationColor = v8->_confirmationColor;
    v8->_confirmationColor = (UIColor *)v11;

    v8->_fillStyle = 0;
    v8->_borderColorAlphaMultiplier = 1.0;
    offerButtonStateDescription = v8->_offerButtonStateDescription;
    v8->_offerButtonStateDescription = (NSString *)&stru_1E73A9FB0;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelGestureRecognizer, "removeTarget:action:", self, 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIItemOfferButton;
  -[SKUIItemOfferButton dealloc](&v3, sel_dealloc);
}

- (NSString)confirmationTitle
{
  return (NSString *)-[NSMutableAttributedString string](self->_confirmationTitleAttributedString, "string");
}

- (CGSize)layoutSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
  {
    v6 = (void *)-[NSMutableAttributedString mutableCopy](self->_titleAttributedString, "mutableCopy");
    -[SKUIItemOfferButton _horizontalInsetForTitleStyle:](self, "_horizontalInsetForTitleStyle:", self->_titleStyle);
    v8 = v7;
    if (objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", self->_titleStyle))
      objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", self->_titleStyle, v6, width + v8 * -2.0, height);
    else
      v9 = self->_titleFitSize.width;
    v13 = ceil(v9 + v8 * 2.0);
    v14 = fmax(v13, 59.0);
    if (v14 > 109.0)
      v14 = 109.0;
    if (self->_titleStyle == 2)
      v12 = v14;
    else
      v12 = v13;

    v10 = 26.0;
  }
  else
  {
    -[SKUIItemOfferButton sizeThatFits:](self, "sizeThatFits:", width, height);
    v12 = v11;
  }
  v15 = v12;
  result.height = v10;
  result.width = v15;
  return result;
}

- (UIImage)image
{
  UIImage *image;

  image = self->_image;
  if (!image)
    image = self->_cloudImage;
  return image;
}

- (NSString)offerButtonStateDescription
{
  __CFString *v3;

  if (-[SKUIItemOfferButton showsConfirmationState](self, "showsConfirmationState")
    && !-[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
  {
    v3 = CFSTR("buyInitiate");
  }
  else
  {
    v3 = self->_offerButtonStateDescription;
  }
  return (NSString *)v3;
}

- (BOOL)isShowingConfirmation
{
  void *v2;
  char v3;

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingConfirmation");

  return v3;
}

- (int64_t)progressType
{
  void *v2;
  int64_t v3;

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "progressType");

  return v3;
}

- (void)removeButtonStateAnimations
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIView layer](self->_borderView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[SKUIItemOfferButton _sendWillAnimate](self, "_sendWillAnimate");
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
    -[SKUIItemOfferButton _sendDidAnimate](self, "_sendDidAnimate");
  }
}

- (void)setBorderColorAlphaMultiplier:(double)a3
{
  if (vabdd_f64(self->_borderColorAlphaMultiplier, a3) > 0.00000011920929)
  {
    self->_borderColorAlphaMultiplier = a3;
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  }
}

- (void)setConfirmationTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SKUIItemOfferButton confirmationTitle](self, "confirmationTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v9 && (objc_msgSend(v5, "isEqualToString:", v9) & 1) == 0)
  {
    if (v9)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend((id)objc_opt_class(), "_defaultTitleAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "initWithString:attributes:", v9, v3);
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)&self->_confirmationTitleAttributedString, v8);
    if (v9)
    {

    }
    -[SKUIItemOfferButton _updateForChangedConfirmationTitleProperty](self, "_updateForChangedConfirmationTitleProperty");
  }

}

- (void)setConfirmationTitleStyle:(int64_t)a3
{
  if (self->_confirmationTitleStyle != a3)
  {
    self->_confirmationTitleStyle = a3;
    -[SKUIItemOfferButton _updateForChangedConfirmationTitleProperty](self, "_updateForChangedConfirmationTitleProperty");
  }
}

- (void)setFillStyle:(int64_t)a3
{
  if (self->_fillStyle != a3)
  {
    self->_fillStyle = a3;
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *image;
  UIImage *cloudImage;
  UIImage *borderedImage;
  UIImage *v9;

  v5 = (UIImage *)a3;
  image = self->_image;
  if (!image)
    image = self->_cloudImage;
  if (image != v5)
  {
    cloudImage = self->_cloudImage;
    self->_cloudImage = 0;
    v9 = v5;

    borderedImage = self->_borderedImage;
    self->_borderedImage = 0;

    objc_storeStrong((id *)&self->_image, a3);
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
    v5 = v9;
  }

}

- (void)setBorderedImage:(id)a3
{
  UIImage *v5;
  UIImage *cloudImage;
  UIImage *image;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_borderedImage != v5)
  {
    cloudImage = self->_cloudImage;
    self->_cloudImage = 0;
    v8 = v5;

    image = self->_image;
    self->_image = 0;

    objc_storeStrong((id *)&self->_borderedImage, a3);
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
    v5 = v8;
  }

}

- (void)setProgress:(double)a3
{
  -[SKUIItemOfferButton setProgress:animated:](self, "setProgress:animated:", 1, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  self->_progress = a3;
  -[SKUICircleProgressIndicator setProgress:animated:](self->_progressIndicator, "setProgress:animated:", a4);
}

- (void)setProgressType:(int64_t)a3
{
  -[SKUIItemOfferButton setProgressType:animated:](self, "setProgressType:animated:", a3, 0);
}

- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "progressType");

  if (v8 != a3)
  {
    if (a4)
    {
      -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 1);
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "progressType");

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProgressType:", a3);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHighlighted:", 0);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShowingConfirmation:", 0);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "progressType");

        v20 = MEMORY[0x1E0C809B0];
        if (v19)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __48__SKUIItemOfferButton_setProgressType_animated___block_invoke;
          v26[3] = &unk_1E73A0108;
          v26[4] = self;
          -[SKUIItemOfferButton _transitionFromProgress:toProgress:withDuration:completion:](self, "_transitionFromProgress:toProgress:withDuration:completion:", v12, v17, v26, 0.4);
        }
        v24[0] = v20;
        v24[1] = 3221225472;
        v24[2] = __48__SKUIItemOfferButton_setProgressType_animated___block_invoke_3;
        v24[3] = &unk_1E73A0108;
        v24[4] = self;
        -[SKUIItemOfferButton _transitionFromProgress:toTitleOrImage:withDuration:completion:](self, "_transitionFromProgress:toTitleOrImage:withDuration:completion:", v12, v17, v24, 0.4);
      }
      else
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __48__SKUIItemOfferButton_setProgressType_animated___block_invoke_2;
        v25[3] = &unk_1E73A0108;
        v25[4] = self;
        -[SKUIItemOfferButton _transitionFromTitleOrImage:toProgress:withDuration:completion:](self, "_transitionFromTitleOrImage:toProgress:withDuration:completion:", v12, v17, v25, 0.4);
      }

    }
    else
    {
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProgressType:", a3);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHighlighted:", 0);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setShowingConfirmation:", 0);

      -[SKUIItemOfferButton _sendWillAnimate](self, "_sendWillAnimate");
      -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
      -[SKUIItemOfferButton _sendDidAnimate](self, "_sendDidAnimate");
    }
  }
}

uint64_t __48__SKUIItemOfferButton_setProgressType_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

uint64_t __48__SKUIItemOfferButton_setProgressType_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

uint64_t __48__SKUIItemOfferButton_setProgressType_animated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

- (void)setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v5 = a3;
  if (-[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation") != a3)
  {
    if (a4)
    {
      -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 1);
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowingConfirmation:", v5);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHighlighted:", 0);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__SKUIItemOfferButton_setShowingConfirmation_animated___block_invoke;
      v15[3] = &unk_1E73A0108;
      v15[4] = self;
      -[SKUIItemOfferButton _transitionFromTitle:toTitle:withDuration:completion:](self, "_transitionFromTitle:toTitle:withDuration:completion:", v8, v12, v15, 0.26);

    }
    else
    {
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowingConfirmation:", v5);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHighlighted:", 0);

      -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
    }
  }
}

uint64_t __55__SKUIItemOfferButton_setShowingConfirmation_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

- (void)setTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SKUIItemOfferButton title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v9 && (objc_msgSend(v5, "isEqualToString:", v9) & 1) == 0)
  {
    if (v9)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend((id)objc_opt_class(), "_defaultTitleAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "initWithString:attributes:", v9, v3);
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)&self->_titleAttributedString, v8);
    if (v9)
    {

    }
    -[SKUIItemOfferButton _updateForChangedTitleProperty](self, "_updateForChangedTitleProperty");
  }

}

- (void)setTitleStyle:(int64_t)a3
{
  if (self->_titleStyle != a3)
  {
    self->_titleStyle = a3;
    -[SKUIItemOfferButton _updateForChangedTitleProperty](self, "_updateForChangedTitleProperty");
  }
}

- (void)setUniversal:(BOOL)a3
{
  if (self->_universal != a3)
  {
    self->_universal = a3;
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  }
}

- (void)showCloudImage
{
  void *v3;
  UIColor *cloudTintColor;
  void *v5;
  UIImage *v6;
  UIImage *cloudImage;
  UIImage *image;

  if (!self->_cloudImage)
  {
    v3 = (void *)objc_opt_class();
    cloudTintColor = self->_cloudTintColor;
    -[SKUIItemOfferButton tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cloudImageWithTintColor:arrowTintColor:", cloudTintColor, v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    cloudImage = self->_cloudImage;
    self->_cloudImage = v6;

    image = self->_image;
    self->_image = 0;

    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  }
}

- (NSString)title
{
  return (NSString *)-[NSMutableAttributedString string](self->_titleAttributedString, "string");
}

- (SKUIBuyButtonDescriptor)buttonDescriptor
{
  SKUIBuyButtonDescriptor *buttonDescriptor;
  SKUIBuyButtonDescriptor *v4;
  SKUIBuyButtonDescriptor *v5;

  buttonDescriptor = self->_buttonDescriptor;
  if (!buttonDescriptor)
  {
    v4 = objc_alloc_init(SKUIBuyButtonDescriptor);
    v5 = self->_buttonDescriptor;
    self->_buttonDescriptor = v4;

    buttonDescriptor = self->_buttonDescriptor;
  }
  return buttonDescriptor;
}

- (NSString)buyType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SKUIItemOfferButton element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("data-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v5;
}

+ (id)cloudImageWithTintColor:(id)a3 arrowTintColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  id v33;
  CGSize v35;

  v6 = a3;
  v7 = a4;
  if (!cloudImageWithTintColor_arrowTintColor__sCloudArrowImage)
  {
    v8 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("CloudloadButtonArrow"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)cloudImageWithTintColor_arrowTintColor__sCloudArrowImage;
    cloudImageWithTintColor_arrowTintColor__sCloudArrowImage = v10;

  }
  if (!cloudImageWithTintColor_arrowTintColor__sCloudButtonImage)
  {
    v12 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("CloudloadButtonCloud"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)cloudImageWithTintColor_arrowTintColor__sCloudButtonImage;
    cloudImageWithTintColor_arrowTintColor__sCloudButtonImage = v14;

  }
  v16 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
  if (cloudImageWithTintColor_arrowTintColor__sTintedImage)
    v17 = cloudImageWithTintColor_arrowTintColor__sLastArrowColor == (_QWORD)v7;
  else
    v17 = 0;
  if (!v17 || cloudImageWithTintColor_arrowTintColor__sLastCloudColor != (_QWORD)v6)
  {
    objc_msgSend((id)cloudImageWithTintColor_arrowTintColor__sCloudArrowImage, "_flatImageWithColor:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)cloudImageWithTintColor_arrowTintColor__sCloudButtonImage, "_flatImageWithColor:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;
    objc_msgSend(v19, "size");
    if (v22 < v23)
      v22 = v23;
    objc_msgSend(v20, "size");
    v25 = v24;
    objc_msgSend(v19, "size");
    if (v25 < v26)
      v25 = v26;
    objc_msgSend(v19, "scale");
    v28 = v27;
    v35.width = v22;
    v35.height = v25;
    UIGraphicsBeginImageContextWithOptions(v35, 0, v28);
    if (!UIGraphicsGetCurrentContext())
    {

      v33 = 0;
      goto LABEL_20;
    }
    v29 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v20, "drawAtPoint:", *MEMORY[0x1E0C9D538], v30);
    objc_msgSend(v19, "drawAtPoint:", v29, v30);
    UIGraphicsGetImageFromCurrentImageContext();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
    cloudImageWithTintColor_arrowTintColor__sTintedImage = v31;

    UIGraphicsEndImageContext();
    objc_storeStrong((id *)&cloudImageWithTintColor_arrowTintColor__sLastArrowColor, a4);
    objc_storeStrong((id *)&cloudImageWithTintColor_arrowTintColor__sLastCloudColor, a3);

    v16 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
  }
  v33 = v16;
LABEL_20:

  return v33;
}

+ (id)cloudTintColorForBackgroundColor:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = a3;
  if (!cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor;
    cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor = v4;

  }
  v6 = &defaultCenter_sOnce;
  if (!cloudTintColorForBackgroundColor__sLightBackgroundCloudColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)cloudTintColorForBackgroundColor__sLightBackgroundCloudColor;
    cloudTintColorForBackgroundColor__sLightBackgroundCloudColor = v7;

  }
  v9 = SKUIColorSchemeStyleForColor(v3);
  if (v9 <= 3)
    v6 = (uint64_t *)(id)*off_1E73A8A30[v9];

  return v6;
}

- (BOOL)hasNonBorderedImage
{
  return self->_image || self->_cloudImage != 0;
}

- (BOOL)hasBorderedImage
{
  return self->_borderedImage != 0;
}

+ (SKUIItemOfferButton)itemOfferButtonWithAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setColoringWithAppearance:", v4);

  return (SKUIItemOfferButton *)v5;
}

+ (id)localizedTitleForItemState:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  char v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "state");
  if ((v8 & 3) != 0)
    goto LABEL_2;
  v10 = v8;
  if (v8 & 0x20 | objc_msgSend(v6, "libraryContentFlags") & 2)
  {
    if (v7)
    {
      v11 = CFSTR("ITEM_OFFER_BUTTON_UPDATE");
      goto LABEL_31;
    }
    v12 = CFSTR("ITEM_OFFER_BUTTON_UPDATE");
LABEL_16:
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_32:
    v9 = (void *)v13;
    goto LABEL_33;
  }
  if ((v10 & 4) != 0)
  {
    if (objc_msgSend(a1, "canOpenItemForItemState:clientContext:", v6, v7))
    {
      if (v7)
      {
        v11 = CFSTR("ITEM_OFFER_BUTTON_OPEN");
        goto LABEL_31;
      }
      v12 = CFSTR("ITEM_OFFER_BUTTON_OPEN");
    }
    else
    {
      if (v7)
      {
        v11 = CFSTR("ITEM_OFFER_BUTTON_INSTALLED");
        goto LABEL_31;
      }
      v12 = CFSTR("ITEM_OFFER_BUTTON_INSTALLED");
    }
    goto LABEL_16;
  }
  if ((v10 & 0x40) != 0)
  {
    if (objc_msgSend(v6, "mediaCategory") == 3)
    {
      if (v7)
      {
        v11 = CFSTR("ITEM_OFFER_BUTTON_READ");
        goto LABEL_31;
      }
      v12 = CFSTR("ITEM_OFFER_BUTTON_READ");
    }
    else if (objc_msgSend(v6, "mediaCategory") == 5)
    {
      if (v7)
      {
        v11 = CFSTR("ITEM_OFFER_BUTTON_UNSUBSCRIBE");
        goto LABEL_31;
      }
      v12 = CFSTR("ITEM_OFFER_BUTTON_UNSUBSCRIBE");
    }
    else
    {
      if (v7)
      {
        v11 = CFSTR("ITEM_OFFER_BUTTON_PLAY");
        goto LABEL_31;
      }
      v12 = CFSTR("ITEM_OFFER_BUTTON_PLAY");
    }
    goto LABEL_16;
  }
  if ((v10 & 0x10) != 0)
  {
    if (v7)
    {
      v11 = CFSTR("ITEM_OFFER_BUTTON_GRATIS");
      goto LABEL_31;
    }
    v12 = CFSTR("ITEM_OFFER_BUTTON_GRATIS");
    goto LABEL_16;
  }
  if ((v10 & 8) != 0)
  {
    if (v7)
    {
      v11 = CFSTR("ITEM_OFFER_BUTTON_PURCHASED");
LABEL_31:
      objc_msgSend(v7, "localizedStringForKey:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    v12 = CFSTR("ITEM_OFFER_BUTTON_PURCHASED");
    goto LABEL_16;
  }
LABEL_2:
  v9 = 0;
LABEL_33:

  return v9;
}

- (BOOL)restores
{
  return self->_downloadRestores;
}

- (void)setCloudTintColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *cloudTintColor;
  void *v7;
  UIColor *v8;
  void *v9;
  UIImage *v10;
  UIImage *cloudImage;
  UIColor *v12;

  v4 = (UIColor *)a3;
  if (self->_cloudTintColor != v4)
  {
    v12 = v4;
    v5 = (UIColor *)-[UIColor copy](v4, "copy");
    cloudTintColor = self->_cloudTintColor;
    self->_cloudTintColor = v5;

    v4 = v12;
    if (self->_cloudImage)
    {
      v7 = (void *)objc_opt_class();
      v8 = self->_cloudTintColor;
      -[SKUIItemOfferButton tintColor](self, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudImageWithTintColor:arrowTintColor:", v8, v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      cloudImage = self->_cloudImage;
      self->_cloudImage = v10;

      -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");
      v4 = v12;
    }
  }

}

- (void)setColoringWithAppearance:(id)a3
{
  UIColor *v4;
  UIColor *cloudTintColor;
  UIColor *v6;
  UIColor *confirmationColor;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "cloudTintColorForBackgroundColor:", self->_backgroundColor);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    cloudTintColor = self->_cloudTintColor;
    self->_cloudTintColor = v4;

    objc_msgSend(v9, "confirmationColor");
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    confirmationColor = self->_confirmationColor;
    self->_confirmationColor = v6;

    objc_msgSend(v9, "buttonColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton setTintColor:](self, "setTintColor:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton setCloudTintColor:](self, "setCloudTintColor:", v8);
  }

}

- (void)setDisabledButSelectable:(BOOL)a3
{
  self->_disabledButSelectable = a3;
  -[SKUIItemOfferButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)setTitle:(id)a3 confirmationTitle:(id)a4 itemState:(id)a5 clientContext:(id)a6 animated:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *offerButtonStateDescription;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  NSString *v26;
  __CFString *v27;
  int v28;
  int64_t v29;
  int *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int *v40;
  int v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  uint64_t v55;
  unsigned int v56;
  unsigned __int8 v57;
  int v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  _BOOL4 v64;

  v64 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  offerButtonStateDescription = self->_offerButtonStateDescription;
  self->_offerButtonStateDescription = (NSString *)&stru_1E73A9FB0;

  v16 = objc_msgSend(v13, "state");
  v17 = -[SKUIItemOfferButton supportsPlayButton](self, "supportsPlayButton");
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShouldSuppressEnabled:", 0);

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowsUniversal:", 1);

  -[SKUIItemOfferButton setEnabled:](self, "setEnabled:", 1);
  v61 = v12;
  v62 = v11;
  v59 = v14;
  v60 = v13;
  v57 = v17;
  if ((v16 & 1) != 0)
  {
    v23 = 0;
    v58 = 0;
    v56 = 0;
    v17 = 0;
    v21 = 0;
    v20 = 0;
    v55 = (v16 >> 3) & 1;
    v24 = 1;
    goto LABEL_15;
  }
  if ((v16 & 2) != 0)
  {
    objc_msgSend(v13, "downloadProgress");
    -[SKUIItemOfferButton setProgress:](self, "setProgress:", v25);
    v23 = 0;
    v58 = 0;
    v56 = 0;
    v17 = 0;
    v21 = 0;
    v20 = 0;
    v24 = 2;
    v55 = (v16 >> 3) & 1;
    goto LABEL_15;
  }
  if ((v16 & 0x20) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "localizedTitleForItemState:clientContext:", v13, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v26 = self->_offerButtonStateDescription;
    v27 = CFSTR("update");
LABEL_12:
    self->_offerButtonStateDescription = &v27->isa;

    v23 = 0;
    LODWORD(v55) = 0;
    v24 = 0;
    v56 = 0;
    v17 = 0;
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if ((v16 & 4) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "localizedTitleForItemState:clientContext:", v13, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend((id)objc_opt_class(), "canOpenItemForItemState:clientContext:", v13, v14);
    v26 = self->_offerButtonStateDescription;
    if (!v41)
    {
      self->_offerButtonStateDescription = (NSString *)CFSTR("installed");

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 1;
      objc_msgSend(v47, "setShouldSuppressEnabled:", 1);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setShowsUniversal:", 0);

      -[SKUIItemOfferButton setEnabled:](self, "setEnabled:", 0);
LABEL_44:
      LODWORD(v55) = 0;
      v24 = 0;
      v56 = 0;
      v17 = 0;
      v21 = 0;
      v23 = 2;
      goto LABEL_15;
    }
    v27 = CFSTR("open");
    goto LABEL_12;
  }
  if ((v16 & 0x40) != 0)
  {
    v43 = (void *)objc_opt_class();
    v44 = v43;
    if ((_DWORD)v17)
    {
      objc_msgSend((id)objc_opt_class(), "playTintColorForBackgroundColor:", self->_backgroundColor);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "playImageWithTintColor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton setImage:](self, "setImage:", v46);

      v23 = 0;
      LODWORD(v55) = 0;
      v24 = 0;
      v56 = 0;
      v17 = 0;
      v21 = 0;
      v20 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v43, "localizedTitleForItemState:clientContext:", v13, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    LODWORD(v55) = 0;
    v24 = 0;
    v56 = 0;
    goto LABEL_13;
  }
  if ((v16 & 8) != 0)
  {
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v49, "shouldSuppressCloudRestore");

    if (!(_DWORD)v17)
    {
      v53 = self->_offerButtonStateDescription;
      self->_offerButtonStateDescription = (NSString *)CFSTR("download");

      v24 = 0;
      v56 = 0;
      v21 = 0;
      v20 = 0;
      LODWORD(v55) = 1;
      v23 = 2;
      goto LABEL_14;
    }
    objc_msgSend((id)objc_opt_class(), "localizedTitleForItemState:clientContext:", v13, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 1;
    objc_msgSend(v50, "setShouldSuppressEnabled:", 1);

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setShowsUniversal:", 0);

    -[SKUIItemOfferButton setEnabled:](self, "setEnabled:", 0);
    v52 = self->_offerButtonStateDescription;
    self->_offerButtonStateDescription = (NSString *)CFSTR("purchased");

    goto LABEL_44;
  }
  if ((v16 & 0x10) == 0)
  {
    v20 = v11;
    v21 = v12;
    v56 = -[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
    v17 = objc_msgSend(v21, "length") != 0;
    v22 = self->_offerButtonStateDescription;
    self->_offerButtonStateDescription = (NSString *)CFSTR("buy");

    v23 = 0;
    LODWORD(v55) = 0;
    v24 = 0;
LABEL_14:
    v58 = 1;
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "localizedTitleForItemState:clientContext:", v13, v14);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v14, "localizedStringForKey:", CFSTR("ITEM_OFFER_BUTTON_INSTALL_APP"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ITEM_OFFER_BUTTON_INSTALL_APP"), 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v54 = self->_offerButtonStateDescription;
  self->_offerButtonStateDescription = (NSString *)CFSTR("download");

  v23 = 0;
  LODWORD(v55) = 0;
  v24 = 0;
  v56 = 0;
  v58 = 1;
  v17 = 1;
LABEL_15:
  self->_downloadRestores = (v16 & 0x400) != 0;
  -[SKUIItemOfferButton setFillStyle:](self, "setFillStyle:", v23);
  -[SKUIItemOfferButton setShowsConfirmationState:](self, "setShowsConfirmationState:", v17);
  v28 = -[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
  v29 = -[SKUIItemOfferButton progressType](self, "progressType");
  v30 = &OBJC_IVAR___SKUIItemOfferButton__titleAttributedString;
  if (v28)
    v30 = &OBJC_IVAR___SKUIItemOfferButton__confirmationTitleAttributedString;
  v31 = *(id *)((char *)&self->super.super.super.super.isa + *v30);
  -[UIImageView image](self->_imageView, "image");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v21;
  -[SKUIItemOfferButton setConfirmationTitle:](self, "setConfirmationTitle:", v21);
  v33 = v20;
  -[SKUIItemOfferButton setTitle:](self, "setTitle:", v20);
  if (v58 && (v57 & ((v16 & 0x40) != 0)) == 0)
  {
    if ((_DWORD)v55)
      -[SKUIItemOfferButton showCloudImage](self, "showCloudImage");
    else
      -[SKUIItemOfferButton setImage:](self, "setImage:", 0);
  }
  if (v24 == v29)
  {
    -[SKUIItemOfferButton setShowingConfirmation:animated:](self, "setShowingConfirmation:animated:", v56, v64);
    if (v56 == v28)
    {
      -[UIImageView image](self->_imageView, "image");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39 == v32)
      {
        v40 = &OBJC_IVAR___SKUIItemOfferButton__titleAttributedString;
        if (v56)
          v40 = &OBJC_IVAR___SKUIItemOfferButton__confirmationTitleAttributedString;
        if (v31 == *(id *)((char *)&self->super.super.super.super.isa + *v40))
          LOBYTE(v34) = 0;
        else
          v34 = objc_msgSend(v31, "isEqualToAttributedString:") ^ 1;
      }
      else
      {
        LOBYTE(v34) = 1;
      }
    }
    else
    {
      LOBYTE(v34) = !v64;
    }
    v36 = v61;
    v35 = v62;
    v38 = v59;
    v37 = v60;
  }
  else
  {
    -[SKUIItemOfferButton setProgressType:animated:](self, "setProgressType:animated:", v24, v64);
    v36 = v61;
    v35 = v62;
    v38 = v59;
    v37 = v60;
    if (v64)
    {
      LOBYTE(v34) = 0;
    }
    else if (v29)
    {
      LOBYTE(v34) = v58;
    }
    else
    {
      LOBYTE(v34) = 1;
    }
  }

  return v34;
}

- (BOOL)setValuesUsingItemOffer:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  float v15;
  BOOL v16;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "buttonText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "confirmationText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v10, "price");
    if (v15 == 0.0)
    {
      if (v12)
        objc_msgSend(v12, "localizedStringForKey:", CFSTR("ITEM_OFFER_BUTTON_INSTALL_APP"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ITEM_OFFER_BUTTON_INSTALL_APP"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  v16 = -[SKUIItemOfferButton setTitle:confirmationTitle:itemState:clientContext:animated:](self, "setTitle:confirmationTitle:itemState:clientContext:animated:", v13, v14, v11, v12, v6);

  return v16;
}

- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  SKUIItemState *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  SKUIItemState *v19;
  void *v20;
  SKUIStoreIdentifier *v21;
  void *v22;
  void *v23;
  BOOL v24;

  v6 = a6;
  v10 = a3;
  v11 = (SKUIItemState *)a4;
  v12 = a5;
  -[SKUIItemOfferButton setButtonDescriptor:](self, "setButtonDescriptor:", v10);
  v13 = objc_msgSend(v10, "buttonType");
  if (v13 == 1)
  {
    if (v11)
    {
      -[SKUIItemState setState:](v11, "setState:", -[SKUIItemState state](v11, "state") | 8);
    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
      v11 = objc_alloc_init(SKUIItemState);
      -[SKUIItemState setItemIdentifier:](v11, "setItemIdentifier:", v20);
      v21 = -[SKUIStoreIdentifier initWithNumber:]([SKUIStoreIdentifier alloc], "initWithNumber:", v20);
      -[SKUIItemState setStoreIdentifier:](v11, "setStoreIdentifier:", v21);

      -[SKUIItemState setState:](v11, "setState:", 8);
    }
    goto LABEL_15;
  }
  if (!v11)
  {
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  v14 = v13;
  v15 = -[SKUIItemState state](v11, "state");
  v16 = v15;
  v17 = 0;
  if (v14 == 2 && v15)
    v17 = -[SKUIItemState activeStateIsPreview](v11, "activeStateIsPreview") ^ 1;
  v18 = v14 == 2;
  if (v18 == ((-[SKUIItemState libraryContentFlags](v11, "libraryContentFlags") & 1) == 0))
    v16 &= ~0x40uLL;
  if (v18 == ((-[SKUIItemState downloadContentFlags](v11, "downloadContentFlags") & 1) == 0))
    v16 &= 0xFFFFFFFFFFFFFFFCLL;
  if (-[SKUIItemState state](v11, "state") != v16)
  {
    v19 = (SKUIItemState *)-[SKUIItemState copy](v11, "copy");
    -[SKUIItemState setState:](v19, "setState:", v16);

    v11 = v19;
  }
LABEL_16:
  -[SKUIItemOfferButton setHidden:](self, "setHidden:", v17);
  objc_msgSend(v10, "buttonText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "confirmationText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SKUIItemOfferButton setTitle:confirmationTitle:itemState:clientContext:animated:](self, "setTitle:confirmationTitle:itemState:clientContext:animated:", v22, v23, v11, v12, v6);

  -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  return v24;
}

- (BOOL)supportsPlayButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SKUIItemOfferButton element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("supportsPlayButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (!-[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable", a3, a4))
  {
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 1);
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:", 1);

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "progressType");

    if (v11)
    {
      -[SKUIItemOfferButton _transitionFromProgress:toProgress:withDuration:completion:](self, "_transitionFromProgress:toProgress:withDuration:completion:", v6, v9, 0, 0.15);
    }
    else if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
    {
      -[SKUIItemOfferButton _transitionFromImage:toImage:withDuration:completion:](self, "_transitionFromImage:toImage:withDuration:completion:", v6, v9, 0, 0.15);
    }
    else if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
    {
      -[SKUIItemOfferButton _transitionFromBorderedImage:toTitle:withDuration:completion:](self, "_transitionFromBorderedImage:toTitle:withDuration:completion:", v6, v9, 0, 0.15);
    }
    else
    {
      -[SKUIItemOfferButton _transitionFromTitle:toTitle:withDuration:completion:](self, "_transitionFromTitle:toTitle:withDuration:completion:", v6, v9, 0, 0.15);
    }

  }
  return 1;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  if (!-[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable", a3))
  {
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", 0);

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "progressType");

    if (v10)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke;
      v14[3] = &unk_1E73A0108;
      v14[4] = self;
      -[SKUIItemOfferButton _transitionFromProgress:toProgress:withDuration:completion:](self, "_transitionFromProgress:toProgress:withDuration:completion:", v5, v8, v14, 0.15);
    }
    else if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_2;
      v13[3] = &unk_1E73A0108;
      v13[4] = self;
      -[SKUIItemOfferButton _transitionFromImage:toImage:withDuration:completion:](self, "_transitionFromImage:toImage:withDuration:completion:", v5, v8, v13, 0.15);
    }
    else if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_3;
      v12[3] = &unk_1E73A0108;
      v12[4] = self;
      -[SKUIItemOfferButton _transitionFromBorderedImage:toTitle:withDuration:completion:](self, "_transitionFromBorderedImage:toTitle:withDuration:completion:", v5, v8, v12, 0.15);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_4;
      v11[3] = &unk_1E73A0108;
      v11[4] = self;
      -[SKUIItemOfferButton _transitionFromTitle:toTitle:withDuration:completion:](self, "_transitionFromTitle:toTitle:withDuration:completion:", v5, v8, v11, 0.15);
    }

  }
}

uint64_t __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

uint64_t __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

uint64_t __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

uint64_t __47__SKUIItemOfferButton_cancelTrackingWithEvent___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  if (!-[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable"))
  {
    v6 = -[SKUIItemOfferButton _touchInBounds:](self, "_touchInBounds:", v5);
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "highlighted");

    if (v6 != v8)
    {
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHighlighted:", v6);

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "progressType");

      if (v15)
      {
        -[SKUIItemOfferButton _transitionFromProgress:toProgress:withDuration:completion:](self, "_transitionFromProgress:toProgress:withDuration:completion:", v10, v13, 0, 0.5);
      }
      else if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
      {
        -[SKUIItemOfferButton _transitionFromImage:toImage:withDuration:completion:](self, "_transitionFromImage:toImage:withDuration:completion:", v10, v13, 0, 0.5);
      }
      else if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
      {
        -[SKUIItemOfferButton _transitionFromBorderedImage:toTitle:withDuration:completion:](self, "_transitionFromBorderedImage:toTitle:withDuration:completion:", v10, v13, 0, 0.5);
      }
      else
      {
        -[SKUIItemOfferButton _transitionFromTitle:toTitle:withDuration:completion:](self, "_transitionFromTitle:toTitle:withDuration:completion:", v10, v13, 0, 0.5);
      }

    }
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SKUIItemOfferButton *v15;
  uint64_t v16;
  _QWORD v17[5];

  v5 = a3;
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlighted:", 0);

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "progressType");

  if (!v12
    && !-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage")
    && !-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage")
    && !-[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__SKUIItemOfferButton_endTrackingWithTouch_withEvent___block_invoke;
    v17[3] = &unk_1E73A0108;
    v17[4] = self;
    -[SKUIItemOfferButton _transitionFromTitle:toTitle:withDuration:completion:](self, "_transitionFromTitle:toTitle:withDuration:completion:", v7, v10, v17, 0.25);
  }
  if (-[SKUIItemOfferButton _touchInBounds:](self, "_touchInBounds:", v5))
  {
    if (-[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable"))
    {
      -[SKUIItemOfferButton element](self, "element");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[SKUIItemOfferButton element](self, "element");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x1E73B7150, 0x1E73B7170, 1, 0, 0, 0);

      }
    }
    else
    {
      if (-[SKUIItemOfferButton progressType](self, "progressType")
        || -[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage")
        || -[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage")
        || -[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation")
        || !-[SKUIItemOfferButton showsConfirmationState](self, "showsConfirmationState"))
      {
        v15 = self;
        v16 = 0x20000;
      }
      else
      {
        v15 = self;
        v16 = 0x40000;
      }
      -[SKUIItemOfferButton sendActionsForControlEvents:](v15, "sendActionsForControlEvents:", v16);
    }
  }

}

uint64_t __54__SKUIItemOfferButton_endTrackingWithTouch_withEvent___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_reloadForCurrentState:", 0);
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  objc_super v7;

  v3 = a3;
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSuppressEnabled");

  v7.receiver = self;
  v7.super_class = (Class)SKUIItemOfferButton;
  -[SKUIItemOfferButton setEnabled:](&v7, sel_setEnabled_, v3 & ~v6);
  -[SKUIItemOfferButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_touchInBounds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGPoint v23;
  CGRect v24;

  v4 = (void *)MEMORY[0x1E0DC3708];
  v5 = a3;
  objc_msgSend(v4, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  -[SKUIItemOfferButton bounds](self, "bounds");
  v12 = -70.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v12 = -25.0;
  v13 = v12 + v8;
  v14 = v12 + v9;
  v15 = -140.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v15 = -50.0;
  v16 = v10 - v15;
  v17 = v11 - v15;
  objc_msgSend(v5, "locationInView:", self);
  v19 = v18;
  v21 = v20;

  v24.origin.x = v13;
  v24.origin.y = v14;
  v24.size.width = v16;
  v24.size.height = v17;
  v23.x = v19;
  v23.y = v21;
  return CGRectContainsPoint(v24, v23);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_usesDrawRectPath)
  {
    -[SKUIItemOfferButton frame](self, "frame");
    v9 = v8;
    v11 = v10;
    v13.receiver = self;
    v13.super_class = (Class)SKUIItemOfferButton;
    -[SKUIItemOfferButton setFrame:](&v13, sel_setFrame_, x, y, width, height);
    if (v9 != width || v11 != height)
      -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIItemOfferButton;
    -[SKUIItemOfferButton setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIImage *cloudImage;
  double v14;
  double v15;
  double v16;
  double v17;
  UIImage *v18;
  double v19;
  double v20;
  double v21;
  float v22;
  CGFloat v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t titleStyle;
  int64_t fillStyle;
  void *v33;
  NSMutableAttributedString *titleAttributedString;
  int64_t v35;
  int64_t v36;
  _BOOL4 universal;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIImage *v43;
  CGSize v44;

  if (self->_usesDrawRectPath)
  {
    -[SKUIItemOfferButton bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
    {
      cloudImage = self->_cloudImage;
      if (!cloudImage)
        cloudImage = self->_image;
      v43 = cloudImage;
      -[UIImage size](v43, "size");
      *(float *)&v14 = (v10 - v14) * 0.5;
      v15 = ceilf(*(float *)&v14);
      *(float *)&v16 = (v12 - v16) * 0.5;
      v17 = ceilf(*(float *)&v16);
      v18 = v43;
    }
    else
    {
      if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
      {
        -[UIImage size](self->_borderedImage, "size");
        if (v20 >= v12 + -16.0)
          v21 = v12 + -16.0;
        else
          v21 = v20;
        v22 = v19 * (v21 / v20);
        v23 = ceilf(v22);
        -[UIImage imageWithRenderingMode:](self->_borderedImage, "imageWithRenderingMode:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "scale");
        v27 = v26;
        v44.width = v23;
        v44.height = v21;
        UIGraphicsBeginImageContextWithOptions(v44, 0, v27);

        -[SKUIItemOfferButton tintColor](self, "tintColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "set");

        objc_msgSend(v24, "drawInRect:", 0.0, 0.0, v23, v21);
        UIGraphicsGetImageFromCurrentImageContext();
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        UIGraphicsEndImageContext();
        objc_msgSend(v29, "drawAtPoint:", (v10 - v23) * 0.5, (v12 - v21) * 0.5);
        v30 = (void *)objc_opt_class();
        titleStyle = self->_titleStyle;
        fillStyle = self->_fillStyle;
        if (-[SKUIItemOfferButton isEnabled](self, "isEnabled"))
          -[SKUIItemOfferButton tintColor](self, "tintColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIItemOfferButton traitCollection](self, "traitCollection");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_cachedImageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:interfaceStyle:", 0, titleStyle, fillStyle, 0, v39, objc_msgSend(v40, "userInterfaceStyle"), v10, v12);
        v43 = (UIImage *)objc_claimAutoreleasedReturnValue();

        -[UIImage drawAtPoint:](v43, "drawAtPoint:", v6, v8);
        goto LABEL_25;
      }
      v33 = (void *)objc_opt_class();
      titleAttributedString = self->_titleAttributedString;
      v35 = self->_titleStyle;
      v36 = self->_fillStyle;
      universal = self->_universal;
      if (self->_universal)
      {
        -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v3, "showsUniversal");
      }
      else
      {
        v38 = 0;
      }
      if (-[SKUIItemOfferButton isEnabled](self, "isEnabled"))
        -[SKUIItemOfferButton tintColor](self, "tintColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton traitCollection](self, "traitCollection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_cachedImageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:interfaceStyle:", titleAttributedString, v35, v36, v38, v41, objc_msgSend(v42, "userInterfaceStyle"), v10, v12);
      v43 = (UIImage *)objc_claimAutoreleasedReturnValue();

      if (universal)
      v18 = v43;
      v15 = v6;
      v17 = v8;
    }
    -[UIImage drawAtPoint:](v18, "drawAtPoint:", v15, v17);
LABEL_25:

  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  -[SKUIItemOfferButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIItemOfferButton;
  -[SKUIItemOfferButton didMoveToWindow](&v4, sel_didMoveToWindow);
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
  _BOOL4 v11;
  double v12;
  UIImageView *imageView;
  UIImageView *borderedImageView;
  UIImageView *v15;
  UIImageView *universalImageView;
  _BOOL4 v17;
  int *v18;
  uint64_t v19;
  double v20;
  UILabel *titleLabel;
  int *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[SKUIItemOfferButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SKUIItemOfferButton isEnabled](self, "isEnabled"))
  {
    v11 = -[SKUIItemOfferButton isDisabledButSelectable](self, "isDisabledButSelectable");
    v12 = 0.4;
    if (!v11)
      v12 = 1.0;
  }
  else
  {
    v12 = 0.4;
  }
  -[SKUIItemOfferButton setAlpha:](self, "setAlpha:", v12);
  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView setContentMode:](imageView, "setContentMode:", 4);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v4, v6, v8, v10);
  }
  borderedImageView = self->_borderedImageView;
  if (borderedImageView)
  {
    -[UIImageView setContentMode:](borderedImageView, "setContentMode:", 1);
    v15 = self->_borderedImageView;
    -[SKUIItemOfferButton _borderedImageViewFrame](self, "_borderedImageViewFrame");
    -[UIImageView setFrame:](v15, "setFrame:");
  }
  universalImageView = self->_universalImageView;
  if (universalImageView)
  {
    -[UIImageView frame](universalImageView, "frame");
    -[UIImageView setFrame:](self->_universalImageView, "setFrame:", 3.0, 3.0);
  }
  v17 = -[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
  v18 = &OBJC_IVAR___SKUIItemOfferButton__titleStyle;
  if (v17)
    v18 = &OBJC_IVAR___SKUIItemOfferButton__confirmationTitleStyle;
  v19 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v18);
  if (v19 == 2)
    v20 = 7.0;
  else
    v20 = 10.0;
  titleLabel = self->_titleLabel;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v29 = CGRectInset(v28, v20, 0.0);
  -[UILabel setFrame:](titleLabel, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  if (objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", v19))
  {
    v22 = &OBJC_IVAR___SKUIItemOfferButton__titleAttributedString;
    if (v17)
      v22 = &OBJC_IVAR___SKUIItemOfferButton__confirmationTitleAttributedString;
    v23 = *(id *)((char *)&self->super.super.super.super.isa + *v22);
    v24 = (id)objc_msgSend(v23, "copy");
    objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v19, v23, v8 + v20 * -2.0, v10);
    if (v24 != v23 && (objc_msgSend(v24, "isEqualToAttributedString:", v23) & 1) == 0)
      -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);

  }
  if (self->_borderCornerRadiusMatchesHalfBoundingDimension)
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGRectGetWidth(v30);
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    CGRectGetHeight(v31);
    UIFloorToViewScale();
    v26 = v25;
    -[UIView layer](self->_borderView, "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", v26);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  objc_storeStrong((id *)&self->_backgroundColor, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SKUIItemOfferButton;
  -[SKUIItemOfferButton setBackgroundColor:](&v7, sel_setBackgroundColor_, v6);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  int64_t *p_titleStyle;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  UIImage *image;
  uint64_t v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  int64_t *p_confirmationTitleStyle;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  width = a3.width;
  p_titleStyle = &self->_titleStyle;
  if (self->_titleStyle == 1)
    v6 = 20.0;
  else
    v6 = 26.0;
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "progressType");

  v9 = v6;
  if (!v8)
  {
    if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
    {
      image = self->_image;
      if (image)
      {
LABEL_11:
        -[UIImage size](image, "size");
        v9 = fmax(v12, 26.0);
        goto LABEL_33;
      }
      v11 = 496;
LABEL_10:
      image = *(UIImage **)((char *)&self->super.super.super.super.isa + v11);
      goto LABEL_11;
    }
    if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
    {
      v11 = 696;
      goto LABEL_10;
    }
    v13 = (void *)-[NSMutableAttributedString mutableCopy](self->_titleAttributedString, "mutableCopy");
    v14 = -[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
    p_confirmationTitleStyle = p_titleStyle;
    if (v14)
      p_confirmationTitleStyle = &self->_confirmationTitleStyle;
    v16 = *p_confirmationTitleStyle;
    -[SKUIItemOfferButton _horizontalInsetForTitleStyle:](self, "_horizontalInsetForTitleStyle:", *p_confirmationTitleStyle);
    v18 = v17;
    if (objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", *p_titleStyle))
    {
      objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", *p_titleStyle, v13, width, v6);
      v20 = v19;
    }
    else
    {
      v20 = self->_titleFitSize.width;
    }
    if (-[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
    {
      v21 = (void *)-[NSMutableAttributedString mutableCopy](self->_confirmationTitleAttributedString, "mutableCopy");
      if (objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", self->_confirmationTitleStyle))
        objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", self->_confirmationTitleStyle, v21, width, v6);
      else
        v22 = self->_confirmationTitleFitSize.width;
      if (v20 - v22 >= 10.0 || v22 >= v20)
        v20 = v22;

    }
    v24 = ceil(v20 + v18 * 2.0);
    v25 = fmax(v24, 59.0);
    if (v25 > 109.0)
      v25 = 109.0;
    if (v16 == 2)
      v9 = v25;
    else
      v9 = v24;

  }
LABEL_33:
  v26 = v9;
  v27 = v6;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  UIImage *v4;
  UIImage *cloudImage;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIItemOfferButton;
  -[SKUIItemOfferButton tintColorDidChange](&v7, sel_tintColorDidChange);
  -[SKUIItemOfferButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cloudImage)
  {
    objc_msgSend((id)objc_opt_class(), "cloudImageWithTintColor:arrowTintColor:", self->_cloudTintColor, v3);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    cloudImage = self->_cloudImage;
    self->_cloudImage = v4;

  }
  if (self->_universalImageView)
  {
    objc_msgSend((id)objc_opt_class(), "_universalPlusImageWithTintColor:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_universalImageView, "setImage:", v6);

  }
  -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
  -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_cancelGestureAction:(id)a3
{
  if (-[SKUIItemOfferButton isShowingConfirmation](self, "isShowingConfirmation", a3))
    -[SKUIItemOfferButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
  -[SKUIItemOfferButton _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
}

+ (id)_cachedImageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8 interfaceStyle:(int64_t)a9
{
  _BOOL8 v11;
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v11 = a7;
  height = a5.height;
  width = a5.width;
  v16 = a3;
  v17 = a8;
  if (!_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v19 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
    _cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache = (uint64_t)v18;

    objc_msgSend((id)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache, "setCountLimit:", 200);
  }
  v20 = objc_msgSend(v16, "hash");
  v21 = objc_msgSend(v17, "hash");
  v22 = 1000;
  if (!v11)
    v22 = 0;
  v23 = (unint64_t)height + 100000 * a4 + (unint64_t)width + 10000 * a6 + v22 + 1000000 * a9 + v20 + v21;
  v24 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend((id)objc_opt_class(), "_imageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:", v16, a4, a6, v11, v17, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v26, v28);

    }
  }

  return v26;
}

+ (BOOL)canOpenItemForItemState:(id)a3 clientContext:(id)a4
{
  void *v4;
  void *v5;
  int v6;

  if ((objc_msgSend(a3, "state") & 0x1000) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS")) ^ 1;
  }
  return v6;
}

+ (id)_defaultTitleAttributes
{
  if (_defaultTitleAttributes_sOnceToken != -1)
    dispatch_once(&_defaultTitleAttributes_sOnceToken, &__block_literal_global_56);
  return (id)_defaultTitleAttributes_sDefaultAttributes;
}

void __46__SKUIItemOfferButton__defaultTitleAttributes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setAlignment:", 1);
  objc_msgSend(v1, "setLineBreakMode:", 5);
  v4 = *MEMORY[0x1E0DC1178];
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_defaultTitleAttributes_sDefaultAttributes;
  _defaultTitleAttributes_sDefaultAttributes = v2;

}

+ (id)_imageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8
{
  _BOOL4 v9;
  double height;
  double width;
  id v14;
  id v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double MinY;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  void *v48;
  double v49;
  float v50;
  void *v51;
  void *v52;
  double v54;
  double v55;
  CGSize v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v9 = a7;
  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;
  v56.width = width;
  v56.height = height;
  UIGraphicsBeginImageContextWithOptions(v56, 0, v18);

  objc_msgSend(v15, "set");
  if (a6)
  {
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v63.origin.x = 0.0;
  v63.origin.y = 0.0;
  v63.size.width = width;
  v63.size.height = height;
  v64 = CGRectInset(v63, 0.5, 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height, 3.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setLineWidth:", 1.0);
  objc_msgSend(v48, "stroke");

  if (v9)
  {
LABEL_3:
    v19 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageNamed:inBundle:", CFSTR("BuyButtonUniversalIndicator"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "size");
    v23 = v22;
    objc_msgSend(v21, "size");
    v25 = v24;
    v57.origin.x = 3.0;
    v57.origin.y = 3.0;
    v57.size.width = v23;
    v57.size.height = v25;
    UIRectFill(v57);
    objc_msgSend(v21, "drawInRect:blendMode:alpha:", 22, 3.0, 3.0, v23, v25, 1.0);

  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");
  v28 = v27;

  if (v14)
  {
    v29 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v29, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v15, 0, objc_msgSend(v29, "length"));
    if (a4 == 2)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
      objc_msgSend(v30, "setCachesLayout:", 1);
      objc_msgSend(v30, "setMaximumNumberOfLines:", 2);
      objc_msgSend(v30, "setWrapsForTruncationMode:", 1);
      objc_msgSend(v30, "setWantsBaselineOffset:", 1);
      v31 = width + -14.0;
      objc_msgSend(v29, "boundingRectWithSize:options:context:", 1, v30, width + -14.0, height);
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v58.origin.x = 7.0;
      v58.origin.y = 0.0;
      v58.size.width = width + -14.0;
      v58.size.height = height;
      v54 = width;
      MinY = CGRectGetMinY(v58);
      v59.origin.x = 7.0;
      v59.origin.y = 0.0;
      v59.size.width = v31;
      v59.size.height = height;
      v55 = height;
      v41 = CGRectGetHeight(v59);
      v60.origin.x = v33;
      v60.origin.y = v35;
      v60.size.width = v37;
      v60.size.height = v39;
      v42 = round(MinY + (v41 - CGRectGetHeight(v60)) * 0.5);
      v61.origin.x = v33;
      v61.origin.y = v35;
      v61.size.width = v37;
      v61.size.height = v39;
      v43 = CGRectGetHeight(v61);
      objc_msgSend(v30, "baselineOffset");
      v45 = v44;
      v62.origin.x = 7.0;
      v62.origin.y = v42;
      height = v55;
      v62.size.width = v31;
      v62.size.height = v43;
      v46 = CGRectGetMinY(v62);
      v47 = v43;
      width = v54;
      objc_msgSend(v29, "drawWithRect:options:context:", 1, v30, 7.0, round(v28 * (v45 + v46)) / v28 - v45, v31, v47);

    }
    else
    {
      objc_msgSend(v29, "size");
      v50 = v28 * ((height - v49) * 0.5);
      objc_msgSend(v29, "drawInRect:", 0.0, roundf(v50) / v28, width, v49);
    }

  }
  if (a6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", 0.0, 0.0, width, height, 3.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setLineWidth:", 0.0);
    objc_msgSend(v51, "fillWithBlendMode:alpha:", 25, 1.0);

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v52;
}

+ (BOOL)_sizeMattersForTitleStyle:(int64_t)a3
{
  return a3 == 2;
}

+ (CGSize)_titleSizeThatFitsForSize:(CGSize)a3 titleStyle:(int64_t)a4 mutableAttributedString:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  CGSize v41;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (!_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v11 = (void *)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache;
    _titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache = (uint64_t)v10;

    objc_msgSend((id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache, "setCountLimit:", 200);
  }
  v12 = objc_msgSend(a1, "_sizeMattersForTitleStyle:", a4);
  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v12)
  {
    v41.width = width;
    v41.height = height;
    NSStringFromCGSize(v41);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E73A9FB0;
  }
  objc_msgSend(v9, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%td%@"), v14, a4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "length");
    v20 = *MEMORY[0x1E0DC1138];
    v39 = *MEMORY[0x1E0DC1138];
    v40[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v21, 0, v19);

    v22 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    objc_msgSend(v22, "setCachesLayout:", 1);
    objc_msgSend(v22, "setMaximumNumberOfLines:", 1);
    objc_msgSend(v22, "setWrapsForTruncationMode:", 0);
    objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 1.79769313e308, 1.79769313e308);
    if (v23 > 70.0)
    {
      objc_msgSend(v22, "setMaximumNumberOfLines:", 0);
      objc_msgSend(v22, "setWrapsForTruncationMode:", 1);
      v37 = v20;
      v38 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttributes:range:", v25, 0, v19);

      objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 45.0, 1.79769313e308);
      v27 = v26;
      v29 = v28;
      if ((unint64_t)objc_msgSend(v22, "numberOfLineFragments") < 3)
      {
LABEL_13:

        goto LABEL_17;
      }
      objc_msgSend(v22, "setMaximumNumberOfLines:", 2);
      objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 95.0, 1.79769313e308);
    }
    v27 = v23;
    v29 = v24;
    goto LABEL_13;
  }
  objc_msgSend((id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache, "objectForKey:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v17 = v30;
    objc_msgSend(v30, "CGSizeValue");
    v27 = v31;
    v29 = v32;
  }
  else
  {
    objc_msgSend(v9, "size");
    v27 = v33;
    v29 = v34;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache, "setObject:forKey:", v17, v16);
  }
LABEL_17:

  v35 = v27;
  v36 = v29;
  result.height = v36;
  result.width = v35;
  return result;
}

+ (id)_universalPlusImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)_universalPlusImageWithTintColor__sImage;
  if (_universalPlusImageWithTintColor__sImage)
    v6 = _universalPlusImageWithTintColor__sLastTintColor == (_QWORD)v4;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("BuyButtonUniversalIndicator"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_universalPlusImageWithTintColor__sImage;
    _universalPlusImageWithTintColor__sImage = v9;

    objc_msgSend((id)_universalPlusImageWithTintColor__sImage, "_flatImageWithColor:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_universalPlusImageWithTintColor__sImage;
    _universalPlusImageWithTintColor__sImage = v11;

    objc_storeStrong((id *)&_universalPlusImageWithTintColor__sLastTintColor, a3);
    v5 = (void *)_universalPlusImageWithTintColor__sImage;
  }
  v13 = v5;

  return v13;
}

+ (id)playTintColorForBackgroundColor:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = a3;
  if (!playTintColorForBackgroundColor__sDarkBackgroundCloudColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)playTintColorForBackgroundColor__sDarkBackgroundCloudColor;
    playTintColorForBackgroundColor__sDarkBackgroundCloudColor = v4;

  }
  v6 = &defaultCenter_sOnce;
  if (!playTintColorForBackgroundColor__sLightBackgroundCloudColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)playTintColorForBackgroundColor__sLightBackgroundCloudColor;
    playTintColorForBackgroundColor__sLightBackgroundCloudColor = v7;

  }
  v9 = SKUIColorSchemeStyleForColor(v3);
  if (v9 <= 3)
    v6 = (uint64_t *)(id)*off_1E73A8A50[v9];

  return v6;
}

+ (id)playImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)playImageWithTintColor__sUniversalPlayImage;
  if (playImageWithTintColor__sUniversalPlayImage)
    v6 = playImageWithTintColor__sLastPlayTintColor == (_QWORD)v4;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("PlayProduct"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)playImageWithTintColor__sUniversalPlayImage;
    playImageWithTintColor__sUniversalPlayImage = v9;

    objc_msgSend((id)playImageWithTintColor__sUniversalPlayImage, "_flatImageWithColor:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)playImageWithTintColor__sUniversalPlayImage;
    playImageWithTintColor__sUniversalPlayImage = v11;

    objc_storeStrong((id *)&playImageWithTintColor__sLastPlayTintColor, a3);
    v5 = (void *)playImageWithTintColor__sUniversalPlayImage;
  }
  v13 = v5;

  return v13;
}

+ (id)playHighlightImageWithTintColor:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
  if (playHighlightImageWithTintColor__sUniversalPlayHighlightImage)
    v6 = playHighlightImageWithTintColor__sLastPlayHighlightTintColor == (_QWORD)v4;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("PlayProduct"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    playHighlightImageWithTintColor__sUniversalPlayHighlightImage = v9;

    v11 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_flatImageWithColor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    playHighlightImageWithTintColor__sUniversalPlayHighlightImage = v13;

    objc_storeStrong((id *)&playHighlightImageWithTintColor__sLastPlayHighlightTintColor, a3);
    v5 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
  }
  v15 = v5;

  return v15;
}

+ (id)_imageForProgressType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  switch(a3)
  {
    case 2:
      v3 = (void *)_imageForProgressType__sConnectingImage;
      if (_imageForProgressType__sConnectingImage)
        goto LABEL_13;
      v4 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonConnecting"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &_imageForProgressType__sConnectingImage;
      break;
    case 3:
      v3 = (void *)_imageForProgressType__sDownloadingImage;
      if (_imageForProgressType__sDownloadingImage)
        goto LABEL_13;
      v9 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonDownloading"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &_imageForProgressType__sDownloadingImage;
      break;
    case 4:
      v3 = (void *)_imageForProgressType__sPausedImage;
      if (_imageForProgressType__sPausedImage)
        goto LABEL_13;
      v10 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonPaused"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &_imageForProgressType__sPausedImage;
      break;
    case 5:
      v3 = (void *)_imageForProgressType__sPlayImage;
      if (_imageForProgressType__sPlayImage)
        goto LABEL_13;
      v11 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("DownloadProgressButtonPlay"), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &_imageForProgressType__sPlayImage;
      break;
    default:
      v8 = 0;
      return v8;
  }
  v12 = (void *)*v7;
  *v7 = v6;

  v3 = (void *)*v7;
LABEL_13:
  v8 = v3;
  return v8;
}

+ (UIEdgeInsets)_imageInsetsForProgressType:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  UIEdgeInsets result;

  if ((unint64_t)a3 >= 5)
  {
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v4 = 1.0;
      v3 = 1.0 / v10;

      v5 = 0.0;
      v6 = 0.0;
      goto LABEL_3;
    }
    if (a3 != 6)
      goto LABEL_3;
  }
  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
LABEL_3:
  v7 = v3;
  v8 = v4;
  result.right = v6;
  result.bottom = v5;
  result.left = v8;
  result.top = v7;
  return result;
}

+ (id)_basicAnimationWithKeyPath:(id)a3
{
  void *v3;
  float v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  UIAnimationDragCoefficient();
  *(float *)&v5 = 1.0 / v4;
  objc_msgSend(v3, "setSpeed:", v5);
  return v3;
}

- (id)_buttonPropertiesForState:(id)a3
{
  id v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIColor *v10;
  void *v11;
  double v12;
  UIColor *v13;
  uint64_t v14;
  uint64_t v15;
  UIColor *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  UIColor *v20;
  double v21;
  double v22;
  uint64_t v23;
  UIImage *v24;
  UIImage *v25;
  double v26;
  UIImage *image;
  void *v28;
  uint64_t v29;
  double v30;
  int64_t v31;
  void *v32;
  void *v33;
  UIColor *v34;
  void *v35;
  int v36;
  int *v37;
  id v38;
  int v39;
  UIColor *confirmationColor;
  UIColor *v41;
  UIColor *v42;
  UIColor *v43;
  SKUIItemOfferButtonProperties *v44;
  unsigned int v46;
  int64_t fillStyle;
  uint64_t v48;
  uint64_t v49;
  int64_t titleStyle;
  int64_t confirmationTitleStyle;
  unsigned int v52;
  void *v53;
  void *v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  if (-[SKUIItemOfferButton isEnabled](self, "isEnabled"))
    v5 = 1.0;
  else
    v5 = 0.4;
  -[SKUIItemOfferButton bounds](self, "bounds");
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  CGRectGetWidth(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  CGRectGetHeight(v56);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemOfferButton tintColor](self, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alphaComponent");
  objc_msgSend(v11, "colorWithAlphaComponent:", v12 * self->_borderColorAlphaMultiplier);
  v13 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "progressType");
  v15 = v14;
  v54 = v11;
  if (v14)
  {
    v16 = v13;
    v17 = v14;
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "progressType");

    if (v19 == 1)
    {
      v20 = v10;
      UIFloorToViewScale();
      v22 = v21;
      v48 = 0;
      v52 = 0;
      v23 = 0;
      v53 = 0;
      titleStyle = 0;
      confirmationTitleStyle = 0;
      v24 = 0;
      v25 = 0;
      v26 = 1.0;
      v49 = 0x100000000;
    }
    else
    {
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "progressType");

      v26 = 1.0;
      v20 = v10;
      if (v29 == 6)
      {
        v48 = 0;
        v49 = 0;
        v52 = 0;
        v23 = 0;
        v19 = 0;
        v53 = 0;
        titleStyle = 0;
        confirmationTitleStyle = 0;
        v24 = 0;
        v25 = 0;
        v22 = 3.0;
      }
      else
      {
        UIFloorToViewScale();
        v22 = v30;
        v52 = 0;
        v23 = 0;
        v49 = 0;
        titleStyle = 0;
        v53 = 0;
        confirmationTitleStyle = 0;
        v24 = 0;
        v25 = 0;
        v48 = 1;
        v19 = 1;
      }
    }
    v15 = v17;
    v13 = v16;
    goto LABEL_17;
  }
  if (-[SKUIItemOfferButton hasNonBorderedImage](self, "hasNonBorderedImage"))
  {
    v20 = v10;
    image = self->_image;
    if (!image)
      image = self->_cloudImage;
    v24 = image;
    v48 = 0;
    v49 = 0;
    v52 = 0;
    v23 = 0;
    v19 = 0;
    v53 = 0;
    titleStyle = 0;
    confirmationTitleStyle = 0;
    v25 = 0;
    v22 = 3.0;
    v26 = 1.0;
  }
  else
  {
    if (-[SKUIItemOfferButton hasBorderedImage](self, "hasBorderedImage"))
    {
      v20 = v10;
      v25 = self->_borderedImage;
      v52 = 0;
      v23 = 0;
      v19 = 0;
      v49 = 0;
      titleStyle = 0;
      v53 = 0;
      confirmationTitleStyle = 0;
      v24 = 0;
      v22 = 3.0;
      v26 = 1.0;
      v48 = 1;
      goto LABEL_17;
    }
    v36 = objc_msgSend(v4, "showingConfirmation");
    v37 = &OBJC_IVAR___SKUIItemOfferButton__titleAttributedString;
    if (v36)
      v37 = &OBJC_IVAR___SKUIItemOfferButton__confirmationTitleAttributedString;
    v38 = *(id *)((char *)&self->super.super.super.super.isa + *v37);
    v39 = objc_msgSend(v4, "showingConfirmation");
    confirmationColor = v13;
    if (v39)
      confirmationColor = self->_confirmationColor;
    v41 = confirmationColor;
    v42 = v13;

    v13 = v41;
    HIDWORD(v48) = (objc_msgSend(v4, "showingConfirmation") & 1) == 0
                && objc_msgSend(v4, "showsUniversal")
                && self->_universal;
    v15 = 0;
    v46 = objc_msgSend(v4, "showingConfirmation");
    fillStyle = self->_fillStyle;
    v22 = 3.0;
    v53 = v38;
    v52 = v46;
    titleStyle = self->_titleStyle;
    confirmationTitleStyle = self->_confirmationTitleStyle;
    if (fillStyle == 1)
    {
      LODWORD(v48) = objc_msgSend(v38, "length") != 0;
      v13 = v13;

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
      v23 = objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v24 = 0;
      v25 = 0;
      v49 = 1;
      v26 = 0.0;
      v20 = v13;
    }
    else
    {
      v26 = 1.0;
      if (fillStyle)
      {
        v20 = v10;
        LODWORD(v48) = 0;
      }
      else
      {
        LODWORD(v48) = objc_msgSend(v38, "length") != 0;
        if (objc_msgSend(v4, "showingConfirmation"))
        {
          v20 = self->_backgroundColor;

          v23 = 0;
          v19 = 0;
          v24 = 0;
          v25 = 0;
          v49 = 1;
          v15 = 0;
          goto LABEL_17;
        }
        v20 = v10;
      }
      v23 = 0;
      v19 = 0;
      v24 = 0;
      v25 = 0;
      v49 = 1;
    }
  }
LABEL_17:
  if (objc_msgSend(v4, "highlighted"))
  {
    if (v15 || v24 || (v31 = self->_fillStyle, v31 == 2))
    {
      v32 = (void *)v23;
      v34 = v13;
      v5 = 0.200000003;
    }
    else
    {
      if (v31 == 1)
      {
        v32 = (void *)v23;
        SKUIColorByAdjustingBrightness(v20, -0.2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v33;
        v35 = v13;
      }
      else
      {
        v43 = v13;

        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F28]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v23;
        v34 = v43;
      }

      v20 = v34;
    }
  }
  else
  {
    v32 = (void *)v23;
    v34 = v13;
  }
  v44 = objc_alloc_init(SKUIItemOfferButtonProperties);
  -[SKUIItemOfferButtonProperties setHasBorderView:](v44, "setHasBorderView:", v48);
  -[SKUIItemOfferButtonProperties setBorderBackgroundColor:](v44, "setBorderBackgroundColor:", v20);
  -[SKUIItemOfferButtonProperties setBorderColor:](v44, "setBorderColor:", v34);
  -[SKUIItemOfferButtonProperties setBorderCompositingFilter:](v44, "setBorderCompositingFilter:", v32);
  -[SKUIItemOfferButtonProperties setBorderWidth:](v44, "setBorderWidth:", v26);
  -[SKUIItemOfferButtonProperties setBorderCornerRadius:](v44, "setBorderCornerRadius:", v22);
  -[SKUIItemOfferButtonProperties setBorderCornerRadiusMatchesHalfBoundingDimension:](v44, "setBorderCornerRadiusMatchesHalfBoundingDimension:", v19);
  -[SKUIItemOfferButtonProperties setHasTitleLabel:](v44, "setHasTitleLabel:", v49);
  -[SKUIItemOfferButtonProperties setAttributedText:](v44, "setAttributedText:", v53);
  -[SKUIItemOfferButtonProperties setTextColor:](v44, "setTextColor:", v13);
  -[SKUIItemOfferButtonProperties setUniversal:](v44, "setUniversal:", HIDWORD(v48));
  -[SKUIItemOfferButtonProperties setTitleStyle:](v44, "setTitleStyle:", titleStyle);
  -[SKUIItemOfferButtonProperties setConfirmationTitleStyle:](v44, "setConfirmationTitleStyle:", confirmationTitleStyle);
  -[SKUIItemOfferButtonProperties setImage:](v44, "setImage:", v24);
  -[SKUIItemOfferButtonProperties setBorderedImage:](v44, "setBorderedImage:", v25);
  -[SKUIItemOfferButtonProperties setProgressType:](v44, "setProgressType:", objc_msgSend(v4, "progressType"));
  -[SKUIItemOfferButtonProperties setProgressIndeterminate:](v44, "setProgressIndeterminate:", HIDWORD(v49));
  -[SKUIItemOfferButtonProperties setProgress:](v44, "setProgress:", self->_progress);
  -[SKUIItemOfferButtonProperties setAlpha:](v44, "setAlpha:", v5);
  -[SKUIItemOfferButtonProperties setCancelRecognizer:](v44, "setCancelRecognizer:", v52);
  -[SKUIItemOfferButtonProperties setRestores:](v44, "setRestores:", self->_downloadRestores);

  return v44;
}

- (id)_imageForProgressType:(int64_t)a3
{
  void (**centerImageProvider)(id, SKUIItemOfferButton *, int64_t);
  void *v6;

  centerImageProvider = (void (**)(id, SKUIItemOfferButton *, int64_t))self->_centerImageProvider;
  if (!centerImageProvider
    || (centerImageProvider[2](centerImageProvider, self, a3), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "_imageForProgressType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)_horizontalInsetForTitleStyle:(int64_t)a3
{
  double result;

  result = 10.0;
  if (a3 == 2)
    return 7.0;
  return result;
}

- (void)_transitionFromBorderedImage:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  UIImageView *universalImageView;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SKUIItemOfferButton *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v9 = a4;
  v10 = a6;
  -[UIView layer](self->_borderView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "borderCompositingFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompositingFilter:", v12);

  -[SKUIItemOfferButton _adjustViewOrderingForProperties:](self, "_adjustViewOrderingForProperties:", v9);
  if (objc_msgSend(v9, "universal"))
  {
    -[SKUIItemOfferButton _insertUniversalView](self, "_insertUniversalView");
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_universalImageView, "removeFromSuperview");
    universalImageView = self->_universalImageView;
    self->_universalImageView = 0;

  }
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v25 = v10;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__SKUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke;
  v26[3] = &unk_1E739FD10;
  v26[4] = self;
  v27 = v9;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __84__SKUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke_2;
  v23 = &unk_1E73A2760;
  v24 = self;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 7, v26, &v20, a5, 0.0);
  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("borderColor"), v20, v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDuration:", a5);
  objc_msgSend(v16, "borderColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "setToValue:", objc_msgSend(v18, "CGColor"));

  -[UIView layer](self->_borderView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v17, CFSTR("borderColor"));

}

uint64_t __84__SKUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  objc_msgSend(*(id *)(a1 + 40), "borderBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 584);
  objc_msgSend(*(id *)(v4 + 696), "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 584);
  objc_msgSend(*(id *)(a1 + 40), "borderColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v9, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "_sendWillAnimate");
}

uint64_t __84__SKUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (void)_transitionFromTitle:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *universalImageView;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  SKUIItemOfferButton *v26;
  id v27;
  _QWORD v28[5];
  id v29;

  v9 = a4;
  v10 = a6;
  titleLabel = self->_titleLabel;
  objc_msgSend(v9, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](titleLabel, "setAttributedText:", v12);

  -[UIView layer](self->_borderView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "borderCompositingFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", v14);

  -[SKUIItemOfferButton _adjustViewOrderingForProperties:](self, "_adjustViewOrderingForProperties:", v9);
  if (objc_msgSend(v9, "universal"))
  {
    -[SKUIItemOfferButton _insertUniversalView](self, "_insertUniversalView");
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_universalImageView, "removeFromSuperview");
    universalImageView = self->_universalImageView;
    self->_universalImageView = 0;

  }
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v27 = v10;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __76__SKUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke;
  v28[3] = &unk_1E739FD10;
  v28[4] = self;
  v29 = v9;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __76__SKUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke_2;
  v25 = &unk_1E73A2760;
  v26 = self;
  v17 = v10;
  v18 = v9;
  objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 7, v28, &v22, a5, 0.0);
  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("borderColor"), v22, v23, v24, v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDuration:", a5);
  objc_msgSend(v18, "borderColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setToValue:", objc_msgSend(v20, "CGColor"));

  -[UIView layer](self->_borderView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v19, CFSTR("borderColor"));

}

uint64_t __76__SKUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  objc_msgSend(*(id *)(a1 + 40), "borderBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 640);
  objc_msgSend(*(id *)(a1 + 40), "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v6, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "_sendWillAnimate");
}

uint64_t __76__SKUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (void)_transitionFromImage:(id)a3 toImage:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
  UIImageView *imageView;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v9 = a4;
  v10 = a6;
  imageView = self->_imageView;
  objc_msgSend(v9, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v12);

  v13 = (void *)MEMORY[0x1E0DC3F10];
  v17 = v10;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__SKUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke;
  v18[3] = &unk_1E739FD10;
  v18[4] = self;
  v19 = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__SKUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke_2;
  v16[3] = &unk_1E73A2760;
  v16[4] = self;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 7, v18, v16, a5, 0.0);

}

uint64_t __76__SKUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v2, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "_sendWillAnimate");
}

uint64_t __76__SKUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (void)_transitionFromProgress:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9;
  SKUICircleProgressIndicator *progressIndicator;
  id v11;
  SKUICircleProgressIndicator *v12;
  void *v13;
  SKUICircleProgressIndicator *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v9 = a4;
  progressIndicator = self->_progressIndicator;
  v11 = a6;
  objc_msgSend(v9, "progress");
  -[SKUICircleProgressIndicator setProgress:](progressIndicator, "setProgress:");
  -[SKUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", objc_msgSend(v9, "progressIndeterminate"));
  v12 = self->_progressIndicator;
  -[SKUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", objc_msgSend(v9, "progressType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICircleProgressIndicator setImage:](v12, "setImage:", v13);

  v14 = self->_progressIndicator;
  objc_msgSend((id)objc_opt_class(), "_imageInsetsForProgressType:", objc_msgSend(v9, "progressType"));
  -[SKUICircleProgressIndicator setImageInsets:](v14, "setImageInsets:");
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__SKUIItemOfferButton__transitionFromProgress_toProgress_withDuration_completion___block_invoke;
  v17[3] = &unk_1E739FD10;
  v17[4] = self;
  v18 = v9;
  v16 = v9;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 7, v17, v11, a5, 0.0);

}

uint64_t __82__SKUIItemOfferButton__transitionFromProgress_toProgress_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v2, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "_sendWillAnimate");
}

- (void)_transitionFromTitleOrImage:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  UIView *borderView;
  void *v17;
  UIView *v18;
  SKUICircleProgressIndicator *progressIndicator;
  SKUICircleProgressIndicator *v20;
  void *v21;
  void *v22;
  SKUICircleProgressIndicator *v23;
  void *v24;
  void *v25;
  UIImageView *universalImageView;
  UILabel *titleLabel;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  CGAffineTransform v47;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!self->_borderView)
  {
    -[SKUIItemOfferButton _insertBorderView](self, "_insertBorderView");
    -[UIView layer](self->_borderView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "borderCornerRadius");
    objc_msgSend(v13, "setCornerRadius:");

    -[UIView layer](self->_borderView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "borderColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    borderView = self->_borderView;
    objc_msgSend(v11, "borderBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v17);

    self->_borderCornerRadiusMatchesHalfBoundingDimension = objc_msgSend(v11, "borderCornerRadiusMatchesHalfBoundingDimension");
  }
  if ((objc_msgSend(v10, "hasBorderView") & 1) == 0)
  {
    v18 = self->_borderView;
    CGAffineTransformMakeScale(&v47, 0.0, 0.0);
    -[UIView setTransform:](v18, "setTransform:", &v47);
  }
  -[SKUIItemOfferButton _insertProgressIndicator](self, "_insertProgressIndicator");
  progressIndicator = self->_progressIndicator;
  objc_msgSend(v11, "progress");
  -[SKUICircleProgressIndicator setProgress:](progressIndicator, "setProgress:");
  -[SKUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", objc_msgSend(v11, "progressIndeterminate"));
  v20 = self->_progressIndicator;
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", objc_msgSend(v21, "progressType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICircleProgressIndicator setImage:](v20, "setImage:", v22);

  v23 = self->_progressIndicator;
  v24 = (void *)objc_opt_class();
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_imageInsetsForProgressType:", objc_msgSend(v25, "progressType"));
  -[SKUICircleProgressIndicator setImageInsets:](v23, "setImageInsets:");

  -[SKUICircleProgressIndicator setHidden:](self->_progressIndicator, "setHidden:", 1);
  -[UIImageView removeFromSuperview](self->_universalImageView, "removeFromSuperview");
  universalImageView = self->_universalImageView;
  self->_universalImageView = 0;

  -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  -[UIView layer](self->_borderView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderWidth");
  objc_msgSend(v28, "setBorderWidth:");

  -[UIView layer](self->_borderView, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderCompositingFilter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCompositingFilter:", v30);

  -[SKUIItemOfferButton _adjustViewOrderingForProperties:](self, "_adjustViewOrderingForProperties:", v11);
  v31 = MEMORY[0x1E0C809B0];
  v32 = (void *)MEMORY[0x1E0DC3F10];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __86__SKUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke;
  v45[3] = &unk_1E739FD10;
  v45[4] = self;
  v46 = v11;
  v42[0] = v31;
  v42[1] = 3221225472;
  v42[2] = __86__SKUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke_2;
  v42[3] = &unk_1E73A6BD8;
  v42[4] = self;
  v43 = v46;
  v44 = v12;
  v33 = v12;
  v34 = v46;
  objc_msgSend(v32, "animateWithDuration:animations:completion:", v45, v42, a5);
  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("borderColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDuration:", a5);
  objc_msgSend(v34, "borderColor");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v35, "setToValue:", objc_msgSend(v36, "CGColor"));

  -[UIView layer](self->_borderView, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v35, CFSTR("borderColor"));

  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("cornerRadius"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDuration:", a5);
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "borderCornerRadius");
  objc_msgSend(v39, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setToValue:", v40);

  -[UIView layer](self->_borderView, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addAnimation:forKey:", v38, CFSTR("cornerRadius"));

}

uint64_t __86__SKUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  _OWORD v8[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  objc_msgSend(*(id *)(a1 + 40), "borderBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setAlpha:", 0.0);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v6, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 32), "_sendWillAnimate");
}

uint64_t __86__SKUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setHidden:", 0);
    if ((objc_msgSend(*(id *)(a1 + 40), "hasBorderView") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "removeFromSuperview");
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 480);
      *(_QWORD *)(v4 + 480) = 0;

    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (void)_transitionFromProgress:(id)a3 toTitleOrImage:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  UIView *borderView;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  void *v18;
  id *p_imageView;
  UIImageView *imageView;
  void *v21;
  UILabel *titleLabel;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  SKUICircleProgressIndicator *progressIndicator;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  SKUIItemOfferButton *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  SKUIItemOfferButton *v46;
  _OWORD v47[3];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  borderView = self->_borderView;
  if (!borderView)
  {
    -[SKUIItemOfferButton _insertBorderView](self, "_insertBorderView");
    -[UIView layer](self->_borderView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "borderCornerRadius");
    objc_msgSend(v14, "setCornerRadius:");

    -[UIView layer](self->_borderView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "borderColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    self->_borderCornerRadiusMatchesHalfBoundingDimension = objc_msgSend(v10, "borderCornerRadiusMatchesHalfBoundingDimension");
    borderView = self->_borderView;
  }
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v47[0] = *MEMORY[0x1E0C9BAA8];
  v47[1] = v17;
  v47[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](borderView, "setTransform:", v47);
  objc_msgSend(v11, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SKUIItemOfferButton _insertImageView](self, "_insertImageView");
    p_imageView = (id *)&self->_imageView;
    imageView = self->_imageView;
    objc_msgSend(v11, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](imageView, "setImage:", v21);
  }
  else
  {
    -[SKUIItemOfferButton _insertLabel](self, "_insertLabel");
    p_imageView = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    objc_msgSend(v11, "attributedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](titleLabel, "setAttributedText:", v23);

    v24 = self->_titleLabel;
    objc_msgSend(v11, "textColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v21);
  }

  objc_msgSend(*p_imageView, "setAlpha:", 0.0);
  -[UIView layer](self->_borderView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderWidth");
  objc_msgSend(v25, "setBorderWidth:");

  -[UIView layer](self->_borderView, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "borderCompositingFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCompositingFilter:", v27);

  -[SKUICircleProgressIndicator removeFromSuperview](self->_progressIndicator, "removeFromSuperview");
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = 0;

  -[SKUIItemOfferButton _adjustViewOrderingForProperties:](self, "_adjustViewOrderingForProperties:", v11);
  v29 = (void *)MEMORY[0x1E0DC3F10];
  v30 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __86__SKUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke;
  v44[3] = &unk_1E739FD10;
  v45 = v11;
  v46 = self;
  v40[0] = v30;
  v40[1] = 3221225472;
  v40[2] = __86__SKUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke_2;
  v40[3] = &unk_1E73A6BD8;
  v41 = v45;
  v42 = self;
  v43 = v12;
  v31 = v12;
  v32 = v45;
  objc_msgSend(v29, "animateWithDuration:animations:completion:", v44, v40, a5);
  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("borderColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDuration:", a5);
  objc_msgSend(v32, "borderColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "setToValue:", objc_msgSend(v34, "CGColor"));

  -[UIView layer](self->_borderView, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addAnimation:forKey:", v33, CFSTR("borderColor"));

  objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", CFSTR("cornerRadius"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDuration:", a5);
  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v32, "borderCornerRadius");
  objc_msgSend(v37, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setToValue:", v38);

  -[UIView layer](self->_borderView, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addAnimation:forKey:", v36, CFSTR("cornerRadius"));

}

uint64_t __86__SKUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v7;

  if (!objc_msgSend(*(id *)(a1 + 32), "hasBorderView"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 480);
    CGAffineTransformMakeScale(&v7, 0.0, 0.0);
    objc_msgSend(v2, "setTransform:", &v7);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 480);
  objc_msgSend(*(id *)(a1 + 32), "borderBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 640), "setAlpha:", 1.0);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  objc_msgSend(v5, "setAlpha:");
  return objc_msgSend(*(id *)(a1 + 40), "_sendWillAnimate");
}

uint64_t __86__SKUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if ((_DWORD)a2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hasBorderView") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "removeFromSuperview");
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 480);
      *(_QWORD *)(v4 + 480) = 0;

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "universal") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_insertUniversalView");
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  return objc_msgSend(*(id *)(a1 + 40), "_sendDidAnimate");
}

- (void)_adjustViewOrderingForProperties:(id)a3
{
  id v4;
  void *v5;
  _QWORD *p_titleLabel;
  _QWORD *p_borderView;
  void *v8;
  id v9;

  v4 = a3;
  if (self->_borderView)
  {
    if (self->_titleLabel)
    {
      v9 = v4;
      objc_msgSend(v4, "borderCompositingFilter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        p_titleLabel = &self->_titleLabel;
      else
        p_titleLabel = &self->_borderView;
      if (v5)
        p_borderView = &self->_borderView;
      else
        p_borderView = &self->_titleLabel;
LABEL_15:
      -[SKUIItemOfferButton insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *p_borderView, *p_titleLabel);
      v4 = v9;
      goto LABEL_16;
    }
    if (self->_borderedImage)
    {
      v9 = v4;
      objc_msgSend(v4, "borderCompositingFilter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      p_borderView = &self->_borderedImageView;
      if (v8)
        p_titleLabel = &self->_borderedImageView;
      else
        p_titleLabel = &self->_borderView;
      if (v8)
        p_borderView = &self->_borderView;
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)_insertProgressIndicator
{
  SKUICircleProgressIndicator *v3;
  SKUICircleProgressIndicator *v4;
  SKUICircleProgressIndicator *progressIndicator;
  SKUICircleProgressIndicator *v6;
  void *v7;

  if (!self->_progressIndicator)
  {
    v3 = [SKUICircleProgressIndicator alloc];
    -[SKUIItemOfferButton bounds](self, "bounds");
    v4 = -[SKUICircleProgressIndicator initWithFrame:](v3, "initWithFrame:");
    progressIndicator = self->_progressIndicator;
    self->_progressIndicator = v4;

    -[SKUICircleProgressIndicator setAutoresizingMask:](self->_progressIndicator, "setAutoresizingMask:", 18);
    v6 = self->_progressIndicator;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICircleProgressIndicator setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUICircleProgressIndicator _setHidesBorderView:](self->_progressIndicator, "_setHidesBorderView:", 1);
    -[SKUICircleProgressIndicator setUserInteractionEnabled:](self->_progressIndicator, "setUserInteractionEnabled:", 0);
    -[SKUIItemOfferButton addSubview:](self, "addSubview:", self->_progressIndicator);
  }
}

- (void)_insertBorderView
{
  UIView *v3;
  UIView *borderView;
  UIView *v5;

  if (!self->_borderView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = self->_borderView;
    self->_borderView = v3;

    -[UIView setAutoresizingMask:](self->_borderView, "setAutoresizingMask:", 18);
    v5 = self->_borderView;
    -[SKUIItemOfferButton bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setUserInteractionEnabled:](self->_borderView, "setUserInteractionEnabled:", 0);
    -[SKUIItemOfferButton addSubview:](self, "addSubview:", self->_borderView);
  }
}

- (void)_insertLabel
{
  UILabel *v3;
  UILabel *titleLabel;

  if (!self->_titleLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[SKUIItemOfferButton addSubview:](self, "addSubview:", self->_titleLabel);
    -[SKUIItemOfferButton layoutSubviews](self, "layoutSubviews");
  }
}

- (void)_insertImageView
{
  id v3;
  UIImageView *v4;
  UIImageView *imageView;

  if (!self->_imageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[SKUIItemOfferButton bounds](self, "bounds");
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    -[SKUIItemOfferButton addSubview:](self, "addSubview:", self->_imageView);
  }
}

- (void)_insertBorderedImageView
{
  id v3;
  UIImageView *v4;
  UIImageView *borderedImageView;

  if (!self->_borderedImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[SKUIItemOfferButton _borderedImageViewFrame](self, "_borderedImageViewFrame");
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    borderedImageView = self->_borderedImageView;
    self->_borderedImageView = v4;

    -[SKUIItemOfferButton addSubview:](self, "addSubview:", self->_borderedImageView);
  }
}

- (CGRect)_borderedImageViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SKUIItemOfferButton bounds](self, "bounds");
  v4 = v3 + -16.0;
  v5 = 0.0;
  v6 = 8.0;
  result.size.height = v4;
  result.size.width = v2;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_insertUniversalView
{
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *universalImageView;
  id v7;

  if (!self->_universalImageView)
  {
    v3 = (void *)objc_opt_class();
    -[SKUIItemOfferButton tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_universalPlusImageWithTintColor:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    universalImageView = self->_universalImageView;
    self->_universalImageView = v5;

    -[SKUIItemOfferButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_universalImageView, 0);
    -[UIImageView frame](self->_universalImageView, "frame");
    -[UIImageView setFrame:](self->_universalImageView, "setFrame:", 3.0, 3.0);

  }
}

- (void)_insertCancelGestureRecognizer
{
  SKUIFocusedTouchGestureRecognizer *v3;
  SKUIFocusedTouchGestureRecognizer *cancelGestureRecognizer;
  id v5;

  if (!self->_cancelGestureRecognizer)
  {
    v3 = -[SKUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:]([SKUIFocusedTouchGestureRecognizer alloc], "initWithFocusedView:touchAllowance:", self, -10.0, -10.0, -10.0, -10.0);
    cancelGestureRecognizer = self->_cancelGestureRecognizer;
    self->_cancelGestureRecognizer = v3;

    -[SKUIFocusedTouchGestureRecognizer addTarget:action:](self->_cancelGestureRecognizer, "addTarget:action:", self, sel__cancelGestureAction_);
  }
  -[SKUIItemOfferButton window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_cancelGestureRecognizer);

}

- (void)_removeCancelGestureRecognizer
{
  SKUIFocusedTouchGestureRecognizer *cancelGestureRecognizer;
  void *v4;
  SKUIFocusedTouchGestureRecognizer *v5;

  cancelGestureRecognizer = self->_cancelGestureRecognizer;
  if (cancelGestureRecognizer)
  {
    -[SKUIFocusedTouchGestureRecognizer view](cancelGestureRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_cancelGestureRecognizer);

    -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelGestureRecognizer, "removeTarget:action:", self, 0);
    v5 = self->_cancelGestureRecognizer;
    self->_cancelGestureRecognizer = 0;

  }
}

- (void)_reloadForCurrentState:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  __int128 *v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  __int128 v21;
  UIView *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  UIImageView *v28;
  void *v29;
  void *v30;
  UIImage *image;
  UIImageView *v32;
  void *v33;
  UIImageView *v34;
  void *v35;
  UIImageView *v36;
  void *v37;
  SKUICircleProgressIndicator *v38;
  SKUICircleProgressIndicator *v39;
  void *v40;
  SKUICircleProgressIndicator *v41;
  SKUICircleProgressIndicator *v42;
  UIView *v43;
  __int128 v44;
  void *v45;
  UIView *borderView;
  UILabel *titleLabel;
  UIImageView *universalImageView;
  UIImageView *imageView;
  UIImageView *borderedImageView;
  SKUICircleProgressIndicator *progressIndicator;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  if (!a3)
  {
    -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "progressType"))
    {

    }
    else
    {
      -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "showingConfirmation");

      if ((v6 & 1) == 0)
      {
        -[SKUIItemOfferButton setClipsToBounds:](self, "setClipsToBounds:", 0);
        -[UIView removeFromSuperview](self->_borderView, "removeFromSuperview");
        borderView = self->_borderView;
        self->_borderView = 0;

        -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
        titleLabel = self->_titleLabel;
        self->_titleLabel = 0;

        -[UIImageView removeFromSuperview](self->_universalImageView, "removeFromSuperview");
        universalImageView = self->_universalImageView;
        self->_universalImageView = 0;

        -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
        imageView = self->_imageView;
        self->_imageView = 0;

        -[UIImageView removeFromSuperview](self->_borderedImageView, "removeFromSuperview");
        borderedImageView = self->_borderedImageView;
        self->_borderedImageView = 0;

        -[SKUICircleProgressIndicator removeFromSuperview](self->_progressIndicator, "removeFromSuperview");
        progressIndicator = self->_progressIndicator;
        self->_progressIndicator = 0;

        -[SKUIItemOfferButton _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
        self->_usesDrawRectPath = 1;
        -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");
        return;
      }
    }
  }
  -[SKUIItemOfferButton setClipsToBounds:](self, "setClipsToBounds:", 1);
  self->_usesDrawRectPath = 0;
  -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");
  -[SKUIItemOfferButton buttonDescriptor](self, "buttonDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemOfferButton _buttonPropertiesForState:](self, "_buttonPropertiesForState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hasBorderView");
  v10 = (__int128 *)MEMORY[0x1E0C9BAA8];
  if (v9)
  {
    -[SKUIItemOfferButton _insertBorderView](self, "_insertBorderView");
    -[UIView layer](self->_borderView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllAnimations");

    v12 = self->_borderView;
    objc_msgSend(v8, "borderBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView layer](self->_borderView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "borderColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    -[UIView layer](self->_borderView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "borderCompositingFilter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCompositingFilter:", v17);

    -[UIView layer](self->_borderView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "borderWidth");
    objc_msgSend(v18, "setBorderWidth:");

    -[UIView layer](self->_borderView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "borderCornerRadius");
    objc_msgSend(v19, "setCornerRadius:");

    v20 = self->_borderView;
    v21 = v10[1];
    v52 = *v10;
    v53 = v21;
    v54 = v10[2];
    -[UIView setTransform:](v20, "setTransform:", &v52);
    self->_borderCornerRadiusMatchesHalfBoundingDimension = objc_msgSend(v8, "borderCornerRadiusMatchesHalfBoundingDimension");
  }
  else
  {
    -[UIView removeFromSuperview](self->_borderView, "removeFromSuperview");
    v22 = self->_borderView;
    self->_borderView = 0;

  }
  if (objc_msgSend(v8, "hasTitleLabel"))
  {
    -[SKUIItemOfferButton _insertLabel](self, "_insertLabel");
    -[UILabel layer](self->_titleLabel, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllAnimations");

    v24 = self->_titleLabel;
    objc_msgSend(v8, "textColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    v26 = self->_titleLabel;
    objc_msgSend(v8, "attributedText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v26, "setAttributedText:", v27);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    v27 = self->_titleLabel;
    self->_titleLabel = 0;
  }

  -[SKUIItemOfferButton _adjustViewOrderingForProperties:](self, "_adjustViewOrderingForProperties:", v8);
  if (objc_msgSend(v8, "universal"))
  {
    -[SKUIItemOfferButton _insertUniversalView](self, "_insertUniversalView");
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_universalImageView, "removeFromSuperview");
    v28 = self->_universalImageView;
    self->_universalImageView = 0;

  }
  objc_msgSend(v8, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SKUIItemOfferButton _insertImageView](self, "_insertImageView");
    -[UIImageView layer](self->_imageView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeAllAnimations");

    image = self->_image;
    if (!image)
      image = self->_cloudImage;
    -[UIImageView setImage:](self->_imageView, "setImage:", image);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    v32 = self->_imageView;
    self->_imageView = 0;

  }
  objc_msgSend(v8, "borderedImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SKUIItemOfferButton _insertBorderedImageView](self, "_insertBorderedImageView");
    -[UIImageView setImage:](self->_borderedImageView, "setImage:", self->_borderedImage);
    v34 = self->_borderedImageView;
    -[SKUIItemOfferButton tintColor](self, "tintColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v34, "setTintColor:", v35);

    -[UIImageView setContentMode:](self->_borderedImageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](self->_borderedImageView, "setClipsToBounds:", 1);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_borderedImageView, "removeFromSuperview");
    v36 = self->_borderedImageView;
    self->_borderedImageView = 0;

  }
  if (objc_msgSend(v8, "progressType"))
  {
    -[SKUIItemOfferButton _insertProgressIndicator](self, "_insertProgressIndicator");
    -[SKUICircleProgressIndicator layer](self->_progressIndicator, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeAllAnimations");

    v38 = self->_progressIndicator;
    objc_msgSend(v8, "progress");
    -[SKUICircleProgressIndicator setProgress:](v38, "setProgress:");
    -[SKUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", objc_msgSend(v8, "progressIndeterminate"));
    v39 = self->_progressIndicator;
    -[SKUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", objc_msgSend(v8, "progressType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICircleProgressIndicator setImage:](v39, "setImage:", v40);

    v41 = self->_progressIndicator;
    objc_msgSend((id)objc_opt_class(), "_imageInsetsForProgressType:", objc_msgSend(v8, "progressType"));
    -[SKUICircleProgressIndicator setImageInsets:](v41, "setImageInsets:");
  }
  else
  {
    -[SKUICircleProgressIndicator removeFromSuperview](self->_progressIndicator, "removeFromSuperview");
    v42 = self->_progressIndicator;
    self->_progressIndicator = 0;

  }
  -[UIImageView setAlpha:](self->_universalImageView, "setAlpha:", 1.0);
  v43 = self->_borderView;
  v44 = v10[1];
  v52 = *v10;
  v53 = v44;
  v54 = v10[2];
  -[UIView setTransform:](v43, "setTransform:", &v52);
  if ((objc_msgSend(v8, "cancelRecognizer") & 1) != 0)
    -[SKUIItemOfferButton _insertCancelGestureRecognizer](self, "_insertCancelGestureRecognizer");
  else
    -[SKUIItemOfferButton _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
  -[SKUIItemOfferButton layer](self, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "removeAllAnimations");

  objc_msgSend(v8, "alpha");
  -[SKUIItemOfferButton setAlpha:](self, "setAlpha:");

}

- (void)_sendDidAnimate
{
  SKUIItemOfferButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "itemOfferButtonDidAnimateTransition:", self);

  }
}

- (void)_sendWillAnimate
{
  SKUIItemOfferButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "itemOfferButtonWillAnimateTransition:", self);

  }
}

- (void)_updateForChangedConfirmationTitleProperty
{
  int64_t confirmationTitleStyle;
  void *v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  void *v8;
  CGSize *p_confirmationTitleFitSize;
  void *v10;
  int64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  confirmationTitleStyle = self->_confirmationTitleStyle;
  if (confirmationTitleStyle == 1)
  {
    v15 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v16;
    v7 = &v15;
  }
  else
  {
    if (confirmationTitleStyle)
      goto LABEL_7;
    v17 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v18;
    v7 = &v17;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableAttributedString addAttributes:range:](self->_confirmationTitleAttributedString, "addAttributes:range:", v8, 0, -[NSMutableAttributedString length](self->_confirmationTitleAttributedString, "length"));

  }
LABEL_7:
  if ((objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", self->_confirmationTitleStyle) & 1) != 0)
  {
    -[SKUIItemOfferButton setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    p_confirmationTitleFitSize = &self->_confirmationTitleFitSize;
    if (self->_confirmationTitleAttributedString)
    {
      v10 = (void *)objc_opt_class();
      v11 = self->_confirmationTitleStyle;
      v12 = (void *)-[NSMutableAttributedString mutableCopy](self->_confirmationTitleAttributedString, "mutableCopy");
      objc_msgSend(v10, "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v11, v12, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      p_confirmationTitleFitSize->width = v13;
      self->_confirmationTitleFitSize.height = v14;

    }
    else
    {
      *p_confirmationTitleFitSize = *(CGSize *)MEMORY[0x1E0C9D820];
    }
  }
  -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
}

- (void)_updateForChangedTitleProperty
{
  int64_t titleStyle;
  void *v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  void *v8;
  CGSize *p_titleFitSize;
  void *v10;
  int64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  titleStyle = self->_titleStyle;
  if (titleStyle == 1)
  {
    v15 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v16;
    v7 = &v15;
  }
  else
  {
    if (titleStyle)
      goto LABEL_7;
    v17 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v18;
    v7 = &v17;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableAttributedString addAttributes:range:](self->_titleAttributedString, "addAttributes:range:", v8, 0, -[NSMutableAttributedString length](self->_titleAttributedString, "length"));

  }
LABEL_7:
  if (self->_usesDrawRectPath)
    -[SKUIItemOfferButton setNeedsDisplay](self, "setNeedsDisplay");
  if ((objc_msgSend((id)objc_opt_class(), "_sizeMattersForTitleStyle:", self->_titleStyle) & 1) != 0)
  {
    -[SKUIItemOfferButton setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    p_titleFitSize = &self->_titleFitSize;
    if (self->_titleAttributedString)
    {
      v10 = (void *)objc_opt_class();
      v11 = self->_titleStyle;
      v12 = (void *)-[NSMutableAttributedString mutableCopy](self->_titleAttributedString, "mutableCopy");
      objc_msgSend(v10, "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v11, v12, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      p_titleFitSize->width = v13;
      self->_titleFitSize.height = v14;

    }
    else
    {
      *p_titleFitSize = *(CGSize *)MEMORY[0x1E0C9D820];
    }
  }
  -[SKUIItemOfferButton _reloadForCurrentState:](self, "_reloadForCurrentState:", 0);
}

- (UIColor)cloudTintColor
{
  return self->_cloudTintColor;
}

- (int64_t)confirmationTitleStyle
{
  return self->_confirmationTitleStyle;
}

- (SKUIItemOfferButtonDelegate)delegate
{
  return (SKUIItemOfferButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)fillStyle
{
  return self->_fillStyle;
}

- (BOOL)showsConfirmationState
{
  return self->_showsConfirmationState;
}

- (void)setShowsConfirmationState:(BOOL)a3
{
  self->_showsConfirmationState = a3;
}

- (int64_t)titleStyle
{
  return self->_titleStyle;
}

- (BOOL)isUniversal
{
  return self->_universal;
}

- (UIImage)borderedImage
{
  return self->_borderedImage;
}

- (id)centerImageProvider
{
  return self->_centerImageProvider;
}

- (void)setCenterImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (double)borderColorAlphaMultiplier
{
  return self->_borderColorAlphaMultiplier;
}

- (double)progress
{
  return self->_progress;
}

- (void)setButtonDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonDescriptor, a3);
}

- (void)setBuyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 728);
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (SKUIButtonViewElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_buyType, 0);
  objc_storeStrong((id *)&self->_buttonDescriptor, 0);
  objc_storeStrong(&self->_centerImageProvider, 0);
  objc_storeStrong((id *)&self->_borderedImage, 0);
  objc_storeStrong((id *)&self->_offerButtonStateDescription, 0);
  objc_storeStrong((id *)&self->_universalImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_borderedImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationTitleAttributedString, 0);
  objc_storeStrong((id *)&self->_confirmationColor, 0);
  objc_storeStrong((id *)&self->_cloudTintColor, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_cancelGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemOfferButton initWithFrame:]";
}

@end
