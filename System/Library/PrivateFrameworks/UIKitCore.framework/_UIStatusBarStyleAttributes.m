@implementation _UIStatusBarStyleAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v4 + 2) = self->_style;
  *((_QWORD *)v4 + 3) = self->_mode;
  objc_storeStrong((id *)v4 + 4, self->_traitCollection);
  *((_QWORD *)v4 + 5) = self->_effectiveLayoutDirection;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_iconScale;
  *((_QWORD *)v4 + 8) = self->_iconSize;
  *((_QWORD *)v4 + 7) = self->_symbolScale;
  *((_BYTE *)v4 + 8) = self->_scaledFixedWidthBar;
  objc_msgSend(v4, "setFont:", self->_font);
  objc_msgSend(v4, "setEmphasizedFont:", self->_emphasizedFont);
  objc_msgSend(v4, "setSmallFont:", self->_smallFont);
  objc_msgSend(v4, "setTextColor:", self->_textColor);
  objc_msgSend(v4, "setImageTintColor:", self->_imageTintColor);
  objc_msgSend(v4, "setImageDimmedTintColor:", self->_imageDimmedTintColor);
  v5 = (void *)-[NSArray copy](self->_imageNamePrefixes, "copy");
  objc_msgSend(v4, "setImageNamePrefixes:", v5);

  return v4;
}

