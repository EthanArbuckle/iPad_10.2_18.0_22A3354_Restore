@implementation PXGSublayoutComposition

- ($06332BE312745A7AB8CCAAA06CB8ACFF)sublayoutGeometries
{
  id v2;
  $06332BE312745A7AB8CCAAA06CB8ACFF *v3;

  -[PXGSublayoutComposition sublayoutDataStore](self, "sublayoutDataStore");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = ($06332BE312745A7AB8CCAAA06CB8ACFF *)objc_msgSend(v2, "geometries");

  return v3;
}

- (int64_t)numberOfSublayouts
{
  void *v2;
  int64_t v3;

  -[PXGSublayoutComposition sublayoutDataStore](self, "sublayoutDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (PXGSublayoutDataStore)sublayoutDataStore
{
  return self->_sublayoutDataStore;
}

- (void)invalidateEstimatedSublayoutGeometries
{
  void *v2;
  void *v3;
  id v4;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGSublayoutComposition.m"), 143, CFSTR("invalidating %lu after it already has been updated"), 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
  -[PXGSublayoutComposition compositeLayout](self, "compositeLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compositionDidChange");

}

- (PXGCompositeLayout)compositeLayout
{
  return (PXGCompositeLayout *)objc_loadWeakRetained((id *)&self->_compositeLayout);
}

- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)updateEstimate
{
  void *v3;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PXGSublayoutComposition sublayoutDataStore](self, "sublayoutDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSublayoutComposition setLastSublayoutDataStoreVersion:](self, "setLastSublayoutDataStoreVersion:", objc_msgSend(v3, "version"));

  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSublayoutComposition updateEstimate]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSublayoutComposition.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGSublayoutComposition updateSublayoutAttributes](self, "updateSublayoutAttributes");
      if (!self->_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSublayoutComposition updateEstimate]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGSublayoutComposition.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = self->_updateFlags.needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      self->_updateFlags.needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGSublayoutComposition updateEstimatedSublayoutGeometries](self, "updateEstimatedSublayoutGeometries");
      v5 = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSublayoutComposition updateEstimate]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGSublayoutComposition.m"), 122, CFSTR("still needing to update %lu after update pass"), self->_updateFlags.needsUpdate);

    }
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_visibleRect))
  {
    self->_visibleRect.origin.x = x;
    self->_visibleRect.origin.y = y;
    self->_visibleRect.size.width = width;
    self->_visibleRect.size.height = height;
    -[PXGSublayoutComposition visibleRectDidChange](self, "visibleRectDidChange");
  }
}

- (void)setSublayoutDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_sublayoutDataStore, a3);
}

- (void)setReferenceSize:(CGSize)a3
{
  if (a3.width != self->_referenceSize.width || a3.height != self->_referenceSize.height)
  {
    self->_referenceSize = a3;
    -[PXGSublayoutComposition referenceSizeDidChange](self, "referenceSizeDidChange");
  }
}

- (void)setLastSublayoutDataStoreVersion:(int64_t)a3
{
  if (self->_lastSublayoutDataStoreVersion != a3)
  {
    self->_lastSublayoutDataStoreVersion = a3;
    -[PXGSublayoutComposition invalidateSublayoutAttributes](self, "invalidateSublayoutAttributes");
    -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
  }
}

- (void)setCompositeLayout:(id)a3
{
  objc_storeWeak((id *)&self->_compositeLayout, a3);
}

- (void)invalidateSublayoutAttributes
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSublayoutComposition invalidateSublayoutAttributes]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGSublayoutComposition.m"), 126, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

- (int64_t)anchorSublayoutIndexForAnchoredContentEdges:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 3) != 0)
    return 0;
  if ((a3 & 0xC) != 0)
    return -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts", v3, v4) - 1;
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)invalidateSublayoutContentSizes
{
  uint64_t v3;
  PXGSublayoutComposition *v4;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;

  v3 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v4 = objc_retainAutorelease(self);
  v5 = -[PXGSublayoutComposition sublayoutGeometries](v4, "sublayoutGeometries");
  if (v3 >= 1)
  {
    v6 = (_OWORD *)(v5 + 32);
    v7 = *(_OWORD *)off_1E50B8810;
    do
    {
      *v6 = v7;
      v6 = (_OWORD *)((char *)v6 + 136);
      --v3;
    }
    while (v3);
  }
  -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](v4, "invalidateEstimatedSublayoutGeometries");
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXGLayout)layout
{
  void *v4;
  void *v6;

  -[PXGSublayoutComposition compositeLayout](self, "compositeLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutComposition.m"), 31, CFSTR("missing layout on %@"), self);

  }
  return (PXGLayout *)v4;
}

- (void)enumerateSublayoutProvidersForRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  int64_t location;
  id v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, int64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v9 = location + length;
  -[PXGSublayoutComposition sublayoutDataStore](self, "sublayoutDataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if ((uint64_t)(location + length) > v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutComposition.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rangeMax <= self.sublayoutDataStore.count"));

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXGSublayoutComposition_enumerateSublayoutProvidersForRange_usingBlock___block_invoke;
  aBlock[3] = &unk_1E513BC80;
  v23 = &v26;
  v24 = &v30;
  aBlock[4] = self;
  v25 = a2;
  v12 = v8;
  v22 = v12;
  v13 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  -[PXGSublayoutComposition sublayoutDataStore](self, "sublayoutDataStore");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "infos");

  if (location < v9)
  {
    v16 = v31;
    v17 = v27;
    v18 = (uint64_t *)(v15 + 16 * location + 8);
    while (1)
    {
      v19 = *v18;
      if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_8;
      if (v19 != v17[3])
        break;
LABEL_9:
      ++location;
      v18 += 2;
      if (!--length)
        goto LABEL_10;
    }
    v13[2](v13, location);
    v16 = v31;
    v17 = v27;
LABEL_8:
    v16[3] = location;
    v17[3] = v19;
    goto LABEL_9;
  }
LABEL_10:
  v13[2](v13, v9);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

void __74__PXGSublayoutComposition_enumerateSublayoutProvidersForRange_usingBlock___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;

  v2 = *(id *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("PXGSublayoutComposition.m"), 90, CFSTR("sublayout composition currently only works with sublayout providers"));

  }
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)updateEstimatedSublayoutGeometries
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutComposition.m"), 148, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGSublayoutComposition updateEstimatedSublayoutGeometries]", v6);

  abort();
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutComposition.m"), 164, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGSublayoutComposition updateSublayoutGeometriesFromAnchorSublayoutIndex:usingSublayoutUpdateBlock:]", v9);

  abort();
}

- (CGRect)contentBounds
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutComposition.m"), 168, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGSublayoutComposition contentBounds]", v6);

  abort();
}

- (int64_t)lastSublayoutDataStoreVersion
{
  return self->_lastSublayoutDataStoreVersion;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayoutDataStore, 0);
  objc_destroyWeak((id *)&self->_compositeLayout);
}

@end
