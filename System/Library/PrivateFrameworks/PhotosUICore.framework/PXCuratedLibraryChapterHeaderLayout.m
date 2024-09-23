@implementation PXCuratedLibraryChapterHeaderLayout

- (PXCuratedLibraryChapterHeaderLayout)init
{
  PXCuratedLibraryChapterHeaderLayout *v2;
  PXCuratedLibraryChapterHeaderLayout *v3;
  NSArray *itemIdentifierBySpriteIndex;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *axSpriteIndexes;
  uint64_t v7;
  PXNumberAnimator *alternateAppearanceMixAnimator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  v2 = -[PXGLayout init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGLayout setContentSource:](v2, "setContentSource:", v2);
    v3->_attributedTitleSize = *(CGSize *)off_1E50B8810;
    v3->_chevronSize = (CGSize)xmmword_1A7C0C260;
    itemIdentifierBySpriteIndex = v3->_itemIdentifierBySpriteIndex;
    v3->_itemIdentifierBySpriteIndex = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = v5;

    v7 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:epsilon:", 0.0, 0.01);
    alternateAppearanceMixAnimator = v3->_alternateAppearanceMixAnimator;
    v3->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v7;

    -[PXNumberAnimator registerChangeObserver:context:](v3->_alternateAppearanceMixAnimator, "registerChangeObserver:context:", v3, AlternateAppearanceMixAnimatorObservationContext_98252);
    if (init_onceToken_98292 != -1)
      dispatch_once(&init_onceToken_98292, &__block_literal_global_98293);
    objc_storeStrong((id *)&v3->_asyncDateQueue, (id)init_asyncDateQueue_98294);
  }
  return v3;
}

- (void)setSpec:(id)a3
{
  PXCuratedLibraryChapterHeaderLayoutSpec *v5;
  char v6;
  PXCuratedLibraryChapterHeaderLayoutSpec *v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  PXCuratedLibraryChapterHeaderLayoutSpec *v13;

  v13 = (PXCuratedLibraryChapterHeaderLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v13)
  {

LABEL_10:
    v7 = v13;
    goto LABEL_11;
  }
  v6 = -[PXCuratedLibraryChapterHeaderLayoutSpec isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 3;
      v7 = v13;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout setSpec:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 105, CFSTR("invalidating %lu after it already has been updated"), 3);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout update]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      -[PXCuratedLibraryChapterHeaderLayout _updateTitle](self, "_updateTitle");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout update]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v5 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      -[PXCuratedLibraryChapterHeaderLayout _updateSprites](self, "_updateSprites");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 116, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout update](&v12, sel_update);
}

