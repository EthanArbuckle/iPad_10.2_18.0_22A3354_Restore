@implementation CRLCanvasLayout

- (CRLCanvasLayout)initWithInfo:(id)a3
{
  id v5;
  char *v6;
  char *v7;
  CGSize size;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasLayout;
  v6 = -[CRLCanvasAbstractLayout init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 74), a3);
    v7[154] |= 7u;
    *(int64x2_t *)(v7 + 210) = vdupq_n_s64(0x7FF8000000000000uLL);
    size = CGRectNull.size;
    *(CGPoint *)(v7 + 226) = CGRectNull.origin;
    *(CGSize *)(v7 + 242) = size;
  }

  return (CRLCanvasLayout *)v7;
}

- (CRLCanvasLayoutGeometry)dynamicGeometry
{
  void *v2;

  if (*(_QWORD *)((char *)&self->mInvalidFlags + 2))
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  else
    v2 = 0;
  return (CRLCanvasLayoutGeometry *)v2;
}

- (void)setDynamicGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!*(_QWORD *)((char *)&self->mInvalidFlags + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124ACD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E161C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124ACF8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout setDynamicGeometry:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 141, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");

  }
  -[CRLCanvasAbstractLayout setGeometry:](self, "setGeometry:", v4);
  -[CRLCanvasLayout invalidate](self, "invalidate");

}

- (CGRect)frameForCulling
{
  double *v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD v9[3];
  CGRect v10;
  CGRect result;

  v3 = (double *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v10.origin.x = *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v10.origin.y = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.x + 2);
  v10.size.width = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.y + 2);
  v10.size.height = *(CGFloat *)((char *)&self->mCachedFrameForCulling.size.width + 2);
  if (CGRectIsNull(v10))
  {
    v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v4;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[CRLCanvasLayout p_frameForCullingWithAdditionalTransform:](self, "p_frameForCullingWithAdditionalTransform:", v9);
    *v3 = v5;
    v3[1] = v6;
    v3[2] = v7;
    v3[3] = v8;
  }
  else
  {
    v5 = *v3;
    v6 = v3[1];
    v7 = v3[2];
    v8 = v3[3];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  CGAffineTransform v5;
  CGRect v6;

  -[CRLCanvasAbstractLayout frame](self, "frame");
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v5.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)&a3->tx;
  return CGRectApplyAffineTransform(v6, &v5);
}

- (CGRect)p_frameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGRect result;

  v5 = *(_OWORD *)&a3->c;
  v11 = *(_OWORD *)&a3->a;
  v12 = v5;
  v13 = *(_OWORD *)&a3->tx;
  -[CRLCanvasLayout baseFrameForFrameForCullingWithAdditionalTransform:](self, "baseFrameForFrameForCullingWithAdditionalTransform:", &v11);
  v6 = *(_OWORD *)&a3->c;
  v11 = *(_OWORD *)&a3->a;
  v12 = v6;
  v13 = *(_OWORD *)&a3->tx;
  -[CRLCanvasLayout frameForCullingWithBaseFrame:additionalTransform:](self, "frameForCullingWithBaseFrame:additionalTransform:", &v11);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v30, 0, sizeof(v30));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v30, 0, sizeof(v30));

  t1 = v30;
  memset(&v29, 0, sizeof(v29));
  v12 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v12;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformConcat(&v29, &t1, &t2);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "shouldBeIncludedInParentFrameForCulling"))
        {
          t1 = v29;
          objc_msgSend(v18, "p_frameForCullingWithAdditionalTransform:", &t1);
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)shouldValidate
{
  return 1;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if ((BYTE6(self->mDirtyRect.size.height) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    objc_msgSend(v3, "invalidateLayout:", self);

    BYTE6(self->mDirtyRect.size.height) = BYTE6(self->mDirtyRect.size.height) & 0xFE | (-[CRLCanvasLayout layoutState](self, "layoutState") != 0);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout dependentLayouts](self, "dependentLayouts", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "invalidate");
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[CRLCanvasLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");
    -[CRLCanvasLayout invalidateFrameForCulling](self, "invalidateFrameForCulling");
  }
}

- (void)i_recursivelyClearInvalidationCache
{
  id v4;

  -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", a2);

}

- (void)i_clearInvalidationCache
{
  BYTE6(self->mDirtyRect.size.height) &= 0xFCu;
}

- (void)invalidatePosition
{
  *(&self->mInvalidatingSize + 2) |= 1u;
  -[CRLCanvasLayout invalidateCacheForMagnets](self, "invalidateCacheForMagnets");
  -[CRLCanvasLayout invalidate](self, "invalidate");
}

- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3
{
  return 0;
}

- (void)invalidateSize
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  if ((BYTE6(self->mDirtyRect.size.height) & 2) == 0 && !BYTE2(self->mDirtyRect.size.height))
  {
    BYTE2(self->mDirtyRect.size.height) = 1;
    *(&self->mInvalidatingSize + 2) |= 2u;
    BYTE6(self->mDirtyRect.size.height) = BYTE6(self->mDirtyRect.size.height) & 0xFD | (2
                                                                                      * (-[CRLCanvasLayout layoutState](self, "layoutState") != 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout dependentLayouts](self, "dependentLayouts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout bidirectionalSizeDependentLayouts](self, "bidirectionalSizeDependentLayouts"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:", self))
            objc_msgSend(v10, "invalidateSize");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), "invalidateSize", (_QWORD)v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

    -[CRLCanvasLayout invalidateCacheForMagnets](self, "invalidateCacheForMagnets");
    -[CRLCanvasLayout invalidate](self, "invalidate");
    BYTE2(self->mDirtyRect.size.height) = 0;

  }
}

- (void)invalidateFrame
{
  -[CRLCanvasLayout invalidateSize](self, "invalidateSize");
  -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
}

- (void)invalidateCacheForMagnets
{
  void *v2;

  *(&self->mInvalidatingSize + 2) |= 4u;
  v2 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  *(CGFloat *)((char *)&self->mCardinalWestPosition.y + 2) = 0.0;

}

- (void)invalidateFrameForCulling
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  CGSize size;
  void *v11;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v8 = v11;
  if (v11)
  {
    v9 = objc_msgSend(v11, "layoutHasValidFrameForCulling");
    v8 = v11;
    if (v9)
    {
      objc_msgSend(v11, "invalidateFrameForCulling");
      v8 = v11;
    }
  }
  size = CGRectNull.size;
  *(CGPoint *)((char *)&self->mMaximumInlineFrameSize.height + 2) = CGRectNull.origin;
  *(CGSize *)((char *)&self->mCachedFrameForCulling.origin.y + 2) = size;

}

- (BOOL)layoutHasValidFrameForCulling
{
  CGRect v3;

  v3.origin.x = *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.height + 2);
  v3.origin.y = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.x + 2);
  v3.size.width = *(CGFloat *)((char *)&self->mCachedFrameForCulling.origin.y + 2);
  v3.size.height = *(CGFloat *)((char *)&self->mCachedFrameForCulling.size.width + 2);
  return !CGRectIsNull(v3);
}

- (void)invalidatePositionWithoutSideEffects
{
  *(&self->mInvalidatingSize + 2) |= 1u;
}

- (void)invalidateSizeWithoutSideEffects
{
  *(&self->mInvalidatingSize + 2) |= 2u;
}

- (BOOL)childLayoutIsCurrentlyHiddenWhileManipulating:(id)a3
{
  return 0;
}

- (void)invalidateExteriorWrap
{
  -[CRLCanvasLayout p_invalidateDescendentWrapPaths](self, "p_invalidateDescendentWrapPaths");
}

- (void)invalidateChildren
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  objc_msgSend(v3, "invalidateChildrenOfLayout:", self);

}

- (id)childInfosForChildLayouts
{
  return &__NSArray0__struct;
}

- (void)updateChildrenFromInfo
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout childInfosForChildLayouts](self, "childInfosForChildLayouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v5 = objc_msgSend(v3, "count");
  v25 = v4;
  if (v5 == objc_msgSend(v4, "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", (char *)i + v9));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info"));

          if (v14 != v12)
          {

            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v9 += (uint64_t)i;
        if (v8)
          continue;
        break;
      }
    }
  }
  else
  {
LABEL_12:
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v3;
    v16 = v3;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
          v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutForInfo:childOfLayout:", v21, self, v24));
          if (!v22)
          {
            v22 = objc_msgSend(objc_alloc(+[CRLCanvasLayoutController effectiveLayoutClassForInfo:](CRLCanvasLayoutController, "effectiveLayoutClassForInfo:", v21)), "initWithInfo:", v21);
            if (!v22)
              continue;
          }
          objc_msgSend(v6, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    -[CRLCanvasAbstractLayout setChildren:](self, "setChildren:", v6);
    -[CRLCanvasLayout invalidate](self, "invalidate");
    -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");

    v3 = v24;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v23, "makeObjectsPerformSelector:", "updateChildrenFromInfo");

}

- (void)unregisterFromLayoutController
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    -[CRLCanvasLayout p_unregisterWithLayoutController:](self, "p_unregisterWithLayoutController:", v4);

  }
}

- (void)setParent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  if (v5 != v4)
  {
    -[CRLCanvasLayout parentWillChangeTo:](self, "parentWillChangeTo:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout root](self, "root"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "root"));
    if (v6 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      if (v8)
        -[CRLCanvasLayout p_unregisterWithLayoutController:](self, "p_unregisterWithLayoutController:", v8);

    }
    v14.receiver = self;
    v14.super_class = (Class)CRLCanvasLayout;
    -[CRLCanvasAbstractLayout setParent:](&v14, "setParent:", v4);
    objc_opt_class(CRLCanvasLayout, v9);
    v11 = sub_100221D0C(v10, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v12, "i_clearInvalidationCache");

    if (v6 != v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      if (v13)
      {
        -[CRLCanvasLayout p_registerWithLayoutController:](self, "p_registerWithLayoutController:", v13);
        -[CRLCanvasLayout p_recursiveInvalidate](self, "p_recursiveInvalidate");
        -[CRLCanvasLayout i_recursivelyClearInvalidationCache](self, "i_recursivelyClearInvalidationCache");
      }

    }
    -[CRLCanvasLayout parentDidChange](self, "parentDidChange");
    if (v7)
      -[CRLCanvasLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");

  }
}

- (BOOL)parentAutosizes
{
  return 0;
}

- (id)rootLayout
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasRootLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout root](self, "root", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)layoutController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout rootLayout](self, "rootLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutController"));

  return v3;
}

