@implementation PUTilingViewUpdateItem

- (PUTilingViewUpdateItem)initWithAction:(int64_t)a3 indexPathBeforeUpdate:(id)a4 indexPathAfterUpdate:(id)a5 dataSource:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  PUTilingViewUpdateItem *v16;
  PUTilingViewUpdateItem *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a3 == 1)
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPathBeforeUpdate == nil"));

      if (v13)
        goto LABEL_10;
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPathAfterUpdate != nil"));
LABEL_18:

      if (v14)
        goto LABEL_11;
      goto LABEL_19;
    }
LABEL_9:
    if (v13)
      goto LABEL_10;
    goto LABEL_17;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action != PUTilingViewUpdateActionUndefined"));

    if (v12)
      goto LABEL_4;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPathBeforeUpdate != nil"));

    goto LABEL_4;
  }
  if (!v12)
    goto LABEL_15;
LABEL_4:
  if (a3 != 4 && a3 != 2)
    goto LABEL_9;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPathAfterUpdate == nil"));
    goto LABEL_18;
  }
LABEL_10:
  if (v14)
    goto LABEL_11;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource != nil"));

LABEL_11:
  v23.receiver = self;
  v23.super_class = (Class)PUTilingViewUpdateItem;
  v16 = -[PUTilingViewUpdateItem init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_action = a3;
    objc_storeStrong((id *)&v16->_indexPathBeforeUpdate, a4);
    objc_storeStrong((id *)&v17->_indexPathAfterUpdate, a5);
    objc_storeStrong((id *)&v17->_dataSource, a6);
  }

  return v17;
}

- (id)transformedIndexPath:(id)a3 withDataSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  -[PUTilingViewUpdateItem dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  v11 = v7;
  if (v10)
  {
    v11 = v7;
    switch(-[PUTilingViewUpdateItem action](self, "action"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingViewUpdateItem.m"), 48, CFSTR("undefined action"));
        v11 = v7;
        goto LABEL_9;
      case 1:
        -[PUTilingViewUpdateItem indexPathAfterUpdate](self, "indexPathAfterUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pu_indexPathAfterInsertingItemAtIndexPath:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2:
        -[PUTilingViewUpdateItem indexPathBeforeUpdate](self, "indexPathBeforeUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pu_indexPathAfterDeletingItemAtIndexPath:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 3:
        -[PUTilingViewUpdateItem indexPathBeforeUpdate](self, "indexPathBeforeUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUTilingViewUpdateItem indexPathAfterUpdate](self, "indexPathAfterUpdate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pu_indexPathAfterMovingItemFromIndexPath:toIndexPath:", v12, v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      case 4:
        -[PUTilingViewUpdateItem indexPathBeforeUpdate](self, "indexPathBeforeUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pu_indexPathAfterReloadingItemAtIndexPath:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v11 = (void *)v13;

LABEL_9:
        break;
      default:
        break;
    }
  }

  return v11;
}

- (int64_t)action
{
  return self->_action;
}

- (NSIndexPath)indexPathBeforeUpdate
{
  return self->_indexPathBeforeUpdate;
}

- (NSIndexPath)indexPathAfterUpdate
{
  return self->_indexPathAfterUpdate;
}

- (PUTilingDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPathAfterUpdate, 0);
  objc_storeStrong((id *)&self->_indexPathBeforeUpdate, 0);
}

@end
