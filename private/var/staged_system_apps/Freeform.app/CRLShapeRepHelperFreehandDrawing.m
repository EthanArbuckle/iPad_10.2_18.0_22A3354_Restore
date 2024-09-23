@implementation CRLShapeRepHelperFreehandDrawing

- (CRLShapeRepHelperFreehandDrawing)initWithShapeRep:(id)a3
{
  id v4;
  CRLShapeRepHelperFreehandDrawing *v5;
  CRLShapeRepHelperFreehandDrawing *v6;
  void *v7;
  uint64_t v8;
  double v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeRepHelperFreehandDrawing;
  v5 = -[CRLShapeRepHelperFreehandDrawing init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeRep, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeLayout"));
    objc_storeWeak((id *)&v6->_shapeLayout, v7);

    *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v8).n128_u64[0];
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeInfo", v9));
    v13 = sub_1002223BC(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_storeWeak((id *)&v6->_shapeInfo, v14);

  }
  return v6;
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (BOOL)hasLegacyFreehandDrawingBrushStroke
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  char v9;
  _BOOL4 v10;
  id WeakRetained;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  CRLShapeLayout **p_shapeLayout;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  uint64_t v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;

  v9 = a5;
  v10 = a4;
  CGContextSaveGState(a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeRep);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));

  v15 = objc_msgSend(v14, "shouldSuppressBackgrounds");
  if (v15 != sub_100411EAC((uint64_t)a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DF00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E346E8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DF20);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperFreehandDrawing drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 77, 0, "Canvas and CGContext disagree about whether we are suppressing backgrounds");

  }
  p_shapeLayout = &self->_shapeLayout;
  v20 = objc_loadWeakRetained((id *)p_shapeLayout);
  objc_msgSend(v20, "pathBounds");
  v22 = v21;
  v24 = v23;

  CGContextTranslateCTM(a3, -v22, -v24);
  if (((!v10 | v15) & 1) == 0)
  {
    v25 = objc_loadWeakRetained((id *)p_shapeLayout);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fill"));

    if (v26 && (objc_msgSend(v26, "isClear") & 1) == 0)
    {
      v27 = objc_loadWeakRetained((id *)p_shapeLayout);
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path")));
      v29 = objc_msgSend(v28, "CGPath");

      v30 = v26;
      if (sub_100411964((uint64_t)a3))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "referenceColor"));
        objc_msgSend(v31, "alphaComponent");
        v33 = objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithWhite:alpha:](CRLColorFill, "colorWithWhite:alpha:", 0.0, v32));

        v30 = (id)v33;
      }
      objc_msgSend(v30, "paintPath:inContext:", v29, a3);

    }
  }
  v34 = objc_loadWeakRetained((id *)p_shapeLayout);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stroke"));

  if (v35)
  {
    v36 = objc_msgSend(v35, "isNullStroke");
    if ((v9 & 1) != 0 && (v36 & 1) == 0)
    {
      v37 = objc_loadWeakRetained((id *)p_shapeLayout);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "pencilKitStrokes"));

      if (v38)
      {
        v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backgroundColor"));
        +[CRLPencilKitInkStroke drawStrokes:inContext:overTransparentCanvas:](CRLPencilKitInkStroke, "drawStrokes:inContext:overTransparentCanvas:", v38, a3, v39 == 0);
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125DF40);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3463C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125DF60);
        v40 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperFreehandDrawing drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperFreehandDrawing.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 105, 0, "invalid nil value for '%{public}s'", "pencilKitStrokes");

        v43 = objc_loadWeakRetained((id *)p_shapeLayout);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "path"));

        v39 = objc_retainAutorelease(v44);
        objc_msgSend(v35, "paintPath:inContext:", objc_msgSend(v39, "CGPath"), a3);
      }

    }
  }
  CGContextRestoreGState(a3);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);
  objc_destroyWeak((id *)&self->_shapeRep);
}

@end