- (BOOL)invalidGeometry
{
  return (*(&self->mInvalidatingSize + 2) & 3) != 0;
}

- (BOOL)isPositionInvalid
{
  return *(&self->mInvalidatingSize + 2);
}

- (void)validate
{
  void *v3;

  if (-[CRLCanvasLayout invalidGeometry](self, "invalidGeometry"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout computeLayoutGeometry](self, "computeLayoutGeometry"));
    -[CRLCanvasAbstractLayout setGeometry:](self, "setGeometry:", v3);

    *(&self->mInvalidatingSize + 2) &= 0xFCu;
  }
  -[CRLCanvasLayout invalidateFrameForCulling](self, "invalidateFrameForCulling");
  -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");
}

- (id)layoutGeometryFromInfo
{
  void *v3;
  void *v4;
  void *v5;
  CRLCanvasLayoutGeometry *v6;
  void *v7;
  void *v8;
  CRLCanvasLayoutGeometry *v9;

  if (!*(_QWORD *)(&self->super._lastInterimPositionYSet + 1))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AD18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16250();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AD38);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout layoutGeometryFromInfo]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 468, 0, "Layouts must either override computeLayoutGeometry, or have a non-nil info to query for geometry");

  }
  v6 = [CRLCanvasLayoutGeometry alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  v9 = -[CRLCanvasLayoutGeometry initWithInfoGeometry:](v6, "initWithInfoGeometry:", v8);

  return v9;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  _OWORD v4[3];

  if (a3)
    objc_msgSend(a3, "fullTransform");
  else
    memset(v4, 0, sizeof(v4));
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v4));
}

- (Class)repClassOverride
{
  return (Class)objc_msgSend(*(id *)(&self->super._lastInterimPositionYSet + 1), "repClass");
}

- (BOOL)isInGroup
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;

  v2 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v2)
  {
    v4 = (void *)v2;
    do
    {
      objc_opt_class(CRLGroupLayout, v3);
      isKindOfClass = objc_opt_isKindOfClass(v4, v5);
      if ((isKindOfClass & 1) != 0)
        break;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));

      v4 = (void *)v7;
    }
    while (v7);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)isInTopLevelContainerForEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v9).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificSelectionOfClass:", v11, v10));

  if (v12)
  {
    *(_QWORD *)&v14 = objc_opt_class(CRLGroupLayout, v13).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boardItems", v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anyObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutForInfo:", v18));
    v20 = sub_100221D0C(v16, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (v3)
      goto LABEL_3;
    goto LABEL_6;
  }
  v21 = 0;
  if (!v3)
  {
LABEL_6:
    v28 = 1;
    goto LABEL_12;
  }
  while (1)
  {
LABEL_3:
    objc_opt_class(CRLGroupLayout, v13);
    v23 = sub_100221D0C(v22, v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v24)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "info"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "info"));
      v28 = v29 == v30;

      goto LABEL_11;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "root"));

    if (v26 == v3)
      break;
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parent"));

    v3 = (void *)v27;
    if (!v27)
      goto LABEL_6;
  }
  v28 = v21 == 0;
LABEL_11:

LABEL_12:
  return v28;
}

- (CRLStroke)stroke
{
  return 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return 0;
}

- (CGPoint)alignmentFrameOriginForFixingInterimPosition
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  if (*(_DWORD *)((char *)&self->mInfo + 2) == 2)
  {
    v2 = *(double *)((char *)&self->mFreeTransformState + 2);
    v3 = *(double *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.x + 2);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLCanvasLayout;
    -[CRLCanvasAbstractLayout alignmentFrameOriginForFixingInterimPosition](&v4, "alignmentFrameOriginForFixingInterimPosition");
  }
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasLayoutGeometry *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  if (*(_DWORD *)((char *)&self->mInfo + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AD58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E163E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AD78);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 572, 0, "Should not begin a dynamic operation while already in one.");

  }
  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  *(CRLCanvasLayoutGeometry **)((char *)&self->mBaseGeometry + 2) = v7;
  *(_QWORD *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2) = v8;
  *(_QWORD *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2) = v9;
  *(_QWORD *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2) = v10;
  if (*(_QWORD *)((char *)&self->mInvalidFlags + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AD98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1635C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124ADB8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 576, 0, "expected nil value for '%{public}s'", "mBaseGeometry");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v15 = objc_msgSend(v14, "copy");
  v16 = *(void **)((char *)&self->mInvalidFlags + 2);
  *(_QWORD *)((char *)&self->mInvalidFlags + 2) = v15;

  if (*(_QWORD *)(&self->mIsInRealTimeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124ADD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E162D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124ADF8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 579, 0, "expected nil value for '%{public}s'", "mInfoGeometryBeforeDynamicOperation");

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometry"));
  v22 = objc_msgSend(v21, "copy");
  v23 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  *(_QWORD *)(&self->mIsInRealTimeDynamicOperation + 2) = v22;

  *(_DWORD *)((char *)&self->mInfo + 2) = 1;
  BYTE2(self->mConvexHullPath) = a3;
}

- (void)endDynamicOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)((char *)&self->mInvalidFlags + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AE18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E164F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AE38);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout endDynamicOperation]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 587, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");

    v3 = *(void **)((char *)&self->mInvalidFlags + 2);
  }
  *(_QWORD *)((char *)&self->mInvalidFlags + 2) = 0;

  v7 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AE58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16468();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124AE78);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout endDynamicOperation]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 590, 0, "invalid nil value for '%{public}s'", "mInfoGeometryBeforeDynamicOperation");

    v7 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
  }
  *(_QWORD *)(&self->mIsInRealTimeDynamicOperation + 2) = 0;

  *(_DWORD *)((char *)&self->mInfo + 2) = 0;
  BYTE2(self->mConvexHullPath) = 0;
  -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");
}

- (BOOL)isBeingTransformed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  CRLCanvasLayout *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dynamicOperationController", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentlyTransformingReps"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1)
                                                                                      + 8 * (_QWORD)i), "layout"));

        if (v12 == self)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)beginDrag
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (unint64_t *)((char *)&self->mFreeTransformState + 2);
  -[CRLCanvasLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition");
  *v3 = v4;
  v3[1] = v5;
  *(_DWORD *)((char *)&self->mInfo + 2) = 2;
}

- (void)dragByUnscaled:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "transformInRoot");
    else
      memset(&v10, 0, sizeof(v10));
    CGAffineTransformInvert(&v11, &v10);
    x = sub_10006214C((float64x2_t *)&v11, x, y);
    y = v9;

  }
  -[CRLCanvasLayout dragBy:](self, "dragBy:", x, y, *(_OWORD *)&v10.a, *(_OWORD *)&v10.c, *(_OWORD *)&v10.tx);
}

- (void)dragBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v32;
  _BYTE v33[128];

  y = a3.y;
  x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvas"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForLayout:", self));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
      CGAffineTransformMakeTranslation(&v32, x, y);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryByAppendingTransform:", &v32));
      v15 = objc_msgSend(v11, "newCommandToApplyGeometry:toInfo:", v14, v12);
      objc_msgSend(v10, "enqueueCommand:", v15);

    }
    if (!*(_QWORD *)((char *)&self->mInvalidFlags + 2))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AE98);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E16580();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AEB8);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout dragBy:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 648, 0, "invalid nil value for '%{public}s'", "mBaseGeometry");

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometryByTranslatingBy:", x, y));

    -[CRLCanvasLayout setDynamicGeometry:](self, "setDynamicGeometry:", v20);
    -[CRLCanvasLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvas"));
    objc_msgSend(v22, "canvasInvalidatedForLayout:", self);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout dependentLayoutsForDrag](self, "dependentLayoutsForDrag"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "invalidateFrame");
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v25);
    }

  }
}

- (CGAffineTransform)originalTransformInRoot
{
  __int128 v4;
  CGAffineTransform *result;
  uint64_t v6;
  CGAffineTransform *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = self;
  if (result)
  {
    v7 = result;
    do
    {
      objc_opt_class(CRLCanvasLayout, v6);
      v9 = sub_100221D0C(v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originalGeometry"));

      if (v11)
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originalGeometry"));
      else
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CGAffineTransform geometry](v7, "geometry"));
      v13 = v12;
      if (v12)
      {
        v14 = *(_OWORD *)&retstr->c;
        v17[0] = *(_OWORD *)&retstr->a;
        v17[1] = v14;
        v17[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v12, "transformByConcatenatingTransformTo:", v17);
      }
      else
      {
        v19 = 0u;
        v20 = 0u;
        v18 = 0u;
      }
      v15 = v19;
      *(_OWORD *)&retstr->a = v18;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tx = v20;

      v16 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parent](v7, "parent"));
      v7 = (CGAffineTransform *)v16;
    }
    while (v16);
  }
  return result;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v7 = *(id *)(&self->mIsInRealTimeDynamicOperation + 2);
  if (!objc_msgSend(v7, "heightValid")
    || !objc_msgSend(v7, "widthValid")
    || (objc_msgSend(v7, "size"), v8 == 0.0)
    || fabs(v8) < 0.00000001
    || (objc_msgSend(v7, "size"), v9 == 0.0)
    || fabs(v9) < 0.00000001)
  {
    v12 = *(_OWORD *)&a4->c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "fullTransform");
    else
      memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v21, &v20);

    memset(&v19, 0, sizeof(v19));
    if (v7)
      objc_msgSend(v7, "fullTransform");
    else
      memset(&t2, 0, sizeof(t2));
    t1 = v21;
    CGAffineTransformConcat(&v19, &t1, &t2);
    t1 = v19;
    CGAffineTransformInvert(&v15, &t1);
    v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v16, &v15, &t1);
    t1 = v19;
    CGAffineTransformConcat(retstr, &v16, &t1);
  }

  return result;
}

- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation
{
  return 0;
}

- (void)beginRotate
{
  *(_DWORD *)((char *)&self->mInfo + 2) = 3;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", self));
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    if (v4)
      objc_msgSend(v4, "rotateTransform");
    v10 = *(void **)(&self->mIsInRealTimeDynamicOperation + 2);
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometryByAppendingTransform:", v14));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v13 = objc_msgSend(v9, "newCommandToApplyGeometry:toInfo:", v11, v12);

    objc_msgSend(v8, "enqueueCommand:", v13);
  }

}

