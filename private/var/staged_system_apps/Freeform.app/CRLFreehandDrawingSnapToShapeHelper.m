@implementation CRLFreehandDrawingSnapToShapeHelper

- (CRLFreehandDrawingSnapToShapeHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLFreehandDrawingSnapToShapeHelper *v5;
  CRLFreehandDrawingSnapToShapeHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingSnapToShapeHelper;
  v5 = -[CRLFreehandDrawingSnapToShapeHelper init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_icc, v4);

  return v6;
}

- (id)bezierPathsBySnappingOutlineFillBezierPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:](self, "p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:", a3, 1, 0, 0, 0));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), 0, (_QWORD)v13));
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)p_strokesBySnappingBezierPath:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4 strokePathCompactData:(id)a5 maskPath:(id)a6 stroke:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  CRLPencilKitInkStroke *v15;
  CRLPencilKitInkStroke *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (CRLPencilKitInkStroke *)a7;
  if (!v15)
  {
    v16 = [CRLPencilKitInkStroke alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    v15 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:](v16, "initWithInkType:color:adjustedWidth:", PKInkTypePen, v17, 1.0);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:](CRLPKStrokeConverter, "pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:", v12, v15, v13, v14));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:](self, "p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:", v18, v10));
  if (objc_msgSend(v19, "count"))
    v20 = 1;
  else
    v20 = !v10;
  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathByNormalizingClosedPathToRemoveSelfIntersections"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:](CRLPKStrokeConverter, "pencilKitStrokesFromPath:inkStroke:strokePathCompactData:maskPath:", v21, v15, v13, v14));

    v23 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:](self, "p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:", v22, 1));
    v19 = (void *)v23;
  }
  if (objc_msgSend(v19, "count"))
    v24 = v19;
  else
    v24 = 0;

  return v24;
}

- (id)p_snapToShapeWithPKStrokes:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  CFArrayRef (__cdecl **v21)(CTFontDescriptorRef, CFSetRef);
  CFArrayRef (__cdecl **v22)(CTFontDescriptorRef, CFSetRef);
  void *v23;
  CFArrayRef (__cdecl *v24)(CTFontDescriptorRef, CFSetRef);
  void *v25;
  void *v26;
  _BOOL8 v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  uint64_t v36;
  void *v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  _BYTE v50[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)p_icc);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244ED8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0D080();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244EF8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 80, 0, "invalid nil value for '%{public}s'", "_icc");

  }
  v13 = objc_loadWeakRetained((id *)p_icc);
  objc_msgSend(v13, "viewScale");
  v14 = 1.0;
  if (v15 > 0.0)
  {
    v16 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v16, "viewScale");
    v14 = 1.0 / v17;

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    v21 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v22 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v36 = *(_QWORD *)v45;
    v37 = v7;
    do
    {
      v23 = 0;
      v38 = v19;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(obj);
        v24 = v21[491];
        v49 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[372], "arrayWithObjects:count:", &v49, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_snapToShape:inputScale:", v25, v14));

        if (v26)
        {
          if (v4)
          {
            v27 = v4;
            v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v29 = v26;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v31; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v41 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
                  if (+[PKShape isFillableForShapeType:](PKShape, "isFillableForShapeType:", objc_msgSend(v34, "_shapeType")))objc_msgSend(v28, "addObject:", v34);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              }
              while (v31);
            }

            v4 = v27;
            v20 = v36;
            v7 = v37;
            v21 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
            v19 = v38;
            v22 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          }
          else
          {
            v28 = v26;
          }
          objc_msgSend(v7, "addObjectsFromArray:", v28);

        }
        v23 = (char *)v23 + 1;
      }
      while (v23 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v19);
  }

  return v7;
}

- (id)unscaledPKStrokesBySnappingShapeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bezierPath"));
  v7 = objc_msgSend(v6, "copy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutForInfo:", v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pureGeometryInRoot"));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "transform");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  objc_msgSend(v7, "transformUsingAffineTransform:", &v25);

  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pencilKitStrokePathCompactData"));
    v14 = objc_msgSend(v4, "isTreatedAsFillForFreehandDrawing");
    *(_QWORD *)&v16 = objc_opt_class(CRLPencilKitInkStroke, v15).n128_u64[0];
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stroke", v16));
    v20 = sub_100221D0C(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:](self, "p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:", v7, v14, v13, v12, v21));
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244F18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0D12C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244F38);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper unscaledPKStrokesBySnappingShapeItem:]", v25, v26, v27));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 111, 0, "Expected a valid bezierPath");
    v22 = 0;
  }

  return v22;
}

