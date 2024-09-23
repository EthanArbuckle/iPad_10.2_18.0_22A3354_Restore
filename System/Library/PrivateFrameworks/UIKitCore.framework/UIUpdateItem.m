@implementation UIUpdateItem

- (int64_t)compareIndexPaths:(id)a3
{
  NSIndexPath *indexPath;

  indexPath = self->_indexPath;
  if (a3)
    a3 = (id)*((_QWORD *)a3 + 3);
  return -[NSIndexPath compare:](indexPath, "compare:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_collectionViewUpdateItem, 0);
}

- (id)initWithAction:(void *)a3 forIndexPath:(void *)a4 animation:
{
  id v8;
  void *v9;
  id *v10;
  objc_super v12;

  v8 = a3;
  v9 = v8;
  if (a1)
  {
    _UIAssertValidUpdateIndexPath(v8);
    v12.receiver = a1;
    v12.super_class = (Class)UIUpdateItem;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      *((_DWORD *)v10 + 5) = a2;
      objc_storeStrong(v10 + 3, a3);
      a1[4] = a4;
      *((_BYTE *)a1 + 16) = (_BYTE)a1[2] & 0xFE | (objc_msgSend(v9, "row") == 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  return a1;
}

- (int64_t)inverseCompareIndexPaths:(id)a3
{
  void *v3;

  if (a3)
    v3 = (void *)*((_QWORD *)a3 + 3);
  else
    v3 = 0;
  return objc_msgSend(v3, "compare:", self->_indexPath);
}

- (BOOL)isDecomposedFromReload
{
  return 0;
}

- (UICollectionViewUpdateItem)collectionViewUpdateItem
{
  UICollectionViewUpdateItem *collectionViewUpdateItem;
  unsigned int action;
  uint64_t v5;
  UICollectionViewUpdateItem *v6;
  NSIndexPath *v7;
  UICollectionViewUpdateItem *v8;
  UICollectionViewUpdateItem *v9;

  collectionViewUpdateItem = self->_collectionViewUpdateItem;
  if (!collectionViewUpdateItem)
  {
    action = self->_action;
    if (action >= 4)
      v5 = 4;
    else
      v5 = action;
    v6 = [UICollectionViewUpdateItem alloc];
    v7 = self->_indexPath;
    v8 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:](v6, "initWithAction:forIndexPath:", v5, v7);
    v9 = self->_collectionViewUpdateItem;
    self->_collectionViewUpdateItem = v8;

    collectionViewUpdateItem = self->_collectionViewUpdateItem;
  }
  return collectionViewUpdateItem;
}

- (id)_moveDestinationDescription
{
  return &stru_1E16EDF20;
}

- (id)description
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v8;

  if (self && (*(_BYTE *)&self->_updateItemFlags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SEC:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  switch(self->_action)
  {
    case 0:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("INS(%@)"), v5, v8);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_indexPath, "_ui_shortDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("INS%@"), v5, v8);
      }
      goto LABEL_19;
    case 1:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("DEL(%@)"), v5, v8);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_indexPath, "_ui_shortDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("DEL%@"), v5, v8);
      }
      goto LABEL_19;
    case 2:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@(%@)"), CFSTR("REL"), v5);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_indexPath, "_ui_shortDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), CFSTR("REL"), v5);
      }
      goto LABEL_19;
    case 3:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIUpdateItem _moveDestinationDescription](self, "_moveDestinationDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("MOV(%@)%@"), v5, v6);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_indexPath, "_ui_shortDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIUpdateItem _moveDestinationDescription](self, "_moveDestinationDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("MOV%@%@"), v5, v6);
      }

LABEL_19:
      break;
    default:
      return v3;
  }
  return v3;
}

- (int64_t)compareIndexPathsForMoves:(id)a3
{
  _DWORD *v5;
  int has_internal_diagnostics;
  BOOL v7;
  char v8;
  int v9;
  int v10;
  int64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v5)
    v7 = self->_action == 3;
  else
    v7 = 0;
  v8 = !v7;
  if (has_internal_diagnostics)
  {
    if ((v8 & 1) == 0 && v5[5] == 3)
      goto LABEL_10;
    __UIFaultDebugAssertLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v15;
    _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "%@ should only be used to compare move updates", (uint8_t *)&v17, 0xCu);
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  if ((v8 & 1) == 0 && v5[5] == 3)
  {
LABEL_10:
    v9 = *(_BYTE *)&self->_updateItemFlags & 1;
    goto LABEL_11;
  }
  v12 = compareIndexPathsForMoves____s_category;
  if (!compareIndexPathsForMoves____s_category)
  {
    v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&compareIndexPathsForMoves____s_category);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@ should only be used to compare move updates", (uint8_t *)&v17, 0xCu);
    goto LABEL_18;
  }
LABEL_20:
  v9 = *(_BYTE *)&self->_updateItemFlags & 1;
  if (!v5)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_updateItemFlags & 1) == 0)
      goto LABEL_22;
    goto LABEL_12;
  }
LABEL_11:
  v10 = v5[4] & 1;
  if (!v9)
    goto LABEL_22;
LABEL_12:
  if (!v10)
  {
    v11 = -1;
    goto LABEL_25;
  }
LABEL_22:
  if ((v9 | v10 ^ 1) == 1)
    v11 = -[UIUpdateItem compareIndexPaths:](self, "compareIndexPaths:", v5);
  else
    v11 = 1;
LABEL_25:

  return v11;
}

@end
