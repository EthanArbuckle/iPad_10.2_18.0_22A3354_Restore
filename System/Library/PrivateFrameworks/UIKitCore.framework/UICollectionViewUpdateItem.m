@implementation UICollectionViewUpdateItem

- (id).cxx_construct
{
  int64x2_t v2;

  v2 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(int64x2_t *)((char *)self + 8) = v2;
  *(int64x2_t *)((char *)self + 24) = v2;
  *(int64x2_t *)((char *)self + 40) = v2;
  return self;
}

- (int64_t)compareIndexPaths:(id)a3
{
  _QWORD *v4;
  int64_t section;
  int64_t v6;
  int64_t v7;
  int64_t item;
  int64_t v9;
  BOOL v10;
  _BOOL8 v11;

  v4 = a3;
  section = self->_indexPairForAction.section;
  if (*(_OWORD *)&self->_indexPairForAction == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = 0;
  }
  else
  {
    v7 = v4[5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v4[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 1;
    }
    else if (section == v7)
    {
      item = self->_indexPairForAction.item;
      v9 = v4[6];
      v10 = item < v9;
      v11 = item > v9;
      if (v10)
        v6 = -1;
      else
        v6 = v11;
    }
    else if (section >= v7)
    {
      v6 = section > v7;
    }
    else
    {
      v6 = -1;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_finalIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
}

- (UICollectionViewUpdateItem)initWithAction:(int64_t)a3 forIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UICollectionViewUpdateItem *v10;

  v6 = a4;
  v7 = v6;
  if (!a3)
  {
    v9 = 0;
    v8 = v6;
    goto LABEL_5;
  }
  v8 = v6;
  v9 = v6;
  if (a3 == 1)
  {
    v8 = 0;
    v9 = v6;
LABEL_5:

  }
  v10 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](self, "initWithInitialIndexPath:finalIndexPath:updateAction:", v9, v8, a3);

  return v10;
}

- (UICollectionViewUpdateItem)initWithInitialIndexPath:(id)a3 finalIndexPath:(id)a4 updateAction:(int64_t)a5
{
  id v9;
  id v10;
  UICollectionViewUpdateItem *v11;
  UICollectionViewUpdateItem *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _UICollectionUpdateIndexPair *p_initialIndexPair;
  uint64_t v18;
  NSUUID *identifier;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UICollectionViewUpdateItem;
  v11 = -[UICollectionViewUpdateItem init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_initialIndexPath, a3);
    if (v9)
    {
      v13 = objc_msgSend(v9, "indexAtPosition:", 0);
      v14 = objc_msgSend(v9, "indexAtPosition:", 1);
    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12->_initialIndexPair.section = v13;
    v12->_initialIndexPair.item = v14;
    objc_storeStrong((id *)&v12->_finalIndexPath, a4);
    if (v10)
    {
      v15 = objc_msgSend(v10, "indexAtPosition:", 0);
      v16 = objc_msgSend(v10, "indexAtPosition:", 1);
    }
    else
    {
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12->_finalIndexPair.section = v15;
    v12->_finalIndexPair.item = v16;
    v12->_updateAction = a5;
    if (a5)
      p_initialIndexPair = &v12->_initialIndexPair;
    else
      p_initialIndexPair = &v12->_finalIndexPair;
    v12->_indexPairForAction = *p_initialIndexPair;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v18;

    *(_BYTE *)&v12->_updateItemFlags &= ~1u;
  }

  return v12;
}

- (UICollectionUpdateAction)updateAction
{
  return self->_updateAction;
}

- (NSIndexPath)indexPathAfterUpdate
{
  return self->_finalIndexPath;
}

- (NSIndexPath)indexPathBeforeUpdate
{
  return self->_initialIndexPath;
}

- (_QWORD)_indexPath
{
  uint64_t v1;

  if (a1)
  {
    v1 = 8;
    if (!a1[10])
      v1 = 9;
    a1 = (id)a1[v1];
  }
  return a1;
}

- (NSString)description
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  if (self && self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL)
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
  switch(self->_updateAction)
  {
    case 0:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_finalIndexPair.section);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("INS(%@)"), v5);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_finalIndexPath, "_ui_shortDescription");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("INS%@"), v5);
      }
      goto LABEL_22;
    case 1:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_initialIndexPair.section);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("DEL(%@)"), v5);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_initialIndexPath, "_ui_shortDescription");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("DEL%@"), v5);
      }
      goto LABEL_22;
    case 2:
      if ((*(_BYTE *)&self->_updateItemFlags & 2) != 0)
        v6 = CFSTR("REC");
      else
        v6 = CFSTR("REL");
      v5 = v6;
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_initialIndexPair.section);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@(%@)"), v5, v7);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_initialIndexPath, "_ui_shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v5, v7);
      }
      goto LABEL_19;
    case 3:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_initialIndexPair.section);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_finalIndexPair.section);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("MOV(%@)->(%@)"), v5, v7);
      }
      else
      {
        -[NSIndexPath _ui_shortDescription](self->_initialIndexPath, "_ui_shortDescription");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[NSIndexPath _ui_shortDescription](self->_finalIndexPath, "_ui_shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("MOV%@->%@"), v5, v7);
      }
LABEL_19:

LABEL_22:
      break;
    default:
      return (NSString *)v3;
  }
  return (NSString *)v3;
}

