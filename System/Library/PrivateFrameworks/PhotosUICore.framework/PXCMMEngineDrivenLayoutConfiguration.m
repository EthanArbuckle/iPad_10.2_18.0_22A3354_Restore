@implementation PXCMMEngineDrivenLayoutConfiguration

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (double)statusFooterHeight
{
  return self->_statusFooterHeight;
}

- (void)setStatusFooterHeight:(double)a3
{
  self->_statusFooterHeight = a3;
}

@end
