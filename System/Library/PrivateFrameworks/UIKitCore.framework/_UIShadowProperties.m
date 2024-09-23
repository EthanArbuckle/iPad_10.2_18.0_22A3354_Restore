@implementation _UIShadowProperties

- (_UIShadowProperties)init
{
  _UIShadowProperties *v2;
  _UIShadowProperties *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIShadowProperties;
  v2 = -[_UIShadowProperties init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIShadowProperties setOpacity:](v2, "setOpacity:", 0.0);
    +[UIColor blackColor](UIColor, "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIShadowProperties setColor:](v3, "setColor:", v4);

    -[_UIShadowProperties setOffset:](v3, "setOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[_UIShadowProperties setRadius:](v3, "setRadius:", 0.0);
  }
  return v3;
}

+ (id)propertiesFromView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowOpacity");
  objc_msgSend(v4, "setOpacity:", v6);

  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v7, "shadowColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v8);

  objc_msgSend(v3, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shadowOffset");
  objc_msgSend(v4, "setOffset:");

  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "shadowRadius");
  objc_msgSend(v4, "setRadius:");

  return v4;
}

- (void)applyToView:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v4 = a3;
  -[_UIShadowProperties color](self, "color");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", v6);

  -[_UIShadowProperties offset](self, "offset");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowOffset:", v9, v11);

  -[_UIShadowProperties radius](self, "radius");
  v14 = v13;
  objc_msgSend(v4, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowRadius:", v14);

  -[_UIShadowProperties opacity](self, "opacity");
  *(float *)&v14 = v16;
  objc_msgSend(v4, "layer");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = LODWORD(v14);
  objc_msgSend(v18, "setShadowOpacity:", v17);

}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  width = self->_offset.width;
  height = self->_offset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
