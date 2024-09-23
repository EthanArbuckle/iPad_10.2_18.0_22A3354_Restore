@implementation PXSharedAlbumsActivityEntryLayout

- (PXSharedAlbumsActivityEntryLayout)initWithItem:(id)a3
{
  id v6;
  PXSharedAlbumsActivityEntryLayout *v7;
  PXSharedAlbumsActivityEntryLayout *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntryViewController.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  v7 = -[PXGLayout init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, a3);
    v8->_assetSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    v8->_backgroundSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    v8->_countsBackgroundSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    v8->_countsSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    v8->_contributorSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    v8->_messageSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v8, "addSpriteWithInitialState:", 0);
    -[PXGLayout setContentSource:](v8, "setContentSource:", v8);
    -[PXGLayout setNeedsUpdate](v8, "setNeedsUpdate");
  }

  return v8;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (unsigned)decorationOverlayAnchorSpriteIndex
{
  return self->_assetSpriteIndex;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)update
{
  int64_t v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double Height;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  uint64_t v49;
  double v50;
  CGFloat MinY;
  double v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat MinX;
  double v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  double rect;
  CGFloat rect_8;
  double rect_16;
  CGFloat rect_24;
  CGFloat rect_24a;
  objc_super v88;
  _QWORD v89[34];
  BOOL v90;
  BOOL v91;
  BOOL v92;
  BOOL v93;
  BOOL v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v3 = -[PXSharedAlbumsActivityEntryItem type](self->_item, "type");
  -[PXGLayout displayScale](self, "displayScale");
  v74 = v4;
  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithSize();
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXGLayout setContentSize:](self, "setContentSize:", v9, v11);
  -[PXSharedAlbumsActivityEntryItem assets](self->_item, "assets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v6;
  v82 = v8;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  v18 = v12;
  if (v3)
  {
    Height = CGRectGetHeight(*(CGRect *)&v15);
    v95.origin.x = v6;
    v95.origin.y = v8;
    v95.size.width = v10;
    v95.size.height = v12;
    rect = CGRectGetMaxX(v95) - Height;
    v96.origin.x = v6;
    v96.origin.y = v8;
    v96.size.width = v10;
    v96.size.height = v12;
    rect_24 = CGRectGetMinY(v96);
    v20 = Height;
  }
  else
  {
    rect = CGRectGetMinX(*(CGRect *)&v15);
    v97.origin.x = v6;
    v97.origin.y = v8;
    v97.size.width = v10;
    v97.size.height = v12;
    rect_24 = CGRectGetMinY(v97);
    v98.origin.x = v6;
    v98.origin.y = v8;
    v98.size.width = v10;
    v98.size.height = v12;
    Height = CGRectGetHeight(v98);
    v99.origin.x = v6;
    v99.origin.y = v8;
    v99.size.width = v10;
    v99.size.height = v12;
    v20 = CGRectGetHeight(v99);
  }
  v22 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v24 = v23;
  rect_16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v25 = rect_16;
  v75 = v21;
  v26 = *MEMORY[0x1E0C9D648];
  if (v14)
  {
    PXSizeGetAspectRatio();
    objc_msgSend(v14, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 2);
    v24 = v27;
  }
  v69 = v26;
  v70 = v21;
  v71 = v25;
  -[PXSharedAlbumsActivityEntryItem assets](self->_item, "assets");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  v76 = v12;
  v77 = v10;
  v72 = v24;
  if (v29 <= 1)
  {
    v39 = rect_24;
    v67 = rect_16;
    v68 = v23;
    v61 = v75;
    v62 = v22;
    v65 = rect_16;
    v66 = v23;
    v63 = v75;
    v64 = v22;
  }
  else
  {
    -[PXSharedAlbumsActivityEntryLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", self->_countsSpriteIndex, self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v100.origin.x = rect;
    v100.origin.y = rect_24;
    v100.size.width = Height;
    v100.size.height = v20;
    objc_msgSend(v30, "boundingRectWithSize:options:context:", 1, 0, CGRectGetWidth(v100), 1.79769313e308);
    v67 = v31;
    v68 = v32;
    PXSizeAdd();
    v34 = v33;
    v36 = v35;
    v101.origin.x = rect;
    v101.origin.y = rect_24;
    v101.size.width = Height;
    v101.size.height = v20;
    v37 = CGRectGetMinX(v101) + 10.0;
    v102.origin.x = rect;
    v102.origin.y = rect_24;
    v102.size.width = Height;
    v102.size.height = v20;
    v38 = CGRectGetMaxY(v102) + -10.0 - v36;
    v103.origin.x = v37;
    v103.origin.y = v38;
    v103.size.width = v34;
    v103.size.height = v36;
    v62 = CGRectGetMinX(v103) + 5.0;
    v63 = v38;
    v64 = v37;
    v65 = v34;
    v104.origin.x = v37;
    v104.origin.y = v38;
    v104.size.width = v34;
    v66 = v36;
    v104.size.height = v36;
    v61 = CGRectGetMinY(v104) + 5.0;

    v39 = rect_24;
  }
  v105.origin.x = rect;
  v105.origin.y = v39;
  v105.size.width = Height;
  v105.size.height = v20;
  CGRectGetWidth(v105);
  v73 = Height;
  rect_24a = v39;
  rect_8 = v20;
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[PXSharedAlbumsActivityEntryLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", self->_messageSpriteIndex, self);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");
  v80 = v22;
  MinX = v22;
  v50 = v75;
  MinY = v75;
  v79 = rect_16;
  v52 = v23;
  if (v49)
  {
    v106.origin.x = v41;
    v106.origin.y = v43;
    v106.size.width = v45;
    v106.size.height = v47;
    objc_msgSend(v48, "boundingRectWithSize:options:context:", 1, 0, CGRectGetWidth(v106), 1.79769313e308);
    v79 = v53;
    v23 = v54;
    v107.origin.x = v41;
    v107.origin.y = v43;
    v107.size.width = v45;
    v107.size.height = v47;
    MinX = CGRectGetMinX(v107);
    v108.origin.x = v41;
    v108.origin.y = v43;
    v108.size.width = v45;
    v108.size.height = v47;
    MinY = CGRectGetMinY(v108);
  }
  -[PXSharedAlbumsActivityEntryLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", self->_contributorSpriteIndex, self);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length");
  if (v56)
  {
    v109.origin.x = v41;
    v109.origin.y = v43;
    v109.size.width = v45;
    v109.size.height = v47;
    objc_msgSend(v55, "boundingRectWithSize:options:context:", 1, 0, CGRectGetWidth(v109), 1.79769313e308);
    rect_16 = v57;
    v59 = v58;
    v110.origin.x = v41;
    v110.origin.y = v43;
    v110.size.width = v45;
    v110.size.height = v47;
    v80 = CGRectGetMinX(v110);
    v111.origin.x = v41;
    v111.origin.y = v43;
    v111.size.width = v45;
    v111.size.height = v47;
    v52 = v59;
    v50 = CGRectGetMaxY(v111) - v59;
  }
  v60 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __43__PXSharedAlbumsActivityEntryLayout_update__block_invoke;
  v89[3] = &unk_1E5129F18;
  v89[4] = self;
  *(CGFloat *)&v89[5] = v81;
  *(CGFloat *)&v89[6] = v82;
  *(CGFloat *)&v89[7] = v77;
  *(CGFloat *)&v89[8] = v76;
  *(double *)&v89[9] = rect;
  *(CGFloat *)&v89[10] = rect_24a;
  *(double *)&v89[11] = v73;
  *(CGFloat *)&v89[12] = rect_8;
  v90 = v3 != 0;
  v91 = v14 != 0;
  v89[13] = v69;
  *(double *)&v89[14] = v70;
  *(double *)&v89[15] = v71;
  *(double *)&v89[16] = v72;
  v92 = v29 > 1;
  v89[17] = v74;
  *(CGFloat *)&v89[18] = v64;
  *(CGFloat *)&v89[19] = v63;
  *(CGFloat *)&v89[20] = v65;
  *(double *)&v89[21] = v66;
  *(double *)&v89[22] = v62;
  *(double *)&v89[23] = v61;
  *(double *)&v89[24] = v67;
  v93 = v56 != 0;
  *(double *)&v89[25] = v68;
  *(CGFloat *)&v89[26] = v80;
  *(double *)&v89[27] = v50;
  *(double *)&v89[28] = rect_16;
  v94 = v49 != 0;
  *(double *)&v89[29] = v52;
  *(CGFloat *)&v89[30] = MinX;
  *(CGFloat *)&v89[31] = MinY;
  *(double *)&v89[32] = v79;
  *(double *)&v89[33] = v23;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v60 << 32, v89);
  v88.receiver = self;
  v88.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  -[PXGLayout update](&v88, sel_update);

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t *v8;
  id v9;
  void *v11;

  v7 = a4;
  if (colorAtIndex_inLayout__predicate != -1)
    dispatch_once(&colorAtIndex_inLayout__predicate, &__block_literal_global_187_124785);
  if (self->_backgroundSpriteIndex == a3)
  {
    v8 = &colorAtIndex_inLayout___backgroundColor;
  }
  else if (self->_assetSpriteIndex == a3)
  {
    v8 = &colorAtIndex_inLayout___assetBackgroundColor;
  }
  else
  {
    if (self->_countsBackgroundSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntryViewController.m"), 430, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v8 = &colorAtIndex_inLayout___countsBackgroundColor;
  }
  v9 = (id)*v8;

  return v9;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntryViewController.m"), 437, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;

  v7 = a4;
  if (self->_countsSpriteIndex == a3)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[PXSharedAlbumsActivityEntryItem assets](self->_item, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (_TextAttributesForCounts_predicate != -1)
      dispatch_once(&_TextAttributesForCounts_predicate, &__block_literal_global_306);
    v12 = _TextAttributesForCounts__textAttributes;
LABEL_13:
    v16 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);
    goto LABEL_14;
  }
  if (self->_contributorSpriteIndex != a3)
  {
    if (self->_messageSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntryViewController.m"), 453, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSharedAlbumsActivityEntryItem message](self->_item, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (_TextAttributesForMessage_predicate != -1)
      dispatch_once(&_TextAttributesForMessage_predicate, &__block_literal_global_311);
    v12 = _TextAttributesForMessage__textAttributes;
    goto LABEL_13;
  }
  -[PXSharedAlbumsActivityEntryItem contributorDisplayName](self->_item, "contributorDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumsActivityEntryItem albumName](self->_item, "albumName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ / %@"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (_TextAttributesForContributor_predicate != -1)
    dispatch_once(&_TextAttributesForContributor_predicate, &__block_literal_global_310);
  v16 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, _TextAttributesForContributor__textAttributes);

LABEL_14:
  return v16;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntryViewController.m"), 458, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 33;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;

  -[PXSharedAlbumsActivityEntryItem assets](self->_item, "assets", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

void __59__PXSharedAlbumsActivityEntryLayout_colorAtIndex_inLayout___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.95, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorAtIndex_inLayout___backgroundColor;
  colorAtIndex_inLayout___backgroundColor = v0;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)colorAtIndex_inLayout___assetBackgroundColor;
  colorAtIndex_inLayout___assetBackgroundColor = v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)colorAtIndex_inLayout___countsBackgroundColor;
  colorAtIndex_inLayout___countsBackgroundColor = v4;

}

