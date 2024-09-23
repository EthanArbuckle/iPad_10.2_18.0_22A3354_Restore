@implementation UITableViewPlaceholder

- (UITableViewPlaceholder)initWithInsertionIndexPath:(NSIndexPath *)insertionIndexPath reuseIdentifier:(NSString *)reuseIdentifier rowHeight:(CGFloat)rowHeight
{
  NSIndexPath *v10;
  NSString *v11;
  UITableViewPlaceholder *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = insertionIndexPath;
  v11 = reuseIdentifier;
  v17.receiver = self;
  v17.super_class = (Class)UITableViewPlaceholder;
  v12 = -[UITableViewPlaceholder init](&v17, sel_init);
  if (!v12)
    goto LABEL_8;
  if (v10)
  {
    if (v11)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("_UITableViewDropCoordinator.m"), 441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("insertionIndexPath != nil"));

    if (v11)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("_UITableViewDropCoordinator.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

LABEL_4:
  if (rowHeight <= 0.0 && rowHeight != -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("_UITableViewDropCoordinator.m"), 443, CFSTR("Invalid row height provided for the placeholder. Value must be greater than zero or UITableViewAutomaticDimension."));

  }
  objc_storeStrong((id *)&v12->_insertionIndexPath, insertionIndexPath);
  objc_storeStrong((id *)&v12->_reuseIdentifier, reuseIdentifier);
  v12->_rowHeight = rowHeight;
LABEL_8:

  return v12;
}

- (void)cellUpdateHandler
{
  return self->_cellUpdateHandler;
}

- (void)setCellUpdateHandler:(void *)cellUpdateHandler
{
  objc_setProperty_nonatomic_copy(self, a2, cellUpdateHandler, 8);
}

- (NSIndexPath)insertionIndexPath
{
  return self->_insertionIndexPath;
}

- (void)setInsertionIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_insertionIndexPath, a3);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reuseIdentifier, a3);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_insertionIndexPath, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
}

@end
