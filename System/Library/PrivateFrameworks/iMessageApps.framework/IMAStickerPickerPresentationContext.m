@implementation IMAStickerPickerPresentationContext

- (UIViewController)stickerPickerContainer
{
  return self->_stickerPickerContainer;
}

- (void)setStickerPickerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPickerContainer, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (IMSticker)stickerForDeferredRePresentation
{
  return self->_stickerForDeferredRePresentation;
}

- (void)setStickerForDeferredRePresentation:(id)a3
{
  objc_storeStrong((id *)&self->_stickerForDeferredRePresentation, a3);
}

- (BOOL)deferredPresentation
{
  return self->_deferredPresentation;
}

- (void)setDeferredPresentation:(BOOL)a3
{
  self->_deferredPresentation = a3;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerForDeferredRePresentation, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_stickerPickerContainer, 0);
}

@end
