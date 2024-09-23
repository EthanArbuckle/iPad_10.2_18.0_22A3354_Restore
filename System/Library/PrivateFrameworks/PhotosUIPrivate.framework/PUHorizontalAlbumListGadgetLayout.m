@implementation PUHorizontalAlbumListGadgetLayout

- (PUHorizontalAlbumListGadgetLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUHorizontalAlbumListGadgetLayout.m"), 32, CFSTR("%s is not available as initializer"), "-[PUHorizontalAlbumListGadgetLayout init]");

  abort();
}

- (PUHorizontalAlbumListGadgetLayout)initWithHorizontalLayoutDelegate:(id)a3 showsHorizontalScrollIndicator:(BOOL)a4
{
  id v6;
  PUHorizontalAlbumListGadgetLayout *v7;
  PUHorizontalAlbumListGadgetLayout *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUHorizontalAlbumListGadgetLayout;
  v7 = -[UICollectionViewFlowLayout init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_horizontalLayoutDelegate, v6);
    v8->_showsHorizontalScrollIndicator = a4;
  }

  return v8;
}

- (CGSize)albumCellSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PUHorizontalAlbumListGadgetLayout horizontalLayoutDelegate](self, "horizontalLayoutDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumListCellContentViewHelperForLayout:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "albumCellSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (unint64_t)_numberOfAlbums
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXGadgetCollectionViewLayout delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "numberOfSections"))
    v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
  else
    v4 = 0;

  return v4;
}

- (double)_horizontalScrollIndicatorSpacing
{
  _BOOL4 v2;
  double result;

  v2 = -[PUHorizontalAlbumListGadgetLayout showsHorizontalScrollIndicator](self, "showsHorizontalScrollIndicator");
  result = 0.0;
  if (v2)
    return 23.0;
  return result;
}

- (PUHorizontalAlbumListGadgetLayoutDelegate)horizontalLayoutDelegate
{
  return (PUHorizontalAlbumListGadgetLayoutDelegate *)objc_loadWeakRetained((id *)&self->_horizontalLayoutDelegate);
}

- (void)setHorizontalLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_horizontalLayoutDelegate, a3);
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_horizontalLayoutDelegate);
}

@end
