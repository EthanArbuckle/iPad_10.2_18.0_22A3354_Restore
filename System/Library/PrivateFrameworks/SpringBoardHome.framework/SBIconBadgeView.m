@implementation SBIconBadgeView

- (void)setParallaxSettings:(id)a3
{
  SBFParallaxSettings *v5;
  SBFParallaxSettings *parallaxSettings;
  SBFParallaxSettings *v7;

  v5 = (SBFParallaxSettings *)a3;
  parallaxSettings = self->_parallaxSettings;
  if (parallaxSettings != v5)
  {
    v7 = v5;
    -[SBFParallaxSettings removeKeyObserver:](parallaxSettings, "removeKeyObserver:", self);
    objc_storeStrong((id *)&self->_parallaxSettings, a3);
    -[SBFParallaxSettings addKeyObserver:](self->_parallaxSettings, "addKeyObserver:", self);
    -[SBIconBadgeView _applyParallaxSettings](self, "_applyParallaxSettings");
    v5 = v7;
  }

}

- (BOOL)displayingAccessory
{
  return self->_displayingAccessory;
}

+ (id)_createImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  _QWORD v52[4];
  id v53;
  id v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[2];
  _QWORD v62[2];
  void *v63;
  uint64_t v64;
  _QWORD v65[2];
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v65[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5 || !objc_msgSend(v7, "length") || (objc_msgSend(v7, "isEqualToString:", CFSTR("*")) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v11 = objc_msgSend(v7, "length") != 1;
    objc_msgSend(v8, "fontDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0DC1380];
    v13 = *MEMORY[0x1E0DC13D0];
    v61[0] = *MEMORY[0x1E0DC13D8];
    v61[1] = v13;
    v62[0] = &unk_1E8E16DE0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v21, "setLineBreakMode:", 5);
    v22 = *MEMORY[0x1E0DC1138];
    v60[0] = v19;
    v23 = *MEMORY[0x1E0DC1140];
    v59[0] = v22;
    v59[1] = v23;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = *MEMORY[0x1E0DC1178];
    v60[1] = v24;
    v60[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "pointSize");
    v27 = dbl_1D0193EB0[v26 > 16.0];
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v27, 1.79769313e308);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 0, v25, 0, v27, 1.79769313e308);
    v50 = v37;
    v51 = v36;
    v39 = v38;
    v41 = v40;
    v66.origin.x = v29;
    v66.origin.y = v31;
    v66.size.width = v33;
    v66.size.height = v35;
    v42 = round(CGRectGetWidth(v66));
    v67.origin.x = v29;
    v67.origin.y = v31;
    v67.size.width = v33;
    v67.size.height = v35;
    v43 = round(CGRectGetHeight(v67));
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v42, v43);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __56__SBIconBadgeView__createImageForText_font_highlighted___block_invoke;
    v52[3] = &unk_1E8D86628;
    v55 = v29;
    v56 = v31;
    v57 = v33;
    v58 = v35;
    v53 = v7;
    v54 = v25;
    v45 = v25;
    objc_msgSend(v44, "imageWithActions:", v52);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v68.origin.y = v50;
    v68.origin.x = v51;
    v68.size.width = v39;
    v68.size.height = v41;
    v47 = fabs(CGRectGetMinY(v68));
    objc_msgSend(v46, "imageWithBaselineOffsetFromBottom:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "capHeight");
    objc_msgSend(v48, "imageWithAlignmentRectInsets:", v43 - v47 - v49, 0.0, v47, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v19;
  }

  return v9;
}

- (void)setAccessoryBrightness:(double)a3
{
  id v5;

  -[SBIconBadgeView setBrightness:](self, "setBrightness:");
  -[UIView sbh_darkener](self->_backgroundView, "sbh_darkener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBrightness:", a3);

}

