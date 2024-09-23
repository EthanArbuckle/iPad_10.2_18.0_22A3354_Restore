@implementation UIRowMoveUpdateItem

- (id)initWithOldIndexPath:(void *)a3 newIndexPath:
{
  id v6;
  id v7;

  v6 = a3;
  if (a1)
  {
    v7 = a2;
    _UIAssertValidUpdateIndexPath(v7);
    _UIAssertValidUpdateIndexPath(v6);
    a1 = -[UIUpdateItem initWithAction:forIndexPath:animation:](a1, 3, v7, (void *)5);

    if (a1)
      objc_storeStrong(a1 + 5, a3);
  }

  return a1;
}

- (id)collectionViewUpdateItem
{
  unsigned int action;
  uint64_t v4;
  UICollectionViewUpdateItem *v5;
  NSIndexPath *indexPath;
  NSIndexPath *v7;
  void *v8;
  UICollectionViewUpdateItem *v9;

  if (self)
  {
    action = self->super._action;
    if (action >= 4)
      v4 = 4;
    else
      v4 = action;
    v5 = [UICollectionViewUpdateItem alloc];
    indexPath = self->super._indexPath;
  }
  else
  {
    v5 = [UICollectionViewUpdateItem alloc];
    v4 = 0;
    indexPath = 0;
  }
  v7 = indexPath;
  -[UIRowMoveUpdateItem newIndexPath]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](v5, "initWithInitialIndexPath:finalIndexPath:updateAction:", v7, v8, v4);

  return v9;
}

- (id)newIndexPath
{
  if (a1)
    a1 = (id *)a1[5];
  return a1;
}

- (id)_moveDestinationDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self && (*(_BYTE *)&self->super._updateItemFlags & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSIndexPath section](self->_newIndexPath, "section"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("->(%@)"), v3);
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    -[NSIndexPath _ui_shortDescription](self->_newIndexPath, "_ui_shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("->%@"), v3);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newIndexPath, 0);
}

@end
