@implementation PSGCircleSegment

- (PSGCircleSegment)initWithFrame:(CGRect)a3
{
  PSGCircleSegment *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)PSGCircleSegment;
  v3 = -[PSGCircleSegment initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE240]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BEBB620];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB600]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fontDescriptorByAddingAttributes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegment setOpaque:](v3, "setOpaque:", 1);
    -[PSGCircleSegment setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    -[PSGCircleSegment titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

    -[PSGCircleSegment titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 1);

    -[PSGCircleSegment titleLabel](v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v8);

    -[PSGCircleSegment sizeToFit](v3, "sizeToFit");
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegment setTitleColor:forState:](v3, "setTitleColor:forState:", v12, 4);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegment setTitleColor:forState:](v3, "setTitleColor:forState:", v13, 0);

  }
  return v3;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  v20 = CGRectInset(a3, 4.0, 4.0);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  -[PSGCircleSegment imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  -[PSGCircleSegment imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = height - (v11 - v14);

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("contents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 0.15);
    -[PSGCircleSegment currentImage](self, "currentImage");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setFromValue:", objc_msgSend(v7, "CGImage"));

    objc_msgSend(v6, "setToValue:", objc_msgSend(objc_retainAutorelease(v10), "CGImage"));
    objc_msgSend(v6, "setRemovedOnCompletion:", 1);
    objc_msgSend(v6, "setFillMode:", *MEMORY[0x24BDE5978]);
    -[PSGCircleSegment imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v6, CFSTR("animateContents"));

  }
  -[PSGCircleSegment setImage:forState:](self, "setImage:forState:", v10, 0);
  -[PSGCircleSegment sizeToFit](self, "sizeToFit");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PSGCircleSegment imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PSGCircleSegment imageView](self, "imageView", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
