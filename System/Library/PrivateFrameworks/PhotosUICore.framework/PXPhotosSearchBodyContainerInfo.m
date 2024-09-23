@implementation PXPhotosSearchBodyContainerInfo

- (void)setContainerSize:(CGSize)a3
{
  void (**containerSizeDidChange)(void);

  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    containerSizeDidChange = (void (**)(void))self->_containerSizeDidChange;
    if (containerSizeDidChange)
      containerSizeDidChange[2]();
  }
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)containerSizeDidChange
{
  return self->_containerSizeDidChange;
}

- (void)setContainerSizeDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_containerSizeDidChange, 0);
}

@end
