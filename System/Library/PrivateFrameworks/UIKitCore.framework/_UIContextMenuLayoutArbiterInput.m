@implementation _UIContextMenuLayoutArbiterInput

- (_UIContextMenuLayoutArbiterInput)init
{
  _UIContextMenuLayoutArbiterInput *v2;
  _UIContextMenuLayoutArbiterInput *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuLayoutArbiterInput;
  v2 = -[_UIContextMenuLayoutArbiterInput init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIContextMenuLayoutArbiterInput setPreferredMenuAttachmentPoint:](v2, "setPreferredMenuAttachmentPoint:", 1.79769313e308, 1.79769313e308);
    -[_UIContextMenuLayoutArbiterInput setMaximumMenuHeight:](v3, "setMaximumMenuHeight:", 1.79769313e308);
  }
  return v3;
}

- (BOOL)_hasVisibleMenu
{
  double v3;
  double v4;

  -[_UIContextMenuLayoutArbiterInput preferredMenuSize](self, "preferredMenuSize");
  if (v3 <= 0.00000011920929)
    return 0;
  -[_UIContextMenuLayoutArbiterInput preferredMenuSize](self, "preferredMenuSize");
  return v4 > 0.00000011920929;
}

- (BOOL)shouldUpdateAttachment
{
  return self->_shouldUpdateAttachment;
}

- (void)setShouldUpdateAttachment:(BOOL)a3
{
  self->_shouldUpdateAttachment = a3;
}

- (BOOL)shouldAvoidInputViews
{
  return self->_shouldAvoidInputViews;
}

- (void)setShouldAvoidInputViews:(BOOL)a3
{
  self->_shouldAvoidInputViews = a3;
}

- (BOOL)shouldConcealMenu
{
  return self->_shouldConcealMenu;
}

- (void)setShouldConcealMenu:(BOOL)a3
{
  self->_shouldConcealMenu = a3;
}

- (CGSize)preferredPreviewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredPreviewSize.width;
  height = self->_preferredPreviewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredPreviewSize:(CGSize)a3
{
  self->_preferredPreviewSize = a3;
}

- (CGSize)preferredMenuSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredMenuSize.width;
  height = self->_preferredMenuSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredMenuSize:(CGSize)a3
{
  self->_preferredMenuSize = a3;
}

- (double)maximumMenuHeight
{
  return self->_maximumMenuHeight;
}

- (void)setMaximumMenuHeight:(double)a3
{
  self->_maximumMenuHeight = a3;
}

- (CGPoint)preferredMenuAttachmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_preferredMenuAttachmentPoint.x;
  y = self->_preferredMenuAttachmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreferredMenuAttachmentPoint:(CGPoint)a3
{
  self->_preferredMenuAttachmentPoint = a3;
}

- (UIEdgeInsets)preferredEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredEdgeInsets.top;
  left = self->_preferredEdgeInsets.left;
  bottom = self->_preferredEdgeInsets.bottom;
  right = self->_preferredEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3
{
  self->_preferredEdgeInsets = a3;
}

- (double)preferredContentSpacing
{
  return self->_preferredContentSpacing;
}

- (void)setPreferredContentSpacing:(double)a3
{
  self->_preferredContentSpacing = a3;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)preferredAnchor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(_QWORD *)&self[4].var2;
  return self;
}

- (void)setPreferredAnchor:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_preferredAnchor.gravity = a3->var4;
  *(_OWORD *)&self->_preferredAnchor.attachment = v3;
  *(_OWORD *)&self->_preferredAnchor.attachmentOffset = v4;
}

- (unint64_t)preferredPreviewFittingStrategy
{
  return self->_preferredPreviewFittingStrategy;
}

- (void)setPreferredPreviewFittingStrategy:(unint64_t)a3
{
  self->_preferredPreviewFittingStrategy = a3;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViews, a3);
}

- (id)computePreferredScrollTruncationDetentForHeight
{
  return self->_computePreferredScrollTruncationDetentForHeight;
}

- (void)setComputePreferredScrollTruncationDetentForHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_computePreferredScrollTruncationDetentForHeight, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end
