@implementation _UIFocusCollectionViewSectionContainerGuideRegion

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  -[_UIFocusContainerGuideRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusCollectionViewSectionContainerGuideRegion collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollectionView:", v6);

  objc_msgSend(v5, "setSection:", -[_UIFocusCollectionViewSectionContainerGuideRegion section](self, "section"));
  -[_UIFocusCollectionViewSectionContainerGuideRegion sectionFrame](self, "sectionFrame");
  objc_msgSend(v5, "setSectionFrame:");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  if (-[_UIFocusContainerGuideRegion isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    v7 = objc_loadWeakRetained((id *)v5 + 10);
    v8 = WeakRetained;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

        goto LABEL_14;
      }
      v13 = objc_msgSend(v8, "isEqual:", v9);

      if (!v13)
        goto LABEL_14;
    }
    if (self->_section == *((_QWORD *)v5 + 11))
    {
      v12 = CGRectEqualToRect(self->_sectionFrame, *((CGRect *)v5 + 3));
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  double MinX;
  _BOOL4 v28;
  id v29;
  double MaxX;
  double MinY;
  double MaxY;
  id v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  _UIFocusCollectionViewSectionContainerGuideRegion *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;
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
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  if (WeakRetained)
  {
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__130;
    v74 = __Block_byref_object_dispose__130;
    v75 = 0;
    v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_msgSend(v12, "visibleBounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[_UIFocusCollectionViewSectionContainerGuideRegion sectionFrame](self, "sectionFrame");
    x = v78.origin.x;
    y = v78.origin.y;
    width = v78.size.width;
    height = v78.size.height;
    if (!CGRectIsNull(v78))
    {
      v79.origin.x = v14;
      v79.origin.y = v16;
      v79.size.width = v18;
      v79.size.height = v20;
      if (!CGRectIsNull(v79))
      {
        v80.origin.x = x;
        v80.origin.y = y;
        v80.size.width = width;
        v80.size.height = height;
        v81 = CGRectStandardize(v80);
        v58 = v81.origin.y;
        v59 = v81.origin.x;
        v56 = v81.size.height;
        v57 = v81.size.width;
        v81.origin.x = v14;
        v81.origin.y = v16;
        v81.size.width = v18;
        v81.size.height = v20;
        v82 = CGRectStandardize(v81);
        v54 = v82.origin.y;
        v55 = v82.origin.x;
        v25 = v82.size.width;
        v26 = v82.size.height;
        v82.origin.y = v58;
        v82.origin.x = v59;
        v82.size.height = v56;
        v82.size.width = v57;
        MinX = CGRectGetMinX(v82);
        v83.origin.y = v54;
        v83.origin.x = v55;
        v83.size.width = v25;
        v83.size.height = v26;
        if (MinX + 0.0001 <= CGRectGetMaxX(v83))
        {
          v84.origin.y = v58;
          v84.origin.x = v59;
          v84.size.height = v56;
          v84.size.width = v57;
          MaxX = CGRectGetMaxX(v84);
          v85.origin.y = v54;
          v85.origin.x = v55;
          v85.size.width = v25;
          v85.size.height = v26;
          v28 = MaxX + -0.0001 >= CGRectGetMinX(v85);
        }
        else
        {
          v28 = 0;
        }
        v86.origin.y = v58;
        v86.origin.x = v59;
        v86.size.height = v56;
        v86.size.width = v57;
        MinY = CGRectGetMinY(v86);
        v87.origin.y = v54;
        v87.origin.x = v55;
        v87.size.width = v25;
        v87.size.height = v26;
        if (MinY + 0.0001 <= CGRectGetMaxY(v87))
        {
          v88.origin.y = v58;
          v88.origin.x = v59;
          v88.size.height = v56;
          v88.size.width = v57;
          MaxY = CGRectGetMaxY(v88);
          v89.origin.y = v54;
          v89.origin.x = v55;
          v89.size.width = v25;
          v89.size.height = v26;
          if (MaxY + -0.0001 >= CGRectGetMinY(v89) && v28)
          {
            v34 = objc_loadWeakRetained((id *)&self->_collectionView);
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __114___UIFocusCollectionViewSectionContainerGuideRegion__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot___block_invoke;
            v64[3] = &unk_1E16D6580;
            v69 = &v70;
            v65 = v8;
            v66 = v9;
            v67 = v10;
            v68 = self;
            objc_msgSend(v34, "_performWhileSuppressingPromiseRegionGeneration:", v64);

          }
        }
      }
    }
    v35 = (void *)v71[5];
    if (!v35)
    {
      v90.origin.x = v14;
      v90.origin.y = v16;
      v90.size.width = v18;
      v90.size.height = v20;
      v36 = CGRectGetWidth(v90);
      v91.origin.x = v14;
      v91.origin.y = v16;
      v91.size.width = v18;
      v91.size.height = v20;
      v37 = CGRectGetHeight(v91) * -5.0;
      v92.origin.x = v14;
      v92.origin.y = v16;
      v92.size.width = v18;
      v92.size.height = v20;
      v93 = CGRectInset(v92, v36 * -5.0, v37);
      -[_UIFocusCollectionViewSectionContainerGuideRegion sectionFrame](self, "sectionFrame", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
      v96.origin.x = v14;
      v96.origin.y = v16;
      v96.size.width = v18;
      v96.size.height = v20;
      v95 = CGRectIntersection(v94, v96);
      v38 = v95.origin.x;
      v39 = v95.origin.y;
      v40 = v95.size.width;
      v41 = v95.size.height;
      v42 = objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v42, "coordinateSpace");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_focusPromiseRegionsInRect:inCoordinateSpace:inSection:", v43, -[_UIFocusCollectionViewSectionContainerGuideRegion section](self, "section"), v38, v39, v40, v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v46 = v44;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v61;
        do
        {
          v49 = 0;
          do
          {
            if (*(_QWORD *)v61 != v48)
              objc_enumerationMutation(v46);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v49), "createPromiseRegion", *(_QWORD *)&v54, *(_QWORD *)&v55);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v50);

            ++v49;
          }
          while (v47 != v49);
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        }
        while (v47);
      }

      objc_msgSend(v9, "_nextFocusedItemForFocusMovementRequest:inRegions:withSnapshot:", v8, v45, v10);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v71[5];
      v71[5] = v51;

      v35 = (void *)v71[5];
    }
    v29 = v35;
    _Block_object_dispose(&v70, 8);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (CGRect)sectionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sectionFrame.origin.x;
  y = self->_sectionFrame.origin.y;
  width = self->_sectionFrame.size.width;
  height = self->_sectionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSectionFrame:(CGRect)a3
{
  self->_sectionFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
