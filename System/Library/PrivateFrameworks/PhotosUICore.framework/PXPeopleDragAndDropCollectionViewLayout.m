@implementation PXPeopleDragAndDropCollectionViewLayout

- (PXPeopleDragAndDropCollectionViewLayout)init
{
  PXPeopleDragAndDropCollectionViewLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDragAndDropCollectionViewLayout;
  result = -[UICollectionViewFlowLayout init](&v3, sel_init);
  if (result)
  {
    result->_lastDragPoint = (CGPoint)*MEMORY[0x1E0C9D538];
    result->_performActualRearrange = 0;
  }
  return result;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  void *v5;
  void *v6;
  __int128 v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPeopleDragAndDropCollectionViewLayout;
  -[PXPeopleDragAndDropCollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v11, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.8);
  -[PXPeopleDragAndDropCollectionViewLayout targetIndexPathForMerge](self, "targetIndexPathForMerge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v7;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v10, 1.15, 1.15);
  }
  v9 = v10;
  objc_msgSend(v5, "setTransform:", &v9);

  return v5;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDragAndDropCollectionViewLayout;
  v5 = a3;
  -[PXPeopleDragAndDropCollectionViewLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](&v9, sel_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48A8], v9.receiver, v9.super_class);

  if (v7)
  {
    objc_msgSend(v6, "frame");
    objc_msgSend(v6, "setFrame:", v10.origin.x, v10.origin.y - CGRectGetHeight(v10), v10.size.width, v10.size.height);
    objc_msgSend(v6, "setAlpha:", 0.0);
  }
  return v6;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDragAndDropCollectionViewLayout;
  v5 = a3;
  -[PXPeopleDragAndDropCollectionViewLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](&v9, sel_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48A8], v9.receiver, v9.super_class);

  if (v7)
  {
    objc_msgSend(v6, "frame");
    objc_msgSend(v6, "setFrame:", v10.origin.x, v10.origin.y - CGRectGetHeight(v10), v10.size.width, v10.size.height);
    objc_msgSend(v6, "setAlpha:", 0.0);
  }
  return v6;
}

- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  char v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  PXPeopleDragAndDropCollectionViewLayout *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  void *v65;
  void *v66;
  PXPeopleDragAndDropCollectionViewLayout *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;
  CGPoint v81;
  CGPoint v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  y = a4.y;
  x = a4.x;
  v80 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXPeopleDragAndDropCollectionViewLayout collectionView](self, "collectionView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bounds");
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", 0.0, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!-[PXPeopleDragAndDropCollectionViewLayout performActualRearrange](self, "performActualRearrange"))
  {
    -[PXPeopleDragAndDropCollectionViewLayout dragIndexPathForMerge](self, "dragIndexPathForMerge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDragAndDropCollectionViewLayout targetIndexPathForMerge](self, "targetIndexPathForMerge");
    v32 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v32;
    if (v15 && v32)
    {
      v33 = self;
      v34 = v9;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v35 = v8;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v71 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            if (!objc_msgSend(v40, "representedElementCategory"))
            {
              objc_msgSend(v40, "frame");
              v86 = CGRectInset(v85, v85.size.width * 0.2, v85.size.width * 0.2);
              v82.x = x;
              v82.y = y;
              if (CGRectContainsPoint(v86, v82))
              {
                v9 = v34;
                v46 = v34;

                goto LABEL_67;
              }
            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v37);
      }

      self = v33;
      -[PXPeopleDragAndDropCollectionViewLayout mergeDelegate](v33, "mergeDelegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "collectionView:didCancelMergeWithDragIndexPath:targetIndexPath:", v69, v15, v14);

      -[PXPeopleDragAndDropCollectionViewLayout setDragIndexPathForMerge:](self, "setDragIndexPathForMerge:", 0);
      -[PXPeopleDragAndDropCollectionViewLayout setTargetIndexPathForMerge:](self, "setTargetIndexPathForMerge:", 0);
      v9 = v34;
    }
    -[PXPeopleDragAndDropCollectionViewLayout lastDragPoint](self, "lastDragPoint");
    if (sqrt((x - v42) * (x - v42) + (y - v43) * (y - v43)) > 3.0)
    {
      -[PXPeopleDragAndDropCollectionViewLayout setLastDragPoint:](self, "setLastDragPoint:", x, y);
      -[PXPeopleDragAndDropCollectionViewLayout _updateDragPause](self, "_updateDragPause");
    }
    v44 = v9;
    goto LABEL_66;
  }
  v10 = v9;
  v67 = self;
  -[PXPeopleDragAndDropCollectionViewLayout mergeDelegate](self, "mergeDelegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v66 = v8;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (!v12)
  {
    v14 = 0;
    v15 = 0;
    goto LABEL_36;
  }
  v13 = v12;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v75;
  v17 = 1.79769313e308;
  v18 = 1.79769313e308;
  while (2)
  {
    for (j = 0; j != v13; ++j)
    {
      if (*(_QWORD *)v75 != v16)
        objc_enumerationMutation(v11);
      v20 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
      if (!objc_msgSend(v20, "representedElementCategory"))
      {
        objc_msgSend(v20, "center");
        v22 = v21;
        v24 = v23;
        objc_msgSend(v20, "frame");
        v84 = CGRectInset(v83, v83.size.width * 0.2, v83.size.width * 0.2);
        v81.x = x;
        v81.y = y;
        if (CGRectContainsPoint(v84, v81))
        {
          objc_msgSend(v20, "indexPath");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v68, "collectionView:shouldMergeDragIndexPath:targetIndexPath:", v69, v10, v25);

          if ((v26 & 1) != 0)
          {
            objc_msgSend(v20, "indexPath");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v10;
            -[PXPeopleDragAndDropCollectionViewLayout _potentialMergeWithDragIndexPath:ontoIndexPath:withPosition:](v67, "_potentialMergeWithDragIndexPath:ontoIndexPath:withPosition:", v10, v45, x, y);

            v46 = v10;
            v8 = v66;
            goto LABEL_67;
          }
        }
        v27 = sqrt((v22 - x) * (v22 - x) + (v24 - y) * (v24 - y));
        if (v22 < x && v27 < v18)
        {
          v28 = v15;
          v29 = v17;
          v18 = v27;
          v30 = v14;
          v15 = v20;
LABEL_15:
          v31 = v20;

          v17 = v29;
          v14 = v30;
          continue;
        }
        if (v22 > x)
        {
          v28 = v14;
          v29 = v27;
          v30 = v20;
          if (v27 < v17)
            goto LABEL_15;
        }
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v13)
      continue;
    break;
  }
LABEL_36:

  objc_msgSend(v15, "indexPath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPath");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (!v15 && v14)
  {
    v44 = v48;
    v9 = v10;
    v50 = v10;
    goto LABEL_63;
  }
  v9 = v10;
  self = v67;
  if (!v15 || v14)
  {
    v44 = v10;
    v8 = v66;
    if (!v15)
      goto LABEL_65;
    v44 = v10;
    if (!v14)
      goto LABEL_65;
    if (objc_msgSend(v10, "compare:", v47) == -1
      && (v54 = objc_msgSend(v47, "section"), v54 == objc_msgSend(v10, "section")))
    {
      v55 = v47;
    }
    else
    {
      if (objc_msgSend(v49, "compare:", v10) != -1
        || (v56 = objc_msgSend(v49, "section"), v56 != objc_msgSend(v10, "section")))
      {
        v57 = objc_msgSend(v49, "section");
        v44 = v10;
        if (v57 == objc_msgSend(v10, "section"))
          goto LABEL_65;
      }
      v55 = v49;
    }
    v44 = v55;
    v50 = v10;
    goto LABEL_64;
  }
  v65 = v48;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v47, "item") + 1, objc_msgSend(v47, "section"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionViewLayout collectionView](v67, "collectionView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "cellForItemAtIndexPath:", v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](v67, "layoutAttributesForItemAtIndexPath:", v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = 0;
  }
  v58 = objc_msgSend(v47, "section");
  v59 = objc_msgSend(v10, "section");
  v49 = v65;
  if (!v52 || v58 == v59)
  {
    if (!v52)
    {
      v62 = v50;
      if (v58 != v59)
        goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(v53, "center");
    v61 = v60;
    objc_msgSend(v15, "center");
    v62 = v50;
    if (v61 == v63)
      goto LABEL_62;
  }
  v62 = v47;
LABEL_62:
  v44 = v62;

LABEL_63:
  self = v67;
LABEL_64:

  v8 = v66;
LABEL_65:
  -[PXPeopleDragAndDropCollectionViewLayout setLastDragPoint:](self, "setLastDragPoint:", x, y);

LABEL_66:
  -[PXPeopleDragAndDropCollectionViewLayout setCurrentPosition:](self, "setCurrentPosition:", x, y);
  v46 = v44;
LABEL_67:

  return v46;
}

- (BOOL)performMergeIfPossible
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[PXPeopleDragAndDropCollectionViewLayout dragIndexPathForMerge](self, "dragIndexPathForMerge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionViewLayout targetIndexPathForMerge](self, "targetIndexPathForMerge");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!v6)
  {
    -[PXPeopleDragAndDropCollectionViewLayout mergeDelegate](self, "mergeDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDragAndDropCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didMergeDragIndexPath:targetIndexPath:", v9, v3, v5);

  }
  -[PXPeopleDragAndDropCollectionViewLayout setDragIndexPathForMerge:](self, "setDragIndexPathForMerge:", 0);
  -[PXPeopleDragAndDropCollectionViewLayout setTargetIndexPathForMerge:](self, "setTargetIndexPathForMerge:", 0);

  return v7;
}

- (PXPeopleDragAndDropCollectionViewDelegateLayout)mergeDelegate
{
  void *v2;
  void *v3;

  -[PXPeopleDragAndDropCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPeopleDragAndDropCollectionViewDelegateLayout *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPeopleDragAndDropCollectionViewLayout _cancelDragPauseTimer](self, "_cancelDragPauseTimer");
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDragAndDropCollectionViewLayout;
  -[PXPeopleDragAndDropCollectionViewLayout dealloc](&v3, sel_dealloc);
}

- (void)_potentialMergeWithDragIndexPath:(id)a3 ontoIndexPath:(id)a4 withPosition:(CGPoint)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12
    && v7
    && (objc_msgSend(v12, "isEqual:", v7) & 1) == 0
    && (-[PXPeopleDragAndDropCollectionViewLayout targetIndexPathForMerge](self, "targetIndexPathForMerge"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", v7),
        v8,
        (v9 & 1) == 0))
  {
    -[PXPeopleDragAndDropCollectionViewLayout setDragIndexPathForMerge:](self, "setDragIndexPathForMerge:", v12);
    -[PXPeopleDragAndDropCollectionViewLayout setTargetIndexPathForMerge:](self, "setTargetIndexPathForMerge:", v7);
    -[PXPeopleDragAndDropCollectionViewLayout mergeDelegate](self, "mergeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDragAndDropCollectionViewLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:didBeginMergeWithDragIndexPath:targetIndexPath:", v11, v12, v7);

  }
  else
  {
    -[PXPeopleDragAndDropCollectionViewLayout _cancelDragPauseTimer](self, "_cancelDragPauseTimer");
  }

}

