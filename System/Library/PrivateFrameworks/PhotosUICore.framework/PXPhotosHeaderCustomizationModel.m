@implementation PXPhotosHeaderCustomizationModel

- (PXPhotosHeaderCustomizationModel)init
{
  PXPhotosHeaderCustomizationModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosHeaderCustomizationModel;
  result = -[PXPhotosHeaderCustomizationModel init](&v3, sel_init);
  if (result)
  {
    result->_alpha = 1.0;
    result->_titleTextStyle = 1;
    result->_subtitleTextStyle = 8;
    result->_shouldUseTextStyles = 0;
  }
  return result;
}

- (void)setVerticalVisibilityOffset:(double)a3
{
  if (self->_verticalVisibilityOffset != a3)
  {
    self->_verticalVisibilityOffset = a3;
    -[PXPhotosHeaderCustomizationModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setVerticalFloatingOffset:(double)a3
{
  if (self->_verticalFloatingOffset != a3)
  {
    self->_verticalFloatingOffset = a3;
    -[PXPhotosHeaderCustomizationModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[PXPhotosHeaderCustomizationModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setShouldUseTextStyles:(BOOL)a3
{
  if (self->_shouldUseTextStyles != a3)
  {
    self->_shouldUseTextStyles = a3;
    -[PXPhotosHeaderCustomizationModel signalChange:](self, "signalChange:", 8);
  }
}

- (int64_t)titleTextStyle
{
  return self->_titleTextStyle;
}

- (int64_t)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (BOOL)shouldUseTextStyles
{
  return self->_shouldUseTextStyles;
}

- (double)verticalVisibilityOffset
{
  return self->_verticalVisibilityOffset;
}

- (double)verticalFloatingOffset
{
  return self->_verticalFloatingOffset;
}

- (double)alpha
{
  return self->_alpha;
}

@end
