@implementation PXKeyboardSettings

+ (PXKeyboardSettings)sharedInstance
{
  if (sharedInstance_onceToken_292644 != -1)
    dispatch_once(&sharedInstance_onceToken_292644, &__block_literal_global_292645);
  return (PXKeyboardSettings *)(id)sharedInstance_sharedInstance_292646;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXKeyboardSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXKeyboardSettings setEnableShadow:](self, "setEnableShadow:", 0);
  -[PXKeyboardSettings setShadowYOffset:](self, "setShadowYOffset:", 10.0);
  -[PXKeyboardSettings setShadowBlurRadius:](self, "setShadowBlurRadius:", 30.0);
  -[PXKeyboardSettings setShadowOpacity:](self, "setShadowOpacity:", 3.0);
  -[PXKeyboardSettings setYearsFocusAnimationStyle:](self, "setYearsFocusAnimationStyle:", 0);
  -[PXKeyboardSettings setYearsFocusPadding:](self, "setYearsFocusPadding:", 20.0);
  -[PXKeyboardSettings setMonthsFocusAnimationStyle:](self, "setMonthsFocusAnimationStyle:", 0);
  -[PXKeyboardSettings setMonthsFocusPadding:](self, "setMonthsFocusPadding:", 20.0);
  -[PXKeyboardSettings setDaysFocusAnimationStyle:](self, "setDaysFocusAnimationStyle:", 0);
  -[PXKeyboardSettings setDaysFocusPadding:](self, "setDaysFocusPadding:", 20.0);
  -[PXKeyboardSettings setAllPhotosAspectFitFocusAnimationStyle:](self, "setAllPhotosAspectFitFocusAnimationStyle:", 0);
  -[PXKeyboardSettings setAllPhotosAspectFitFocusPadding:](self, "setAllPhotosAspectFitFocusPadding:", 20.0);
  -[PXKeyboardSettings setAllPhotosAspectFillFocusAnimationStyle:](self, "setAllPhotosAspectFillFocusAnimationStyle:", 0);
  -[PXKeyboardSettings setAllPhotosAspectFillFocusPadding:](self, "setAllPhotosAspectFillFocusPadding:", 20.0);
  -[PXKeyboardSettings setDetailsViewOverlayAlpha:](self, "setDetailsViewOverlayAlpha:", 0.3);
}

- (void)setYearsFocusPadding:(double)a3
{
  self->_yearsFocusPadding = a3;
}

- (void)setYearsFocusAnimationStyle:(int64_t)a3
{
  self->_yearsFocusAnimationStyle = a3;
}

