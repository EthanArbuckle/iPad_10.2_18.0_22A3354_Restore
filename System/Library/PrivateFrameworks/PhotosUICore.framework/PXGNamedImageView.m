@implementation PXGNamedImageView

- (void)setUserData:(id)a3
{
  PXGNamedImageViewConfiguration *v4;
  PXGNamedImageViewConfiguration *userData;
  void *v6;
  void *v7;
  id v8;

  v4 = (PXGNamedImageViewConfiguration *)objc_msgSend(a3, "copy");
  userData = self->_userData;
  self->_userData = v4;

  -[PXGNamedImageViewConfiguration imageName](self->_userData, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXGNamedImageViewConfiguration bundle](self->_userData, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:bundle:", v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[PXGNamedImageView setImage:](self, "setImage:", v8);
  -[PXGNamedImageView setContentMode:](self, "setContentMode:", -[PXGNamedImageViewConfiguration contentMode](self->_userData, "contentMode"));
  -[PXGNamedImageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);

}

- (void)prepareForReuse
{
  -[PXGNamedImageView setUserData:](self, "setUserData:", 0);
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

- (PXGNamedImageViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
