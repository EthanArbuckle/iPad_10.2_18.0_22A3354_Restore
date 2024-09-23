@implementation PUCollectionViewLayoutCache

- (PUCollectionViewLayoutCache)initWithProvider:(id)a3
{
  id v4;
  PUCollectionViewLayoutCache *v5;
  PUCollectionViewLayoutCache *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUCollectionViewLayoutCache;
  v5 = -[PUCollectionViewLayoutCache init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layoutProvider, v4);
    *(_BYTE *)&v6->_layoutProviderFlags = *(_BYTE *)&v6->_layoutProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&v6->_layoutProviderFlags = *(_BYTE *)&v6->_layoutProviderFlags & 0xFD | v7;
    v6->_cachesResults = 1;
  }

  return v6;
}

- (PUCollectionViewLayoutCache)init
{
  return -[PUCollectionViewLayoutCache initWithProvider:](self, "initWithProvider:", 0);
}

- (CGSize)collectionViewContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUCollectionViewLayoutCache layoutProvider](self, "layoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUCollectionViewLayoutCache layoutProvider](self, "layoutProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  NSMutableDictionary *itemLayoutAttributesByIndexPath;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_itemLayoutAttributesByIndexPath, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PUCollectionViewLayoutCache layoutProvider](self, "layoutProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[PUCollectionViewLayoutCache cachesResults](self, "cachesResults"))
      {
        itemLayoutAttributesByIndexPath = self->_itemLayoutAttributesByIndexPath;
        if (itemLayoutAttributesByIndexPath)
        {
          v9 = itemLayoutAttributesByIndexPath;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        }
        v10 = self->_itemLayoutAttributesByIndexPath;
        self->_itemLayoutAttributesByIndexPath = v9;

        -[NSMutableDictionary setObject:forKey:](self->_itemLayoutAttributesByIndexPath, "setObject:forKey:", v5, v4);
      }
    }
  }

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *supplementaryViewLayoutAttributesByKind;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_supplementaryViewLayoutAttributesByKind, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
  }
  else if ((*(_BYTE *)&self->_layoutProviderFlags & 1) != 0)
  {
    -[PUCollectionViewLayoutCache layoutProvider](self, "layoutProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && -[PUCollectionViewLayoutCache cachesResults](self, "cachesResults"))
    {
      supplementaryViewLayoutAttributesByKind = self->_supplementaryViewLayoutAttributesByKind;
      if (supplementaryViewLayoutAttributesByKind)
      {
        v13 = supplementaryViewLayoutAttributesByKind;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      v14 = self->_supplementaryViewLayoutAttributesByKind;
      self->_supplementaryViewLayoutAttributesByKind = v13;

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_supplementaryViewLayoutAttributesByKind, "setObject:forKey:", v8, v6);
      }
      objc_msgSend(v8, "setObject:forKey:", v10, v7);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *decorationViewLayoutAttributesByKind;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_decorationViewLayoutAttributesByKind, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
  }
  else if ((*(_BYTE *)&self->_layoutProviderFlags & 2) != 0)
  {
    -[PUCollectionViewLayoutCache layoutProvider](self, "layoutProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && -[PUCollectionViewLayoutCache cachesResults](self, "cachesResults"))
    {
      decorationViewLayoutAttributesByKind = self->_decorationViewLayoutAttributesByKind;
      if (decorationViewLayoutAttributesByKind)
      {
        v13 = decorationViewLayoutAttributesByKind;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      v14 = self->_decorationViewLayoutAttributesByKind;
      self->_decorationViewLayoutAttributesByKind = v13;

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_decorationViewLayoutAttributesByKind, "setObject:forKey:", v8, v6);
      }
      objc_msgSend(v8, "setObject:forKey:", v10, v7);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)invalidateLayoutCache
{
  -[NSMutableDictionary removeAllObjects](self->_itemLayoutAttributesByIndexPath, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_supplementaryViewLayoutAttributesByKind, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_decorationViewLayoutAttributesByKind, "removeAllObjects");
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (PUCollectionViewLayoutProvider)layoutProvider
{
  return (PUCollectionViewLayoutProvider *)objc_loadWeakRetained((id *)&self->_layoutProvider);
}

- (BOOL)cachesResults
{
  return self->_cachesResults;
}

- (void)setCachesResults:(BOOL)a3
{
  self->_cachesResults = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutProvider);
  objc_storeStrong((id *)&self->_decorationViewLayoutAttributesByKind, 0);
  objc_storeStrong((id *)&self->_supplementaryViewLayoutAttributesByKind, 0);
  objc_storeStrong((id *)&self->_itemLayoutAttributesByIndexPath, 0);
}

@end
