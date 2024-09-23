@implementation UIKBRenderFactoryHWR_Floating

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactoryHWR_Floating;
  v6 = a3;
  -[UIKBRenderFactoryHWR_Portrait _traitsForKey:onKeyplane:](&v12, sel__traitsForKey_onKeyplane_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "displayType", v12.receiver, v12.super_class);

  if (v8 == 12)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "lightKeyboard");

    if (v10)
    {
      objc_msgSend(v7, "setBackgroundGradient:", 0);
      objc_msgSend(v7, "removeAllRenderEffects");
    }
  }
  return v7;
}

@end
