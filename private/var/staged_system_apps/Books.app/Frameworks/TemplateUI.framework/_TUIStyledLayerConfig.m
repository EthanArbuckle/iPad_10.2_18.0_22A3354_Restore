@implementation _TUIStyledLayerConfig

- (_TUIStyledLayerConfig)initWithStyler:(id)a3
{
  id v5;
  _TUIStyledLayerConfig *v6;
  _TUIStyledLayerConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIStyledLayerConfig;
  v6 = -[_TUIStyledLayerConfig init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_styler, a3);

  return v7;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(_TUIStyledLayer, a2);
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  -[_TUIStyledBoxStyler applyStylingToLayer:](self->_styler, "applyStylingToLayer:", a3);
}

- (void)configureLayer:(id)a3
{
  -[_TUIStyledBoxStyler applyStylingToLayer:](self->_styler, "applyStylingToLayer:", a3);
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TUIStyledLayerConfig *v9;
  _TUIStyledLayerConfig *v10;
  BOOL v11;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(self, v7))
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9 == self)
  {
    v11 = 1;
  }
  else if (v9)
  {
    v11 = -[_TUIStyledBoxStyler isEqualToStyle:](self->_styler, "isEqualToStyle:", v9->_styler);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
  objc_msgSend(a4, "setSublayers:", a3);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (_TUIStyledBoxStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styler, 0);
}

@end
