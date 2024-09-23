@implementation THPageThumbnailViewInTransition

- (THPageThumbnailView)thumbnailView
{
  return (THPageThumbnailView *)objc_loadWeakRetained((id *)&self->_thumbnailView);
}

- (void)setThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailView, a3);
}

- (CGRect)originalThumbnailFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalThumbnailFrame.origin.x;
  y = self->_originalThumbnailFrame.origin.y;
  width = self->_originalThumbnailFrame.size.width;
  height = self->_originalThumbnailFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalThumbnailFrame:(CGRect)a3
{
  self->_originalThumbnailFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailView);
}

@end
