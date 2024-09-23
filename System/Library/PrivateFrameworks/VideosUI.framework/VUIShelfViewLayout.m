@implementation VUIShelfViewLayout

- (VUIShelfViewLayout)init
{
  VUIShelfViewLayout *v2;
  VUIShelfViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIShelfViewLayout;
  v2 = -[VUIShelfViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_prominentSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_rowCount = 1;
    v2->_minimumInteritemSpacing = 10.0;
    v2->_minimumLineSpacing = 10.0;
    v2->_headerSelectionMargin = 7.0;
    v2->_headerBottomMargin = 12.0;
    v2->_shouldSnapContent = 1;
    -[VUIShelfViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v2, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  }
  return v3;
}

+ (double)defaultHeaderSelectionMargin
{
  return 7.0;
}

- (void)setShouldSnapContent:(BOOL)a3
{
  if (self->_shouldSnapContent != a3)
  {
    self->_shouldSnapContent = a3;
    if (a3)
      -[VUIShelfViewLayout snapContent](self, "snapContent");
  }
}

- (void)setRowCount:(int64_t)a3
{
  if (a3 >= 1)
    self->_rowCount = a3;
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  VUIShelfLayoutHelper *v6;
  uint64_t v7;
  VUIShelfLayoutSection *v8;
  void *v9;
  uint64_t v10;
  double y;
  double x;
  double height;
  double width;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double MaxX;
  BOOL v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  CGFloat v73;
  double rect;
  double v75;
  CGFloat v76;
  double rect1;
  CGFloat rect1a;
  objc_super v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v79.receiver = self;
  v79.super_class = (Class)VUIShelfViewLayout;
  -[VUIShelfViewLayout prepareLayout](&v79, sel_prepareLayout);
  -[VUIShelfViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[VUIShelfViewLayout layoutHelper](self, "layoutHelper");
    v6 = (VUIShelfLayoutHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[VUIShelfLayoutHelper initWithShelfViewLayout:]([VUIShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);
      -[VUIShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v6);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 >= 1)
    {
      v7 = 0;
      v75 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      rect1 = *MEMORY[0x1E0C9D648];
      v72 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      rect = *(double *)(MEMORY[0x1E0C9D648] + 16);
      do
      {
        v8 = objc_alloc_init(VUIShelfLayoutSection);
        -[VUIShelfLayoutHelper frameForHeaderInSection:](v6, "frameForHeaderInSection:", v7);
        -[VUIShelfLayoutSection setSectionHeaderFrame:](v8, "setSectionHeaderFrame:");
        -[VUIShelfLayoutHelper insetForSection:](v6, "insetForSection:", v7);
        -[VUIShelfLayoutSection setSectionInset:](v8, "setSectionInset:");
        v9 = v3;
        v10 = objc_msgSend(v3, "numberOfItemsInSection:", v7);
        -[VUIShelfLayoutSection setNumberOfItems:](v8, "setNumberOfItems:", v10);
        y = v75;
        x = rect1;
        height = v72;
        width = rect;
        if (v10 >= 1)
        {
          v15 = 0;
          height = v72;
          width = rect;
          y = v75;
          x = rect1;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v15, v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIShelfLayoutHelper frameForItemAtIndexPath:](v6, "frameForItemAtIndexPath:", v16);
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v24 = v23;

            -[VUIShelfLayoutSection setItemFrame:atIndex:](v8, "setItemFrame:atIndex:", v15, v18, v20, v22, v24);
            v80.origin.x = x;
            v80.origin.y = y;
            v80.size.width = width;
            v80.size.height = height;
            v89.origin.x = v18;
            v89.origin.y = v20;
            v89.size.width = v22;
            v89.size.height = v24;
            v81 = CGRectUnion(v80, v89);
            x = v81.origin.x;
            y = v81.origin.y;
            width = v81.size.width;
            height = v81.size.height;
            ++v15;
          }
          while (v10 != v15);
        }
        -[VUIShelfLayoutSection setItemsBoundingFrame:](v8, "setItemsBoundingFrame:", x, y, width, height);
        objc_msgSend(v70, "addObject:", v8);

        ++v7;
        v3 = v9;
      }
      while (v7 != v4);
    }
    v25 = (void *)objc_msgSend(v70, "copy");
    -[VUIShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", v25);

    v5 = 0;
  }
  objc_msgSend(v3, "vuiContentOffset");
  v27 = v26;
  objc_msgSend(v3, "vuiContentInsets");
  if (v4 >= 1)
  {
    v29 = 0;
    v30 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v32 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    rect1a = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v67 = v27 + v28;
    v68 = v32;
    v69 = v31;
    v71 = *MEMORY[0x1E0C9D648];
    do
    {
      -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections", *(_QWORD *)&v67);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndex:", v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "sectionHeaderFrame");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v82.origin.x = v30;
      v82.origin.y = v31;
      v82.size.width = v32;
      v82.size.height = rect1a;
      v90.origin.x = v36;
      v90.origin.y = v38;
      v90.size.width = v40;
      v90.size.height = v42;
      if (!CGRectEqualToRect(v82, v90))
      {
        v73 = v38;
        v76 = v36;
        objc_msgSend(v34, "firstItemFrame");
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        objc_msgSend(v34, "lastItemFrame");
        v52 = v51;
        v54 = v53;
        v56 = v55;
        v58 = v57;
        v83.origin.x = v44;
        v83.origin.y = v46;
        v83.size.width = v48;
        v59 = v52;
        v83.size.height = v50;
        v60 = v54;
        v61 = fmax(v67, CGRectGetMinX(v83));
        v84.origin.x = v59;
        v84.origin.y = v60;
        v84.size.width = v56;
        v84.size.height = v58;
        v62 = fmin(v61, CGRectGetMinX(v84));
        if (v4 - 1 == v29)
        {
          v63 = v76;
        }
        else
        {
          v85.origin.x = v62;
          v85.origin.y = v73;
          v85.size.width = v40;
          v85.size.height = v42;
          MaxX = CGRectGetMaxX(v85);
          v86.origin.x = v59;
          v86.origin.y = v60;
          v86.size.width = v56;
          v86.size.height = v58;
          v65 = MaxX < CGRectGetMaxX(v86);
          v63 = v76;
          if (!v65)
          {
            v87.origin.x = v59;
            v87.origin.y = v60;
            v87.size.width = v56;
            v87.size.height = v58;
            v66 = CGRectGetMaxX(v87);
            v88.origin.x = v76;
            v88.origin.y = v73;
            v88.size.width = v40;
            v88.size.height = v42;
            v62 = v66 - CGRectGetWidth(v88);
          }
        }
        objc_msgSend(v34, "setSectionHeaderHorizontalOffset:", v62 - v63);
        v31 = v69;
        v30 = v71;
        v32 = v68;
      }

      ++v29;
    }
    while (v4 != v29);
  }
  if (!v5)
    -[VUIShelfViewLayout snapContent](self, "snapContent");

}

