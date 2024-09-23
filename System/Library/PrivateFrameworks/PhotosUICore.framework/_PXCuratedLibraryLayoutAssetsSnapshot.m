@implementation _PXCuratedLibraryLayoutAssetsSnapshot

- (_PXCuratedLibraryLayoutAssetsSnapshot)initWithLayout:(id)a3
{
  id v4;
  _PXCuratedLibraryLayoutAssetsSnapshot *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PXAssetsDataSource *dataSource;
  int64_t zoomLevel;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  _PXCuratedLibraryLayoutAssetsSnapshot *v28;
  id v29;
  uint64_t v30;
  NSDictionary *spriteSnapshotIndexByAssetIdentifier;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v36;
  _PXCuratedLibraryLayoutAssetsSnapshot *v37;
  id v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  _PXCuratedLibraryLayoutAssetsSnapshot *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v4 = a3;
  v5 = -[_PXCuratedLibraryLayoutAssetsSnapshot init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "visibleRect");
    v5->_visibleRect.origin.x = v6;
    v5->_visibleRect.origin.y = v7;
    v5->_visibleRect.size.width = v8;
    v5->_visibleRect.size.height = v9;
    objc_msgSend(v4, "fullyVisibleRect");
    v5->_fullyVisibleRect.origin.x = v10;
    v5->_fullyVisibleRect.origin.y = v11;
    v5->_fullyVisibleRect.size.width = v12;
    v5->_fullyVisibleRect.size.height = v13;
    v14 = objc_msgSend(v4, "presentedZoomLevel");
    v5->_zoomLevel = v14;
    if (v14 == 4)
      objc_msgSend(v4, "allPhotosLayout");
    else
      objc_msgSend(v4, "libraryBodyLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentedDataSource");
    v16 = objc_claimAutoreleasedReturnValue();
    dataSource = v5->_dataSource;
    v5->_dataSource = (PXAssetsDataSource *)v16;

    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__153383;
    v48 = __Block_byref_object_dispose__153384;
    v49 = 0;
    zoomLevel = v5->_zoomLevel;
    v19 = MEMORY[0x1E0C809B0];
    if ((unint64_t)(zoomLevel - 1) >= 2)
    {
      if (zoomLevel != 3)
      {
LABEL_10:
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = objc_msgSend(v4, "numberOfSprites") << 32;
        v33 = v19;
        v34 = 3221225472;
        v35 = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_4;
        v36 = &unk_1E512EB28;
        v28 = v5;
        v37 = v28;
        v39 = &v44;
        v29 = v26;
        v38 = v29;
        objc_msgSend(v4, "enumerateSpritesInRange:options:usingBlock:", v27, 1, &v33);
        v30 = objc_msgSend(v29, "copy", v33, v34, v35, v36);
        spriteSnapshotIndexByAssetIdentifier = v28->_spriteSnapshotIndexByAssetIdentifier;
        v28->_spriteSnapshotIndexByAssetIdentifier = (NSDictionary *)v30;

        _Block_object_dispose(&v44, 8);
        goto LABEL_11;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke;
      v40[3] = &unk_1E512EAD8;
      v41 = v4;
      v42 = v5;
      v43 = &v44;
      objc_msgSend(v41, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v40);

      v23 = v41;
    }
    else
    {
      objc_msgSend(v4, "libraryBodyLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dominantSectionLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assetCollectionReference");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keyAssetReference");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      -[_PXCuratedLibraryLayoutAssetsSnapshot assetIdentifierForAssetReference:](v5, "assetIdentifierForAssetReference:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v45[5];
      v45[5] = v24;

    }
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_spriteSnapshots);
  v3.receiver = self;
  v3.super_class = (Class)_PXCuratedLibraryLayoutAssetsSnapshot;
  -[_PXCuratedLibraryLayoutAssetsSnapshot dealloc](&v3, sel_dealloc);
}

