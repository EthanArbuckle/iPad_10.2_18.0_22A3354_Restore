@implementation CRLCanvasTextRenderable

- (CRLCanvasTextRenderable)initWithTextLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasTextRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromTextLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithTextLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithTextLayer:", v3);

  return v4;
}

- (id)p_textLayer
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CATextLayer, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)string
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return v3;
}

- (void)setString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v5, "setString:", v4);

}

- (double)fontSize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v2, "fontSize");
  v4 = v3;

  return v4;
}

- (void)setFontSize:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v4, "setFontSize:", a3);

}

- (NSString)truncationMode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "truncationMode"));

  return (NSString *)v3;
}

- (void)setTruncationMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v5, "setTruncationMode:", v4);

}

- (void)setFont:(void *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v4, "setFont:", a3);

}

- (void)font
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  v3 = objc_msgSend(v2, "font");

  return v3;
}

- (void)setForegroundColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v4, "setForegroundColor:", a3);

}

- (CGColor)foregroundColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  v3 = (CGColor *)objc_msgSend(v2, "foregroundColor");

  return v3;
}

- (NSString)alignmentMode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "alignmentMode"));

  return (NSString *)v3;
}

- (void)setAlignmentMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasTextRenderable p_textLayer](self, "p_textLayer"));
  objc_msgSend(v5, "setAlignmentMode:", v4);

}

@end
