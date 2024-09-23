@implementation _UINavigationBarAppearanceStorage

- (id)representativeImageForIdiom:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (int64_t)activeBarMetrics
{
  return self->activeBarMetrics;
}

- (UIImage)shadowImage
{
  return self->shadowImage;
}

- (BOOL)hidesShadow
{
  return self->hidesShadow;
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->shadowImage, a3);
}

- (NSDictionary)textAttributes
{
  return self->textAttributes;
}

- (void)setTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)backIndicatorTransitionMaskImage
{
  return self->backIndicatorTransitionMaskImage;
}

- (void)setBackIndicatorTransitionMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->backIndicatorTransitionMaskImage, a3);
}

- (UIImage)backIndicatorImage
{
  return self->backIndicatorImage;
}

- (void)setBackIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->backIndicatorImage, a3);
}

+ (int64_t)typicalBarPosition
{
  return 2;
}

- (double)titleVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  NSMutableDictionary *titleVerticalAdjustmentsForBarMetrics;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](titleVerticalAdjustmentsForBarMetrics, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a3 == 101)
    {
      v8 = &unk_1E1A96DF8;
    }
    else
    {
      if (a3 != 102)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v8 = &unk_1E1A96E10;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->titleVerticalAdjustmentsForBarMetrics, "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  objc_msgSend(v7, "floatValue");
  v10 = v9;

  return v10;
}

- (void)setHidesShadow:(BOOL)a3
{
  self->hidesShadow = a3;
}

- (UIImage)backgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 0);
}

- (UIImage)miniBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 1);
}

- (UIImage)promptBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 101);
}

- (UIImage)miniPromptBackgroundImage
{
  return (UIImage *)-[_UIBarAppearanceStorage backgroundImageForBarPosition:barMetrics:](self, "backgroundImageForBarPosition:barMetrics:", 0, 102);
}

- (void)setTitleVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  void *v6;
  float v7;
  double v8;
  double v9;
  NSMutableDictionary *titleVerticalAdjustmentsForBarMetrics;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->titleVerticalAdjustmentsForBarMetrics, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (v8 != a3)
  {
    titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
    if (!titleVerticalAdjustmentsForBarMetrics)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->titleVerticalAdjustmentsForBarMetrics;
      self->titleVerticalAdjustmentsForBarMetrics = v11;

      titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
    }
    *(float *)&v9 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](titleVerticalAdjustmentsForBarMetrics, "setObject:forKey:", v13, v14);

  }
}

- (_UIBarButtonItemAppearanceStorage)_barButtonAppearanceStorage
{
  return self->buttonAppearanceStorage;
}

- (_UIBarButtonItemAppearanceStorage)barButtonAppearanceStorage
{
  _UIBarButtonItemAppearanceStorage *buttonAppearanceStorage;
  _UIBarButtonItemAppearanceStorage *v4;
  _UIBarButtonItemAppearanceStorage *v5;

  buttonAppearanceStorage = self->buttonAppearanceStorage;
  if (!buttonAppearanceStorage)
  {
    v4 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    v5 = self->buttonAppearanceStorage;
    self->buttonAppearanceStorage = v4;

    buttonAppearanceStorage = self->buttonAppearanceStorage;
  }
  return buttonAppearanceStorage;
}

- (BOOL)reversesShadowOffset
{
  return self->reversesShadowOffset;
}

- (void)setReversesShadowOffset:(BOOL)a3
{
  self->reversesShadowOffset = a3;
}

- (int64_t)defaultBarMetrics
{
  return self->defaultBarMetrics;
}

- (void)setDefaultBarMetrics:(int64_t)a3
{
  self->defaultBarMetrics = a3;
}

- (void)setActiveBarMetrics:(int64_t)a3
{
  self->activeBarMetrics = a3;
}

- (NSNumber)backIndicatorLeftMargin
{
  return self->backIndicatorLeftMargin;
}

- (void)setBackIndicatorLeftMargin:(id)a3
{
  objc_storeStrong((id *)&self->backIndicatorLeftMargin, a3);
}

- (BOOL)deferShadowToSearchBar
{
  return self->_deferShadowToSearchBar;
}

- (void)setDeferShadowToSearchBar:(BOOL)a3
{
  self->_deferShadowToSearchBar = a3;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackdropViewGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_backdropViewGroupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->buttonAppearanceStorage, 0);
  objc_storeStrong((id *)&self->backIndicatorLeftMargin, 0);
  objc_storeStrong((id *)&self->backIndicatorTransitionMaskImage, 0);
  objc_storeStrong((id *)&self->backIndicatorImage, 0);
  objc_storeStrong((id *)&self->shadowImage, 0);
  objc_storeStrong((id *)&self->titleVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->textAttributes, 0);
}

@end
