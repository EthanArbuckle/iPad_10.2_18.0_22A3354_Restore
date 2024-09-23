@implementation PXFocusSettings

- (BOOL)hideFocusRing
{
  return self->_hideFocusRing;
}

+ (PXFocusSettings)sharedInstance
{
  if (sharedInstance_onceToken_186289 != -1)
    dispatch_once(&sharedInstance_onceToken_186289, &__block_literal_global_186290);
  return (PXFocusSettings *)(id)sharedInstance_sharedInstance_186291;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFocusSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXFocusSettings setFocusAnimationStyle:](self, "setFocusAnimationStyle:", 1);
  -[PXFocusSettings setFocusAnimationPadding:](self, "setFocusAnimationPadding:", 48.0);
  -[PXFocusSettings setPressedAnimationStyle:](self, "setPressedAnimationStyle:", 2);
  -[PXFocusSettings setPressedAnimationPadding:](self, "setPressedAnimationPadding:", 24.0);
  -[PXFocusSettings setHideFocusRing:](self, "setHideFocusRing:", 0);
}

- (void)setPressedAnimationStyle:(int64_t)a3
{
  self->_pressedAnimationStyle = a3;
}

- (void)setPressedAnimationPadding:(double)a3
{
  self->_pressedAnimationPadding = a3;
}

- (void)setHideFocusRing:(BOOL)a3
{
  self->_hideFocusRing = a3;
}

- (void)setFocusAnimationStyle:(int64_t)a3
{
  self->_focusAnimationStyle = a3;
}

- (void)setFocusAnimationPadding:(double)a3
{
  self->_focusAnimationPadding = a3;
}

void __33__PXFocusSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_186291;
  sharedInstance_sharedInstance_186291 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)focusAnimationPadding
{
  return self->_focusAnimationPadding;
}

- (int64_t)focusAnimationStyle
{
  return self->_focusAnimationStyle;
}

- (double)pressedAnimationPadding
{
  return self->_pressedAnimationPadding;
}

- (int64_t)pressedAnimationStyle
{
  return self->_pressedAnimationStyle;
}

@end
