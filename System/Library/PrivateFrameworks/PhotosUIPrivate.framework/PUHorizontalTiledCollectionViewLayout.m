@implementation PUHorizontalTiledCollectionViewLayout

- (PUHorizontalTiledCollectionViewLayout)init
{
  PUHorizontalTiledCollectionViewLayout *v2;
  PUCollectionViewData *v3;
  PUCollectionViewData *data;
  UICollectionViewLayoutAttributes *v5;
  UICollectionViewLayoutAttributes *dummyAttrs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  v2 = -[PUHorizontalTiledCollectionViewLayout init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PUCollectionViewData);
    data = v2->_data;
    v2->_data = v3;

    v5 = (UICollectionViewLayoutAttributes *)objc_alloc_init(MEMORY[0x1E0DC3628]);
    dummyAttrs = v2->_dummyAttrs;
    v2->_dummyAttrs = v5;

  }
  return v2;
}

- (BOOL)_updateLayoutData:(id)a3 inDirection:(int64_t)a4 outDeltaOriginX:(double *)a5
{
  PUCollectionViewData *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double MidX;
  double v19;
  double MidY;
  double v21;
  double width;
  double v23;
  double height;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  BOOL v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  char v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  void *v63;
  _BOOL8 IsEmpty;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  double v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  double v78;
  PUHorizontalTiledCollectionViewLayout *v79;
  BOOL v80;
  double v82;
  int v83;
  double v84;
  double v85;
  void *v86;
  PUCollectionViewData *v87;
  double *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  PUHorizontalTiledCollectionViewLayout *v95;
  void *v96;
  void *v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  double v107;
  _BYTE v108[128];
  uint64_t v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v109 = *MEMORY[0x1E0C80C00];
  v9 = (PUCollectionViewData *)a3;
  -[PUHorizontalTiledCollectionViewLayout delegate](self, "delegate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = self;
  -[PUHorizontalTiledCollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v85 = v11;
  v13 = v12;
  v89 = v15;
  v90 = v14;
  v16 = -[PUCollectionViewData cachedPageCount](v9, "cachedPageCount");
  -[PUCollectionViewData currentContentBounds](v9, "currentContentBounds");
  MidX = v17;
  MidY = v19;
  width = v21;
  height = v23;
  -[PUCollectionViewData itemLayoutAttributes](v9, "itemLayoutAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCollectionViewData itemLayoutAttributesByIndexPath](v9, "itemLayoutAttributesByIndexPath");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
    objc_msgSend(v25, "lastObject");
  else
    objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "indexPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v98 = v29;
  v99 = v28;
  v31 = v30;
  v33 = v32;
  v107 = 0.0;
  v34 = v26 == 0;
  if (!v26)
  {
    if (objc_msgSend(v25, "count")
      || objc_msgSend(v96, "count")
      || (v110.origin.x = MidX,
          v110.origin.y = MidY,
          v110.size.width = width,
          v110.size.height = height,
          !CGRectIsEmpty(v110)))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "handleFailureInMethod:object:file:lineNumber:description:", a2, v95, CFSTR("PUHorizontalTiledCollectionViewLayout.m"), 114, 0);

    }
    objc_msgSend(v97, "layout:collectionView:referenceIndexPathWithOffsetX:", v95, v10, &v107);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v111.origin.x = v85;
    v111.origin.y = v13;
    v111.size.width = v90;
    v111.size.height = v89;
    MidX = CGRectGetMidX(v111);
    v112.origin.x = v85;
    v112.origin.y = v13;
    v112.size.width = v90;
    v112.size.height = v89;
    MidY = CGRectGetMidY(v112);
    height = 0.0;
    width = 0.0;
    if (v35)
      goto LABEL_6;
LABEL_12:
    v51 = 0;
    v52 = 0.0;
    if (!a5)
      goto LABEL_53;
    goto LABEL_52;
  }
  objc_msgSend(v10, "next:indexPathFromIndexPath:", a4, v27);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
    goto LABEL_12;
LABEL_6:
  v84 = v13;
  v88 = a5;
  -[PUHorizontalTiledCollectionViewLayout interitemSpacing](v95, "interitemSpacing");
  v93 = v36;
  -[PUHorizontalTiledCollectionViewLayout itemsContentInset](v95, "itemsContentInset");
  v82 = v37;
  v94 = v38;
  v40 = v38 + v39;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v87 = v9;
  v41 = v16;
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "indexPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v42;
  v83 = objc_msgSend(v44, "isEqual:", v42);

  v45 = v90 * (double)v41;
  v46 = MidX;
  v47 = MidY;
  v48 = width;
  v49 = height;
  if (a4 == 1)
    v50 = v45 + CGRectGetMaxX(*(CGRect *)&v46);
  else
    v50 = CGRectGetMinX(*(CGRect *)&v46) - v45;
  v51 = 0;
  v91 = v89 - v40;
  v92 = v50;
  while (1)
  {
    v113.origin.x = MidX;
    v113.origin.y = MidY;
    v113.size.width = width;
    v113.size.height = height;
    if (v50 >= CGRectGetMinX(v113))
    {
      v114.origin.x = MidX;
      v114.origin.y = MidY;
      v114.size.width = width;
      v114.size.height = height;
      if (v50 <= CGRectGetMaxX(v114))
        break;
    }
    v100 = MidY;
    v101 = width;
    v53 = height;
    objc_msgSend(v97, "layout:collectionView:sizeForItemAtIndexPath:", v95, v10, v35);
    v55 = v54;
    v57 = v56;
    if (v54 <= 0.0)
      v58 = 0.0;
    else
      v58 = v93;
    if (v34)
    {
      v59 = MidX + v54 * -0.5 + v107;
    }
    else if (a4 == 1)
    {
      v115.origin.y = v98;
      v115.origin.x = v99;
      v115.size.width = v31;
      v115.size.height = v33;
      v59 = v58 + CGRectGetMaxX(v115);
    }
    else
    {
      v116.origin.x = v99;
      v116.origin.y = v98;
      v116.size.width = v31;
      v116.size.height = v33;
      v60 = CGRectGetMinX(v116) - v58;
      v117.origin.x = v99;
      v117.origin.y = v98;
      v117.size.width = v55;
      v117.size.height = v57;
      v59 = v60 - CGRectGetWidth(v117);
    }
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v61 = round(*(double *)&PUMainScreenScale_screenScale * v59) / *(double *)&PUMainScreenScale_screenScale;
    v62 = round(*(double *)&PUMainScreenScale_screenScale * (v94 + (v91 - v57) * 0.5))
        / *(double *)&PUMainScreenScale_screenScale;
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v35);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "setFrame:", v61, v62, v55, v57);
    v118.origin.x = v61;
    v118.origin.y = v62;
    v118.size.width = v55;
    v118.size.height = v57;
    IsEmpty = CGRectIsEmpty(v118);
    objc_msgSend(v63, "setHidden:", IsEmpty);
    objc_msgSend(v63, "setAlpha:", (double)(IsEmpty ^ 1));
    if (a4 == 1)
      v65 = objc_msgSend(v25, "count");
    else
      v65 = 0;
    objc_msgSend(v25, "insertObject:atIndex:", v63, v65);
    objc_msgSend(v96, "setObject:forKey:", v63, v35);
    v119.origin.x = MidX;
    v119.origin.y = v100;
    v119.size.width = v101;
    v119.size.height = v53;
    v98 = v62;
    v99 = v61;
    v121.origin.x = v61;
    v121.origin.y = v62;
    v121.size.width = v55;
    v121.size.height = v57;
    v120 = CGRectUnion(v119, v121);
    MidX = v120.origin.x;
    MidY = v120.origin.y;
    width = v120.size.width;
    height = v120.size.height;
    objc_msgSend(v10, "next:indexPathFromIndexPath:", a4, v35);
    v66 = objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v51 = 1;
    v26 = v63;
    v33 = v57;
    v31 = v55;
    v35 = (void *)v66;
    v50 = v92;
    if (!v66)
    {
      v26 = v63;
      break;
    }
  }
  objc_msgSend(v25, "firstObject");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "indexPath");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v86;
  v70 = objc_msgSend(v68, "isEqual:", v86);

  v9 = v87;
  if (MidX <= 0.0 || (v52 = 0.0, v70))
  {
    v71 = -MidX;
    v107 = -MidX;
    a5 = v88;
    if (((v83 | v70 ^ 1) & 1) == 0)
    {
      v71 = v82 - MidX;
      v107 = v82 - MidX;
      width = v82 + width;
    }
    if (v71 != 0.0)
    {
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v72 = v25;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v104 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
            objc_msgSend(v77, "frame");
            objc_msgSend(v77, "setFrame:", v107 + v78);
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
        }
        while (v74);
      }

      v9 = v87;
      a5 = v88;
      v69 = v86;
      if (v95->_data == v87)
      {
        -[PUHorizontalTiledCollectionViewLayout invalidateLayout](v95, "invalidateLayout");
        objc_msgSend(v10, "collectionViewLayout");
        v79 = (PUHorizontalTiledCollectionViewLayout *)objc_claimAutoreleasedReturnValue();

        v80 = v79 == v95;
        a5 = v88;
        if (v80)
          objc_msgSend(v10, "setBounds:", v85 + v107, v84, v90, v89);
      }
    }
    MidX = 0.0;
    v52 = v107;
  }
  else
  {
    a5 = v88;
  }
  -[PUCollectionViewData setCurrentContentBounds:](v9, "setCurrentContentBounds:", MidX, MidY, width, height);

  if (a5)
