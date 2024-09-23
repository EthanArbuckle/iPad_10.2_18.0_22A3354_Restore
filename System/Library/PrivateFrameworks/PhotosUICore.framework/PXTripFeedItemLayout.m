@implementation PXTripFeedItemLayout

- (PXTripFeedItemLayout)initWithExtendedTraitCollection:(id)a3 tripHighlight:(id)a4 keyAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXTripFeedItemLayout *v12;
  PXTripFeedItemLayout *v13;
  uint64_t v14;
  PXTitleSubtitleLabelSpec *titleSubtitleSpec;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXTripFeedItemLayout;
  v12 = -[PXGLayout init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extendedTraitCollection, a3);
    objc_storeStrong((id *)&v13->_tripHighlight, a4);
    objc_storeStrong((id *)&v13->_keyAssets, a5);
    v13->_thumbnailSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v13, "addSpriteWithInitialState:", 0);
    v13->_shadowSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v13, "addSpriteWithInitialState:", 0);
    v13->_titleSubtitleSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v13, "addSpriteWithInitialState:", 0);
    -[PXGLayout setContentSource:](v13, "setContentSource:", v13);
    -[PXTripFeedItemLayout _createTitleSubtitleSpec](v13, "_createTitleSubtitleSpec");
    v14 = objc_claimAutoreleasedReturnValue();
    titleSubtitleSpec = v13->_titleSubtitleSpec;
    v13->_titleSubtitleSpec = (PXTitleSubtitleLabelSpec *)v14;

  }
  return v13;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTripFeedItemLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXTripFeedItemLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTripFeedItemLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXTripFeedItemLayout _invalidateContent](self, "_invalidateContent");
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXTripFeedItemLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXTripFeedItemLayout.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXTripFeedItemLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXTripFeedItemLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXTripFeedItemLayout.m"), 104, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXTripFeedItemLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)_invalidateContentVersion
{
  ++self->_contentVersion;
  -[PXTripFeedItemLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXTripFeedItemLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXTripFeedItemLayout.m"), 114, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (BOOL)_hasTripTitle
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXTripFeedItemLayout tripHighlight](self, "tripHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "dateDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setTripHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_tripHighlight, a3);
  -[PXTripFeedItemLayout _invalidateContentVersion](self, "_invalidateContentVersion");
}

- (void)setKeyAssets:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssets, a3);
  -[PXTripFeedItemLayout _invalidateContentVersion](self, "_invalidateContentVersion");
}

- (void)_updateContent
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  double v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  _QWORD v30[14];
  BOOL v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[PXGLayout displayScale](self, "displayScale");
  v29 = v3;
  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PXEdgeInsetsMake();
  v13 = v12;
  v28 = v14;
  -[PXGLayout setContentSize:](self, "setContentSize:", v9, v11);
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  MinY = CGRectGetMinY(v33);
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  Width = CGRectGetWidth(v34);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  v18 = CGRectGetWidth(v35) / 1.5;
  v19 = -[PXTripFeedItemLayout _hasTripTitle](self, "_hasTripTitle");
  v20 = v19;
  if (v19)
  {
    PXSizeCeilingToPixel();
    v22 = v21;
    v24 = v23;
    v36.origin.x = MinX;
    v36.origin.y = MinY;
    v36.size.width = Width;
    v36.size.height = v18;
    v25 = v13 + CGRectGetMinX(v36);
    v37.origin.x = MinX;
    v37.origin.y = MinY;
    v37.size.width = Width;
    v37.size.height = v18;
    v26 = CGRectGetMinY(v37) - v28;
  }
  else
  {
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v24 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  }
  v27 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __38__PXTripFeedItemLayout__updateContent__block_invoke;
  v30[3] = &unk_1E511B2F8;
  v30[4] = self;
  *(CGFloat *)&v30[5] = MinX;
  *(CGFloat *)&v30[6] = MinY;
  *(CGFloat *)&v30[7] = Width;
  *(double *)&v30[8] = v18;
  v31 = v20;
  v30[9] = v29;
  *(double *)&v30[10] = v25;
  *(double *)&v30[11] = v26;
  v30[12] = v22;
  v30[13] = v24;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v27 << 32, v30);
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (id)_createTitleSubtitleSpec
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init((Class)off_1E50B5C68);
  v3 = objc_alloc_init((Class)off_1E50B31F8);
  PXSystemFontOfSizeAndWeight();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  objc_msgSend(v3, "setVerticalAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  v6 = objc_alloc_init((Class)off_1E50B31F8);
  PXSystemFontOfSizeAndWeight();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v6, "setTextAlignment:", 4);
  objc_msgSend(v6, "setNumberOfLines:", 1);
  objc_msgSend(v6, "setVerticalAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v2, "setTitleLabelSpec:", v3);
  objc_msgSend(v2, "setSubtitleLabelSpec:", v6);

  return v2;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v7;

  if (self->_shadowSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripFeedItemLayout.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index == _shadowSpriteIndex"));

  }
  return _Shadow();
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v7;

  if (self->_shadowSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripFeedItemLayout.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index == _shadowSpriteIndex"));

  }
  return 23.0;
}

