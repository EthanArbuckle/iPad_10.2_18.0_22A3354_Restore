@implementation StockGraphImageSet

- (UIImage)lineGraphImage
{
  return self->_lineGraphImage;
}

- (void)setLineGraphImage:(id)a3
{
  objc_storeStrong((id *)&self->_lineGraphImage, a3);
}

- (UIImage)highlightOverlayImage
{
  return self->_highlightOverlayImage;
}

- (void)setHighlightOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightOverlayImage, a3);
}

- (UIImage)volumeGraphImage
{
  return self->_volumeGraphImage;
}

- (void)setVolumeGraphImage:(id)a3
{
  objc_storeStrong((id *)&self->_volumeGraphImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeGraphImage, 0);
  objc_storeStrong((id *)&self->_highlightOverlayImage, 0);
  objc_storeStrong((id *)&self->_lineGraphImage, 0);
}

@end
