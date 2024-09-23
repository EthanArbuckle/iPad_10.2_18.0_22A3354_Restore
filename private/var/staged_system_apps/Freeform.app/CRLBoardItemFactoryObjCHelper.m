@implementation CRLBoardItemFactoryObjCHelper

+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 adjustedBaseWidth:(double)a4 boardItemFactory:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  CRLPencilKitInkStroke *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  uint64_t v26;
  double y;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  id v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  CRLPencilKitInkStroke *v49;
  id v50;
  id v51;
  CGAffineTransform v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[3];
  id v58;
  _BYTE v59[128];
  void *v60;

  v8 = a3;
  v50 = a5;
  v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v58 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", v8, &v58));
  v10 = v58;
  v11 = [CRLPencilKitInkStroke alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ink"));
  v49 = -[CRLPencilKitInkStroke initWithInk:adjustedWidth:](v11, "initWithInk:adjustedWidth:", v12, a4);

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mask")));
  v14 = objc_msgSend(v13, "CGPath");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v14));
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "transform");
      goto LABEL_6;
    }
  }
  else
  {
    v15 = 0;
    if (v8)
      goto LABEL_3;
  }
  memset(v57, 0, sizeof(v57));
LABEL_6:
  objc_msgSend(v15, "transformUsingAffineTransform:", v57);
  v45 = v10;
  v46 = (void *)v9;
  if (v15)
  {
    objc_msgSend(v8, "crl_maximumActualWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bezierPathByOffsettingPath:joinStyle:", 1, v16 * 0.5));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_bezierAndStrokePathDataSubpathsByClippingBezier:andStrokePathData:toPath:", v9, v10, v17));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v9, v10));
    v60 = v17;
    v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
  }
  v19 = (void *)v18;

  v47 = v8;
  objc_msgSend(v8, "crl_anchorPointForTexture");
  v21 = v20;
  v23 = v22;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v19;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v54;
    y = CGPointZero.y;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "first"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "second"));
        objc_msgSend(v30, "bounds");
        v33 = v32;
        v35 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v30));
        if (v15)
        {
          v37 = objc_msgSend(v15, "copy");
          if (v33 != CGPointZero.x || v35 != y)
          {
            CGAffineTransformMakeTranslation(&v52, -v33, -v35);
            objc_msgSend(v37, "transformUsingAffineTransform:", &v52);
          }
        }
        else
        {
          v37 = 0;
        }
        objc_msgSend(v31, "setAnchorPointForTexture:", sub_1000603B8(v21, v23, v33));
        v40 = (objc_class *)objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:", v36, v49, 0, v31, v37, v33, v35));
        v42 = sub_1002223BC(v40, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

        objc_msgSend(v51, "addObject:", v43);
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v25);
  }

  return v51;
}

+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4 boardItemFactory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ink"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inkType"));
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:forInkType:](CRLPencilKitInkStroke, "adjustedStrokeWidthFromWidth:forInkType:", v11, a4);
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "freehandDrawingShapeItemsFromPKStroke:adjustedBaseWidth:boardItemFactory:", v9, v8, v13));
  return v14;
}