- (void)_applyParallaxSettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SBFParallaxSettings *parallaxSettings;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  CATransform3D v25;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_motionEffectsSupported"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[SBIconBadgeView _motionEffects](self, "_motionEffects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v30;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(v3);
          -[SBIconBadgeView _removeMotionEffect:](self, "_removeMotionEffect:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v5);
    }

    parallaxSettings = self->_parallaxSettings;
    if (parallaxSettings)
    {
      -[SBFParallaxSettings slidePixelsX](parallaxSettings, "slidePixelsX");
      v10 = v9 * (double)-[SBFParallaxSettings slideDirectionX](self->_parallaxSettings, "slideDirectionX") * 0.5;
      -[SBFParallaxSettings slidePixelsY](self->_parallaxSettings, "slidePixelsY");
      v12 = v11 * (double)-[SBFParallaxSettings slideDirectionY](self->_parallaxSettings, "slideDirectionY") * 0.5;
      v13 = fabs(v12);
      if (fabs(v10) >= 2.22044605e-16 && v13 >= 2.22044605e-16)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("layer.transform"), 0);
        v16 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeTranslation(&v28, -v10, 0.0, 0.0);
        objc_msgSend(v16, "valueWithCATransform3D:", &v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMinimumRelativeValue:", v17);

        v18 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeTranslation(&v27, v10, 0.0, 0.0);
        objc_msgSend(v18, "valueWithCATransform3D:", &v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMaximumRelativeValue:", v19);

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("layer.transform"), 1);
        v21 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeTranslation(&v26, 0.0, -v12, 0.0);
        objc_msgSend(v21, "valueWithCATransform3D:", &v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setMinimumRelativeValue:", v22);

        v23 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeTranslation(&v25, 0.0, v12, 0.0);
        objc_msgSend(v23, "valueWithCATransform3D:", &v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setMaximumRelativeValue:", v24);

        -[SBIconBadgeView _addMotionEffect:](self, "_addMotionEffect:", v15);
        -[SBIconBadgeView _addMotionEffect:](self, "_addMotionEffect:", v20);

      }
    }
  }
}

- (void)setListLayout:(id)a3
{
  SBIconListLayout *v5;
  SBIconListLayout *v6;

  v5 = (SBIconListLayout *)a3;
  if (self->_listLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_listLayout, a3);
    -[SBIconBadgeView _clearText](self, "_clearText");
    -[SBIconBadgeView setNeedsLayout](self, "setNeedsLayout");
    -[SBIconBadgeView layoutIfNeeded](self, "layoutIfNeeded");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  double width;
  double height;
  UIView *backgroundView;
  UIView *v6;
  double v7;
  double v8;
  int v9;
  UIView *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)SBIconBadgeView;
  -[SBIconBadgeView layoutSubviews](&v11, sel_layoutSubviews);
  -[SBIconBadgeView bounds](self, "bounds");
  BSRectWithSize();
  v13 = CGRectInset(v12, 1.0, 1.0);
  width = v13.size.width;
  height = v13.size.height;
  backgroundView = self->_backgroundView;
  BSRectWithSize();
  -[UIView setBounds:](backgroundView, "setBounds:");
  v6 = self->_backgroundView;
  UIRectGetCenter();
  -[UIView setCenter:](v6, "setCenter:");
  if (width <= height)
    v7 = width;
  else
    v7 = height;
  v8 = v7 * 0.5;
  v9 = BSFloatEqualToFloat();
  v10 = self->_backgroundView;
  if (v9)
    -[UIView _setCornerRadius:](v10, "_setCornerRadius:", v8);
  else
    -[UIView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", v8);
  if (self->_textView)
    -[SBIconBadgeView _layOutTextImageView:](self, "_layOutTextImageView:");
  if (self->_incomingTextView)
    -[SBIconBadgeView _layOutTextImageView:](self, "_layOutTextImageView:");
}

- (void)_layOutTextImageView:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  -[SBIconBadgeView badgeContentScale](self, "badgeContentScale");
  objc_msgSend(v4, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  objc_msgSend(v7, "alignmentRectInsets");
  v6 = v5;
  -[UIView bounds](self->_backgroundView, "bounds");
  UIRectCenteredRect();
  SBHEdgeInsetsInvert(v6);
  UIRectIntegralWithScale();
  objc_msgSend(v4, "setFrame:");

}

