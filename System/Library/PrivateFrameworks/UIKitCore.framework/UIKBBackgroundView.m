@implementation UIKBBackgroundView

- (BOOL)_canDrawContent
{
  return 1;
}

- (void)setScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_screenTraits, a3);
}

- (void)setRenderConfig:(id)a3
{
  UIKBRenderConfig *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  UIKBRenderConfig *renderConfig;
  void *v10;
  void *v11;

  v4 = (UIKBRenderConfig *)a3;
  -[UIKBBackgroundView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIKBBackgroundView renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "lightKeyboard");
    v8 = v7 ^ -[UIKBRenderConfig lightKeyboard](v4, "lightKeyboard");

  }
  else
  {
    v8 = 1;
  }

  renderConfig = self->_renderConfig;
  self->_renderConfig = v4;

  if (v4)
  {
    if (v8)
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)refreshStyleForKeyplane:(id)a3 inputTraits:(id)a4
{
  id v7;
  void *v8;
  int v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGSize size;
  CGSize v19;
  void *v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  double v25;
  CGFloat v26;
  id v27;

  v27 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_keyplane, a3);
  objc_storeStrong((id *)&self->_inputTraits, a4);
  -[UIView setOpaque:](self, "setOpaque:", 0);
  -[UIKBTree cachedKeysByKeyName:](self->_keyplane, "cachedKeysByKeyName:", CFSTR("Candidate-Selection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasCandidateKeys = v8 != 0;

  if (self->_hasCandidateKeys)
    v9 = 101;
  else
    v9 = objc_msgSend(v27, "visualStyle");
  self->_visualStyle = v9;
  self->_isSplit = -[UIKBTree isSplit](self->_keyplane, "isSplit");
  self->_centerFilled = -[UIKBScreenTraits centerFilled](self->_screenTraits, "centerFilled");
  if (!self->_isSplit)
    goto LABEL_7;
  -[UIKBSplitImageView prepareForDisplay:](self, "prepareForDisplay:", 1);
  objc_msgSend(v27, "frameForKeylayoutName:", CFSTR("split-left"));
  self->_splitLeftRect.origin.x = v10;
  self->_splitLeftRect.origin.y = v11;
  self->_splitLeftRect.size.width = v12;
  self->_splitLeftRect.size.height = v13;
  objc_msgSend(v27, "frameForKeylayoutName:", CFSTR("split-right"));
  self->_splitRightRect.origin.x = v14;
  self->_splitRightRect.origin.y = v15;
  self->_splitRightRect.size.width = v16;
  self->_splitRightRect.size.height = v17;
  size = self->_splitLeftRect.size;
  self->_splitLeftCacheRect.origin = self->_splitLeftRect.origin;
  self->_splitLeftCacheRect.size = size;
  v19 = self->_splitRightRect.size;
  self->_splitRightCacheRect.origin = self->_splitRightRect.origin;
  self->_splitRightCacheRect.size = v19;
  if (!self->_isSplit)
    goto LABEL_7;
  if (!self->_centerFilled)
  {
    -[UIKBSplitImageView prepareForDisplay:](self, "prepareForDisplay:", 1);
    v23 = -[UIView _clipCornersOfView:](self, "_clipCornersOfView:", self);
    self->_topCorners = v23 | 0xC;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu,%g:%g"), v23 | 0xC, *(_QWORD *)&self->_splitLeftRect.size.height, *(_QWORD *)&self->_splitRightRect.size.height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBBackgroundView setGeometryCacheKey:](self, "setGeometryCacheKey:", v24);

    v25 = UIKBCornerRadius();
    v26 = v25 + v25;
    self->_splitLeftCacheRect.size.width = v26;
    self->_splitRightCacheRect.size.width = v26;
    self->_splitRightCacheRect.origin.x = self->_splitLeftCacheRect.size.width + 3.0;
  }
  else
  {
LABEL_7:
    -[UIKBSplitImageView prepareForDisplay:](self, "prepareForDisplay:", 0);
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[UIView size](self, "size");
    objc_msgSend(v20, "numberWithInt:", (int)v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBBackgroundView setGeometryCacheKey:](self, "setGeometryCacheKey:", v22);

  }
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setGeometryCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_geometryCacheKey, a3);
}

- (UIKBBackgroundView)initWithFrame:(CGRect)a3
{
  UIKBBackgroundView *v3;
  UIKBBackgroundView *v4;
  NSObject *geometryCacheKey;
  UIKBBackgroundView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBBackgroundView;
  v3 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](&v8, sel_initWithFrame_canStretchAsFullWidth_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    geometryCacheKey = v3->_geometryCacheKey;
    v3->_geometryCacheKey = &stru_1E16EDF20;

    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v6 = v4;
  }

  return v4;
}