LABEL_52:
    *a5 = v52;
LABEL_53:

  return v51 & 1;
}

- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginX:(double *)a5
{
  double height;
  double width;
  double x;
  id v10;
  void *v11;
  CGFloat v12;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinX;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MaxX;
  CGFloat rect;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  rect = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = v10;
  if (width < 0.0 || height < 0.0)
  {
    if (a5)
      *a5 = 0.0;
  }
  else
  {
    v35 = 0.0;
    objc_msgSend(v10, "currentContentBounds");
    v12 = v36.origin.x;
    y = v36.origin.y;
    v14 = v36.size.width;
    v15 = v36.size.height;
    if (CGRectIsEmpty(v36))
    {
      -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v11, 1, &v35);
      objc_msgSend(v11, "currentContentBounds");
      v12 = v16;
      y = v17;
      v14 = v18;
      v15 = v19;
      v20 = v35;
    }
    else
    {
      v20 = 0.0;
    }
    v21 = x + v20;
    do
    {
      v37.origin.x = v21;
      v37.origin.y = rect;
      v37.size.width = width;
      v37.size.height = height;
      MinX = CGRectGetMinX(v37);
      v38.origin.x = v12;
      v38.origin.y = y;
      v38.size.width = v14;
      v38.size.height = v15;
      if (MinX >= CGRectGetMinX(v38))
        break;
      v23 = -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v11, -1, &v35);
      v21 = v21 + v35;
      objc_msgSend(v11, "currentContentBounds");
      v12 = v24;
      y = v25;
      v14 = v26;
      v15 = v27;
    }
    while (v23);
    do
    {
      v39.origin.x = v21;
      v39.origin.y = rect;
      v39.size.width = width;
      v39.size.height = height;
      MaxX = CGRectGetMaxX(v39);
      v40.origin.x = v12;
      v40.origin.y = y;
      v40.size.width = v14;
      v40.size.height = v15;
      if (MaxX <= CGRectGetMaxX(v40))
        break;
      v28 = -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v11, 1, &v35);
      v21 = v21 + v35;
      objc_msgSend(v11, "currentContentBounds");
      v12 = v29;
      y = v30;
      v14 = v31;
      v15 = v32;
    }
    while (v28);
  }

}

