@implementation PUActivityAssetItem

- (PUActivityAssetItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityAssetItem.m"), 25, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (PUActivityAssetItem)initWithAsset:(id)a3
{
  id v6;
  PUActivityAssetItem *v7;
  PUActivityAssetItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityAssetItem.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PUActivityAssetItem;
  v7 = -[PUActivityAssetItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_asset, a3);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAsset:", self->_asset);
  *((_BYTE *)result + 8) = self->_excludeLiveness;
  *((_BYTE *)result + 9) = self->_excludeLocation;
  *((_BYTE *)result + 10) = self->_excludeCaption;
  *((_BYTE *)result + 11) = self->_excludeAccessibilityDescription;
  return result;
}

- (id)localIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  _BOOL4 v11;
  const __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  -[PUActivityAssetItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("unknown");
  if (v4)
    v6 = (const __CFString *)v4;
  v7 = -[PUActivityAssetItem excludeLiveness](self, "excludeLiveness", v6);
  v8 = CFSTR("original");
  if (v7)
    v8 = CFSTR("still");
  v18[1] = v8;
  v9 = -[PUActivityAssetItem excludeLocation](self, "excludeLocation");
  v10 = CFSTR("withLocation");
  if (v9)
    v10 = CFSTR("noLocation");
  v18[2] = v10;
  v11 = -[PUActivityAssetItem excludeCaption](self, "excludeCaption");
  v12 = CFSTR("withCaption");
  if (v11)
    v12 = CFSTR("noCaption");
  v18[3] = v12;
  v13 = -[PUActivityAssetItem excludeAccessibilityDescription](self, "excludeAccessibilityDescription");
  v14 = CFSTR("withAXDescription");
  if (v13)
    v14 = CFSTR("noAXDescription");
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqualToActivityAssetItem:(id)a3
{
  PUActivityAssetItem *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v13;

  v4 = (PUActivityAssetItem *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    -[PUActivityAssetItem asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityAssetItem asset](v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7
      && (v8 = -[PUActivityAssetItem excludeLiveness](self, "excludeLiveness"),
          v8 == -[PUActivityAssetItem excludeLiveness](v4, "excludeLiveness"))
      && (v9 = -[PUActivityAssetItem excludeLocation](self, "excludeLocation"),
          v9 == -[PUActivityAssetItem excludeLocation](v4, "excludeLocation"))
      && (v10 = -[PUActivityAssetItem excludeCaption](self, "excludeCaption"),
          v10 == -[PUActivityAssetItem excludeCaption](v4, "excludeCaption")))
    {
      v13 = -[PUActivityAssetItem excludeAccessibilityDescription](self, "excludeAccessibilityDescription");
      v11 = v13 ^ -[PUActivityAssetItem excludeAccessibilityDescription](v4, "excludeAccessibilityDescription") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PHAsset description](self->_asset, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_excludeLiveness)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (self->_excludeLocation)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (self->_excludeCaption)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  if (self->_excludeAccessibilityDescription)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = v12;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, asset:%@, excludeLiveness:%@, excludeLocation:%@, excludeCaption:%@, excludeAccessibilityDescription:%@>"), v4, self, v5, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PUActivityAssetItem *v4;
  PUActivityAssetItem *v5;
  BOOL v6;

  v4 = (PUActivityAssetItem *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PUActivityAssetItem isEqualToActivityAssetItem:](self, "isEqualToActivityAssetItem:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUActivityAssetItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (BOOL)excludeLiveness
{
  return self->_excludeLiveness;
}

- (void)setExcludeLiveness:(BOOL)a3
{
  self->_excludeLiveness = a3;
}

- (BOOL)excludeLocation
{
  return self->_excludeLocation;
}

- (void)setExcludeLocation:(BOOL)a3
{
  self->_excludeLocation = a3;
}

- (BOOL)excludeCaption
{
  return self->_excludeCaption;
}

- (void)setExcludeCaption:(BOOL)a3
{
  self->_excludeCaption = a3;
}

- (BOOL)excludeAccessibilityDescription
{
  return self->_excludeAccessibilityDescription;
}

- (void)setExcludeAccessibilityDescription:(BOOL)a3
{
  self->_excludeAccessibilityDescription = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)itemsForAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PUActivityAssetItem *v11;
  PUActivityAssetItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PUActivityAssetItem alloc];
        v12 = -[PUActivityAssetItem initWithAsset:](v11, "initWithAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