- (id)titleForSpriteAtIndex:(unsigned int)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v10;

  if (self->_titleSubtitleSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripFeedItemLayout.m"), 256, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXTripFeedItemLayout tripHighlight](self, "tripHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E5149688;
  v6 = v4;

  return v6;
}

- (id)subtitleForSpriteAtIndex:(unsigned int)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v10;

  if (self->_titleSubtitleSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripFeedItemLayout.m"), 265, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXTripFeedItemLayout tripHighlight](self, "tripHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E5149688;
  v6 = v4;

  return v6;
}

- (PXStoryExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PHPhotosHighlight)tripHighlight
{
  return self->_tripHighlight;
}

- (PHFetchResult)keyAssets
{
  return self->_keyAssets;
}

- (PXTitleSubtitleLabelSpec)titleSubtitleSpec
{
  return self->_titleSubtitleSpec;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleSubtitleSpec, 0);
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_tripHighlight, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

void __38__PXTripFeedItemLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float32x2_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float32x2_t *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  float64x2_t v39;
  _OWORD *v40;
  float64_t v41;
  float64x2_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  CGFloat v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGFloat Width;
  __int128 v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v5 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848));
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v58.origin.x = v6;
  v58.origin.y = v7;
  v58.size.width = v8;
  v58.size.height = v9;
  MidX = CGRectGetMidX(v58);
  v59.origin.x = v6;
  v59.origin.y = v7;
  v59.size.width = v8;
  v59.size.height = v9;
  MidY = CGRectGetMidY(v59);
  v60.origin.x = v6;
  v60.origin.y = v7;
  v60.size.width = v8;
  v60.size.height = v9;
  Width = CGRectGetWidth(v60);
  v61.origin.x = v6;
  v61.origin.y = v7;
  v61.size.width = v8;
  v61.size.height = v9;
  Height = CGRectGetHeight(v61);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0xBFB99999A0000000;
  v5[3] = vcvt_f32_f64(v13);
  v14 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848));
  v15 = *((_OWORD *)off_1E50B83A0 + 1);
  v57 = *(_OWORD *)off_1E50B83A0;
  *v14 = *(_OWORD *)off_1E50B83A0;
  v14[1] = v15;
  v55 = v15;
  v53 = *((_OWORD *)off_1E50B83A0 + 4);
  v54 = *((_OWORD *)off_1E50B83A0 + 5);
  v14[4] = v53;
  v14[5] = v54;
  v51 = *((_OWORD *)off_1E50B83A0 + 2);
  v52 = *((_OWORD *)off_1E50B83A0 + 3);
  v14[2] = v51;
  v14[3] = v52;
  v49 = *((_OWORD *)off_1E50B83A0 + 8);
  v50 = *((_OWORD *)off_1E50B83A0 + 9);
  v14[8] = v49;
  v14[9] = v50;
  v47 = *((_OWORD *)off_1E50B83A0 + 6);
  v48 = *((_OWORD *)off_1E50B83A0 + 7);
  v14[6] = v47;
  v14[7] = v48;
  __asm { FMOV            V0.4S, #23.0 }
  *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848) + 36) = _Q0;
  v21 = a3[4];
  *(_WORD *)(v21 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 888);
  *(_BYTE *)(v21 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848) + 1) = 2;
  v22 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 848);
  *(float *)&v15 = *(double *)(a1 + 72);
  *(float32x2_t *)(v21 + 40 * v22 + 8) = vmul_n_f32(*(float32x2_t *)(a3[2] + 32 * v22 + 24), *(float *)&v15);
  v23 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 852);
  v24 = (float32x2_t *)(a3[2] + 32 * v23);
  v25 = a3[3] + 160 * v23;
  v26 = a3[4] + 40 * v23;
  _Shadow();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  PXGConfigureShadowSprite(v24, v25, v26, v27, *(void **)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));

  v28 = a3[4];
  *(_WORD *)(v28 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 852) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 888);
  v29 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856);
  v30 = a3[2];
  if (*(_BYTE *)(a1 + 112))
  {
    v31 = (float32x2_t *)(v30 + 32 * v29);
    v32 = *(double *)(a1 + 80);
    v33 = *(double *)(a1 + 88);
    v34 = *(double *)(a1 + 96);
    v35 = *(double *)(a1 + 104);
    v62.origin.x = v32;
    v62.origin.y = v33;
    v62.size.width = v34;
    v62.size.height = v35;
    v36 = CGRectGetMidX(v62);
    v63.origin.x = v32;
    v63.origin.y = v33;
    v63.size.width = v34;
    v63.size.height = v35;
    v37 = CGRectGetMidY(v63);
    v64.origin.x = v32;
    v64.origin.y = v33;
    v64.size.width = v34;
    v64.size.height = v35;
    v46 = CGRectGetWidth(v64);
    v65.origin.x = v32;
    v65.origin.y = v33;
    v65.size.width = v34;
    v65.size.height = v35;
    v38 = CGRectGetHeight(v65);
    v39.f64[0] = v46;
    v39.f64[1] = v38;
    *(CGFloat *)v31 = v36;
    *(CGFloat *)&v31[1] = v37;
    v31[2] = (float32x2_t)0xBFD3333340000000;
    v31[3] = vcvt_f32_f64(v39);
    v40 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856));
    *v40 = v57;
    v40[1] = v55;
    v40[4] = v53;
    v40[5] = v54;
    v40[2] = v51;
    v40[3] = v52;
    v40[8] = v49;
    v40[9] = v50;
    v40[6] = v47;
    v40[7] = v48;
    *(_BYTE *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 1) = 4;
    PXSizeScale();
    v42.f64[1] = v41;
    *(float32x2_t *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 8) = vcvt_f32_f64(v42);
    *(_WORD *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                               + 888);
  }
  else
  {
    v43 = a3[3];
    v44 = v30 + 32 * v29;
    *(float32x2_t *)(v44 + 24) = vcvt_f32_f64(*MEMORY[0x1E0C9D820]);
    *(_OWORD *)v44 = *MEMORY[0x1E0C9D538];
    *(_QWORD *)(v44 + 16) = 0;
    v45 = (_OWORD *)(v43 + 160 * v29);
    v45[4] = v53;
    v45[5] = v54;
    v45[2] = v51;
    v45[3] = v52;
    v45[8] = v49;
    v45[9] = v50;
    v45[6] = v47;
    v45[7] = v48;
    *v45 = v57;
    v45[1] = v55;
    *(_DWORD *)v45 = 0;
    *(_BYTE *)(v28 + 40 * v29 + 1) = 0;
  }
}

@end