- (void)_updateSprites
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  _BOOL4 v24;
  char v25;
  double v26;
  double MaxY;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int64_t alternateAppearanceFadeDirection;
  double v48;
  int64_t v49;
  double v50;
  int v51;
  int64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float v58;
  float v59;
  int v60;
  int v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  char v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  float v76;
  char v77;
  double v78;
  double height;
  CGFloat v80;
  double MaxX;
  double MidY;
  void *v83;
  NSArray **p_itemIdentifierBySpriteIndex;
  char v85;
  void *v86;
  double v87;
  double v88;
  float v89;
  float v90;
  float v91;
  uint64_t v92;
  double v93;
  double v94;
  double width;
  double v96;
  double v97;
  float v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  float v106;
  double v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  _QWORD v112[17];
  __int128 v113;
  __int128 v114;
  float v115;
  float v116;
  float v117;
  float v118;
  char v119;
  char v120;
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[5];
  __int128 v124;
  __int128 v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v124 = 0u;
  v125 = 0u;
  -[PXCuratedLibraryChapterHeaderLayout sectionIndexPath](self, "sectionIndexPath");
  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXGLayout displayScale](self, "displayScale");
  v102 = v7;
  -[PXCuratedLibraryChapterHeaderLayout spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout padding](self, "padding");
  v100 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v101 = *MEMORY[0x1E0C9D538];
  v103 = v6;
  v104 = v4;
  PXEdgeInsetsInsetRect();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PXGLayout visibleRect](self, "visibleRect");
  v18 = v17;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v20 = v18 + v19;
  objc_msgSend(v8, "floatingDistanceFromSafeAreaTop");
  v22 = v21 + v20;
  v23 = objc_msgSend(v8, "shouldFloat");
  v24 = v22 > v12;
  v25 = v23 & v24;
  if ((v23 & v24) != 0)
    v26 = v22;
  else
    v26 = v12;
  v126.origin.x = v10;
  v126.origin.y = v12;
  v126.size.width = v14;
  v126.size.height = v16;
  MaxY = CGRectGetMaxY(v126);
  if (v26 < MaxY)
    MaxY = v26;
  v109 = MaxY;
  objc_msgSend(v8, "titleHeight");
  v29 = v28;
  objc_msgSend(v8, "titleHeight");
  v31 = v30;
  objc_msgSend(v8, "spacingBetweenTitleBottomAndNextCardTop");
  v33 = v32;
  -[PXCuratedLibraryChapterHeaderLayout alternateAppearanceMixAnimator](self, "alternateAppearanceMixAnimator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "shouldFloat");
  v107 = 0.0;
  v36 = MEMORY[0x1E0C809B0];
  if (v35)
  {
    v37 = v22 - v12 - (v31 * 0.5 + v33);
    if (self->_alternateAppearanceFadeDirection)
    {
      objc_msgSend(v8, "floatingAppearanceCrossfadeStartDistance");
      v39 = v38;
      objc_msgSend(v8, "floatingAppearanceCrossfadeDistance");
      v108 = v40;
      objc_msgSend(v8, "floatingAppearanceCrossfadeDuration");
      v97 = v41;
      objc_msgSend(v34, "presentationValue");
      v43 = v42;
      -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
      if (v44 <= 0.0)
      {
        alternateAppearanceFadeDirection = self->_alternateAppearanceFadeDirection;
        if (v39 >= v37)
          v45 = v37;
        else
          v45 = v39;
        if (alternateAppearanceFadeDirection <= 0)
          v45 = v39;
        if (v37 <= v45)
        {
          v48 = 0.0;
          goto LABEL_29;
        }
      }
      else
      {
        v45 = -v39;
        alternateAppearanceFadeDirection = self->_alternateAppearanceFadeDirection;
        if (v37 > -v39 && alternateAppearanceFadeDirection < 0)
          v45 = v37;
        if (v37 >= v45)
        {
          v48 = 1.0;
LABEL_29:
          v52 = -1;
          if (v48 > 0.5)
            v52 = 1;
          v105 = v48;
          if (v52 != alternateAppearanceFadeDirection)
          {
            self->_alternateAppearanceFadeStartThresholdDistance = v45 - v43 * v108;
            self->_alternateAppearanceFadeDirection = v52;
          }
          v51 = 1;
          goto LABEL_34;
        }
      }
      v51 = 0;
      v105 = NAN;
LABEL_34:
      PXClamp();
      PXClamp();
      v54 = v53;
      if (v53 != v43)
      {
        v122[0] = v36;
        v122[1] = 3221225472;
        v122[2] = __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_2;
        v122[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v122[4] = v53;
        objc_msgSend(v34, "performChangesWithoutAnimation:", v122);
      }
      v107 = v54;
      if (v51)
      {
        objc_msgSend(v34, "value");
        if (v55 != v105)
        {
          v121[0] = v36;
          v121[1] = 3221225472;
          v121[2] = __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_3;
          v121[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
          *(double *)&v121[4] = v105;
          objc_msgSend(v34, "performChangesWithDuration:curve:changes:", 1, v121, v97 * vabdd_f64(v105, v54));
        }
      }
      goto LABEL_39;
    }
    v49 = -1;
    if (v37 > 0.0)
      v49 = 1;
    self->_alternateAppearanceFadeDirection = v49;
    v50 = 1.0;
    if (v37 <= 0.0)
      v50 = 0.0;
    v123[0] = v36;
    v123[1] = 3221225472;
    v123[2] = __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke;
    v123[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    v107 = v50;
    *(double *)&v123[4] = v50;
    objc_msgSend(v34, "performChangesWithoutAnimation:", v123);
  }
LABEL_39:
  v99 = v34;
  if ((objc_msgSend(v8, "shouldFloat") & 1) != 0)
  {
    objc_msgSend(v8, "floatingFadeOutDistance");
    v127.origin.x = v10;
    v127.origin.y = v12;
    v127.size.width = v14;
    v127.size.height = v16;
    CGRectGetMaxY(v127);
    v128.origin.x = v10;
    v128.origin.y = v109;
    v128.size.width = v14;
    v128.size.height = v29;
    CGRectGetMinY(v128);
    PXClamp();
    v57 = v56;
  }
  else
  {
    v57 = 1.0;
  }
  v96 = v57;
  v106 = 0.0;
  if (objc_msgSend(v8, "shouldAlwaysShowFloatingVersion"))
  {
    v59 = 0.0;
  }
  else
  {
    v58 = (1.0 - v107) * v57;
    v59 = v58;
  }
  v60 = objc_msgSend(v8, "shouldAlwaysShowFloatingVersion");
  v61 = objc_msgSend(v8, "wantsChevron");
  -[PXCuratedLibraryChapterHeaderLayout attributedTitleSize](self, "attributedTitleSize");
  v63 = v62;
  v110 = v64;
  objc_msgSend(v8, "spacingBetweenTitleAndChevron");
  v66 = v65;
  v67 = -[PXGLayout referenceOptions](self, "referenceOptions");
  objc_msgSend(v8, "contentInset");
  objc_msgSend(v8, "contentInset");
  PXEdgeInsetsInsetRect();
  v72 = v71;
  v73 = v68;
  v74 = v69;
  v75 = v70;
  v98 = v59;
  if ((v67 & 2) != 0)
  {
    v78 = v70 * 3.0;
    width = self->_chevronSize.width;
    v77 = 11;
  }
  else
  {
    v76 = 0.0;
    if (v61)
      v76 = v59;
    v106 = v76;
    v68 = v68 + 0.0;
    width = self->_chevronSize.width;
    if (v63 >= v69 - width - v66)
      v69 = v69 - width - v66;
    else
      v69 = v63;
    v77 = 10;
    v78 = v110;
  }
  height = self->_chevronSize.height;
  v80 = v72;
  v93 = v69;
  v94 = v68;
  v111 = v78;
  MaxX = CGRectGetMaxX(*(CGRect *)(&v68 - 1));
  v129.origin.x = v72;
  v129.origin.y = v73;
  v129.size.width = v74;
  v129.size.height = v75;
  MidY = CGRectGetMidY(v129);
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(v83, "addObject:", CFSTR("PXCuratedLibraryChapterHeaderLayoutItemTitle"));
  objc_msgSend(v83, "addObject:", CFSTR("PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle"));
  objc_msgSend(v83, "addObject:", CFSTR("PXCuratedLibraryChapterHeaderLayoutItemChevron"));
  objc_msgSend(v83, "addObject:", CFSTR("PXCuratedLibraryChapterHeaderLayoutItemBounds"));
  p_itemIdentifierBySpriteIndex = &self->_itemIdentifierBySpriteIndex;
  if (!-[NSArray isEqualToArray:](self->_itemIdentifierBySpriteIndex, "isEqualToArray:", v83))
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", *p_itemIdentifierBySpriteIndex, v83, MEMORY[0x1E0C9AA60]);
    v85 = v25;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, v83);
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v86, objc_msgSend(v83, "count"), 0, 0);

    v25 = v85;
  }
  v87 = ceil(MidY) + height * -0.5;
  v88 = v66 + MaxX;
  if (v60)
  {
    v90 = 1.0;
  }
  else
  {
    v89 = v107 * v96;
    v90 = v89;
  }
  v91 = v102;
  v92 = -[NSArray count](*p_itemIdentifierBySpriteIndex, "count");
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_4;
  v112[3] = &unk_1E51259C0;
  v112[5] = v101;
  v112[6] = v100;
  *(double *)&v112[7] = v104;
  *(double *)&v112[8] = v103;
  v119 = v25 & 1;
  v112[4] = self;
  *(CGFloat *)&v112[9] = v72;
  *(double *)&v112[10] = v94;
  *(double *)&v112[11] = v93;
  *(double *)&v112[12] = v111;
  v115 = v98;
  v116 = v91;
  *(double *)&v112[13] = v88;
  *(double *)&v112[14] = v87;
  *(double *)&v112[15] = width;
  *(double *)&v112[16] = height;
  v117 = v90;
  v118 = v106;
  v120 = v77;
  v113 = v124;
  v114 = v125;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v92 << 32, v112);
  -[PXGLayout setContentSize:](self, "setContentSize:", v104, v103);
  -[PXCuratedLibraryChapterHeaderLayout setPresentedAlternateAppearance:](self, "setPresentedAlternateAppearance:", v107 > 0.5);

}

