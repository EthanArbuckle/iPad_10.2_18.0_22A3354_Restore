@implementation SKUIJSColor

- (SKUIJSColor)initWithAppContext:(id)a3 color:(id)a4
{
  id v6;
  id v7;
  SKUIJSColor *v8;
  SKUIJSColor *v9;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSColor initWithAppContext:color:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIJSColor;
  v8 = -[IKJSObject initWithAppContext:](&v14, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v7 && v8)
  {
    v12 = 0.0;
    v13 = 0.0;
    v11 = 0.0;
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v8->_alpha);
    v9->_red = (unint64_t)(v13 * 255.0);
    v9->_green = (unint64_t)(v12 * 255.0);
    v9->_blue = (unint64_t)(v11 * 255.0);
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%lu,%lu,%lu,%f)"), self->_red, self->_green, self->_blue, *(_QWORD *)&self->_alpha);
}

- (unint64_t)red
{
  return self->_red;
}

- (unint64_t)green
{
  return self->_green;
}

- (unint64_t)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)initWithAppContext:color:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSColor initWithAppContext:color:]";
}

@end
