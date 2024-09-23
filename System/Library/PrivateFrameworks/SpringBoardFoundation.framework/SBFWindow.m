@implementation SBFWindow

- (BOOL)isInterfaceAutorotationDisabled
{
  return 1;
}

- (id)hostedSceneIdentityTokens
{
  return 0;
}

- (void)makeKeyWindow
{
  id v3;
  objc_super v4;

  if (__sb__runningInSpringBoard())
  {
    -[SBFWindow _keyWindowStack](self, "_keyWindowStack");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushKeyWindow:", self);

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFWindow;
    -[SBFWindow makeKeyWindow](&v4, sel_makeKeyWindow);
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSNumber **p_isHiddenOverride;
  NSNumber *isHiddenOverride;
  void *v8;
  NSNumber *v9;
  NSNumber *v10;
  objc_super v11;

  v3 = a3;
  if (__sb__runningInSpringBoard())
  {
    v5 = -[SBFWindow isHidden](self, "isHidden");
    if (v3)
    {
      if ((v5 & 1) == 0)
      {
        p_isHiddenOverride = &self->_isHiddenOverride;
        isHiddenOverride = self->_isHiddenOverride;
        self->_isHiddenOverride = (NSNumber *)MEMORY[0x1E0C9AAB0];

        -[SBFWindow _keyWindowStack](self, "_keyWindowStack");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "noteWindowHidden:", self);
LABEL_7:

        v10 = *p_isHiddenOverride;
        *p_isHiddenOverride = 0;

      }
    }
    else if (v5)
    {
      p_isHiddenOverride = &self->_isHiddenOverride;
      v9 = self->_isHiddenOverride;
      self->_isHiddenOverride = (NSNumber *)MEMORY[0x1E0C9AAA0];

      -[SBFWindow _keyWindowStack](self, "_keyWindowStack");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "noteWindowUnhidden:", self);
      goto LABEL_7;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SBFWindow;
  -[SBFWindow setHidden:](&v11, sel_setHidden_, v3);
}

- (_SBFKeyWindowStack)_keyWindowStack
{
  _SBFKeyWindowStack *keyWindowStack;
  _SBFKeyWindowStack *v4;
  _SBFKeyWindowStack *v5;

  keyWindowStack = self->_keyWindowStack;
  if (!keyWindowStack)
  {
    +[_SBFKeyWindowStack sharedInstance](_SBFKeyWindowStack, "sharedInstance");
    v4 = (_SBFKeyWindowStack *)objc_claimAutoreleasedReturnValue();
    v5 = self->_keyWindowStack;
    self->_keyWindowStack = v4;

    keyWindowStack = self->_keyWindowStack;
  }
  return keyWindowStack;
}

- (void)_makeKeyFromKeyWindowStack
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBFWindow;
  -[SBFWindow makeKeyWindow](&v2, sel_makeKeyWindow);
}

- (BOOL)_isEffectivelyHiddenForKeyWindowStack
{
  if (self->_isHiddenOverride)
    return -[NSNumber BOOLValue](self->_isHiddenOverride, "BOOLValue");
  else
    return -[SBFWindow isHidden](self, "isHidden");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBFWindow _keyWindowStack](self, "_keyWindowStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteWindowDeallocated:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFWindow;
  -[SBFWindow dealloc](&v4, sel_dealloc);
}

- (void)resignAsKeyWindow
{
  id v3;

  if (__sb__runningInSpringBoard())
  {
    -[SBFWindow _keyWindowStack](self, "_keyWindowStack");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "popKeyWindow:", self);

  }
}

- (id)autorotationPreventionReasons
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (void)_setKeyWindowStack:(id)a3
{
  objc_storeStrong((id *)&self->_keyWindowStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isHiddenOverride, 0);
  objc_storeStrong((id *)&self->_keyWindowStack, 0);
}

@end