- (void)setAssetCollectionReference:(id)a3
{
  PXAssetCollectionReference *v5;
  char v6;
  PXAssetCollectionReference *v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  PXAssetCollectionReference *v13;

  v13 = (PXAssetCollectionReference *)a3;
  v5 = self->_assetCollectionReference;
  if (v5 == v13)
  {

LABEL_10:
    v7 = v13;
    goto LABEL_11;
  }
  v6 = -[PXAssetCollectionReference isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetCollectionReference, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      v7 = v13;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout setAssetCollectionReference:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 350, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setRawTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *rawTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_rawTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      rawTitle = self->_rawTitle;
      self->_rawTitle = v6;

      -[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle](self, "_invalidateAttributedTitle");
    }
  }

}

- (void)setTitleEmphasizedAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *titleEmphasizedAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_titleEmphasizedAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      titleEmphasizedAttributes = self->_titleEmphasizedAttributes;
      self->_titleEmphasizedAttributes = v6;

      -[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle](self, "_invalidateAttributedTitle");
    }
  }

}

- (void)_invalidateAttributedTitle
{
  NSAttributedString *attributedTitle;
  NSAttributedString *floatingAttributedTitle;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;

  attributedTitle = self->_attributedTitle;
  self->_attributedTitle = 0;

  floatingAttributedTitle = self->_floatingAttributedTitle;
  self->_floatingAttributedTitle = 0;

  self->_attributedTitleSize = *(CGSize *)off_1E50B8810;
  ++self->_titleVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 374, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateChevron
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_chevronVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout _invalidateChevron]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 379, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setTitleDeemphasizedAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *titleDeemphasizedAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_titleDeemphasizedAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      titleDeemphasizedAttributes = self->_titleDeemphasizedAttributes;
      self->_titleDeemphasizedAttributes = v6;

      -[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle](self, "_invalidateAttributedTitle");
    }
  }

}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *asyncDateQueue;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25[3];
  id location;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[5];

  v35[3] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryChapterHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setLineBreakMode:", 4);
  if ((-[PXGLayout referenceOptions](self, "referenceOptions") & 2) != 0)
    objc_msgSend(v6, "setAlignment:", 2);
  v7 = *MEMORY[0x1E0DC1138];
  v35[0] = v4;
  v8 = *MEMORY[0x1E0DC1140];
  v33[0] = v7;
  v33[1] = v8;
  objc_msgSend(v3, "titleEmphasizedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0DC1178];
  v10 = v34;
  v35[1] = v9;
  v35[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v33, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setTitleEmphasizedAttributes:](self, "setTitleEmphasizedAttributes:", v11);

  v32[0] = v4;
  v31[0] = v7;
  v31[1] = v8;
  objc_msgSend(v3, "floatingTitleEmphasizedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  v32[1] = v12;
  v32[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setFloatingTitleEmphasizedAttributes:](self, "setFloatingTitleEmphasizedAttributes:", v13);

  v30[0] = v4;
  v29[0] = v7;
  v29[1] = v8;
  objc_msgSend(v3, "titleDeemphasizedColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v10;
  v30[1] = v14;
  v30[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setTitleDeemphasizedAttributes:](self, "setTitleDeemphasizedAttributes:", v15);

  v28[0] = v4;
  v27[0] = v7;
  v27[1] = v8;
  objc_msgSend(v3, "floatingTitleDeemphasizedColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v10;
  v28[1] = v16;
  v28[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v17 = objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryChapterHeaderLayout setFloatingTitleDeemphasizedAttributes:](self, "setFloatingTitleDeemphasizedAttributes:", v17);

  LOBYTE(v17) = objc_msgSend(v3, "shouldAbbreviateMonth");
  -[PXCuratedLibraryChapterHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assetCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v17 & 1) != 0)
  {
    v20 = (void *)(self->_asyncDateGeneration + 1);
    self->_asyncDateGeneration = (int64_t)v20;
    objc_initWeak(&location, self);
    asyncDateQueue = self->_asyncDateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXCuratedLibraryChapterHeaderLayout__updateTitle__block_invoke;
    block[3] = &unk_1E51259E8;
    v24 = v19;
    v25[1] = (id)3;
    objc_copyWeak(v25, &location);
    v25[2] = v20;
    dispatch_async(asyncDateQueue, block);
    objc_destroyWeak(v25);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v19, "localizedSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryChapterHeaderLayout setRawTitle:](self, "setRawTitle:", v22);

  }
}

- (void)_handleAsyncRawTitle:(id)a3 generation:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v7 = v6;
  if (self->_asyncDateGeneration == a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PXCuratedLibraryChapterHeaderLayout__handleAsyncRawTitle_generation___block_invoke;
    block[3] = &unk_1E5145560;
    v10 = a4;
    block[4] = self;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (NSAttributedString)attributedTitle
{
  NSAttributedString *attributedTitle;
  void *v4;
  void *v5;
  NSAttributedString *v6;
  NSAttributedString *v7;

  attributedTitle = self->_attributedTitle;
  if (!attributedTitle)
  {
    -[PXCuratedLibraryChapterHeaderLayout titleEmphasizedAttributes](self, "titleEmphasizedAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryChapterHeaderLayout titleDeemphasizedAttributes](self, "titleDeemphasizedAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryChapterHeaderLayout _createAttributedTitleWithEmphasizedAttributes:deemphasizedAttributes:](self, "_createAttributedTitleWithEmphasizedAttributes:deemphasizedAttributes:", v4, v5);
    v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attributedTitle;
    self->_attributedTitle = v6;

    attributedTitle = self->_attributedTitle;
  }
  return attributedTitle;
}

- (NSAttributedString)floatingAttributedTitle
{
  NSAttributedString *floatingAttributedTitle;
  void *v4;
  void *v5;
  NSAttributedString *v6;
  NSAttributedString *v7;

  floatingAttributedTitle = self->_floatingAttributedTitle;
  if (!floatingAttributedTitle)
  {
    -[PXCuratedLibraryChapterHeaderLayout floatingTitleEmphasizedAttributes](self, "floatingTitleEmphasizedAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryChapterHeaderLayout floatingTitleDeemphasizedAttributes](self, "floatingTitleDeemphasizedAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryChapterHeaderLayout _createAttributedTitleWithEmphasizedAttributes:deemphasizedAttributes:](self, "_createAttributedTitleWithEmphasizedAttributes:deemphasizedAttributes:", v4, v5);
    v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_floatingAttributedTitle;
    self->_floatingAttributedTitle = v6;

    floatingAttributedTitle = self->_floatingAttributedTitle;
  }
  return floatingAttributedTitle;
}

- (id)_createAttributedTitleWithEmphasizedAttributes:(id)a3 deemphasizedAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, unint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  char v26;
  _QWORD v27[3];
  char v28;

  v6 = a3;
  v7 = a4;
  -[PXCuratedLibraryChapterHeaderLayout rawTitle](self, "rawTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(""));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  LODWORD(self) = (-[PXGLayout referenceOptions](self, "referenceOptions") >> 1) & 1;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __109__PXCuratedLibraryChapterHeaderLayout__createAttributedTitleWithEmphasizedAttributes_deemphasizedAttributes___block_invoke;
  v20 = &unk_1E5125A10;
  v11 = v10;
  v21 = v11;
  v25 = v27;
  v12 = v6;
  v22 = v12;
  v13 = v7;
  v23 = v13;
  v26 = (char)self;
  v14 = v9;
  v24 = v14;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v17);
  v15 = (void *)objc_msgSend(v11, "copy", v17, v18, v19, v20);

  _Block_object_dispose(v27, 8);
  return v15;
}

- (CGSize)attributedTitleSize
{
  CGSize *p_attributedTitleSize;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  double width;
  double height;
  CGSize result;

  p_attributedTitleSize = &self->_attributedTitleSize;
  if (PXSizeIsNull())
  {
    -[PXCuratedLibraryChapterHeaderLayout attributedTitle](self, "attributedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    objc_msgSend(v4, "boundingRectWithSize:options:context:", 0, 0);
    p_attributedTitleSize->width = v5;
    p_attributedTitleSize->height = v6;

  }
  width = p_attributedTitleSize->width;
  height = p_attributedTitleSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout visibleRectDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 486, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 491, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 496, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)viewEnvironmentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout viewEnvironmentDidChange](&v3, sel_viewEnvironmentDidChange);
  -[PXCuratedLibraryChapterHeaderLayout _invalidateChevron](self, "_invalidateChevron");
}

- (void)referenceOptionsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryChapterHeaderLayout;
  -[PXGLayout referenceOptionsDidChange](&v8, sel_referenceOptionsDidChange);
  -[PXCuratedLibraryChapterHeaderLayout _invalidateAttributedTitle](self, "_invalidateAttributedTitle");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 3;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout referenceOptionsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 507, CFSTR("invalidating %lu after it already has been updated"), 3);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 3;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  PXCuratedLibraryHitTestResult *v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  if (-[PXCuratedLibraryChapterHeaderLayout presentedAlternateAppearance](self, "presentedAlternateAppearance"))
  {
    v5 = 0;
  }
  else
  {
    -[PXCuratedLibraryChapterHeaderLayout assetCollectionReference](self, "assetCollectionReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PXCuratedLibraryHitTestResult alloc];
    if (v6)
      v9 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetCollectionReference:](v8, "initWithControl:spriteReference:layout:assetCollectionReference:", 4, v7, self, v6);
    else
      v9 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:](v8, "initWithControl:spriteReference:layout:", 4, v7, self);
    v5 = (void *)v9;

  }
  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  char v11;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v9 = a3;
  if ((void *)AlternateAppearanceMixAnimatorObservationContext_98252 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 535, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    v18 = v9;
    -[PXCuratedLibraryChapterHeaderLayout alternateAppearanceMixAnimator](self, "alternateAppearanceMixAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBeingMutated");

    v9 = v18;
    if ((v11 & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_9:
          p_updateFlags->needsUpdate = needsUpdate | 1;
          goto LABEL_10;
        }
LABEL_8:
        if ((self->_updateFlags.updated & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryChapterHeaderLayout observable:didChange:context:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 532, CFSTR("invalidating %lu after it already has been updated"), 1);

          abort();
        }
        goto LABEL_9;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_8;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (!willPerformUpdate)
      {
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
        v9 = v18;
      }
    }
  }
