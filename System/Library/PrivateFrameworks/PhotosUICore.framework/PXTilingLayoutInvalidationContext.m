@implementation PXTilingLayoutInvalidationContext

- (void)invalidateTileWithIdentifier:(PXTileIdentifier *)a3
{
  NSMutableArray *invalidatedTileIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  _OWORD v11[5];
  unint64_t v12;

  invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  if (!invalidatedTileIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_invalidatedTileIdentifiers;
    self->_invalidatedTileIdentifiers = v6;

    invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  }
  v8 = *(_OWORD *)&a3->index[5];
  v11[2] = *(_OWORD *)&a3->index[3];
  v11[3] = v8;
  v11[4] = *(_OWORD *)&a3->index[7];
  v12 = a3->index[9];
  v9 = *(_OWORD *)&a3->index[1];
  v11[0] = *(_OWORD *)&a3->length;
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileIdentifier:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](invalidatedTileIdentifiers, "addObject:", v10);

}

- (void)invalidateTilesInGroup:(unint64_t)a3
{
  NSMutableIndexSet *invalidatedTileGroups;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *v6;

  invalidatedTileGroups = self->_invalidatedTileGroups;
  if (invalidatedTileGroups)
  {
    -[NSMutableIndexSet addIndex:](invalidatedTileGroups, "addIndex:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
    v5 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_invalidatedTileGroups;
    self->_invalidatedTileGroups = v5;

  }
}

- (void)enumerateInvalidatedTileIdentifiersUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *invalidatedTileIdentifiers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PXTilingLayoutInvalidationContext_enumerateInvalidatedTileIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_1E513E390;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](invalidatedTileIdentifiers, "enumerateObjectsUsingBlock:", v7);

}

- (void)invalidateAllTiles
{
  self->_invalidatedAllTiles = 1;
}

- (void)invalidateContentBounds
{
  self->_invalidatedContentBounds = 1;
}

- (void)invalidateScrollBounds
{
  self->_invalidatedScrollBounds = 1;
}

- (void)invalidateVisibleRect
{
  self->_invalidatedVisibleRect = 1;
}

- (void)invalidateScrollInfo
{
  self->_invalidatedScrollInfo = 1;
}

- (void)invalidateEverything
{
  -[PXTilingLayoutInvalidationContext invalidateAllTiles](self, "invalidateAllTiles");
  -[PXTilingLayoutInvalidationContext invalidateContentBounds](self, "invalidateContentBounds");
  -[PXTilingLayoutInvalidationContext invalidateScrollBounds](self, "invalidateScrollBounds");
  -[PXTilingLayoutInvalidationContext invalidateVisibleRect](self, "invalidateVisibleRect");
  -[PXTilingLayoutInvalidationContext invalidateScrollInfo](self, "invalidateScrollInfo");
}

- (NSIndexSet)invalidatedTileGroups
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_invalidatedTileGroups, "copy");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, tag=%@>"), objc_opt_class(), self, self->_tag);
}

- (BOOL)invalidatedAllTiles
{
  return self->_invalidatedAllTiles;
}

- (BOOL)invalidatedContentBounds
{
  return self->_invalidatedContentBounds;
}

- (BOOL)invalidatedScrollBounds
{
  return self->_invalidatedScrollBounds;
}

- (BOOL)invalidatedVisibleRect
{
  return self->_invalidatedVisibleRect;
}

- (BOOL)invalidatedScrollInfo
{
  return self->_invalidatedScrollInfo;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_invalidatedTileGroups, 0);
  objc_storeStrong((id *)&self->_invalidatedTileIdentifiers, 0);
}

uint64_t __83__PXTilingLayoutInvalidationContext_enumerateInvalidatedTileIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _OWORD v13[5];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  if (a2)
    objc_msgSend(a2, "PXTileIdentifierValue");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16);
  v13[2] = v17;
  v13[3] = v18;
  v13[4] = v19;
  v14 = v20;
  v13[0] = v15;
  v13[1] = v16;
  return v11(v10, v13, a4, a4, a5, a6, a7, a8);
}

@end