- (void)drawContentsOfRenderers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t topCorners;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  v21 = a3;
  +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", self->_renderConfig);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", -[UIKBTree visualStyling](self->_keyplane, "visualStyling"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIView contentScaleFactor](self, "contentScaleFactor");
    objc_msgSend(v5, "setScale:");
    -[UIKBScreenTraits stretchFactor](self->_screenTraits, "stretchFactor");
    objc_msgSend(v5, "setStretchFactor:");
    objc_msgSend(v5, "backgroundTraitsForKeyplane:", self->_keyplane);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splitLeftRect");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "geometry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "splitRightRect");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_8:
        objc_msgSend(v21, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "renderBackgroundTraits:", v6);

        goto LABEL_9;
      }
      if (self->_centerFilled)
      {
        objc_msgSend(v6, "geometry");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSplitLeftRect:", 0);

        objc_msgSend(v6, "geometry");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSplitRightRect:", 0);
      }
      else
      {
        topCorners = self->_topCorners;
        objc_msgSend(v6, "geometry");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setRoundRectCorners:", topCorners);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_splitLeftCacheRect.origin.x, self->_splitLeftCacheRect.origin.y, self->_splitLeftCacheRect.size.width, self->_splitLeftCacheRect.size.height);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "geometry");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSplitLeftRect:", v15);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_splitRightCacheRect.origin.x, self->_splitRightCacheRect.origin.y, self->_splitRightCacheRect.size.width, self->_splitRightCacheRect.size.height);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "geometry");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSplitRightRect:", v17);

        v19 = UIKBCornerRadius();
        objc_msgSend(v6, "geometry");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRoundRectRadius:", v19);
      }
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (NSString)cacheKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_visualStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_centerFilled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, self->_geometryCacheKey, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKBBackgroundView cacheKey](self, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBBackgroundView renderConfig](self, "renderConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, objc_msgSend(v6, "integerValue"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)displayLayer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int visualStyle;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  if (-[UIView isHidden](self, "isHidden", a3))
    return;
  if (self->_isSplit)
  {
    v4 = self->_splitRightCacheRect.size.width + 3.0;
    v5 = self->_splitLeftCacheRect.size.width + 3.0;
    -[UIKBBackgroundView cachedWidth](self, "cachedWidth");
    v7 = v6;
    -[UIKBBackgroundView cachedWidth](self, "cachedWidth");
    v9 = v8;
    v10 = self->_splitLeftCacheRect.size.width + 1.0;
    v11 = self->_splitRightCacheRect.size.width + 1.0;
  }
  else
  {
    v4 = 0.0;
    v9 = 0.0;
    v5 = 0.0;
    v7 = 0.0;
    v11 = 0.0;
    v10 = 0.0;
  }
  -[UIView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", 0);

  visualStyle = self->_visualStyle;
  if (visualStyle != 5
    && visualStyle != 105
    && -[UITextInputTraits keyboardType](self->_inputTraits, "keyboardType") != 127)
  {
    if (!-[UIKBRenderConfig lightKeyboard](self->_renderConfig, "lightKeyboard"))
      goto LABEL_21;
    +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree layoutName](self->_keyplane, "layoutName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayImagesForView:fromLayout:imageFlags:", self, v25, &unk_1E1A93BC0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "objectForKey:", &unk_1E1A984F0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
LABEL_21:
      -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", 0, 0, 0, 0);
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v31;
      if (objc_msgSend(v21, "hasFormatColor"))
      {
        objc_msgSend(v21, "imageWithRenderingMode:", 2);
        v31 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = v21;
      }
    }
    else
    {
      v21 = 0;
    }
    -[UIView layer](self, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContents:", 0);

    if (self->_isSplit)
    {
      if (self->_centerFilled)
      {
        objc_msgSend(v31, "resizableImageWithCapInsets:", 0.0, v10, 0.0, v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", v28, 0, 0, 0);
      }
      else
      {
        objc_msgSend(v31, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, 0.0, 0.0, v4, 0.0, 0.0, 0.0, v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, v5, 0.0, 0.0, 0.0, v9, 0.0, 0.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", 0, v28, v29, self->_keyplane);

      }
    }
    else
    {
      -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", v31, 0, 0, 0);
    }
    if (v21)
    {
      objc_msgSend(v21, "formatColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBSplitImageView setContentsMultiplyColor:](self, "setContentsMultiplyColor:", v30);

    }
    else
    {
      -[UIKBSplitImageView setContentsMultiplyColor:](self, "setContentsMultiplyColor:", 0);
    }
LABEL_15:

    return;
  }
  -[UIView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", 0);

  -[UIKBSplitImageView setImage:splitLeft:splitRight:keyplane:](self, "setImage:splitLeft:splitRight:keyplane:", 0, 0, 0, 0);
  if (-[UITextInputTraits keyboardType](self->_inputTraits, "keyboardType") == 127
    || -[UITextInputTraits keyboardType](self->_inputTraits, "keyboardType") == 4
    || -[UITextInputTraits keyboardType](self->_inputTraits, "keyboardType") == 11
    || (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_isTextEffectsWindow");

    if ((v16 & 1) == 0)
    {
      -[UIKBBackgroundView renderConfig](self, "renderConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIBackdropViewSettings settingsForStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForStyle:graphicsQuality:", objc_msgSend(v17, "backdropStyle"), +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality"));
      v31 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "grayscaleTintLevel");
      v19 = v18;
      objc_msgSend(v31, "grayscaleTintAlpha");
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v19, v20);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "CGColor");
      -[UIView layer](self, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundColor:", v22);

      goto LABEL_15;
    }
  }
}

- (BOOL)cacheDeferable
{
  return 0;
}

- (double)cachedWidth
{
  double result;

  if (+[UIKeyboardCache enabled](UIKeyboardCache, "enabled"))
  {
    if (self->_isSplit)
      return self->_splitLeftCacheRect.size.width + self->_splitRightCacheRect.size.width + 3.0;
    else
      return 1.0;
  }
  else
  {
    -[UIView size](self, "size");
  }
  return result;
}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (BOOL)displaysColorImage
{
  return 0;
}

- (int64_t)assetIdiom
{
  void *v2;
  int64_t v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3;
}

- (NSObject)geometryCacheKey
{
  return self->_geometryCacheKey;
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_geometryCacheKey, 0);
  objc_storeStrong((id *)&self->_inputTraits, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end