- (BOOL)i_anyAncestorCurrentlyBeingRotatedWantsNormalLayoutDuringDynamicRotation
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    while (1)
    {
      if (objc_msgSend(v8, "layoutState") != 3)
      {
        LOBYTE(v15) = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v8, "wantsNormalLayoutDuringDynamicRotation") & 1) != 0)
        break;
      *(_QWORD *)&v10 = objc_opt_class(CRLCanvasLayout, v9).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent", v10));
      v14 = sub_100221D0C(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);

      v8 = (void *)v15;
      if (!v15)
        goto LABEL_9;
    }
    LOBYTE(v15) = 1;
LABEL_9:

  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (BOOL)resizeMayChangeAspectRatio
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = objc_msgSend(v8, "aspectRatioLocked") ^ 1;
  else
    LOBYTE(v9) = 1;

  return v9;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(v6) = objc_msgSend(v8, "canAspectRatioLockBeChangedByUser");
  return (char)v6;
}

- (id)commandForSettingAspectRatioLocked:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _TtC8Freeform30CRLCommandSetAspectRatioLocked *v11;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[CRLCommandSetAspectRatioLocked initWithBoardItem:aspectRatioLocked:]([_TtC8Freeform30CRLCommandSetAspectRatioLocked alloc], "initWithBoardItem:aspectRatioLocked:", v10, v3);
  return v11;
}

- (void)beginResize
{
  *(_DWORD *)((char *)&self->mInfo + 2) = 4;
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _OWORD v14[3];
  _BYTE v15[48];

  v4 = a3;
  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
    v11 = objc_msgSend(v10, "copy");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v13 = objc_msgSend(v9, "newCommandToApplyGeometry:toInfo:", v11, v12);

    objc_msgSend(v8, "enqueueCommand:", v13);
  }
  if (v4)
    objc_msgSend(v4, "transformForLayout:", self);
  else
    memset(v14, 0, sizeof(v14));
  -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v14);
  -[CRLCanvasLayout resizeWithTransform:](self, "resizeWithTransform:", v15);

}

- (BOOL)wantsParentResizeTransform
{
  return 0;
}

- (BOOL)isDynamicallyChangingAvailableSpaceForContainedChild
{
  return -[CRLCanvasLayout layoutState](self, "layoutState") == 4
      || -[CRLCanvasLayout layoutState](self, "layoutState") == 5;
}

- (CRLCanvasInfoGeometry)finalInfoGeometryForResize
{
  return 0;
}

- (void)beginFreeTransformWithTracker:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  *(_DWORD *)((char *)&self->mInfo + 2) = 5;
  v4 = a3;
  v5 = objc_msgSend(v4, "isDragging");
  v6 = objc_msgSend(v4, "isRotating");
  v7 = 2;
  if (!v6)
    v7 = 0;
  v8 = v7 | v5;
  if (objc_msgSend(v4, "isResizing"))
    v9 = 4;
  else
    v9 = 0;
  v10 = objc_msgSend(v4, "inRotateResizeMode");

  v11 = 8;
  if (!v10)
    v11 = 0;
  *(_QWORD *)((char *)&self->mLayoutState + 2) = v8 | v9 | v11;
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _OWORD v21[3];
  _BYTE v22[48];

  v4 = a3;
  v5 = objc_msgSend(v4, "isDragging");
  v6 = objc_msgSend(v4, "isRotating");
  v7 = 2;
  if (!v6)
    v7 = 0;
  v8 = v7 | v5;
  if (objc_msgSend(v4, "isResizing"))
    v9 = 4;
  else
    v9 = 0;
  v10 = objc_msgSend(v4, "inRotateResizeMode");
  v11 = 8;
  if (!v10)
    v11 = 0;
  *(_QWORD *)((char *)&self->mLayoutState + 2) = v8 | v9 | v11;
  if (-[CRLCanvasLayout isInRealTimeDynamicOperation](self, "isInRealTimeDynamicOperation"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvas"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandController"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "repForLayout:", self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentGeometryForLayout:", self));
    v18 = objc_msgSend(v17, "copy");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v20 = objc_msgSend(v16, "newCommandToApplyGeometry:toInfo:", v18, v19);

    objc_msgSend(v15, "enqueueCommand:", v20);
  }
  if (v4)
    objc_msgSend(v4, "freeTransformForLayout:", self);
  else
    memset(v21, 0, sizeof(v21));
  -[CRLCanvasLayout layoutTransformInInfoSpace:](self, "layoutTransformInInfoSpace:", v21);
  -[CRLCanvasLayout resizeWithTransform:](self, "resizeWithTransform:", v22);

}

- (CRLCanvasInfoGeometry)finalInfoGeometryForFreeTransform
{
  return 0;
}

- (BOOL)wantsNormalLayoutDuringDynamicFreeTransform
{
  return -[CRLCanvasLayout i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform](self, "i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform");
}

- (BOOL)i_anyAncestorCurrentlyBeingFreeTransformedWantsNormalLayoutDuringDynamicFreeTransform
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    while (1)
    {
      if (objc_msgSend(v8, "layoutState") != 5)
      {
        LOBYTE(v15) = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v8, "wantsNormalLayoutDuringDynamicFreeTransform") & 1) != 0)
        break;
      *(_QWORD *)&v10 = objc_opt_class(CRLCanvasLayout, v9).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent", v10));
      v14 = sub_100221D0C(v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);

      v8 = (void *)v15;
      if (!v15)
        goto LABEL_9;
    }
    LOBYTE(v15) = 1;
LABEL_9:

  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (BOOL)isBeingManipulated
{
  return *(_DWORD *)((char *)&self->mInfo + 2) != 0;
}

- (CRLCanvasLayoutGeometry)originalPureGeometry
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CRLCanvasLayoutGeometry *v13;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;

  -[CRLCanvasLayout initialBoundsForStandardKnobs](self, "initialBoundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v18, 0, sizeof(v18));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v18, 0, sizeof(v18));

  CGAffineTransformMakeTranslation(&t1, v4, v6);
  v15 = v18;
  CGAffineTransformConcat(&v17, &t1, &v15);
  v18 = v17;
  v13 = [CRLCanvasLayoutGeometry alloc];
  v17 = v18;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v17, v8, v10);
}

- (CRLCanvasLayoutGeometry)pureGeometry
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CRLCanvasLayoutGeometry *v13;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;

  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v18, 0, sizeof(v18));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v18, 0, sizeof(v18));

  CGAffineTransformMakeTranslation(&t1, v4, v6);
  v15 = v18;
  CGAffineTransformConcat(&v17, &t1, &v15);
  v18 = v17;
  v13 = [CRLCanvasLayoutGeometry alloc];
  v17 = v18;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v17, v8, v10);
}

- (CRLCanvasLayoutGeometry)pureGeometryInRoot
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot:](self, "geometryInRoot:", v3));

  return (CRLCanvasLayoutGeometry *)v4;
}

- (CRLCanvasLayoutGeometry)pureGeometryInParent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(v9, 0, sizeof(v9));
  objc_msgSend(v4, "transformBy:", v9);

  return (CRLCanvasLayoutGeometry *)v4;
}

- (CRLCanvasLayoutGeometry)inspectorGeometry
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  id v19;
  uint64_t v20;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  CGRect v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v26 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v27 = v4;
  v28 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v5 = objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if (objc_msgSend(v6, "isRootLayoutForInspectorGeometry"))
        break;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
      v8 = v7;
      if (v7)
      {
        v22[0] = v26;
        v22[1] = v27;
        v22[2] = v28;
        objc_msgSend(v7, "transformByConcatenatingTransformTo:", v22);
      }
      else
      {
        v24 = 0u;
        v25 = 0u;
        v23 = 0u;
      }
      v26 = v23;
      v27 = v24;
      v28 = v25;

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
      v6 = (void *)v9;
    }
    while (v9);

  }
  v23 = v26;
  v24 = v27;
  v25 = v28;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometryByTransformingBy:", &v23));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  v13 = objc_msgSend(v12, "isAnchoredAtRight");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v10, "frame");
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    MinX = CGRectGetMinX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v19 = objc_msgSend(v10, "geometryByTranslatingBy:", -(MinX + CGRectGetMaxX(v30)), 0.0);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    v10 = (void *)v20;
  }
  return (CRLCanvasLayoutGeometry *)v10;
}

- (BOOL)inspectorGeometryIsAffectedByChangeRecord:(id)a3
{
  return 0;
}

- (double)inspectorGeometryAngleInDegrees
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double result;
  _OWORD v9[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout inspectorGeometry](self, "inspectorGeometry"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v9, 0, sizeof(v9));
  v4 = sub_1000791B0(v9);
  sub_1000618C4(-v4);
  v6 = v5;

  v7 = fabs(v6 + -360.0) < 0.00999999978 || v6 == 360.0;
  result = 0.0;
  if (!v7)
    return v6;
  return result;
}

- (BOOL)canInspectGeometry
{
  return 1;
}

- (CGAffineTransform)pureTransformInRoot
{
  void *v5;
  void *v6;
  CGAffineTransform *result;
  CGAffineTransform *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  result = (CGAffineTransform *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (result)
  {
    v8 = result;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CGAffineTransform geometry](v8, "geometry"));
      v10 = v9;
      if (v9)
      {
        v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v9, "transformByConcatenatingTransformTo:", v14);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
        v15 = 0u;
      }
      v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tx = v17;

      v13 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parent](v8, "parent"));
      v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (CGAffineTransform)originalPureTransformInRoot
{
  void *v5;
  void *v6;
  CGAffineTransform *result;
  CGAffineTransform *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  result = (CGAffineTransform *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (result)
  {
    v8 = result;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CGAffineTransform geometry](v8, "geometry"));
      v10 = v9;
      if (v9)
      {
        v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v9, "transformByConcatenatingTransformTo:", v14);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
        v15 = 0u;
      }
      v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tx = v17;

      v13 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parent](v8, "parent"));
      v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (id)commandToFlipWithOrientation:(int)a3
{
  double v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v13;

  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v5));
  v9 = sub_1002223BC(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));
  v12 = objc_msgSend(v11, "mutableCopy");

  if (a3)
    objc_msgSend(v12, "setVerticalFlip:", objc_msgSend(v12, "verticalFlip") ^ 1);
  else
    objc_msgSend(v12, "setHorizontalFlip:", objc_msgSend(v12, "horizontalFlip") ^ 1);
  v13 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v10, v12);

  return v13;
}