LABEL_10:

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  __CFString *v8;
  void *v11;

  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemTitle")
    && v8 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 546, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

  return &stru_1E5149688;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  __CFString *v8;
  void *v11;

  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemTitle")
    && v8 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 554, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return -[PXGLayout referenceOptions](self, "referenceOptions", *(_QWORD *)&a3, a4) & 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("PXCuratedLibraryChapterHeaderLayoutItemTitle"))
  {
    -[PXCuratedLibraryChapterHeaderLayout attributedTitle](self, "attributedTitle");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryChapterHeaderLayout.m"), 571, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXCuratedLibraryChapterHeaderLayout floatingAttributedTitle](self, "floatingAttributedTitle");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryChapterHeaderLayout spec](self, "spec", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chevronImageConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)axSpriteIndexes
{
  return (id)-[NSMutableIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[33].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[33].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (NSString)rawTitle
{
  return self->_rawTitle;
}

- (NSDictionary)titleEmphasizedAttributes
{
  return self->_titleEmphasizedAttributes;
}

- (NSDictionary)floatingTitleEmphasizedAttributes
{
  return self->_floatingTitleEmphasizedAttributes;
}

- (void)setFloatingTitleEmphasizedAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSDictionary)titleDeemphasizedAttributes
{
  return self->_titleDeemphasizedAttributes;
}

- (NSDictionary)floatingTitleDeemphasizedAttributes
{
  return self->_floatingTitleDeemphasizedAttributes;
}

- (void)setFloatingTitleDeemphasizedAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (PXNumberAnimator)alternateAppearanceMixAnimator
{
  return self->_alternateAppearanceMixAnimator;
}

- (BOOL)presentedAlternateAppearance
{
  return self->_presentedAlternateAppearance;
}

- (void)setPresentedAlternateAppearance:(BOOL)a3
{
  self->_presentedAlternateAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
  objc_storeStrong((id *)&self->_floatingTitleDeemphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_titleDeemphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_floatingTitleEmphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedAttributes, 0);
  objc_storeStrong((id *)&self->_rawTitle, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_floatingAttributedTitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_asyncDateQueue, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, 0);
}

void __109__PXCuratedLibraryChapterHeaderLayout__createAttributedTitleWithEmphasizedAttributes_deemphasizedAttributes___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a2;
  v8 = [v6 alloc];
  v9 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v9 = 48;
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, *(_QWORD *)(a1 + v9));

  objc_msgSend(v5, "appendAttributedString:", v10);
  if (*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 56), "count") - 1 > a3)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v11, "appendAttributedString:", v12);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) ^= 1u;
}

