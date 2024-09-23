@implementation SXIssueCoverPresentationOptions

- (SXIssueCoverPresentationOptions)initWithSize:(CGSize)a3 videoPlaybackEnabled:(BOOL)a4 parentBackgroundColor:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  SXIssueCoverPresentationOptions *v10;
  SXIssueCoverPresentationOptions *v11;
  UIColor *v12;
  UIColor *parentBackgroundColor;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXIssueCoverPresentationOptions;
  v10 = -[SXIssueCoverPresentationOptions init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_size.width = width;
    v10->_size.height = height;
    v10->_videoPlaybackEnabled = a4;
    if (v9)
    {
      v12 = (UIColor *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    parentBackgroundColor = v11->_parentBackgroundColor;
    v11->_parentBackgroundColor = v12;

  }
  return v11;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)videoPlaybackEnabled
{
  return self->_videoPlaybackEnabled;
}

- (UIColor)parentBackgroundColor
{
  return self->_parentBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBackgroundColor, 0);
}

@end
