@implementation _TUISymbolImageKey

- (_TUISymbolImageKey)initWithName:(id)a3 configuration:(id)a4 style:(unint64_t)a5 contentsScale:(double)a6 layoutDirection:(unint64_t)a7 renderingMode:(unint64_t)a8
{
  id v14;
  id v15;
  _TUISymbolImageKey *v16;
  NSString *v17;
  NSString *name;
  UIImageSymbolConfiguration *v19;
  UIImageSymbolConfiguration *configuration;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_TUISymbolImageKey;
  v16 = -[_TUISymbolImageKey init](&v22, "init");
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v14, "copy");
    name = v16->_name;
    v16->_name = v17;

    v19 = (UIImageSymbolConfiguration *)objc_msgSend(v15, "copy");
    configuration = v16->_configuration;
    v16->_configuration = v19;

    v16->_style = a5;
    v16->_contentsScale = a6;
    v16->_layoutDirection = a7;
    v16->_renderingMode = a8;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (id *)a3;
  v5 = v4;
  v7 = v4
    && (v6 = objc_opt_class(v4), v6 == objc_opt_class(_TUISymbolImageKey))
    && objc_msgSend(v5[1], "isEqualToString:", self->_name)
    && objc_msgSend(v5[2], "isEqualToConfiguration:", self->_configuration)
    && v5[3] == (id)self->_style
    && *((double *)v5 + 4) == self->_contentsScale
    && v5[5] == (id)self->_layoutDirection
    && v5[6] == (id)self->_renderingMode;

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return (unint64_t)-[UIImageSymbolConfiguration hash](self->_configuration, "hash") ^ v3 ^ self->_style ^ self->_layoutDirection ^ self->_renderingMode ^ (unint64_t)self->_contentsScale;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageSymbolConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)style
{
  return self->_style;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