uint64_t __71__PXCuratedLibraryChapterHeaderLayout__handleAsyncRawTitle_generation___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 936))
    return objc_msgSend(*(id *)(result + 32), "setRawTitle:", *(_QWORD *)(result + 40));
  return result;
}

void __51__PXCuratedLibraryChapterHeaderLayout__updateTitle__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "localizedDateDescriptionWithOptions:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAsyncRawTitle:generation:", v3, *(_QWORD *)(a1 + 56));

}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __53__PXCuratedLibraryChapterHeaderLayout__updateSprites__block_invoke_4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int8x16_t a6)
{
  unint64_t v6;
  unsigned int v8;
  float64x2_t v10;
  int8x16_t v11;
  float v12;
  double v13;
  double v14;
  __CFString *v15;
  __CFString *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v21;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v24;
  float64x2_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  float64x2_t v40;
  uint64_t v41;
  float32x2_t *v42;
  float32x2_t *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  float64x2_t v51;
  uint64_t v52;
  float32x2_t *v53;
  uint64_t v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  float64x2_t v62;
  uint64_t v63;
  uint64_t v64;
  int8x16_t v65;
  int8x16_t v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v6 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v8 = a2;
    a6.i32[0] = 0;
    v10 = *(float64x2_t *)(a1 + 56);
    v11 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 40)), v10);
    LODWORD(v10.f64[0]) = *(unsigned __int8 *)(a1 + 184);
    v65 = v11;
    v66 = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8((int8x16_t)v10, a6), 0), *(int8x16_t *)((char *)off_1E50B83A0 + 20), v11);
    v12 = -1.4;
    if (!*(_BYTE *)(a1 + 184))
      v12 = 1.0;
    v13 = (float)(v12 + 1.0);
    v14 = v12;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "objectAtIndexedSubscript:", v8, *(_OWORD *)&v65);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 == CFSTR("PXCuratedLibraryChapterHeaderLayoutItemTitle"))
        break;
      if (v15 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemFloatingTitle"))
      {
        if (v15 != CFSTR("PXCuratedLibraryChapterHeaderLayoutItemChevron"))
        {
          if (v15 == CFSTR("PXCuratedLibraryChapterHeaderLayoutItemBounds"))
          {
            v73 = CGRectUnion(*(CGRect *)(a1 + 72), *(CGRect *)(a1 + 104));
            x = v73.origin.x;
            y = v73.origin.y;
            width = v73.size.width;
            height = v73.size.height;
            v21 = a3 + 32 * v8;
            MidX = CGRectGetMidX(v73);
            v74.origin.x = x;
            v74.origin.y = y;
            v74.size.width = width;
            v74.size.height = height;
            MidY = CGRectGetMidY(v74);
            v75.origin.x = x;
            v75.origin.y = y;
            v75.size.width = width;
            v75.size.height = height;
            v67 = CGRectGetWidth(v75);
            v76.origin.x = x;
            v76.origin.y = y;
            v76.size.width = width;
            v76.size.height = height;
            v24 = CGRectGetHeight(v76);
            v25.f64[0] = v67;
            v25.f64[1] = v24;
            *(CGFloat *)v21 = MidX;
            *(CGFloat *)(v21 + 8) = MidY;
            *(double *)(v21 + 16) = v13;
            *(float32x2_t *)(v21 + 24) = vcvt_f32_f64(v25);
            v26 = (_OWORD *)(a4 + 160 * v8);
            v27 = *((_OWORD *)off_1E50B83A0 + 1);
            *v26 = *(_OWORD *)off_1E50B83A0;
            v26[1] = v27;
            v28 = *((_OWORD *)off_1E50B83A0 + 5);
            v26[4] = *((_OWORD *)off_1E50B83A0 + 4);
            v26[5] = v28;
            v29 = *((_OWORD *)off_1E50B83A0 + 3);
            v26[2] = *((_OWORD *)off_1E50B83A0 + 2);
            v26[3] = v29;
            v30 = *((_OWORD *)off_1E50B83A0 + 9);
            v26[8] = *((_OWORD *)off_1E50B83A0 + 8);
            v26[9] = v30;
            v31 = *((_OWORD *)off_1E50B83A0 + 7);
            v26[6] = *((_OWORD *)off_1E50B83A0 + 6);
            v26[7] = v31;
            *(_BYTE *)(a5 + 40 * v8 + 1) = 0;
          }
          goto LABEL_14;
        }
        v54 = a3 + 32 * v8;
        v55 = *(double *)(a1 + 104);
        v56 = *(double *)(a1 + 112);
        v57 = *(double *)(a1 + 120);
        v58 = *(double *)(a1 + 128);
        v85.origin.x = v55;
        v85.origin.y = v56;
        v85.size.width = v57;
        v85.size.height = v58;
        v59 = CGRectGetMidX(v85);
        v86.origin.x = v55;
        v86.origin.y = v56;
        v86.size.width = v57;
        v86.size.height = v58;
        v60 = CGRectGetMidY(v86);
        v87.origin.x = v55;
        v87.origin.y = v56;
        v87.size.width = v57;
        v87.size.height = v58;
        v70 = CGRectGetWidth(v87);
        v88.origin.x = v55;
        v88.origin.y = v56;
        v88.size.width = v57;
        v88.size.height = v58;
        v61 = CGRectGetHeight(v88);
        v62.f64[0] = v70;
        v62.f64[1] = v61;
        *(CGFloat *)v54 = v59;
        *(CGFloat *)(v54 + 8) = v60;
        *(double *)(v54 + 16) = v14;
        *(float32x2_t *)(v54 + 24) = vcvt_f32_f64(v62);
        v63 = a4 + 160 * v8;
        *(_DWORD *)(v63 + 16) = *((_DWORD *)off_1E50B83A0 + 4);
        *(_OWORD *)v63 = *(_OWORD *)off_1E50B83A0;
        *(int8x16_t *)(v63 + 20) = v66;
        *(_OWORD *)(v63 + 100) = *(_OWORD *)((char *)off_1E50B83A0 + 100);
        *(_OWORD *)(v63 + 116) = *(_OWORD *)((char *)off_1E50B83A0 + 116);
        *(_OWORD *)(v63 + 132) = *(_OWORD *)((char *)off_1E50B83A0 + 132);
        *(_OWORD *)(v63 + 144) = *((_OWORD *)off_1E50B83A0 + 9);
        *(_OWORD *)(v63 + 36) = *(_OWORD *)((char *)off_1E50B83A0 + 36);
        *(_OWORD *)(v63 + 52) = *(_OWORD *)((char *)off_1E50B83A0 + 52);
        *(_OWORD *)(v63 + 68) = *(_OWORD *)((char *)off_1E50B83A0 + 68);
        *(_OWORD *)(v63 + 84) = *(_OWORD *)((char *)off_1E50B83A0 + 84);
        *(_DWORD *)v63 = *(_DWORD *)(a1 + 180);
        v64 = a5 + 40 * v8;
        *(_BYTE *)(v64 + 1) = 1;
        *(_WORD *)(v64 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 896);
        goto LABEL_13;
      }
      v43 = (float32x2_t *)(a3 + 32 * v8);
      v44 = *(double *)(a1 + 72);
      v45 = *(double *)(a1 + 80);
      v46 = *(double *)(a1 + 88);
      v47 = *(double *)(a1 + 96);
      v81.origin.x = v44;
      v81.origin.y = v45;
      v81.size.width = v46;
      v81.size.height = v47;
      v48 = CGRectGetMidX(v81);
      v82.origin.x = v44;
      v82.origin.y = v45;
      v82.size.width = v46;
      v82.size.height = v47;
      v49 = CGRectGetMidY(v82);
      v83.origin.x = v44;
      v83.origin.y = v45;
      v83.size.width = v46;
      v83.size.height = v47;
      v69 = CGRectGetWidth(v83);
      v84.origin.x = v44;
      v84.origin.y = v45;
      v84.size.width = v46;
      v84.size.height = v47;
      v50 = CGRectGetHeight(v84);
      v51.f64[0] = v69;
      v51.f64[1] = v50;
      *(CGFloat *)v43 = v48;
      *(CGFloat *)&v43[1] = v49;
      v43[2] = (float32x2_t)0xBFF99999A0000000;
      v43[3] = vcvt_f32_f64(v51);
      v52 = a4 + 160 * v8;
      *(_DWORD *)(v52 + 16) = *((_DWORD *)off_1E50B83A0 + 4);
      *(_OWORD *)v52 = *(_OWORD *)off_1E50B83A0;
      *(int8x16_t *)(v52 + 20) = v65;
      *(_OWORD *)(v52 + 100) = *(_OWORD *)((char *)off_1E50B83A0 + 100);
      *(_OWORD *)(v52 + 116) = *(_OWORD *)((char *)off_1E50B83A0 + 116);
      *(_OWORD *)(v52 + 132) = *(_OWORD *)((char *)off_1E50B83A0 + 132);
      *(_OWORD *)(v52 + 144) = *((_OWORD *)off_1E50B83A0 + 9);
      *(_OWORD *)(v52 + 36) = *(_OWORD *)((char *)off_1E50B83A0 + 36);
      *(_OWORD *)(v52 + 52) = *(_OWORD *)((char *)off_1E50B83A0 + 52);
      *(_OWORD *)(v52 + 68) = *(_OWORD *)((char *)off_1E50B83A0 + 68);
      *(_OWORD *)(v52 + 84) = *(_OWORD *)((char *)off_1E50B83A0 + 84);
      *(_DWORD *)v52 = *(_DWORD *)(a1 + 176);
      v53 = (float32x2_t *)(a5 + 40 * v8);
      v53->i8[1] = 3;
      v53[4].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 872);
      v53[1] = vmul_n_f32(v43[3], *(float *)(a1 + 172));
