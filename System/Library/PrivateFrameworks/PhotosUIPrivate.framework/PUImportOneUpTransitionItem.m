@implementation PUImportOneUpTransitionItem

- (PUImportOneUpTransitionItem)initWithInitialFrame:(CGRect)a3 snapshotImage:(id)a4 importItem:(id)a5 indexPath:(PXSimpleIndexPath *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  PUImportOneUpTransitionItem *v16;
  PUImportOneUpTransitionItem *v17;
  __int128 v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PUImportOneUpTransitionItem;
  v16 = -[PUImportOneUpTransitionItem init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_initialFrame.origin.x = x;
    v16->_initialFrame.origin.y = y;
    v16->_initialFrame.size.width = width;
    v16->_initialFrame.size.height = height;
    objc_storeStrong((id *)&v16->_snapshotImage, a4);
    objc_storeStrong((id *)&v17->_importItem, a5);
    v18 = *(_OWORD *)&a6->item;
    *(_OWORD *)&v17->_indexPath.dataSourceIdentifier = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)&v17->_indexPath.item = v18;
    v17->_initialContentAlpha = 1.0;
    v17->_targetContentAlpha = 1.0;
  }

  return v17;
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImage, a3);
}

- (PXImportItemViewModel)importItem
{
  return self->_importItem;
}

- (PXSimpleIndexPath)indexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (double)initialContentAlpha
{
  return self->_initialContentAlpha;
}

- (void)setInitialContentAlpha:(double)a3
{
  self->_initialContentAlpha = a3;
}

- (UIView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionView, a3);
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (double)targetContentAlpha
{
  return self->_targetContentAlpha;
}

- (void)setTargetContentAlpha:(double)a3
{
  self->_targetContentAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_importItem, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end
