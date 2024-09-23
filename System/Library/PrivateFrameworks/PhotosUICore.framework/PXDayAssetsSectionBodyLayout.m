@implementation PXDayAssetsSectionBodyLayout

+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 spec:(id)a4 style:(int64_t)a5 numberOfAssets:(int64_t)a6
{
  double width;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  if (a6)
  {
    v9 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:](PXLayoutMetricInterpolator, "photosGridLayoutColumnsForWidth:", a4, a3.width, a3.height);
    v10 = -0.0;
    if (a5 != 2)
      v10 = width;
    v11 = v10 + width / (double)v9 * (double)(a6 / v9);
  }
  else
  {
    v11 = 0.0;
  }
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return -[PXDayAssetsSectionBodyLayout _initialItemInDirection:](self, "_initialItemInDirection:", a4);
  else
    return -[PXDayAssetsSectionBodyLayout _itemClosestToItem:inDirection:](self, "_itemClosestToItem:inDirection:", a3, a4);
}

- (int64_t)_itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  int64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD v35[4];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  CGRect v42;

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXDayAssetsSectionBodyLayout exploreGenerator](self, "exploreGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_19;
  objc_msgSend(v7, "presentedRectForItemAtIndex:", a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v8, "presentedItemLocationForItemAtIndex:", a3);
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  if (CGRectEqualToRect(v42, *MEMORY[0x1E0C9D628]))
  {
LABEL_19:
    v18 = v39;
    goto LABEL_20;
  }
  if (a4 - 5 > 1)
  {
    v19 = objc_msgSend(v8, "presentedNumberOfColumnsAtRow:", (_QWORD)v36);
    switch(a4)
    {
      case 1uLL:
        v20 = 0.0;
        v21 = -1.0;
        if ((uint64_t)v36 <= 0)
          v21 = 0.0;
        break;
      case 2uLL:
        v22 = objc_msgSend(v8, "presentedNumberOfRows");
        v20 = 0.0;
        v21 = 1.0;
        if ((uint64_t)v36 >= v22)
          v21 = 0.0;
        break;
      case 3uLL:
        v20 = -1.0;
        v21 = 0.0;
        if (!*((_QWORD *)&v36 + 1))
          v20 = 0.0;
        break;
      case 4uLL:
        v21 = 0.0;
        v20 = 1.0;
        if (*((_QWORD *)&v37 + 1) + *((_QWORD *)&v36 + 1) >= v19)
          v20 = 0.0;
        break;
      default:
        v21 = 0.0;
        v20 = 0.0;
        break;
    }
    -[PXDayAssetsSectionBodyLayout itemsInRect:inLayout:](self, "itemsInRect:inLayout:", self, v10 + v14 * v20, v12 + v16 * v21, v14, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0x7FEFFFFFFFFFFFFFLL;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __63__PXDayAssetsSectionBodyLayout__itemClosestToItem_inDirection___block_invoke;
    v26[3] = &unk_1E513BC58;
    v30 = a3;
    v31 = v10;
    v32 = v12;
    v33 = v14;
    v34 = v16;
    v27 = v8;
    v28 = v35;
    v29 = &v38;
    objc_msgSend(v23, "enumerateIndexesUsingBlock:", v26);

    _Block_object_dispose(v35, 8);
    goto LABEL_19;
  }
  v17 = objc_msgSend(v8, "itemIndexForItem:inDirection:", a3, a4);
  v18 = v39;
  v39[3] = v17;
LABEL_20:
  v24 = v18[3];

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __63__PXDayAssetsSectionBodyLayout__itemClosestToItem_inDirection___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  double v4;

  if (*(_QWORD *)(result + 56) != a2)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 32), "presentedRectForItemAtIndex:", a2);
    PXRectGetCenter();
    PXRectGetCenter();
    result = PXDistanceBetweenPoints();
    if (v4 < *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = a2;
      *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = v4;
    }
  }
  return result;
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  -[PXDayAssetsSectionBodyLayout exploreGenerator](self, "exploreGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "presentedItemsInRect:", x, y, width, height);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
  }

  return v9;
}