- (void)initWithOldIndexPath:(void *)a3 newIndexPath:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
    a1 = (void *)objc_msgSend(a1, "initWithInitialIndexPath:finalIndexPath:updateAction:", v5, v6, 3);

  return a1;
}

- (id)_newIndexPath
{
  if (a1)
    a1 = (id *)objc_retainAutorelease(a1[9]);
  return a1;
}

- (void)_setNewIndexPath:(uint64_t)a1
{
  id v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    v5 = (id *)(a1 + 72);
    if (*(id *)(a1 + 72) != v4)
    {
      v12 = v4;
      objc_storeStrong((id *)(a1 + 72), a2);
      if (v12)
      {
        v6 = objc_msgSend(v12, "indexAtPosition:", 0);
        v7 = objc_msgSend(v12, "indexAtPosition:", 1);
        v8 = v12;
      }
      else
      {
        v8 = 0;
        v7 = 0x7FFFFFFFFFFFFFFFLL;
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = v7;
      v4 = v8;
      if (!*(_QWORD *)(a1 + 80))
      {
        v9 = *v5;
        if (*v5)
        {
          v10 = objc_msgSend(*v5, "indexAtPosition:", 0);
          v11 = objc_msgSend(v9, "indexAtPosition:", 1);
        }
        else
        {
          v11 = 0x7FFFFFFFFFFFFFFFLL;
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        *(_QWORD *)(a1 + 40) = v10;
        *(_QWORD *)(a1 + 48) = v11;
        v4 = v12;
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  UICollectionViewUpdateItem *v4;

  v4 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", self->_initialIndexPath, self->_finalIndexPath, self->_updateAction);
  -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v4, self->_identifier);
  if (v4)
    *(_BYTE *)&v4->_updateItemFlags = *(_BYTE *)&v4->_updateItemFlags & 0xFE | *(_BYTE *)&self->_updateItemFlags & 1;
  return v4;
}

- (int64_t)inverseCompareIndexPaths:(id)a3
{
  _QWORD *v4;
  int64_t section;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t item;
  BOOL v10;
  _BOOL8 v11;

  v4 = a3;
  section = self->_indexPairForAction.section;
  if (*(_OWORD *)&self->_indexPairForAction == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = 1;
  }
  else
  {
    v7 = v4[5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v4[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else if (v7 == section)
    {
      v8 = v4[6];
      item = self->_indexPairForAction.item;
      v10 = v8 < item;
      v11 = v8 > item;
      if (v10)
        v6 = -1;
      else
        v6 = v11;
    }
    else if (v7 >= section)
    {
      v6 = v7 > section;
    }
    else
    {
      v6 = -1;
    }
  }

  return v6;
}

- (int64_t)compareIndexPathsForMoves:(id)a3
{
  _QWORD *v5;
  int has_internal_diagnostics;
  BOOL v7;
  char v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v5)
    v7 = self->_updateAction == 3;
  else
    v7 = 0;
  v8 = !v7;
  if (has_internal_diagnostics)
  {
    if ((v8 & 1) == 0 && v5[10] == 3)
      goto LABEL_10;
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "%@ should only be used to compare move updates", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    if ((v8 & 1) == 0 && v5[10] == 3)
    {
LABEL_10:
      v9 = self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
    v12 = -[UICollectionViewUpdateItem compareIndexPathsForMoves:]::__s_category;
    if (!-[UICollectionViewUpdateItem compareIndexPathsForMoves:]::__s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&-[UICollectionViewUpdateItem compareIndexPathsForMoves:]::__s_category);
    }
    v13 = *(id *)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@ should only be used to compare move updates", (uint8_t *)&v17, 0xCu);

    }
  }

  v9 = self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
  {
    v10 = 0;
    if (self->_indexPairForAction.item != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_20;
    goto LABEL_12;
  }
LABEL_11:
  v10 = v5[6] == 0x7FFFFFFFFFFFFFFFLL;
  if (!v9)
    goto LABEL_20;
LABEL_12:
  if (!v10)
  {
    v11 = -1;
    goto LABEL_23;
  }
LABEL_20:
  if (v9 || !v10)
    v11 = -[UICollectionViewUpdateItem compareIndexPaths:](self, "compareIndexPaths:", v5);
  else
    v11 = 1;
LABEL_23:

  return v11;
}

- (UICollectionViewUpdateItem)revertedUpdate
{
  _QWORD *v1;
  uint64_t v2;
  UICollectionViewUpdateItem *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v1 = a1;
    v2 = a1[10];
    if (v2)
    {
      if (v2 != 1)
      {
        if (v2 == 3)
          return -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", a1[9], a1[8], 3);
        a1 = 0;
        return (UICollectionViewUpdateItem *)a1;
      }
      v4 = [UICollectionViewUpdateItem alloc];
      v8 = 8;
      if (!v1[10])
        v8 = 9;
      v6 = v1[v8];
      v7 = 0;
    }
    else
    {
      v4 = [UICollectionViewUpdateItem alloc];
      v5 = 8;
      if (!v1[10])
        v5 = 9;
      v6 = v1[v5];
      v7 = 1;
    }
    return -[UICollectionViewUpdateItem initWithAction:forIndexPath:](v4, "initWithAction:forIndexPath:", v7, v6);
  }
  return (UICollectionViewUpdateItem *)a1;
}

- (uint64_t)isEqualToUpdate:(_QWORD *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  BOOL v8;
  unsigned int v9;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_24;
    if (a1[8])
    {
      if (a1[2] != v4[2])
      {
        v7 = 0;
        goto LABEL_12;
      }
      v6 = a1[1] == v4[1];
    }
    else
    {
      v6 = v4[8] == 0;
    }
    v7 = v6;
LABEL_12:
    if (a1[9])
    {
      if (a1[4] != v4[4])
      {
        v9 = 0;
        if (v7)
        {
LABEL_20:
          if (a1[10] == v4[10])
            v5 = v9;
          else
            v5 = 0;
          goto LABEL_25;
        }
LABEL_24:
        v5 = 0;
        goto LABEL_25;
      }
      v8 = a1[3] == v4[3];
    }
    else
    {
      v8 = v4[9] == 0;
    }
    v9 = v8;
    if (v7)
      goto LABEL_20;
    goto LABEL_24;
  }
LABEL_25:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return -[UICollectionViewUpdateItem isEqualToUpdate:](self, a3);
}

- (uint64_t)isNOOP
{
  if (result)
  {
    if (*(_QWORD *)(result + 80) == 3
      && *(_QWORD *)(result + 16) == *(_QWORD *)(result + 32)
      && *(_QWORD *)(result + 8) == *(_QWORD *)(result + 24))
    {
      return 1;
    }
    else
    {
      return !*(_QWORD *)(result + 64) && *(_QWORD *)(result + 72) == 0;
    }
  }
  return result;
}

- (uint64_t)_initialIndexPathEqualToUpdateItem:(uint64_t)a1
{
  _QWORD *v3;

  v3 = a2;
  if (a1)
    a1 = *(_QWORD *)(a1 + 16) == v3[2] && *(_QWORD *)(a1 + 8) == v3[1];

  return a1;
}

- (uint64_t)_finalIndexPathEqualToUpdateItem:(uint64_t)a1
{
  _QWORD *v3;

  v3 = a2;
  if (a1)
    a1 = *(_QWORD *)(a1 + 32) == v3[4] && *(_QWORD *)(a1 + 24) == v3[3];

  return a1;
}

@end
