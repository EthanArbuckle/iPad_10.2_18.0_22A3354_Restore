@implementation PXStoryViewLegibilityOverlayLayout

- (PXStoryViewLegibilityOverlayLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 43, CFSTR("%s is not available as initializer"), "-[PXStoryViewLegibilityOverlayLayout init]");

  abort();
}

- (PXStoryViewLegibilityOverlayLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryViewLegibilityOverlayLayout *v6;
  PXStoryViewLegibilityOverlayLayout *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PXStoryViewLegibilityOverlayLayout *v12;
  uint64_t (**v13)(void *, _QWORD);
  _QWORD aBlock[4];
  PXStoryViewLegibilityOverlayLayout *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  v6 = -[PXGLayout init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_203477);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v7->_solidDimmingSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", &__block_literal_global_203500);
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    LODWORD(v10) = 1.0;
    LODWORD(v11) = 0;
    v7->_gradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v7, "addResizableCapInsets:", v8, v9, v10, v11);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_2;
    aBlock[3] = &unk_1E5135600;
    v12 = v7;
    v16 = v12;
    v13 = (uint64_t (**)(void *, _QWORD))_Block_copy(aBlock);
    v12->_topGradientDimmingSpriteIndex = v13[2](v13, 0);
    v12->_bottomGradientDimmingSpriteIndex = v13[2](v13, 1);

  }
  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryViewLegibilityOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (void)setAlphaOverride:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_alphaOverride;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      -[PXStoryViewLegibilityOverlayLayout _invalidateContent](self, "_invalidateContent");
    }
  }

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLegibilityOverlayLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryViewLegibilityOverlayLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLegibilityOverlayLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 99, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  -[PXGLayout update](&v9, sel_update);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLegibilityOverlayLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 104, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateContent
{
  double v3;
  double v4;
  void *v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PXStoryViewLegibilityOverlayLayout *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXStoryViewLegibilityOverlayLayout alphaOverride](self, "alphaOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v4 = v6;
  }
  -[PXGLayout referenceSize](self, "referenceSize");
  v8 = v7;
  v10 = v9;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  -[PXStoryViewLegibilityOverlayLayout viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v13 = v12;
  v14 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__PXStoryViewLegibilityOverlayLayout__updateContent__block_invoke;
  v17[3] = &unk_1E5135628;
  v20 = v8;
  v21 = v10;
  v18 = v11;
  v19 = self;
  v22 = v4;
  v23 = v13;
  v15 = v11;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v14, v17);

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (self->_solidDimmingSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 148, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wantsHighContrastColors");

  if (v10)
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[PXStoryViewLegibilityOverlayLayout viewModel](self, "viewModel", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewLayoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legibilityGradientImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5;

  v5 = a3;
  -[PXGLayout alpha](self, "alpha");
  objc_msgSend(v5, "setLegibilityOverlayAlpha:");

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  void *v5;
  id v6;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "legibilityOverlayAlpha");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewLegibilityOverlayLayout setAlphaOverride:](self, "setAlphaOverride:", v6);

  }
  else
  {
    -[PXStoryViewLegibilityOverlayLayout setAlphaOverride:](self, "setAlphaOverride:", 0, a4);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)ViewModelObservationContext_203477 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLegibilityOverlayLayout.m"), 176, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x18000002A020) != 0)
  {
    v11 = v9;
    -[PXStoryViewLegibilityOverlayLayout _invalidateContent](self, "_invalidateContent");
    v9 = v11;
  }

}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __52__PXStoryViewLegibilityOverlayLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float32x2_t *v14;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v17;
  float64x2_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  float v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  float64x2_t v36;
  uint64_t v37;
  float v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  float64x2_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGRect remainder;
  CGRect v64;
  CGRect slice;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  objc_msgSend(*(id *)(a1 + 32), "viewLayoutSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXRectWithOriginAndSize();
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  v14 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872));
  MidX = CGRectGetMidX(v66);
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  MidY = CGRectGetMidY(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  v60 = CGRectGetWidth(v68);
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  v17 = CGRectGetHeight(v69);
  v18.f64[0] = v60;
  v18.f64[1] = v17;
  *(CGFloat *)v14 = MidX;
  *(CGFloat *)&v14[1] = MidY;
  v14[2] = 0;
  v14[3] = vcvt_f32_f64(v18);
  v19 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "solidLegibilityOverlayOpacity");
  *(float *)&v20 = v19 * v20;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872)) = LODWORD(v20);
  v21 = a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872);
  objc_msgSend(v9, "solidLegibilityGradientCornerRadius");
  *(float *)&v22 = v22;
  *(int32x4_t *)(v21 + 36) = vdupq_lane_s32(*(int32x2_t *)&v22, 0);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 872) + 24) = 0x10000;
  memset(&slice, 0, sizeof(slice));
  memset(&v64, 0, sizeof(v64));
  memset(&remainder, 0, sizeof(remainder));
  objc_msgSend(v9, "topLegibilityGradientHeight");
  v24 = v23;
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  CGRectDivide(v70, &slice, &remainder, v24, CGRectMinYEdge);
  objc_msgSend(v9, "bottomLegibilityGradientHeight");
  v26 = v25;
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  CGRectDivide(v71, &v64, &remainder, v26, CGRectMaxYEdge);
  v27 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876);
  v28 = *(double *)(a1 + 72) * -0.8;
  v29 = slice.origin.x;
  v30 = slice.origin.y;
  v31 = slice.size.width;
  v32 = slice.size.height;
  v33 = CGRectGetMidX(slice);
  v72.origin.x = v29;
  v72.origin.y = v30;
  v72.size.width = v31;
  v72.size.height = v32;
  v34 = CGRectGetMidY(v72);
  v73.origin.x = v29;
  v73.origin.y = v30;
  v73.size.width = v31;
  v73.size.height = v32;
  v61 = CGRectGetWidth(v73);
  v74.origin.x = v29;
  v74.origin.y = v30;
  v74.size.width = v31;
  v74.size.height = v32;
  v35 = CGRectGetHeight(v74);
  v36.f64[0] = v61;
  v36.f64[1] = v35;
  *(CGFloat *)v27 = v33;
  *(CGFloat *)(v27 + 8) = v34;
  *(double *)(v27 + 16) = v28;
  *(float32x2_t *)(v27 + 24) = vcvt_f32_f64(v36);
  v37 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880);
  v38 = *(double *)(a1 + 72) * -0.8;
  v39 = v64.origin.x;
  v40 = v64.origin.y;
  v41 = v64.size.width;
  v42 = v64.size.height;
  v43 = v64.origin.x;
  v36.f64[0] = v64.origin.y;
  v44 = v64.size.width;
  v45 = v64.size.height;
  v46 = CGRectGetMidX(*(CGRect *)((char *)&v36 - 8));
  v75.origin.x = v39;
  v75.origin.y = v40;
  v75.size.width = v41;
  v75.size.height = v42;
  v47 = CGRectGetMidY(v75);
  v76.origin.x = v39;
  v76.origin.y = v40;
  v76.size.width = v41;
  v76.size.height = v42;
  v62 = CGRectGetWidth(v76);
  v77.origin.x = v39;
  v77.origin.y = v40;
  v77.size.width = v41;
  v77.size.height = v42;
  v48 = CGRectGetHeight(v77);
  v49.f64[0] = v62;
  v49.f64[1] = v48;
  *(CGFloat *)v37 = v46;
  *(CGFloat *)(v37 + 8) = v47;
  *(double *)(v37 + 16) = v38;
  *(float32x2_t *)(v37 + 24) = vcvt_f32_f64(v49);
  v50 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "topGradientLegibilityOverlayOpacity");
  *(float *)&v51 = v50 * v51;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876)) = LODWORD(v51);
  v52 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "bottomGradientLegibilityOverlayOpacity");
  *(float *)&v53 = v52 * v53;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880)) = LODWORD(v53);
  v54 = a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876);
  objc_msgSend(v9, "topLegibilityGradientCornerRadius");
  *(float *)&v52 = v55;
  objc_msgSend(v9, "topLegibilityGradientCornerRadius");
  *(float *)&v56 = v56;
  *(_DWORD *)(v54 + 36) = LODWORD(v52);
  *(_DWORD *)(v54 + 40) = LODWORD(v56);
  *(_QWORD *)(v54 + 44) = 0;
  v57 = a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880);
  objc_msgSend(v9, "bottomLegibilityGradientCornerRadius");
  *(float *)&v40 = v58;
  objc_msgSend(v9, "bottomLegibilityGradientCornerRadius");
  *(float *)&v59 = v59;
  *(_QWORD *)(v57 + 36) = 0;
  *(_DWORD *)(v57 + 44) = LODWORD(v40);
  *(_DWORD *)(v57 + 48) = LODWORD(v59);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 876) + 24) = 102;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 880) + 24) = 102;

}

uint64_t __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_3;
  v6[3] = &unk_1E51355D8;
  v7 = v3;
  v8 = a2;
  v4 = objc_msgSend(v7, "addSpriteWithInitialState:", v6);

  return v4;
}

__n128 __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __n128 result;
  __int128 v12;
  uint64_t v13;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 24);
  *(_WORD *)(v9 + 68) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 884);
  if (*(_BYTE *)(a1 + 40))
    *(_BYTE *)(v9 + 70) = 2;
  v10 = *(_QWORD *)(a3 + 32);
  result = *(__n128 *)off_1E50B8398;
  v12 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v10 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v10 + 16) = v12;
  *(_QWORD *)(v10 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  v13 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v13 + 1) = 1;
  *(_BYTE *)(v13 + 34) = 2;
  return result;
}

double __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  double result;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v9 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v9 + 8) = result;
  return result;
}

@end
