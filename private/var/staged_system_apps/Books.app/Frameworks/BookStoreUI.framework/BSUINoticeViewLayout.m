@implementation BSUINoticeViewLayout

- (BSUINoticeViewLayout)initWithDefaultSize:(CGSize)a3 horizontalMargin:(double)a4 maxWidth:(double)a5 maxHeight:(double)a6 topContentInset:(double)a7 bottomContentInset:(double)a8 imageSize:(CGSize)a9 titleTopMargin:(double)a10 messageTopMargin:(double)a11 confirmLabelTopMargin:(double)a12
{
  CGFloat height;
  CGFloat width;
  BSUINoticeViewLayout *result;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)BSUINoticeViewLayout;
  result = -[BSUINoticeViewLayout init](&v20, "init");
  if (result)
  {
    result->_defaultSize.width = width;
    result->_defaultSize.height = height;
    result->_horizontalMargin = a4;
    result->_maxWidth = a5;
    result->_maxHeight = a6;
    result->_topContentInset = a7;
    result->_imageSize = a9;
    result->_bottomContentInset = a8;
    result->_titleTopMargin = a10;
    result->_messageTopMargin = a11;
    result->_confirmLabelTopMargin = a12;
  }
  return result;
}

+ (id)layoutWithAction:(BOOL)a3
{
  double v3;

  if (a3)
    v3 = 24.0;
  else
    v3 = 20.0;
  return -[BSUINoticeViewLayout initWithDefaultSize:horizontalMargin:maxWidth:maxHeight:topContentInset:bottomContentInset:imageSize:titleTopMargin:messageTopMargin:confirmLabelTopMargin:]([BSUINoticeViewLayout alloc], "initWithDefaultSize:horizontalMargin:maxWidth:maxHeight:topContentInset:bottomContentInset:imageSize:titleTopMargin:messageTopMargin:confirmLabelTopMargin:", 250.0, 250.0, v3, 359.0, 646.0, v3 + 6.0, v3, 0x405B800000000000, 0x405B800000000000, 0x4043800000000000, 0x402A000000000000, 0x403A000000000000);
}

- (CGSize)defaultSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultSize.width;
  height = self->_defaultSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (double)topContentInset
{
  return self->_topContentInset;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
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

- (double)titleTopMargin
{
  return self->_titleTopMargin;
}

- (double)messageTopMargin
{
  return self->_messageTopMargin;
}

- (double)confirmLabelTopMargin
{
  return self->_confirmLabelTopMargin;
}

@end
