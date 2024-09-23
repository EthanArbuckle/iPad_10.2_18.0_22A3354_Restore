@implementation PXGStackedSublayoutComposition

void __68__PXGStackedSublayoutComposition_updateEstimatedSublayoutGeometries__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3 + a4;
  if (v7 >= 1)
  {
    v8 = 0;
    for (i = 0; i != v7; ++i)
    {
      v10 = *(_QWORD *)(a1 + 40) + v8;
      *(_OWORD *)v10 = *(_OWORD *)(a1 + 48);
      *(_WORD *)(v10 + 24) = *(_WORD *)(a1 + 64);
      if (PXSizeIsNull())
      {
        objc_msgSend(v13, "layout:estimatedContentSizeForSublayoutAtIndex:referenceSize:", *(_QWORD *)(a1 + 32), i, *(double *)v10, *(double *)(v10 + 8));
        *(_QWORD *)(v10 + 32) = v11;
        *(_QWORD *)(v10 + 40) = v12;
      }
      v8 += 136;
    }
  }

}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6;
  int64_t v7;
  PXGStackedSublayoutComposition *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, int64_t);
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double *v24;
  double v25;
  double v26;
  int64_t v27;
  double *v28;
  double v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;

  v6 = a4;
  v7 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x3010000000;
  v41 = &unk_1A7E74EE7;
  v42 = *MEMORY[0x1E0C9D820];
  v8 = objc_retainAutorelease(self);
  v9 = -[PXGSublayoutComposition sublayoutGeometries](v8, "sublayoutGeometries");
  -[PXGStackedSublayoutComposition axis](v8, "axis");
  PXMinRectEdgeForAxis();
  v10 = PXEdgesFromCGRectEdge();
  PXMaxRectEdgeForAxis();
  v11 = PXEdgesFromCGRectEdge();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PXGStackedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke;
  aBlock[3] = &unk_1E511DC70;
  v33 = a3;
  v34 = v10;
  v35 = v11;
  v36 = v7;
  v37 = v9;
  v12 = v6;
  v31 = v12;
  v32 = &v38;
  v13 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  v13[2](v13, a3);
  v14 = v39[4];
  v15 = v39[5];
  v16 = -[PXGStackedSublayoutComposition axis](v8, "axis");
  if (v16 == 1)
    v17 = 1.0;
  else
    v17 = 0.0;
  if (v16 == 1)
    v18 = 0.0;
  else
    v18 = 1.0;
  if (a3 >= 1)
  {
    v19 = *MEMORY[0x1E0C9D538];
    v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v21 = -v18;
    v22 = -v17;
    v23 = a3 + 1;
    v24 = (double *)(v9 + 136 * a3 - 88);
    do
    {
      v25 = v24[1] + v17 * v20;
      *v24 = *v24 + v18 * v19;
      v24[1] = v25;
      v13[2](v13, v23 - 2);
      v26 = v24[1];
      *v24 = *v24 + v21 * v39[4];
      v24[1] = v26 + v22 * v39[5];
      v19 = v19 + v21 * v39[4];
      v20 = v20 + v22 * v39[5];
      --v23;
      v24 -= 17;
    }
    while (v23 > 1);
  }
  v27 = a3 + 1;
  if (a3 + 1 < v7)
  {
    v28 = (double *)(v9 + 136 * a3 + 192);
    do
    {
      v29 = *v28 + v17 * v15;
      *(v28 - 1) = *(v28 - 1) + v18 * v14;
      *v28 = v29;
      v13[2](v13, v27);
      v14 = v14 + v18 * v39[4];
      v15 = v15 + v17 * v39[5];
      ++v27;
      v28 += 17;
    }
    while (v7 != v27);
  }

  _Block_object_dispose(&v38, 8);
}

uint64_t __110__PXGStackedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = PXSizeSubtract();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
    -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
  }
}

- (void)setInterlayoutSpacing:(double)a3
{
  if (self->_interlayoutSpacing != a3)
  {
    self->_interlayoutSpacing = a3;
    -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
  }
}

- (void)setAxis:(int64_t)a3
{
  void *v5;

  if (self->_axis != a3)
  {
    self->_axis = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGStackedSublayoutComposition.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("axis != PXAxisUndefined"));

    }
    -[PXGSublayoutComposition invalidateEstimatedSublayoutGeometries](self, "invalidateEstimatedSublayoutGeometries");
  }
}

- (CGRect)contentBounds
{
  PXGStackedSublayoutComposition *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (-[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts"))
  {
    v4 = objc_retainAutorelease(self);
    -[PXGSublayoutComposition sublayoutGeometries](v4, "sublayoutGeometries");
    if (!-[PXGStackedSublayoutComposition axis](v4, "axis"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PXGStackedSublayoutComposition.m"), 161, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXGStackedSublayoutComposition padding](v4, "padding");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
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

- (PXGStackedSublayoutComposition)init
{
  PXGStackedSublayoutComposition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGStackedSublayoutComposition;
  result = -[PXGStackedSublayoutComposition init](&v3, sel_init);
  if (result)
    result->_axis = 1;
  return result;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGStackedSublayoutComposition;
  -[PXGSublayoutComposition referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGSublayoutComposition invalidateSublayoutContentSizes](self, "invalidateSublayoutContentSizes");
}

- (void)updateEstimatedSublayoutGeometries
{
  uint64_t v4;
  PXGStackedSublayoutComposition *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  double v30;
  double v31;
  __int16 v32;

  v4 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v5 = objc_retainAutorelease(self);
  v6 = -[PXGSublayoutComposition sublayoutGeometries](v5, "sublayoutGeometries");
  -[PXGSublayoutComposition layout](v5, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSublayoutComposition referenceSize](v5, "referenceSize");
  v9 = v8;
  v11 = v10;
  -[PXGStackedSublayoutComposition padding](v5, "padding");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[PXGStackedSublayoutComposition axis](v5, "axis");
  v21 = 0.0;
  if (v20 == 1)
  {
    v9 = v9 - (v15 + v19);
    v21 = 1.0;
    v22 = 0.0;
  }
  else if (v20 == 2)
  {
    v11 = v11 - (v13 + v17);
    v22 = 1.0;
  }
  else
  {
    v22 = 0.0;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXGStackedSublayoutComposition.m"), 65, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__PXGStackedSublayoutComposition_updateEstimatedSublayoutGeometries__block_invoke;
  v27[3] = &unk_1E511DC48;
  v29 = v6;
  v30 = v9;
  v31 = v11;
  v32 = 0;
  v26 = v7;
  v28 = v26;
  -[PXGSublayoutComposition enumerateSublayoutProvidersForRange:usingBlock:](v5, "enumerateSublayoutProvidersForRange:usingBlock:", 0, v4, v27);
  -[PXGStackedSublayoutComposition interlayoutSpacing](v5, "interlayoutSpacing");
  if (v4 >= 1)
  {
    v25 = (double *)(v6 + 64);
    do
    {
      *(v25 - 2) = v15;
      *(v25 - 1) = v13;
      *v25 = 0.0;
      v15 = v15 + v22 * (v24 + *(v25 - 4));
      v13 = v13 + v21 * (v24 + *(v25 - 3));
      v25 += 17;
      --v4;
    }
    while (v4);
  }

}

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

@end
