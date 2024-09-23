@implementation _TVShelfViewLayout

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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v37 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v38 = *MEMORY[0x24BDBF148];
    v41 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v42 = *MEMORY[0x24BDBF090];
    v39 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v40 = *(double *)(MEMORY[0x24BDBF090] + 16);
    do
    {
      -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections", *(_QWORD *)&v37);
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
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVShelfViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("TVShelfLayoutElementKindHeader"), v24);
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
              objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, v11);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVShelfViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v33);
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
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
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
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat width;
  CGFloat height;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  unint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  objc_super v54;
  CGPoint result;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (-[_TVShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    v53 = v6;
    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentSize");
    v20 = v19;

    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentInset");
    v23 = v22;
    v25 = v24;

    v26 = v25 + v20 + v23;
    v56.origin.x = v11;
    v56.origin.y = v13;
    v56.size.width = v15;
    v56.size.height = v17;
    if (v26 <= CGRectGetWidth(v56))
    {
      v7 = -v23;
      v29 = v53;
    }
    else
    {
      -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "copy");

      v52 = v7 + v23;
      v57.origin.x = v11;
      v57.origin.y = v13;
      v57.size.width = v15;
      v57.size.height = v17;
      if (v26 - (v7 + v23) <= CGRectGetWidth(v57))
      {
        v59.origin.x = v11;
        v59.origin.y = v13;
        v59.size.width = v15;
        v59.size.height = v17;
        v7 = v26 - CGRectGetWidth(v59) - v23;
        v29 = v53;
      }
      else
      {
        v29 = v53;
        -[_TVShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:", v7, v53);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v30, "section"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "itemFrameAtIndex:", objc_msgSend(v31, "item"));
          v33 = v58.origin.x;
          v34 = v58.origin.y;
          width = v58.size.width;
          height = v58.size.height;
          if (v52 > CGRectGetMidX(v58))
          {
            v37 = objc_msgSend(v31, "item");
            if (v37 >= objc_msgSend(v32, "numberOfItems"))
            {
              v44 = objc_msgSend(v28, "indexOfObject:", v32) + 1;
              if (v44 < objc_msgSend(v28, "count"))
              {
                objc_msgSend(v28, "objectAtIndex:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v45, "firstItemFrame");
                v33 = v46;
                v34 = v47;
                width = v48;
                height = v49;
                v32 = v45;
              }
            }
            else
            {
              objc_msgSend(v32, "itemFrameAtIndex:", objc_msgSend(v31, "item") + 1);
              v33 = v38;
              v34 = v39;
              width = v40;
              height = v41;
            }
          }
          v60.origin.x = v33;
          v60.origin.y = v34;
          v60.size.width = width;
          v60.size.height = height;
          v7 = CGRectGetMinX(v60) - v23;

        }
      }

    }
  }
  else
  {
    v54.receiver = self;
    v54.super_class = (Class)_TVShelfViewLayout;
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v54, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
    v7 = v42;
    v29 = v43;
  }
  v50 = v7;
  v51 = v29;
  result.y = v51;
  result.x = v50;
  return result;
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
  if (-[_TVShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", x, y, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVShelfViewLayout;
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](&v8, sel_targetContentOffsetForProposedContentOffset_, x, y);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)snapContent
{
  -[_TVShelfViewLayout snapContentToIndexPath:](self, "snapContentToIndexPath:", 0);
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
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  CGRect v19;

  v18 = a3;
  if (-[_TVShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    -[_TVShelfViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    v6 = v5;
    v8 = v7;
    if (v18)
    {
      v9 = objc_msgSend(v18, "section");
      -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        -[_TVShelfViewLayout collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contentInset");
        v14 = v13;

        -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v18, "section"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v18, "item");
        if (v17 < objc_msgSend(v16, "numberOfItems"))
        {
          objc_msgSend(v16, "itemFrameAtIndex:", objc_msgSend(v18, "item"));
          v6 = CGRectGetMinX(v19) - v14;
        }

      }
    }
    objc_msgSend(v4, "setContentOffset:animated:", 0, v6, v8);

  }
}

- (BOOL)shouldSnapContent
{
  return self->_shouldSnapContent;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  void *v3;
  double v4;
  BOOL v5;

  -[_TVShelfViewLayout layoutHelper](self, "layoutHelper", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tallestHeaderHeight");
  v5 = v4 > 0.0;

  return v5;
}

- (NSArray)shelfLayoutSections
{
  return self->_shelfLayoutSections;
}

- (void)setShelfLayoutSections:(id)a3
{
  objc_storeStrong((id *)&self->_shelfLayoutSections, a3);
}

- (void)setMinimumLineSpacing:(double)a3
{
  self->_minimumLineSpacing = a3;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (void)setLayoutHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutHelper, a3);
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

- (int64_t)prominentSectionIndex
{
  return self->_prominentSectionIndex;
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  _TVShelfLayoutHelper *v6;
  void *v7;
  uint64_t v8;
  TVShelfLayoutSection *v9;
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
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
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double MaxX;
  BOOL v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  void *v80;
  CGFloat v81;
  double v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double rect1;
  CGFloat rect1a;
  objc_super v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v89.receiver = self;
  v89.super_class = (Class)_TVShelfViewLayout;
  -[_TVShelfViewLayout prepareLayout](&v89, sel_prepareLayout);
  -[_TVShelfViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_TVShelfViewLayout layoutHelper](self, "layoutHelper");
    v6 = (_TVShelfLayoutHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[_TVShelfLayoutHelper initWithShelfViewLayout:]([_TVShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);
      -[_TVShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v6);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v3;
    if (v4 >= 1)
    {
      v8 = 0;
      v85 = *(double *)(MEMORY[0x24BDBF090] + 8);
      rect1 = *MEMORY[0x24BDBF090];
      v82 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v83 = *(double *)(MEMORY[0x24BDBF090] + 16);
      do
      {
        v9 = objc_alloc_init(TVShelfLayoutSection);
        -[_TVShelfLayoutHelper frameForHeaderInSection:](v6, "frameForHeaderInSection:", v8);
        -[TVShelfLayoutSection setSectionHeaderFrame:](v9, "setSectionHeaderFrame:");
        -[_TVShelfLayoutHelper insetForSection:](v6, "insetForSection:", v8);
        -[TVShelfLayoutSection setSectionInset:](v9, "setSectionInset:");
        v10 = objc_msgSend(v3, "numberOfItemsInSection:", v8);
        -[TVShelfLayoutSection setNumberOfItems:](v9, "setNumberOfItems:", v10);
        height = v82;
        width = v83;
        y = v85;
        x = rect1;
        if (v10 >= 1)
        {
          v15 = 0;
          y = v85;
          x = rect1;
          height = v82;
          width = v83;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v15, v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[_TVShelfLayoutHelper frameForItemAtIndexPath:](v6, "frameForItemAtIndexPath:", v16);
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v24 = v23;

            -[TVShelfLayoutSection setItemFrame:atIndex:](v9, "setItemFrame:atIndex:", v15, v18, v20, v22, v24);
            v90.origin.x = x;
            v90.origin.y = y;
            v90.size.width = width;
            v90.size.height = height;
            v99.origin.x = v18;
            v99.origin.y = v20;
            v99.size.width = v22;
            v99.size.height = v24;
            v91 = CGRectUnion(v90, v99);
            x = v91.origin.x;
            y = v91.origin.y;
            width = v91.size.width;
            height = v91.size.height;
            ++v15;
          }
          while (v10 != v15);
        }
        -[TVShelfLayoutSection setItemsBoundingFrame:](v9, "setItemsBoundingFrame:", x, y, width, height);
        objc_msgSend(v7, "addObject:", v9);

        ++v8;
        v3 = v80;
      }
      while (v8 != v4);
    }
    v25 = (void *)objc_msgSend(v7, "copy");
    -[_TVShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", v25);

    objc_msgSend(v3, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "indexPathForPreferredFocusedViewInCollectionView:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = -[_TVShelfViewLayout rowCount](self, "rowCount");
    v29 = objc_msgSend(v27, "item");
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "focusedView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v80, "indexPathForCell:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqual:", v27);

      if (v33)
      {
        if (!(v29 % v28))
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVShelfViewLayout _bumpHeaderForLayoutSection:forIndexPath:](self, "_bumpHeaderForLayoutSection:forIndexPath:", v34, v27);

        }
      }
    }

    v5 = 0;
    v3 = v80;
  }
  objc_msgSend(v3, "contentOffset");
  v36 = v35;
  objc_msgSend(v3, "contentInset");
  if (v4 >= 1)
  {
    v38 = 0;
    v39 = *MEMORY[0x24BDBF090];
    v40 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v41 = *(double *)(MEMORY[0x24BDBF090] + 16);
    rect1a = *(double *)(MEMORY[0x24BDBF090] + 24);
    v76 = *MEMORY[0x24BDBF090];
    v77 = v36 + v37;
    v74 = v41;
    v75 = v40;
    do
    {
      -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections", *(_QWORD *)&v74, *(_QWORD *)&v75, *(_QWORD *)&v76);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndex:", v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "sectionHeaderFrame");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v92.origin.x = v39;
      v92.origin.y = v40;
      v92.size.width = v41;
      v92.size.height = rect1a;
      v100.origin.x = v45;
      v100.origin.y = v47;
      v100.size.width = v49;
      v100.size.height = v51;
      if (!CGRectEqualToRect(v92, v100))
      {
        v78 = v51;
        v79 = v49;
        v81 = v47;
        v86 = v45;
        objc_msgSend(v43, "firstItemFrame");
        v53 = v52;
        v55 = v54;
        v57 = v56;
        v59 = v58;
        objc_msgSend(v43, "lastItemFrame");
        v61 = v60;
        v63 = v62;
        v65 = v64;
        v67 = v66;
        v93.origin.x = v53;
        v93.origin.y = v55;
        v93.size.width = v57;
        v93.size.height = v59;
        v68 = fmax(v77, CGRectGetMinX(v93));
        v84 = v61;
        v94.origin.x = v61;
        v94.origin.y = v63;
        v94.size.width = v65;
        v94.size.height = v67;
        v69 = fmin(v68, CGRectGetMinX(v94));
        if (v4 - 1 == v38)
        {
          v40 = v75;
          v39 = v76;
          v41 = v74;
          v70 = v86;
        }
        else
        {
          v95.origin.x = v69;
          v95.size.width = v79;
          v95.origin.y = v81;
          v95.size.height = v78;
          MaxX = CGRectGetMaxX(v95);
          v96.origin.y = v63;
          v96.origin.x = v61;
          v96.size.width = v65;
          v96.size.height = v67;
          v72 = MaxX < CGRectGetMaxX(v96);
          v40 = v75;
          v39 = v76;
          v41 = v74;
          v70 = v86;
          if (!v72)
          {
            v97.origin.y = v63;
            v97.origin.x = v84;
            v97.size.width = v65;
            v97.size.height = v67;
            v73 = CGRectGetMaxX(v97);
            v98.origin.x = v86;
            v98.size.width = v79;
            v98.origin.y = v81;
            v98.size.height = v78;
            v69 = v73 - CGRectGetWidth(v98);
          }
        }
        objc_msgSend(v43, "setSectionHeaderHorizontalOffset:", v69 - v70);
      }

      ++v38;
    }
    while (v4 != v38);
  }
  if (!v5)
    -[_TVShelfViewLayout snapContent](self, "snapContent");

}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (_TVShelfLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6920], "layoutAttributesForCellWithIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");
  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v4, "item");
    if (v11 < objc_msgSend(v10, "numberOfItems"))
    {
      objc_msgSend(v10, "itemFrameAtIndex:", objc_msgSend(v4, "item"));
      if (fabs(v12) == INFINITY
        || fabs(v13) == INFINITY
        || fabs(v14) == INFINITY
        || (v16 = fabs(v15), v16 >= INFINITY) && v16 <= INFINITY)
      {
        v17 = TVMLKitLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = v4;
          _os_log_impl(&dword_222D98000, v17, OS_LOG_TYPE_DEFAULT, "shelf cell frame not finite for %@", (uint8_t *)&v19, 0xCu);
        }
        v12 = *MEMORY[0x24BDBF090];
        v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
      }
      objc_msgSend(v5, "setFrame:", v12, v13, v14, v15);
    }

  }
  return v5;
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
  _TVShelfViewLayout *v19;
  id v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "invalidateVerticalBumps"))
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = objc_msgSend(v10, "item");
    v12 = v11 % -[_TVShelfViewLayout rowCount](self, "rowCount") == 0;
    -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __50___TVShelfViewLayout_invalidateLayoutWithContext___block_invoke;
    v17[3] = &unk_24EB85FF8;
    v21 = v12;
    v18 = v10;
    v19 = self;
    v20 = v6;
    v14 = v6;
    v15 = v10;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);

    objc_msgSend(v5, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("TVShelfLayoutElementKindHeader"), v14);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "invalidateLayout") & 1) != 0
    || (objc_msgSend(v4, "invalidateEverything") & 1) != 0
    || objc_msgSend(v4, "invalidateDataSourceCounts"))
  {
    -[_TVShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", 0);
    -[_TVShelfViewLayout setShelfLayoutSections:](self, "setShelfLayoutSections:", 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)_TVShelfViewLayout;
  -[_TVShelfViewLayout invalidateLayoutWithContext:](&v16, sel_invalidateLayoutWithContext_, v4);

}

- (_TVShelfViewLayout)init
{
  _TVShelfViewLayout *v2;
  _TVShelfViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVShelfViewLayout;
  v2 = -[_TVShelfViewLayout init](&v5, sel_init);
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
    -[_TVShelfViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v2, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
  }
  return v3;
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

- (double)computedContentHeight
{
  void *v3;
  void *v4;
  _TVShelfLayoutHelper *v5;
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

  -[_TVShelfViewLayout layoutHelper](self, "layoutHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVShelfViewLayout layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[_TVShelfLayoutHelper initWithShelfViewLayout:]([_TVShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);

    -[_TVShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v5);
    v3 = v5;
  }
  objc_msgSend(v3, "tallestHeaderHeight");
  v6 = 0.0;
  if (v7 > 0.0)
  {
    -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
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

  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
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
  -[_TVShelfViewLayout computedContentHeight](self, "computedContentHeight");
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
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
      -[_TVShelfViewLayout snapContent](self, "snapContent");
  }
}

- (void)setRowCount:(int64_t)a3
{
  if (a3 >= 1)
    self->_rowCount = a3;
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
  CGFloat v22;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDF6920], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "section");
  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sectionHeaderFrame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "sectionHeaderVerticalBump");
    objc_msgSend(v7, "setFrame:", v14, v16 - v21, v18, v20);
    memset(&v25, 0, sizeof(v25));
    objc_msgSend(v12, "sectionHeaderHorizontalOffset");
    CGAffineTransformMakeTranslation(&v25, v22, 0.0);
    v24 = v25;
    objc_msgSend(v7, "setTransform:", &v24);

  }
  return v7;
}