- (unint64_t)p_directionForCollaboratorCursorKnobTag:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  _OWORD v15[3];
  _OWORD v16[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(v16, 0, sizeof(v16));
  v7 = sub_1000791B0(v16);

  v8 = sub_1003C65A0(v7 * 1000.0);
  v9 = sub_100260D54(a3, v8 / 1000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(v15, 0, sizeof(v15));
  v12 = sub_100079210((double *)v15);

  if (v12)
    LOBYTE(v9) = sub_100260F40(v9);
  v13 = sub_100260884(v9);
  if ((v13 & 0xFFFFFFFFFFFFFFF1) == 0)
    return 2;
  if ((v13 & 0xFFFFFFFFFFFFFC7FLL) == 0)
    return 1;
  if ((v13 & 0xFFFFFFFFFFFFFF6DLL) != 0)
    return 3;
  return 4;
}

- (id)unscaledPositionsForCollaboratorHUDForSelectionPath:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CRLCollaboratorCursorHUDPosition *v15;
  double v16;
  double v17;
  CRLCollaboratorCursorHUDPosition *v18;
  double v19;
  double v20;
  CRLCollaboratorCursorHUDPosition *v21;
  double v22;
  double v23;
  CRLCollaboratorCursorHUDPosition *v24;
  Block_layout *v25;
  id v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36[6];
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;

  -[CRLCanvasLayout boundsForCollaboratorHUDForSelectionPath:](self, "boundsForCollaboratorHUDForSelectionPath:", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = sub_100260E54(2, v5, v7, v9, v11);
  v28 = v14;
  v32 = v13;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v15 = -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:]([CRLCollaboratorCursorHUDPosition alloc], "initWithPosition:direction:", -[CRLCanvasLayout p_directionForCollaboratorCursorKnobTag:](self, "p_directionForCollaboratorCursorKnobTag:", 2), vaddq_f64(v48, vmlaq_n_f64(vmulq_n_f64(v47, v28), v46, v32)));
  objc_msgSend(v12, "addObject:", v15);

  v16 = sub_100260E54(4, v5, v7, v9, v11);
  v29 = v17;
  v33 = v16;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v18 = -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:]([CRLCollaboratorCursorHUDPosition alloc], "initWithPosition:direction:", -[CRLCanvasLayout p_directionForCollaboratorCursorKnobTag:](self, "p_directionForCollaboratorCursorKnobTag:", 4), vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v29), v43, v33)));
  objc_msgSend(v12, "addObject:", v18);

  v19 = sub_100260E54(6, v5, v7, v9, v11);
  v30 = v20;
  v34 = v19;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v21 = -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:]([CRLCollaboratorCursorHUDPosition alloc], "initWithPosition:direction:", -[CRLCanvasLayout p_directionForCollaboratorCursorKnobTag:](self, "p_directionForCollaboratorCursorKnobTag:", 6), vaddq_f64(v42, vmlaq_n_f64(vmulq_n_f64(v41, v30), v40, v34)));
  objc_msgSend(v12, "addObject:", v21);

  v22 = sub_100260E54(8, v5, v7, v9, v11);
  v31 = v23;
  v35 = v22;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v24 = -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:]([CRLCollaboratorCursorHUDPosition alloc], "initWithPosition:direction:", -[CRLCanvasLayout p_directionForCollaboratorCursorKnobTag:](self, "p_directionForCollaboratorCursorKnobTag:", 8), vaddq_f64(v39, vmlaq_n_f64(vmulq_n_f64(v38, v31), v37, v35)));
  objc_msgSend(v12, "addObject:", v24);

  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  if (sub_100079384(v36))
    v25 = &stru_10124AEF8;
  else
    v25 = &stru_10124AF18;
  objc_msgSend(v12, "sortUsingComparator:", v25);
  v26 = objc_msgSend(v12, "copy");

  return v26;
}

- (id)newCommandToMoveByOffset:(CGPoint)a3 whenDistributingLayoutsByOffsets:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v16;
  CGAffineTransform v18;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v7));
  v11 = sub_100221D0C(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
  CGAffineTransformMakeTranslation(&v18, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geometryByAppendingTransform:", &v18));

  v16 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v12, v15);
  return v16;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  id v25;
  _OWORD v26[3];
  _QWORD v27[4];
  id v28;

  v5 = a5;
  v8 = a3;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));

    objc_opt_class(_TtC8Freeform12CRLBoardItem, v13);
    v15 = sub_100221D0C(v14, v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v16;
    if (v12)
    {
      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainBoard"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "id"));
        v20 = objc_msgSend(v18, "containsObject:", v19);

        if (v20)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AF38);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1660C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124AF58);
          v21 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayout transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:]"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayout.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1121, 0, "Should not transfer layout geometry to info that's in the document!");

        }
      }
    }

  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10028D704;
  v27[3] = &unk_10124AF80;
  v28 = v8;
  v24 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v24;
  v26[2] = *(_OWORD *)&a4->tx;
  v25 = v8;
  -[CRLCanvasLayout p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:](self, "p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:", v26, v27);

}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  id v4;
  _OWORD v6[3];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10028D83C;
  v12 = sub_10028D84C;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10028D854;
  v7[3] = &unk_10124AFE8;
  v7[4] = self;
  v7[5] = &v8;
  v3 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->tx;
  -[CRLCanvasLayout p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:](self, "p_calculateClampModelValuesWithAdditionalTransform:andPerformBlock:", v6, v7);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)p_calculateClampModelValuesWithAdditionalTransform:(CGAffineTransform *)a3 andPerformBlock:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[3];

  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  v8 = *(_OWORD *)&a3->c;
  v21[0] = *(_OWORD *)&a3->a;
  v21[1] = v8;
  v21[2] = *(_OWORD *)&a3->tx;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometryByTransformingBy:", v21));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout computeInfoGeometryFromPureLayoutGeometry:](self, "computeInfoGeometryFromPureLayoutGeometry:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "normalizedGeometry"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));

  if (objc_msgSend(v13, "widthValid") && (objc_msgSend(v13, "heightValid") & 1) != 0)
  {
    v14 = v11;
  }
  else
  {
    v14 = objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v14, "setWidthValid:", objc_msgSend(v13, "widthValid"));
    objc_msgSend(v14, "setHeightValid:", objc_msgSend(v13, "heightValid"));
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;
    if ((objc_msgSend(v13, "widthValid") & 1) == 0)
    {
      objc_msgSend(v13, "size");
      if (v19 == 0.0)
        v16 = 0.0;
    }
    if ((objc_msgSend(v13, "heightValid") & 1) == 0)
    {
      objc_msgSend(v13, "size");
      if (v20 == 0.0)
        v18 = 0.0;
    }
    objc_msgSend(v14, "setSize:", v16, v18);

  }
  v6[2](v6, v14);

}

- (BOOL)isSelectable
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  if (objc_msgSend(v2, "isSelectable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentInfo"));
    objc_opt_class(_TtC8Freeform12CRLGroupItem, v4);
    v6 = 0;
    if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
      goto LABEL_9;
    do
    {
      v7 = v6;
      v6 = v3;

      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentInfo"));
      objc_opt_class(_TtC8Freeform12CRLGroupItem, v8);
    }
    while ((objc_opt_isKindOfClass(v3, v9) & 1) != 0);
    if (v6
      && ((objc_msgSend(v6, "locked") & 1) != 0 || objc_msgSend(v6, "isEffectivelyEmpty")))
    {
      v10 = 0;
    }
    else
    {
LABEL_9:
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isDraggable
{
  return 0;
}

- (CGRect)boundsForStandardKnobs
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "size");
  v3 = sub_10005FDDC();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)frameForCaptionPositioning
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameForMiniFormatterPositioning
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGRect v12;

  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CRLCanvasAbstractLayout transform](self, "transform");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (CGPoint)centerForRotation
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v6 = sub_100061400(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)centerForConnecting
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  CGPoint result;

  -[CRLCanvasLayout centerForRotation](self, "centerForRotation");
  v12 = v4;
  v13 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
    v7 = v15;
    v8 = v16;
    v9 = v17;
  }
  else
  {
    v9 = 0uLL;
    v7 = 0uLL;
    v8 = 0uLL;
  }
  v14 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, v12), v7, v13));

  v11 = v14.f64[1];
  v10 = v14.f64[0];
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)cardinalNorthPosition
{
  void *v3;
  void *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  CGPoint result;

  -[CRLCanvasLayout p_calculateMagnetPositionsIfNeeded](self, "p_calculateMagnetPositionsIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v5 = v11;
    v6 = v12;
    v7 = v13;
  }
  else
  {
    v7 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalNorthPosition.x + 2)), v5, *(double *)((char *)&self->mCachedFrameForCulling.size.height + 2)));

  v9 = v10.f64[1];
  v8 = v10.f64[0];
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)cardinalEastPosition
{
  void *v3;
  void *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  CGPoint result;

  -[CRLCanvasLayout p_calculateMagnetPositionsIfNeeded](self, "p_calculateMagnetPositionsIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v5 = v11;
    v6 = v12;
    v7 = v13;
  }
  else
  {
    v7 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalEastPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalNorthPosition.y + 2)));

  v9 = v10.f64[1];
  v8 = v10.f64[0];
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)cardinalSouthPosition
{
  void *v3;
  void *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  CGPoint result;

  -[CRLCanvasLayout p_calculateMagnetPositionsIfNeeded](self, "p_calculateMagnetPositionsIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v5 = v11;
    v6 = v12;
    v7 = v13;
  }
  else
  {
    v7 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalSouthPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalEastPosition.y + 2)));

  v9 = v10.f64[1];
  v8 = v10.f64[0];
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)cardinalWestPosition
{
  void *v3;
  void *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  CGPoint result;

  -[CRLCanvasLayout p_calculateMagnetPositionsIfNeeded](self, "p_calculateMagnetPositionsIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v5 = v11;
    v6 = v12;
    v7 = v13;
  }
  else
  {
    v7 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v10 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)((char *)&self->mCardinalWestPosition.x + 2)), v5, *(double *)((char *)&self->mCardinalSouthPosition.y + 2)));

  v9 = v10.f64[1];
  v8 = v10.f64[0];
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)getCardinalPositionFromType:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  switch(a3)
  {
    case 2uLL:
      -[CRLCanvasLayout cardinalNorthPosition](self, "cardinalNorthPosition");
      break;
    case 3uLL:
      -[CRLCanvasLayout cardinalEastPosition](self, "cardinalEastPosition");
      break;
    case 4uLL:
      -[CRLCanvasLayout cardinalSouthPosition](self, "cardinalSouthPosition");
      break;
    case 5uLL:
      -[CRLCanvasLayout cardinalWestPosition](self, "cardinalWestPosition");
      break;
    default:
      -[CRLCanvasLayout centerForConnecting](self, "centerForConnecting");
      break;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)getCardinalPositionWithParentTransformFromType:(unint64_t)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  CGPoint result;

  -[CRLCanvasLayout getCardinalPositionFromType:](self, "getCardinalPositionFromType:", a3);
  v12 = v5;
  v13 = v4;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometryInRoot"));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "transform");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }

  }
  else
  {
    v14 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    v15 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    v16 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  }

  v10 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, v12), v14, v13));
  v11 = v10.f64[1];
  result.x = v10.f64[0];
  result.y = v11;
  return result;
}

