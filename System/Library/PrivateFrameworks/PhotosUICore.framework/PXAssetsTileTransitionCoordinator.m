@implementation PXAssetsTileTransitionCoordinator

- (PXAssetsTileTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4
{
  uint64_t v7;
  PXAssetsTilingLayout *fromLayout;
  uint64_t v9;
  PXAssetsTilingLayout *toLayout;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *changeDetails;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PXBasicTileAnimationOptions *basicAnimationOptions;
  PXBasicTileAnimationOptions *v33;
  void *v34;
  void *v35;
  NSIndexSet *v36;
  NSIndexSet *kindsCenteredOnContentTiles;
  id v39;
  id v40;
  PXAssetsTileTransitionCoordinator *v41;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v51.receiver = self;
  v51.super_class = (Class)PXAssetsTileTransitionCoordinator;
  v41 = -[PXAssetsTileTransitionCoordinator init](&v51, sel_init);
  if (!v41)
    goto LABEL_19;
  objc_storeStrong((id *)&v41->__tilingChange, a3);
  objc_storeStrong((id *)&v41->__changeHistory, a4);
  objc_msgSend(v40, "fromLayout");
  v7 = objc_claimAutoreleasedReturnValue();
  fromLayout = v41->__fromLayout;
  v41->__fromLayout = (PXAssetsTilingLayout *)v7;

  objc_msgSend(v40, "toLayout");
  v9 = objc_claimAutoreleasedReturnValue();
  toLayout = v41->__toLayout;
  v41->__toLayout = (PXAssetsTilingLayout *)v9;

  objc_msgSend(v40, "fromLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "toLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
    objc_msgSend(v40, "fromLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "identifier");

    objc_msgSend(v40, "toLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "identifier");

  }
  else
  {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_8:
  objc_msgSend(v39, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v16, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  changeDetails = v41->__changeDetails;
  v41->__changeDetails = (NSArray *)v19;

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v21 = v41->__changeDetails;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v44;
LABEL_10:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v23)
        objc_enumerationMutation(v21);
      v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v24);
      objc_msgSend(v25, "sectionChanges");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removedIndexes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count") == 0;

      if (!v28)
        *((_BYTE *)v48 + 24) = 1;
      objc_msgSend(v25, "sectionsWithItemChanges");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __72__PXAssetsTileTransitionCoordinator_initWithTilingChange_changeHistory___block_invoke;
      v42[3] = &unk_1E5136440;
      v42[4] = v25;
      v42[5] = &v47;
      objc_msgSend(v29, "enumerateIndexesUsingBlock:", v42);

      if (*((_BYTE *)v48 + 24))
        break;
      if (v22 == ++v24)
      {
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v22)
          goto LABEL_10;
        break;
      }
    }
  }

  v41->_treatRemovalsAsDeletes = *((_BYTE *)v48 + 24);
  +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBasicTileAnimationOptions defaultAnimationOptions](PXBasicTileAnimationOptions, "defaultAnimationOptions");
  v31 = objc_claimAutoreleasedReturnValue();
  basicAnimationOptions = v41->__basicAnimationOptions;
  v41->__basicAnimationOptions = (PXBasicTileAnimationOptions *)v31;

  v33 = v41->__basicAnimationOptions;
  objc_msgSend(v30, "transitionDuration");
  -[PXBasicTileAnimationOptions setDuration:](v33, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addIndex:", 6332434);
  objc_msgSend(v34, "addIndex:", 6332436);
  objc_storeStrong((id *)&v41->__kindsWithDisabledAnimation, v34);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addIndex:", 6332435);
  objc_msgSend(v35, "addIndex:", 6332436);
  objc_msgSend(v35, "addIndex:", 6332438);
  objc_msgSend(v35, "addIndex:", 6332441);
  objc_msgSend(v35, "addIndex:", 6332439);
  objc_storeStrong((id *)&v41->__kindsCoveringContentTiles, v35);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v36 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  -[NSIndexSet addIndex:](v36, "addIndex:", 6332437);
  kindsCenteredOnContentTiles = v41->__kindsCenteredOnContentTiles;
  v41->__kindsCenteredOnContentTiles = v36;

  _Block_object_dispose(&v47, 8);
LABEL_19:

  return v41;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a6;
  v12 = a8;
  if (a3->length - 3 > 2 || a3->index[1] == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  -[PXAssetsTileTransitionCoordinator _kindsWithDisabledAnimation](self, "_kindsWithDisabledAnimation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsIndex:", a3->index[0]) & 1) == 0)
  {

    goto LABEL_7;
  }
  -[PXAssetsTileTransitionCoordinator _tilingChange](self, "_tilingChange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fromLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsTileTransitionCoordinator _tilingChange](self, "_tilingChange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "toLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v17)
  {
LABEL_7:
    -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](self, "_basicAnimationOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v18 = 0;
LABEL_8:

  return v18;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  CGPoint origin;
  CGSize size;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  a6->alpha = 0.0;
  origin = a6->frame.origin;
  size = a6->frame.size;
  v9 = a6->size;
  a3->center = a6->center;
  a3->size = v9;
  a3->frame.origin = origin;
  a3->frame.size = size;
  v10 = *(_OWORD *)&a6->hidden;
  v11 = *(_OWORD *)&a6->contentSize.height;
  v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  v13 = *(_OWORD *)&a6->transform.a;
  v14 = *(_OWORD *)&a6->transform.c;
  v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  CGPoint origin;
  CGSize size;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  a6->alpha = 0.0;
  origin = a6->frame.origin;
  size = a6->frame.size;
  v9 = a6->size;
  a3->center = a6->center;
  a3->size = v9;
  a3->frame.origin = origin;
  a3->frame.size = size;
  v10 = *(_OWORD *)&a6->hidden;
  v11 = *(_OWORD *)&a6->contentSize.height;
  v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  v13 = *(_OWORD *)&a6->transform.a;
  v14 = *(_OWORD *)&a6->transform.c;
  v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (void)disableAnimationsForTileKind:(unint64_t)a3
{
  void *v5;
  NSIndexSet *v6;
  NSIndexSet *kindsWithDisabledAnimation;

  -[PXAssetsTileTransitionCoordinator _kindsWithDisabledAnimation](self, "_kindsWithDisabledAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSIndexSet *)objc_msgSend(v5, "mutableCopy");

  -[NSIndexSet addIndex:](v6, "addIndex:", a3);
  kindsWithDisabledAnimation = self->__kindsWithDisabledAnimation;
  self->__kindsWithDisabledAnimation = v6;

}

- (void)enableAnimationsForTileKind:(unint64_t)a3
{
  void *v5;
  NSIndexSet *v6;
  NSIndexSet *kindsWithDisabledAnimation;

  -[PXAssetsTileTransitionCoordinator _kindsWithDisabledAnimation](self, "_kindsWithDisabledAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSIndexSet *)objc_msgSend(v5, "mutableCopy");

  -[NSIndexSet removeIndex:](v6, "removeIndex:", a3);
  kindsWithDisabledAnimation = self->__kindsWithDisabledAnimation;
  self->__kindsWithDisabledAnimation = v6;

}

- (BOOL)treatRemovalsAsDeletes
{
  return self->_treatRemovalsAsDeletes;
}

- (void)setTreatRemovalsAsDeletes:(BOOL)a3
{
  self->_treatRemovalsAsDeletes = a3;
}

- (BOOL)delayInsertions
{
  return self->_delayInsertions;
}

- (void)setDelayInsertions:(BOOL)a3
{
  self->_delayInsertions = a3;
}

- (PXTilingChange)_tilingChange
{
  return self->__tilingChange;
}

- (PXBasicTileAnimationOptions)_basicAnimationOptions
{
  return self->__basicAnimationOptions;
}

- (BOOL)_shouldCrossfade
{
  return self->__shouldCrossfade;
}

- (PXSectionedChangeDetailsRepository)_changeHistory
{
  return self->__changeHistory;
}

- (NSArray)_changeDetails
{
  return self->__changeDetails;
}

- (NSIndexSet)_kindsWithDisabledAnimation
{
  return self->__kindsWithDisabledAnimation;
}

- (NSIndexSet)_kindsCoveringContentTiles
{
  return self->__kindsCoveringContentTiles;
}

- (NSIndexSet)_kindsCenteredOnContentTiles
{
  return self->__kindsCenteredOnContentTiles;
}

- (PXAssetsTilingLayout)_fromLayout
{
  return self->__fromLayout;
}

- (PXAssetsTilingLayout)_toLayout
{
  return self->__toLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__toLayout, 0);
  objc_storeStrong((id *)&self->__fromLayout, 0);
  objc_storeStrong((id *)&self->__kindsCenteredOnContentTiles, 0);
  objc_storeStrong((id *)&self->__kindsCoveringContentTiles, 0);
  objc_storeStrong((id *)&self->__kindsWithDisabledAnimation, 0);
  objc_storeStrong((id *)&self->__changeDetails, 0);
  objc_storeStrong((id *)&self->__changeHistory, 0);
  objc_storeStrong((id *)&self->__basicAnimationOptions, 0);
  objc_storeStrong((id *)&self->__tilingChange, 0);
}

void __72__PXAssetsTileTransitionCoordinator_initWithTilingChange_changeHistory___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (id)transitionCoordinatorForChange:(id)a3 changeHistory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PXAssetsDataSourceChangeTransitionCoordinator *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "fromLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = -[PXAssetsTileTransitionCoordinator initWithTilingChange:changeHistory:]([PXAssetsTileTransitionCoordinator alloc], "initWithTilingChange:changeHistory:", v5, v6);

    objc_msgSend(v5, "fromReferenceSize");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v5, "toReferenceSize");
    if (v14 != v18 || v16 != v17)
      v12->super.__shouldCrossfade = 1;
  }
  else
  {
    v12 = -[PXAssetsDataSourceChangeTransitionCoordinator initWithTilingChange:changeHistory:]([PXAssetsDataSourceChangeTransitionCoordinator alloc], "initWithTilingChange:changeHistory:", v5, v6);

  }
  return v12;
}

@end