- (double)badgeContentScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[SBIconBadgeView listLayout](self, "listLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBIconBadgeView listLayout](self, "listLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconImageInfo");
    v6 = v5;
  }
  else
  {
    -[SBIconBadgeView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v6 = v7;
  }

  return v6;
}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconBadgeView layoutOffset](self, "layoutOffset");
  v9 = v8;
  v11 = v10;
  -[SBIconBadgeView bounds](self, "bounds");
  v14 = SBIconBadgeViewCalculateAccessoryCenter(objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height, v12, v13, v9, v11);
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)layoutOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[SBIconBadgeView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessoryOffset(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)prepareForReuse
{
  NSString *text;

  self->_displayingAccessory = 0;
  text = self->_text;
  self->_text = 0;

  -[SBIconBadgeView _clearText](self, "_clearText");
  -[UIImageView setImage:](self->_textView, "setImage:", 0);
  -[SBIconBadgeView _resizeForTextImage:](self, "_resizeForTextImage:", 0);
  -[SBIconBadgeView setOverrideFont:](self, "setOverrideFont:", 0);
  -[SBIconBadgeView setOverrideText:](self, "setOverrideText:", 0);
  -[SBIconBadgeView setOverridePaddingFactor:](self, "setOverridePaddingFactor:", 0.0);
  -[SBIconBadgeView setOverrideIconImageAppearance:](self, "setOverrideIconImageAppearance:", 0);
}

uint64_t __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resizeForTextImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBHIconAccessoryCountedMapImageTuple image](self->_textImageTuple, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconBadgeView intrinsicContentSizeForTextImage:](self, "intrinsicContentSizeForTextImage:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)configureForIcon:(id)a3 infoProvider:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  -[SBIconBadgeView accessoryTextForIcon:infoProvider:](self, "accessoryTextForIcon:infoProvider:", a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHighlighted");

  -[SBIconBadgeView _configureForText:highlighted:](self, "_configureForText:highlighted:", v8, v7);
}

- (void)_resizeForTextImage:(id)a3
{
  double v4;
  double v5;

  -[SBIconBadgeView intrinsicContentSizeForTextImage:](self, "intrinsicContentSizeForTextImage:", a3);
  -[SBIconBadgeView setBounds:](self, "setBounds:", 0.0, 0.0, v4, v5);
  -[SBIconBadgeView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)intrinsicContentSizeForTextImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v4 = a3;
  -[SBIconBadgeView listLayout](self, "listLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
  }
  objc_msgSend((id)objc_opt_class(), "_textPadding");
  v9 = v8;
  if (v5)
  {
    -[SBIconBadgeView badgeSize](self, "badgeSize");
    v12 = v11;
    if (v7 + v9 >= v10)
      v13 = v7 + v9;
    else
      v13 = v10;
  }
  else
  {
    -[SBIconBadgeView font](self, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    -[SBIconBadgeView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayScale");

    BSSizeCeilForScale();
    v13 = v16;
    v12 = v17;

  }
  v18 = v13;
  v19 = v12;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)badgeSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBIconBadgeView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessorySize(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (double)_textPadding
{
  return 12.0;
}

- (void)_clearText
{
  NSObject *v3;
  void *v4;
  void *v5;
  SBHIconAccessoryCountedMapImageTuple *textImageTuple;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_textImageTuple)
  {
    SBLogIcon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SBHIconAccessoryCountedMapImageTuple sbh_countedMapKey](self->_textImageTuple, "sbh_countedMapKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "<----\tChecking in badge _textImageTuple w/ mapkey %@", (uint8_t *)&v7, 0xCu);

    }
    SBIconAccessoryCountedMap();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkinValue:", self->_textImageTuple);

    textImageTuple = self->_textImageTuple;
    self->_textImageTuple = 0;

  }
}

- (id)font
{
  void *v3;
  void *v4;

  -[SBIconBadgeView listLayout](self, "listLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconBadgeView overrideFont](self, "overrideFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v3, "accessoryFontForContentSizeCategory:options:", *MEMORY[0x1E0DC4938], UIAccessibilityIsBoldTextEnabled()), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (id)accessoryTextForIcon:(id)a3 infoProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  char v21;

  v6 = a3;
  v7 = a4;
  -[SBIconBadgeView overrideText](self, "overrideText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideBadgeNumberOrString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_self();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        v18 = v9;
        if (objc_msgSend(v18, "integerValue") < 1)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37F0], "sbf_cachedDecimalNumberFormatter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringFromNumber:", v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        objc_opt_self();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
          v13 = 0;
          goto LABEL_6;
        }
        objc_msgSend(v7, "location");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accessoryTextForLocation:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_6;
    }
    v10 = v9;
  }
  v13 = v10;
LABEL_6:
  v14 = v13;

  return v14;
}

