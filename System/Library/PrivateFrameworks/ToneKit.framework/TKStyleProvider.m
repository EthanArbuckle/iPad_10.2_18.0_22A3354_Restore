@implementation TKStyleProvider

- (TKStyleProvider)init
{
  TKStyleProvider *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKStyleProvider;
  v2 = -[TKStyleProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKStyleProvider setScreen:](v2, "setScreen:", v3);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__didReceiveMemoryWarning_, *MEMORY[0x24BDF7538], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  v4.receiver = self;
  v4.super_class = (Class)TKStyleProvider;
  -[TKStyleProvider dealloc](&v4, sel_dealloc);
}

- (id)_bundle
{
  NSBundle *bundle;
  NSBundle *v4;
  NSBundle *v5;

  bundle = self->_bundle;
  if (!bundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }
  return bundle;
}

- (id)_cachedStyleObjectForPropertyWithSelector:(SEL)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    NSStringFromSelector(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableDictionary objectForKey:](self->_cachedStyleProperties, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_setCachedStyleObject:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *cachedStyleProperties;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v6 = a3;
  if (v6 && a4)
  {
    v11 = v6;
    NSStringFromSelector(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      cachedStyleProperties = self->_cachedStyleProperties;
      if (!cachedStyleProperties)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v10 = self->_cachedStyleProperties;
        self->_cachedStyleProperties = v9;

        cachedStyleProperties = self->_cachedStyleProperties;
      }
      -[NSMutableDictionary setObject:forKey:](cachedStyleProperties, "setObject:forKey:", v11, v7);
    }

    v6 = v11;
  }

}

- (id)_cachedImageWithName:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[TKStyleProvider _cachedStyleObjectForPropertyWithSelector:](self, "_cachedStyleObjectForPropertyWithSelector:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = (void *)MEMORY[0x24BDF6AC8];
      -[TKStyleProvider _bundle](self, "_bundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:", v6, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[TKStyleProvider _setCachedStyleObject:forPropertyWithSelector:](self, "_setCachedStyleObject:forPropertyWithSelector:", v7, a4);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_cachedResizableImageForPropertyWithSelector:(SEL)a3 capInsets:(UIEdgeInsets)a4 size:(CGSize)a5 imageRenderingMode:(int64_t)a6 withDrawingActions:(id)a7
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  double top;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v25;

  height = a5.height;
  width = a5.width;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v16 = a7;
  -[TKStyleProvider _cachedStyleObjectForPropertyWithSelector:](self, "_cachedStyleObjectForPropertyWithSelector:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", width, height);
    objc_msgSend(v18, "imageWithActions:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a6)
    {
      objc_msgSend(v19, "imageWithRenderingMode:", a6);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    if (left == *(double *)(MEMORY[0x24BDF7718] + 8)
      && top == *MEMORY[0x24BDF7718]
      && right == *(double *)(MEMORY[0x24BDF7718] + 24)
      && bottom == *(double *)(MEMORY[0x24BDF7718] + 16))
    {
      v25 = v20;
    }
    else
    {
      objc_msgSend(v20, "resizableImageWithCapInsets:", top, left, bottom, right);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v25;
    -[TKStyleProvider _setCachedStyleObject:forPropertyWithSelector:](self, "_setCachedStyleObject:forPropertyWithSelector:", v25, a3);

  }
  return v17;
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  NSMutableDictionary *cachedStyleProperties;
  NSBundle *bundle;

  cachedStyleProperties = self->_cachedStyleProperties;
  self->_cachedStyleProperties = 0;

  bundle = self->_bundle;
  self->_bundle = 0;

}

- (double)defaultAnimationDuration
{
  return 0.3;
}

- (UIColor)vibrationRecorderBarsBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global);
}

id __55__TKStyleProvider_vibrationRecorderBarsBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)vibrationRecorderInstructionsLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B8]);
}

- (UIColor)vibrationRecorderInstructionsLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_13);
}

id __62__TKStyleProvider_vibrationRecorderInstructionsLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIColor)vibrationRecorderInstructionsLabelBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (UIOffset)vibrationRecorderInstructionsLabelPositionOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = 0.0;
  v3 = -6.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)vibrationRecorderInstructionsLabelEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 20.0;
  v3 = 20.0;
  v4 = 20.0;
  v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)vibrationRecorderInstructionsLabelFadeAnimationDuration
{
  double v2;

  -[TKStyleProvider defaultAnimationDuration](self, "defaultAnimationDuration");
  return v2 / 3.0;
}

- (double)vibrationRecorderControlsToolbarVerticalOffset
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = -1.0 / v3;

  return v4;
}

- (double)vibrationRecorderControlsToolbarAdditionalHeight
{
  return 4.0;
}

- (double)vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge
{
  return -2.0;
}

- (double)vibrationRecorderProgressToolbarVerticalOffset
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = -1.0 / v3;

  return v4;
}

- (double)vibrationRecorderProgressToolbarAdditionalHeight
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (double)vibrationRecorderProgressViewHorizontalOffsetFromEdge
{
  return 15.0;
}

- (double)vibrationRecorderProgressViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider vibrationRecorderProgressViewResizableDotImage](self, "vibrationRecorderProgressViewResizableDotImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3 + 2.0;

  return v4;
}

- (UIColor)vibrationRecorderProgressViewTrackColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_14);
}

uint64_t __58__TKStyleProvider_vibrationRecorderProgressViewTrackColor__block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", dbl_2157E9960[v2], 1.0);
}

- (double)vibrationRecorderProgressViewDotHorizontalInset
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (UIColor)vibrationRecorderProgressViewDotTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_15);
}

id __60__TKStyleProvider_vibrationRecorderProgressViewDotTintColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)vibrationRecorderProgressViewResizableDotImage
{
  void *v4;
  _QWORD v11[4];
  __int128 v12;

  -[TKStyleProvider _cachedStyleObjectForPropertyWithSelector:](self, "_cachedStyleObjectForPropertyWithSelector:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__TKStyleProvider_vibrationRecorderProgressViewResizableDotImage__block_invoke;
    v11[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    __asm { FMOV            V0.2D, #5.0 }
    v12 = _Q0;
    -[TKStyleProvider _cachedResizableImageForPropertyWithSelector:capInsets:size:imageRenderingMode:withDrawingActions:](self, "_cachedResizableImageForPropertyWithSelector:capInsets:size:imageRenderingMode:withDrawingActions:", a2, 2, v11, 0.0, 2.0, 0.0, 2.0, 5.0, 5.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImage *)v4;
}

void __65__TKStyleProvider_vibrationRecorderProgressViewResizableDotImage__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *MEMORY[0x24BDBEFB0];
  v2 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v3 = *(double *)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v1, v2, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fill");

}

- (double)vibrationRecorderProgressViewAccessibilityAdditionalHeight
{
  return 20.0;
}

- (UIColor)vibrationRecorderRippleViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_18);
}

uint64_t __61__TKStyleProvider_vibrationRecorderRippleViewBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", dbl_2157E9970[v2], 1.0);
}

- (double)vibrationRecorderRippleRingLineWidth
{
  void *v2;
  double v3;
  double v4;

  -[TKStyleProvider screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (double)vibrationRecorderRippleInitialRadius
{
  return 25.0;
}

- (double)vibrationRecorderRippleFinalRadius
{
  return 75.0;
}

- (double)vibrationRecorderRippleFingerStillSpeed
{
  return 12.36;
}

- (double)vibrationRecorderRippleFingerMovingSpeed
{
  return 25.0;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
  objc_storeStrong((id *)&self->_screen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_cachedStyleProperties, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