- (id)exploreGenerator
{
  void *v2;
  id v3;

  -[PXGGeneratedLayout generator](self, "generator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inputItemAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_inputItemAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[PXGItemsLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLayout:inputItemAtIndex:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
  }
}

- (void)setSpec:(id)a3
{
  PXDayAssetsSectionBodyLayoutSpec *v5;
  PXDayAssetsSectionBodyLayoutSpec *v6;

  v5 = (PXDayAssetsSectionBodyLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
    v5 = v6;
  }

}

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  if (self->_numberOfPrecedingAssets != a3)
  {
    self->_numberOfPrecedingAssets = a3;
    -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDayAssetsSectionBodyLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
}

void __81__PXDayAssetsSectionBodyLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, int a8)
{
  id v13;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double MinY;
  uint64_t v28;
  CGFloat x;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v13 = a7;
  if (*(_BYTE *)(a6 + 1) == 2)
  {
    v30 = v13;
    PXRectWithCenterAndSize();
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    x = v31.origin.x;
    v32 = CGRectIntersection(v31, *(CGRect *)(a1 + 72));
    v17 = v32.origin.x;
    v18 = v32.origin.y;
    v19 = v32.size.width;
    v20 = v32.size.height;
    v21 = CGRectGetWidth(v32) / *(double *)(a1 + 104);
    v33.origin.x = v17;
    v33.origin.y = v18;
    v33.size.width = v19;
    v33.size.height = v20;
    v22 = CGRectGetHeight(v33);
    if (v21 <= 1.1)
      v23 = 0;
    else
      v23 = v22 / *(double *)(a1 + 112) <= 1.1 ? 1 : 2;
    PXRectShortestDistanceToPoint();
    v25 = v24;
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v13 = v30;
    if (v23 > v26 || v23 == v26 && v24 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (*(_DWORD *)(a1 + 136) == a2)
      {
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        MinY = CGRectGetMinY(v34);
        if (MinY >= CGRectGetMinY(*(CGRect *)(a1 + 72)))
          v28 = 1;
        else
          v28 = 2;
      }
      else
      {
        v28 = 1;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a7);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v28;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v23;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v25;
      v13 = v30;
    }
  }

}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  unsigned int v24;
  uint64_t v25;
  objc_super v26;
  char v27;
  _QWORD v28[17];
  unsigned int v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = (void (**)(_QWORD))a3;
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topInsetForVisibilityAnchoring");

  PXEdgeInsetsInsetRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  PXRectGetCenter();
  v15 = v14;
  v17 = v16;
  -[PXDayAssetsSectionBodyLayout minimumItemSize](self, "minimumItemSize");
  v19 = v18;
  v21 = v20;
  v22 = -[PXGGeneratedLayout keyItemIndex](self, "keyItemIndex");
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    v23 = 0;
  else
    v23 = v22;
  v24 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", v23);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__237546;
  v41 = __Block_byref_object_dispose__237547;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = -1;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0x8000000000000001;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0x7FEFFFFFFFFFFFFFLL;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__PXDayAssetsSectionBodyLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke;
  v28[3] = &unk_1E513BBA8;
  *(double *)&v28[9] = v7;
  *(double *)&v28[10] = v9;
  *(double *)&v28[11] = v11;
  *(double *)&v28[12] = v13;
  v28[13] = v19;
  v28[14] = v21;
  v28[15] = v15;
  v28[16] = v17;
  v28[4] = v31;
  v28[5] = v30;
  v29 = v24;
  v28[6] = &v37;
  v28[7] = &v33;
  v28[8] = v32;
  -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v28, v7, v9, v11, v13);
  v25 = *((unsigned int *)v34 + 6);
  if ((_DWORD)v25 == -1
    || -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", v25, v38[5]) == -1)
  {
    v26.receiver = self;
    v26.super_class = (Class)PXDayAssetsSectionBodyLayout;
    -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](&v26, sel_enumerateVisibleAnchoringSpriteIndexesUsingBlock_, v4);
  }
  else
  {
    v27 = 0;
    v4[2](v4);
  }
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

