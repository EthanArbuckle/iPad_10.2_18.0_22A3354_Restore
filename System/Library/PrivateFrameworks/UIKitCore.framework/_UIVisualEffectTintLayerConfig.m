@implementation _UIVisualEffectTintLayerConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (void)configureLayerView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIVisualEffectTintLayerConfig tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v4);

  -[_UIVisualEffectLayerConfig filterType](self, "filterType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CD2780];
    -[_UIVisualEffectLayerConfig filterType](self, "filterType");
    self = (_UIVisualEffectTintLayerConfig *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterWithType:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v9, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v7);

  if (v5)
  {

  }
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

+ (id)layerWithTintColor:(id)a3 filterType:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "layerWithFillColor:opacity:filterType:", 0, v7, 1.0);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8[4];
  v8[4] = v6;
  v10 = v6;

  v11 = (void *)v8[1];
  v8[1] = v7;

  return v8;
}

+ (id)layerWithTintColor:(id)a3
{
  return (id)objc_msgSend(a1, "layerWithTintColor:filterType:", a3, 0);
}

- (void)deconfigureLayerView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setTintColor:", 0);
  objc_msgSend(v3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCompositingFilter:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectTintLayerConfig;
  -[_UIVisualEffectLayerConfig description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" tintColor=%@"), self->_tintColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
