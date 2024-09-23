@implementation _UIContextMenuGradientMaskingConfiguration

- (UIEdgeInsets)gradientMaskEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientMaskEdgeInsets.top;
  left = self->_gradientMaskEdgeInsets.left;
  bottom = self->_gradientMaskEdgeInsets.bottom;
  right = self->_gradientMaskEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientMaskEdgeInsets:(UIEdgeInsets)a3
{
  self->_gradientMaskEdgeInsets = a3;
}

- (UIEdgeInsets)gradientMaskLengths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientMaskLengths.top;
  left = self->_gradientMaskLengths.left;
  bottom = self->_gradientMaskLengths.bottom;
  right = self->_gradientMaskLengths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientMaskLengths:(UIEdgeInsets)a3
{
  self->_gradientMaskLengths = a3;
}

- (BOOL)embedBackgroundForCompositing
{
  return self->_embedBackgroundForCompositing;
}

- (void)setEmbedBackgroundForCompositing:(BOOL)a3
{
  self->_embedBackgroundForCompositing = a3;
}

- (BOOL)backgroundMasksCorners
{
  return self->_backgroundMasksCorners;
}

- (void)setBackgroundMasksCorners:(BOOL)a3
{
  self->_backgroundMasksCorners = a3;
}

- (id)platterHairlineColorProvider
{
  return self->_platterHairlineColorProvider;
}

- (void)setPlatterHairlineColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)spacerHeaderFooterHeight
{
  return self->_spacerHeaderFooterHeight;
}

- (void)setSpacerHeaderFooterHeight:(double)a3
{
  self->_spacerHeaderFooterHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_platterHairlineColorProvider, 0);
}

@end
