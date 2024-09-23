@implementation PXGTitleSubtitleView

- (void)setUserData:(id)a3
{
  id v4;
  PXGTitleSubtitleViewConfiguration *v5;
  PXGTitleSubtitleViewConfiguration *userData;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (PXGTitleSubtitleViewConfiguration *)objc_msgSend(v4, "copy");
  userData = self->_userData;
  self->_userData = v5;

  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleUILabel setTitleText:](self, "setTitleText:", v7);

  objc_msgSend(v4, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleUILabel setSubtitleText:](self, "setSubtitleText:", v8);

  objc_msgSend(v4, "spec");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXTitleSubtitleUILabel setSpec:](self, "setSpec:", v9);
}

- (void)prepareForReuse
{
  -[PXGTitleSubtitleView setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGTitleSubtitleViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