- (CGSize)minimumItemSize
{
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  CGSize result;

  v4 = -[PXDayAssetsSectionBodyLayout style](self, "style");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) > 1)
    {
      v7 = *(double *)off_1E50B8810;
      v9 = *((double *)off_1E50B8810 + 1);
      goto LABEL_10;
    }
    -[PXGGeneratedLayout generator](self, "generator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        objc_msgSend(v5, "referenceSize");
        v12 = v11;
        objc_msgSend(v5, "interitemSpacing");
        v14 = (v12 + v13) / (double)objc_msgSend(v5, "numberOfColumns");
        objc_msgSend(v5, "interitemSpacing");
        v7 = v14 - v15;
        objc_msgSend(v5, "itemAspectRatio");
        v9 = v7 / v16;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator.metrics"), v26, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator.metrics"), v26);
    }

    goto LABEL_8;
  }
  -[PXGGeneratedLayout generator](self, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 300, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator"), v21);
LABEL_14:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 300, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator"), v21, v23);

    goto LABEL_14;
  }
LABEL_4:
  objc_msgSend(v5, "minimumItemSize");
  v7 = v6;
  v9 = v8;
LABEL_9:

LABEL_10:
  v17 = v7;
  v18 = v9;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)newGenerator
{
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PXExploreLayoutMetrics *v14;
  PXCuratedLibraryGridLayoutMetrics *v15;
  uint64_t v16;
  uint64_t v17;
  PXSmallCollectionLayoutMetrics *v18;
  void *v19;
  PXCuratedLibraryGridLayoutGenerator *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD aBlock[6];
  _QWORD v40[4];
  id v41;
  id location;

  v4 = -[PXDayAssetsSectionBodyLayout style](self, "style");
  -[PXDayAssetsSectionBodyLayout spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interitemSpacing");
  v7 = v6;
  objc_msgSend(v5, "bodyCornerRadius");
  -[PXGGeneratedLayout setCornerRadius:](self, "setCornerRadius:");
  -[PXGLayout referenceSize](self, "referenceSize");
  v9 = v8;
  v11 = v10;
  -[PXDayAssetsSectionBodyLayout preferredReferenceSize](self, "preferredReferenceSize");
  if (v12 != *MEMORY[0x1E0C9D820] || v13 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v11 = v13;
    v9 = v12;
  }
  switch(v4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 112, CFSTR("None style is not supported"));

      abort();
    case 1:
    case 2:
      v15 = objc_alloc_init(PXCuratedLibraryGridLayoutMetrics);
      -[PXCuratedLibraryGridLayoutMetrics setNumberOfColumns:](v15, "setNumberOfColumns:", objc_msgSend(v5, "numberOfColumns"));
      -[PXCuratedLibraryGridLayoutMetrics setInteritemSpacing:](v15, "setInteritemSpacing:", v7);
      -[PXGGeneratedLayout padding](self, "padding");
      -[PXCuratedLibraryGridLayoutMetrics setPadding:](v15, "setPadding:");
      -[PXGLayout displayScale](self, "displayScale");
      -[PXCuratedLibraryGridLayoutMetrics setScreenScale:](v15, "setScreenScale:");
      -[PXLayoutMetrics setReferenceSize:](v15, "setReferenceSize:", v9, v11);
      -[PXCuratedLibraryGridLayoutMetrics setNumberOfPrecedingAssets:](v15, "setNumberOfPrecedingAssets:", -[PXDayAssetsSectionBodyLayout numberOfPrecedingAssets](self, "numberOfPrecedingAssets"));
      v20 = -[PXCuratedLibraryGridLayoutGenerator initWithMetrics:]([PXCuratedLibraryGridLayoutGenerator alloc], "initWithMetrics:", v15);
      -[PXCuratedLibraryGridLayoutGenerator setItemCount:](v20, "setItemCount:", -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
      -[PXCuratedLibraryGridLayoutGenerator setKeyItemIndex:](v20, "setKeyItemIndex:", 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_20;
    case 3:
    case 4:
    case 5:
      v14 = -[PXExploreLayoutMetrics initWithSpec:]([PXExploreLayoutMetrics alloc], "initWithSpec:", v5);
      v15 = (PXCuratedLibraryGridLayoutMetrics *)v14;
      if (v4 == 4)
      {
        v16 = 1;
        goto LABEL_15;
      }
      if (v4 == 5)
      {
        -[PXExploreLayoutMetrics setLargeHeroDensity:](v14, "setLargeHeroDensity:", 0);
        -[PXCuratedLibraryGridLayoutMetrics setAllowHeaders:](v15, "setAllowHeaders:", 0);
        if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
        {
          v16 = 3;
LABEL_15:
          -[PXCuratedLibraryGridLayoutMetrics setLayoutSubtype:](v15, "setLayoutSubtype:", v16);
        }
      }
      -[PXGGeneratedLayout padding](self, "padding");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      if (objc_msgSend(v5, "useHorizontalContentGuideInsets"))
      {
        objc_msgSend(v5, "contentGuideInsetsForScrollAxis:", 1);
        v30 = v29;
        v32 = v9 - (v29 + v31);
      }
      else
      {
        objc_msgSend(v5, "horizontalMargin");
        v30 = v33;
        objc_msgSend(v5, "horizontalMargin");
        v32 = v9 + v34 * -2.0;
      }
      -[PXLayoutMetrics setReferenceSize:](v15, "setReferenceSize:", v32, v11);
      -[PXCuratedLibraryGridLayoutMetrics setInteritemSpacing:](v15, "setInteritemSpacing:", v7);
      -[PXCuratedLibraryGridLayoutMetrics setPadding:](v15, "setPadding:", v22, v24 + v30, v26, v28);
      objc_initWeak(&location, self);
      v20 = -[PXExploreLayoutGenerator initWithMetrics:]([PXExploreLayoutGenerator alloc], "initWithMetrics:", v15);
      -[PXCuratedLibraryGridLayoutGenerator setItemCount:](v20, "setItemCount:", -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
      -[PXCuratedLibraryGridLayoutGenerator setKeyItemIndex:](v20, "setKeyItemIndex:", -[PXGGeneratedLayout keyItemIndex](self, "keyItemIndex"));
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke;
      v40[3] = &unk_1E513D448;
      objc_copyWeak(&v41, &location);
      -[PXCuratedLibraryGridLayoutGenerator setItemLayoutInfoBlock:](v20, "setItemLayoutInfoBlock:", v40);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
LABEL_20:

LABEL_21:
      return v20;
    case 6:
    case 7:
    case 8:
      v17 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_2;
      aBlock[3] = &unk_1E513BB80;
      aBlock[4] = self;
      aBlock[5] = a2;
      v15 = (PXCuratedLibraryGridLayoutMetrics *)_Block_copy(aBlock);
      v18 = objc_alloc_init(PXSmallCollectionLayoutMetrics);
      -[PXSmallCollectionLayoutMetrics setStyle:](v18, "setStyle:", (*(uint64_t (**)(PXCuratedLibraryGridLayoutMetrics *, int64_t))&v15->super._referenceSize.height)(v15, v4));
      -[PXLayoutMetrics setReferenceSize:](v18, "setReferenceSize:", v9, v11);
      if ((unint64_t)(v4 - 7) < 2)
        v7 = 6.0;
      if (v4 == 6)
      {
        +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "detailsViewHeaderAspectRatio");
        -[PXSmallCollectionLayoutMetrics setHeaderAspectRatio:](v18, "setHeaderAspectRatio:");

      }
      -[PXSmallCollectionLayoutMetrics setInteritemSpacing:](v18, "setInteritemSpacing:", v7);
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      -[PXSmallCollectionLayoutMetrics setSafeAreaInsets:](v18, "setSafeAreaInsets:");
      -[PXSmallCollectionLayoutMetrics setEdgesForExtendedLayout:](v18, "setEdgesForExtendedLayout:", *(_QWORD *)off_1E50B8050 | 1);
      -[PXGGeneratedLayout padding](self, "padding");
      -[PXSmallCollectionLayoutMetrics setPadding:](v18, "setPadding:");
      objc_initWeak(&location, self);
      v20 = -[PXSmallCollectionLayoutGenerator initWithNumberOfItems:metrics:]([PXSmallCollectionLayoutGenerator alloc], "initWithNumberOfItems:metrics:", -[PXGItemsLayout numberOfItems](self, "numberOfItems"), v18);
      v37[0] = v17;
      v37[1] = 3221225472;
      v37[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_3;
      v37[3] = &unk_1E513D448;
      objc_copyWeak(&v38, &location);
      -[PXCuratedLibraryGridLayoutGenerator setItemLayoutInfoBlock:](v20, "setItemLayoutInfoBlock:", v37);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);

      goto LABEL_20;
    default:
      v20 = 0;
      goto LABEL_21;
  }
}

- (CGSize)preferredReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredReferenceSize.width;
  height = self->_preferredReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)minPlayableSpriteSize
{
  void *v3;
  char v4;
  double v5;
  double v6;
  CGSize result;

  -[PXDayAssetsSectionBodyLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVideoPlaybackAtAnySize");

  if ((v4 & 1) != 0)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[PXDayAssetsSectionBodyLayout _minSizeOfDominantSprites](self, "_minSizeOfDominantSprites");
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (PXDayAssetsSectionBodyLayoutSpec)spec
{
  return self->_spec;
}

- (CGSize)_minSizeOfDominantSprites
{
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  CGSize result;

  v4 = -[PXDayAssetsSectionBodyLayout style](self, "style");
  if ((unint64_t)(v4 - 3) < 3)
  {
    -[PXGGeneratedLayout generator](self, "generator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v5, "headerItemSize");
        v7 = v6;
        v9 = v8;
        objc_msgSend(v5, "minHeroItemsSize");
        if (v7 >= v10)
          v7 = v10;
        if (v9 >= v11)
          v9 = v11;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 324, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator"), v18, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 324, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator"), v18);
    }

    goto LABEL_4;
  }
  if ((unint64_t)(v4 - 1) > 1)
  {
    v7 = 1.79769313e308;
    v9 = 1.79769313e308;
    goto LABEL_12;
  }
  -[PXGGeneratedLayout generator](self, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v12;
  v9 = v13;
LABEL_11:

LABEL_12:
  v14 = v7;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (PXDayAssetsSectionBodyLayout)init
{
  PXDayAssetsSectionBodyLayout *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXDayAssetsSectionBodyLayout;
  v2 = -[PXCuratedLibraryAssetsSectionGeneratedLayout init](&v9, sel_init);
  if (v2)
  {
    +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "daysFocusAnimationStyle");
    objc_msgSend(v3, "daysFocusPadding");
    -[PXGItemsLayout setAnimationParameters:forStylableType:](v2, "setAnimationParameters:forStylableType:", v4, v5, 1);
    +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "enableDaysEffect"))
    {
      objc_msgSend(v6, "daysPadding");
      -[PXGItemsLayout setAnimationParameters:forStylableType:](v2, "setAnimationParameters:forStylableType:", 1, v7, 0);
    }

  }
  return v2;
}

