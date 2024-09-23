@implementation SFInfoFetchRequest

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (id)infoResponseHandler
{
  return self->_infoResponseHandler;
}

- (void)setInfoResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_infoResponseHandler, 0);
}

@end
