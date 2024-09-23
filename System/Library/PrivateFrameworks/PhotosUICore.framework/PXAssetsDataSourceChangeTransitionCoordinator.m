@implementation PXAssetsDataSourceChangeTransitionCoordinator

- (PXAssetsDataSourceChangeTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4
{
  PXAssetsDataSourceChangeTransitionCoordinator *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *overrideInitialGeometryByTileIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *overrideFinalGeometryByTileIdentifier;
  void *v9;
  uint64_t v10;
  PXBasicTileAnimationOptions *deleteAnimationOptions;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  v4 = -[PXAssetsTileTransitionCoordinator initWithTilingChange:changeHistory:](&v13, sel_initWithTilingChange_changeHistory_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    overrideInitialGeometryByTileIdentifier = v4->_overrideInitialGeometryByTileIdentifier;
    v4->_overrideInitialGeometryByTileIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    overrideFinalGeometryByTileIdentifier = v4->_overrideFinalGeometryByTileIdentifier;
    v4->_overrideFinalGeometryByTileIdentifier = v7;

    -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](v4, "_basicAnimationOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    deleteAnimationOptions = v4->_deleteAnimationOptions;
    v4->_deleteAnimationOptions = (PXBasicTileAnimationOptions *)v10;

    -[PXBasicTileAnimationOptions setStyle:](v4->_deleteAnimationOptions, "setStyle:", 1);
    -[PXAssetsDataSourceChangeTransitionCoordinator _updateAnimationDelay](v4, "_updateAnimationDelay");
  }
  return v4;
}

- (void)_updateAnimationDelay
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  PXBasicTileAnimationOptions *v9;
  PXBasicTileAnimationOptions *insertAnimationOptions;
  PXBasicTileAnimationOptions *v11;
  double v12;
  id v13;

  v3 = -[PXAssetsTileTransitionCoordinator treatRemovalsAsDeletes](self, "treatRemovalsAsDeletes");
  -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](self, "_basicAnimationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](self, "_basicAnimationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duration");
    objc_msgSend(v5, "setDelay:", v7 * 0.5);

  }
  else
  {
    objc_msgSend(v4, "setDelay:", 0.0);
  }

  -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](self, "_basicAnimationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (PXBasicTileAnimationOptions *)objc_msgSend(v8, "copy");
  insertAnimationOptions = self->_insertAnimationOptions;
  self->_insertAnimationOptions = v9;

  if (-[PXAssetsTileTransitionCoordinator delayInsertions](self, "delayInsertions"))
  {
    v11 = self->_insertAnimationOptions;
    -[PXAssetsTileTransitionCoordinator _basicAnimationOptions](self, "_basicAnimationOptions");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    -[PXBasicTileAnimationOptions setDelay:](v11, "setDelay:", v12 * 0.5);

  }
}

- (void)setTreatRemovalsAsDeletes:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PXAssetsTileTransitionCoordinator treatRemovalsAsDeletes](self, "treatRemovalsAsDeletes");
  v6.receiver = self;
  v6.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  -[PXAssetsTileTransitionCoordinator setTreatRemovalsAsDeletes:](&v6, sel_setTreatRemovalsAsDeletes_, v3);
  if (v5 != v3)
    -[PXAssetsDataSourceChangeTransitionCoordinator _updateAnimationDelay](self, "_updateAnimationDelay");
}