- (int64_t)_addSpriteSnapshot:(id *)a3
{
  int64_t spriteSnapshotsCapacity;
  uint64_t spriteSnapshotsCount;
  int64_t v7;
  BOOL v8;
  char *v9;
  CGPoint origin;
  CGSize size;
  __int128 v12;

  spriteSnapshotsCount = self->_spriteSnapshotsCount;
  spriteSnapshotsCapacity = self->_spriteSnapshotsCapacity;
  self->_spriteSnapshotsCount = spriteSnapshotsCount + 1;
  if (spriteSnapshotsCount >= spriteSnapshotsCapacity)
  {
    if (spriteSnapshotsCapacity)
    {
      do
      {
        v7 = 2 * spriteSnapshotsCapacity;
        v8 = spriteSnapshotsCount < 2 * spriteSnapshotsCapacity;
        spriteSnapshotsCapacity *= 2;
      }
      while (!v8);
    }
    else
    {
      v7 = 32;
    }
    self->_spriteSnapshotsCapacity = v7;
    _PXGArrayResize();
  }
  v9 = (char *)self->_spriteSnapshots + 56 * spriteSnapshotsCount;
  origin = a3->var0.origin;
  size = a3->var0.size;
  v12 = *(_OWORD *)&a3->var1;
  *((_QWORD *)v9 + 6) = *(_QWORD *)&a3[1].var0.origin.y;
  *((CGSize *)v9 + 1) = size;
  *((_OWORD *)v9 + 2) = v12;
  *(CGPoint *)v9 = origin;
  return spriteSnapshotsCount;
}

