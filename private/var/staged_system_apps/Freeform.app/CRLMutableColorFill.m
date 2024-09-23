@implementation CRLMutableColorFill

- (void)setColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    -[CRLColorFill i_setColor:](self, "i_setColor:", v5);

}

- (void)setOpacity:(double)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", a3));
  -[CRLMutableColorFill setColor:](self, "setColor:", v5);

}

- (void)setHue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[CRLColorFill saturation](self, "saturation");
  v6 = v5;
  -[CRLColorFill brightness](self, "brightness");
  v8 = v7;
  -[CRLColorFill opacity](self, "opacity");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithHue:saturation:brightness:alpha:](CRLColor, "colorWithHue:saturation:brightness:alpha:", a3, v6, v8, v9));
  -[CRLMutableColorFill setColor:](self, "setColor:", v10);

}

- (void)setBrightness:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[CRLColorFill hue](self, "hue");
  v6 = v5;
  -[CRLColorFill saturation](self, "saturation");
  v8 = v7;
  -[CRLColorFill opacity](self, "opacity");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithHue:saturation:brightness:alpha:](CRLColor, "colorWithHue:saturation:brightness:alpha:", v6, v8, a3, v9));
  -[CRLMutableColorFill setColor:](self, "setColor:", v10);

}

- (void)setSaturation:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[CRLColorFill hue](self, "hue");
  v6 = v5;
  -[CRLColorFill brightness](self, "brightness");
  v8 = v7;
  -[CRLColorFill opacity](self, "opacity");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithHue:saturation:brightness:alpha:](CRLColor, "colorWithHue:saturation:brightness:alpha:", v6, a3, v8, v9));
  -[CRLMutableColorFill setColor:](self, "setColor:", v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLColorFill *v4;
  void *v5;
  CRLColorFill *v6;

  v4 = [CRLColorFill alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v6 = -[CRLColorFill initWithColor:](v4, "initWithColor:", v5);

  return v6;
}

@end