- (void)contentSizeDidChange
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDayAssetsSectionBodyLayout;
  -[PXGLayout contentSizeDidChange](&v6, sel_contentSizeDidChange);
  switch(-[PXDayAssetsSectionBodyLayout style](self, "style"))
  {
    case 0:
      -[PXGLayout setLastBaseline:](self, "setLastBaseline:", 0.0);
      break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      -[PXGGeneratedLayout generator](self, "generator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "size");
      v5 = v4;
      goto LABEL_3;
    case 2:
      -[PXGGeneratedLayout generator](self, "generator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastFullRowBottomEdge");
LABEL_3:
      -[PXGLayout setLastBaseline:](self, "setLastBaseline:", v5);

      break;
    default:
      return;
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDayAssetsSectionBodyLayout;
  -[PXGGeneratedLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
}

- (void)setPreferredReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_preferredReferenceSize;

  height = a3.height;
  width = a3.width;
  p_preferredReferenceSize = &self->_preferredReferenceSize;
  if ((PXSizeApproximatelyEqualToSize() & 1) == 0)
  {
    p_preferredReferenceSize->width = width;
    p_preferredReferenceSize->height = height;
    -[PXGGeneratedLayout metricsDidChange](self, "metricsDidChange");
  }
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v9;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[PXDayAssetsSectionBodyLayout style](self, "style");
  if (v9 > 8)
    return (_PXGSpriteIndexRange)0;
  if (((1 << v9) & 0x1F9) != 0)
    return *(_PXGSpriteIndexRange *)off_1E50B8378;
  if (!-[PXGLayout needsUpdate](self, "needsUpdate"))
  {
    -[PXGGeneratedLayout generator](self, "generator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_12:
        v14 = objc_msgSend(v13, "geometriesRangeCoveringRect:", x, y, width, height);
        v16 = v15;

        return (_PXGSpriteIndexRange)(v14 | ((unint64_t)v16 << 32));
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator"), v19, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator"), v19);
    }

    goto LABEL_12;
  }
  PLCuratedLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Requesting spriteIndexRangeCoveringRect on layout that is not up to date.", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)PXDayAssetsSectionBodyLayout;
  return (_PXGSpriteIndexRange)-[PXGLayout spriteIndexRangeCoveringRect:](&v22, sel_spriteIndexRangeCoveringRect_, x, y, width, height);
}