- (CGSize)collectionViewContentSize
{
  void *v3;
  void *v4;
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
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastItemFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "sectionInset");
  v14 = v13;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  v15 = CGRectGetMaxX(v21) + v14;
  -[VUIShelfViewLayout computedContentHeight](self, "computedContentHeight");
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  id v14;
  id v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  VUIShelfViewLayout *v19;
  id v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "invalidateVerticalBumps"))
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusedItemIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = objc_msgSend(v10, "item");
    v12 = v11 % -[VUIShelfViewLayout rowCount](self, "rowCount") == 0;
    -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__VUIShelfViewLayout_invalidateLayoutWithContext___block_invoke;
    v17[3] = &unk_1E9F9B3F8;
    v21 = v12;
    v18 = v10;
    v19 = self;
    v20 = v6;
    v14 = v6;
    v15 = v10;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);

    objc_msgSend(v5, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("VUIShelfLayoutElementKindHeader"), v14);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "invalidateLayout") & 1) != 0
    || (objc_msgSend(v4, "invalidateEverything") & 1) != 0
    || objc_msgSend(v4, "invalidateDataSourceCounts"))
  {
    -[VUIShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", 0);
    -[VUIShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)VUIShelfViewLayout;
  -[VUIShelfViewLayout invalidateLayoutWithContext:](&v16, sel_invalidateLayoutWithContext_, v4);

}

void __50__VUIShelfViewLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "section") == a3
    && *(_BYTE *)(a1 + 56)
    && objc_msgSend(*(id *)(a1 + 40), "_bumpHeaderForLayoutSection:forIndexPath:", v8, *(_QWORD *)(a1 + 32)))
  {
    goto LABEL_6;
  }
  objc_msgSend(v8, "sectionHeaderVerticalBump");
  if (v5 != 0.0)
  {
    objc_msgSend(v8, "setSectionHeaderVerticalBump:", 0.0);
LABEL_6:
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  void *v35;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v38 = *MEMORY[0x1E0C9D820];
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v42 = *MEMORY[0x1E0C9D648];
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections", *(_QWORD *)&v37);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "sectionHeaderFrame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v13, "sectionHeaderHorizontalOffset");
      if (v19 != v38 || v21 != v37)
      {
        v43.origin.x = v22 + v15;
        v43.origin.y = v17;
        v43.size.width = v19;
        v43.size.height = v21;
        v46.origin.x = x;
        v46.origin.y = y;
        v46.size.width = width;
        v46.size.height = height;
        if (CGRectIntersectsRect(v43, v46))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIShelfViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("VUIShelfLayoutElementKindHeader"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v25);

        }
      }
      v26 = objc_msgSend(v13, "numberOfItems");
      if (v26)
      {
        v27 = v26;
        for (i = 0; i != v27; ++i)
        {
          objc_msgSend(v13, "itemFrameAtIndex:", i);
          v29 = v44.origin.x;
          v30 = v44.origin.y;
          v31 = v44.size.width;
          v32 = v44.size.height;
          v47.origin.x = x;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = height;
          if (CGRectIntersectsRect(v44, v47))
          {
            v45.origin.y = v41;
            v45.origin.x = v42;
            v45.size.height = v39;
            v45.size.width = v40;
            v48.origin.x = v29;
            v48.origin.y = v30;
            v48.size.width = v31;
            v48.size.height = v32;
            if (!CGRectEqualToRect(v45, v48))
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v11);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIShelfViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v34);

            }
          }
        }
      }

      ++v11;
    }
    while (v11 != v10);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");
  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v4, "item");
    if (v11 < objc_msgSend(v10, "numberOfItems"))
    {
      objc_msgSend(v10, "itemFrameAtIndex:", objc_msgSend(v4, "item"));
      objc_msgSend(v5, "setFrame:");
    }

  }
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "section");
  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sectionHeaderFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "sectionHeaderVerticalBump");
    v22 = v16 - v21;
    if (!objc_msgSend(v6, "section"))
    {
      -[VUIShelfViewLayout collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "vuiContentOffset");
      v25 = v24;
      objc_msgSend(v23, "vuiContentInsets");
      v27 = 0.0 - v26;
      v28 = v25 + v26;
      if (v25 < v27)
        v14 = v28;

    }
    objc_msgSend(v7, "setFrame:", v14, v22, v18, v20);
    memset(&v32, 0, sizeof(v32));
    objc_msgSend(v12, "sectionHeaderHorizontalOffset");
    CGAffineTransformMakeTranslation(&v32, v29, 0.0);
    v31 = v32;
    objc_msgSend(v7, "setTransform:", &v31);

  }
  return v7;
}