+ (id)_checkoutImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "fontName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%.1f:%u"), v8, v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogIcon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v26 = v13;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = v5;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, "---->\tChecking out text asset w/ mapkey of '%@', text '%@' isHighlighted:%{BOOL}u, font %@", buf, 0x26u);
  }

  SBIconAccessoryCountedMap();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__SBIconBadgeView__checkoutImageForText_font_highlighted___block_invoke;
  v20[3] = &unk_1E8D8D6E8;
  v22 = v9;
  v23 = a1;
  v21 = v8;
  v24 = v5;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "checkoutValueForKey:creationBlock:", v13, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

SBHIconAccessoryCountedMapImageTuple *__58__SBIconBadgeView__checkoutImageForText_font_highlighted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  SBHIconAccessoryCountedMapImageTuple *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 48), "_createImageForText:font:highlighted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
    v6 = -[SBHIconAccessoryCountedMapImageTuple initWithImage:countedMapKey:]([SBHIconAccessoryCountedMapImageTuple alloc], "initWithImage:countedMapKey:", v4, v3);

  return v6;
}

- (void)configureAnimatedForIcon:(id)a3 infoProvider:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[SBIconBadgeView accessoryTextForIcon:infoProvider:](self, "accessoryTextForIcon:infoProvider:", a3, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHighlighted");

  -[SBIconBadgeView _configureAnimatedForText:highlighted:animator:](self, "_configureAnimatedForText:highlighted:animator:", v11, v10, v8);
}

- (void)_configureAnimatedForText:(id)a3 highlighted:(BOOL)a4 animator:(id)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 displayingAccessory;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v9 = a5;
  if (!SBFEqualStrings())
  {
    -[SBIconBadgeView font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_checkoutImageForText:font:highlighted:", v15, v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    displayingAccessory = self->_displayingAccessory;
    -[SBIconBadgeView _clearText](self, "_clearText");
    objc_storeStrong((id *)&self->_text, a3);
    objc_storeStrong((id *)&self->_textImageTuple, v11);
    self->_displayingAccessory = v11 != 0;
    if (!displayingAccessory || v11 == 0)
    {
      if (!v11)
      {
        if (displayingAccessory)
          -[SBIconBadgeView _zoomOutWithAnimator:](self, "_zoomOutWithAnimator:", v9);
        goto LABEL_11;
      }
      objc_msgSend(v11, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconBadgeView _zoomInWithTextImage:animator:](self, "_zoomInWithTextImage:animator:", v14, v9);
    }
    else
    {
      objc_msgSend(v11, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconBadgeView _crossfadeToTextImage:animator:](self, "_crossfadeToTextImage:animator:", v14, v9);
    }

LABEL_11:
    goto LABEL_12;
  }
  -[SBIconBadgeView layoutIfNeeded](self, "layoutIfNeeded");
LABEL_12:

}

- (void)_crossfadeToTextImage:(id)a3 animator:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SBIconBadgeView *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0DC3890];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setImage:", v6);
  objc_msgSend(v9, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_backgroundView, "addSubview:", v9);
  objc_storeStrong((id *)&self->_incomingTextView, v9);
  -[SBIconBadgeView setNeedsLayout](self, "setNeedsLayout");
  -[SBIconBadgeView layoutIfNeeded](self, "layoutIfNeeded");
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke;
  v17[3] = &unk_1E8D84F18;
  v17[4] = self;
  v18 = v6;
  v11 = v9;
  v19 = v11;
  v12 = v6;
  objc_msgSend(v8, "addAnimations:", v17);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke_2;
  v14[3] = &unk_1E8D86588;
  v15 = v11;
  v16 = self;
  v13 = v11;
  objc_msgSend(v8, "addCompletion:", v14);

}

uint64_t __56__SBIconBadgeView__createImageForText_font_highlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:attributes:context:", 1, *(_QWORD *)(a1 + 40), 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(void **)(v3 + 424))
  {
    objc_msgSend(*(id *)(v3 + 456), "removeFromSuperview");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 456), *(id *)(*(_QWORD *)(a1 + 40) + 424));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 424);
    *(_QWORD *)(v4 + 424) = 0;

  }
  else
  {
    objc_msgSend(v2, "removeFromSuperview");
  }
}

+ (UIColor)badgeBackgroundColor
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3E88]);
  objc_msgSend(v2, "traitCollectionByModifyingTraits:", &__block_literal_global_65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

void __39__SBIconBadgeView_badgeBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setUserInterfaceStyle:", 1);
  objc_msgSend(v2, "setAccessibilityContrast:", 0);

}