- (id)commandForSnappingShapeItem:(id)a3 toPathsInParentSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5
{
  id v7;
  id v8;
  _TtC8Freeform15CRLCommandGroup *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  void *v23;
  void *v24;
  CRLCanvasInfoGeometry *v25;
  uint64_t v26;
  double v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v34;
  _TtC8Freeform23CRLCommandSetPathSource *v35;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v48;
  void *v49;
  void *v50;
  id v51;
  id v53;
  id v55;
  void *v56;
  void *v57;
  CRLCanvasInfoGeometry *v58;
  void *v59;
  _TtC8Freeform26CRLCommandInsertBoardItems *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v7 = a3;
  v8 = a4;
  v9 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", &__NSArray0__struct);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Snap to Shape"), 0, CFSTR("UndoStrings")));
  -[CRLCommandGroup setActionString:](v9, "setActionString:", v11);

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v12));
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v57 = v13;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v13));
      if (v12)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
        v24 = v7;
        v25 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "boardItemFactory"));

        *(_QWORD *)&v27 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v26).n128_u64[0];
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stroke", v27));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "fill"));
        v58 = v25;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:](v25, "makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:", v59, v30, v31, 0, 0, v15, v17));
        v33 = sub_1002223BC(v29, v32);
        v34 = (_TtC8Freeform25CRLCommandSetInfoGeometry *)objc_claimAutoreleasedReturnValue(v33);

        v7 = v24;
        v8 = v55;

        objc_msgSend(v56, "addObject:", v34);
      }
      else
      {
        v58 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v15, v17, v19, v21);
        v34 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v7, v58);
        -[CRLCommandGroup addCommand:](v9, "addCommand:", v34);
        v35 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v7, v59);
        -[CRLCommandGroup addCommand:](v9, "addCommand:", v35);
        v36 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithFreehandDrawingShapeItem:snappedShapeType:]([_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc], "initWithFreehandDrawingShapeItem:snappedShapeType:", v7, -[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:](self, "p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:", v7, 1));
        -[CRLCommandGroup addCommand:](v9, "addCommand:", v36);

      }
      ++v12;
    }
    while (v12 < (unint64_t)objc_msgSend(v8, "count"));
  }
  v37 = v56;
  if (objc_msgSend(v56, "count"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containingGroup"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "childInfos"));
    v40 = (char *)objc_msgSend(v39, "indexOfObject:", v7);

    v53 = v7;
    if (v40 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "childInfos"));
      v42 = objc_msgSend(v41, "count");

    }
    else
    {
      v42 = v40 + 1;
    }
    v60 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v38, v56, v42);
    -[CRLCommandGroup addCommand:](v9, "addCommand:");
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v43 = v56;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v46)
            objc_enumerationMutation(v43);
          v48 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithFreehandDrawingShapeItem:snappedShapeType:]([_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc], "initWithFreehandDrawingShapeItem:snappedShapeType:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i), -[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:](self, "p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i), 1, v53));
          -[CRLCommandGroup addCommand:](v9, "addCommand:", v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v45);
    }

    v7 = v53;
    v8 = v55;
    v37 = v56;
  }
  if (a5)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v49, "addObject:", v7);
    objc_msgSend(v49, "addObjectsFromArray:", v37);
    v50 = v49;
    v8 = v55;
    v51 = objc_retainAutorelease(v50);
    *a5 = v51;

  }
  return v9;
}

