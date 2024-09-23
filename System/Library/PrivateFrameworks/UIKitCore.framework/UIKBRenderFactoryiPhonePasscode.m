@implementation UIKBRenderFactoryiPhonePasscode

- (id)defaultKeyBackgroundColorName
{
  return CFSTR("UIKBColorClear");
}

- (double)passcodeEdgeWeight
{
  return 1.0;
}

- (id)hashStringElement
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keycapOpacity");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactoryiPhonePasscode;
  v6 = a4;
  v7 = a3;
  -[UIKBRenderFactoryiPhone _traitsForKey:onKeyplane:](&v12, sel__traitsForKey_onKeyplane_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory modifyKeyTraitsForPasscode:forKey:onKeyplane:](self, "modifyKeyTraitsForPasscode:forKey:onKeyplane:", v8, v7, v6, v12.receiver, v12.super_class);

  v9 = -[UIKBRenderFactoryiPhone _popupStyleForKey:](self, "_popupStyleForKey:", v7);
  if (v9)
  {
    -[UIKBRenderFactory extraPasscodePaddleTraits](self, "extraPasscodePaddleTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overlayWithTraits:", v10);

  }
  return v8;
}

@end
