@implementation UIBarAppearance

- (void)configureWithOpaqueBackground
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  +[_UIBarBackgroundAppearanceData opaqueBackgroundData](_UIBarBackgroundAppearanceData, "opaqueBackgroundData");
  v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (void)setShadowColor:(UIColor *)shadowColor
{
  UIColor *v4;
  void *v5;
  _BOOL4 v6;
  UIColor *v7;
  UIColor *v8;
  BOOL v9;
  int v10;
  _UIBarBackgroundAppearanceData *v11;
  _UIBarBackgroundAppearanceData *backgroundData;
  id v13;
  void *v14;
  _UIBarBackgroundAppearanceData *v15;
  _UIBarBackgroundAppearanceData *v16;
  UIColor *v17;

  v4 = shadowColor;
  if (v4)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIColor isEqual:](v4, "isEqual:", v5);

    if (v6)
    {

      v4 = 0;
    }
  }
  -[_UIBarBackgroundAppearanceData shadowColor](self->_backgroundData, "shadowColor");
  v7 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v17 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if (v8 && v7)
  {
    v9 = -[UIColor isEqual:](v7, "isEqual:", v8);

    if (!v9)
      goto LABEL_12;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }

LABEL_12:
  -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
  v11 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v11;

  -[_UIBarBackgroundAppearanceData setShadowColor:](v11, "setShadowColor:", v17);
  v10 = 1;
LABEL_13:
  -[_UIBarBackgroundAppearanceData shadowEffect](self->_backgroundData, "shadowEffect");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {

    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v15 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    v16 = self->_backgroundData;
    self->_backgroundData = v15;

    -[_UIBarBackgroundAppearanceData setShadowEffect:](v15, "setShadowEffect:", 0);
LABEL_16:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
    goto LABEL_17;
  }
  if (v10)
    goto LABEL_16;
LABEL_17:

}

- (void)configureWithDefaultBackground
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  +[_UIBarBackgroundAppearanceData standardBackgroundData](_UIBarBackgroundAppearanceData, "standardBackgroundData");
  v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (UIBarAppearance)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIBarAppearance;
  return -[UIBarAppearance copy](&v3, sel_copy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarAppearance:", self);
}

- (UIBarAppearance)init
{
  void *v3;
  UIBarAppearance *v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIBarAppearance initWithIdiom:](self, "initWithIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));

  return v4;
}

- (UIBarAppearance)initWithBarAppearance:(UIBarAppearance *)barAppearance
{
  UIBarAppearance *v5;
  UIBarAppearance *v6;
  UIBarAppearance *v7;
  void *v9;
  objc_super v10;

  v5 = barAppearance;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarAppearance.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("barAppearance != nil"));

  }
  v10.receiver = self;
  v10.super_class = (Class)UIBarAppearance;
  v6 = -[UIBarAppearance init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_idiom = v5->_idiom;
    -[UIBarAppearance _copyFromAppearance:](v6, "_copyFromAppearance:", v5);
    -[UIBarAppearance _setupDefaults](v7, "_setupDefaults");
    -[UIBarAppearance _completeInit](v7, "_completeInit");
  }

  return v7;
}

- (UIBarAppearance)initWithIdiom:(UIUserInterfaceIdiom)idiom
{
  UIBarAppearance *v4;
  UIBarAppearance *v5;
  UIUserInterfaceIdiom v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIBarAppearance;
  v4 = -[UIBarAppearance init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)idiom >= UIUserInterfaceIdiomTV)
      v6 = UIUserInterfaceIdiomPhone;
    else
      v6 = idiom;
    v4->_idiom = v6;
    -[UIBarAppearance _setupDefaults](v4, "_setupDefaults");
    -[UIBarAppearance _completeInit](v5, "_completeInit");
  }
  return v5;
}

- (void)_setupDefaults
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  if (!self->_backgroundData)
  {
    +[_UIBarBackgroundAppearanceData standardBackgroundData](_UIBarBackgroundAppearanceData, "standardBackgroundData");
    v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v3;

  }
}

- (UIUserInterfaceIdiom)idiom
{
  return self->_idiom;
}

