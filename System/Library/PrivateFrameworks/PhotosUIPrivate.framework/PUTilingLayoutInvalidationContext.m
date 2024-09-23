@implementation PUTilingLayoutInvalidationContext

- (PUTilingLayoutInvalidationContext)init
{
  PUTilingLayoutInvalidationContext *v2;
  uint64_t v3;
  NSMutableDictionary *invalidatedIndexPathsByTileKind;
  uint64_t v5;
  NSMutableSet *invalidatedTileKinds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUTilingLayoutInvalidationContext;
  v2 = -[PUTilingLayoutInvalidationContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    invalidatedIndexPathsByTileKind = v2->__invalidatedIndexPathsByTileKind;
    v2->__invalidatedIndexPathsByTileKind = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    invalidatedTileKinds = v2->_invalidatedTileKinds;
    v2->_invalidatedTileKinds = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)invalidateTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayoutInvalidationContext.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayoutInvalidationContext.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileKind != nil"));

LABEL_3:
  -[PUTilingLayoutInvalidationContext _invalidatedIndexPathsByTileKind](self, "_invalidatedIndexPathsByTileKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);
  }
  objc_msgSend(v9, "addObject:", v12);
  -[PUTilingLayoutInvalidationContext setInvalidatedAnyTile:](self, "setInvalidatedAnyTile:", 1);

}

- (void)invalidateAllTilesWithKind:(id)a3
{
  -[NSMutableSet addObject:](self->_invalidatedTileKinds, "addObject:", a3);
  -[PUTilingLayoutInvalidationContext setInvalidatedAnyTile:](self, "setInvalidatedAnyTile:", 1);
}

- (void)invalidateAllTiles
{
  -[PUTilingLayoutInvalidationContext setInvalidatedAllTiles:](self, "setInvalidatedAllTiles:", 1);
  -[PUTilingLayoutInvalidationContext setInvalidatedAnyTile:](self, "setInvalidatedAnyTile:", 1);
}

- (void)invalidateContentBounds
{
  self->_invalidatedContentBounds = 1;
}

- (void)enumerateInvalidatedTilesUsingBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingLayoutInvalidationContext.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock != NULL"));

  }
  -[PUTilingLayoutInvalidationContext _invalidatedIndexPathsByTileKind](self, "_invalidatedIndexPathsByTileKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke;
  v9[3] = &unk_1E58A9238;
  v7 = v5;
  v10 = v7;
  v11 = v12;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  _Block_object_dispose(v12, 8);
}

- (NSSet)invalidatedTileKinds
{
  return &self->_invalidatedTileKinds->super;
}

- (BOOL)invalidatedAllTiles
{
  return self->_invalidatedAllTiles;
}

- (void)setInvalidatedAllTiles:(BOOL)a3
{
  self->_invalidatedAllTiles = a3;
}

- (BOOL)invalidatedContentBounds
{
  return self->_invalidatedContentBounds;
}

- (BOOL)invalidatedAnyTile
{
  return self->_invalidatedAnyTile;
}

- (void)setInvalidatedAnyTile:(BOOL)a3
{
  self->_invalidatedAnyTile = a3;
}

- (NSMutableDictionary)_invalidatedIndexPathsByTileKind
{
  return self->__invalidatedIndexPathsByTileKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invalidatedIndexPathsByTileKind, 0);
  objc_storeStrong((id *)&self->_invalidatedTileKinds, 0);
}

void __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v7 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke_2;
  v11[3] = &unk_1E58A9210;
  v13 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v8;
  v12 = v8;
  v14 = v9;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

uint64_t __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;
  return result;
}

@end