- (SBIconBadgeView)init
{
  SBIconBadgeView *v2;
  SBIconBadgeView *v3;
  UIView *v4;
  UIView *backgroundView;
  void *v6;
  UIImageView *v7;
  UIImageView *textView;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBIconBadgeView;
  v2 = -[SBIconBadgeView init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_brightness = 1.0;
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    objc_msgSend((id)objc_opt_class(), "badgeBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v6);
    -[SBIconBadgeView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    textView = v3->_textView;
    v3->_textView = v7;

    -[UIView addSubview:](v3->_backgroundView, "addSubview:", v3->_textView);
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[SBIconBadgeView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v10, sel__configureBackgroundAfterIconImageAppearanceChange);

    -[SBIconBadgeView _configureBackgroundAfterIconImageAppearanceChange](v3, "_configureBackgroundAfterIconImageAppearanceChange");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIconBadgeView _clearText](self, "_clearText");
  -[SBFParallaxSettings removeKeyObserver:](self->_parallaxSettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBIconBadgeView;
  -[SBIconBadgeView dealloc](&v3, sel_dealloc);
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SBIconBadgeView _configureBackgroundAfterIconImageAppearanceChange](self, "_configureBackgroundAfterIconImageAppearanceChange");
  }
}

- (void)setOverrideFont:(id)a3
{
  UIFont *v4;
  UIFont *overrideFont;
  NSString *text;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIFont *)objc_msgSend(v7, "copy");
    overrideFont = self->_overrideFont;
    self->_overrideFont = v4;

    text = self->_text;
    self->_text = 0;

    -[SBIconBadgeView _configureAnimatedWithoutIcon](self, "_configureAnimatedWithoutIcon");
  }

}

- (void)setOverrideText:(id)a3
{
  NSString *v4;
  NSString *overrideText;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    overrideText = self->_overrideText;
    self->_overrideText = v4;

    -[SBIconBadgeView _configureAnimatedWithoutIcon](self, "_configureAnimatedWithoutIcon");
  }

}

- (void)setOverridePaddingFactor:(double)a3
{
  NSString *text;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_overridePaddingFactor = a3;
    text = self->_text;
    self->_text = 0;

    -[SBIconBadgeView _configureAnimatedWithoutIcon](self, "_configureAnimatedWithoutIcon");
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBIconBadgeView _configureBackgroundAfterIconImageAppearanceChange](self, "_configureBackgroundAfterIconImageAppearanceChange");
  }

}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconBadgeView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconBadgeView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateShadowWithRadius:(double)a3 alpha:(double)a4 imageOutset:(double)a5
{
  double v8;
  id v9;

  -[UIView layer](self->_backgroundView, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowRadius:", a3);
  *(float *)&v8 = a4;
  objc_msgSend(v9, "setShadowOpacity:", v8);
  objc_msgSend(v9, "setShadowOffset:", 0.0, a5);
  objc_msgSend(v9, "setShadowPathIsBounds:", 1);

}

- (void)_configureForText:(id)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  SBHIconAccessoryCountedMapImageTuple *v7;
  NSString *text;
  NSString *v9;
  SBHIconAccessoryCountedMapImageTuple *textImageTuple;
  SBHIconAccessoryCountedMapImageTuple *v11;
  UIImageView *textView;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = (NSString *)a3;
  -[SBIconBadgeView font](self, "font");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_checkoutImageForText:font:highlighted:", v6, v15, v4);
  v7 = (SBHIconAccessoryCountedMapImageTuple *)objc_claimAutoreleasedReturnValue();
  -[SBIconBadgeView _clearText](self, "_clearText");
  text = self->_text;
  self->_text = v6;
  v9 = v6;

  textImageTuple = self->_textImageTuple;
  self->_textImageTuple = v7;
  v11 = v7;

  textView = self->_textView;
  -[SBHIconAccessoryCountedMapImageTuple image](self->_textImageTuple, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](textView, "setImage:", v13);

  -[UIImageView setAlpha:](self->_textView, "setAlpha:", 1.0);
  -[SBHIconAccessoryCountedMapImageTuple image](self->_textImageTuple, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconBadgeView _resizeForTextImage:](self, "_resizeForTextImage:", v14);
  self->_displayingAccessory = self->_textImageTuple != 0;

}

