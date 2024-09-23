@implementation _UICollectionViewDropItem

- (_UICollectionViewDropItem)initWithDragItem:(id)a3 previewSize:(CGSize)a4 sourceIndexPath:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  _UICollectionViewDropItem *v12;
  _UICollectionViewDropItem *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewDropItem;
  v12 = -[_UICollectionViewDropItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dragItem, a3);
    v13->_previewSize.width = width;
    v13->_previewSize.height = height;
    objc_storeStrong((id *)&v13->_sourceIndexPath, a5);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_previewSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UICVIndexPathDescription(self->_sourceIndexPath);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p previewSize = %@; sourceIndexPath = %@; dragItem = %@>"),
    v5,
    self,
    v6,
    v7,
    self->_dragItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_dragItem, a3);
}

- (CGSize)previewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previewSize.width;
  height = self->_previewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  self->_previewSize = a3;
}

- (NSIndexPath)sourceIndexPath
{
  return self->_sourceIndexPath;
}

- (void)setSourceIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