- (int64_t)computedRowCount
{
  void *v3;
  void *v4;
  VUIShelfLayoutHelper *v5;
  int64_t v6;

  -[VUIShelfViewLayout layoutHelper](self, "layoutHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfViewLayout layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[VUIShelfLayoutHelper initWithShelfViewLayout:]([VUIShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);

    -[VUIShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v5);
    v3 = v5;
  }
  v6 = objc_msgSend(v3, "actualRowCount");

  return v6;
}

- (double)computedContentHeight
{
  void *v3;
  void *v4;
  VUIShelfLayoutHelper *v5;
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
  double v16;

  -[VUIShelfViewLayout layoutHelper](self, "layoutHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfViewLayout layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[VUIShelfLayoutHelper initWithShelfViewLayout:]([VUIShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);

    -[VUIShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v5);
    v3 = v5;
  }
  objc_msgSend(v3, "tallestHeaderHeight");
  v6 = 0.0;
  if (v7 > 0.0)
  {
    -[VUIShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
    v6 = v8;
  }
  objc_msgSend(v3, "tallestInsetTop");
  v10 = v9;
  objc_msgSend(v3, "tallestHeaderHeight");
  v12 = v6 + v10 + v11;
  objc_msgSend(v3, "tallestColumnHeight");
  v14 = v13 + v12;
  objc_msgSend(v3, "tallestInsetBottom");
  v16 = v15 + v14;

  return v16;
}

- (CGRect)boundingSelectionFrameForFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat r2;
  double v42;
  CGFloat v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGPoint v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;
  CGRect v57;
  CGRect v58;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  MidX = CGRectGetMidX(a3);
  v51.origin.x = x;
  v51.origin.y = y;
  v43 = width;
  v51.size.width = width;
  v51.size.height = height;
  MidY = CGRectGetMidY(v51);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v42 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v14)
  {
    v15 = v14;
    v40 = v10;
    r2 = height;
    v38 = v12;
    v39 = v11;
    v16 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v18, "numberOfItems", *(_QWORD *)&v38, *(_QWORD *)&v39, *(_QWORD *)&v40))
        {
          objc_msgSend(v18, "sectionHeaderFrame");
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(v18, "sectionHeaderVerticalBump");
          v28 = v22 - v27;
          objc_msgSend(v18, "itemsBoundingFrame");
          v57.origin.x = v29;
          v57.origin.y = v30;
          v57.size.width = v31;
          v57.size.height = v32;
          v52.origin.x = v20;
          v52.origin.y = v28;
          v52.size.width = v24;
          v52.size.height = v26;
          v53 = CGRectUnion(v52, v57);
          v50.x = MidX;
          v50.y = MidY;
          if (CGRectContainsPoint(v53, v50))
          {
            v54.origin.x = v20;
            v54.origin.y = v28;
            v54.size.width = v24;
            v54.size.height = v26;
            v58.origin.x = x;
            v58.origin.y = y;
            v58.size.width = v43;
            v58.size.height = r2;
            v55 = CGRectUnion(v54, v58);
            v10 = v55.origin.x;
            v11 = v55.origin.y;
            v12 = v55.size.width;
            v33 = v55.size.height;
            goto LABEL_13;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v15)
        continue;
      break;
    }
    v11 = v39;
    v10 = v40;
    v12 = v38;
  }
  v33 = v42;
