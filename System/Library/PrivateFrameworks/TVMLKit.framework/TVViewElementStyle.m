@implementation TVViewElementStyle

- (TVViewElementStyle)initWithStyle:(id)a3
{
  id v4;
  TVViewElementStyle *v5;
  TVViewElementStyle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVViewElementStyle;
  v5 = -[TVViewElementStyle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_style, v4);

  return v6;
}

- (TVAppStyle)styleMetrics
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_styleMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVAppStyle *)v3;
}

- (void)setStyleMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVViewElementStyle style](self, "style");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_setStyleMetrics:", v4);

}

- (id)cssValueForStyleProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TVViewElementStyle style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_cssValueForStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)valueForStyleProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *cachedColorObjects;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  TVColor *v10;
  TVColor *v11;
  void *v12;
  TVColor *v13;

  v4 = a3;
  -[TVViewElementStyle style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_valueForStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cachedColorObjects = self->_cachedColorObjects;
    if (!cachedColorObjects)
    {
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
      v9 = self->_cachedColorObjects;
      self->_cachedColorObjects = v8;

      cachedColorObjects = self->_cachedColorObjects;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](cachedColorObjects, "objectForKeyedSubscript:", v4);
    v10 = (TVColor *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10
      || (-[TVColor ikColor](v10, "ikColor"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12 != v6))
    {
      v13 = -[TVColor initWithColor:]([TVColor alloc], "initWithColor:", v6);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedColorObjects, "setObject:forKeyedSubscript:", v13, v4);
      v11 = v13;
    }

    v6 = v11;
  }

  return v6;
}

- (TVColor)backgroundColor
{
  return (TVColor *)-[TVViewElementStyle valueForStyleProperty:](self, "valueForStyleProperty:", CFSTR("background-color"));
}

- (TVColor)color
{
  return (TVColor *)-[TVViewElementStyle valueForStyleProperty:](self, "valueForStyleProperty:", CFSTR("color"));
}

- (NSString)textTransform
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_textTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)fontSize
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_fontSize");
  v4 = v3;

  return v4;
}

- (NSString)fontWeight
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_fontWeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)height
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_height");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)margin
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_margin");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)focusMargin
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_focusMargin");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)maxHeight
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_maxHeight");
  v4 = v3;

  return v4;
}

- (double)maxWidth
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_maxWidth");
  v4 = v3;

  return v4;
}

- (double)minHeight
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_minHeight");
  v4 = v3;

  return v4;
}

- (double)minWidth
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_minWidth");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)padding
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_padding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_textAlignment");

  return v3;
}

- (double)width
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_width");
  v4 = v3;

  return v4;
}

- (NSShadow)shadow
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_shadow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSShadow *)v3;
}

- (int64_t)alignment
{
  void *v2;
  int64_t v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_alignment");

  return v3;
}

- (int64_t)contentAlignment
{
  void *v2;
  int64_t v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_contentAlignment");

  return v3;
}

- (TVColor)highlightColor
{
  return (TVColor *)-[TVViewElementStyle valueForStyleProperty:](self, "valueForStyleProperty:", CFSTR("tv-highlight-color"));
}

- (NSString)imageTreatmentName
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_imageTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)interitemSpacing
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_interitemSpacing");
  v4 = v3;

  return v4;
}

- (NSString)textHighlightStyle
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_textHighlightStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)textMinimumScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_minimumScaleFactor");
  v4 = v3;

  return v4;
}

- (int64_t)position
{
  void *v2;
  int64_t v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_position");

  return v3;
}

- (NSString)ratingStyle
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_ratingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)maxTextLines
{
  void *v2;
  unint64_t v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_maxTextLines");

  return v3;
}

- (NSString)textStyle
{
  void *v2;
  void *v3;

  -[TVViewElementStyle style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_textStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TVColor)tintColor
{
  return (TVColor *)-[TVViewElementStyle valueForStyleProperty:](self, "valueForStyleProperty:", CFSTR("tv-tint-color"));
}

- (id)darkTintColor
{
  return -[TVViewElementStyle valueForStyleProperty:](self, "valueForStyleProperty:", CFSTR("tv-dark-tint-color"));
}

- (IKViewElementStyle)style
{
  return (IKViewElementStyle *)objc_loadWeakRetained((id *)&self->_style);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_style);
  objc_storeStrong((id *)&self->_cachedColorObjects, 0);
}

@end
