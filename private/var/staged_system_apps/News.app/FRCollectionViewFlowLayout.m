@implementation FRCollectionViewFlowLayout

- (FRCollectionViewFlowLayout)init
{
  FRCollectionViewFlowLayout *v2;
  FRCollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRCollectionViewFlowLayout;
  v2 = -[FRCollectionViewFlowLayout init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FRCollectionViewFlowLayout setItemSize:](v2, "setItemSize:", 88.0, 104.0);
    -[FRCollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", 10.0, 28.0, 0.0, 28.0);
  }
  return v3;
}

- (BOOL)dimAndShrinkElements
{
  return self->_dimAndShrinkElements;
}

- (void)setDimAndShrinkElements:(BOOL)a3
{
  self->_dimAndShrinkElements = a3;
}

- (NSIndexPath)indexPathOfDraggingItem
{
  return self->_indexPathOfDraggingItem;
}

- (void)setIndexPathOfDraggingItem:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathOfDraggingItem, a3);
}

- (double)oldWidth
{
  return self->_oldWidth;
}

- (void)setOldWidth:(double)a3
{
  self->_oldWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfDraggingItem, 0);
}

@end