- (void)_ensureIndexPath:(id)a3 inData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend(v6, "itemLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v6, 1, 0);
  objc_msgSend(v6, "itemLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v23, "compare:", v11) == -1)
  {
    v12 = -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v6, -1, 0);
    objc_msgSend(v6, "itemLayoutAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v15;
    if (!v12)
      goto LABEL_8;
  }
  v15 = v11;
LABEL_8:
  objc_msgSend(v6, "itemLayoutAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v23, "compare:", v18) == 1)
  {
    v19 = -[PUHorizontalTiledCollectionViewLayout _updateLayoutData:inDirection:outDeltaOriginX:](self, "_updateLayoutData:inDirection:outDeltaOriginX:", v6, 1, 0);
    objc_msgSend(v6, "itemLayoutAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indexPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v22;
    if (!v19)
      goto LABEL_13;
  }
  v22 = v18;
LABEL_13:

}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  PUCollectionViewData *data;
  id v4;
  void *v5;
  void *v6;

  data = self->_data;
  v4 = a3;
  -[PUCollectionViewData itemLayoutAttributesByIndexPath](data, "itemLayoutAttributesByIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setInteritemSpacing:(double)a3
{
  double v5;

  -[PUHorizontalTiledCollectionViewLayout interitemSpacing](self, "interitemSpacing");
  if (v5 != a3)
  {
    self->_interitemSpacing = a3;
    -[PUHorizontalTiledCollectionViewLayout invalidateCachedLayout](self, "invalidateCachedLayout");
    -[PUHorizontalTiledCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setItemsContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PUHorizontalTiledCollectionViewLayout itemsContentInset](self, "itemsContentInset");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_itemsContentInset.top = top;
    self->_itemsContentInset.left = left;
    self->_itemsContentInset.bottom = bottom;
    self->_itemsContentInset.right = right;
    -[PUHorizontalTiledCollectionViewLayout invalidateCachedLayout](self, "invalidateCachedLayout");
    -[PUHorizontalTiledCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)hasReferenceIndexPath
{
  return -[PUCollectionViewData hasReferenceIndexPath](self->_data, "hasReferenceIndexPath");
}

- (void)invalidateCachedLayout
{
  -[PUCollectionViewData invalidate](self->_data, "invalidate");
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height;
  void *v4;
  double v5;
  double v6;

  height = a3.size.height;
  -[PUHorizontalTiledCollectionViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y, a3.size.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  return v6 != height;
}

- (id)layoutAttributesForItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0.0;
  -[PUHorizontalTiledCollectionViewLayout _ensureRect:inData:outDeltaOriginX:](self, "_ensureRect:inData:outDeltaOriginX:", self->_data, &v15);
  -[UICollectionViewLayoutAttributes setFrame:](self->_dummyAttrs, "setFrame:", x + v15, y, width, height);
  -[PUCollectionViewData itemLayoutAttributes](self->_data, "itemLayoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", self->_dummyAttrs, 0, v9, 256, &__block_literal_global_33715);
  v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    v13 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", self->_dummyAttrs, v10, v9 - v10, 512, &__block_literal_global_33715);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "subarrayWithRange:", v12, v13 - v12 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL8 v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  -[PUHorizontalTiledCollectionViewLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "invalidateDataSourceCounts") & 1) != 0
    || (objc_msgSend(v8, "invalidateEverything") & 1) != 0
    || -[PUHorizontalTiledCollectionViewLayout _shouldInvalidateCachedLayoutForBoundsChange:](self, "_shouldInvalidateCachedLayoutForBoundsChange:", x, y, width, height);
  objc_msgSend(v8, "_setInvalidateCachedLayout:", v9);
  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUHorizontalTiledCollectionViewLayout;
  -[PUHorizontalTiledCollectionViewLayout invalidateLayoutWithContext:](&v5, sel_invalidateLayoutWithContext_, v4);
  if ((objc_msgSend(v4, "invalidateCachedLayout") & 1) != 0
    || (objc_msgSend(v4, "invalidateDataSourceCounts") & 1) != 0
    || objc_msgSend(v4, "invalidateEverything"))
  {
    -[PUHorizontalTiledCollectionViewLayout invalidateCachedLayout](self, "invalidateCachedLayout");
  }

}

- (void)prepareLayout
{
  id v3;

  -[PUHorizontalTiledCollectionViewLayout collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PUHorizontalTiledCollectionViewLayout _ensureRect:inData:outDeltaOriginX:](self, "_ensureRect:inData:outDeltaOriginX:", self->_data, 0);

}

- (CGSize)collectionViewContentSize
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  CGFloat MaxY;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  -[PUCollectionViewData currentContentBounds](self->_data, "currentContentBounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MaxX = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxY = CGRectGetMaxY(v14);
  -[PUHorizontalTiledCollectionViewLayout itemsContentInset](self, "itemsContentInset");
  v10 = MaxX + v9;
  v11 = MaxY;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  PUCollectionViewData *data;
  id v5;
  void *v6;

  data = self->_data;
  v5 = a3;
  -[PUHorizontalTiledCollectionViewLayout _ensureIndexPath:inData:](self, "_ensureIndexPath:inData:", v5, data);
  -[PUHorizontalTiledCollectionViewLayout _layoutAttributesForItemAtIndexPath:](self, "_layoutAttributesForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (UIEdgeInsets)itemsContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_itemsContentInset.top;
  left = self->_itemsContentInset.left;
  bottom = self->_itemsContentInset.bottom;
  right = self->_itemsContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUHorizontalTiledCollectionViewLayoutDelegate)delegate
{
  return (PUHorizontalTiledCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dummyAttrs, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

uint64_t __72__PUHorizontalTiledCollectionViewLayout_layoutAttributesForItemsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxX;
  double MinX;
  CGFloat rect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  rect = v6;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  if (MaxX < CGRectGetMinX(v26))
    return -1;
  v27.origin.x = rect;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  return MinX > CGRectGetMaxX(v28);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end
