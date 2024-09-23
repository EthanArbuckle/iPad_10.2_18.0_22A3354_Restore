@implementation PUAdjustmentsViewFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  double MidX;
  double MidY;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGPoint result;
  CGRect v48;
  CGRect v49;

  y = a3.y;
  x = a3.x;
  v46 = *MEMORY[0x1E0C80C00];
  -[PUAdjustmentsViewFlowLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[PUAdjustmentsViewFlowLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v42;
    v19 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "frame", (_QWORD)v41);
        if (v13 == 1)
        {
          MidX = CGRectGetMidX(*(CGRect *)&v22);
          v48.origin.x = x;
          v48.origin.y = y;
          v48.size.width = v8;
          v48.size.height = v11;
          MidY = CGRectGetMidX(v48);
        }
        else
        {
          MidX = CGRectGetMidY(*(CGRect *)&v22);
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = v8;
          v49.size.height = v11;
          MidY = CGRectGetMidY(v49);
        }
        v28 = fabs(MidX - MidY);
        if (v28 < v19)
        {
          v29 = v21;

          v19 = v28;
          v17 = v29;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v17, "frame");
  v31 = v30;
  v33 = v32;
  -[PUAdjustmentsViewFlowLayout collectionView](self, "collectionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "contentInset");
  v36 = v35;
  v38 = v37;

  if (v13 == 1)
    x = v31 - v38;
  else
    y = v33 - v36;

  v39 = x;
  v40 = y;
  result.y = v40;
  result.x = v39;
  return result;
}

- (id)nearestIndexPathForVisibleItemAtPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  double MidX;
  double MidY;
  double v30;
  uint64_t v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  -[PUAdjustmentsViewFlowLayout collectionView](self, "collectionView", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    v21 = 1.79769313e308;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v23, "frame", (_QWORD)v34);
        if (v16 == 1)
        {
          MidX = CGRectGetMidX(*(CGRect *)&v24);
          v40.origin.x = v6;
          v40.origin.y = v8;
          v40.size.width = v10;
          v40.size.height = v12;
          MidY = CGRectGetMidX(v40);
        }
        else
        {
          MidX = CGRectGetMidY(*(CGRect *)&v24);
          v41.origin.x = v6;
          v41.origin.y = v8;
          v41.size.width = v10;
          v41.size.height = v12;
          MidY = CGRectGetMidY(v41);
        }
        v30 = fabs(MidX - MidY);
        if (v30 < v21)
        {
          objc_msgSend(v23, "indexPath");
          v31 = objc_claimAutoreleasedReturnValue();

          v21 = v30;
          v15 = (void *)v31;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v19);
  }

  v32 = v15;
  return v32;
}

@end