- (void)setDelayInsertions:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PXAssetsTileTransitionCoordinator delayInsertions](self, "delayInsertions");
  v6.receiver = self;
  v6.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  -[PXAssetsTileTransitionCoordinator setDelayInsertions:](&v6, sel_setDelayInsertions_, v3);
  if (v5 != v3)
    -[PXAssetsDataSourceChangeTransitionCoordinator _updateAnimationDelay](self, "_updateAnimationDelay");
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGSize size;
  CGSize v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGSize v23;
  CGSize v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int *v34;
  id v35;
  void *v36;
  CGPoint origin;
  CGSize v39;
  CGPoint center;
  CGSize v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[12];
  _OWORD v51[5];
  unint64_t v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  v11 = *(_OWORD *)&a3->index[5];
  v51[2] = *(_OWORD *)&a3->index[3];
  v51[3] = v11;
  v51[4] = *(_OWORD *)&a3->index[7];
  v52 = a3->index[9];
  v12 = *(_OWORD *)&a3->index[1];
  v51[0] = *(_OWORD *)&a3->length;
  v51[1] = v12;
  v13 = *(_OWORD *)&a5->contentSize.height;
  v50[8] = *(_OWORD *)&a5->hidden;
  v50[9] = v13;
  v14 = *(_OWORD *)&a5->contentsRect.size.height;
  v50[10] = *(_OWORD *)&a5->contentsRect.origin.y;
  v50[11] = v14;
  v15 = *(_OWORD *)&a5->transform.c;
  v50[4] = *(_OWORD *)&a5->transform.a;
  v50[5] = v15;
  v16 = *(_OWORD *)&a5->alpha;
  v50[6] = *(_OWORD *)&a5->transform.tx;
  v50[7] = v16;
  size = a5->frame.size;
  v50[0] = a5->frame.origin;
  v50[1] = size;
  v18 = a5->size;
  v50[2] = a5->center;
  v50[3] = v18;
  v19 = *(_OWORD *)&a7->contentSize.height;
  v46 = *(_OWORD *)&a7->hidden;
  v47 = v19;
  v20 = *(_OWORD *)&a7->contentsRect.size.height;
  v48 = *(_OWORD *)&a7->contentsRect.origin.y;
  v49 = v20;
  v21 = *(_OWORD *)&a7->transform.c;
  v42 = *(_OWORD *)&a7->transform.a;
  v43 = v21;
  v22 = *(_OWORD *)&a7->alpha;
  v44 = *(_OWORD *)&a7->transform.tx;
  v45 = v22;
  v23 = a7->frame.size;
  origin = a7->frame.origin;
  v39 = v23;
  v24 = a7->size;
  center = a7->center;
  v41 = v24;
  -[PXAssetsTileTransitionCoordinator optionsForAnimatingTileWithIdentifier:animationType:fromGeometry:fromUserData:toGeometry:toUserData:](&v53, sel_optionsForAnimatingTileWithIdentifier_animationType_fromGeometry_fromUserData_toGeometry_toUserData_, v51, a4, v50, a6, &origin, a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->length - 3 <= 2)
  {
    v26 = a3->index[1];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = a3->index[2];
      v27 = a3->index[3];
      v29 = a3->index[4];
      LOBYTE(v51[0]) = 0;
      if (a4 == 1)
      {
        -[PXAssetsTileTransitionCoordinator _changeDetails](self, "_changeDetails");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&origin.x = v26;
        *(_QWORD *)&origin.y = v28;
        *(_QWORD *)&v39.width = v27;
        *(_QWORD *)&v39.height = v29;
        objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:", v33, &origin, v51, 0);

        if (LOBYTE(v51[0]))
        {
          v34 = &OBJC_IVAR___PXAssetsDataSourceChangeTransitionCoordinator__insertAnimationOptions;
LABEL_9:
          v35 = *(id *)((char *)&self->super.super.isa + *v34);
LABEL_16:

          v25 = v35;
          return v25;
        }
LABEL_15:
        v35 = 0;
        goto LABEL_16;
      }
      if (a4 == 3)
      {
        -[PXAssetsTileTransitionCoordinator _toLayout](self, "_toLayout");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dataSource");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "identifier");

        if (v26 == v32)
        {
          LOBYTE(v51[0]) = 1;
        }
        else
        {
          -[PXAssetsTileTransitionCoordinator _changeDetails](self, "_changeDetails");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&origin.x = v26;
          *(_QWORD *)&origin.y = v28;
          *(_QWORD *)&v39.width = v27;
          *(_QWORD *)&v39.height = v29;
          objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v36, &origin, v51, 0);

          if (!LOBYTE(v51[0]))
            goto LABEL_15;
        }
        if (-[PXAssetsTileTransitionCoordinator treatRemovalsAsDeletes](self, "treatRemovalsAsDeletes"))
        {
          if (a3->length == 5 && a3->index[0] == 6432423)
          {
            v34 = &OBJC_IVAR___PXAssetsDataSourceChangeTransitionCoordinator__deleteAnimationOptions;
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
    }
  }
  return v25;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12;
  NSMutableDictionary *overrideInitialGeometryByTileIdentifier;
  CGSize v14;
  CGSize v15;
  void *v16;
  void *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGSize v23;
  CGSize v24;
  unint64_t v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGSize v38;
  CGSize v39;
  void *v40;
  int v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CGSize v50;
  CGSize v51;
  BOOL v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGSize v59;
  CGSize v60;
  id *v62;
  id *v63;
  id v64;
  CGPoint v65;
  __int128 v66;
  objc_super v67;
  __int128 v68;
  _BYTE v69[32];
  __int128 v70;
  __int128 v71;
  unint64_t v72;
  _OWORD v73[2];
  CGPoint origin;
  CGSize v75;
  CGPoint center;
  CGSize size;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;

  v12 = a7;
  if (-[NSMutableDictionary count](self->_overrideInitialGeometryByTileIdentifier, "count"))
  {
    overrideInitialGeometryByTileIdentifier = self->_overrideInitialGeometryByTileIdentifier;
    v14 = *(CGSize *)&a5->index[5];
    center = *(CGPoint *)&a5->index[3];
    size = v14;
    v78 = *(_OWORD *)&a5->index[7];
    *(_QWORD *)&v79 = a5->index[9];
    v15 = *(CGSize *)&a5->index[1];
    origin = *(CGPoint *)&a5->length;
    v75 = v15;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileIdentifier:", &origin);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](overrideInitialGeometryByTileIdentifier, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17 != 0;
    if (v17)
    {
      objc_msgSend(v17, "PXTileGeometryValue");
      v19 = v83;
      *(_OWORD *)&a3->hidden = v82;
      *(_OWORD *)&a3->contentSize.height = v19;
      v20 = v85;
      *(_OWORD *)&a3->contentsRect.origin.y = v84;
      *(_OWORD *)&a3->contentsRect.size.height = v20;
      v21 = v79;
      *(_OWORD *)&a3->transform.a = v78;
      *(_OWORD *)&a3->transform.c = v21;
      v22 = v81;
      *(_OWORD *)&a3->transform.tx = v80;
      *(_OWORD *)&a3->alpha = v22;
      v23 = v75;
      a3->frame.origin = origin;
      a3->frame.size = v23;
      v24 = size;
      a3->center = center;
      a3->size = v24;
    }

  }
  else
  {
    v18 = 0;
  }
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5->length - 3 <= 2 && a5->index[1] != 0x7FFFFFFFFFFFFFFFLL)
    v25 = a5->index[0];
  -[PXAssetsTileTransitionCoordinator _kindsCoveringContentTiles](self, "_kindsCoveringContentTiles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsIndex:", v25);

  -[PXAssetsTileTransitionCoordinator _kindsCenteredOnContentTiles](self, "_kindsCenteredOnContentTiles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "containsIndex:", v25);

  if ((v27 & 1) != 0 || v29)
  {
    v62 = a4;
    v64 = v12;
    v65 = *(CGPoint *)&a5->index[1];
    v31 = a5->index[3];
    v30 = a5->index[4];
    memset(v73, 0, sizeof(v73));
    -[PXAssetsTileTransitionCoordinator _changeDetails](self, "_changeDetails", v62);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    origin = v65;
    *(_QWORD *)&v75.width = v31;
    *(_QWORD *)&v75.height = v30;
    objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:", v32, &origin, 0, 0);

    if (!*(_QWORD *)off_1E50B7E98)
      goto LABEL_18;
    v66 = *(_OWORD *)((char *)v73 + 8);
    v33 = *((_QWORD *)&v73[1] + 1);
    v34 = *((_OWORD *)off_1E50B8940 + 9);
    v82 = *((_OWORD *)off_1E50B8940 + 8);
    v83 = v34;
    v35 = *((_OWORD *)off_1E50B8940 + 11);
    v84 = *((_OWORD *)off_1E50B8940 + 10);
    v85 = v35;
    v36 = *((_OWORD *)off_1E50B8940 + 5);
    v78 = *((_OWORD *)off_1E50B8940 + 4);
    v79 = v36;
    v37 = *((_OWORD *)off_1E50B8940 + 7);
    v80 = *((_OWORD *)off_1E50B8940 + 6);
    v81 = v37;
    v38 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
    origin = *(CGPoint *)off_1E50B8940;
    v75 = v38;
    v39 = (CGSize)*((_OWORD *)off_1E50B8940 + 3);
    center = (CGPoint)*((_OWORD *)off_1E50B8940 + 2);
    size = v39;
    -[PXAssetsTileTransitionCoordinator _fromLayout](self, "_fromLayout");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = xmmword_1A7C0C200;
    *(_QWORD *)v69 = 0;
    *(_OWORD *)&v69[8] = v66;
    *(_QWORD *)&v69[24] = v33;
    v70 = 0u;
    v71 = 0u;
    v72 = 0;
    v41 = objc_msgSend(v40, "getGeometry:group:userData:forTileWithIdentifier:", &origin, 0, 0, &v68);

    if (v41)
    {
      *(_QWORD *)&v81 = 0;
      *((_QWORD *)&v81 + 1) = *(_QWORD *)&a6->zPosition;
      if (v29)
      {
        size = a6->size;
        PXRectWithCenterAndSize();
        origin.x = v42;
        origin.y = v43;
        v75.width = v44;
        v75.height = v45;
      }
      v46 = v83;
      *(_OWORD *)&a3->hidden = v82;
      *(_OWORD *)&a3->contentSize.height = v46;
      v47 = v85;
      *(_OWORD *)&a3->contentsRect.origin.y = v84;
      *(_OWORD *)&a3->contentsRect.size.height = v47;
      v48 = v79;
      *(_OWORD *)&a3->transform.a = v78;
      *(_OWORD *)&a3->transform.c = v48;
      v49 = v81;
      *(_OWORD *)&a3->transform.tx = v80;
      *(_OWORD *)&a3->alpha = v49;
      v50 = v75;
      a3->frame.origin = origin;
      a3->frame.size = v50;
      v51 = size;
      a3->center = center;
      a3->size = v51;
      v12 = v64;
      *v63 = objc_retainAutorelease(v64);
    }
    else
    {
LABEL_18:
      a4 = v63;
      v12 = v64;
      if (!v18)
      {
LABEL_20:
        v67.receiver = self;
        v67.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
        v53 = *(_OWORD *)&a5->index[5];
        *(_OWORD *)&v69[16] = *(_OWORD *)&a5->index[3];
        v70 = v53;
        v71 = *(_OWORD *)&a5->index[7];
        v72 = a5->index[9];
        v54 = *(_OWORD *)&a5->index[1];
        v68 = *(_OWORD *)&a5->length;
        *(_OWORD *)v69 = v54;
        v55 = *(_OWORD *)&a6->contentSize.height;
        v82 = *(_OWORD *)&a6->hidden;
        v83 = v55;
        v56 = *(_OWORD *)&a6->contentsRect.size.height;
        v84 = *(_OWORD *)&a6->contentsRect.origin.y;
        v85 = v56;
        v57 = *(_OWORD *)&a6->transform.c;
        v78 = *(_OWORD *)&a6->transform.a;
        v79 = v57;
        v58 = *(_OWORD *)&a6->alpha;
        v80 = *(_OWORD *)&a6->transform.tx;
        v81 = v58;
        v59 = a6->frame.size;
        origin = a6->frame.origin;
        v75 = v59;
        v60 = a6->size;
        center = a6->center;
        size = v60;
        v52 = -[PXAssetsTileTransitionCoordinator getInitialGeometry:initialUserData:forAppearingTileWithIdentifier:toGeometry:toUserData:](&v67, sel_getInitialGeometry_initialUserData_forAppearingTileWithIdentifier_toGeometry_toUserData_, a3, a4, &v68, &origin, v12);
        goto LABEL_21;
      }
    }
  }
  else if (!v18)
  {
    goto LABEL_20;
  }
  v52 = 1;
LABEL_21:

  return v52;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  NSMutableDictionary *overrideFinalGeometryByTileIdentifier;
  CGSize v12;
  CGSize v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGSize v21;
  CGSize v22;
  unint64_t v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGSize v37;
  CGSize v38;
  void *v39;
  int v40;
  void *v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGSize v51;
  CGSize v52;
  void *v53;
  BOOL v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGSize size;
  CGSize v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  id v69;
  objc_super v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  unint64_t v76;
  CGPoint origin;
  CGSize v78;
  CGPoint center;
  CGSize v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;

  v69 = a7;
  if (-[NSMutableDictionary count](self->_overrideFinalGeometryByTileIdentifier, "count"))
  {
    overrideFinalGeometryByTileIdentifier = self->_overrideFinalGeometryByTileIdentifier;
    v12 = *(CGSize *)&a5->index[5];
    center = *(CGPoint *)&a5->index[3];
    v80 = v12;
    v81 = *(_OWORD *)&a5->index[7];
    *(_QWORD *)&v82 = a5->index[9];
    v13 = *(CGSize *)&a5->index[1];
    origin = *(CGPoint *)&a5->length;
    v78 = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileIdentifier:", &origin);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](overrideFinalGeometryByTileIdentifier, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15 != 0;
    if (v15)
    {
      objc_msgSend(v15, "PXTileGeometryValue");
      v17 = v86;
      *(_OWORD *)&a3->hidden = v85;
      *(_OWORD *)&a3->contentSize.height = v17;
      v18 = v88;
      *(_OWORD *)&a3->contentsRect.origin.y = v87;
      *(_OWORD *)&a3->contentsRect.size.height = v18;
      v19 = v82;
      *(_OWORD *)&a3->transform.a = v81;
      *(_OWORD *)&a3->transform.c = v19;
      v20 = v84;
      *(_OWORD *)&a3->transform.tx = v83;
      *(_OWORD *)&a3->alpha = v20;
      v21 = v78;
      a3->frame.origin = origin;
      a3->frame.size = v21;
      v22 = v80;
      a3->center = center;
      a3->size = v22;
    }

  }
  else
  {
    v16 = 0;
  }
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5->length - 3 <= 2 && a5->index[1] != 0x7FFFFFFFFFFFFFFFLL)
    v23 = a5->index[0];
  -[PXAssetsTileTransitionCoordinator _kindsCoveringContentTiles](self, "_kindsCoveringContentTiles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsIndex:", v23);

  -[PXAssetsTileTransitionCoordinator _kindsCenteredOnContentTiles](self, "_kindsCenteredOnContentTiles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsIndex:", v23);

  if ((v25 & 1) == 0 && !v27)
    goto LABEL_17;
  v28 = a5->index[1];
  -[PXAssetsTileTransitionCoordinator _toLayout](self, "_toLayout", a5->index[4], a5->index[3], a5->index[2]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v16;
  v31 = objc_msgSend(v30, "identifier");

  v32 = v28 == v31;
  v16 = v67;
  if (!v32)
  {
LABEL_17:
    if (v16)
    {
LABEL_18:
      v54 = 1;
      v53 = v69;
      goto LABEL_21;
    }
LABEL_20:
    v70.receiver = self;
    v70.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
    v55 = *(_OWORD *)&a5->index[5];
    v73 = *(_OWORD *)&a5->index[3];
    v74 = v55;
    v75 = *(_OWORD *)&a5->index[7];
    v76 = a5->index[9];
    v56 = *(_OWORD *)&a5->index[1];
    v71 = *(_OWORD *)&a5->length;
    v72 = v56;
    v57 = *(_OWORD *)&a6->contentSize.height;
    v85 = *(_OWORD *)&a6->hidden;
    v86 = v57;
    v58 = *(_OWORD *)&a6->contentsRect.size.height;
    v87 = *(_OWORD *)&a6->contentsRect.origin.y;
    v88 = v58;
    v59 = *(_OWORD *)&a6->transform.c;
    v81 = *(_OWORD *)&a6->transform.a;
    v82 = v59;
    v60 = *(_OWORD *)&a6->alpha;
    v83 = *(_OWORD *)&a6->transform.tx;
    v84 = v60;
    size = a6->frame.size;
    origin = a6->frame.origin;
    v78 = size;
    v62 = a6->size;
    center = a6->center;
    v80 = v62;
    v53 = v69;
    v54 = -[PXAssetsTileTransitionCoordinator getFinalGeometry:finalUserData:forDisappearingTileWithIdentifier:fromGeometry:fromUserData:](&v70, sel_getFinalGeometry_finalUserData_forDisappearingTileWithIdentifier_fromGeometry_fromUserData_, a3, a4, &v71, &origin, v69);
    goto LABEL_21;
  }
  v33 = *((_OWORD *)off_1E50B8940 + 9);
  v85 = *((_OWORD *)off_1E50B8940 + 8);
  v86 = v33;
  v34 = *((_OWORD *)off_1E50B8940 + 11);
  v87 = *((_OWORD *)off_1E50B8940 + 10);
  v88 = v34;
  v35 = *((_OWORD *)off_1E50B8940 + 5);
  v81 = *((_OWORD *)off_1E50B8940 + 4);
  v82 = v35;
  v36 = *((_OWORD *)off_1E50B8940 + 7);
  v83 = *((_OWORD *)off_1E50B8940 + 6);
  v84 = v36;
  v37 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
  origin = *(CGPoint *)off_1E50B8940;
  v78 = v37;
  v38 = (CGSize)*((_OWORD *)off_1E50B8940 + 3);
  center = (CGPoint)*((_OWORD *)off_1E50B8940 + 2);
  v80 = v38;
  -[PXAssetsTileTransitionCoordinator _toLayout](self, "_toLayout");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = xmmword_1A7C0C200;
  *(_QWORD *)&v72 = v28;
  *((_QWORD *)&v72 + 1) = v66;
  *(_QWORD *)&v73 = v65;
  *((_QWORD *)&v73 + 1) = v64;
  v74 = 0u;
  v75 = 0u;
  v76 = 0;
  v40 = objc_msgSend(v39, "getGeometry:group:userData:forTileWithIdentifier:", &origin, 0, 0, &v71);

  if (!v40)
  {
    if (v67)
      goto LABEL_18;
    goto LABEL_20;
  }
  *(_QWORD *)&v84 = 0;
  -[PXAssetsTileTransitionCoordinator _toLayout](self, "_toLayout");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "zPositionOffsetForKind:", v23);
  *((double *)&v84 + 1) = v42 + *((double *)&v84 + 1);

  if (v27)
  {
    v80 = a6->size;
    PXRectWithCenterAndSize();
    origin.x = v43;
    origin.y = v44;
    v78.width = v45;
    v78.height = v46;
  }
  v47 = v86;
  *(_OWORD *)&a3->hidden = v85;
  *(_OWORD *)&a3->contentSize.height = v47;
  v48 = v88;
  *(_OWORD *)&a3->contentsRect.origin.y = v87;
  *(_OWORD *)&a3->contentsRect.size.height = v48;
  v49 = v82;
  *(_OWORD *)&a3->transform.a = v81;
  *(_OWORD *)&a3->transform.c = v49;
  v50 = v84;
  *(_OWORD *)&a3->transform.tx = v83;
  *(_OWORD *)&a3->alpha = v50;
  v51 = v78;
  a3->frame.origin = origin;
  a3->frame.size = v51;
  v52 = v80;
  a3->center = center;
  a3->size = v52;
  v53 = v69;
  *a4 = objc_retainAutorelease(v69);
  v54 = 1;
