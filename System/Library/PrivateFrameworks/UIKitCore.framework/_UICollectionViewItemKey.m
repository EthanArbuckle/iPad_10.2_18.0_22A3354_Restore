@implementation _UICollectionViewItemKey

- (unint64_t)hash
{
  return -[NSIndexPath hash](self->_indexPath, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class()
    && self->_type == v4[4]
    && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[2])
    && -[NSIndexPath isEqual:](self->_indexPath, "isEqual:", v4[1])
    && self->_isClone == *((unsigned __int8 *)v4 + 24);

  return v6;
}

+ (_UICollectionViewItemKey)collectionItemKeyForCellWithIndexPath:(uint64_t)a1
{
  _UICollectionViewItemKey *v3;

  objc_opt_self();
  v3 = [_UICollectionViewItemKey alloc];
  if (v3)
    v3 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v3, 0, a2, CFSTR("_Cell_"), 0);
  return v3;
}

- (id)initWithType:(void *)a3 indexPath:(void *)a4 identifier:(char)a5 clone:
{
  id *v9;
  id *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)_UICollectionViewItemKey;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[4] = a2;
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong(v10 + 2, a4);
    *((_BYTE *)v10 + 24) = a5;
  }
  return v10;
}

+ (id)collectionItemKeyForLayoutAttributes:(uint64_t)a1
{
  __int16 v3;
  uint64_t v4;
  __CFString *v5;
  _UICollectionViewItemKey *v6;
  void *v7;
  int v8;
  id *v9;

  objc_opt_self();
  if (!a2)
  {
    v4 = 2;
LABEL_6:
    -[UIBarButtonItemGroup _items]((id *)a2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v3 = *(_WORD *)(a2 + 288);
  if ((v3 & 1) == 0)
  {
    if ((v3 & 3) != 0)
      v4 = 2;
    else
      v4 = 1;
    goto LABEL_6;
  }
  v4 = 0;
  v5 = CFSTR("_Cell_");
LABEL_8:
  v6 = [_UICollectionViewItemKey alloc];
  objc_msgSend((id)a2, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v8 = (*(unsigned __int16 *)(a2 + 288) >> 3) & 1;
  else
    LOBYTE(v8) = 0;
  v9 = -[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v6, (void *)v4, v7, v5, v8);

  return v9;
}

+ (_UICollectionViewItemKey)collectionItemKeyForDecorationViewOfKind:(void *)a3 andIndexPath:
{
  _UICollectionViewItemKey *v5;

  objc_opt_self();
  v5 = [_UICollectionViewItemKey alloc];
  if (v5)
    v5 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v5, (void *)2, a3, a2, 0);
  return v5;
}

+ (_UICollectionViewItemKey)collectionItemKeyForSupplementaryViewOfKind:(void *)a3 andIndexPath:
{
  _UICollectionViewItemKey *v5;

  objc_opt_self();
  v5 = [_UICollectionViewItemKey alloc];
  if (v5)
    v5 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v5, (void *)1, a3, a2, 0);
  return v5;
}

- (id)description
{
  unint64_t type;
  void *v4;
  void *v5;
  NSIndexPath *indexPath;
  NSIndexPath *v7;
  NSString *v8;
  _BOOL4 isClone;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSString *identifier;
  NSIndexPath *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  const __CFString *v21;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;

  if (!self)
  {
LABEL_5:
    v4 = (void *)MEMORY[0x1E0CB3940];
    v26.receiver = self;
    v26.super_class = (Class)_UICollectionViewItemKey;
    -[_UICollectionViewItemKey description](&v26, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      indexPath = self->_indexPath;
    else
      indexPath = 0;
    v7 = indexPath;
    -[NSIndexPath _ui_shortDescription](v7, "_ui_shortDescription");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    isClone = self->_isClone;

    v10 = CFSTR(" (C)");
    if (!isClone)
      v10 = &stru_1E16EDF20;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ Type = C IndexPath = %@%@"), v5, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  type = self->_type;
  if (type == 2)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v24.receiver = self;
    v24.super_class = (Class)_UICollectionViewItemKey;
    -[_UICollectionViewItemKey description](&v24, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v14 = self->_indexPath;
    v8 = identifier;
    -[NSIndexPath _ui_shortDescription](v14, "_ui_shortDescription");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (self->_isClone)
      v17 = CFSTR(" (C)");
    else
      v17 = &stru_1E16EDF20;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ Type = DV ReuseID = %@ IndexPath = %@%@"), v5, v8, v15, v17);
  }
  else
  {
    if (type != 1)
    {
      if (type)
      {
        v23.receiver = self;
        v23.super_class = (Class)_UICollectionViewItemKey;
        -[_UICollectionViewItemKey description](&v23, sel_description);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        return v11;
      }
      goto LABEL_5;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    v25.receiver = self;
    v25.super_class = (Class)_UICollectionViewItemKey;
    -[_UICollectionViewItemKey description](&v25, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_identifier;
    v14 = self->_indexPath;
    v8 = v19;
    -[NSIndexPath _ui_shortDescription](v14, "_ui_shortDescription");
    v20 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v20;
    if (self->_isClone)
      v21 = CFSTR(" (C)");
    else
      v21 = &stru_1E16EDF20;
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ Type = SV Kind = %@ IndexPath = %@%@"), v5, v8, v20, v21);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v11;
}

- (id)copyAsClone:(id *)result
{
  char v2;
  _UICollectionViewItemKey *v3;
  id v4;
  id v5;
  id v6;
  id *v7;
  id *v8;

  if (result)
  {
    v2 = a2;
    if ((*((_BYTE *)result + 24) != 0) == a2)
    {
      return result;
    }
    else
    {
      v8 = result;
      v3 = [_UICollectionViewItemKey alloc];
      v4 = v8[4];
      v5 = v8[2];
      v6 = v8[1];
      v7 = -[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v3, v4, v6, v5, v2);

      return v7;
    }
  }
  return result;
}

@end
