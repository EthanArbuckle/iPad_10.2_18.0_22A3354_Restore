@implementation WLInterfaceStyleAsset

- (WLInterfaceStyleAsset)initWithLight:(id)a3 dark:(id)a4
{
  id v6;
  id v7;
  WLInterfaceStyleAsset *v8;
  WLInterfaceStyleAsset *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLInterfaceStyleAsset;
  v8 = -[WLInterfaceStyleAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WLInterfaceStyleAsset setLight:](v8, "setLight:", v6);
    -[WLInterfaceStyleAsset setDark:](v9, "setDark:", v7);
  }

  return v9;
}

- (WLAsset)light
{
  return self->_light;
}

- (void)setLight:(id)a3
{
  objc_storeStrong((id *)&self->_light, a3);
}

- (WLAsset)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
  objc_storeStrong((id *)&self->_dark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dark, 0);
  objc_storeStrong((id *)&self->_light, 0);
}

@end