LABEL_21:

  return v54;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12;
  id v13;
  CGSize v14;
  CGSize v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGSize size;
  CGSize v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGSize v26;
  CGSize v27;
  unsigned __int8 v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGSize v47;
  CGSize v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CGSize v54;
  CGSize v55;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  uint64_t v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  CGSize v71;
  CGSize v72;
  void *v73;
  CGRect v75;
  CGPoint v76;
  CGSize v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CGRect v86;
  unsigned __int128 v87;
  CGSize v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CGRect v97;
  unsigned __int128 center;
  CGSize v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  objc_super v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  v12 = a5;
  v13 = a7;
  v108.receiver = self;
  v108.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  v14 = *(CGSize *)&a3->index[5];
  v76 = *(CGPoint *)&a3->index[3];
  v77 = v14;
  v78 = *(_OWORD *)&a3->index[7];
  *(_QWORD *)&v79 = a3->index[9];
  v15 = *(CGSize *)&a3->index[1];
  v75.origin = *(CGPoint *)&a3->length;
  v75.size = v15;
  v16 = *(_OWORD *)&a4->contentSize.height;
  v104 = *(_OWORD *)&a4->hidden;
  v105 = v16;
  v17 = *(_OWORD *)&a4->contentsRect.size.height;
  v106 = *(_OWORD *)&a4->contentsRect.origin.y;
  v107 = v17;
  v18 = *(_OWORD *)&a4->transform.c;
  v100 = *(_OWORD *)&a4->transform.a;
  v101 = v18;
  v19 = *(_OWORD *)&a4->alpha;
  v102 = *(_OWORD *)&a4->transform.tx;
  v103 = v19;
  size = a4->frame.size;
  v97.origin = a4->frame.origin;
  v97.size = size;
  v21 = a4->size;
  center = (unsigned __int128)a4->center;
  v99 = v21;
  v22 = *(_OWORD *)&a6->contentSize.height;
  v93 = *(_OWORD *)&a6->hidden;
  v94 = v22;
  v23 = *(_OWORD *)&a6->contentsRect.size.height;
  v95 = *(_OWORD *)&a6->contentsRect.origin.y;
  v96 = v23;
  v24 = *(_OWORD *)&a6->transform.c;
  v89 = *(_OWORD *)&a6->transform.a;
  v90 = v24;
  v25 = *(_OWORD *)&a6->alpha;
  v91 = *(_OWORD *)&a6->transform.tx;
  v92 = v25;
  v26 = a6->frame.size;
  v86.origin = a6->frame.origin;
  v86.size = v26;
  v27 = a6->size;
  v87 = (unsigned __int128)a6->center;
  v88 = v27;
  v28 = -[PXAssetsTileTransitionCoordinator useDoubleSidedAnimationForUpdatedTileWithIdentifier:fromGeometry:fromUserData:toGeometry:toUserData:](&v108, sel_useDoubleSidedAnimationForUpdatedTileWithIdentifier_fromGeometry_fromUserData_toGeometry_toUserData_, &v75, &v97, v12, &v86, v13);
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = a3->index[0];
    if (v29 == 6332437)
    {
      v28 = a4->size.height != a6->size.height || a4->size.width != a6->size.width;
    }
    else if (v29 == 6332435)
    {
      v30 = v13;
      if ((v28 & 1) != 0)
      {
        v28 = 1;
      }
      else
      {
        v31 = objc_msgSend(v12, "badgeOptions");
        v28 = v31 != objc_msgSend(v30, "badgeOptions");
      }

    }
  }
  -[PXAssetsTileTransitionCoordinator _toLayout](self, "_toLayout");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "visibleRect");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  center = 0u;
  v99 = (CGSize)0;
  memset(&v97, 0, sizeof(v97));
  v42 = objc_msgSend(v32, "coordinateSpaceIdentifier");
  if (v41)
  {
    v43 = *(_OWORD *)&a4->contentSize.height;
    v93 = *(_OWORD *)&a4->hidden;
    v94 = v43;
    v44 = *(_OWORD *)&a4->contentsRect.size.height;
    v95 = *(_OWORD *)&a4->contentsRect.origin.y;
    v96 = v44;
    v45 = *(_OWORD *)&a4->transform.c;
    v89 = *(_OWORD *)&a4->transform.a;
    v90 = v45;
    v46 = *(_OWORD *)&a4->alpha;
    v91 = *(_OWORD *)&a4->transform.tx;
    v92 = v46;
    v47 = a4->frame.size;
    v86.origin = a4->frame.origin;
    v86.size = v47;
    v48 = a4->size;
    v87 = (unsigned __int128)a4->center;
    v88 = v48;
    objc_msgSend(v41, "convertTileGeometry:toCoordinateSpaceIdentifier:", &v86, v42);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = (CGSize)0;
    memset(&v86, 0, sizeof(v86));
    v49 = objc_msgSend(v32, "coordinateSpaceIdentifier");
    v50 = *(_OWORD *)&a6->contentSize.height;
    v82 = *(_OWORD *)&a6->hidden;
    v83 = v50;
    v51 = *(_OWORD *)&a6->contentsRect.size.height;
    v84 = *(_OWORD *)&a6->contentsRect.origin.y;
    v85 = v51;
    v52 = *(_OWORD *)&a6->transform.c;
    v78 = *(_OWORD *)&a6->transform.a;
    v79 = v52;
    v53 = *(_OWORD *)&a6->alpha;
    v80 = *(_OWORD *)&a6->transform.tx;
    v81 = v53;
    v54 = a6->frame.size;
    v75.origin = a6->frame.origin;
    v75.size = v54;
    v55 = a6->size;
    v76 = a6->center;
    v77 = v55;
    objc_msgSend(v41, "convertTileGeometry:toCoordinateSpaceIdentifier:", &v75, v49);
    y = v86.origin.y;
    x = v86.origin.x;
    height = v86.size.height;
    width = v86.size.width;
  }
  else
  {
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    center = 0u;
    v99 = (CGSize)0;
    memset(&v97, 0, sizeof(v97));
    objc_msgSend(v32, "coordinateSpaceIdentifier");
    memset(&v86, 0, sizeof(v86));
    v87 = 0u;
    v88 = (CGSize)0;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    height = 0.0;
    width = 0.0;
    y = 0.0;
    v95 = 0u;
    v96 = 0u;
    x = 0.0;
  }
  v109.origin.x = v34;
  v109.origin.y = v36;
  v109.size.width = v38;
  v109.size.height = v40;
  if (CGRectIntersectsRect(v109, *(CGRect *)&x)
    && (v110.origin.x = v34,
        v110.origin.y = v36,
        v110.size.width = v38,
        v110.size.height = v40,
        !CGRectIntersectsRect(v110, v97)))
  {
    v115.origin.x = v34;
    v115.origin.y = v36;
    v115.size.width = v38;
    v115.size.height = v40;
    v116 = CGRectInset(v115, -(v97.size.width * 0.5 + 500.0), -(v97.size.height * 0.5 + 500.0));
    if (!CGRectContainsPoint(v116, (CGPoint)center))
    {
      PXRectClampPoint();
      *(CGFloat *)&center = v66;
      *((CGFloat *)&center + 1) = v67;
      PXPointSubtract();
      PXPointAdd();
      v97.origin.x = v68;
      v97.origin.y = v69;
      v82 = v104;
      v83 = v105;
      v84 = v106;
      v85 = v107;
      v78 = v100;
      v79 = v101;
      v80 = v102;
      v81 = v103;
      v75 = v97;
      v76 = (CGPoint)center;
      v77 = v99;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileGeometry:", &v75);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 104;
      goto LABEL_23;
    }
  }
  else
  {
    v111.origin.x = v34;
    v111.origin.y = v36;
    v111.size.width = v38;
    v111.size.height = v40;
    if (CGRectIntersectsRect(v111, v97))
    {
      v112.origin.x = v34;
      v112.origin.y = v36;
      v112.size.width = v38;
      v112.size.height = v40;
      if (!CGRectIntersectsRect(v112, v86))
      {
        v113.origin.x = v34;
        v113.origin.y = v36;
        v113.size.width = v38;
        v113.size.height = v40;
        v114 = CGRectInset(v113, -(v86.size.width * 0.5 + 500.0), -(v86.size.height * 0.5 + 500.0));
        if (!CGRectContainsPoint(v114, (CGPoint)v87))
        {
          PXRectClampPoint();
          *(CGFloat *)&v87 = v60;
          *((CGFloat *)&v87 + 1) = v61;
          PXPointSubtract();
          PXPointAdd();
          v86.origin.x = v62;
          v86.origin.y = v63;
          v82 = v93;
          v83 = v94;
          v84 = v95;
          v85 = v96;
          v78 = v89;
          v79 = v90;
          v80 = v91;
          v81 = v92;
          v75 = v86;
          v76 = (CGPoint)v87;
          v77 = v88;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileGeometry:", &v75);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 112;
LABEL_23:
          v70 = *(Class *)((char *)&self->super.super.isa + v65);
          v71 = *(CGSize *)&a3->index[5];
          v76 = *(CGPoint *)&a3->index[3];
          v77 = v71;
          v78 = *(_OWORD *)&a3->index[7];
          *(_QWORD *)&v79 = a3->index[9];
          v72 = *(CGSize *)&a3->index[1];
          v75.origin = *(CGPoint *)&a3->length;
          v75.size = v72;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXTileIdentifier:", &v75);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v64, v73);

          v28 = 1;
        }
      }
    }
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFinalGeometryByTileIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideInitialGeometryByTileIdentifier, 0);
  objc_storeStrong((id *)&self->_insertAnimationOptions, 0);
  objc_storeStrong((id *)&self->_deleteAnimationOptions, 0);
}

@end
