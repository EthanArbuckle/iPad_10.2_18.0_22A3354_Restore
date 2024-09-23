@implementation PBFGalleryEditingSceneViewController

- (PBFGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (void)setGalleryOptions:(id)a3
{
  objc_storeStrong((id *)&self->_galleryOptions, a3);
}

- (PRPosterDescriptorGalleryOptions)descriptorGalleryOptions
{
  return self->_descriptorGalleryOptions;
}

- (void)setDescriptorGalleryOptions:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorGalleryOptions, a3);
}

- (NSString)galleryPreviewUniqueIdentifier
{
  return self->_galleryPreviewUniqueIdentifier;
}

- (void)setGalleryPreviewUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1672);
}

- (UIView)galleryPreviewView
{
  return self->_galleryPreviewView;
}

- (void)setGalleryPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_galleryPreviewView, a3);
}

- (CGRect)galleryPreviewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_galleryPreviewFrame.origin.x;
  y = self->_galleryPreviewFrame.origin.y;
  width = self->_galleryPreviewFrame.size.width;
  height = self->_galleryPreviewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGalleryPreviewFrame:(CGRect)a3
{
  self->_galleryPreviewFrame = a3;
}

- (double)galleryPreviewCornerRadius
{
  return self->_galleryPreviewCornerRadius;
}

- (void)setGalleryPreviewCornerRadius:(double)a3
{
  self->_galleryPreviewCornerRadius = a3;
}

- (NSString)galleryPreviewType
{
  return self->_galleryPreviewType;
}

- (void)setGalleryPreviewType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1696);
}

- (unint64_t)galleryPresentationStyle
{
  return self->_galleryPresentationStyle;
}

- (void)setGalleryPresentationStyle:(unint64_t)a3
{
  self->_galleryPresentationStyle = a3;
}

- (UIView)galleryPreviewComplicationsView
{
  return self->_galleryPreviewComplicationsView;
}

- (void)setGalleryPreviewComplicationsView:(id)a3
{
  objc_storeStrong((id *)&self->_galleryPreviewComplicationsView, a3);
}

- (int64_t)galleryDismissalAction
{
  return self->_galleryDismissalAction;
}

- (void)setGalleryDismissalAction:(int64_t)a3
{
  self->_galleryDismissalAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryPreviewComplicationsView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewType, 0);
  objc_storeStrong((id *)&self->_galleryPreviewView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorGalleryOptions, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
}

@end