- (BOOL)shouldFlipMagnetsDuringResize
{
  return 0;
}

- (id)computeInfoGeometryDuringResize
{
  return 0;
}

- (id)computeLayoutGeometry
{
  CRLCanvasLayoutGeometry *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CRLCanvasLayoutGeometry *v22;
  CRLCanvasLayoutGeometry *v23;
  CRLCanvasLayoutGeometry *v24;
  CRLCanvasLayoutGeometry *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _OWORD v31[3];
  _OWORD v32[3];
  _OWORD v33[3];

  v3 = (CRLCanvasLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo"));
  *(_QWORD *)&v5 = objc_opt_class(CRLCanvasLayout, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10
    && -[CRLCanvasLayout layoutState](self, "layoutState") != 4
    && -[CRLCanvasLayout layoutState](self, "layoutState") != 5)
  {
    if (-[CRLCanvasLayout layoutState](self, "layoutState") == 3
      && !-[CRLCanvasLayout wantsNormalLayoutDuringDynamicRotation](self, "wantsNormalLayoutDuringDynamicRotation"))
    {
      v24 = [CRLCanvasLayoutGeometry alloc];
      v25 = (CRLCanvasLayoutGeometry *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
      -[CRLCanvasLayoutGeometry size](v25, "size");
      v27 = v26;
      v29 = v28;
      if (v3)
        -[CRLCanvasLayoutGeometry transform](v3, "transform");
      else
        memset(v33, 0, sizeof(v33));
      v23 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v24, "initWithSize:transform:", v33, v27, v29);

      v3 = v25;
    }
    else
    {
      -[CRLCanvasLayoutGeometry size](v3, "size");
      v12 = v11;
      v14 = v13;
      if (v3)
        -[CRLCanvasLayoutGeometry transform](v3, "transform");
      else
        memset(v32, 0, sizeof(v32));
      -[CRLCanvasLayout scaleForInlineClampingUnrotatedSize:withTransform:](self, "scaleForInlineClampingUnrotatedSize:withTransform:", v32, v12, v14);
      v16 = v15;
      -[CRLCanvasLayoutGeometry size](v3, "size");
      v19 = sub_1000603DC(v17, v18, v16);
      v21 = v20;
      v22 = [CRLCanvasLayoutGeometry alloc];
      if (v3)
        -[CRLCanvasLayoutGeometry transform](v3, "transform");
      else
        memset(v31, 0, sizeof(v31));
      v23 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v22, "initWithSize:transform:", v31, v19, v21);
    }

    v3 = v23;
  }

  return v3;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withTransform:(CGAffineTransform *)a4
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  __int128 v26;
  double v27;
  _BOOL4 v28;
  BOOL v29;
  double v31;
  double v32;
  double v33;
  _OWORD v36[3];
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;

  *(_QWORD *)&v6 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = 1.0;
  if (v11)
  {
    objc_msgSend(v11, "maximumFrameSizeForChild:", self);
    v15 = v14;
    if (v14 < 1.79769313e308 || v13 < 1.79769313e308)
    {
      v17 = v13;
      v18 = v13 < 1.79769313e308;
      v19 = sub_10005FDDC();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v26 = *(_OWORD *)&a4->c;
      v36[0] = *(_OWORD *)&a4->a;
      v36[1] = v26;
      v36[2] = *(_OWORD *)&a4->tx;
      v27 = sub_1000791EC((double *)v36);
      CGAffineTransformMakeRotation(&v37, v27);
      v38.origin.x = v19;
      v38.origin.y = v21;
      v38.size.width = v23;
      v38.size.height = v25;
      v39 = CGRectApplyAffineTransform(v38, &v37);
      v28 = v39.size.height > v17 && v18;
      v29 = v39.size.width > v15 && v15 < 1.79769313e308;
      if (v29 || v28)
      {
        v31 = v15 / v39.size.width;
        v32 = 1.0;
        if (v39.size.width <= v15)
          v31 = 1.0;
        if (v39.size.height > v17)
          v32 = v17 / v39.size.height;
        v33 = fmin(v31, v32);
        if (v17 < 1.79769313e308)
          v31 = v33;
        if (v15 >= 1.79769313e308)
          v12 = v32;
        else
          v12 = v31;
        if (v39.size.width * v12 > v15 || v39.size.height * v12 > v17)
          v12 = nextafter(v12, 0.0);
      }
    }
  }

  return v12;
}

- (void)processChanges:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10), "details"));
        v12 = v11;
        if (v11)
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10028E84C;
          v22[3] = &unk_101246D10;
          v22[4] = v5;
          objc_msgSend(v11, "enumeratePropertiesUsingBlock:", v22);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CRLCanvasLayout processChangedProperty:](self, "processChangedProperty:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), "unsignedIntegerValue", (_QWORD)v18));
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v15);
  }

}

- (void)processChangedProperty:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
      break;
    case 6uLL:
      -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");
      break;
    case 7uLL:
      -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
      break;
  }
  -[CRLCanvasLayout invalidateFrameForCulling](self, "invalidateFrameForCulling");
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (void)calculateAndSetPointsToSearchReference:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLCanvasLayout calculatePointFromSearchReference:](self, "calculatePointFromSearchReference:", v4);
  objc_msgSend(v4, "setSearchReferencePoint:");

}

- (NSArray)dependentLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalDependenciesForChildLayout:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__NSArray0__struct, "arrayByAddingObjectsFromArray:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasController"));

  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v10));
  v14 = sub_100221D0C(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v8 && v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "additionalDependentLayoutsForBoardItem:", v15));
    v17 = v16;
    if (v16 && objc_msgSend(v16, "count"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v18));

      v5 = (void *)v19;
    }

  }
  return (NSArray *)v5;
}

- (NSArray)bidirectionalSizeDependentLayouts
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)dependentLayoutsForDrag
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSSet)reliedOnLayouts
{
  return 0;
}

- (NSArray)additionalLayoutsForRepCreation
{
  return +[NSArray array](NSArray, "array");
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 1.79769313e308;
  v4 = 1.79769313e308;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  return 0;
}

- (BOOL)allowIntersectionOfChildLayout:(id)a3
{
  return 1;
}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)shouldProvideSizingGuides
{
  double v3;

  -[CRLCanvasAbstractLayout transform](self, "transform");
  return sub_100079330(&v3, 0.002);
}

- (NSSet)additionalGuides
{
  return +[NSSet set](NSSet, "set");
}

- (double)descentForInlineLayout
{
  return 0.0;
}

- (double)inlineCenteredAlignmentHorizontalOffset
{
  return 0.0;
}

- (id)descendentWrappables
{
  return &__NSArray0__struct;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  CRLCanvasLayout *v4;

  v4 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "parent"));
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (void)p_updateDescendentWrapPathsWithTransform:(CGAffineTransform *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout descendentWrappables](self, "descendentWrappables"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(CRLBoardItemLayout, v6);
        v12 = sub_100221D0C(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = v13;
        if (v13)
        {
          v15 = *(_OWORD *)&a3->c;
          v16[0] = *(_OWORD *)&a3->a;
          v16[1] = v15;
          v16[2] = *(_OWORD *)&a3->tx;
          objc_msgSend(v13, "inRootGeometryChangedBy:", v16);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)p_invalidateDescendentWrapPathsInRoot
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout descendentWrappables](self, "descendentWrappables", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        objc_opt_class(CRLBoardItemLayout, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "invalidateInRootGeometry");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)setNeedsDisplay
{
  CGSize size;

  size = CGRectInfinite.size;
  *(CGPoint *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2) = CGRectInfinite.origin;
  *(CGSize *)((char *)&self->mDirtyRect.origin.y + 2) = size;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGFloat *v3;
  CGRect v4;
  CGRect v5;

  v3 = (CGFloat *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  v4.origin.x = *(CGFloat *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  v4.origin.y = *(CGFloat *)((char *)&self->mDirtyRect.origin.x + 2);
  v4.size.width = *(CGFloat *)((char *)&self->mDirtyRect.origin.y + 2);
  v4.size.height = *(CGFloat *)((char *)&self->mDirtyRect.size.width + 2);
  v5 = CGRectUnion(v4, a3);
  *v3 = v5.origin.x;
  v3[1] = v5.origin.y;
  v3[2] = v5.size.width;
  v3[3] = v5.size.height;
}

- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "addObject:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", a2, v5);

}

- (CGRect)i_takeDirtyRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize size;
  CGRect result;

  v2 = *(double *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2);
  v3 = *(double *)((char *)&self->mDirtyRect.origin.x + 2);
  v4 = *(double *)((char *)&self->mDirtyRect.origin.y + 2);
  v5 = *(double *)((char *)&self->mDirtyRect.size.width + 2);
  size = CGRectNull.size;
  *(CGPoint *)((char *)&self->mBaseAlignmentFrameOriginForFixingInterimPosition.y + 2) = CGRectNull.origin;
  *(CGSize *)((char *)&self->mDirtyRect.origin.y + 2) = size;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CRLBezierPath)i_wrapPath
{
  void *v2;
  CRLBezierPath *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "size");
  v3 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (CRLBezierPath *)v4;
}

- (void)p_registerWithLayoutController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "i_registerLayout:", self);
  -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", a2, v5);

}

