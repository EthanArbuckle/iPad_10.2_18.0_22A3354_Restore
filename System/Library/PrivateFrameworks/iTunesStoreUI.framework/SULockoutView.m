@implementation SULockoutView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULockoutView;
  -[SULockoutView dealloc](&v3, sel_dealloc);
}

- (UIImage)backgroundImage
{
  return -[UIImageView image](self->_backgroundImageView, "image");
}

- (NSString)body
{
  return (NSString *)objc_msgSend(-[SULockoutView _bodyLabel](self, "_bodyLabel"), "text");
}

- (UIImage)image
{
  return (UIImage *)objc_msgSend(-[SULockoutView _imageView](self, "_imageView"), "image");
}

- (UIImage)glowImage
{
  return -[UIImageView image](self->_glowImageView, "image");
}

- (void)setBackgroundImage:(id)a3
{
  UIImageView *backgroundImageView;

  backgroundImageView = self->_backgroundImageView;
  if (a3)
  {
    if (!backgroundImageView)
    {
      backgroundImageView = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
      self->_backgroundImageView = backgroundImageView;
    }
    -[UIImageView setImage:](backgroundImageView, "setImage:", a3);
    -[SULockoutView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundImageView, 0);
    -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](backgroundImageView, "removeFromSuperview");

    self->_backgroundImageView = 0;
  }
}

