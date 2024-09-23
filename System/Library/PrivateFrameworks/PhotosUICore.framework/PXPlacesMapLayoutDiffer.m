@implementation PXPlacesMapLayoutDiffer

- (PXPlacesMapLayoutDiffer)initWithSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4
{
  id v7;
  id v8;
  PXPlacesMapLayoutDiffer *v9;
  PXPlacesMapLayoutDiffer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPlacesMapLayoutDiffer;
  v9 = -[PXPlacesMapLayoutDiffer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLayoutResult, a3);
    objc_storeStrong((id *)&v10->_targetLayoutResult, a4);
  }

  return v10;
}

- (id)computeChanges
{
  NSMutableArray *changes;
  NSMutableArray *v4;
  NSMutableArray *v5;

  changes = self->_changes;
  if (!changes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changes;
    self->_changes = v4;

    -[PXPlacesMapLayoutDiffer _computeChanges](self, "_computeChanges");
    changes = self->_changes;
  }
  return changes;
}

- (void)_computeChanges
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayoutDiffer.m"), 75, CFSTR("Cannot use PXPlacesMapLayoutDiffer directly. Need to use subclass!"));

}

- (void)_addTargetLayoutItem:(id)a3
{
  NSMutableArray *changes;
  PXPlacesMapLayoutChange *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayoutDiffer.m"), 80, CFSTR("target layout item cannot be nil"));

  }
  changes = self->_changes;
  v6 = -[PXPlacesMapLayoutChange initWithSourceLayoutItem:targetLayoutItem:type:]([PXPlacesMapLayoutChange alloc], "initWithSourceLayoutItem:targetLayoutItem:type:", 0, v8, 0);
  -[NSMutableArray addObject:](changes, "addObject:", v6);

}

- (void)_removeSourceLayoutItem:(id)a3
{
  NSMutableArray *changes;
  PXPlacesMapLayoutChange *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayoutDiffer.m"), 86, CFSTR("source layout item cannot be nil"));

  }
  changes = self->_changes;
  v6 = -[PXPlacesMapLayoutChange initWithSourceLayoutItem:targetLayoutItem:type:]([PXPlacesMapLayoutChange alloc], "initWithSourceLayoutItem:targetLayoutItem:type:", v8, 0, 1);
  -[NSMutableArray addObject:](changes, "addObject:", v6);

}

- (void)_relateSourceLayoutItem:(id)a3 withTargetLayoutItem:(id)a4
{
  id v7;
  NSMutableArray *changes;
  PXPlacesMapLayoutChange *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayoutDiffer.m"), 92, CFSTR("source layout item cannot be nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayoutDiffer.m"), 93, CFSTR("target layout item cannot be nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  changes = self->_changes;
  v9 = -[PXPlacesMapLayoutChange initWithSourceLayoutItem:targetLayoutItem:type:]([PXPlacesMapLayoutChange alloc], "initWithSourceLayoutItem:targetLayoutItem:type:", v12, v7, 2);
  -[NSMutableArray addObject:](changes, "addObject:", v9);

}

- (PXPlacesMapLayoutResult)sourceLayoutResult
{
  return self->_sourceLayoutResult;
}

- (PXPlacesMapLayoutResult)targetLayoutResult
{
  return self->_targetLayoutResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLayoutResult, 0);
  objc_storeStrong((id *)&self->_sourceLayoutResult, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