- (void)_copyFromAppearance:(id)a3
{
  _UIBarBackgroundAppearanceData *v4;
  _UIBarBackgroundAppearanceData *backgroundData;
  id v6;

  objc_msgSend(a3, "_backgroundData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (_UIBarBackgroundAppearanceData *)objc_msgSend(v6, "copy");
  backgroundData = self->_backgroundData;
  self->_backgroundData = v4;

}

- (id)_backgroundData
{
  return -[_UIBarAppearanceData markReadOnly](self->_backgroundData, "markReadOnly");
}

- (void)setBackgroundEffects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  _UIBarBackgroundAppearanceData *v9;
  _UIBarBackgroundAppearanceData *backgroundData;
  id v11;

  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v5 = v4;
  -[_UIBarBackgroundAppearanceData backgroundEffects](self->_backgroundData, "backgroundEffects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v11 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v9 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v9;

    -[_UIBarBackgroundAppearanceData setBackgroundEffects:](v9, "setBackgroundEffects:", v11);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_10:

}

- (void)setBackgroundEffect:(UIBlurEffect *)backgroundEffect
{
  UIBlurEffect *v4;
  UIBlurEffect *v5;
  UIBlurEffect *v6;
  BOOL v7;
  _UIBarBackgroundAppearanceData *v8;
  _UIBarBackgroundAppearanceData *backgroundData;
  UIBlurEffect *v10;

  v4 = backgroundEffect;
  -[_UIBarBackgroundAppearanceData backgroundEffect](self->_backgroundData, "backgroundEffect");
  v5 = (UIBlurEffect *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBlurEffect isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v8 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    -[_UIBarBackgroundAppearanceData setBackgroundEffect:](v8, "setBackgroundEffect:", v10);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_9:

}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v4;
  void *v5;
  BOOL v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  BOOL v10;
  _UIBarBackgroundAppearanceData *v11;
  _UIBarBackgroundAppearanceData *backgroundData;
  UIColor *v13;

  v4 = backgroundColor;
  if (v4
    && (+[UIColor clearColor](UIColor, "clearColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[UIColor isEqual:](v4, "isEqual:", v5),
        v5,
        !v6))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  -[_UIBarBackgroundAppearanceData backgroundColor](self->_backgroundData, "backgroundColor");
  v8 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v13 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (v9 && v8)
    {
      v10 = -[UIColor isEqual:](v8, "isEqual:", v9);

      if (v10)
        goto LABEL_13;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v11 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v11;

    -[_UIBarBackgroundAppearanceData setBackgroundColor:](v11, "setBackgroundColor:", v13);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_13:

}

- (void)_signalCategoryChanges:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(a1 + 32) |= a2;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "appearance:categoriesChanged:", a1, a2);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundData, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

- (void)configureWithTransparentBackground
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  +[_UIBarBackgroundAppearanceData transparentBackgroundData](_UIBarBackgroundAppearanceData, "transparentBackgroundData");
  v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (UIBlurEffect)backgroundEffect
{
  return -[_UIBarBackgroundAppearanceData backgroundEffect](self->_backgroundData, "backgroundEffect");
}

- (BOOL)isEqual:(id)a3
{
  UIBarAppearance *v4;
  UIBarAppearance *v5;
  BOOL v6;

  v4 = (UIBarAppearance *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && -[UIBarAppearance isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[UIBarAppearance _checkEqualTo:](self, "_checkEqualTo:", v5);

  return v6;
}

- (BOOL)_checkEqualTo:(id)a3
{
  return -[_UIBarAppearanceData isEqual:](self->_backgroundData, "isEqual:", *((_QWORD *)a3 + 3));
}

- (void)setShadowImage:(UIImage *)shadowImage
{
  UIImage *v4;
  UIImage *v5;
  double v6;
  UIImage *v7;
  double v8;
  UIImage *v9;
  UIImage *v10;
  BOOL v11;
  _UIBarBackgroundAppearanceData *v12;
  _UIBarBackgroundAppearanceData *backgroundData;
  UIImage *v14;

  v4 = shadowImage;
  v5 = v4;
  if (v4)
  {
    -[UIImage size](v4, "size");
    v7 = 0;
    if (v8 != 0.0 && v6 != 0.0)
      v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  -[_UIBarBackgroundAppearanceData shadowImage](self->_backgroundData, "shadowImage");
  v9 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v14 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (v10 && v9)
    {
      v11 = -[UIImage isEqual:](v9, "isEqual:", v10);

      if (v11)
        goto LABEL_14;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v12 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v12;

    -[_UIBarBackgroundAppearanceData setShadowImage:](v12, "setShadowImage:", v14);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_14:

}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  UIImage *v4;
  UIImage *v5;
  double v6;
  UIImage *v7;
  double v8;
  UIImage *v9;
  UIImage *v10;
  BOOL v11;
  _UIBarBackgroundAppearanceData *v12;
  _UIBarBackgroundAppearanceData *backgroundData;
  UIImage *v14;

  v4 = backgroundImage;
  v5 = v4;
  if (v4)
  {
    -[UIImage size](v4, "size");
    v7 = 0;
    if (v8 != 0.0 && v6 != 0.0)
      v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  -[_UIBarBackgroundAppearanceData backgroundImage](self->_backgroundData, "backgroundImage");
  v9 = (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v14 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (v10 && v9)
    {
      v11 = -[UIImage isEqual:](v9, "isEqual:", v10);

      if (v11)
        goto LABEL_14;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v12 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v12;

    -[_UIBarBackgroundAppearanceData setBackgroundImage:](v12, "setBackgroundImage:", v14);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_14:

}

- (unint64_t)hash
{
  return -[UIBarAppearance _hashInto:](self, "_hashInto:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIBarAppearance;
  -[UIBarAppearance description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UIBarAppearance _describeInto:](self, "_describeInto:", v4);
  return v4;
}

- (UIBarAppearance)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIBarAppearance *v5;
  objc_super v7;

  v4 = coder;
  v7.receiver = self;
  v7.super_class = (Class)UIBarAppearance;
  v5 = -[UIBarAppearance init](&v7, sel_init);
  if (v5)
  {
    v5->_idiom = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("Idiom"));
    -[UIBarAppearance _decodeFromCoder:](v5, "_decodeFromCoder:", v4);
    -[UIBarAppearance _setupDefaults](v5, "_setupDefaults");
    -[UIBarAppearance _completeInit](v5, "_completeInit");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t idiom;
  id v5;

  idiom = self->_idiom;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", idiom, CFSTR("Idiom"));
  -[_UIBarBackgroundAppearanceData encodeToCoder:prefix:](self->_backgroundData, "encodeToCoder:prefix:", v5, CFSTR("Background"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  _UIBarBackgroundAppearanceData *v4;
  _UIBarBackgroundAppearanceData *backgroundData;

  +[_UIBarBackgroundAppearanceData decodeFromCoder:prefix:](_UIBarBackgroundAppearanceData, "decodeFromCoder:prefix:", a3, CFSTR("Background"));
  v4 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v4;

}

- (void)_describeInto:(id)a3
{
  _UIBarBackgroundAppearanceData *backgroundData;
  id v5;

  backgroundData = self->_backgroundData;
  v5 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tBackground(%p):"), backgroundData);
  -[_UIBarBackgroundAppearanceData describeInto:](self->_backgroundData, "describeInto:", v5);

}

- (unint64_t)_hashInto:(unint64_t)a3
{
  return -[_UIBarAppearanceData hash](self->_backgroundData, "hash", a3);
}

- (BOOL)_hasTransparentBackground
{
  return !-[_UIBarBackgroundAppearanceData hasBackground](self->_backgroundData, "hasBackground");
}

- (id)_barTitleData
{
  return 0;
}

- (id)_backButtonAppearanceData
{
  return 0;
}

- (id)_plainButtonAppearanceData
{
  return 0;
}

- (id)_doneButtonAppearanceData
{
  return 0;
}

- (id)_stackedTabButtonAppearanceData
{
  return 0;
}

- (id)_inlineTabButtonAppearanceData
{
  return 0;
}

- (id)_compactInlineTabButtonAppearanceData
{
  return 0;
}

- (id)_tabLayoutAppearanceData
{
  return 0;
}

- (id)_backButtonAppearance
{
  return 0;
}

- (id)_plainButtonAppearance
{
  return 0;
}

- (id)_doneButtonAppearance
{
  return 0;
}

- (UIVibrancyEffect)_selectedItemVibrancyEffect
{
  return -[_UIBarBackgroundAppearanceData overrideTabBarVibrancyEffect](self->_backgroundData, "overrideTabBarVibrancyEffect");
}

- (void)_setSelectedItemVibrancyEffect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _UIBarBackgroundAppearanceData *v8;
  _UIBarBackgroundAppearanceData *backgroundData;
  id v10;

  v4 = a3;
  -[_UIBarBackgroundAppearanceData overrideTabBarVibrancyEffect](self->_backgroundData, "overrideTabBarVibrancyEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = v5;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = objc_msgSend(v10, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v8 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    -[_UIBarBackgroundAppearanceData setOverrideTabBarVibrancyEffect:](v8, "setOverrideTabBarVibrancyEffect:", v10);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, -1);
  }
LABEL_9:

}

- (NSArray)backgroundEffects
{
  return -[_UIBarBackgroundAppearanceData backgroundEffects](self->_backgroundData, "backgroundEffects");
}

- (UIColor)backgroundColor
{
  return -[_UIBarBackgroundAppearanceData backgroundColor](self->_backgroundData, "backgroundColor");
}

- (UIImage)backgroundImage
{
  return -[_UIBarBackgroundAppearanceData backgroundImage](self->_backgroundData, "backgroundImage");
}

- (UIViewContentMode)backgroundImageContentMode
{
  return -[_UIBarBackgroundAppearanceData backgroundImageContentMode](self->_backgroundData, "backgroundImageContentMode");
}

- (void)setBackgroundImageContentMode:(UIViewContentMode)backgroundImageContentMode
{
  UIViewContentMode v4;
  _UIBarBackgroundAppearanceData *v5;
  _UIBarBackgroundAppearanceData *backgroundData;

  if (backgroundImageContentMode == UIViewContentModeRedraw)
    v4 = UIViewContentModeScaleToFill;
  else
    v4 = backgroundImageContentMode;
  if (-[_UIBarBackgroundAppearanceData backgroundImageContentMode](self->_backgroundData, "backgroundImageContentMode") != v4)
  {
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v5 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v5;

    -[_UIBarBackgroundAppearanceData setBackgroundImageContentMode:](v5, "setBackgroundImageContentMode:", v4);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
}

- (void)configureWithDefaultShadow
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
  v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[_UIBarBackgroundAppearanceData configureWithDefaultShadow](self->_backgroundData, "configureWithDefaultShadow");
  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (void)configureWithoutShadow
{
  _UIBarBackgroundAppearanceData *v3;
  _UIBarBackgroundAppearanceData *backgroundData;

  -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
  v3 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[_UIBarBackgroundAppearanceData configureWithoutShadow](self->_backgroundData, "configureWithoutShadow");
  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (UIImage)shadowImage
{
  return -[_UIBarBackgroundAppearanceData shadowImage](self->_backgroundData, "shadowImage");
}

- (UIColor)shadowColor
{
  void *v3;
  void *v4;

  -[_UIBarBackgroundAppearanceData shadowColor](self->_backgroundData, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UIBarBackgroundAppearanceData shadowEffect](self->_backgroundData, "shadowEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (UIColor *)v3;
}

- (UIVibrancyEffect)shadowEffect
{
  return -[_UIBarBackgroundAppearanceData shadowEffect](self->_backgroundData, "shadowEffect");
}

- (void)setShadowEffect:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  _UIBarBackgroundAppearanceData *v8;
  _UIBarBackgroundAppearanceData *backgroundData;
  id v10;

  v4 = a3;
  -[_UIBarBackgroundAppearanceData shadowEffect](self->_backgroundData, "shadowEffect");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[_UIBarAppearanceData writableInstance](self->_backgroundData, "writableInstance");
    v8 = (_UIBarBackgroundAppearanceData *)objc_claimAutoreleasedReturnValue();
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    -[_UIBarBackgroundAppearanceData setShadowEffect:](v8, "setShadowEffect:", v10);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_9:

}

@end
