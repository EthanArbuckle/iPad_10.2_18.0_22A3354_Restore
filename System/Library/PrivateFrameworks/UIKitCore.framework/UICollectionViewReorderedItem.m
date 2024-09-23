@implementation UICollectionViewReorderedItem

- (UICollectionViewReorderedItem)initWithCell:(id)a3 indexPath:(id)a4
{
  id v7;
  UICollectionViewReorderedItem *v8;
  UICollectionViewReorderedItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewReorderedItem;
  v8 = -[UICollectionViewReorderedItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cell, a3);
    objc_storeStrong((id *)&v9->_originalIndexPath, a4);
    objc_storeStrong((id *)&v9->_lastCommittedIndexPath, a4);
    objc_storeStrong((id *)&v9->_targetIndexPath, a4);
  }

  return v9;
}

- (id)expectedCellIndexPath
{
  if (-[UICollectionViewReorderedItem isUncommitted](self, "isUncommitted"))
    -[UICollectionViewReorderedItem lastCommittedIndexPath](self, "lastCommittedIndexPath");
  else
    -[UICollectionViewReorderedItem targetIndexPath](self, "targetIndexPath");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTargetIndexPath:(id)a3
{
  id v4;
  NSIndexPath *targetIndexPath;
  NSIndexPath *v6;
  NSIndexPath *v7;
  NSIndexPath *v8;
  char v9;
  NSIndexPath *v10;

  v4 = a3;
  targetIndexPath = self->_targetIndexPath;
  v6 = (NSIndexPath *)v4;
  v7 = targetIndexPath;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      v9 = -[NSIndexPath isEqual:](v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    self->_isUncommitted = 1;
  }
LABEL_9:
  v10 = self->_targetIndexPath;
  self->_targetIndexPath = v6;

}

- (void)commitTargetIndexPath
{
  NSIndexPath *v3;
  NSIndexPath *lastCommittedIndexPath;

  -[UICollectionViewReorderedItem targetIndexPath](self, "targetIndexPath");
  v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  lastCommittedIndexPath = self->_lastCommittedIndexPath;
  self->_lastCommittedIndexPath = v3;

  self->_isUncommitted = 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UICollectionViewCell *cell;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cell = self->_cell;
  -[NSIndexPath _ui_shortDescription](self->_originalIndexPath, "_ui_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexPath _ui_shortDescription](self->_targetIndexPath, "_ui_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexPath _ui_shortDescription](self->_lastCommittedIndexPath, "_ui_shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUncommitted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: cell== %p; %@ -> %@; lastCommittedIndexPath: %@; isUncomitted: %@>"),
    v5,
    self,
    cell,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isNOOP
{
  return -[NSIndexPath isEqual:](self->_originalIndexPath, "isEqual:", self->_targetIndexPath);
}

- (UICollectionViewCell)cell
{
  return self->_cell;
}

- (NSIndexPath)originalIndexPath
{
  return self->_originalIndexPath;
}

- (void)setOriginalIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_originalIndexPath, a3);
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (NSIndexPath)lastCommittedIndexPath
{
  return self->_lastCommittedIndexPath;
}

- (BOOL)isUncommitted
{
  return self->_isUncommitted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCommittedIndexPath, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_storeStrong((id *)&self->_originalIndexPath, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
