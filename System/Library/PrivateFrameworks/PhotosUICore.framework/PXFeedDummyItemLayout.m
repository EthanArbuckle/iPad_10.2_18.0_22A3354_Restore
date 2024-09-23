@implementation PXFeedDummyItemLayout

- (PXFeedDummyItemLayout)init
{
  PXFeedDummyItemLayout *v2;
  PXFeedDummyItemLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedDummyItemLayout;
  v2 = -[PXGLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_backgroundSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v2, "addSpriteWithInitialState:", 0);
    v3->_textSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v3, "addSpriteWithInitialState:", 0);
    -[PXGLayout setContentSource:](v3, "setContentSource:", v3);
  }
  return v3;
}

- (void)setRepresentedObject:(id)a3
{
  id v5;
  char v6;
  id v7;

  v7 = a3;
  v5 = self->_representedObject;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = objc_msgSend(v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong(&self->_representedObject, a3);
      -[PXFeedDummyItemLayout _invalidateContentVersion](self, "_invalidateContentVersion");
    }
  }

}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedDummyItemLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXFeedDummyItemLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedDummyItemLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXFeedDummyItemLayout _invalidateContent](self, "_invalidateContent");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedDummyItemLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedDummyItemLayout.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXFeedDummyItemLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedDummyItemLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXFeedDummyItemLayout.m"), 65, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXFeedDummyItemLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)_invalidateContentVersion
{
  ++self->_contentVersion;
  -[PXFeedDummyItemLayout _invalidateContent](self, "_invalidateContent");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedDummyItemLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedDummyItemLayout.m"), 75, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  v7 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PXFeedDummyItemLayout__updateContent__block_invoke;
  v8[3] = &unk_1E5125040;
  v8[5] = v4;
  v8[6] = v6;
  v8[4] = self;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v7 << 32, v8);
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_backgroundSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedDummyItemLayout.m"), 105, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v9;

  v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedDummyItemLayout.m"), 115, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedDummyItemLayout.m"), 124, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXFeedDummyItemLayout representedObject](self, "representedObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("<%@: %p>"), v12, v9);

  return v13;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v11;

  v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedDummyItemLayout.m"), 144, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  if (stringAttributesAtIndex_inLayout__onceToken != -1)
    dispatch_once(&stringAttributesAtIndex_inLayout__onceToken, &__block_literal_global_93259);
  v9 = (id)stringAttributesAtIndex_inLayout__attributes;

  return v9;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v9;

  v7 = a4;
  if (self->_textSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedDummyItemLayout.m"), 152, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

  return 0;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);
}

void __58__PXFeedDummyItemLayout_stringAttributesAtIndex_inLayout___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v0, "setAlignment:", 1);
  objc_msgSend(v0, "setLineBreakMode:", 0);
  v6[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC1448]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = *MEMORY[0x1E0DC1178];
  v3 = (void *)objc_msgSend(v0, "copy");
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)stringAttributesAtIndex_inLayout__attributes;
  stringAttributesAtIndex_inLayout__attributes = v4;

}

float32x2_t __39__PXFeedDummyItemLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  float32x2_t *v15;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v19;
  _OWORD *v20;
  uint64_t v26;
  float32x2_t *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  float64x2_t v33;
  _OWORD *v34;
  uint64_t v35;
  uint64_t v36;
  float32x2_t result;
  CGFloat v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGFloat Width;
  __int128 v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  PXRectWithOriginAndSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  v14 = v13;
  v15 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  MidX = CGRectGetMidX(v50);
  v51.origin.x = v6;
  v51.origin.y = v8;
  v51.size.width = v10;
  v51.size.height = v12;
  MidY = CGRectGetMidY(v51);
  v52.origin.x = v6;
  v52.origin.y = v8;
  v52.size.width = v10;
  v52.size.height = v12;
  Width = CGRectGetWidth(v52);
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  Height = CGRectGetHeight(v53);
  v19.f64[0] = Width;
  v19.f64[1] = Height;
  *(CGFloat *)v15 = MidX;
  *(CGFloat *)&v15[1] = MidY;
  v15[2] = 0;
  v15[3] = vcvt_f32_f64(v19);
  v20 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  v47 = *(_OWORD *)off_1E50B83A0;
  v49 = *((_OWORD *)off_1E50B83A0 + 1);
  *v20 = *(_OWORD *)off_1E50B83A0;
  v20[1] = v49;
  v45 = *((_OWORD *)off_1E50B83A0 + 5);
  v46 = *((_OWORD *)off_1E50B83A0 + 4);
  v20[4] = v46;
  v20[5] = v45;
  v43 = *((_OWORD *)off_1E50B83A0 + 3);
  v44 = *((_OWORD *)off_1E50B83A0 + 2);
  v20[2] = v44;
  v20[3] = v43;
  v41 = *((_OWORD *)off_1E50B83A0 + 9);
  v42 = *((_OWORD *)off_1E50B83A0 + 8);
  v20[8] = v42;
  v20[9] = v41;
  v39 = *((_OWORD *)off_1E50B83A0 + 7);
  v40 = *((_OWORD *)off_1E50B83A0 + 6);
  v20[6] = v40;
  v20[7] = v39;
  __asm { FMOV            V0.4S, #10.0 }
  *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 36) = _Q0;
  v26 = a3[4];
  *(_BYTE *)(v26 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(v26 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 8) = _Q0;
  v27 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876));
  *(CGFloat *)&_Q0 = v6;
  v19.f64[0] = v8;
  v28 = v10;
  v29 = v12;
  v30 = CGRectGetMidX(*(CGRect *)((char *)&v19 - 8));
  v54.origin.x = v6;
  v54.origin.y = v8;
  v54.size.width = v10;
  v54.size.height = v12;
  v31 = CGRectGetMidY(v54);
  v55.origin.x = v6;
  v55.origin.y = v8;
  v55.size.width = v10;
  v55.size.height = v12;
  v38 = CGRectGetWidth(v55);
  v56.origin.x = v6;
  v56.origin.y = v8;
  v56.size.width = v10;
  v56.size.height = v12;
  v32 = CGRectGetHeight(v56);
  v33.f64[0] = v38;
  v33.f64[1] = v32;
  *(CGFloat *)v27 = v30;
  *(CGFloat *)&v27[1] = v31;
  v27[2] = (float32x2_t)0xBFF0000000000000;
  v27[3] = vcvt_f32_f64(v33);
  v34 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876));
  *v34 = v47;
  v34[1] = v49;
  v34[4] = v46;
  v34[5] = v45;
  v34[2] = v44;
  v34[3] = v43;
  v34[8] = v42;
  v34[9] = v41;
  v34[6] = v40;
  v34[7] = v39;
  v35 = a3[4];
  *(_BYTE *)(v35 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 1) = 3;
  v36 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876);
  *(float *)v33.f64 = v14;
  result = vmul_n_f32(*(float32x2_t *)(a3[2] + 32 * v36 + 24), *(float *)v33.f64);
  *(float32x2_t *)(v35 + 40 * v36 + 8) = result;
  *(_WORD *)(a3[4] + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 876) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 880);
  return result;
}

@end