+ (id)p_bezierAndStrokePathDataSubpathsByClippingBezier:(id)a3 andStrokePathData:(id)a4 toPath:(id)a5
{
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];

  v35 = a4;
  v40 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper linePathWithLinePath:intersectedWithFilledPath:outMapToInputPaths:](CRLBezierPathBooleanOperationHelper, "linePathWithLinePath:intersectedWithFilledPath:outMapToInputPaths:", a3, a5, &v40));
  v34 = v40;
  v8 = objc_msgSend(v34, "elementCount");
  if (v8 != objc_msgSend(v7, "elementCount"))
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C9A0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE852C(v9, v10);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122C9C0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBoardItemFactoryObjCHelper p_bezierAndStrokePathDataSubpathsByClippingBezier:andStrokePathData:toPath:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemFactoryObjCHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 125, 0, "expected equality between %{public}s and %{public}s", "BOOLeanPathMap.elementCount", "clippedPath.elementCount");

  }
  if (!objc_msgSend(v7, "containsElementsOtherThanMoveAndClose"))
  {
    v33 = &__NSArray0__struct;
    goto LABEL_27;
  }
  v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rangesOfSubpaths"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crl_arrayOfObjectsPassingTest:", &stru_10122CA00));

  v16 = objc_msgSend(v15, "count");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v18)
    goto LABEL_25;
  v19 = v18;
  v20 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v20)
        objc_enumerationMutation(v17);
      v22 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "rangeValue");
      if (v16 == (id)1)
      {
        v24 = v7;
        if ((objc_msgSend(v24, "containsElementsOtherThanMoveAndClose") & 1) == 0)
          goto LABEL_23;
        v25 = v34;
      }
      else
      {
        v26 = v22;
        v27 = v23;
        v24 = objc_msgSend(v7, "copyWithPointsInRange:", v22, v23);
        if ((objc_msgSend(v24, "containsElementsOtherThanMoveAndClose") & 1) == 0)
          goto LABEL_23;
        v25 = objc_msgSend(v34, "copyWithElementsInRange:", v26, v27);
      }
      v28 = v25;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_strokePathCompactData:byTrimmingToMap:", v35, v25));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v24, v29));
      objc_msgSend(v33, "addObject:", v30);

LABEL_23:
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v19);
LABEL_25:

LABEL_27:
  return v33;
}

+ (id)p_strokePathCompactData:(id)a3 byTrimmingToMap:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  CRLPKStrokePathCompactData *v8;
  id v9;
  void *v10;
  CRLPKStrokePathCompactData *v11;
  void *v12;
  uint64_t v13;
  double v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  _QWORD v23[9];
  double v24;

  v5 = a3;
  v6 = a4;
  v7 = (uint64_t)objc_msgSend(v6, "elementCount");
  v8 = [CRLPKStrokePathCompactData alloc];
  v9 = objc_msgSend(v5, "randomSeed");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
  v11 = -[CRLPKStrokePathCompactData initWithCapacity:randomSeed:creationDate:](v8, "initWithCapacity:randomSeed:creationDate:", v7, v9, v10);

  objc_msgSend(v5, "renderScaleX");
  -[CRLPKStrokePathCompactData setRenderScaleX:](v11, "setRenderScaleX:");
  objc_msgSend(v5, "renderScaleY");
  -[CRLPKStrokePathCompactData setRenderScaleY:](v11, "setRenderScaleY:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderGroupID"));
  -[CRLPKStrokePathCompactData setRenderGroupID:](v11, "setRenderGroupID:", v12);

  -[CRLPKStrokePathCompactData setShouldSolveMath:](v11, "setShouldSolveMath:", objc_msgSend(v5, "shouldSolveMath"));
  if (v7 >= 1)
  {
    v13 = 0;
    v14 = -1.0;
    do
    {
      v24 = NAN;
      v15 = objc_msgSend(v6, "inputPathIndexForOutputElementIndex:outInputT:", v13, &v24);
      v16 = vcvtmd_s64_f64(v24);
      if (v15)
        v16 = -1;
      else
        v14 = v24;
      v17 = v14 >= 0.0 && v16 < 0;
      v18 = vcvtmd_s64_f64(v14);
      if (v17)
        v19 = v18;
      else
        v19 = v16;
      if (v19 < 0 && v13 + 1 < v7)
      {
        v23[5] = 0x7FF8000000000000;
        v20 = objc_msgSend(v6, "inputPathIndexForOutputElementIndex:outInputT:");
        v21 = vcvtmd_s64_f64(*(double *)&v23[5]);
        if (!v20)
          v19 = v21;
      }
      memset(&v23[5], 0, 28);
      if (v5)
        objc_msgSend(v5, "strokePointCompactDataAtIndex:", v19 & ~(v19 >> 63));
      *(_OWORD *)v23 = *(_OWORD *)&v23[5];
      *(_OWORD *)((char *)&v23[1] + 4) = *(_OWORD *)((char *)&v23[6] + 4);
      -[CRLPKStrokePathCompactData appendStrokePointCompactData:](v11, "appendStrokePointCompactData:", v23);
      ++v13;
    }
    while (v7 != v13);
  }

  return v11;
}

@end
