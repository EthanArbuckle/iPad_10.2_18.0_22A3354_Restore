@implementation PSLegendColorView

- (PSLegendColorView)initWithColor:(id)a3
{
  id v5;
  PSLegendColorView *v6;
  PSLegendColorView *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSLegendColorView;
  v6 = -[PSLegendColorView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    -[PSLegendColorView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSLegendColorView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  return v7;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  CGContext *CurrentContext;
  void *v7;
  void *v8;
  UIColor *color;
  UIColor *v10;
  UIColor *v11;
  void *v12;
  id v13;

  -[PSLegendColorView traitCollection](self, "traitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v7 = (void *)MEMORY[0x1E0CEA390];
  -[PSLegendColorView bounds](self, "bounds");
  objc_msgSend(v7, "bezierPathWithOvalInRect:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFill");

  objc_msgSend(v13, "fill");
  color = self->_color;
  if (color)
  {
    v10 = color;
  }
  else
  {
    if (v5 == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkMidGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  -[UIColor setFill](v10, "setFill");
  objc_msgSend(v13, "fill");
  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFill");
    objc_msgSend(v13, "fill");

  }
  CGContextRestoreGState(CurrentContext);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548], a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xHeight");
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