LABEL_13:

  v34 = v10;
  v35 = v11;
  v36 = v12;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  void *v3;
  double v4;
  BOOL v5;

  -[VUIShelfViewLayout layoutHelper](self, "layoutHelper", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tallestHeaderHeight");
  v5 = v4 > 0.0;

  return v5;
}

- (BOOL)_bumpHeaderForLayoutSection:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionHeaderFrame");
  if (v9 <= 0.0)
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    v10 = v8;
    -[VUIShelfViewLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vuiContentInsets");
    v13 = v12;
    -[VUIShelfViewLayout delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "collectionViewLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collectionView:layout:selectionMarginsForItemAtIndexPath:", v11, v15, v7);
      v17 = v16;
      v19 = v18;
      v21 = v20;

    }
    else
    {
      v17 = *MEMORY[0x1E0DC49E8];
      v19 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v21 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    objc_msgSend(v11, "vuiContentOffset");
    v24 = v23;
    objc_msgSend(v6, "itemFrameAtIndex:", objc_msgSend(v7, "item"));
    v26 = v25;
    v28 = v27;
    objc_msgSend(v6, "sectionInset");
    v30 = fmax(v10 - v24, v29);
    objc_msgSend(v6, "sectionHeaderFrame");
    if (v26 - v19 - v24 >= v13)
      v33 = v26 - v19 - v24;
    else
      v33 = v13;
    v34 = 0;
    v35 = 1.0;
    v36 = 0;
    v37 = 1.0;
    v38 = v30;
    v32 = v21 + v19 + v28;
    v22 = CGRectIntersectsRect(*(CGRect *)(&v31 - 2), *(CGRect *)&v33);
    if (v22)
    {
      -[VUIShelfViewLayout headerSelectionMargin](self, "headerSelectionMargin");
      v40 = v39;
      -[VUIShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
      objc_msgSend(v6, "setSectionHeaderVerticalBump:", fmax(v40 - (v41 - v17), 0.0));
    }

  }
  return v22;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[VUIShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIShelfViewLayout;
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:](&v8, sel_targetContentOffsetForProposedContentOffset_, x, y);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat width;
  CGFloat height;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  objc_super v49;
  CGPoint result;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (-[VUIShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[VUIShelfViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vuiBounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "vuiContentSize");
    v19 = v18;
    objc_msgSend(v9, "vuiContentInsets");
    v21 = v20;
    v23 = v22 + v19 + v20;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    if (v23 <= CGRectGetWidth(v51))
    {
      v7 = -v21;
    }
    else
    {
      -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "copy");

      v48 = v7 + v21;
      v52.origin.x = v11;
      v52.origin.y = v13;
      v52.size.width = v15;
      v52.size.height = v17;
      if (v23 - (v7 + v21) <= CGRectGetWidth(v52))
      {
        v54.origin.x = v11;
        v54.origin.y = v13;
        v54.size.width = v15;
        v54.size.height = v17;
        v7 = v23 - CGRectGetWidth(v54) - v21;
      }
      else
      {
        -[VUIShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:", v7, v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v26, "section"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "itemFrameAtIndex:", objc_msgSend(v27, "item"));
          v29 = v53.origin.x;
          v30 = v53.origin.y;
          width = v53.size.width;
          height = v53.size.height;
          if (v48 > CGRectGetMidX(v53))
          {
            v33 = objc_msgSend(v27, "item") + 1;
            if (v33 >= objc_msgSend(v28, "numberOfItems"))
            {
              v40 = objc_msgSend(v25, "indexOfObject:", v28) + 1;
              if (v40 < objc_msgSend(v25, "count"))
              {
                objc_msgSend(v25, "objectAtIndex:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v41, "firstItemFrame");
                v29 = v42;
                v30 = v43;
                width = v44;
                height = v45;
                v28 = v41;
              }
            }
            else
            {
              objc_msgSend(v28, "itemFrameAtIndex:", objc_msgSend(v27, "item") + 1);
              v29 = v34;
              v30 = v35;
              width = v36;
              height = v37;
            }
          }
          v55.origin.x = v29;
          v55.origin.y = v30;
          v55.size.width = width;
          v55.size.height = height;
          v7 = CGRectGetMinX(v55) - v21;

        }
      }

    }
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VUIShelfViewLayout;
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v49, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
    v7 = v38;
    v6 = v39;
  }
  v46 = v7;
  v47 = v6;
  result.y = v47;
  result.x = v46;
  return result;
}

- (id)_indexPathForItemAtProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MinX;
  double MaxX;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  v43 = *MEMORY[0x1E0C80C00];
  -[VUIShelfViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vuiContentInsets");
  v8 = v7;
  v10 = v9;

  -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = x + v10;
    v17 = y + v8;
    v18 = *(_QWORD *)v39;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
      objc_msgSend(v20, "itemsBoundingFrame", (_QWORD)v38);
      v44.x = v16;
      v44.y = v17;
      if (CGRectContainsPoint(v45, v44))
        break;
      if (v15 == ++v19)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v21 = v20;

    if (!v21 || objc_msgSend(v21, "numberOfItems") < 1)
      goto LABEL_19;
    v22 = 0;
    while (1)
    {
      objc_msgSend(v21, "itemFrameAtIndex:", v22);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[VUIShelfViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v32 = v31 + v28;
      v46.origin.x = v24;
      v46.origin.y = v26;
      v46.size.width = v32;
      v46.size.height = v30;
      MinX = CGRectGetMinX(v46);
      v47.origin.x = v24;
      v47.origin.y = v26;
      v47.size.width = v32;
      v47.size.height = v30;
      MaxX = CGRectGetMaxX(v47);
      if (v16 >= MinX && v16 <= MaxX)
        break;
      if (++v22 >= objc_msgSend(v21, "numberOfItems", MaxX))
        goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v22, objc_msgSend(v13, "indexOfObject:", v21, MaxX));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:

    v21 = 0;
LABEL_19:
    v37 = 0;
  }

  return v37;
}

- (void)snapContent
{
  -[VUIShelfViewLayout snapContentToIndexPath:](self, "snapContentToIndexPath:", 0);
}

- (void)snapContentToIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  CGRect v18;

  v17 = a3;
  if (-[VUIShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[VUIShelfViewLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vuiContentOffset");
    -[VUIShelfViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    v6 = v5;
    v8 = v7;
    if (v17)
    {
      v9 = objc_msgSend(v17, "section");
      -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        objc_msgSend(v4, "vuiContentInsets");
        v13 = v12;
        -[VUIShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v17, "section"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v17, "item");
        if (v16 < objc_msgSend(v15, "numberOfItems"))
        {
          objc_msgSend(v15, "itemFrameAtIndex:", objc_msgSend(v17, "item"));
          v6 = CGRectGetMinX(v18) - v13;
        }

      }
    }
    objc_msgSend(v4, "setVuiContentOffset:", v6, v8);

  }
}

- (id)indexPathForSnappedContent
{
  void *v3;
  void *v4;

  if (-[VUIShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[VUIShelfViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vuiContentOffset");
    -[VUIShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (VUIShelfViewLayoutDelegate)delegate
{
  return (VUIShelfViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldSnapContent
{
  return self->_shouldSnapContent;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (void)setMinimumLineSpacing:(double)a3
{
  self->_minimumLineSpacing = a3;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

- (int64_t)prominentSectionIndex
{
  return self->_prominentSectionIndex;
}

- (void)setProminentSectionIndex:(int64_t)a3
{
  self->_prominentSectionIndex = a3;
}

- (CGSize)headerReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerReferenceSize.width;
  height = self->_headerReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderReferenceSize:(CGSize)a3
{
  self->_headerReferenceSize = a3;
}

- (double)headerSelectionMargin
{
  return self->_headerSelectionMargin;
}

- (void)setHeaderSelectionMargin:(double)a3
{
  self->_headerSelectionMargin = a3;
}

- (double)headerBottomMargin
{
  return self->_headerBottomMargin;
}

- (void)setHeaderBottomMargin:(double)a3
{
  self->_headerBottomMargin = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (VUIShelfLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutHelper, a3);
}

- (NSArray)shelfLayoutSections
{
  return self->_shelfLayoutSections;
}

- (void)setShelfLayoutSections:(id)a3
{
  objc_storeStrong((id *)&self->_shelfLayoutSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfLayoutSections, 0);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
