@implementation VUIDocumentUIConfigurationFormSheet

- (CGSize)preferredSize
{
  NSArray *detents;
  double width;
  CGSize result;

  detents = self->_detents;
  width = self->_preferredSize.width;
  result.height = width;
  result.width = *(double *)&detents;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  *(CGSize *)&self->_detents = a3;
}

- (BOOL)isTapDismissable
{
  return *(&self->super._presentOnPresentingVC + 1);
}

- (void)setTapDismissable:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 1) = a3;
}

- (BOOL)prefersGrabberVisible
{
  return *(&self->super._presentOnPresentingVC + 2);
}

- (void)setPrefersGrabberVisible:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 2) = a3;
}

- (NSArray)detents
{
  return *(NSArray **)&self->_tapDismissable;
}

- (void)setDetents:(id)a3
{
  objc_storeStrong((id *)&self->_tapDismissable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapDismissable, 0);
}

@end