void __43__PXSharedAlbumsActivityEntryLayout_update__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  float32x2_t *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v24;
  uint64_t v25;
  float32x2_t *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  float64x2_t v37;
  _OWORD *v38;
  uint64_t v39;
  unint64_t v40;
  float v41;
  float v42;
  uint64_t v44;
  uint64_t v45;
  float64_t v46;
  float64x2_t v47;
  float32x2_t v48;
  uint64_t v49;
  uint64_t v50;
  float32x2_t *v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  float64x2_t v59;
  _OWORD *v60;
  uint64_t v62;
  uint64_t v63;
  float32x2_t *v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  float64x2_t v74;
  _OWORD *v75;
  float64_t v76;
  float64x2_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  float32x2_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  _OWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  _OWORD *v90;
  uint64_t v91;
  uint64_t v92;
  float32x2_t *v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  float64x2_t v101;
  _OWORD *v102;
  float64_t v103;
  float64x2_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _OWORD *v109;
  uint64_t v110;
  uint64_t v111;
  float32x2_t *v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  float64x2_t v120;
  _OWORD *v121;
  float64_t v122;
  float64x2_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _OWORD *v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  CGFloat Width;
  __int128 v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;

  v5 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860));
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v145.origin.x = v6;
  v145.origin.y = v7;
  v145.size.width = v8;
  v145.size.height = v9;
  MidX = CGRectGetMidX(v145);
  v146.origin.x = v6;
  v146.origin.y = v7;
  v146.size.width = v8;
  v146.size.height = v9;
  MidY = CGRectGetMidY(v146);
  v147.origin.x = v6;
  v147.origin.y = v7;
  v147.size.width = v8;
  v147.size.height = v9;
  Width = CGRectGetWidth(v147);
  v148.origin.x = v6;
  v148.origin.y = v7;
  v148.size.width = v8;
  v148.size.height = v9;
  Height = CGRectGetHeight(v148);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0xBFB99999A0000000;
  v5[3] = vcvt_f32_f64(v13);
  v14 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860));
  v15 = *((_OWORD *)off_1E50B83A0 + 1);
  v144 = *(_OWORD *)off_1E50B83A0;
  *v14 = *(_OWORD *)off_1E50B83A0;
  v14[1] = v15;
  v141 = *((_OWORD *)off_1E50B83A0 + 5);
  v142 = v15;
  v16 = *((_OWORD *)off_1E50B83A0 + 4);
  v14[4] = v16;
  v14[5] = v141;
  v139 = *((_OWORD *)off_1E50B83A0 + 3);
  v140 = v16;
  v17 = *((_OWORD *)off_1E50B83A0 + 2);
  v14[2] = v17;
  v14[3] = v139;
  v137 = *((_OWORD *)off_1E50B83A0 + 9);
  v138 = v17;
  v18 = *((_OWORD *)off_1E50B83A0 + 8);
  v14[8] = v18;
  v14[9] = v137;
  v135 = *((_OWORD *)off_1E50B83A0 + 7);
  v136 = v18;
  v134 = *((_OWORD *)off_1E50B83A0 + 6);
  v14[6] = v134;
  v14[7] = v135;
  __asm { FMOV            V0.4S, #20.0 }
  *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860) + 36) = _Q0;
  v24 = a3[4];
  v25 = v24 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860);
  ++*(_WORD *)(v25 + 32);
  *(_BYTE *)(v24 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860) + 1) = 5;
  __asm { FMOV            V14.2S, #1.0 }
  *(float32x2_t *)(v24 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860) + 8) = _D14;
  v27 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856));
  v28 = *(double *)(a1 + 72);
  v29 = *(double *)(a1 + 80);
  v30 = *(double *)(a1 + 88);
  v31 = *(double *)(a1 + 96);
  *(CGFloat *)&_Q0 = v28;
  *(CGFloat *)&v18 = v29;
  v32 = v30;
  v33 = v31;
  v34 = CGRectGetMidX(*(CGRect *)((char *)&v18 - 8));
  v149.origin.x = v28;
  v149.origin.y = v29;
  v149.size.width = v30;
  v149.size.height = v31;
  v35 = CGRectGetMidY(v149);
  v150.origin.x = v28;
  v150.origin.y = v29;
  v150.size.width = v30;
  v150.size.height = v31;
  v129 = CGRectGetWidth(v150);
  v151.origin.x = v28;
  v151.origin.y = v29;
  v151.size.width = v30;
  v151.size.height = v31;
  v36 = CGRectGetHeight(v151);
  v37.f64[0] = v129;
  v37.f64[1] = v36;
  *(CGFloat *)v27 = v34;
  *(CGFloat *)&v27[1] = v35;
  v27[2] = (float32x2_t)0xBFC99999A0000000;
  v27[3] = vcvt_f32_f64(v37);
  v38 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856));
  *v38 = v144;
  v38[1] = v142;
  v38[4] = v140;
  v38[5] = v141;
  v38[2] = v138;
  v38[3] = v139;
  v38[8] = v136;
  v38[9] = v137;
  v38[6] = v134;
  v38[7] = v135;
  v39 = a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856);
  v40 = 10;
  if (!*(_BYTE *)(a1 + 272))
    v40 = 5;
  v41 = 20.0;
  if (*(_BYTE *)(a1 + 272))
    v42 = 20.0;
  else
    v42 = 0.0;
  if ((v40 & 4) == 0)
    v41 = 0.0;
  __asm { FMOV            V3.2S, #20.0 }
  *(int8x8_t *)(v39 + 36) = vbic_s8(_D3, (int8x8_t)vmovn_s64(vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v40), (int8x16_t)xmmword_1A7BA05F0))));
  *(float *)(v39 + 44) = v41;
  *(float *)(v39 + 48) = v42;
  v44 = a3[4];
  v45 = v44 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856);
  ++*(_WORD *)(v45 + 32);
  if (*(_BYTE *)(a1 + 273))
  {
    *(float32x4_t *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 104)), *(float64x2_t *)(a1 + 120));
    *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 1) = 2;
    PXSizeScale();
    v47.f64[1] = v46;
    v48 = vcvt_f32_f64(v47);
    v44 = a3[4];
  }
  else
  {
    *(_BYTE *)(v44 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 1) = 5;
    v48 = _D14;
  }
  *(float32x2_t *)(v44 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 8) = v48;
  v49 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864);
  v50 = a3[2];
  if (*(_BYTE *)(a1 + 274))
  {
    v51 = (float32x2_t *)(v50 + 32 * v49);
    v52 = *(double *)(a1 + 144);
    v53 = *(double *)(a1 + 152);
    v54 = *(double *)(a1 + 160);
    v55 = *(double *)(a1 + 168);
    v152.origin.x = v52;
    v152.origin.y = v53;
    v152.size.width = v54;
    v152.size.height = v55;
    v56 = CGRectGetMidX(v152);
    v153.origin.x = v52;
    v153.origin.y = v53;
    v153.size.width = v54;
    v153.size.height = v55;
    v57 = CGRectGetMidY(v153);
    v154.origin.x = v52;
    v154.origin.y = v53;
    v154.size.width = v54;
    v154.size.height = v55;
    v130 = CGRectGetWidth(v154);
    v155.origin.x = v52;
    v155.origin.y = v53;
    v155.size.width = v54;
    v155.size.height = v55;
    v58 = CGRectGetHeight(v155);
    v59.f64[0] = v130;
    v59.f64[1] = v58;
    *(CGFloat *)v51 = v56;
    *(CGFloat *)&v51[1] = v57;
    v51[2] = (float32x2_t)0xBFD3333340000000;
    v51[3] = vcvt_f32_f64(v59);
    v60 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864));
    *v60 = v144;
    v60[1] = v142;
    v60[4] = v140;
    v60[5] = v141;
    v60[2] = v138;
    v60[3] = v139;
    v60[8] = v136;
    v60[9] = v137;
    v60[6] = v134;
    v60[7] = v135;
    __asm { FMOV            V0.4S, #5.0 }
    *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864) + 36) = _Q0;
    v62 = a3[4];
    v63 = v62 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864);
    ++*(_WORD *)(v63 + 32);
    *(_BYTE *)(v62 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864) + 1) = 5;
    *(float32x2_t *)(v62 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 864) + 8) = _D14;
    v64 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868));
    v65 = *(double *)(a1 + 176);
    v66 = *(double *)(a1 + 184);
    v67 = *(double *)(a1 + 192);
    v68 = *(double *)(a1 + 200);
    *(CGFloat *)&_Q0 = v65;
    v59.f64[0] = v66;
    v69 = v67;
    v70 = v68;
    v71 = CGRectGetMidX(*(CGRect *)((char *)&v59 - 8));
    v156.origin.x = v65;
    v156.origin.y = v66;
    v156.size.width = v67;
    v156.size.height = v68;
    v72 = CGRectGetMidY(v156);
    v157.origin.x = v65;
    v157.origin.y = v66;
    v157.size.width = v67;
    v157.size.height = v68;
    v131 = CGRectGetWidth(v157);
    v158.origin.x = v65;
    v158.origin.y = v66;
    v158.size.width = v67;
    v158.size.height = v68;
    v73 = CGRectGetHeight(v158);
    v74.f64[0] = v131;
    v74.f64[1] = v73;
    *(CGFloat *)v64 = v71;
    *(CGFloat *)&v64[1] = v72;
    v64[2] = (float32x2_t)0xBFD99999A0000000;
    v64[3] = vcvt_f32_f64(v74);
    v75 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868));
    *v75 = v144;
    v75[1] = v142;
    v75[4] = v140;
    v75[5] = v141;
    v75[2] = v138;
    v75[3] = v139;
    v75[8] = v136;
    v75[9] = v137;
    v75[6] = v134;
    v75[7] = v135;
    *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868) + 1) = 3;
    PXSizeScale();
    v77.f64[1] = v76;
    *(float32x2_t *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868) + 8) = vcvt_f32_f64(v77);
    v78 = a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868);
    ++*(_WORD *)(v78 + 32);
  }
  else
  {
    v79 = a3[3];
    v80 = a3[4];
    v81 = vcvt_f32_f64(*MEMORY[0x1E0C9D820]);
    v82 = (_QWORD *)(v50 + 32 * v49);
    v82[3] = v81;
    v83 = *MEMORY[0x1E0C9D538];
    v84 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
    *v82 = *MEMORY[0x1E0C9D538];
    v82[1] = v84;
    v82[2] = 0;
    v85 = (_OWORD *)(v79 + 160 * v49);
    v85[4] = v140;
    v85[5] = v141;
    v85[2] = v138;
    v85[3] = v139;
    v85[8] = v136;
    v85[9] = v137;
    v85[6] = v134;
    v85[7] = v135;
    *v85 = v144;
    v85[1] = v142;
    *(_DWORD *)v85 = 0;
    *(_BYTE *)(v80 + 40 * v49 + 1) = 0;
    v86 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 868);
    v87 = a3[3];
    v88 = a3[4];
    v89 = (_QWORD *)(a3[2] + 32 * v86);
    v89[3] = v81;
    *v89 = v83;
    v89[1] = v84;
    v89[2] = 0;
    v90 = (_OWORD *)(v87 + 160 * v86);
    *v90 = v144;
    v90[1] = v142;
    v90[4] = v140;
    v90[5] = v141;
    v90[2] = v138;
    v90[3] = v139;
    v90[8] = v136;
    v90[9] = v137;
    v90[6] = v134;
    v90[7] = v135;
    *(_DWORD *)v90 = 0;
    *(_BYTE *)(v88 + 40 * v86 + 1) = 0;
  }
  v91 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872);
  v92 = a3[2];
  if (*(_BYTE *)(a1 + 275))
  {
    v93 = (float32x2_t *)(v92 + 32 * v91);
    v94 = *(double *)(a1 + 208);
    v95 = *(double *)(a1 + 216);
    v96 = *(double *)(a1 + 224);
    v97 = *(double *)(a1 + 232);
    v159.origin.x = v94;
    v159.origin.y = v95;
    v159.size.width = v96;
    v159.size.height = v97;
    v98 = CGRectGetMidX(v159);
    v160.origin.x = v94;
    v160.origin.y = v95;
    v160.size.width = v96;
    v160.size.height = v97;
    v99 = CGRectGetMidY(v160);
    v161.origin.x = v94;
    v161.origin.y = v95;
    v161.size.width = v96;
    v161.size.height = v97;
    v132 = CGRectGetWidth(v161);
    v162.origin.x = v94;
    v162.origin.y = v95;
    v162.size.width = v96;
    v162.size.height = v97;
    v100 = CGRectGetHeight(v162);
    v101.f64[0] = v132;
    v101.f64[1] = v100;
    *(CGFloat *)v93 = v98;
    *(CGFloat *)&v93[1] = v99;
    v93[2] = (float32x2_t)0xBFD3333340000000;
    v93[3] = vcvt_f32_f64(v101);
    v102 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
    *v102 = v144;
    v102[1] = v142;
    v102[4] = v140;
    v102[5] = v141;
    v102[2] = v138;
    v102[3] = v139;
    v102[8] = v136;
    v102[9] = v137;
    v102[6] = v134;
    v102[7] = v135;
    *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 1) = 3;
    PXSizeScale();
    v104.f64[1] = v103;
    *(float32x2_t *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 8) = vcvt_f32_f64(v104);
    v105 = a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872);
    ++*(_WORD *)(v105 + 32);
  }
  else
  {
    v106 = a3[3];
    v107 = a3[4];
    v108 = v92 + 32 * v91;
    *(float32x2_t *)(v108 + 24) = vcvt_f32_f64(*MEMORY[0x1E0C9D820]);
    *(_OWORD *)v108 = *MEMORY[0x1E0C9D538];
    *(_QWORD *)(v108 + 16) = 0;
    v109 = (_OWORD *)(v106 + 160 * v91);
    v109[4] = v140;
    v109[5] = v141;
    v109[2] = v138;
    v109[3] = v139;
    v109[8] = v136;
    v109[9] = v137;
    v109[6] = v134;
    v109[7] = v135;
    *v109 = v144;
    v109[1] = v142;
    *(_DWORD *)v109 = 0;
    *(_BYTE *)(v107 + 40 * v91 + 1) = 0;
  }
  v110 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876);
  v111 = a3[2];
  if (*(_BYTE *)(a1 + 276))
  {
    v112 = (float32x2_t *)(v111 + 32 * v110);
    v113 = *(double *)(a1 + 240);
    v114 = *(double *)(a1 + 248);
    v115 = *(double *)(a1 + 256);
    v116 = *(double *)(a1 + 264);
    v163.origin.x = v113;
    v163.origin.y = v114;
    v163.size.width = v115;
    v163.size.height = v116;
    v117 = CGRectGetMidX(v163);
    v164.origin.x = v113;
    v164.origin.y = v114;
    v164.size.width = v115;
    v164.size.height = v116;
    v118 = CGRectGetMidY(v164);
    v165.origin.x = v113;
    v165.origin.y = v114;
    v165.size.width = v115;
    v165.size.height = v116;
    v133 = CGRectGetWidth(v165);
    v166.origin.x = v113;
    v166.origin.y = v114;
    v166.size.width = v115;
    v166.size.height = v116;
    v119 = CGRectGetHeight(v166);
    v120.f64[0] = v133;
    v120.f64[1] = v119;
    *(CGFloat *)v112 = v117;
    *(CGFloat *)&v112[1] = v118;
    v112[2] = (float32x2_t)0xBFD3333340000000;
    v112[3] = vcvt_f32_f64(v120);
    v121 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876));
    *v121 = v144;
    v121[1] = v142;
    v121[4] = v140;
    v121[5] = v141;
    v121[2] = v138;
    v121[3] = v139;
    v121[8] = v136;
    v121[9] = v137;
    v121[6] = v134;
    v121[7] = v135;
    *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 1) = 3;
    PXSizeScale();
    v123.f64[1] = v122;
    *(float32x2_t *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 8) = vcvt_f32_f64(v123);
    v124 = a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876);
    ++*(_WORD *)(v124 + 32);
  }
  else
  {
    v125 = a3[3];
    v126 = a3[4];
    v127 = v111 + 32 * v110;
    *(float32x2_t *)(v127 + 24) = vcvt_f32_f64(*MEMORY[0x1E0C9D820]);
    *(_OWORD *)v127 = *MEMORY[0x1E0C9D538];
    *(_QWORD *)(v127 + 16) = 0;
    v128 = (_OWORD *)(v125 + 160 * v110);
    v128[4] = v140;
    v128[5] = v141;
    v128[2] = v138;
    v128[3] = v139;
    v128[8] = v136;
    v128[9] = v137;
    v128[6] = v134;
    v128[7] = v135;
    *v128 = v144;
    v128[1] = v142;
    *(_DWORD *)v128 = 0;
    *(_BYTE *)(v126 + 40 * v110 + 1) = 0;
  }
}

@end