- (id)commandForSnappingShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5
{
  id v7;
  id v8;
  _TtC8Freeform15CRLCommandGroup *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  double v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  CRLCanvasInfoGeometry *v23;
  void *v24;
  CRLCanvasInfoGeometry *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  char v35;
  void *i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v41;
  void *v42;
  char *v43;
  void *v44;
  id v45;
  _TtC8Freeform26CRLCommandInsertBoardItems *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *j;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v52;
  void *v53;
  id v54;
  void *v56;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  CRLFreehandDrawingSnapToShapeHelper *v66;
  _TtC8Freeform15CRLCommandGroup *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];

  v7 = a3;
  v8 = a4;
  v9 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", &__NSArray0__struct);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Snap to Shape"), 0, CFSTR("UndoStrings")));
  v67 = v9;
  -[CRLCommandGroup setActionString:](v9, "setActionString:", v11);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "boardItemFactory"));

  *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v15));
  v19 = sub_1002223BC(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);

  v21 = objc_loadWeakRetained((id *)&self->_icc);
  v59 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutForInfo:", v20));

  v23 = [CRLCanvasInfoGeometry alloc];
  v56 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometryInRoot"));
  v25 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:](v23, "initWithLayoutGeometry:", v24);

  v66 = self;
  v58 = v8;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_strokesByClippingMaskedStrokes:](self, "p_strokesByClippingMaskedStrokes:", v8));
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v77;
    v26 = 1;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v77 != v61)
          objc_enumerationMutation(obj);
        v64 = v27;
        v28 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stroke"));
        objc_msgSend(v29, "width");
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "makeShapeItemsForFreehandDrawingWithPKStroke:adjustedBaseWidth:", v28));

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v73;
          v35 = v26;
          do
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v34)
                objc_enumerationMutation(v31);
              v37 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "geometry"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "geometryRelativeToGeometry:", v25));
              objc_msgSend(v37, "setGeometry:", v39);

              if ((v35 & 1) != 0)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandsToUpdateModelToMatch:", v37));
                -[CRLCommandGroup addCommand:](v67, "addCommand:", v40);

                v41 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithFreehandDrawingShapeItem:snappedShapeType:]([_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc], "initWithFreehandDrawingShapeItem:snappedShapeType:", v7, -[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:](v66, "p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:", v7, 0));
                -[CRLCommandGroup addCommand:](v67, "addCommand:", v41);

              }
              else
              {
                objc_msgSend(v65, "addObject:", v37);
              }
              v35 = 0;
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            v35 = 0;
            v26 = 0;
          }
          while (v33);
        }

        v27 = v64 + 1;
      }
      while ((id)(v64 + 1) != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v63);
  }
  if (objc_msgSend(v65, "count"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "childInfos"));
    v43 = (char *)objc_msgSend(v42, "indexOfObject:", v7);

    if (v43 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "childInfos"));
      v45 = objc_msgSend(v44, "count");

    }
    else
    {
      v45 = v43 + 1;
    }
    v46 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v59, v65, v45);
    -[CRLCommandGroup addCommand:](v67, "addCommand:", v46);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v47 = v65;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v50)
            objc_enumerationMutation(v47);
          v52 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithFreehandDrawingShapeItem:snappedShapeType:]([_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc], "initWithFreehandDrawingShapeItem:snappedShapeType:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j), -[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:](v66, "p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j), 0));
          -[CRLCommandGroup addCommand:](v67, "addCommand:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      }
      while (v49);
    }

  }
  if (a5)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v53, "addObject:", v7);
    objc_msgSend(v53, "addObjectsFromArray:", v65);
    v54 = objc_retainAutorelease(v53);
    *a5 = v54;

  }
  return v67;
}

- (id)p_strokesByClippingMaskedStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  void *v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "_isMaskedStroke"))
        {
          v11 = objc_alloc((Class)PKDrawing);
          v29 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          v13 = objc_msgSend(v11, "initWithStrokes:", v12);

          objc_msgSend(v13, "_clipMaskedStrokes");
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "strokes", 0));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v21 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j));
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v16);
          }

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)p_freehandDrawingShapeTypeFromDrawingShapeItem:(id)a3 isShapeItemFromOutlineFill:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bezierPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pencilKitStrokePathCompactData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maskPath"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:](self, "p_strokesBySnappingBezierPath:isBezierPathFromOutlineFill:strokePathCompactData:maskPath:stroke:", v8, v4, v9, v10, 0));
  if (v11 && objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = objc_msgSend(v12, "_shapeType");
    if ((unint64_t)v13 >= 0xD)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244F58);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0D1B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244F78);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 307, 0, "Unknown pk shape type");

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return (int64_t)v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
}

@end
