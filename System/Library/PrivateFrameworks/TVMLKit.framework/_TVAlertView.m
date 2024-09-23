@implementation _TVAlertView

- (_TVAlertView)initWithFrame:(CGRect)a3
{
  _TVAlertView *v3;
  _TVImageView *v4;
  _TVImageView *imageView;
  _TVImageView *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  UILabel *messageLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_TVAlertView;
  v3 = -[_TVAlertView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_TVImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    v6 = v3->_imageView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[_TVImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[_TVImageView _setContinuousCornerRadius:](v3->_imageView, "_setContinuousCornerRadius:", 5.0);
    -[_TVAlertView addSubview:](v3, "addSubview:", v3->_imageView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[_TVAlertView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v14;

    v16 = v3->_messageLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v3->_messageLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[UILabel setTextAlignment:](v3->_messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_messageLabel, "setNumberOfLines:", 0);
    -[_TVAlertView addSubview:](v3, "addSubview:", v3->_messageLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  UILabel *titleLabel;
  void *v6;
  uint64_t v7;
  UILabel *messageLabel;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)_TVAlertView;
  -[_TVAlertView layoutSubviews](&v19, sel_layoutSubviews);
  if (self->_imageProxy)
  {
    -[_TVAlertView bounds](self, "bounds");
    UIRectCenteredXInRect();
    -[_TVImageView setFrame:](self->_imageView, "setFrame:");
    -[_TVImageView setHidden:](self->_imageView, "setHidden:", 0);
    -[_TVImageView frame](self->_imageView, "frame");
    CGRectGetMaxY(v22);
  }
  else
  {
    -[_TVImageView setHidden:](self->_imageView, "setHidden:", 1);
  }
  -[UILabel text](self->_titleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  titleLabel = self->_titleLabel;
  if (v4)
  {
    -[UILabel tv_heightToFirstBaseline](titleLabel, "tv_heightToFirstBaseline");
    -[UILabel tv_scaledValueForValue:](self->_titleLabel, "tv_scaledValueForValue:", 36.0);
    -[UILabel frame](self->_titleLabel, "frame");
    -[_TVAlertView bounds](self, "bounds");
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
    -[UILabel frame](self->_titleLabel, "frame");
    CGRectGetMaxY(v23);
  }
  else
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
  }
  -[UILabel text](self->_messageLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  messageLabel = self->_messageLabel;
  if (v7)
  {
    -[UILabel tv_heightToFirstBaseline](messageLabel, "tv_heightToFirstBaseline");
    -[UILabel tv_scaledValueForValue:](self->_messageLabel, "tv_scaledValueForValue:", 25.0);
    -[UILabel frame](self->_messageLabel, "frame");
    -[_TVAlertView bounds](self, "bounds");
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_messageLabel, "setFrame:");
    -[UILabel setHidden:](self->_messageLabel, "setHidden:", 0);
    -[UILabel frame](self->_messageLabel, "frame");
    CGRectGetMaxY(v24);
  }
  else
  {
    -[UILabel setHidden:](messageLabel, "setHidden:", 1);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_additionalLabelViews;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v14, "tv_scaledValueForValue:", 25.0, (_QWORD)v15);
        objc_msgSend(v14, "tv_heightToFirstBaseline");
        objc_msgSend(v14, "frame");
        -[_TVAlertView bounds](self, "bounds");
        UIRectCenteredXInRect();
        objc_msgSend(v14, "setFrame:");
        objc_msgSend(v14, "frame");
        CGRectGetMaxY(v25);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v11);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
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
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGSize result;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  width = a3.width;
  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_imageProxy)
    v5 = self->_imageSize.height + 24.0;
  else
    v5 = 0.0;
  if (-[NSString length](self->_title, "length"))
  {
    -[UILabel tv_heightToFirstBaseline](self->_titleLabel, "tv_heightToFirstBaseline");
    v7 = v6;
    -[UILabel tv_scaledValueForValue:](self->_titleLabel, "tv_scaledValueForValue:", 36.0);
    v9 = v8 - v7;
    if (!self->_imageProxy)
      v9 = 24.0;
    v10 = v5 + v9;
    -[UILabel frame](self->_titleLabel, "frame");
    v5 = v10 + CGRectGetHeight(v35);
  }
  if (-[NSString length](self->_message, "length"))
  {
    -[UILabel tv_heightToFirstBaseline](self->_messageLabel, "tv_heightToFirstBaseline");
    v12 = v11;
    -[UILabel tv_scaledValueForValue:](self->_messageLabel, "tv_scaledValueForValue:", 25.0);
    if (self->_imageProxy || self->_titleLabel)
      v14 = v13 - v12;
    else
      v14 = 24.0;
    v15 = v5 + v14;
    -[UILabel frame](self->_messageLabel, "frame");
    v5 = v15 + CGRectGetHeight(v36);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = self->_additionalLabelViews;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v21, "tv_scaledValueForValue:", 25.0, (_QWORD)v28);
        v23 = v22;
        objc_msgSend(v21, "tv_heightToFirstBaseline");
        v25 = v5 + v23 - v24;
        objc_msgSend(v21, "frame");
        v5 = v25 + CGRectGetHeight(v37);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v26 = v5 + 24.0;
  v27 = width;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)setAdditionalLabels:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *additionalLabels;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  NSArray *v17;
  NSArray *additionalLabelViews;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_additionalLabels, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    additionalLabels = self->_additionalLabels;
    self->_additionalLabels = v5;

    -[NSArray makeObjectsPerformSelector:](self->_additionalLabelViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_additionalLabels, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_additionalLabels;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      v12 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v15 = (void *)objc_msgSend((id)objc_opt_class(), "_newLabelWithText:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), (_QWORD)v19);
          objc_msgSend(v15, "sizeThatFits:", 230.0, 0.0);
          objc_msgSend(v15, "setFrame:", v12, v13, 230.0, v16);
          -[_TVAlertView addSubview:](self, "addSubview:", v15);
          objc_msgSend(v7, "addObject:", v15);

          ++v14;
        }
        while (v10 != v14);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v17 = (NSArray *)objc_msgSend(v7, "copy");
    additionalLabelViews = self->_additionalLabelViews;
    self->_additionalLabelViews = v17;

  }
}

- (void)setImageProxy:(id)a3
{
  TVImageProxy *v5;
  TVImageProxy *v6;

  v5 = (TVImageProxy *)a3;
  if (self->_imageProxy != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageProxy, a3);
    -[_TVImageView setImageProxy:](self->_imageView, "setImageProxy:", self->_imageProxy);
    -[_TVAlertView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[_TVAlertView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  double v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    message = self->_message;
    self->_message = v4;

    -[UILabel setText:](self->_messageLabel, "setText:", self->_message);
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", 230.0, 0.0);
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 230.0, v6);
    -[_TVAlertView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  double v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 230.0, 0.0);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 230.0, v6);
    -[_TVAlertView setNeedsLayout](self, "setNeedsLayout");
  }

}

+ (id)_newLabelWithText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDF6B68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  return v5;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)additionalLabels
{
  return self->_additionalLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalLabels, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_additionalLabelViews, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