- (void)_configureBackgroundAfterIconImageAppearanceChange
{
  uint64_t v3;
  UIView **p_backgroundView;
  UIView *v5;
  int64_t style;
  void *v7;
  char isKindOfClass;
  UIView *v9;
  UIView *v10;
  BOOL v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *textView;
  void *v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  id v27;

  -[SBIconBadgeView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v27, "appearanceType");
  if (v3 == 2)
  {
    p_backgroundView = &self->_backgroundView;
    v5 = self->_backgroundView;
LABEL_4:
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v9 = v5;
    else
      v9 = (UIView *)objc_opt_new();
    v10 = v9;
    v11 = v3 == 2;
    v12 = v3 == 2;
    if (v11)
      v13 = 3;
    else
      v13 = 51;
    -[UIView setRecipe:](v9, "setRecipe:", v13);
    -[UIView setOverrideUserInterfaceStyle:](v10, "setOverrideUserInterfaceStyle:", 2 * v12);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setGroupNameBase:](v10, "setGroupNameBase:", v14);
    -[UIView visualStylingProviderForCategory:](v10, "visualStylingProviderForCategory:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    textView = self->_textView;
    if (self->_style == 1)
      objc_msgSend(v15, "automaticallyUpdateView:withStyle:", textView, 1);
    else
      objc_msgSend(v15, "stopAutomaticallyUpdatingView:", textView);

    goto LABEL_14;
  }
  style = self->_style;
  p_backgroundView = &self->_backgroundView;
  v5 = self->_backgroundView;
  if (style == 1)
    goto LABEL_4;
  objc_opt_self();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[UIView isMemberOfClass:](v5, "isMemberOfClass:", v25);

  if ((v26 & 1) == 0)
  {
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);

    objc_msgSend((id)objc_opt_class(), "badgeBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v14);
LABEL_14:

    v5 = v10;
  }
  if (v5 != *p_backgroundView)
  {
    -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview");
    -[SBIconBadgeView insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
    -[UIView addSubview:](v5, "addSubview:", self->_textView);
    -[UIView sbh_darkener](v5, "sbh_darkener");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconBadgeView brightness](self, "brightness");
    objc_msgSend(v18, "setBrightness:");

    -[UIView layer](*p_backgroundView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_backgroundView, v5);
    objc_msgSend(v19, "shadowRadius");
    v21 = v20;
    objc_msgSend(v19, "shadowOpacity");
    v23 = v22;
    objc_msgSend(v19, "shadowOffset");
    -[SBIconBadgeView updateShadowWithRadius:alpha:imageOutset:](self, "updateShadowWithRadius:alpha:imageOutset:", v21, v23, v24);

  }
}

- (void)_configureAnimatedWithoutIcon
{
  void *v3;
  id v4;

  -[SBIconBadgeView accessoryTextForIcon:infoProvider:](self, "accessoryTextForIcon:infoProvider:", 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:curve:animations:", 0, 0, 0.3);
  -[SBIconBadgeView _configureAnimatedForText:highlighted:animator:](self, "_configureAnimatedForText:highlighted:animator:", v4, 0, v3);
  objc_msgSend(v3, "startAnimation");

}

- (void)_zoomInWithTextImage:(id)a3 animator:(id)a4
{
  UIImageView *textView;
  id v6;

  textView = self->_textView;
  v6 = a3;
  -[UIImageView setImage:](textView, "setImage:", v6);
  -[UIImageView setAlpha:](self->_textView, "setAlpha:", 1.0);
  -[SBIconBadgeView _resizeForTextImage:](self, "_resizeForTextImage:", v6);

  -[SBIconBadgeView setNeedsLayout](self, "setNeedsLayout");
  -[SBIconBadgeView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_configureWithoutIcon
{
  id v3;

  -[SBIconBadgeView accessoryTextForIcon:infoProvider:](self, "accessoryTextForIcon:infoProvider:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconBadgeView _configureForText:highlighted:](self, "_configureForText:highlighted:", v3, 0);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_parallaxSettings == a3)
    -[SBIconBadgeView _applyParallaxSettings](self, "_applyParallaxSettings");
}

- (SBFParallaxSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)overrideText
{
  return self->_overrideText;
}

- (UIFont)overrideFont
{
  return self->_overrideFont;
}

- (double)overridePaddingFactor
{
  return self->_overridePaddingFactor;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (double)brightness
{
  return self->_brightness;
}

- (void)setBrightness:(double)a3
{
  self->_brightness = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_overrideFont, 0);
  objc_storeStrong((id *)&self->_overrideText, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textImageTuple, 0);
  objc_storeStrong((id *)&self->_incomingTextView, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
