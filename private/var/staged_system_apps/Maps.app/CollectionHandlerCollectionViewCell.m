@implementation CollectionHandlerCollectionViewCell

- (CollectionHandlerCollectionViewCell)initWithFrame:(CGRect)a3
{
  CollectionHandlerCollectionViewCell *v3;
  CollectionView *v4;
  CollectionView *collectionView;
  void *v6;
  id v7;
  CollectionView *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CollectionHandlerCollectionViewCell;
  v3 = -[CollectionHandlerCollectionViewCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[CollectionView initWithCollectionViewSize:]([CollectionView alloc], "initWithCollectionViewSize:", 0);
    collectionView = v3->_collectionView;
    v3->_collectionView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_collectionView);

    v7 = objc_alloc((Class)MUEdgeLayout);
    v8 = v3->_collectionView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandlerCollectionViewCell contentView](v3, "contentView"));
    v10 = objc_msgSend(v7, "initWithItem:container:", v8, v9);

    objc_msgSend(v10, "activate");
  }
  return v3;
}

- (CollectionHandlerInfo)collectionInfo
{
  return -[CollectionView collectionInfo](self->_collectionView, "collectionInfo");
}

- (void)setCollectionInfo:(id)a3
{
  -[CollectionView setCollectionInfo:](self->_collectionView, "setCollectionInfo:", a3);
}

- (unint64_t)collectionViewSize
{
  return -[CollectionView collectionViewSize](self->_collectionView, "collectionViewSize");
}

- (void)setCollectionViewSize:(unint64_t)a3
{
  -[CollectionView setCollectionViewSize:](self->_collectionView, "setCollectionViewSize:", a3);
}

- (BOOL)disabled
{
  return -[CollectionView disabled](self->_collectionView, "disabled");
}

- (void)setDisabled:(BOOL)a3
{
  -[CollectionView setDisabled:](self->_collectionView, "setDisabled:", a3);
}

- (BOOL)showsCheckmark
{
  return -[CollectionView showsCheckmark](self->_collectionView, "showsCheckmark");
}

- (void)setShowCheckmark:(BOOL)a3
{
  -[CollectionView setShowCheckmark:](self->_collectionView, "setShowCheckmark:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