- (void)setBody:(id)a3
{
  objc_msgSend(-[SULockoutView _bodyLabel](self, "_bodyLabel"), "setText:", a3);
  -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGlowImage:(id)a3
{
  UIImageView *glowImageView;
  UIImageView *v6;
  UIImageView *v7;

  glowImageView = self->_glowImageView;
  if (a3)
  {
    if (!glowImageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
      self->_glowImageView = v6;
      -[UIImageView setContentMode:](v6, "setContentMode:", 4);
      glowImageView = self->_glowImageView;
    }
    -[UIImageView setImage:](glowImageView, "setImage:", a3);
    v7 = self->_glowImageView;
    if (self->_backgroundImageView)
      -[SULockoutView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
    else
      -[SULockoutView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7);
    -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](glowImageView, "removeFromSuperview");

    self->_glowImageView = 0;
  }
}

- (void)setImage:(id)a3
{
  id v5;

  v5 = -[SULockoutView _imageView](self, "_imageView");
  objc_msgSend(v5, "setImage:", a3);
  objc_msgSend(v5, "sizeToFit");
  -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLayoutPreset:(int64_t)a3
{
  if (self->_layoutPreset != a3)
  {
    self->_layoutPreset = a3;
    -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3
{
  objc_msgSend(-[SULockoutView _titleLabel](self, "_titleLabel"), "setText:", a3);
  -[SULockoutView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return (NSString *)objc_msgSend(-[SULockoutView _titleLabel](self, "_titleLabel"), "text");
}

- (void)layoutSubviews
{
  if (!-[SULockoutView layoutPreset](self, "layoutPreset"))
    -[SULockoutView _layoutForSlowNetwork](self, "_layoutForSlowNetwork");
}

- (void)_layoutForSlowNetwork
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  UIImageView *backgroundImageView;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  float v32;
  CGFloat v33;
  CGFloat v34;
  float v35;
  double v36;
  UIImageView *glowImageView;
  double v38;
  float v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;

  -[SULockoutView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[SULockoutView _imageView](self, "_imageView");
  v12 = -[SULockoutView _bodyLabel](self, "_bodyLabel");
  v13 = -[SULockoutView _titleLabel](self, "_titleLabel");
  backgroundImageView = self->_backgroundImageView;
  if (backgroundImageView)
    -[UIImageView setFrame:](backgroundImageView, "setFrame:", v4, v6, v8, v10);
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  if (v15 == 1)
    v16 = 10.0;
  else
    v16 = 5.0;
  v17 = 20.0;
  if (v15 != 1)
    v17 = 10.0;
  v47 = v17;
  v48 = v16;
  v18 = -8.0;
  if (v15 == 1)
    v18 = 0.0;
  v43 = v18;
  objc_msgSend(v12, "frame");
  objc_msgSend(v11, "frame");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "sizeThatFits:", v8 + -20.0, v10);
  v45 = v23;
  v46 = v24;
  v25 = v24;
  objc_msgSend(v13, "sizeThatFits:", v8 + -20.0, v10);
  v27 = v26;
  v29 = v28;
  *(float *)&v26 = (v10 - (v25 + v48 + v47 + v22 + v28)) * 0.5;
  v30 = v43 + floorf(*(float *)&v26);
  *(float *)&v26 = (v8 - v20) * 0.5;
  v31 = floorf(*(float *)&v26);
  objc_msgSend(v11, "setFrame:", v31, v30, v20, v22);
  v32 = (v8 - v27) * 0.5;
  v33 = floorf(v32);
  v49.origin.x = v31;
  v42 = v22;
  v44 = v30;
  v49.origin.y = v30;
  v49.size.width = v20;
  v49.size.height = v22;
  v34 = v47 + CGRectGetMaxY(v49);
  objc_msgSend(v13, "setFrame:", v33, v34, v27, v29);
  v35 = (v8 - v45) * 0.5;
  v36 = floorf(v35);
  v50.origin.x = v33;
  v50.origin.y = v34;
  v50.size.width = v27;
  v50.size.height = v29;
  objc_msgSend(v12, "setFrame:", v36, v48 + CGRectGetMaxY(v50), v45, v46);
  glowImageView = self->_glowImageView;
  if (glowImageView)
  {
    -[UIImageView frame](glowImageView, "frame");
    v39 = (v38 - v20) * 0.5;
    v41 = (v40 - v42) * 0.5;
    -[UIImageView setFrame:](self->_glowImageView, "setFrame:", v31 - floorf(v39), v44 - floorf(v41));
  }
}

- (id)_bodyLabel
{
  id result;
  uint64_t v4;
  double v5;

  result = self->_bodyLabel;
  if (!result)
  {
    self->_bodyLabel = (UILabel *)-[SULockoutView _newLabel](self, "_newLabel");
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    v5 = 12.0;
    if (v4 == 1)
      v5 = 24.0;
    -[UILabel setFont:](self->_bodyLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", v5));
    -[SULockoutView addSubview:](self, "addSubview:", self->_bodyLabel);
    return self->_bodyLabel;
  }
  return result;
}

- (id)_imageView
{
  id result;
  UIImageView *v4;

  result = self->_imageView;
  if (!result)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    self->_imageView = v4;
    -[SULockoutView addSubview:](self, "addSubview:", v4);
    return self->_imageView;
  }
  return result;
}

- (id)_newLabel
{
  SUInnerShadowLabel *v2;

  v2 = objc_alloc_init(SUInnerShadowLabel);
  -[SUInnerShadowLabel setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUInnerShadowLabel setNumberOfLines:](v2, "setNumberOfLines:", 0);
  -[SUInnerShadowLabel setTextAlignment:](v2, "setTextAlignment:", 1);
  -[SUInnerShadowLabel setTextColor:](v2, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.666666667, 1.0));
  return v2;
}

- (id)_titleLabel
{
  id result;
  uint64_t v4;
  double v5;

  result = self->_titleLabel;
  if (!result)
  {
    self->_titleLabel = (UILabel *)-[SULockoutView _newLabel](self, "_newLabel");
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    v5 = 32.0;
    if (v4 != 1)
      v5 = 16.0;
    -[UILabel setFont:](self->_titleLabel, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v5));
    -[SULockoutView addSubview:](self, "addSubview:", self->_titleLabel);
    return self->_titleLabel;
  }
  return result;
}

- (int64_t)layoutPreset
{
  return self->_layoutPreset;
}

@end