LABEL_14:
      if (*(_BYTE *)(a5 + 40 * v8 + 1) == 3)
        *(_BYTE *)(a4 + 160 * v8 + 70) = *(_BYTE *)(a1 + 185);
      *(_QWORD *)(a5 + 40 * v8 + 24) = PXGSectionedSpriteTagMake();

      ++v8;
      if (!--v6)
        return;
    }
    v32 = a3 + 32 * v8;
    v33 = *(double *)(a1 + 72);
    v34 = *(double *)(a1 + 80);
    v35 = *(double *)(a1 + 88);
    v36 = *(double *)(a1 + 96);
    v77.origin.x = v33;
    v77.origin.y = v34;
    v77.size.width = v35;
    v77.size.height = v36;
    v37 = CGRectGetMidX(v77);
    v78.origin.x = v33;
    v78.origin.y = v34;
    v78.size.width = v35;
    v78.size.height = v36;
    v38 = CGRectGetMidY(v78);
    v79.origin.x = v33;
    v79.origin.y = v34;
    v79.size.width = v35;
    v79.size.height = v36;
    v68 = CGRectGetWidth(v79);
    v80.origin.x = v33;
    v80.origin.y = v34;
    v80.size.width = v35;
    v80.size.height = v36;
    v39 = CGRectGetHeight(v80);
    v40.f64[0] = v68;
    v40.f64[1] = v39;
    *(CGFloat *)v32 = v37;
    *(CGFloat *)(v32 + 8) = v38;
    *(double *)(v32 + 16) = v14;
    *(float32x2_t *)(v32 + 24) = vcvt_f32_f64(v40);
    v41 = a4 + 160 * v8;
    *(_DWORD *)(v41 + 16) = *((_DWORD *)off_1E50B83A0 + 4);
    *(_OWORD *)v41 = *(_OWORD *)off_1E50B83A0;
    *(int8x16_t *)(v41 + 20) = v66;
    *(_OWORD *)(v41 + 100) = *(_OWORD *)((char *)off_1E50B83A0 + 100);
    *(_OWORD *)(v41 + 116) = *(_OWORD *)((char *)off_1E50B83A0 + 116);
    *(_OWORD *)(v41 + 132) = *(_OWORD *)((char *)off_1E50B83A0 + 132);
    *(_OWORD *)(v41 + 144) = *((_OWORD *)off_1E50B83A0 + 9);
    *(_OWORD *)(v41 + 36) = *(_OWORD *)((char *)off_1E50B83A0 + 36);
    *(_OWORD *)(v41 + 52) = *(_OWORD *)((char *)off_1E50B83A0 + 52);
    *(_OWORD *)(v41 + 68) = *(_OWORD *)((char *)off_1E50B83A0 + 68);
    *(_OWORD *)(v41 + 84) = *(_OWORD *)((char *)off_1E50B83A0 + 84);
    *(_DWORD *)v41 = *(_DWORD *)(a1 + 168);
    v42 = (float32x2_t *)(a5 + 40 * v8);
    v42->i8[1] = 3;
    v42[4].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 872);
    v42[1] = vmul_n_f32(*(float32x2_t *)(v32 + 24), *(float *)(a1 + 172));
LABEL_13:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 928), "addIndex:", v8);
    goto LABEL_14;
  }
}

void __43__PXCuratedLibraryChapterHeaderLayout_init__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.curatedlibrary-chapter-header-async-dates", v0);
  v2 = (void *)init_asyncDateQueue_98294;
  init_asyncDateQueue_98294 = (uint64_t)v1;

}

@end