- (void)p_unregisterWithLayoutController:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a3;
  objc_msgSend(v5, "i_unregisterLayout:", self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "connectedLayoutDisconnected:", self, (_QWORD)v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[CRLCanvasLayout i_clearInvalidationCache](self, "i_clearInvalidationCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v11, "makeObjectsPerformSelector:withObject:", a2, v5);

}

- (void)p_recursiveInvalidate
{
  id v4;

  -[CRLCanvasLayout invalidate](self, "invalidate");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", a2);

}

- (CGSize)p_newMaxInlineFrameSize
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    objc_msgSend(v8, "maximumFrameSizeForChild:", self);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    *(double *)&v10 = 1.79769313e308;
    *(double *)&v12 = 1.79769313e308;
  }

  v13 = *(double *)&v10;
  v14 = *(double *)&v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CRLSearchReference)searchTargetSearchReference
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
  v18 = sub_100221DDC(v11, 1, v12, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLSearchCanvasDelegate);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasSearchReference searchReferenceWithBoardItem:searchCanvasDelegate:](CRLCanvasSearchReference, "searchReferenceWithBoardItem:searchCanvasDelegate:", v8, v19));
  -[CRLCanvasLayout calculatePointFromSearchReference:](self, "calculatePointFromSearchReference:", v20);
  objc_msgSend(v20, "setSearchReferencePoint:");
  -[CRLCanvasAbstractLayout alignmentFrameInRoot](self, "alignmentFrameInRoot");
  objc_msgSend(v20, "setSearchReferenceLayoutFrame:");

  return (CRLSearchReference *)v20;
}

- (NSArray)childSearchTargets
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = objc_msgSend(v3, "copy");
  return (NSArray *)v5;
}

- (void)layoutSearchForNearbyElementsWithHitBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  objc_opt_class(_TtC8Freeform12CRLBoardItem, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout searchTargetSearchReference](self, "searchTargetSearchReference"));
    v9[2](v9, v8);

  }
}

- (void)layoutSearchForHyperlinkWithHitBlock:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = (void (**)(id, void *))a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hyperlinkURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout searchTargetSearchReference](self, "searchTargetSearchReference"));
    v15[2](v15, v14);

  }
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot", a3));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)percentOfUnscaledRectContainedInParentRep:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double result;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometryInRoot](self, "pureGeometryInRoot"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v18 = CGRectInset(v17, -10.0, -10.0);
  sub_10006145C(x, y, width, height, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  return 0.0;
}

- (BOOL)canvasShouldScrollForSelectionPath:(id)a3
{
  return 1;
}

- (BOOL)selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:(id)a3
{
  return 0;
}

- (CGRect)shadowedNaturalBoundsWithoutOffset
{
  void *v3;
  double x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  uint64_t v11;
  double v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v3, "size");
  x = sub_10005FDDC();
  y = v5;
  width = v7;
  height = v9;

  *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v12));
  v16 = sub_1002223BC(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shadow"));
  v19 = v18;
  if (v18 && objc_msgSend(v18, "isEnabled"))
  {
    objc_msgSend(v19, "radius");
    v21 = -v20;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectInset(v26, v21, v21);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (void)addConnectedLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  v8 = v4;
  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v7 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
    *(_QWORD *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2) = v6;

    v4 = v8;
    v5 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  }
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeConnectedLayout:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2), "removeObject:", a3);
}

- (void)p_invalidateConnectedLayouts
{
  void *v3;
  id v4;

  v3 = *(void **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v4 = objc_msgSend(*(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2), "copy");
      objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", "connectedLayoutInvalidated:", self);

    }
  }
}

- (void)p_invalidateDescendentWrapPaths
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout descendentWrappables](self, "descendentWrappables", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "invalidateExteriorWrap");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  CGAffineTransformInvert(&v8, &v7);
  v3 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  CGAffineTransformInvert(&v8, &v7);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (void)p_calculateMagnetPositionsIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;

  if ((*(&self->mInvalidatingSize + 2) & 4) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pathForClippingConnectionLines](self, "pathForClippingConnectionLines"));
    if (-[CRLCanvasLayout shouldBringCardinalMagnetsInward](self, "shouldBringCardinalMagnetsInward")
      && v3
      && (objc_msgSend(v3, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v3, "bounds");
      v15 = v14;
      v17 = v16;
      -[CRLCanvasLayout centerForRotation](self, "centerForRotation");
      v19 = v18;
      v21 = v20;
      v26 = 1.0;
      v27 = 0.0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", v18, 0.0, v18, v17));
      -[CRLCanvasLayout p_getIntersectionsForTestPath:withLowestT:withHighestT:](self, "p_getIntersectionsForTestPath:withLowestT:withHighestT:", v22, &v27, &v26);
      -[CRLCanvasLayout p_adjustCardinalMagnetTValuesIfNeededWithPadding:forLowestT:forHighestT:](self, "p_adjustCardinalMagnetTValuesIfNeededWithPadding:forLowestT:forHighestT:", &v27, &v26, 10.0 / v17);
      v23 = v17 * v27;
      *(double *)((char *)&self->mCachedFrameForCulling.size.height + 2) = v19;
      *(double *)((char *)&self->mCardinalNorthPosition.x + 2) = v23;
      v24 = v17 * v26;
      *(double *)((char *)&self->mCardinalEastPosition.y + 2) = v19;
      *(double *)((char *)&self->mCardinalSouthPosition.x + 2) = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", 0.0, v21, v15, v21));
      -[CRLCanvasLayout p_getIntersectionsForTestPath:withLowestT:withHighestT:](self, "p_getIntersectionsForTestPath:withLowestT:withHighestT:", v25, &v27, &v26);
      -[CRLCanvasLayout p_adjustCardinalMagnetTValuesIfNeededWithPadding:forLowestT:forHighestT:](self, "p_adjustCardinalMagnetTValuesIfNeededWithPadding:forLowestT:forHighestT:", &v27, &v26, 10.0 / v15);
      *(double *)((char *)&self->mCardinalNorthPosition.y + 2) = v15 * v26;
      *(double *)((char *)&self->mCardinalEastPosition.x + 2) = v21;
      *(double *)((char *)&self->mCardinalSouthPosition.y + 2) = v15 * v27;
      *(double *)((char *)&self->mCardinalWestPosition.x + 2) = v21;

    }
    else
    {
      -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[CRLCanvasLayout centerForRotation](self, "centerForRotation");
      *(_QWORD *)((char *)&self->mCachedFrameForCulling.size.height + 2) = v12;
      *(double *)((char *)&self->mCardinalNorthPosition.x + 2) = v7;
      *(_QWORD *)((char *)&self->mCardinalEastPosition.y + 2) = v12;
      *(double *)((char *)&self->mCardinalSouthPosition.x + 2) = v7 + v11;
      *(double *)((char *)&self->mCardinalNorthPosition.y + 2) = v5 + v9;
      *(_QWORD *)((char *)&self->mCardinalEastPosition.x + 2) = v13;
      *(double *)((char *)&self->mCardinalSouthPosition.y + 2) = v5;
      *(_QWORD *)((char *)&self->mCardinalWestPosition.x + 2) = v13;
    }
    *(&self->mInvalidatingSize + 2) &= ~4u;

  }
}

- (void)p_adjustCardinalMagnetTValuesIfNeededWithPadding:(double)a3 forLowestT:(double *)a4 forHighestT:(double *)a5
{
  if (*a4 > 0.5 - a3)
    *a4 = 0.0;
  if (*a5 < a3 + 0.5)
    *a5 = 1.0;
}

- (void)p_getIntersectionsForTestPath:(id)a3 withLowestT:(double *)a4 withHighestT:(double *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  void *i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pathForClippingConnectionLines](self, "pathForClippingConnectionLines"));
  v10 = objc_msgSend(v9, "copy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v8, "addIntersectionsWithPath:to:allIntersections:reversed:", v10, v11, 1, 0);
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v17 = 1.0;
    v16 = 0.0;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      v16 = 1.79769313e308;
      v17 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v19, "t", (_QWORD)v24);
          if (v20 < v16)
          {
            objc_msgSend(v19, "t");
            v16 = v21;
          }
          objc_msgSend(v19, "t");
          if (v22 > v17)
          {
            objc_msgSend(v19, "t");
            v17 = v23;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 1.79769313e308;
      v17 = 2.22507386e-308;
    }

  }
  *a4 = v16;
  *a5 = v17;

}

- (id)convexHullPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pathForClippingConnectionLines](self, "pathForClippingConnectionLines"));
    if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    {
      -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
      v5 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithConvexHullFromWrapPath:](CRLBezierPath, "bezierPathWithConvexHullFromWrapPath:", v4));
    }
    v6 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
    *(_QWORD *)((char *)&self->mCardinalWestPosition.y + 2) = v5;

    v3 = *(void **)((char *)&self->mCardinalWestPosition.y + 2);
  }
  return v3;
}

- (BOOL)shouldBringCardinalMagnetsInward
{
  return 0;
}

- (void)adjustCustomMagnetPositions
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  CRLCanvasLayout *v9;
  CRLCanvasLayout *v10;
  CRLCanvasLayout *v11;
  void *v12;
  uint64_t v13;
  CRLCanvasLayout *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v9 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedTo", (_QWORD)v17));

        if (v9 == self)
        {
          if (objc_msgSend(v8, "headMagnetType") == (id)6)
          {
            v11 = self;
            v12 = v8;
            v13 = 11;
            goto LABEL_12;
          }
          if (objc_msgSend(v8, "headMagnetType") == (id)7)
          {
            v14 = self;
            v15 = v8;
            v16 = 11;
LABEL_17:
            -[CRLCanvasLayout p_adjustFloatingMagnetPosition:forLineEnd:](v14, "p_adjustFloatingMagnetPosition:forLineEnd:", v15, v16);
            continue;
          }
        }
        else
        {
          v10 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedFrom"));

          if (v10 != self)
            continue;
          if (objc_msgSend(v8, "tailMagnetType") == (id)6)
          {
            v11 = self;
            v12 = v8;
            v13 = 10;
LABEL_12:
            -[CRLCanvasLayout p_adjustEdgeMagnetPosition:forLineEnd:](v11, "p_adjustEdgeMagnetPosition:forLineEnd:", v12, v13);
            continue;
          }
          if (objc_msgSend(v8, "tailMagnetType") == (id)7)
          {
            v14 = self;
            v15 = v8;
            v16 = 10;
            goto LABEL_17;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (void)p_adjustEdgeMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v8 = v7;
  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v10 = fmax(v8, v9);
  v11 = 0.0;
  if (objc_msgSend(v6, "connectionType"))
  {
    if (a4 == 11)
      objc_msgSend(v6, "headMagnetCanvasPosition");
    else
      objc_msgSend(v6, "tailMagnetCanvasPosition");
    -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v11);
  }
  else
  {
    -[CRLCanvasLayout p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:](self, "p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:", v6, a4, &v11, INFINITY, INFINITY, INFINITY, INFINITY);
  }
  if (v11 < v10)
  {
    if (a4 == 11)
      objc_msgSend(v6, "setHeadMagnetPosition:");
    else
      objc_msgSend(v6, "setTailMagnetPosition:");
    objc_msgSend(v6, "updateConnectedPath");
    objc_msgSend(v6, "setMagnetsAdjusted:", 1);
  }

}

