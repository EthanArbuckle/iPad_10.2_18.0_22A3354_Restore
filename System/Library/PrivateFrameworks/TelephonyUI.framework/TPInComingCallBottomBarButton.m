@implementation TPInComingCallBottomBarButton

- (TPInComingCallBottomBarButton)initWithFrame:(CGRect)a3
{
  TPInComingCallBottomBarButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TPInComingCallBottomBarButton;
  v3 = -[TPInComingCallBottomBarButton initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v3)
  {
    +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
    -[TPInComingCallBottomBarButton setDiameter:](v3, "setDiameter:");
    -[TPInComingCallBottomBarButton titleLabel](v3, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextAlignment:", 1);

    +[TPUIConfiguration defaultFont](TPUIConfiguration, "defaultFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

    -[TPInComingCallBottomBarButton titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallBottomBarButton setTintColor:](v3, "setTintColor:", v8);

    -[TPInComingCallBottomBarButton titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[TPInComingCallBottomBarButton diameter](v3, "diameter");
    v11 = v10 * 0.5;
    -[TPInComingCallBottomBarButton layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[TPInComingCallBottomBarButton diameter](self, "diameter");
  v4 = v3;
  -[TPInComingCallBottomBarButton diameter](self, "diameter");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v17.receiver = self;
  v17.super_class = (Class)TPInComingCallBottomBarButton;
  -[TPInComingCallBottomBarButton imageRectForContentRect:](&v17, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y);
  v6 = v5;
  v8 = v7;
  x = width * 0.5 - v5 * 0.5;
  y = height * 0.5 - v7 * 0.5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  if (v12 == 1.0)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = v6;
    v18.size.height = v8;
    v19 = CGRectIntegral(v18);
    x = v19.origin.x;
    y = v19.origin.y;
    v6 = v19.size.width;
    v8 = v19.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = v6;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  _QWORD v40[2];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[TPInComingCallBottomBarButton currentTitle](self, "currentTitle", a3.origin.x, a3.origin.y);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[TPInComingCallBottomBarButton currentTitle](self, "currentTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      -[TPInComingCallBottomBarButton titleLabel](self, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredMaxLayoutWidth");
      v16 = v15;
      objc_msgSend(v14, "font");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "defaultFont");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;

      v39 = *MEMORY[0x1E0DC1138];
      v40[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallBottomBarButton currentTitle](self, "currentTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, 3.40282347e38, 3.40282347e38);
      v24 = v23;
      v26 = v25;

      v27 = ceil(v24);
      if (v16 >= v27)
        v8 = v27;
      else
        v8 = v16;
      if (v8 == v16)
      {
        -[TPInComingCallBottomBarButton currentTitle](self, "currentTitle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, v16, 3.40282347e38);
        v30 = v29;

        v31 = ceil(v30);
        if (v31 <= 45.0)
          v9 = v31;
        else
          v9 = 45.0;
      }
      else
      {
        v9 = ceil(v26);
      }
      v32 = width * 0.5 - v8 * 0.5;
      -[TPInComingCallBottomBarButton titleRectYOffset](self, "titleRectYOffset");
      v34 = height + v33;
      if (v8 == v16 && v9 == 45.0)
        objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
      v6 = ceil(v32);
      v7 = ceil(v34);

    }
  }
  v35 = v6;
  v36 = v7;
  v37 = v8;
  v38 = v9;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (double)titleRectYOffset
{
  if (titleRectYOffset_onceToken != -1)
    dispatch_once(&titleRectYOffset_onceToken, &__block_literal_global_6);
  return *(double *)&titleRectYOffset_yOffset;
}

unint64_t __49__TPInComingCallBottomBarButton_titleRectYOffset__block_invoke()
{
  unint64_t result;
  double v1;

  result = +[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing");
  v1 = 8.0;
  if (result == 6)
    v1 = 11.0;
  titleRectYOffset_yOffset = *(_QWORD *)&v1;
  return result;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

@end
