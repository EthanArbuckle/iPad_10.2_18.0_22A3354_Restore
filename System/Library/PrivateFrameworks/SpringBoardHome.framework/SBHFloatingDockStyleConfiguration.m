@implementation SBHFloatingDockStyleConfiguration

+ (SBHFloatingDockStyleConfiguration)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_46);
  return (SBHFloatingDockStyleConfiguration *)(id)defaultConfiguration_defaultConfiguration;
}

void __57__SBHFloatingDockStyleConfiguration_defaultConfiguration__block_invoke()
{
  SBHFloatingDockStyleConfiguration *v0;
  void *v1;

  v0 = -[SBHFloatingDockStyleConfiguration initWithBackgroundEffect:platterEffect:wantsPlatterShadow:folderIconBackgroundStyle:]([SBHFloatingDockStyleConfiguration alloc], "initWithBackgroundEffect:platterEffect:wantsPlatterShadow:folderIconBackgroundStyle:", 1, 1, 0, 0);
  v1 = (void *)defaultConfiguration_defaultConfiguration;
  defaultConfiguration_defaultConfiguration = (uint64_t)v0;

}

- (SBHFloatingDockStyleConfiguration)init
{

  return 0;
}

- (SBHFloatingDockStyleConfiguration)initWithBackgroundEffect:(unint64_t)a3 platterEffect:(unint64_t)a4 wantsPlatterShadow:(BOOL)a5 folderIconBackgroundStyle:(unint64_t)a6
{
  SBHFloatingDockStyleConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHFloatingDockStyleConfiguration;
  result = -[SBHFloatingDockStyleConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_backgroundEffect = a3;
    result->_platterEffect = a4;
    result->_folderIconBackgroundStyle = a6;
    result->_wantsPlatterShadow = a5;
  }
  return result;
}

- (unint64_t)backgroundEffect
{
  unint64_t backgroundEffect;

  backgroundEffect = self->_backgroundEffect;
  if (UIAccessibilityIsReduceTransparencyEnabled() && backgroundEffect - 1 < 2)
    return 0;
  else
    return backgroundEffect;
}

- (unint64_t)platterEffect
{
  unint64_t platterEffect;

  platterEffect = self->_platterEffect;
  if (UIAccessibilityIsReduceTransparencyEnabled() && platterEffect == 1)
    return 0;
  else
    return platterEffect;
}

- (SBHFloatingDockStyleConfiguration)configurationWithWantsPlatterShadow:(BOOL)a3
{
  return (SBHFloatingDockStyleConfiguration *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundEffect:platterEffect:wantsPlatterShadow:folderIconBackgroundStyle:", self->_backgroundEffect, self->_platterEffect, a3, self->_folderIconBackgroundStyle);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  unint64_t v11;
  unint64_t platterEffect;
  const __CFString *v13;
  unint64_t v14;
  unint64_t backgroundEffect;
  const __CFString *v16;
  unint64_t v17;
  unint64_t folderIconBackgroundStyle;
  const __CFString *v19;
  id v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHFloatingDockStyleConfiguration platterEffect](self, "platterEffect");
  if (v4 > 2)
    v5 = CFSTR("SBFolderBackgroundViewEffectNone");
  else
    v5 = off_1E8D89AC0[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("platterEffect"));
  v6 = -[SBHFloatingDockStyleConfiguration backgroundEffect](self, "backgroundEffect");
  if (v6 > 5)
    v7 = CFSTR("SBFolderControllerBackgroundViewEffectBlur");
  else
    v7 = off_1E8D89AD8[v6];
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("backgroundEffect"));
  v8 = -[SBHFloatingDockStyleConfiguration folderIconBackgroundStyle](self, "folderIconBackgroundStyle");
  if (v8 > 2)
    v9 = CFSTR("SBFolderIconBackgroundStyleOpaqueWhite");
  else
    v9 = off_1E8D89B08[v8];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("folderIconBackgroundStyle"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", UIAccessibilityIsReduceTransparencyEnabled(), CFSTR("UIAccessibilityIsReduceTransparencyEnabled()"));
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v11 = -[SBHFloatingDockStyleConfiguration platterEffect](self, "platterEffect");
    platterEffect = self->_platterEffect;
    if (v11 != platterEffect)
    {
      if (platterEffect > 2)
        v13 = CFSTR("SBFolderBackgroundViewEffectNone");
      else
        v13 = off_1E8D89AC0[platterEffect];
      objc_msgSend(v3, "appendString:withName:", v13, CFSTR("orig platterEffect"));
    }
    v14 = -[SBHFloatingDockStyleConfiguration backgroundEffect](self, "backgroundEffect");
    backgroundEffect = self->_backgroundEffect;
    if (v14 != backgroundEffect)
    {
      if (backgroundEffect > 5)
        v16 = CFSTR("SBFolderControllerBackgroundViewEffectBlur");
      else
        v16 = off_1E8D89AD8[backgroundEffect];
      objc_msgSend(v3, "appendString:withName:", v16, CFSTR("orig backgroundEffect"));
    }
    v17 = -[SBHFloatingDockStyleConfiguration folderIconBackgroundStyle](self, "folderIconBackgroundStyle");
    folderIconBackgroundStyle = self->_folderIconBackgroundStyle;
    if (v17 != folderIconBackgroundStyle)
    {
      if (folderIconBackgroundStyle > 2)
        v19 = CFSTR("SBFolderIconBackgroundStyleOpaqueWhite");
      else
        v19 = off_1E8D89B08[folderIconBackgroundStyle];
      objc_msgSend(v3, "appendString:withName:", v19, CFSTR("orig folderIconBackgroundStyle"));
    }
  }
  v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHFloatingDockStyleConfiguration wantsPlatterShadow](self, "wantsPlatterShadow"), CFSTR("wantsPlatterShadow"));
  objc_msgSend(v3, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (unint64_t)folderIconBackgroundStyle
{
  return self->_folderIconBackgroundStyle;
}

- (BOOL)wantsPlatterShadow
{
  return self->_wantsPlatterShadow;
}

@end