- (CGRect)sectionRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXGLayout contentSize](self, "contentSize");
  -[PXGGeneratedLayout padding](self, "padding");
  PXEdgeInsetsInsetRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXDayAssetsSectionBodyLayout minimumItemSize](self, "minimumItemSize");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PXDayAssetsSectionBodyLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v13[3] = &unk_1E513BBD0;
  v15 = v10;
  v16 = v11;
  v14 = v9;
  v12 = v9;
  -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v13, x, y, width, height);

}

- (double)buildingRowContentHeight
{
  double v4;
  void *v5;
  double v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v4 = 0.0;
  if ((unint64_t)(-[PXDayAssetsSectionBodyLayout style](self, "style") - 3) <= 2)
  {
    -[PXGGeneratedLayout generator](self, "generator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v5, "buildingBlockSize");
        v4 = v6;

        return v4;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 436, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator"), v10, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 436, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator"), v10);
    }

    goto LABEL_4;
  }
  return v4;
}

- (double)buildingRowSpacing
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  if ((unint64_t)(-[PXDayAssetsSectionBodyLayout style](self, "style") - 3) <= 2)
  {
    -[PXGGeneratedLayout generator](self, "generator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v4, "metrics");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "interitemSpacing");
        v7 = v6;

        return v7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 455, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.generator"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDayAssetsSectionBodyLayout.m"), 455, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.generator"), v11);
    }

    goto LABEL_4;
  }
  return 0.0;
}

- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v5)(id, _BYTE *, double, double, double, double);
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  void (**v11)(void *, id, double);
  void *v12;
  int64_t v13;
  double *v14;
  double *v15;
  double v16;
  double v17;
  uint64_t (**v18)(void *, id);
  uint64_t (**v19)(void *, uint64_t, id);
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  char v27;
  char v28;
  _QWORD v29[4];
  BOOL v30;
  _QWORD v31[4];
  BOOL v32;
  _QWORD aBlock[6];

  v27 = a3;
  v5 = (void (**)(id, _BYTE *, double, double, double, double))a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXGLayout displayScale](self, "displayScale");
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke;
  aBlock[3] = &__block_descriptor_40_e30_v24__0d8__NSMutableIndexSet_16l;
  *(double *)&aBlock[4] = v8;
  v11 = (void (**)(void *, id, double))_Block_copy(aBlock);
  -[PXGGeneratedLayout generator](self, "generator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "itemCount");
  v14 = (double *)malloc_type_calloc(v13, 0x98uLL, 0x100004050011849uLL);
  objc_msgSend(v12, "getGeometries:inRange:withKind:", v14, 0, v13, 0);
  if (v13 >= 1)
  {
    v15 = v14 + 4;
    do
    {
      v16 = *(v15 - 2);
      v17 = *v15;
      v15 += 19;
      v11[2](v11, v6, v16 - v17 * 0.5);
      v11[2](v11, v7, v16 + v17 * 0.5);
      --v13;
    }
    while (v13);
  }
  free(v14);
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_2;
  v31[3] = &__block_descriptor_33_e20_q16__0__NSIndexSet_8l;
  v32 = (v27 & 2) != 0;
  v18 = (uint64_t (**)(void *, id))_Block_copy(v31);
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_3;
  v29[3] = &__block_descriptor_33_e23_q24__0q8__NSIndexSet_16l;
  v30 = (v27 & 2) != 0;
  v19 = (uint64_t (**)(void *, uint64_t, id))_Block_copy(v29);
  v20 = v18[2](v18, v6);
  v21 = v18[2](v18, v7);
  -[PXGLayout contentSize](self, "contentSize");
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = v22;
    v24 = *MEMORY[0x1E0C9D538];
    do
    {
      v28 = 0;
      v5[2](v5, &v28, v24, v9 * (double)v20, v23, -(v9 * (double)v20 - (double)v21 * v9));
      if (v28)
        break;
      v20 = v19[2](v19, v20, v6);
      v25 = v19[2](v19, v21, v7);
      v21 = v25;
    }
    while (v20 != 0x7FFFFFFFFFFFFFFFLL && v25 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (int64_t)_initialItemInDirection:(unint64_t)a3
{
  void *v5;
  int64_t v6;
  int64_t v7;

  -[PXDayAssetsSectionBodyLayout exploreGenerator](self, "exploreGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && a3 <= 6)
  {
    if (((1 << a3) & 0x34) != 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    if (((1 << a3) & 0x4A) != 0)
    {
      v7 = -[PXGItemsLayout numberOfItems](self, "numberOfItems") - 1;
LABEL_7:
      v6 = objc_msgSend(v5, "itemIndexForPresentedItemIndex:", v7);
    }
  }

  return v6;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  -[PXDayAssetsSectionBodyLayout exploreGenerator](self, "exploreGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "presentedItemsBetweenItem:andItem:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }

  return v7;
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, double a3)
{
  return objc_msgSend(a2, "addIndex:", vcvtad_u64_f64(a3 / *(double *)(a1 + 32)));
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "lastIndex");
  else
    return objc_msgSend(a2, "firstIndex");
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a3, "indexLessThanIndex:", a2);
  else
    return objc_msgSend(a3, "indexGreaterThanIndex:", a2);
}

void __70__PXDayAssetsSectionBodyLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  double x;
  double y;
  double width;
  double height;
  CGRect v11;

  if (*(_BYTE *)(a6 + 1) == 2)
  {
    PXRectWithCenterAndSize();
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    if (CGRectGetHeight(v11) / *(double *)(a1 + 48) > 1.9)
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(x, y, width, height);
  }
}

uint64_t __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;

  if ((unint64_t)(a2 - 6) >= 3)
  {
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v9, v2, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXDayAssetsSectionBodyLayout.m"), 176, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return a2 - 6;
}

id __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inputItemAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
