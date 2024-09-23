@implementation TSDMutableColorFill

- (void)setColor:(id)a3
{
  TSUColor *mColor;

  mColor = self->super.mColor;
  if ((-[TSUColor isEqual:](mColor, "isEqual:") & 1) == 0)
  {
    self->super.mColor = (TSUColor *)objc_msgSend(a3, "copy");

  }
}

- (void)setOpacity:(double)a3
{
  -[TSDMutableColorFill setColor:](self, "setColor:", -[TSUColor colorWithAlphaComponent:](-[TSDColorFill color](self, "color"), "colorWithAlphaComponent:", a3));
}

- (void)setHue:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x24BEB3C40];
  -[TSDColorFill saturation](self, "saturation");
  v7 = v6;
  -[TSDColorFill brightness](self, "brightness");
  v9 = v8;
  -[TSDColorFill opacity](self, "opacity");
  -[TSDMutableColorFill setColor:](self, "setColor:", objc_msgSend(v5, "colorWithHue:saturation:brightness:alpha:", a3, v7, v9, v10));
}

- (void)setBrightness:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x24BEB3C40];
  -[TSDColorFill hue](self, "hue");
  v7 = v6;
  -[TSDColorFill saturation](self, "saturation");
  v9 = v8;
  -[TSDColorFill opacity](self, "opacity");
  -[TSDMutableColorFill setColor:](self, "setColor:", objc_msgSend(v5, "colorWithHue:saturation:brightness:alpha:", v7, v9, a3, v10));
}

- (void)setSaturation:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x24BEB3C40];
  -[TSDColorFill hue](self, "hue");
  v7 = v6;
  -[TSDColorFill brightness](self, "brightness");
  v9 = v8;
  -[TSDColorFill opacity](self, "opacity");
  -[TSDMutableColorFill setColor:](self, "setColor:", objc_msgSend(v5, "colorWithHue:saturation:brightness:alpha:", v7, a3, v9, v10));
}

@end