- (_UIStatusBarStyleAttributes)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarStyleAttributes *v4;
  uint64_t v5;
  UITraitCollection *traitCollection;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarStyleAttributes;
  v3 = a3;
  v4 = -[_UIStatusBarStyleAttributes init](&v16, sel_init);
  v4->_style = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("style"), v16.receiver, v16.super_class);
  v4->_mode = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mode"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
  v5 = objc_claimAutoreleasedReturnValue();
  traitCollection = v4->_traitCollection;
  v4->_traitCollection = (UITraitCollection *)v5;

  v4->_effectiveLayoutDirection = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("effectiveLayoutDirection"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("iconScale"));
  v4->_iconScale = v7;
  v4->_iconSize = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("iconSize"));
  v4->_symbolScale = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("symbolScale"));
  v4->_scaledFixedWidthBar = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("scaledFixedWidthBar"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setFont:](v4, "setFont:", v8);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emphasizedFont"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setEmphasizedFont:](v4, "setEmphasizedFont:", v9);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smallFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setSmallFont:](v4, "setSmallFont:", v10);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setTextColor:](v4, "setTextColor:", v11);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageTintColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setImageTintColor:](v4, "setImageTintColor:", v12);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDimmedTintColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarStyleAttributes setImageDimmedTintColor:](v4, "setImageDimmedTintColor:", v13);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageNamePrefixes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarStyleAttributes setImageNamePrefixes:](v4, "setImageNamePrefixes:", v14);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("style"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_effectiveLayoutDirection, CFSTR("effectiveLayoutDirection"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("iconScale"), self->_iconScale);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_iconSize, CFSTR("iconSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_symbolScale, CFSTR("symbolScale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_scaledFixedWidthBar, CFSTR("scaledFixedWidthBar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emphasizedFont, CFSTR("emphasizedFont"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_smallFont, CFSTR("smallFont"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textColor, CFSTR("textColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageTintColor, CFSTR("imageTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageDimmedTintColor, CFSTR("imageDimmedTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageNamePrefixes, CFSTR("imageNamePrefixes"));

}

+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  const __CFString *v29;
  SEL v30;
  id v31;
  uint64_t v32;

  v7 = a3;
  if (a4)
  {
    if (a4 != 4)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("The status bar style should never be set to .inherited, it should only be used to notify about using the main style in setStyle:forPartWithIdentifier:");
    v30 = a2;
    v31 = a1;
    v32 = 96;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("The default style should have been resolved to .lightContent or .darkContent already");
    v30 = a2;
    v31 = a1;
    v32 = 95;
  }
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("_UIStatusBarStyleAttributes.m"), v32, v29);

LABEL_3:
  v8 = objc_alloc_init((Class)a1);
  *((_QWORD *)v8 + 2) = a4;
  *((_QWORD *)v8 + 3) = objc_msgSend(v7, "mode");
  *((_QWORD *)v8 + 5) = objc_msgSend(v7, "effectiveUserInterfaceLayoutDirection");
  *((_QWORD *)v8 + 6) = 0x3FF0000000000000;
  *((_QWORD *)v8 + 7) = 0;
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  if (v10 == 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollectionByReplacingCGFloatValue:forTrait:", v14, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_storeStrong((id *)v8 + 4, v9);
  objc_msgSend(v9, "displayScale");
  v17 = v16;
  v18 = _UIDeviceNativeUserInterfaceIdiom();
  if (v18 == 1)
  {
    v20 = 14;
  }
  else
  {
    v19 = 2.5;
    if (v18 == 3)
    {
      v20 = 16;
      if (v17 > 2.5)
        v20 = 17;
    }
    else if (v17 <= 2.5)
    {
      v20 = 1;
    }
    else
    {
      v20 = 2;
    }
  }
  *((_QWORD *)v8 + 8) = v20;
  objc_msgSend(v7, "foregroundColor", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "foregroundColor");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v22;

    objc_msgSend(v7, "foregroundColor");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v8 + 13);
    *((_QWORD *)v8 + 13) = v24;

  }
  return v8;
}

+ (id)overriddenStyleAttributes
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  int64_t style;
  int64_t mode;
  UITraitCollection *traitCollection;
  void *v11;
  UITraitCollection *v12;
  UITraitCollection *v13;
  UITraitCollection *v14;
  _BOOL4 v15;
  int64_t effectiveLayoutDirection;
  double iconScale;
  double v18;
  int64_t iconSize;
  int64_t symbolScale;
  int scaledFixedWidthBar;
  UIFont *font;
  UIFont *emphasizedFont;
  void *v24;
  UIFont *smallFont;
  void *v26;
  UIColor *textColor;
  void *v28;
  UIColor *imageTintColor;
  void *v30;
  UIColor *imageDimmedTintColor;
  NSArray *imageNamePrefixes;
  void *v33;
  void *v35;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    style = self->_style;
    if (style != objc_msgSend(v7, "style") || (mode = self->_mode, mode != objc_msgSend(v7, "mode")))
    {
      v6 = 0;
LABEL_29:

      goto LABEL_30;
    }
    traitCollection = self->_traitCollection;
    objc_msgSend(v7, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = traitCollection;
    v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {

    }
    else
    {
      v6 = 0;
      if (!v12 || !v13)
      {
        v24 = v13;
        goto LABEL_26;
      }
      v15 = -[UITraitCollection isEqual:](v12, "isEqual:", v13);

      if (!v15)
      {
LABEL_24:
        v6 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    effectiveLayoutDirection = self->_effectiveLayoutDirection;
    if (effectiveLayoutDirection != objc_msgSend(v7, "effectiveLayoutDirection"))
      goto LABEL_24;
    iconScale = self->_iconScale;
    objc_msgSend(v7, "iconScale");
    if (iconScale != v18)
      goto LABEL_24;
    iconSize = self->_iconSize;
    if (iconSize != objc_msgSend(v7, "iconSize"))
      goto LABEL_24;
    symbolScale = self->_symbolScale;
    if (symbolScale != objc_msgSend(v7, "symbolScale"))
      goto LABEL_24;
    scaledFixedWidthBar = self->_scaledFixedWidthBar;
    if (scaledFixedWidthBar != objc_msgSend(v7, "isScaledFixedWidthBar"))
      goto LABEL_24;
    font = self->_font;
    objc_msgSend(v7, "font");
    v12 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    if (!UIEqual(font, v12))
    {
      v6 = 0;
      goto LABEL_27;
    }
    emphasizedFont = self->_emphasizedFont;
    objc_msgSend(v7, "emphasizedFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIEqual(emphasizedFont, v24))
    {
      smallFont = self->_smallFont;
      objc_msgSend(v7, "smallFont");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (UIEqual(smallFont, v26))
      {
        textColor = self->_textColor;
        objc_msgSend(v7, "textColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (UIEqual(textColor, v28))
        {
          imageTintColor = self->_imageTintColor;
          objc_msgSend(v7, "imageTintColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (UIEqual(imageTintColor, v30))
          {
            imageDimmedTintColor = self->_imageDimmedTintColor;
            objc_msgSend(v7, "imageDimmedTintColor");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (UIEqual(imageDimmedTintColor, v35))
            {
              imageNamePrefixes = self->_imageNamePrefixes;
              objc_msgSend(v7, "imageNamePrefixes");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = UIEqual(imageNamePrefixes, v33);

            }
            else
            {
              v6 = 0;
            }

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  v6 = 0;
LABEL_30:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[16];

  v20[14] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_style);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  NSStringFromSelector(sel_mode);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v18;
  NSStringFromSelector(sel_traitCollection);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  NSStringFromSelector(sel_effectiveLayoutDirection);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  NSStringFromSelector(sel_iconScale);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  NSStringFromSelector(sel_iconSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v14;
  NSStringFromSelector(sel_symbolScale);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v3;
  NSStringFromSelector(sel_font);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v4;
  NSStringFromSelector(sel_emphasizedFont);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v5;
  NSStringFromSelector(sel_smallFont);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v6;
  NSStringFromSelector(sel_textColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v7;
  NSStringFromSelector(sel_imageTintColor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v8;
  NSStringFromSelector(sel_imageDimmedTintColor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v9;
  NSStringFromSelector(sel_imageNamePrefixes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_UIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3
{
  _UIStatusBarStyleAttributes *v4;
  _UIStatusBarStyleAttributes *v5;
  _UIStatusBarStyleAttributes *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (_UIStatusBarStyleAttributes *)a3;
  v5 = v4;
  if (!v4 || v4 == self)
  {
    v6 = self;
  }
  else
  {
    v6 = (_UIStatusBarStyleAttributes *)-[_UIStatusBarStyleAttributes copy](self, "copy");
    -[_UIStatusBarStyleAttributes iconScale](v5, "iconScale");
    if (v7 > 0.0)
    {
      -[_UIStatusBarStyleAttributes iconScale](v5, "iconScale");
      -[_UIStatusBarStyleAttributes setIconScale:](v6, "setIconScale:");
    }
    if (-[_UIStatusBarStyleAttributes iconSize](v5, "iconSize"))
      -[_UIStatusBarStyleAttributes setIconSize:](v6, "setIconSize:", -[_UIStatusBarStyleAttributes iconSize](v5, "iconSize"));
    if (-[_UIStatusBarStyleAttributes symbolScale](v5, "symbolScale"))
      -[_UIStatusBarStyleAttributes setSymbolScale:](v6, "setSymbolScale:", -[_UIStatusBarStyleAttributes symbolScale](v5, "symbolScale"));
    -[_UIStatusBarStyleAttributes font](v5, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIStatusBarStyleAttributes font](v5, "font");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setFont:](v6, "setFont:", v9);

    }
    -[_UIStatusBarStyleAttributes emphasizedFont](v5, "emphasizedFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UIStatusBarStyleAttributes emphasizedFont](v5, "emphasizedFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setEmphasizedFont:](v6, "setEmphasizedFont:", v11);

    }
    -[_UIStatusBarStyleAttributes smallFont](v5, "smallFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIStatusBarStyleAttributes smallFont](v5, "smallFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setSmallFont:](v6, "setSmallFont:", v13);

    }
    -[_UIStatusBarStyleAttributes textColor](v5, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UIStatusBarStyleAttributes textColor](v5, "textColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setTextColor:](v6, "setTextColor:", v15);

    }
    -[_UIStatusBarStyleAttributes imageTintColor](v5, "imageTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[_UIStatusBarStyleAttributes imageTintColor](v5, "imageTintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setImageTintColor:](v6, "setImageTintColor:", v17);

    }
    -[_UIStatusBarStyleAttributes imageDimmedTintColor](v5, "imageDimmedTintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[_UIStatusBarStyleAttributes imageDimmedTintColor](v5, "imageDimmedTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setImageDimmedTintColor:](v6, "setImageDimmedTintColor:", v19);

    }
    -[_UIStatusBarStyleAttributes imageNamePrefixes](v5, "imageNamePrefixes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[_UIStatusBarStyleAttributes imageNamePrefixes](v5, "imageNamePrefixes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarStyleAttributes setImageNamePrefixes:](v6, "setImageNamePrefixes:", v21);

    }
  }

  return v6;
}

- (id)fontForStyle:(int64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2:
      -[_UIStatusBarStyleAttributes smallFont](self, "smallFont");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[_UIStatusBarStyleAttributes emphasizedFont](self, "emphasizedFont");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[_UIStatusBarStyleAttributes font](self, "font");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

- (BOOL)isRounded
{
  void *v2;
  void *UIFontDesign;

  -[_UIStatusBarStyleAttributes font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIFontDesign = (void *)CTFontGetUIFontDesign();

  LOBYTE(v2) = objc_msgSend(UIFontDesign, "isEqualToString:", *MEMORY[0x1E0CA8440]);
  return (char)v2;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)effectiveLayoutDirection
{
  return self->_effectiveLayoutDirection;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIFont)emphasizedFont
{
  return self->_emphasizedFont;
}

- (void)setEmphasizedFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIFont)smallFont
{
  return self->_smallFont;
}

- (void)setSmallFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIColor)imageDimmedTintColor
{
  return self->_imageDimmedTintColor;
}

- (void)setImageDimmedTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)imageNamePrefixes
{
  return self->_imageNamePrefixes;
}

- (void)setImageNamePrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isScaledFixedWidthBar
{
  return self->_scaledFixedWidthBar;
}

- (void)setScaledFixedWidthBar:(BOOL)a3
{
  self->_scaledFixedWidthBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNamePrefixes, 0);
  objc_storeStrong((id *)&self->_imageDimmedTintColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_smallFont, 0);
  objc_storeStrong((id *)&self->_emphasizedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