- (void)p_adjustFloatingMagnetPosition:(id)a3 forLineEnd:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  double v25;
  void *v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;

  v6 = a3;
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info", v8));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectionLinePathSource"));
  v15 = v14;
  if (a4 == 11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "headMagnet"));
    objc_msgSend(v16, "magnetNormalizedPosition");
    v30 = v18;
    v32 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "fullTransform");
      v21 = v37;
      v22 = v38;
      v23 = v39;
    }
    else
    {
      v23 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
    }
    objc_msgSend(v6, "setHeadMagnetPosition:", vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v22, v30), v21, v32)));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tailMagnet"));
    objc_msgSend(v16, "magnetNormalizedPosition");
    v31 = v25;
    v33 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
    v20 = v26;
    if (v26)
    {
      objc_msgSend(v26, "fullTransform");
      v27 = v34;
      v28 = v35;
      v29 = v36;
    }
    else
    {
      v29 = 0uLL;
      v27 = 0uLL;
      v28 = 0uLL;
    }
    objc_msgSend(v6, "setTailMagnetPosition:", vaddq_f64(v29, vmlaq_n_f64(vmulq_n_f64(v28, v31), v27, v33)));
  }

  objc_msgSend(v6, "updateConnectedPath");
  objc_msgSend(v6, "setMagnetsAdjusted:", 1);

}

- (CGPoint)p_findFirstEdgePointIntersectionOnWrapPathWithLine:(id)a3 forLineEnd:(unint64_t)a4 withDistanceToPoint:(double *)a5 withOverridenHeadPosition:(CGPoint)a6 withOverridenTailPosition:(CGPoint)a7
{
  double y;
  double v8;
  double v9;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  _BOOL4 v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *i;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  float64x2_t v116;
  float64x2_t v117;
  float64x2_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  float64x2_t v125;
  void *v126;
  void *v127;
  double v128;
  double *v129;
  double x;
  double v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  CGAffineTransform v140;
  CGAffineTransform v141;
  CGAffineTransform v142;
  CGAffineTransform v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[128];
  CGPoint result;

  y = a7.y;
  x = a7.x;
  v8 = a6.y;
  v9 = a6.x;
  v13 = a3;
  *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v14).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info", v15));
  v19 = sub_100221D0C(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v127 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "connectionLinePathSource"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedTo"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "headMagnet"));
    objc_msgSend(v23, "magnetNormalizedPosition");
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedTo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pureGeometry"));
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "fullTransform");
      v31 = *((double *)&v153 + 1);
      v32 = *(double *)&v153;
      v33 = *((double *)&v154 + 1);
      v34 = *(double *)&v154;
      v35 = *((double *)&v155 + 1);
      v36 = *(double *)&v155;
    }
    else
    {
      v154 = 0u;
      v155 = 0u;
      v153 = 0u;
      v35 = 0.0;
      v33 = 0.0;
      v31 = 0.0;
      v36 = 0.0;
      v34 = 0.0;
      v32 = 0.0;
    }
    v47 = v36 + v27 * v34 + v32 * v25;
    v48 = v35 + v27 * v33 + v31 * v25;

  }
  else
  {
    objc_msgSend(v13, "headPoint");
    v38 = v37;
    v40 = v39;
    if (v13)
    {
      objc_msgSend(v13, "transform");
      v41 = *((double *)&v150 + 1);
      v42 = *(double *)&v150;
      v43 = *((double *)&v151 + 1);
      v44 = *(double *)&v151;
      v45 = *((double *)&v152 + 1);
      v46 = *(double *)&v152;
    }
    else
    {
      v151 = 0u;
      v152 = 0u;
      v150 = 0u;
      v45 = 0.0;
      v43 = 0.0;
      v41 = 0.0;
      v46 = 0.0;
      v44 = 0.0;
      v42 = 0.0;
    }
    v47 = v46 + v40 * v44 + v42 * v38;
    v48 = v45 + v40 * v43 + v41 * v38;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedFrom"));
  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tailMagnet"));
    objc_msgSend(v50, "magnetNormalizedPosition");
    v52 = v51;
    v54 = v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedFrom"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "pureGeometry"));
    v57 = v56;
    if (v56)
    {
      objc_msgSend(v56, "fullTransform");
      v58 = *((double *)&v147 + 1);
      v59 = *(double *)&v147;
      v60 = *((double *)&v148 + 1);
      v61 = *(double *)&v148;
      v62 = *((double *)&v149 + 1);
      v63 = *(double *)&v149;
    }
    else
    {
      v148 = 0u;
      v149 = 0u;
      v147 = 0u;
      v62 = 0.0;
      v60 = 0.0;
      v58 = 0.0;
      v63 = 0.0;
      v61 = 0.0;
      v59 = 0.0;
    }
    v74 = v63 + v54 * v61 + v59 * v52;
    v75 = v62 + v54 * v60 + v58 * v52;

  }
  else
  {
    objc_msgSend(v13, "tailPoint");
    v65 = v64;
    v67 = v66;
    if (v13)
    {
      objc_msgSend(v13, "transform");
      v68 = *((double *)&v144 + 1);
      v69 = *(double *)&v144;
      v70 = *((double *)&v145 + 1);
      v71 = *(double *)&v145;
      v72 = *((double *)&v146 + 1);
      v73 = *(double *)&v146;
    }
    else
    {
      v145 = 0u;
      v146 = 0u;
      v144 = 0u;
      v72 = 0.0;
      v70 = 0.0;
      v68 = 0.0;
      v73 = 0.0;
      v71 = 0.0;
      v69 = 0.0;
    }
    v74 = v73 + v67 * v71 + v69 * v65;
    v75 = v72 + v67 * v70 + v68 * v65;
  }

  if (sub_100061890(v9, v8))
  {
    v8 = v48;
    v9 = v47;
  }
  v76 = sub_100061890(x, y);
  if (v76)
    v77 = v75;
  else
    v77 = y;
  if (v76)
    v78 = v74;
  else
    v78 = x;
  if (a4 == 10)
    v79 = v8;
  else
    v79 = v77;
  v128 = v79;
  if (a4 == 10)
    v80 = v9;
  else
    v80 = v78;
  v131 = v80;
  if (a4 == 10)
    v81 = v77;
  else
    v81 = v8;
  if (a4 == 10)
    v82 = v78;
  else
    v82 = v9;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v83, "frame");
  v85 = v84;
  if (v82 > v131)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    objc_msgSend(v86, "size");
    v85 = v85 + v87;

  }
  sub_1000603B8(v82, v81, v131);
  v88 = sub_1000603D0(v82, v81, v85 - v82);
  v123 = v89;
  v124 = v88;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v91 = v90;
  if (v90)
    objc_msgSend(v90, "transform");
  else
    memset(&v142, 0, sizeof(v142));
  CGAffineTransformInvert(&v143, &v142);
  v125 = vaddq_f64(*(float64x2_t *)&v143.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v143.c, v123), *(float64x2_t *)&v143.a, v124));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v93 = v92;
  if (v92)
    objc_msgSend(v92, "transform");
  else
    memset(&v140, 0, sizeof(v140));
  CGAffineTransformInvert(&v141, &v140);
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", *(_OWORD *)&v125, vaddq_f64(*(float64x2_t *)&v141.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v141.c, v128), *(float64x2_t *)&v141.a, v131))));

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pathForClippingConnectionLines](self, "pathForClippingConnectionLines"));
  v96 = objc_msgSend(v95, "copy");

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v94, "addIntersectionsWithPath:to:allIntersections:reversed:", v96, v97, 1, 0);
  if (objc_msgSend(v97, "count"))
  {
    v126 = v21;
    v129 = a5;
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v98 = v97;
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v136, v156, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v137;
      v102 = 0.0;
      v103 = 2.22507386e-308;
      v104 = 1.79769313e308;
      v105 = 0.0;
      do
      {
        for (i = 0; i != v100; i = (char *)i + 1)
        {
          if (*(_QWORD *)v137 != v101)
            objc_enumerationMutation(v98);
          v107 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v107, "point");
          if (v108 < v104)
          {
            objc_msgSend(v107, "point");
            v104 = v109;
            v102 = v110;
          }
          objc_msgSend(v107, "point");
          if (v111 > v103)
          {
            objc_msgSend(v107, "point");
            v103 = v112;
            v105 = v113;
          }
        }
        v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v136, v156, 16);
      }
      while (v100);
    }
    else
    {
      v102 = 0.0;
      v103 = 2.22507386e-308;
      v104 = 1.79769313e308;
      v105 = 0.0;
    }

    a5 = v129;
    v21 = v126;
  }
  else
  {
    v102 = 0.0;
    v103 = 2.22507386e-308;
    v104 = 1.79769313e308;
    v105 = 0.0;
  }
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v115 = v114;
  if (v114)
  {
    objc_msgSend(v114, "transform");
    v116 = v133;
    v117 = v134;
    v118 = v135;
  }
  else
  {
    v118 = 0uLL;
    v116 = 0uLL;
    v117 = 0uLL;
  }
  if (v82 > v131)
    v119 = v104;
  else
    v119 = v103;
  if (v82 > v131)
    v120 = v102;
  else
    v120 = v105;
  v132 = vaddq_f64(v118, vmlaq_n_f64(vmulq_n_f64(v117, v120), v116, v119));

  *a5 = sub_10006108C(v132.f64[0], v132.f64[1], v82, v81);
  v122 = v132.f64[1];
  v121 = v132.f64[0];
  result.y = v122;
  result.x = v121;
  return result;
}

