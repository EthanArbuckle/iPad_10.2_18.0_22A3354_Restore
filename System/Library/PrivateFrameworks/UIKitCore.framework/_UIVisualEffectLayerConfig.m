@implementation _UIVisualEffectLayerConfig

- (NSString)filterType
{
  return self->_filterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

+ (id)layerWithFillColor:(id)a3 opacity:(double)a4 filterType:(id)a5
{
  id v8;
  id v9;
  double *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = (double *)objc_alloc_init((Class)a1);
  v11 = (void *)*((_QWORD *)v10 + 1);
  *((_QWORD *)v10 + 1) = v9;
  v12 = v9;

  v10[2] = a4;
  v13 = (void *)*((_QWORD *)v10 + 3);
  *((_QWORD *)v10 + 3) = v8;

  return v10;
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
  -[_UIVisualEffectLayerConfig fillColor](self, "fillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v4);

  -[_UIVisualEffectLayerConfig opacity](self, "opacity");
  objc_msgSend(v9, "setAlpha:");
  -[_UIVisualEffectLayerConfig filterType](self, "filterType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CD2780];
    -[_UIVisualEffectLayerConfig filterType](self, "filterType");
    self = (_UIVisualEffectLayerConfig *)objc_claimAutoreleasedReturnValue();
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

- (void)deconfigureLayerView:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCompositingFilter:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectLayerConfig;
  -[_UIVisualEffectLayerConfig description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" opacity=%f filterType=%@ fillColor=%@"), *(_QWORD *)&self->_opacity, self->_filterType, self->_fillColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)opacity
{
  return self->_opacity;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

@end