- (void)_updateDragPause
{
  void *v3;
  _QWORD v4[5];

  -[PXPeopleDragAndDropCollectionViewLayout _cancelDragPauseTimer](self, "_cancelDragPauseTimer");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PXPeopleDragAndDropCollectionViewLayout__updateDragPause__block_invoke;
  v4[3] = &unk_1E5123118;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 0.04);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionViewLayout setDragPauseTimer:](self, "setDragPauseTimer:", v3);

}

- (void)_cancelDragPauseTimer
{
  void *v3;
  id v4;

  -[PXPeopleDragAndDropCollectionViewLayout dragPauseTimer](self, "dragPauseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");
    -[PXPeopleDragAndDropCollectionViewLayout setDragPauseTimer:](self, "setDragPauseTimer:", 0);
    v3 = v4;
  }

}

- (NSTimer)dragPauseTimer
{
  return self->_dragPauseTimer;
}

- (void)setDragPauseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dragPauseTimer, a3);
}

- (CGPoint)lastDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastDragPoint.x;
  y = self->_lastDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastDragPoint:(CGPoint)a3
{
  self->_lastDragPoint = a3;
}

- (CGPoint)currentPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPosition.x;
  y = self->_currentPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPosition:(CGPoint)a3
{
  self->_currentPosition = a3;
}

- (BOOL)performActualRearrange
{
  return self->_performActualRearrange;
}

- (void)setPerformActualRearrange:(BOOL)a3
{
  self->_performActualRearrange = a3;
}

- (NSIndexPath)dragIndexPathForMerge
{
  return self->_dragIndexPathForMerge;
}

- (void)setDragIndexPathForMerge:(id)a3
{
  objc_storeStrong((id *)&self->_dragIndexPathForMerge, a3);
}

- (NSIndexPath)targetIndexPathForMerge
{
  return self->_targetIndexPathForMerge;
}

- (void)setTargetIndexPathForMerge:(id)a3
{
  objc_storeStrong((id *)&self->_targetIndexPathForMerge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexPathForMerge, 0);
  objc_storeStrong((id *)&self->_dragIndexPathForMerge, 0);
  objc_storeStrong((id *)&self->_dragPauseTimer, 0);
}

uint64_t __59__PXPeopleDragAndDropCollectionViewLayout__updateDragPause__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPerformActualRearrange:", 1);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentPosition");
  objc_msgSend(v2, "_updateReorderingTargetPosition:forced:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setPerformActualRearrange:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_cancelDragPauseTimer");
}

@end