- (int64_t)computedRowCount
{
  void *v3;
  void *v4;
  _TVShelfLayoutHelper *v5;
  int64_t v6;

  -[_TVShelfViewLayout layoutHelper](self, "layoutHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVShelfViewLayout layoutHelper](self, "layoutHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[_TVShelfLayoutHelper initWithShelfViewLayout:]([_TVShelfLayoutHelper alloc], "initWithShelfViewLayout:", self);

    -[_TVShelfViewLayout setLayoutHelper:](self, "setLayoutHelper:", v5);
    v3 = v5;
  }
  v6 = objc_msgSend(v3, "actualRowCount");

  return v6;
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
  v49 = *MEMORY[0x24BDAC8D0];
  MidX = CGRectGetMidX(a3);
  v51.origin.x = x;
  v51.origin.y = y;
  v43 = width;
  v51.size.width = width;
  v51.size.height = height;
  MidY = CGRectGetMidY(v51);
  v10 = *MEMORY[0x24BDBF090];
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v42 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionHeaderFrame");
  if (v9 <= 0.0)
  {
    LOBYTE(v20) = 0;
  }
  else
  {
    v10 = v8;
    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentInset");
    v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "selectionMarginsForCellAtIndexPath:", v7);
      v15 = v14;
      v17 = v16;
      v19 = v18;
    }
    else
    {
      v15 = *MEMORY[0x24BDF7718];
      v17 = *(double *)(MEMORY[0x24BDF7718] + 8);
      v19 = *(double *)(MEMORY[0x24BDF7718] + 24);
    }
    objc_msgSend(v11, "contentOffset");
    v22 = v21;
    objc_msgSend(v6, "itemFrameAtIndex:", objc_msgSend(v7, "item"));
    v24 = v23;
    v26 = v25;
    objc_msgSend(v6, "sectionInset");
    v28 = fmax(v10 - v22, v27);
    objc_msgSend(v6, "sectionHeaderFrame");
    if (v24 - v17 - v22 >= v13)
      v31 = v24 - v17 - v22;
    else
      v31 = v13;
    v32 = 0;
    v33 = 1.0;
    v34 = 0;
    v35 = 1.0;
    v36 = v28;
    v30 = v19 + v17 + v26;
    v20 = CGRectIntersectsRect(*(CGRect *)(&v29 - 2), *(CGRect *)&v31);
    if (v20)
    {
      -[_TVShelfViewLayout headerSelectionMargin](self, "headerSelectionMargin");
      v38 = v37;
      -[_TVShelfViewLayout headerBottomMargin](self, "headerBottomMargin");
      objc_msgSend(v6, "setSectionHeaderVerticalBump:", fmax(v38 - (v39 - v15), 0.0));
    }

  }
  return v20;
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
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGPoint v40;
  CGPoint v41;
  CGRect v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  v39 = *MEMORY[0x24BDAC8D0];
  -[_TVShelfViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;

  -[_TVShelfViewLayout shelfLayoutSections](self, "shelfLayoutSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = y + v8;
    v17 = x + v10;
    v18 = *(_QWORD *)v35;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v19);
      objc_msgSend(v20, "itemsBoundingFrame", (_QWORD)v34);
      v40.x = v17;
      v40.y = v16;
      if (CGRectContainsPoint(v42, v40))
        break;
      if (v15 == ++v19)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v21 = v20;

    if (!v21 || objc_msgSend(v21, "numberOfItems") < 1)
      goto LABEL_15;
    v22 = 0;
    while (1)
    {
      objc_msgSend(v21, "itemFrameAtIndex:", v22);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[_TVShelfViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v43.size.width = v31 + v28;
      v43.origin.x = v24;
      v43.origin.y = v26;
      v43.size.height = v30;
      v41.x = v17;
      v41.y = v16;
      if (CGRectContainsPoint(v43, v41))
        break;
      if (++v22 >= objc_msgSend(v21, "numberOfItems"))
        goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v22, objc_msgSend(v13, "indexOfObject:", v21));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:

    v21 = 0;
LABEL_15:
    v32 = 0;
  }

  return v32;
}

- (id)indexPathForSnappedContent
{
  void *v3;
  void *v4;

  if (-[_TVShelfViewLayout shouldSnapContent](self, "shouldSnapContent"))
  {
    -[_TVShelfViewLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    -[_TVShelfViewLayout _indexPathForItemAtProposedContentOffset:](self, "_indexPathForItemAtProposedContentOffset:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (void)setProminentSectionIndex:(int64_t)a3
{
  self->_prominentSectionIndex = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfLayoutSections, 0);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
}

@end