- (id)commandsForAdjustingMagnetsFromClineLayouts
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  CRLConnectionLineMagnet *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  CRLConnectionLineMagnet *v44;
  void *v45;
  void *v46;
  void *v47;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v53;
  uint64_t v55;
  id v56;
  id v57;
  id obj;
  CRLCanvasLayout *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];

  v56 = objc_alloc_init((Class)NSMutableArray);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v59 = self;
  obj = *(id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v71;
    v55 = *(_QWORD *)v71;
    do
    {
      v6 = 0;
      v57 = v4;
      do
      {
        if (*(_QWORD *)v71 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v6);
        if (objc_msgSend(v7, "magnetsAdjusted"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectionLineInfo"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLinePathSource"));
          v10 = objc_msgSend(v9, "copy");

          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headMagnet"));
          if (v11)
          {
            objc_msgSend(v7, "headMagnetNormalizedPosition");
            v60 = v13;
            v62 = v12;
            if (objc_msgSend(v7, "overridenHeadMagnetNormalizedPosition"))
            {
              objc_msgSend(v7, "headMagnetNormalizedPosition");
              v15 = v14;
              v17 = v16;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));
              -[CRLCanvasLayout p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:](v59, "p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:", v18, v15, v17);
              v60 = v20;
              v62 = v19;

              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pureGeometry"));
              v23 = v22;
              if (v22)
              {
                objc_msgSend(v22, "fullTransform");
                v24 = v67;
                v25 = v68;
                v26 = v69;
              }
              else
              {
                v68 = 0u;
                v69 = 0u;
                v26 = 0uLL;
                v24 = 0uLL;
                v25 = 0uLL;
                v67 = 0u;
              }
              objc_msgSend(v7, "setHeadMagnetPosition:", vaddq_f64(v26, vmlaq_n_f64(vmulq_n_f64(v25, v60), v24, v62)));

            }
            v27 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", objc_msgSend(v7, "headMagnetType"), v62, v60);
            objc_msgSend(v10, "setHeadMagnet:", v27);

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tailMagnet"));

          if (v28)
          {
            objc_msgSend(v7, "tailMagnetNormalizedPosition");
            v61 = v30;
            v63 = v29;
            if (objc_msgSend(v7, "overridenTailMagnetNormalizedPosition"))
            {
              objc_msgSend(v7, "tailMagnetNormalizedPosition");
              v32 = v31;
              v34 = v33;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));
              -[CRLCanvasLayout p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:](v59, "p_convertNormalizedPositionFromLayoutToPureGeomtry:forLayout:", v35, v32, v34);
              v61 = v37;
              v63 = v36;

              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedFrom"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "pureGeometry"));
              v40 = v39;
              if (v39)
              {
                objc_msgSend(v39, "fullTransform");
                v41 = v64;
                v42 = v65;
                v43 = v66;
              }
              else
              {
                v65 = 0u;
                v66 = 0u;
                v43 = 0uLL;
                v41 = 0uLL;
                v42 = 0uLL;
                v64 = 0u;
              }
              objc_msgSend(v7, "setTailMagnetPosition:", vaddq_f64(v43, vmlaq_n_f64(vmulq_n_f64(v42, v61), v41, v63)));

            }
            v44 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", objc_msgSend(v7, "tailMagnetType"), v63, v61);
            objc_msgSend(v10, "setTailMagnet:", v44);

          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](v59, "layoutController"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "boardItemOwner"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getConnectedToWithBoardItemOwner:", v46));

          v48 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v8, v47, 1, v10);
          objc_msgSend(v56, "addObject:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](v59, "layoutController"));
          v50 = v8;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "boardItemOwner"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "getConnectedFromWithBoardItemOwner:", v51));

          v53 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v50, v52, 0, v10);
          objc_msgSend(v56, "addObject:", v53);
          objc_msgSend(v7, "setMagnetsAdjusted:", 0);

          v5 = v55;
          v4 = v57;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v4);
  }

  return v56;
}

- (CGPoint)p_convertNormalizedPositionFromLayoutToPureGeomtry:(CGPoint)a3 forLayout:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64x2_t v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fullTransform");
    v10 = *((double *)&v27 + 1);
    v9 = *(double *)&v27;
    v12 = *((double *)&v28 + 1);
    v11 = *(double *)&v28;
    v13 = *((double *)&v29 + 1);
    v14 = *(double *)&v29;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    v13 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    v14 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
  }

  if (v6)
    objc_msgSend(v6, "pureTransformInRoot");
  else
    memset(&v25, 0, sizeof(v25));
  CGAffineTransformInvert(&v26, &v25);
  v24 = vaddq_f64(*(float64x2_t *)&v26.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v26.c, v13 + y * v12 + v10 * x), *(float64x2_t *)&v26.a, v14 + y * v11 + v9 * x));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pureGeometry"));
  objc_msgSend(v15, "size");
  v16 = sub_10005FDDC();
  v19 = sub_1000626B8(v24.f64[0], v24.f64[1], v16, v17, v18);
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)enqueueCommandsForAdjustingPathSourcesAfterRoutingChanges
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout connectedLayouts](self, "connectedLayouts", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "controlKnobPositionChangedFromRouting"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvas"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasController"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repForLayout:", v8));

          objc_opt_class(CRLShapeRep, v13);
          v15 = sub_100221D0C(v14, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "enqueuePathSourceChanges");
            objc_msgSend(v8, "setControlKnobPositionChangedFromRouting:", 0);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (CGPoint)nearestEdgePointOnWrapPathFromPoint:(CGPoint)a3
{
  double v3;
  double v4;
  uint64_t v5;
  CGPoint result;

  v5 = 0;
  -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v5, a3.x, a3.y, 10.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)p_findNearestEdgePointOnWrapPathFromPoint:(CGPoint)a3 withSearchThreshold:(double)a4 withDistanceToPoint:(double *)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  double v13;
  double v14;
  double y;
  double v16;
  double x;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  double v25;
  uint64_t v26;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pathForClippingConnectionLines](self, "pathForClippingConnectionLines"));
  v25 = 0.0;
  v26 = 0;
  -[CRLCanvasAbstractLayout transform](self, "transform");
  CGAffineTransformInvert(&v24, &v23);
  objc_msgSend(v8, "distanceToPoint:elementIndex:tValue:threshold:findClosestMatch:", &v26, &v25, 1, vaddq_f64(*(float64x2_t *)&v24.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, y), *(float64x2_t *)&v24.a, x)), a4);
  *a5 = v9;
  if (v9 >= a4)
  {
    v12 = (float64x2_t)xmmword_100EEC438;
  }
  else
  {
    objc_msgSend(v8, "pointAt:fromElement:", v26, v25);
    v16 = v11;
    v18 = v10;
    -[CRLCanvasAbstractLayout transform](self, "transform");
    v12 = vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v16), v20, v18));
  }
  v19 = v12;

  v14 = v19.f64[1];
  v13 = v19.f64[0];
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)findNewEdgeMagnetCanvasPositionForConnectionLine:(id)a3 forLineEnd:(unint64_t)a4 withCanvasPosition:(CGPoint)a5
{
  double y;
  double x;
  id v9;
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
  double v20;
  double v21;
  double v22;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v11 = v10;
  -[CRLCanvasLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v13 = fmax(v11, v12);
  v22 = 0.0;
  if (objc_msgSend(v9, "connectionType"))
  {
    -[CRLCanvasLayout p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:](self, "p_findNearestEdgePointOnWrapPathFromPoint:withSearchThreshold:withDistanceToPoint:", &v22, x, y, v13);
  }
  else
  {
    v16 = INFINITY;
    v17 = INFINITY;
    if (a4 == 11)
      v18 = x;
    else
      v18 = INFINITY;
    if (a4 == 11)
      v19 = y;
    else
      v19 = INFINITY;
    if (a4 == 10)
    {
      v16 = x;
      v17 = y;
    }
    -[CRLCanvasLayout p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:](self, "p_findFirstEdgePointIntersectionOnWrapPathWithLine:forLineEnd:withDistanceToPoint:withOverridenHeadPosition:withOverridenTailPosition:", v9, a4, &v22, v18, v19, v16, v17);
  }
  if (v22 < v13)
  {
    y = v15;
    x = v14;
  }

  v20 = x;
  v21 = y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CRLCanvasElementInfo)info
{
  return *(CRLCanvasElementInfo **)(&self->super._lastInterimPositionYSet + 1);
}

- (CRLCanvasLayoutGeometry)originalGeometry
{
  return *(CRLCanvasLayoutGeometry **)((char *)&self->mInvalidFlags + 2);
}

- (void)setOriginalGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 162);
}

- (int)layoutState
{
  return *(_DWORD *)((char *)&self->mInfo + 2);
}

- (unint64_t)freeTransformState
{
  return *(_QWORD *)((char *)&self->mLayoutState + 2);
}

- (NSSet)connectedLayouts
{
  return *(NSSet **)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2);
}

- (CGSize)maximumInlineFrameSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->mConnectedLayouts + 2);
  v3 = *(double *)((char *)&self->mMaximumInlineFrameSize.width + 2);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaximumInlineFrameSize:(CGSize)a3
{
  *(NSMutableSet **)((char *)&self->mConnectedLayouts + 2) = *(NSMutableSet **)&a3.width;
  *(CGFloat *)((char *)&self->mMaximumInlineFrameSize.width + 2) = a3.height;
}

- (BOOL)isInRealTimeDynamicOperation
{
  return BYTE2(self->mConvexHullPath);
}

- (CRLCanvasInfoGeometry)infoGeometryBeforeDynamicOperation
{
  return *(CRLCanvasInfoGeometry **)(&self->mIsInRealTimeDynamicOperation + 2);
}

- (CGRect)initialBoundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->mBaseGeometry + 2);
  v3 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2);
  v4 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2);
  v5 = *(double *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setInitialBoundsForStandardKnobs:(CGRect)a3
{
  *(CRLCanvasLayoutGeometry **)((char *)&self->mBaseGeometry + 2) = *(CRLCanvasLayoutGeometry **)&a3.origin.x;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.origin.x + 2) = a3.origin.y;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.origin.y + 2) = a3.size.width;
  *(CGFloat *)((char *)&self->mInitialBoundsForStandardKnobs.size.width + 2) = a3.size.height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->mIsInRealTimeDynamicOperation + 2), 0);
  objc_storeStrong((id *)((char *)&self->mCardinalWestPosition.y + 2), 0);
  objc_storeStrong((id *)((char *)&self->mInitialBoundsForStandardKnobs.size.height + 2), 0);
  objc_storeStrong((id *)((char *)&self->mInvalidFlags + 2), 0);
  objc_storeStrong((id *)(&self->super._lastInterimPositionYSet + 1), 0);
}

@end
