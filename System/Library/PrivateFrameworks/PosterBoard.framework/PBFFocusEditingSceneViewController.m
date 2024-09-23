@implementation PBFFocusEditingSceneViewController

- (int64_t)galleryDismissalAction
{
  return self->_galleryDismissalAction;
}

- (void)setGalleryDismissalAction:(int64_t)a3
{
  self->_galleryDismissalAction = a3;
}

- (CGRect)posterPreviewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_posterPreviewFrame.origin.x;
  y = self->_posterPreviewFrame.origin.y;
  width = self->_posterPreviewFrame.size.width;
  height = self->_posterPreviewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPosterPreviewFrame:(CGRect)a3
{
  self->_posterPreviewFrame = a3;
}

- (UIView)galleryPreviewView
{
  return self->_galleryPreviewView;
}

- (void)setGalleryPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_galleryPreviewView, a3);
}

- (UIView)posterPreviewComplicationsView
{
  return self->_posterPreviewComplicationsView;
}

- (void)setPosterPreviewComplicationsView:(id)a3
{
  objc_storeStrong((id *)&self->_posterPreviewComplicationsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviewComplicationsView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewView, 0);
}

@end