- (void)setShadowYOffset:(double)a3
{
  self->_shadowYOffset = a3;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (void)setShadowBlurRadius:(double)a3
{
  self->_shadowBlurRadius = a3;
}

- (void)setMonthsFocusPadding:(double)a3
{
  self->_monthsFocusPadding = a3;
}

- (void)setMonthsFocusAnimationStyle:(int64_t)a3
{
  self->_monthsFocusAnimationStyle = a3;
}

- (void)setEnableShadow:(BOOL)a3
{
  self->_enableShadow = a3;
}

- (void)setDetailsViewOverlayAlpha:(double)a3
{
  self->_detailsViewOverlayAlpha = a3;
}

- (void)setDaysFocusPadding:(double)a3
{
  self->_daysFocusPadding = a3;
}

- (void)setDaysFocusAnimationStyle:(int64_t)a3
{
  self->_daysFocusAnimationStyle = a3;
}

- (void)setAllPhotosAspectFitFocusPadding:(double)a3
{
  self->_allPhotosAspectFitFocusPadding = a3;
}

- (void)setAllPhotosAspectFitFocusAnimationStyle:(int64_t)a3
{
  self->_allPhotosAspectFitFocusAnimationStyle = a3;
}

- (void)setAllPhotosAspectFillFocusPadding:(double)a3
{
  self->_allPhotosAspectFillFocusPadding = a3;
}

- (void)setAllPhotosAspectFillFocusAnimationStyle:(int64_t)a3
{
  self->_allPhotosAspectFillFocusAnimationStyle = a3;
}

- (double)daysFocusPadding
{
  return self->_daysFocusPadding;
}

- (int64_t)daysFocusAnimationStyle
{
  return self->_daysFocusAnimationStyle;
}

void __36__PXKeyboardSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_292646;
  sharedInstance_sharedInstance_292646 = v0;

}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(a1, "_makeGlobalFocusAnimationSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_makeLocalFocusAnimationSection", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moduleWithTitle:contents:", CFSTR("Keyboard"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_makeLocalFocusAnimationSection
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(&unk_1E53E9E88, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(&unk_1E53E9EB8, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E53E9ED0, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_makeAnimationStyleChoiceRowWithTitle:valueKeyPath:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      v8 = (void *)MEMORY[0x1E0D830F8];
      objc_msgSend(&unk_1E53E9E88, "objectAtIndexedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E53E9EA0, "objectAtIndexedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rowWithTitle:valueKeyPath:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "minValue:maxValue:", 2.0, 30.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_increment:", 2.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v13);

      ++v4;
    }
    while (v4 < objc_msgSend(&unk_1E53E9E88, "count"));
  }
  v14 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_detailsViewOverlayAlpha);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Details Overlay Alpha"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v3, CFSTR("Local Settings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_makeGlobalFocusAnimationSection
{
  id v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_shadowYOffset);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Y Offset"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 50.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_increment:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_shadowBlurRadius);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Blur Radius"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 0.0, 50.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_increment:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_shadowOpacity);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 0.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_increment:", 0.01);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Shadow"), CFSTR("enableShadow"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v2, CFSTR("Global Settings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_makeAnimationStyleChoiceRowWithTitle:(id)a3 valueKeyPath:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D830B0], "rowWithTitle:valueKeyPath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "possibleValues:titles:", &unk_1E53E9EE8, &unk_1E53E9F00);
  return v4;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("globalFocusAnimationShadow")) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXKeyboardSettings;
    -[PXSettings applyArchiveValue:forKey:](&v8, sel_applyArchiveValue_forKey_, v6, v7);
  }

}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("globalFocusAnimationShadow")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXKeyboardSettings;
    -[PXSettings archiveValueForKey:](&v7, sel_archiveValueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)globalFocusAnimationShadow
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  v4 = (void *)MEMORY[0x1E0DC3658];
  -[PXKeyboardSettings shadowOpacity](self, "shadowOpacity");
  objc_msgSend(v4, "colorWithWhite:alpha:", 0.0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowColor:", v6);

  -[PXKeyboardSettings shadowBlurRadius](self, "shadowBlurRadius");
  objc_msgSend(v3, "setShadowBlurRadius:");
  -[PXKeyboardSettings shadowYOffset](self, "shadowYOffset");
  objc_msgSend(v3, "setShadowOffset:", 0.0, v7);
  return v3;
}

- (BOOL)enableShadow
{
  return self->_enableShadow;
}

- (double)shadowYOffset
{
  return self->_shadowYOffset;
}

- (double)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (int64_t)yearsFocusAnimationStyle
{
  return self->_yearsFocusAnimationStyle;
}

- (double)yearsFocusPadding
{
  return self->_yearsFocusPadding;
}

- (int64_t)monthsFocusAnimationStyle
{
  return self->_monthsFocusAnimationStyle;
}

- (double)monthsFocusPadding
{
  return self->_monthsFocusPadding;
}

- (int64_t)allPhotosAspectFitFocusAnimationStyle
{
  return self->_allPhotosAspectFitFocusAnimationStyle;
}

- (double)allPhotosAspectFitFocusPadding
{
  return self->_allPhotosAspectFitFocusPadding;
}

- (int64_t)allPhotosAspectFillFocusAnimationStyle
{
  return self->_allPhotosAspectFillFocusAnimationStyle;
}

- (double)allPhotosAspectFillFocusPadding
{
  return self->_allPhotosAspectFillFocusPadding;
}

- (double)detailsViewOverlayAlpha
{
  return self->_detailsViewOverlayAlpha;
}

@end
