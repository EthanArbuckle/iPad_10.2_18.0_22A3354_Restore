@implementation PKHorizontalScrollingChildLayout

- (PKHorizontalScrollingChildLayout)init
{
  PKHorizontalScrollingChildLayout *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributesPerIndexPath;
  NSMutableDictionary *v5;
  NSMutableDictionary *headersPerIndexPath;
  NSMutableDictionary *v7;
  NSMutableDictionary *footersPerIndexPath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKHorizontalScrollingChildLayout;
  v2 = -[PKHorizontalScrollingChildLayout init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributesPerIndexPath = v2->_attributesPerIndexPath;
    v2->_attributesPerIndexPath = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    headersPerIndexPath = v2->_headersPerIndexPath;
    v2->_headersPerIndexPath = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    footersPerIndexPath = v2->_footersPerIndexPath;
    v2->_footersPerIndexPath = v7;

  }
  return v2;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[PKHorizontalScrollingChildLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setAlphaTransition:(double)a3
{
  double lastDrawnAlpha;
  BOOL v4;

  if (self->_alphaTransition != a3)
  {
    lastDrawnAlpha = self->_lastDrawnAlpha;
    self->_alphaTransition = a3;
    if (a3 == 1.0 || (a3 != 0.0 ? (v4 = !self->_isLowEndDevice) : (v4 = 1), v4 || vabdd_f64(a3, lastDrawnAlpha) > 0.03))
    {
      self->_lastDrawnAlpha = a3;
      -[PKHorizontalScrollingChildLayout invalidateLayout](self, "invalidateLayout");
    }
  }
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentSize.width;
  height = self->_currentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  CGFloat v6;
  double v7;
  CGSize *p_currentSize;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id WeakRetained;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *headersPerIndexPath;
  void *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  int v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  NSMutableDictionary *footersPerIndexPath;
  void *v56;
  id v57;
  int v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  id *location;
  double v66;
  double v67;
  double v68;
  objc_super v69;

  -[PKHorizontalScrollingChildLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    -[NSMutableDictionary removeAllObjects](self->_attributesPerIndexPath, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_headersPerIndexPath, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_footersPerIndexPath, "removeAllObjects");
    objc_msgSend(v3, "frame");
    v7 = v6;
    p_currentSize = &self->_currentSize;
    self->_currentSize.width = v6;
    self->_currentSize.height = 0.0;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v3, "numberOfSections") >= 1)
    {
      v10 = 0;
      v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v67 = *MEMORY[0x1E0C9D820];
      v62 = *MEMORY[0x1E0DC48A8];
      v63 = *MEMORY[0x1E0DC48A0];
      v64 = v11;
      do
      {
        objc_msgSend(v5, "collectionView:layout:insetForSectionAtIndex:", v3, self, v10, v62);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        location = (id *)&self->_dataSource;
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "lineSpacingForSection:", v10);
        v68 = v21;

        v22 = v13 + p_currentSize->height;
        p_currentSize->height = v22;
        objc_msgSend(v5, "collectionView:layout:referenceSizeForHeaderInSection:", v3, self, v10);
        v25 = v24;
        if (v24 == v67 && v23 == v11)
        {
          v27 = v11;
          v33 = v15;
        }
        else
        {
          v27 = v23;
          if (v10)
            v22 = v22 + 8.0;
          v28 = (void *)MEMORY[0x1E0DC3628];
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v62, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "setSize:", v25, v27);
          objc_msgSend(v30, "setFrame:", v15, v22, v25, v27);
          headersPerIndexPath = self->_headersPerIndexPath;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](headersPerIndexPath, "setObject:forKey:", v30, v32);

          objc_msgSend(v9, "addObject:", v30);
          v33 = v15 + v25;

        }
        v34 = objc_msgSend(v3, "numberOfItemsInSection:", v10);
        v66 = v17;
        if (v34)
        {
          v35 = v34;
          for (i = 0; i != v35; ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v10);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "collectionView:layout:sizeForItemAtIndexPath:", v3, self, v37);
            v39 = v38;
            v41 = v40;
            if (v7 - v33 - v19 >= v38)
            {
              if (v33 == v15)
                v42 = v33;
              else
                v42 = v33 + 8.0;
            }
            else
            {
              if (i | v10)
                v22 = v22 + v68 + v27;
              else
                v22 = v22 + v68 + v27 + 2.0;
              PKFloatRoundToPixel();
              -[PKHorizontalScrollingChildLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v9);
              objc_msgSend(v9, "removeAllObjects");
              v42 = v15;
            }
            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v37);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setSize:", v39, v41);
            objc_msgSend(v43, "setFrame:", v42, v22, v39, v41);
            -[NSMutableDictionary setObject:forKey:](self->_attributesPerIndexPath, "setObject:forKey:", v43, v37);
            objc_msgSend(v9, "addObject:", v43);
            v33 = v39 + v42;

            v27 = v41;
          }
        }
        else
        {
          v41 = v27;
        }
        v44 = v7 - v15 - v19;
        objc_msgSend(v5, "collectionView:layout:referenceSizeForFooterInSection:", v3, self, v10);
        v47 = v45;
        v48 = v46;
        if (v45 != v67 || v46 != v64)
        {
          if (v44 - v33 >= v45)
          {
            if (v33 == v15)
              v15 = v33;
            else
              v15 = v33 + 8.0;
          }
          else
          {
            v49 = objc_loadWeakRetained(location);
            v50 = objc_msgSend(v49, "horizontalAlignmentForSection:", v10);

            if ((v50 | 2) == 3)
              PKFloatRoundToPixel();
            else
              v51 = 0.0;
            v22 = v68 + v41 + v22;
            -[PKHorizontalScrollingChildLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v9, v51);
            objc_msgSend(v9, "removeAllObjects");
          }
          v52 = (void *)MEMORY[0x1E0DC3628];
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v63, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v54, "setSize:", v47, v48);
          objc_msgSend(v54, "setFrame:", v15, v22, v47, v48);
          footersPerIndexPath = self->_footersPerIndexPath;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](footersPerIndexPath, "setObject:forKey:", v54, v56);

          objc_msgSend(v9, "addObject:", v54);
          v41 = v48;
        }
        p_currentSize = &self->_currentSize;
        if (objc_msgSend(v9, "count"))
        {
          v57 = objc_loadWeakRetained(location);
          v58 = objc_msgSend(v57, "horizontalAlignmentForSection:", v10);

          if ((v58 | 2) == 3)
          {
            PKFloatRoundToPixel();
            v60 = v59;
          }
          else
          {
            v60 = 0.0;
          }
          v61 = (void *)objc_msgSend(v9, "copy");
          -[PKHorizontalScrollingChildLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v61, v60);

          objc_msgSend(v9, "removeAllObjects");
        }
        self->_currentSize.height = v66 + v41 + v22;
        ++v10;
        v11 = v64;
      }
      while (v10 < objc_msgSend(v3, "numberOfSections"));
    }
    p_currentSize->height = p_currentSize->height + 16.0;
    v69.receiver = self;
    v69.super_class = (Class)PKHorizontalScrollingChildLayout;
    -[PKHorizontalScrollingChildLayout prepareLayout](&v69, sel_prepareLayout);

  }
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "frame");
        objc_msgSend(v10, "setFrame:", v11 + a4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_attributesPerIndexPath, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "alphaForIndexPath:visible:transition:", v6, self->_visible, self->_alphaTransition);
  objc_msgSend(v4, "setAlpha:");

  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = self->_attributesPerIndexPath;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKey:](self->_attributesPerIndexPath, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size.width = width;
        v53.size.height = height;
        if (CGRectIntersectsRect(v50, v53))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
          objc_msgSend(v13, "indexPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "alphaForIndexPath:visible:transition:", v15, self->_visible, self->_alphaTransition);
          objc_msgSend(v13, "setAlpha:");

          objc_msgSend(v33, "addObject:", v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = self->_headersPerIndexPath;
  v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v16);
        -[NSMutableDictionary objectForKey:](self->_headersPerIndexPath, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        if (CGRectIntersectsRect(v51, v54))
        {
          v22 = objc_loadWeakRetained((id *)&self->_dataSource);
          objc_msgSend(v21, "indexPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "alphaForIndexPath:visible:transition:", v23, self->_visible, self->_alphaTransition);
          objc_msgSend(v21, "setAlpha:");

          objc_msgSend(v33, "addObject:", v21);
        }

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v18);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = self->_footersPerIndexPath;
  v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        -[NSMutableDictionary objectForKey:](self->_footersPerIndexPath, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v28));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "frame");
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        if (CGRectIntersectsRect(v52, v55))
        {
          v30 = objc_loadWeakRetained((id *)&self->_dataSource);
          objc_msgSend(v29, "indexPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "alphaForIndexPath:visible:transition:", v31, self->_visible, self->_alphaTransition);
          objc_msgSend(v29, "setAlpha:");

          objc_msgSend(v33, "addObject:", v29);
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v26);
  }

  return v33;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((id)*MEMORY[0x1E0DC48A8] == v6)
  {
    -[NSMutableDictionary objectForKey:](self->_headersPerIndexPath, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v8, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    objc_msgSend(WeakRetained, "alphaForIndexPath:visible:transition:", v10, self->_visible, self->_alphaTransition);
    objc_msgSend(v8, "setAlpha:");

    goto LABEL_7;
  }
  if ((id)*MEMORY[0x1E0DC48A0] == v6)
  {
    -[NSMutableDictionary objectForKey:](self->_footersPerIndexPath, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v8, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (PKHorizontalScrollingChildLayoutDataSource)dataSource
{
  return (PKHorizontalScrollingChildLayoutDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)isLowEndDevice
{
  return self->_isLowEndDevice;
}

- (void)setIsLowEndDevice:(BOOL)a3
{
  self->_isLowEndDevice = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footersPerIndexPath, 0);
  objc_storeStrong((id *)&self->_headersPerIndexPath, 0);
  objc_storeStrong((id *)&self->_attributesPerIndexPath, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