- (CGRect)visibleRect
{
  CGFloat width;
  CGFloat height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  -[_PXCuratedLibraryLayoutAssetsSnapshot offset](self, "offset");
  PXPointAdd();
  v6 = width;
  v7 = height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)fullyVisibleRect
{
  CGFloat width;
  CGFloat height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  width = self->_fullyVisibleRect.size.width;
  height = self->_fullyVisibleRect.size.height;
  -[_PXCuratedLibraryLayoutAssetsSnapshot offset](self, "offset");
  PXPointAdd();
  v6 = width;
  v7 = height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)enumerateAssetInfoForGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 count:(unsigned int)a6 options:(unint64_t)a7 usingBlock:(id)a8
{
  char v8;
  void (**v12)(id, void *, uint64_t, unsigned __int8 *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v16;
  uint64_t v17;
  PXAssetsDataSource *dataSource;
  void *v19;
  int v20;
  unsigned __int8 v21;
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;

  v8 = a7;
  v12 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a8;
  v13 = -[PXAssetsDataSource identifier](self->_dataSource, "identifier");
  if (a6)
  {
    v14 = v13;
    v15 = 0;
    v16 = a5 + 1;
    v17 = a6;
    do
    {
      if ((v8 & 1) != 0 || v16[-1].var1 == 2)
      {
        v23 = 0;
        v24 = 0;
        PXGSectionedSpriteTagDecompose();
        if (v23 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((v8 & 2) != 0)
          {
LABEL_11:
            v19 = 0;
          }
          else
          {
            dataSource = self->_dataSource;
            v22[0] = v14;
            v22[1] = v24;
            v22[2] = v23;
            v22[3] = 0x7FFFFFFFFFFFFFFFLL;
            -[PXAssetsDataSource assetIdentifierAtItemIndexPath:](dataSource, "assetIdentifierAtItemIndexPath:", v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v21 = 0;
          v12[2](v12, v19, v15, &v21);
          v20 = v21;

          if (v20)
            break;
          goto LABEL_13;
        }
        if ((v8 & 4) != 0 && v24 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_11;
      }
LABEL_13:
      ++v15;
      v16 = (const $786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v16 + 40);
    }
    while (v17 != v15);
  }

}

- (id)assetIdentifierForAssetReference:(id)a3
{
  id v4;
  PXAssetsDataSource *dataSource;
  uint64_t v6;
  void *v7;
  PXAssetsDataSource *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  dataSource = self->_dataSource;
  if (dataSource)
  {
    -[PXAssetsDataSource indexPathForAssetReference:](dataSource, "indexPathForAssetReference:", v4);
    v6 = v11;
  }
  else
  {
    v6 = 0;
  }
  if (v6 == *(_QWORD *)off_1E50B7E98)
  {
    v7 = 0;
  }
  else
  {
    v8 = self->_dataSource;
    v10[0] = v11;
    v10[1] = v12;
    -[PXAssetsDataSource assetIdentifierAtItemIndexPath:](v8, "assetIdentifierAtItemIndexPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- ($610C715A8B7E26897ADA48D0AF0CD277)spriteSnapshotForAssetWithIdentifier:(SEL)a3
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  char *v12;
  CGSize v13;
  CGFloat v14;
  CGFloat v15;
  $610C715A8B7E26897ADA48D0AF0CD277 *result;
  void *v17;
  id v18;

  v7 = a4;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr[1].var0.origin.y = 0.0;
  if (v7
    && (v18 = v7,
        -[NSDictionary objectForKeyedSubscript:](self->_spriteSnapshotIndexByAssetIdentifier, "objectForKeyedSubscript:", v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v7 = v18, v8))
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "integerValue");
    v11 = v10;
    if (v10 < 0 || v10 >= self->_spriteSnapshotsCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < _spriteSnapshotsCount"));

    }
    v12 = (char *)self->_spriteSnapshots + 56 * v11;
    v13 = (CGSize)*((_OWORD *)v12 + 1);
    retstr->var0.origin = *(CGPoint *)v12;
    retstr->var0.size = v13;
    *(_OWORD *)&retstr->var1 = *((_OWORD *)v12 + 2);
    retstr[1].var0.origin.y = *((CGFloat *)v12 + 6);
    -[_PXCuratedLibraryLayoutAssetsSnapshot offset](self, "offset");
    PXPointAdd();
    retstr->var0.origin.x = v14;
    retstr->var0.origin.y = v15;

    v7 = v18;
  }
  else
  {
    retstr[1].var0.origin.y = 0.0;
    retstr->var0.origin = (CGPoint)PXCuratedLibrarySpriteSnapshotNull;
    retstr->var0.size = (CGSize)unk_1A7C09D20;
    *(_OWORD *)&retstr->var1 = xmmword_1A7C09D30;
  }

  return result;
}

- (void)enumerateAssetIdentifiersUsingBlock:(id)a3
{
  id v4;
  NSDictionary *spriteSnapshotIndexByAssetIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  spriteSnapshotIndexByAssetIdentifier = self->_spriteSnapshotIndexByAssetIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77___PXCuratedLibraryLayoutAssetsSnapshot_enumerateAssetIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_1E512EB50;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](spriteSnapshotIndexByAssetIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSCopying)dominantAssetIdentifier
{
  NSDictionary *spriteSnapshotIndexByAssetIdentifier;
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__153383;
  v10 = __Block_byref_object_dispose__153384;
  v11 = 0;
  spriteSnapshotIndexByAssetIdentifier = self->_spriteSnapshotIndexByAssetIdentifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___PXCuratedLibraryLayoutAssetsSnapshot_dominantAssetIdentifier__block_invoke;
  v5[3] = &unk_1E512EB78;
  v5[5] = &v6;
  v5[6] = a2;
  v5[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](spriteSnapshotIndexByAssetIdentifier, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSCopying *)v3;
}

- (void)setDominantAssetIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t spriteSnapshotsCount;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64x2_t v12;
  int64x2_t v13;
  BOOL *v14;
  int64x2_t v15;
  int32x2_t v16;
  id v17;

  -[NSDictionary objectForKeyedSubscript:](self->_spriteSnapshotIndexByAssetIdentifier, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  if (!v5)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dominantIndex >= 0 && dominantIndex < _spriteSnapshotsCount"), v17);

    spriteSnapshotsCount = self->_spriteSnapshotsCount;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, "integerValue");
  v7 = v6;
  if (v6 < 0)
    goto LABEL_6;
  spriteSnapshotsCount = self->_spriteSnapshotsCount;
  if (v6 >= spriteSnapshotsCount)
    goto LABEL_6;
LABEL_7:
  v10 = spriteSnapshotsCount - 1;
  if (spriteSnapshotsCount >= 1)
  {
    v11 = (spriteSnapshotsCount + 1) & 0xFFFFFFFFFFFFFFFELL;
    v12 = (uint64x2_t)vdupq_n_s64(v10);
    v13 = (int64x2_t)xmmword_1A7BA6CB0;
    v14 = (BOOL *)&self->_spriteSnapshots[2].var0.size.height + 4;
    v15 = vdupq_n_s64(2uLL);
    do
    {
      v16 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v13));
      if ((v16.i8[0] & 1) != 0)
        *(v14 - 56) = v7 == 0;
      if ((v16.i8[4] & 1) != 0)
        *v14 = v7 == 1;
      v13 = vaddq_s64(v13, v15);
      v14 += 112;
      v7 -= 2;
      v11 -= 2;
    }
    while (v11);
  }

}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteSnapshotIndexByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
