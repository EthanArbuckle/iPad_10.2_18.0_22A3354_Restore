@implementation CRLBrushStroke

+ (Class)mutableClass
{
  return (Class)objc_opt_class(CRLMutableBrushStroke, a2);
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableBrushStroke *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  CRLMutableBrushStroke *v13;

  v4 = [CRLMutableBrushStroke alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  -[CRLStroke width](self, "width");
  v8 = v7;
  v9 = -[CRLBrushStroke cap](self, "cap");
  v10 = -[CRLStroke join](self, "join");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  -[CRLStroke miterLimit](self, "miterLimit");
  v13 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v4, "initWithName:color:width:cap:join:pattern:miterLimit:", v5, v6, v9, v10, v11, v8, v12);

  return v13;
}

- (CRLBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9
{
  id v16;
  id v17;
  id v18;
  CRLBrushStroke *v19;
  CRLBrushStroke *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CRLBrushStroke;
  v19 = -[CRLSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](&v22, "initWithName:color:width:cap:join:pattern:miterLimit:", v16, v17, a6, a7, v18, a5, a9);
  v20 = v19;
  if (v19)
    -[CRLBrushStroke i_setCap:](v19, "i_setCap:", 1);

  return v20;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  -[CRLStroke width](self, "width");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p strokeName='%@' width=%f>"), v5, self, v6, v7));

  return v8;
}

- (double)lineEndInsetAdjustment
{
  return 0.0;
}

- (double)suggestedMinimumLineWidth
{
  return 8.0;
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

+ (BOOL)brushStrokeUsesMetal
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
  v3 = objc_msgSend(v2, "isMetalCapable");

  return v3;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (unint64_t)cap
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[CRLStroke i_cap](self, "i_cap");
  if (v2 != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32324();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C848);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke cap]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 267, 0, "CRLBrushStroke should only ever have a round cap.");

  }
  return v2;
}

- (void)i_setCap:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStroke;
  -[CRLStroke i_setCap:](&v3, "i_setCap:", 1);
}

- (double)horizontalMarginForSwatch
{
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  double result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLBrushStroke;
  -[CRLStroke horizontalMarginForSwatch](&v8, "horizontalMarginForSwatch");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Pen"));

  result = 7.0;
  if (!v6)
    return v4;
  return result;
}

- (BOOL)p_shouldSplitAtSharpAngles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader storageForBrushStrokeNamed:](CRLBrushStrokeLoader, "storageForBrushStrokeNamed:", v2));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32430();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C888);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldSplitAtSharpAngles]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 290, 0, "invalid nil value for '%{public}s'", "storage");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("split-at-sharp-angles")));

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C8A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E323A4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C8C8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldSplitAtSharpAngles]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 292, 0, "invalid nil value for '%{public}s'", "splitAtSharpAnglesOption");

  }
  v12 = objc_msgSend(v8, "BOOLValue");

  return v12;
}

- (id)strokeLineEnd:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "isNone"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (char *)objc_msgSend(v6, "rangeOfString:", CFSTR(":"));
    if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", &v7[v8]));

      v6 = (void *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader storageForBrushStrokeNamed:](CRLBrushStrokeLoader, "storageForBrushStrokeNamed:", v10));

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C8E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E32548();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C908);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokeLineEnd:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 312, 0, "invalid nil value for '%{public}s'", "storage");

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lineEnds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v6));

    v17 = v16;
    if (!v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C928);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E324BC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C948);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokeLineEnd:]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 314, 0, "invalid nil value for '%{public}s'", "strokedLineEnd");

      v17 = v4;
    }
    v5 = v17;

  }
  return v5;
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  _BOOL4 v8;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  objc_super v24;

  v8 = a8;
  y = a4.y;
  x = a4.x;
  v15 = a3;
  v16 = v15;
  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v18 = (char *)objc_msgSend(v17, "rangeOfString:", CFSTR(":"));
    if (v18 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringFromIndex:", &v18[v19]));

      v21 = objc_claimAutoreleasedReturnValue(+[CRLLineEnd lineEndWithIdentifier:](CRLLineEnd, "lineEndWithIdentifier:", v20));
      v17 = (void *)v20;
      v16 = (void *)v21;
    }
    v24.receiver = self;
    v24.super_class = (Class)CRLBrushStroke;
    -[CRLStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v24, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v16, a7, 1, x, y, a5, a6);

  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(-[CRLBrushStroke strokeLineEnd:](self, "strokeLineEnd:", v15));

    v23.receiver = self;
    v23.super_class = (Class)CRLBrushStroke;
    v16 = (void *)v22;
    -[CRLStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v23, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v22, a7, 0, x, y, a5, a6);
  }

}

- (void)paintPath:(CGPath *)a3 directlyUsingContext:(id)a4 withLayoutOptions:(id)a5
{
  -[CRLBrushStroke p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, 0, a4, 0, 0, a5);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  CRLBrushStrokeLayoutOptions *v15;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a4;
  v15 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
  -[CRLBrushStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, v12, a5, v10, v9, v8, v15);

}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  _BOOL8 v13;
  id v16;
  void *v17;
  id v18;
  objc_super v19;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v13 = a4;
  v16 = a9;
  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)CRLBrushStroke;
    -[CRLStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v19, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", a3, v13, a5, 1, v10, v9);
  }
  else if (-[CRLStroke shouldRender](self, "shouldRender"))
  {
    if (-[CRLBrushStroke p_shouldDrawAsVectorInContext:](self, "p_shouldDrawAsVectorInContext:", a5))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", a3));
      v18 = -[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:", v17, a5, 0, v10, 0, 0, v16);

    }
    else
    {
      -[CRLBrushStroke p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_rasterBrushPath:inContext:orDirectly:parameterized:shouldReverseDrawOrder:withLayoutOptions:", a3, a5, 0, v10, v9, v16);
    }
  }

}

- (id)strokedCopyOfPath:(id)a3
{
  id v4;
  CRLBrushStrokeLayoutOptions *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[CRLStroke shouldRender](self, "shouldRender"))
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C968);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E325D4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C988);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v5 = (CRLBrushStrokeLayoutOptions *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokedCopyOfPath:]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 368, 0, "invalid nil value for '%{public}s'", "inputPath");
      goto LABEL_16;
    }
    if (objc_msgSend(v4, "containsElementsOtherThanMoveAndClose"))
    {
      v5 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:", v4, 0, 0, 0, 0, 0, v5));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:](CRLBezierPathBooleanOperationHelper, "pathByNormalizingPath:", v6));
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:
      v7 = 0;
      goto LABEL_17;
    }
  }
  v7 = 0;
LABEL_18:

  return v7;
}

+ (void)backgroundLoadAllBrushStrokes
{
  +[CRLBrushStrokeLoader backgroundLoadAllBrushStrokes](CRLBrushStrokeLoader, "backgroundLoadAllBrushStrokes");
}

- (id)p_brushPath:(id)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double x;
  double y;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  BOOL v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  char *v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id v89;
  id v90;
  uint64_t v91;
  unsigned int v93;
  id v94;
  id v95[3];
  CGPoint v96;
  uint64_t v97;
  CGAffineTransform v98;
  double v99[6];
  uint8_t buf[4];
  unsigned int v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  CGPoint v108;
  CGPoint v109;
  double v110;
  double v111;
  CGPoint v112;

  v9 = a7;
  v10 = a6;
  v12 = a3;
  v90 = a5;
  v94 = a9;
  v83 = v10;
  if (v10 && !v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C9A8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      sub_100E32878();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C9C8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DFE1F8(v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 395, 0, "Parameterized strokes must draw rasterized.");

  }
  if (v94)
    v18 = !v9;
  else
    v18 = 1;
  if (!v18 && (objc_msgSend(v94, "strokeEnd"), v19 <= 0.0) || (objc_msgSend(v12, "length"), v20 == 0.0))
  {
    v21 = 0;
    goto LABEL_110;
  }
  if (v83)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bezierPathByFlatteningPathWithFlatness:", 0.1));

    if (objc_msgSend(v22, "isEffectivelyClosed")
      && (objc_msgSend(v22, "isClockwise") & 1) == 0)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bezierPathByReversingPath"));

      v12 = (id)v23;
    }
    else
    {
      v12 = v22;
    }
  }
  if (v90)
  {
    objc_msgSend(v90, "transform");
    v24 = sub_10007922C(v99);
    objc_msgSend(v90, "contentsScale");
LABEL_26:
    v26 = v24 / v25;
    goto LABEL_27;
  }
  if (a4)
  {
    if (!-[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:"))
    {
      CGContextGetCTM(&v98, a4);
      v24 = sub_10007922C(&v98.a);
      v25 = sub_1004121D0((uint64_t)a4);
      goto LABEL_26;
    }
    v26 = 3.0;
  }
  else
  {
    v26 = 1.0;
  }
LABEL_27:
  v87 = v26;
  if (v9)
    operator new();
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v27, "setWindingRule:", 0);
  v28 = objc_msgSend(v12, "copy");
  v89 = v27;

  -[CRLStroke width](self, "width");
  objc_msgSend(v28, "setLineWidth:");
  -[CRLStroke miterLimit](self, "miterLimit");
  objc_msgSend(v28, "setMiterLimit:");
  v12 = v28;
  v97 = 0;
  objc_msgSend(v28, "length");
  v30 = v29;
  v93 = -[CRLBrushStroke p_shouldSplitAtSharpAngles](self, "p_shouldSplitAtSharpAngles");
  x = CGPointZero.x;
  y = CGPointZero.y;
  v96 = CGPointZero;
  v33 = (uint64_t)objc_msgSend(v28, "elementCount");
  v95[0] = 0;
  v95[1] = (id)1;
  v95[2] = 0;
  if (v33 >= 1)
  {
    v91 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0.0;
    v37 = 0.0;
    while (1)
    {
      v38 = v37;
      v39 = objc_msgSend(v12, "elementAtIndex:associatedPoints:", v35, &v109);
      objc_msgSend(v12, "lengthOfElement:", v35);
      v41 = v40 / v30;
      v37 = v37 + v41;
      if (v39 == (id)3)
      {
        v109 = v96;
      }
      else
      {
        if (v39 == (id)2)
        {
          if (v93)
          {
            v84 = x;
            v85 = v36;
            v42 = y;
            v86 = v38 + v41;
            v43 = v108.x;
            v44 = sub_1000603B8(v109.x, v109.y, v108.x);
            v46 = v45;
            v47 = sub_100061070(v44, v45);
            if (v47 >= 1.0)
            {
              v50 = sub_1000603DC(v44, v46, 1.0 / v47);
            }
            else
            {
              v48 = sub_1000603B8(v110, v111, v43);
              v50 = sub_100060398(v48, v49);
            }
            if (v35 < 2)
            {
              v38 = v85;
              v37 = v86;
            }
            else if (sub_1000603C4(v84, v42, v50, v51) < 0.99)
            {
              v37 = v86;
              if ((uint64_t)(v35 - 1 - v34) < 1 || v38 - v85 <= 0.0)
              {
                v38 = v85;
              }
              else
              {
                -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v35 - v34, v27, 0, &v97, v85, v38 - v85, v87, v94, v91, v95);
                v34 = v35 - 1;
              }
            }
            else
            {
              v38 = v85;
              v37 = v86;
            }
            v64 = sub_1000603B8(v112.x, v112.y, v110);
            x = sub_100060398(v64, v65);
            y = v66;
            v36 = v38;
          }
          v108 = v112;
          goto LABEL_74;
        }
        if (!v39)
        {
          if ((uint64_t)(v35 - v34) >= 1)
          {
            if (-[CRLBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
            {
              v97 = 0;
            }
            else
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "patternOffsetsBySubpath"));
              v58 = v57 == 0;

              if (!v58)
              {
                v59 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10125C9E8);
                v60 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  v101 = v59;
                  v102 = 2082;
                  v103 = "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDra"
                         "wOrder:withLayoutOptions:]";
                  v104 = 2082;
                  v105 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
                  v106 = 1024;
                  v107 = 478;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.", buf, 0x22u);
                }

                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10125CA08);
                v61 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
                {
                  v67 = (char *)(id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  v101 = v59;
                  v102 = 2114;
                  v103 = v67;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 478, 0, "If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.");

              }
            }
            -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v35 - v34, v27, v36, v37 - v36, v87, v94, v91++, v95);
            v36 = v37;
            v34 = v35;
          }
          v108 = v109;
          v96 = v109;
          goto LABEL_74;
        }
      }
      if (!v93)
        break;
      v52 = sub_1000603B8(v109.x, v109.y, v108.x);
      v55 = sub_100060398(v52, v53);
      v56 = v54;
      if (v35 < 2 || sub_1000603C4(x, y, v55, v54) >= 0.99 || (uint64_t)(v35 - 1 - v34) < 1 || v38 - v36 <= 0.0)
        goto LABEL_48;
      -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v35 - v34, v27, 0, &v97, v36, v38 - v36, v87, v94, v91, v95);
      v34 = v35 - 1;
LABEL_49:
      v108 = v109;
      x = v55;
      y = v56;
      v36 = v38;
LABEL_74:
      if (++v35 == v33)
        goto LABEL_80;
    }
    v55 = x;
    v56 = y;
LABEL_48:
    v38 = v36;
    goto LABEL_49;
  }
  v33 = 0;
  v34 = 0;
  v91 = 0;
  v37 = 0.0;
  v36 = 0.0;
LABEL_80:
  v68 = v33 + ~v34;
  if (v68 >= 1)
  {
    if (-[CRLBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
    {
      v97 = 0;
    }
    else
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "patternOffsetsBySubpath"));
      v70 = v69 == 0;

      if (!v70)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CA28);
        v71 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR))
          sub_100E327F8();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CA48);
        v72 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DFE1F8(v73);
        }

        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v74, v75, 552, 0, "If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.");

      }
    }
    -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v68, v27, v36, v37 - v36, v87, v94, v91, v95);
  }
  if (a4)
  {
    v76 = v27;
    if (!v27)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CAE8);
      v77 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR))
        sub_100E3276C();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CB08);
      v78 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v79, v80, 577, 0, "invalid nil value for '%{public}s'", "resultPath");

      v76 = 0;
    }
    CGContextAddPath(a4, (CGPathRef)objc_msgSend(objc_retainAutorelease(v76), "CGPath"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v81, "CGColor"));

    CGContextFillPath(a4);
  }
  v21 = v89;

LABEL_110:
  return v21;
}

- (void)p_brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 intoPath:(id)a6 orIntoVector:(void *)a7 sectionIndex:(unint64_t *)a8 viewScale:(double)a9 withLayoutOptions:(id)a10 currentSubpathIndex:(unint64_t)a11 cachedCurrentElementPercentage:(id *)a12
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  const __CFString *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  unint64_t v73;
  void *v74;
  BOOL v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  double v86;
  unint64_t v87;
  unint64_t v88;
  unsigned int v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  void *v99;
  unsigned int v100;
  double v101;
  double v102;
  unint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v109;
  uint8_t buf[4];
  unsigned int v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  int v117;
  __int16 v118;
  id v119;
  __int16 v120;
  unint64_t v121;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v20 = a3;
  v109 = a6;
  v21 = a10;
  if ((uint64_t)objc_msgSend(v20, "elementCount") >= 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
    v101 = var0;
    if (v22)
    {
      v23 = -[CRLBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth");

      if ((v23 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CB28);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E32984();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CB48);
        v24 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 592, 0, "We only know how to adjust the pattern of constant width layout brush strokes.");

      }
    }
    -[CRLStroke width](self, "width");
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v102 = v28;
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader storageForBrushStrokeNamed:](CRLBrushStrokeLoader, "storageForBrushStrokeNamed:", v29));

    v30 = v104;
    if (!v104)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CB68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E328F8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CB88);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 597, 0, "invalid nil value for '%{public}s'", "storage");

      v30 = 0;
    }
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "paths"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bounds"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKey:", CFSTR("middle")));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKey:", CFSTR("start")));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKey:", CFSTR("end")));
      v36 = v35 != 0;

    }
    else
    {
      v36 = 0;
    }

    v37 = 5.0;
    v38 = v28;
    if (v28 >= 5.0)
    {
      v42 = CFSTR("middle");
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKey:", CFSTR("small"), 5.0, v28));
      v40 = v39;
      if (v39)
      {
        v41 = v39;

        v36 = 0;
        v42 = CFSTR("small");
        v106 = v41;
      }
      else
      {
        v42 = CFSTR("middle");
      }

    }
    objc_msgSend(v20, "length", v37, v38);
    v44 = v43;
    v45 = v101 + var1;
    if (v36)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("start")));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastObject"));
      objc_msgSend(v47, "CGRectValue");
      v49 = v48;
      v51 = v50;

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("end")));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastObject"));
      objc_msgSend(v53, "CGRectValue");
      v55 = v54;
      v57 = v56;

      v58 = v49 / v51;
      v59 = var1 * v44 * 0.5;
      v60 = v101 + fmin(v102 * v58, v59) / v44;
      -[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", CFSTR("start"), 0, v20, location, length, v109, a9, a7, a12);
      v61 = v45 - fmin(v102 * (v55 / v57), v59) / v44;
      -[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", CFSTR("end"), 0, v20, location, length, v109, a9, v61, v45, 0.0, 1.0, a7, a12);
      v45 = v61;
    }
    else
    {
      v60 = v101;
    }
    v62 = (unint64_t)objc_msgSend(v106, "count");
    if (!v62 || v45 <= v60)
      goto LABEL_79;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", v42));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "lastObject"));
    objc_msgSend(v64, "CGRectValue");
    v66 = v65;
    v68 = v67;

    v69 = v66 / v68;
    v70 = v45 - v60;
    v71 = v44 * (v45 - v60);
    v72 = v102 * v69;
    v73 = (unint64_t)(v71 / (v102 * v69) + 1.0);
    if (v62 <= 1)
      v73 = 1;
    v103 = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
    v75 = v74 == 0;

    if (v75)
    {
      v81 = 0.0;
LABEL_56:
      if (-[CRLBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth"))
      {
        v86 = v70 * (v72 / v71);
        if (v81 > 0.0 && v81 > v86)
        {
          v87 = *a8;
          do
          {
            v81 = v81 - v86;
            v88 = (1664525 * v87 + 1013904223);
            if (v88 % v62 == v87 % v62)
              v87 = v88 + 1;
            else
              v87 = (1664525 * v87 + 1013904223);
          }
          while (v81 > 0.0 && v81 > v86);
          *a8 = v87;
        }
      }
      else
      {
        v86 = v70 / (double)v103;
      }
      if (vabdd_f64(v60, v45) > 0.00000999999975)
      {
        do
        {
          v89 = -[CRLBrushStroke p_isFreehandDrawingStrokeWithFixedTileWidth](self, "p_isFreehandDrawingStrokeWithFixedTileWidth");
          v90 = fmin(v45, v86 + v60);
          v91 = 1.0;
          v92 = 0.0;
          if (v89)
          {
            if (v81 > 0.0)
            {
              v93 = v81 / v86;
              v81 = 0.0;
              v92 = v93 + 0.0;
            }
            v94 = v90 - v60;
            v95 = v86 * (1.0 - v92);
            if (v90 - v60 <= v95)
            {
              if (v90 - v60 < v95)
                v91 = 1.0 - (v95 - v94) / v86;
            }
            else
            {
              v90 = v90 - (v94 - v95);
            }
          }
          -[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v42, *a8 % v62, v20, location, length, v109, a9, v60, v90, v92, v91, a7, a12);
          v96 = 1664525 * *a8 + 1013904223;
          if (v96 % v62 == *a8 % v62)
            v97 = v96 + 1;
          else
            v97 = 1664525 * *a8 + 1013904223;
          *a8 = v97;
          v60 = v90;
        }
        while (vabdd_f64(v90, v45) > 0.00000999999975);
      }
LABEL_79:

      goto LABEL_80;
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
    v77 = (unint64_t)objc_msgSend(v76, "count") > a11;

    if (v77)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", a11));
      objc_msgSend(v79, "crl_CGFloatValue");
    }
    else
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
      v83 = objc_msgSend(v82, "count") == (id)1;

      if (!v83)
      {
        v100 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CBA8);
        v84 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_ERROR))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
          *(_DWORD *)buf = 67110402;
          v111 = v100;
          v112 = 2082;
          v113 = "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:wi"
                 "thLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]";
          v114 = 2082;
          v115 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
          v116 = 1024;
          v117 = 702;
          v118 = 2048;
          v119 = objc_msgSend(v99, "count");
          v120 = 2048;
          v121 = a11;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v84, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not enough pattern offsets for each subpath. Got %zi for index %zi", buf, 0x36u);

        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CBC8);
        v85 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 702, 0, "Not enough pattern offsets for each subpath. Got %zi for index %zi", objc_msgSend(v98, "count"), a11);

        v81 = 0.0;
        goto LABEL_55;
      }
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "patternOffsetsBySubpath"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v79, "crl_CGFloatValue");
    }
    v81 = v80 / v44;
LABEL_55:

    goto LABEL_56;
  }
LABEL_80:

}

- (void)p_brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 intoPath:(id)a7 orIntoVector:(void *)a8 viewScale:(double)a9 strokeTileLayout:(id)a10 cachedCurrentElementPercentage:(id *)a11
{
  NSUInteger length;
  NSUInteger location;
  double var3;
  double var2;
  double var1;
  double var0;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;

  length = a6.length;
  location = a6.location;
  var3 = a10.var3;
  var2 = a10.var2;
  var1 = a10.var1;
  var0 = a10.var0;
  v39 = a3;
  v40 = a5;
  v22 = a7;
  v38 = v22;
  if (a8)
  {
    if (v22)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CBE8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E32B10();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CC08);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 759, 0, "expected nil value for '%{public}s'", "resultPath");

    }
    -[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v39, a4, v40, location, length, a8, a9, var0, var1, var2, var3, a11);
  }
  else
  {
    if (v22)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader storageForBrushStrokeNamed:](CRLBrushStrokeLoader, "storageForBrushStrokeNamed:", v26));

      if (!v27)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CC28);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E32A84();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CC48);
        v28 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 763, 0, "invalid nil value for '%{public}s'", "storage");

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "paths"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v39));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", a4));

      -[CRLStroke width](self, "width");
      if (v34 < 15.0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pathWithPossibleSmoothing"));
        v35 = v38;
      }
      else
      {
        v35 = v38;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "originalPath"));
      }
      objc_msgSend(v36, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v40, location, length, v35, var0, var1 - var0);

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CC68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E32A04();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CC88);
      v37 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v31, 769, 0, "resultPath and resultVector are both nil!");
    }

  }
}

- (void)p_rasterBrushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  objc_super v20;
  CGAffineTransform v21;

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a8;
  if (v14)
    objc_msgSend(v14, "transform");
  else
    CGContextGetCTM(&v21, a4);
  v16 = sqrt(v21.b * v21.b + v21.a * v21.a);
  if (a4
    && -[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:", a4))
  {
    v16 = 3.0;
  }
  if (v14 || v10 || (-[CRLStroke width](self, "width"), v17 > 0.5 / v16))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", a3));
    v19 = -[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:](self, "p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:", v18, a4, v14, v10, 1, v9, v15);

  }
  else if (a4)
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLBrushStroke;
    -[CRLStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v20, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", a3, 0, a4, 0, 0, 0);
  }

}

- (void)p_rasterRenderSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 into:(void *)a7 viewScale:(double)a8 strokeTileLayout:(id)a9 cachedCurrentElementPercentage:(id *)a10
{
  NSUInteger length;
  int64_t location;
  double var3;
  int64_t v16;
  double v17;
  double v18;
  int64_t v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat y;
  char *v26;
  char *v27;
  char *v28;
  double v29;
  id v30;
  unint64_t v31;
  double v32;
  double v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double *v39;
  double v40;
  char *v42;
  char *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  double *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  double *v90;
  double *v91;
  id v92;
  id v93;
  double *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  uint64_t v108;
  float v109;
  uint64_t v110;
  double v111;
  double v112;
  double *v113;
  float v114;
  uint64_t v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  uint64_t v136;
  double *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  double v148;
  double v149;
  float *v150;
  double *v151;
  float v152;
  double v153;
  double v154;
  _OWORD *v155;
  uint64_t v156;
  BOOL v157;
  _OWORD *v158;
  unint64_t v159;
  __int128 v160;
  _OWORD *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  __int128 v169;
  char *v170;
  char *v171;
  __int128 v172;
  unsigned __int8 v173;
  double v174;
  double v176;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  unsigned __int8 v188;
  int v189;
  unsigned int v190;
  void *v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  uint64_t v200;
  double v201;
  float v202;
  float v203;
  float v204;
  float v205;
  double v206;
  double v207;
  double v208;
  double v209;
  float v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  _QWORD *v216;
  uint64_t v217;
  double v218;
  double v219;
  uint64_t v220;
  double v221;
  double v222;
  double *v223;
  double *v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  long double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  unint64_t v264;
  char *v265;
  float v266;
  float v267;
  float v268;
  double v269;
  float v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  unint64_t v274;
  char *v275;
  float *v276;
  char *v277;
  char *v278;
  float *v279;
  __int128 v280;
  char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v285;
  char *v286;
  float *v287;
  char *v288;
  char *v289;
  float *v290;
  __int128 v291;
  float v292;
  double v293;
  float v294;
  unint64_t v295;
  char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  unint64_t v300;
  char *v301;
  float *v302;
  char *v303;
  char *v304;
  float *v305;
  __int128 v306;
  float v307;
  double v308;
  float v309;
  char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  unint64_t v314;
  char *v315;
  float *v316;
  char *v317;
  char *v318;
  float *v319;
  __int128 v320;
  float v321;
  double v322;
  float v323;
  unint64_t v324;
  char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  unint64_t v329;
  char *v330;
  float *v331;
  char *v332;
  char *v333;
  float *v334;
  __int128 v335;
  void *v336;
  id v337;
  double v338;
  double v339;
  double v340;
  int64_t v341;
  double v342;
  double v343;
  double v344;
  double v346;
  double v347;
  unint64_t v348;
  double var2;
  double var1;
  double var0;
  int64_t v353;
  double v354;
  float v355;
  float v356;
  double v357;
  double v358;
  void *v359;
  double v360;
  double v361;
  float v362;
  double v363;
  float v364;
  CGFloat x;
  id v366;
  int v367;
  id v368;
  int v369;
  id v370;
  double *__p;
  char *v372;
  char *v373;
  CGAffineTransform v374;
  CGAffineTransform v375;
  double v376;
  double v377;
  _BYTE buf[48];
  _OWORD v379[3];
  CGRect v380;

  length = a6.length;
  location = a6.location;
  var3 = a9.var3;
  var2 = a9.var2;
  var1 = a9.var1;
  var0 = a9.var0;
  v337 = a3;
  v370 = a5;
  v16 = location + length;
  while (location < (uint64_t)objc_msgSend(v370, "elementCount"))
  {
    objc_msgSend(v370, "lengthOfElement:", location);
    if (v17 != 0.0)
      break;
    ++location;
  }
  while (v16 > location)
  {
    objc_msgSend(v370, "lengthOfElement:", v16);
    if (v18 != 0.0)
      break;
    --v16;
  }
  if (v16 < location)
    goto LABEL_293;
  v377 = 0.0;
  v376 = 0.0;
  v353 = -[CRLBrushStroke p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:](self, "p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:", &v377, v370, a10, var0);
  v19 = -[CRLBrushStroke p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:](self, "p_fastElementPercentage:forOverallPercentage:onPath:withCachedCurrentElementPercentage:", &v376, v370, a10, var1);
  if (v353 < location)
  {
    v377 = 0.0;
    v353 = location;
  }
  if (v19 > v16)
  {
    v376 = 1.0;
    v19 = v16;
  }
  if (v19 > v353)
  {
    if (v377 == 1.0 || fabs(v377 + -1.0) < 0.000000999999997)
    {
      v377 = 0.0;
      ++v353;
    }
    v20 = v376;
    if (v376 == 0.0)
    {
      v376 = 1.0;
      --v19;
    }
  }
  v341 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath", v20));
  objc_msgSend(v21, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v370, v353, v341, 0, v377, v376);
  CGAffineTransformMakeScale(&v375, a8, a8);
  objc_msgSend(v21, "transformUsingAffineTransform:", &v375);
  v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bezierPathByFlatteningPathWithFlatness:", 0.1));

  CGAffineTransformMakeScale(&v374, 1.0 / a8, 1.0 / a8);
  objc_msgSend(v359, "transformUsingAffineTransform:", &v374);
  -[CRLStroke width](self, "width");
  v22 = 0.5 / a8;
  if (v23 > 0.5 / a8)
  {
    -[CRLStroke width](self, "width");
    v22 = v24;
  }
  v338 = 1.0 / a8;
  v339 = v22;
  __p = 0;
  v372 = 0;
  v373 = 0;
  y = CGPointZero.y;
  x = CGPointZero.x;
  v26 = (char *)objc_msgSend(v359, "elementCount");
  v27 = v26;
  v357 = var3;
  v360 = a8;
  if (v26)
  {
    v28 = 0;
    *(_QWORD *)&v354 = v26 - 1;
    v29 = 1.0;
    do
    {
      v379[0] = xmmword_100EEC438;
      v379[1] = xmmword_100EEC438;
      v379[2] = xmmword_100EEC438;
      v30 = objc_msgSend(v359, "elementAtIndex:associatedPoints:", v28, v379);
      v31 = (unint64_t)v30;
      v32 = *((double *)v379 + 1);
      v33 = *(double *)v379;
      if (!v30)
      {
LABEL_43:
        v42 = v372;
        if (v372 >= v373)
        {
          v84 = __p;
          v85 = (v372 - (char *)__p) >> 4;
          v86 = v85 + 1;
          if ((unint64_t)(v85 + 1) >> 60)
            sub_100007810();
          v87 = v373 - (char *)__p;
          if ((v373 - (char *)__p) >> 3 > v86)
            v86 = v87 >> 3;
          if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF0)
            v88 = 0xFFFFFFFFFFFFFFFLL;
          else
            v88 = v86;
          if (v88)
          {
            v89 = (char *)sub_10001FB2C((uint64_t)&v373, v88);
            v84 = __p;
            v42 = v372;
          }
          else
          {
            v89 = 0;
          }
          v90 = (double *)&v89[16 * v85];
          *v90 = v33;
          v90[1] = v32;
          v91 = v90;
          if (v42 != (char *)v84)
          {
            do
            {
              *((_OWORD *)v91 - 1) = *((_OWORD *)v42 - 1);
              v91 -= 2;
              v42 -= 16;
            }
            while (v42 != (char *)v84);
            v84 = __p;
          }
          v43 = (char *)(v90 + 2);
          __p = v91;
          v373 = &v89[16 * v88];
          if (v84)
            operator delete(v84);
        }
        else
        {
          *(double *)v372 = v33;
          *((double *)v372 + 1) = v32;
          v43 = v372 + 16;
        }
        v372 = v43;
        goto LABEL_96;
      }
      if (v30 != (id)1)
      {
        if (v30 == (id)3)
          goto LABEL_36;
        v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CCA8);
        v35 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v34;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewSca"
                                "le:strokeTileLayout:cachedCurrentElementPercentage:]";
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 867;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path should be flat by now.", buf, 0x22u);
        }

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125CCC8);
        v36 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          v92 = (id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v34;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v92;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 867, 0, "Path should be flat by now.");

        if (!v31)
          goto LABEL_43;
        if (v31 == 3)
        {
LABEL_36:
          v32 = y;
          v33 = x;
        }
      }
      v39 = (double *)v372;
      v40 = sub_10006010C(v33, v32, *((double *)v372 - 2), *((double *)v372 - 1)) * a8 * a8;
      if (v40 > 0.000000999999997 && v40 <= v29)
      {
        if (v28 == *(char **)&v354)
          goto LABEL_48;
        *(_OWORD *)buf = xmmword_100EEC438;
        *(_OWORD *)&buf[16] = xmmword_100EEC438;
        *(_OWORD *)&buf[32] = xmmword_100EEC438;
        if (!objc_msgSend(v359, "elementAtIndex:associatedPoints:", v28 + 1, buf))
        {
          v32 = y;
          v33 = x;
          a8 = v360;
          goto LABEL_96;
        }
        v39 = (double *)v372;
        v44 = *(double *)buf;
        v45 = *(double *)&buf[8];
        v46 = sub_1000603B8(v33, v32, *((double *)v372 - 2));
        v48 = sub_100060398(v46, v47);
        v50 = v49;
        v51 = v45;
        var3 = v357;
        v52 = sub_1000603B8(v44, v51, v33);
        v54 = sub_100060398(v52, v53);
        v55 = v48;
        v29 = 1.0;
        v57 = sub_1000603C4(v55, v50, v54, v56);
        a8 = v360;
        if (v57 < 0.99)
        {
LABEL_48:
          if ((v31 | 2) != 3)
          {
            v58 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125CCE8);
            v59 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v58;
              *(_WORD *)&buf[8] = 2082;
              *(_QWORD *)&buf[10] = "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:vie"
                                    "wScale:strokeTileLayout:cachedCurrentElementPercentage:]";
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = 910;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should only have line and close elements by now.", buf, 0x22u);
            }

            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125CD08);
            v60 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
            {
              v93 = (id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v58;
              *(_WORD *)&buf[8] = 2114;
              *(_QWORD *)&buf[10] = v93;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v61, v62, 910, 0, "Should only have line and close elements by now.");

            v39 = (double *)v372;
          }
          v63 = sqrt(v40) / 50.0;
          if (v63 < v29)
            v63 = v29;
          v64 = (uint64_t)v63;
          if ((uint64_t)v63 >= 1)
          {
            v65 = *(v39 - 2);
            v66 = *(v39 - 1);
            v67 = sub_1000603B8(v33, v32, v65);
            v69 = v68;
            v70 = 0;
            do
            {
              v71 = sub_1000603DC(v67, v69, (double)++v70 / (double)v64);
              v72 = sub_1000603D0(v65, v66, v71);
              v74 = v72;
              v75 = v73;
              if (v39 >= (double *)v373)
              {
                v76 = __p;
                v77 = ((char *)v39 - (char *)__p) >> 4;
                v78 = v77 + 1;
                if ((unint64_t)(v77 + 1) >> 60)
                  sub_100007810();
                v79 = v373 - (char *)__p;
                if ((v373 - (char *)__p) >> 3 > v78)
                  v78 = v79 >> 3;
                if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF0)
                  v80 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v80 = v78;
                if (v80)
                {
                  v81 = (char *)sub_10001FB2C((uint64_t)&v373, v80);
                  v76 = __p;
                  v39 = (double *)v372;
                }
                else
                {
                  v81 = 0;
                }
                v82 = &v81[16 * v77];
                *(double *)v82 = v74;
                *((_QWORD *)v82 + 1) = v75;
                v83 = v82;
                if (v39 != v76)
                {
                  do
                  {
                    *((_OWORD *)v83 - 1) = *((_OWORD *)v39 - 1);
                    v83 -= 16;
                    v39 -= 2;
                  }
                  while (v39 != v76);
                  v76 = __p;
                }
                v39 = (double *)(v82 + 16);
                __p = (double *)v83;
                v373 = &v81[16 * v80];
                if (v76)
                  operator delete(v76);
              }
              else
              {
                *v39 = v72;
                *((_QWORD *)v39 + 1) = v73;
                v39 += 2;
              }
              v372 = (char *)v39;
            }
            while (v70 != v64);
            v32 = y;
            v33 = x;
            var3 = v357;
            a8 = v360;
            v29 = 1.0;
            goto LABEL_96;
          }
        }
      }
      else if (v40 > v29)
      {
        goto LABEL_48;
      }
      v32 = y;
      v33 = x;
LABEL_96:
      ++v28;
      x = v33;
      y = v32;
    }
    while (v28 != v27);
  }
  v94 = __p;
  v95 = v372 - (char *)__p;
  if ((unint64_t)(v372 - (char *)__p) >= 0x20)
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v336 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBrushStrokeLoader storageForBrushStrokeNamed:](CRLBrushStrokeLoader, "storageForBrushStrokeNamed:", v96));

    v97 = v336;
    if (!v336)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CD28);
      v98 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v98, OS_LOG_TYPE_ERROR))
        sub_100E32C28();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CD48);
      v99 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v99, OS_LOG_TYPE_ERROR))
      {
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DFE1F8(v100);
      }

      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v101, v102, 928, 0, "invalid nil value for '%{public}s'", "storage");

      v97 = 0;
    }
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "textureIndices"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", v337));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectAtIndexedSubscript:", a4));
    v368 = objc_msgSend(v105, "unsignedIntegerValue");

    v366 = objc_msgSend(v336, "totalSectionCount");
    LODWORD(v105) = (int)log2(64.0) - 1;
    v106 = log2((v339 + v339) * a8);
    v107 = 1.0;
    v108 = v95 >> 4;
    v109 = (float)((int)v105 - (int)sub_1003C65EC(ceil(v106), 1.0, (double)(int)v105));
    v355 = exp2f(-v109);
    v362 = v109;
    LODWORD(v354) = exp2f(-(float)(v109 + 1.0));
    v348 = v95 >> 4;
    v110 = (v95 >> 4) - 1;
    if (v108 == 1)
    {
      v114 = 0.0;
    }
    else
    {
      v111 = *__p;
      v112 = __p[1];
      v113 = __p + 3;
      v114 = 0.0;
      v115 = v108 - 1;
      do
      {
        v116 = *(v113 - 1);
        v117 = *v113;
        v114 = sub_10006108C(v116, *v113, v111, v112) + v114;
        v113 += 2;
        v112 = v117;
        v111 = v116;
        --v115;
      }
      while (v115);
    }
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v336, "paths"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", v337));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectAtIndexedSubscript:", a4));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "originalPath"));

    if (!v121)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CD68);
      v122 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v122, OS_LOG_TYPE_ERROR))
        sub_100E32B9C();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125CD88);
      v123 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v123, OS_LOG_TYPE_ERROR))
      {
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DFE1F8(v124);
      }

      v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"));
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v118, v125, 985, 0, "invalid nil value for '%{public}s'", "originalPathForSection");

    }
    objc_msgSend(v121, "bounds");
    v126 = v114 / (var3 - var2);
    v127 = fmin(v380.origin.x, 0.0);
    v128 = fmax(CGRectGetMaxX(v380), 1.0) + -1.0;
    if (var2 >= 0.001)
    {
      var2 = (var2 - v127) / (1.0 - v127 + v128);
    }
    else
    {
      v129 = *__p;
      v130 = __p[1];
      v131 = sub_1000603B8(*__p, v130, __p[2]);
      v133 = sub_100060398(v131, v132);
      v135 = sub_1000603DC(v133, v134, v126 * -v127);
      *__p = sub_1000603D0(v129, v130, v135);
      *((_QWORD *)__p + 1) = v136;
    }
    if (v357 <= 0.999)
    {
      v146 = (v357 - v127) / (1.0 - v127 + v128);
    }
    else
    {
      v137 = &__p[2 * v110];
      v138 = *v137;
      v139 = v137[1];
      v140 = sub_1000603B8(*v137, v139, __p[2 * v348 - 4]);
      v142 = sub_100060398(v140, v141);
      v144 = sub_1000603DC(v142, v143, v128 * v126);
      *v137 = sub_1000603D0(v138, v139, v144);
      *((_QWORD *)v137 + 1) = v145;
      v146 = v357;
    }

    sub_100424358(v379, v348);
    v147 = *(_QWORD *)&v379[0];
    **(_DWORD **)&v379[0] = 0;
    if (v110)
    {
      v148 = *__p;
      v149 = __p[1];
      v150 = (float *)(v147 + 4);
      v151 = __p + 3;
      v152 = 0.0;
      do
      {
        v153 = *(v151 - 1);
        v154 = *v151;
        v152 = sub_10006108C(v153, *v151, v148, v149) + v152;
        *v150++ = v152;
        v151 += 2;
        v149 = v154;
        v148 = v153;
        --v110;
      }
      while (v110);
    }
    else
    {
      v152 = 0.0;
    }
    v155 = (_OWORD *)*((_QWORD *)a7 + 1);
    v156 = (uint64_t)v155 - *(_QWORD *)a7;
    v157 = v155 != *(_OWORD **)a7;
    if (v155 != *(_OWORD **)a7)
    {
      v158 = v155 - 2;
      v159 = *((_QWORD *)a7 + 2);
      if ((unint64_t)v155 >= v159)
      {
        v162 = v156 >> 5;
        v163 = (v156 >> 5) + 1;
        if (v163 >> 59)
          sub_100007810();
        v164 = v159 - *(_QWORD *)a7;
        if (v164 >> 4 > v163)
          v163 = v164 >> 4;
        if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFE0)
          v165 = 0x7FFFFFFFFFFFFFFLL;
        else
          v165 = v163;
        if (v165)
          v166 = (char *)sub_100134CDC((uint64_t)a7 + 16, v165);
        else
          v166 = 0;
        v167 = &v166[32 * v162];
        v168 = &v166[32 * v165];
        v169 = v158[1];
        *(_OWORD *)v167 = *v158;
        *((_OWORD *)v167 + 1) = v169;
        v161 = v167 + 32;
        v171 = *(char **)a7;
        v170 = (char *)*((_QWORD *)a7 + 1);
        if (v170 != *(char **)a7)
        {
          do
          {
            v172 = *((_OWORD *)v170 - 1);
            *((_OWORD *)v167 - 2) = *((_OWORD *)v170 - 2);
            *((_OWORD *)v167 - 1) = v172;
            v167 -= 32;
            v170 -= 32;
          }
          while (v170 != v171);
          v170 = *(char **)a7;
        }
        *(_QWORD *)a7 = v167;
        *((_QWORD *)a7 + 1) = v161;
        *((_QWORD *)a7 + 2) = v168;
        if (v170)
          operator delete(v170);
      }
      else
      {
        v160 = *(v155 - 1);
        *v155 = *v158;
        v155[1] = v160;
        v161 = v155 + 2;
      }
      *((_QWORD *)a7 + 1) = v161;
    }
    v173 = -[CRLBrushStroke p_shouldSplitAtSharpAngles](self, "p_shouldSplitAtSharpAngles");
    v174 = v377;
    if ((v173 & 1) != 0)
    {
      if (v377 > 0.99 && v353 < v16)
      {
        ++v353;
        v377 = 0.0;
        v174 = 0.0;
      }
      v176 = v376;
      if (v376 < 0.01 && v341 > location)
      {
        --v341;
        v376 = 1.0;
      }
    }
    else
    {
      if (v377 < 0.01 && v353 > location)
      {
        --v353;
        v377 = 1.0;
        v174 = 1.0;
      }
      v176 = v376;
      if (v376 > 0.99 && v341 < v16)
      {
        ++v341;
        v376 = 0.0;
      }
    }
    v180 = *__p;
    v181 = __p[1];
    objc_msgSend(v370, "gradientAt:fromElement:", v353, v174, v176);
    v346 = sub_1000603B8(v180, v181, v182);
    v183 = *((double *)v372 - 2);
    v184 = *((double *)v372 - 1);
    objc_msgSend(v370, "gradientAt:fromElement:", v341, v376);
    v344 = sub_1000603D0(v183, v184, v185);
    v343 = v186;
    v187 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v188 = objc_msgSend(v187, "isEqualToString:", CFSTR("Basic"));
    v358 = v146;
    if ((v188 & 1) != 0)
    {
      v189 = 0;
    }
    else
    {
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
      if ((objc_msgSend(v121, "isEqualToString:", CFSTR("Basic Rounded")) & 1) != 0)
      {
        v189 = 0;
      }
      else
      {
        v118 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
        if ((objc_msgSend(v118, "isEqualToString:", CFSTR("Basic Square")) & 1) == 0)
        {

          v191 = v336;
          goto LABEL_191;
        }
        v189 = 1;
      }
    }
    v190 = objc_msgSend(v370, "isEffectivelyClosed");
    if (v189)

    if ((v188 & 1) != 0)
    {

      v191 = v336;
      if (!v190)
      {
LABEL_191:
        v200 = 0;
        v201 = 4.0 * v362;
        v202 = 4.0 * 4.0 + 64.0;
        v203 = v201 + (v107 - v355) * 64.0;
        *(float *)&v201 = v201 + (v107 - *(float *)&v354) * 64.0;
        v204 = 1.0 - (float)(v203 / v202);
        *(float *)&v201 = 1.0 - (float)(*(float *)&v201 / v202);
        v205 = vabds_f32(*(float *)&v201, v204);
        v206 = v204;
        v207 = *(float *)&v201;
        v208 = v205 / (v339 * a8);
        v209 = v107 / (float)((float)(unint64_t)v366 * v202);
        v210 = v208 + v206;
        *(float *)&v208 = v207 - v208;
        v211 = v209 + v206;
        v212 = v207 - v209;
        *(float *)&v207 = (float)((unint64_t)v366 - 1);
        v213 = (double)((unint64_t)v366 - 1);
        v364 = 1.0
             - (float)((float)((float)(*(float *)&v207 + v210) - (float)(unint64_t)v368)
                     / (float)(unint64_t)v366);
        v356 = 1.0
             - (float)((float)((float)(*(float *)&v207 + *(float *)&v208) - (float)(unint64_t)v368)
                     / (float)(unint64_t)v366);
        v214 = v107 - (v212 + v213 - (double)(unint64_t)v368) / (double)(unint64_t)v366;
        v215 = v338 + v339 * 0.5;
        v340 = v152;
        v342 = v215;
        *(float *)&v211 = v107 - (v211 + v213 - (double)(unint64_t)v368) / (double)(unint64_t)v366;
        v369 = LODWORD(v211);
        *(float *)&v214 = v214;
        v367 = LODWORD(v214);
        v216 = (char *)a7 + 16;
        if (v348 <= 1)
          v217 = 1;
        else
          v217 = v348;
        v218 = 1.0;
        do
        {
          v219 = v346;
          if (v200)
            v219 = __p[2 * v200 - 2];
          v220 = v200 + 1;
          v221 = v344;
          v222 = v343;
          if (v200 + 1 < v348)
          {
            v223 = &__p[2 * v220];
            v221 = *v223;
            v222 = v223[1];
          }
          v224 = &__p[2 * v200];
          v225 = *v224;
          v226 = v224[1];
          v227 = sub_1000603B8(*v224, v226, v219);
          v229 = sub_100060398(v227, v228);
          v231 = v230;
          v232 = sub_1000603B8(v221, v222, v225);
          v234 = sub_100060398(v232, v233);
          v236 = v235;
          v237 = sub_1000603DC(v234, v235, -1.0);
          v239 = sub_1000603C4(v229, v231, v237, v238);
          v240 = acos(fmin(fmax(v239, -1.0), v218));
          v241 = sin(v240 * 0.5);
          -[CRLStroke miterLimit](self, "miterLimit");
          v361 = v242 * 0.995;
          v363 = v218 / v241;
          if (v218 / v241 <= v242 * 0.995)
          {
            v254 = sub_100060A38(v229, v231, v234);
            v256 = sub_10006200C(0, v254, v255);
            v258 = sub_100060398(v256, v257);
            v251 = sub_1000603DC(v258, v259, v342 / v241);
          }
          else
          {
            v243 = sub_10006200C(0, v229, v231);
            v245 = v244;
            v246 = sub_10006200C(0, v234, v236);
            v248 = v247;
            v249 = sub_100060398(v243, v245);
            v251 = sub_1000603DC(v249, v250, v342);
            v252 = sub_100060398(v246, v248);
            v354 = sub_1000603DC(v252, v253, v342);
          }
          v260 = *(float *)(*(_QWORD *)&v379[0] + 4 * v200) / v340;
          v261 = sub_1003C660C(var0, var1, v260);
          v262 = sub_1003C660C(var2, v358, v260);
          v263 = sub_1000603D0(v225, v226, v251);
          v265 = (char *)*((_QWORD *)a7 + 1);
          v264 = *((_QWORD *)a7 + 2);
          v266 = v262;
          v267 = v261;
          v268 = v263;
          v270 = v269;
          if (v157)
          {
            if ((unint64_t)v265 >= v264)
            {
              v271 = (uint64_t)&v265[-*(_QWORD *)a7] >> 5;
              if ((unint64_t)(v271 + 1) >> 59)
                sub_100007810();
              v272 = v264 - *(_QWORD *)a7;
              v273 = v272 >> 4;
              if (v272 >> 4 <= (unint64_t)(v271 + 1))
                v273 = v271 + 1;
              if ((unint64_t)v272 >= 0x7FFFFFFFFFFFFFE0)
                v274 = 0x7FFFFFFFFFFFFFFLL;
              else
                v274 = v273;
              if (v274)
                v275 = (char *)sub_100134CDC((uint64_t)a7 + 16, v274);
              else
                v275 = 0;
              v276 = (float *)&v275[32 * v271];
              *v276 = 0.0;
              v276[1] = v268;
              v276[2] = v270;
              v276[3] = v266;
              v276[4] = v364;
              *((_DWORD *)v276 + 5) = v369;
              *((_DWORD *)v276 + 6) = v367;
              v276[7] = v267;
              v278 = *(char **)a7;
              v277 = (char *)*((_QWORD *)a7 + 1);
              v279 = v276;
              if (v277 != *(char **)a7)
              {
                do
                {
                  v280 = *((_OWORD *)v277 - 1);
                  *((_OWORD *)v279 - 2) = *((_OWORD *)v277 - 2);
                  *((_OWORD *)v279 - 1) = v280;
                  v279 -= 8;
                  v277 -= 32;
                }
                while (v277 != v278);
                v277 = *(char **)a7;
              }
              v265 = (char *)(v276 + 8);
              *(_QWORD *)a7 = v279;
              *((_QWORD *)a7 + 1) = v276 + 8;
              *((_QWORD *)a7 + 2) = &v275[32 * v274];
              if (v277)
                operator delete(v277);
            }
            else
            {
              *(_DWORD *)v265 = 0;
              *((float *)v265 + 1) = v268;
              *((float *)v265 + 2) = v270;
              *((float *)v265 + 3) = v266;
              *((float *)v265 + 4) = v364;
              *((_DWORD *)v265 + 5) = v369;
              *((_DWORD *)v265 + 6) = v367;
              *((float *)v265 + 7) = v267;
              v265 += 32;
            }
            *((_QWORD *)a7 + 1) = v265;
            v264 = *((_QWORD *)a7 + 2);
          }
          if ((unint64_t)v265 >= v264)
          {
            v282 = (uint64_t)&v265[-*(_QWORD *)a7] >> 5;
            if ((unint64_t)(v282 + 1) >> 59)
              sub_100007810();
            v283 = v264 - *(_QWORD *)a7;
            v284 = v283 >> 4;
            if (v283 >> 4 <= (unint64_t)(v282 + 1))
              v284 = v282 + 1;
            if ((unint64_t)v283 >= 0x7FFFFFFFFFFFFFE0)
              v285 = 0x7FFFFFFFFFFFFFFLL;
            else
              v285 = v284;
            if (v285)
              v286 = (char *)sub_100134CDC((uint64_t)a7 + 16, v285);
            else
              v286 = 0;
            v287 = (float *)&v286[32 * v282];
            *v287 = 0.0;
            v287[1] = v268;
            v287[2] = v270;
            v287[3] = v266;
            v287[4] = v364;
            *((_DWORD *)v287 + 5) = v369;
            *((_DWORD *)v287 + 6) = v367;
            v287[7] = v267;
            v289 = *(char **)a7;
            v288 = (char *)*((_QWORD *)a7 + 1);
            v290 = v287;
            if (v288 != *(char **)a7)
            {
              do
              {
                v291 = *((_OWORD *)v288 - 1);
                *((_OWORD *)v290 - 2) = *((_OWORD *)v288 - 2);
                *((_OWORD *)v290 - 1) = v291;
                v290 -= 8;
                v288 -= 32;
              }
              while (v288 != v289);
              v288 = *(char **)a7;
            }
            v281 = (char *)(v287 + 8);
            *(_QWORD *)a7 = v290;
            *((_QWORD *)a7 + 1) = v287 + 8;
            *((_QWORD *)a7 + 2) = &v286[32 * v285];
            if (v288)
              operator delete(v288);
          }
          else
          {
            *v265 = 0;
            v265[3] = 0;
            *(_WORD *)(v265 + 1) = 0;
            *((float *)v265 + 1) = v268;
            *((float *)v265 + 2) = v270;
            *((float *)v265 + 3) = v266;
            *((float *)v265 + 4) = v364;
            *((_DWORD *)v265 + 5) = v369;
            *((_DWORD *)v265 + 6) = v367;
            *((float *)v265 + 7) = v267;
            v281 = v265 + 32;
          }
          *((_QWORD *)a7 + 1) = v281;
          v292 = sub_1000603B8(v225, v226, v251);
          v294 = v293;
          v295 = *((_QWORD *)a7 + 2);
          if ((unint64_t)v281 >= v295)
          {
            v297 = (uint64_t)&v281[-*(_QWORD *)a7] >> 5;
            if ((unint64_t)(v297 + 1) >> 59)
              sub_100007810();
            v298 = v295 - *(_QWORD *)a7;
            v299 = v298 >> 4;
            if (v298 >> 4 <= (unint64_t)(v297 + 1))
              v299 = v297 + 1;
            if ((unint64_t)v298 >= 0x7FFFFFFFFFFFFFE0)
              v300 = 0x7FFFFFFFFFFFFFFLL;
            else
              v300 = v299;
            if (v300)
              v301 = (char *)sub_100134CDC((uint64_t)a7 + 16, v300);
            else
              v301 = 0;
            v302 = (float *)&v301[32 * v297];
            *v302 = 0.0;
            v302[1] = v292;
            v302[2] = v294;
            v302[3] = v266;
            v302[4] = v356;
            *((_DWORD *)v302 + 5) = v369;
            *((_DWORD *)v302 + 6) = v367;
            v302[7] = v267;
            v304 = *(char **)a7;
            v303 = (char *)*((_QWORD *)a7 + 1);
            v305 = v302;
            v218 = 1.0;
            if (v303 != *(char **)a7)
            {
              do
              {
                v306 = *((_OWORD *)v303 - 1);
                *((_OWORD *)v305 - 2) = *((_OWORD *)v303 - 2);
                *((_OWORD *)v305 - 1) = v306;
                v305 -= 8;
                v303 -= 32;
              }
              while (v303 != v304);
              v303 = *(char **)a7;
            }
            v296 = (char *)(v302 + 8);
            *(_QWORD *)a7 = v305;
            *((_QWORD *)a7 + 1) = v302 + 8;
            *((_QWORD *)a7 + 2) = &v301[32 * v300];
            if (v303)
              operator delete(v303);
          }
          else
          {
            *(_DWORD *)v281 = 0;
            *((float *)v281 + 1) = v292;
            *((float *)v281 + 2) = v294;
            *((float *)v281 + 3) = v266;
            *((float *)v281 + 4) = v356;
            *((_DWORD *)v281 + 5) = v369;
            *((_DWORD *)v281 + 6) = v367;
            v296 = v281 + 32;
            *((float *)v281 + 7) = v267;
            v218 = 1.0;
          }
          *((_QWORD *)a7 + 1) = v296;
          if (v363 > v361)
          {
            v307 = sub_1000603D0(v225, v226, v354);
            v309 = v308;
            if ((unint64_t)v296 >= *v216)
            {
              v311 = (uint64_t)&v296[-*(_QWORD *)a7] >> 5;
              if ((unint64_t)(v311 + 1) >> 59)
                sub_100007810();
              v312 = *v216 - *(_QWORD *)a7;
              v313 = v312 >> 4;
              if (v312 >> 4 <= (unint64_t)(v311 + 1))
                v313 = v311 + 1;
              if ((unint64_t)v312 >= 0x7FFFFFFFFFFFFFE0)
                v314 = 0x7FFFFFFFFFFFFFFLL;
              else
                v314 = v313;
              if (v314)
                v315 = (char *)sub_100134CDC((uint64_t)a7 + 16, v314);
              else
                v315 = 0;
              v316 = (float *)&v315[32 * v311];
              *v316 = 0.0;
              v316[1] = v307;
              v316[2] = v309;
              v316[3] = v266;
              v316[4] = v364;
              *((_DWORD *)v316 + 5) = v369;
              *((_DWORD *)v316 + 6) = v367;
              v316[7] = v267;
              v318 = *(char **)a7;
              v317 = (char *)*((_QWORD *)a7 + 1);
              v319 = v316;
              if (v317 != *(char **)a7)
              {
                do
                {
                  v320 = *((_OWORD *)v317 - 1);
                  *((_OWORD *)v319 - 2) = *((_OWORD *)v317 - 2);
                  *((_OWORD *)v319 - 1) = v320;
                  v319 -= 8;
                  v317 -= 32;
                }
                while (v317 != v318);
                v317 = *(char **)a7;
              }
              v310 = (char *)(v316 + 8);
              *(_QWORD *)a7 = v319;
              *((_QWORD *)a7 + 1) = v316 + 8;
              *((_QWORD *)a7 + 2) = &v315[32 * v314];
              if (v317)
                operator delete(v317);
            }
            else
            {
              *(_DWORD *)v296 = 0;
              *((float *)v296 + 1) = v307;
              *((float *)v296 + 2) = v309;
              *((float *)v296 + 3) = v266;
              *((float *)v296 + 4) = v364;
              *((_DWORD *)v296 + 5) = v369;
              *((_DWORD *)v296 + 6) = v367;
              v310 = v296 + 32;
              *((float *)v296 + 7) = v267;
            }
            *((_QWORD *)a7 + 1) = v310;
            v321 = sub_1000603B8(v225, v226, v354);
            v323 = v322;
            v324 = *((_QWORD *)a7 + 2);
            if ((unint64_t)v310 >= v324)
            {
              v326 = (uint64_t)&v310[-*(_QWORD *)a7] >> 5;
              if ((unint64_t)(v326 + 1) >> 59)
                sub_100007810();
              v327 = v324 - *(_QWORD *)a7;
              v328 = v327 >> 4;
              if (v327 >> 4 <= (unint64_t)(v326 + 1))
                v328 = v326 + 1;
              if ((unint64_t)v327 >= 0x7FFFFFFFFFFFFFE0)
                v329 = 0x7FFFFFFFFFFFFFFLL;
              else
                v329 = v328;
              if (v329)
                v330 = (char *)sub_100134CDC((uint64_t)a7 + 16, v329);
              else
                v330 = 0;
              v331 = (float *)&v330[32 * v326];
              *v331 = 0.0;
              v331[1] = v321;
              v331[2] = v323;
              v331[3] = v266;
              v331[4] = v356;
              *((_DWORD *)v331 + 5) = v369;
              *((_DWORD *)v331 + 6) = v367;
              v331[7] = v267;
              v333 = *(char **)a7;
              v332 = (char *)*((_QWORD *)a7 + 1);
              v334 = v331;
              v218 = 1.0;
              if (v332 != *(char **)a7)
              {
                do
                {
                  v335 = *((_OWORD *)v332 - 1);
                  *((_OWORD *)v334 - 2) = *((_OWORD *)v332 - 2);
                  *((_OWORD *)v334 - 1) = v335;
                  v334 -= 8;
                  v332 -= 32;
                }
                while (v332 != v333);
                v332 = *(char **)a7;
              }
              v325 = (char *)(v331 + 8);
              *(_QWORD *)a7 = v334;
              *((_QWORD *)a7 + 1) = v331 + 8;
              *((_QWORD *)a7 + 2) = &v330[32 * v329];
              if (v332)
                operator delete(v332);
            }
            else
            {
              *(_DWORD *)v310 = 0;
              *((float *)v310 + 1) = v321;
              *((float *)v310 + 2) = v323;
              *((float *)v310 + 3) = v266;
              *((float *)v310 + 4) = v356;
              *((_DWORD *)v310 + 5) = v369;
              *((_DWORD *)v310 + 6) = v367;
              v325 = v310 + 32;
              *((float *)v310 + 7) = v267;
              v218 = 1.0;
            }
            *((_QWORD *)a7 + 1) = v325;
          }
          v157 = 0;
          v200 = v220;
        }
        while (v220 != v217);
        if (*(_QWORD *)&v379[0])
        {
          *((_QWORD *)&v379[0] + 1) = *(_QWORD *)&v379[0];
          operator delete(*(void **)&v379[0]);
        }

        v94 = __p;
        goto LABEL_290;
      }
    }
    else
    {

      v191 = v336;
      if ((v190 & 1) == 0)
        goto LABEL_191;
    }
    v192 = *((double *)v372 - 1);
    v347 = *((double *)v372 - 2);
    objc_msgSend(v370, "gradientAt:fromElement:", v341, v376);
    v194 = v193;
    v195 = *__p;
    v196 = __p[1];
    objc_msgSend(v370, "gradientAt:fromElement:", v353, v377);
    v198 = v197;
    v346 = sub_1000603B8(v347, v192, v194);
    v344 = sub_1000603D0(v195, v196, v198);
    v343 = v199;
    a8 = v360;
    v107 = 1.0;
    goto LABEL_191;
  }
LABEL_290:
  if (v94)
    operator delete(v94);

LABEL_293:
}

- (void)p_finishMetalRenderInContext:(CGContext *)a3 orDirectly:(id)a4 pathVertexData:(void *)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  _BOOL4 v9;
  id v12;
  double v13;
  double m11;
  double m12;
  double v16;
  double width;
  double height;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  float v28;
  double v29;
  double v30;
  __int128 v31;
  id v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unint64_t v43;
  int v44;
  const void *v45;
  CGFloat v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  unint64_t v72;
  id v73;
  double v74;
  double v75;
  BOOL v76;
  void *v77;
  void *v78;
  CGContext *v79;
  void *v80;
  double v85;
  CGColor *v86;
  const CGFloat *Components;
  double v88;
  double v89;
  double v90;
  id v91;
  float v92;
  float32x4_t v93;
  float v94;
  float v95;
  double v96;
  double v97;
  double v98;
  double v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat m13;
  CGFloat m14;
  CGFloat m21;
  CGFloat m22;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  uint64_t v121;
  void *i;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  unint64_t v135;
  unint64_t v136;
  void *v137;
  unint64_t v138;
  void *v139;
  void *v140;
  unsigned __int8 v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  unsigned int v146;
  NSObject *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  CGImage *v153;
  void *v154;
  uint64_t v155;
  id v156;
  double v157;
  int v158;
  int v159;
  int v160;
  CGFloat sxa;
  double sx;
  double x;
  CGFloat m43;
  void *v165;
  uint64_t v166;
  float64x2_t v167;
  double v168;
  double y;
  float64x2_t v170;
  uint64_t v171;
  float64x2_t v172;
  int v173;
  _BOOL4 v174;
  float64x2_t v175;
  void *v176;
  void *context;
  id v178;
  float64x2_t v180;
  void *v181;
  void *v182;
  CGContext *c;
  CGContextRef ca[2];
  void *v185;
  float v186;
  float32x4_t v187;
  id v188;
  void *v189;
  void *v190;
  uint64_t v191;
  id v192;
  uint64_t *v193;
  id v194;
  unint64_t v195;
  float64x2_t v196;
  void *v197;
  void *v198;
  float64x2_t v200;
  void *v201;
  unint64_t v202;
  void *v203;
  void *v204;
  float32x4_t v205;
  char v206;
  float64x2_t v207[8];
  float32x4_t v208;
  float32x4_t v209;
  float32x4_t v210;
  float32x4_t v211;
  _QWORD v212[4];
  __int128 v213;
  _QWORD v214[4];
  __int128 v215;
  CATransform3D v216;
  CGAffineTransform v217;
  CATransform3D v218;
  CATransform3D v219;
  float64x2_t v220[8];
  _QWORD v221[4];
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  _QWORD v227[4];
  __int128 v228;
  CATransform3D b;
  CGAffineTransform m;
  CATransform3D a;
  CATransform3D v232;
  CATransform3D v233;
  CATransform3D v234;
  CATransform3D v235;
  _BYTE v236[16];
  __int128 v237;
  int v238;
  _QWORD v239[7];
  void *__p;
  void *v241;
  uint64_t v242;
  BOOL v243;
  CGAffineTransform v244;
  CGAffineTransform transform;
  __int128 v246;
  __int128 v247;
  CGAffineTransform v248;
  __int128 v249;
  __int128 v250;
  CATransform3D v251;
  _BYTE v252[128];
  _QWORD v253[4];
  CGRect ClipBoundingBox;
  CGRect v255;
  CGRect v256;
  CGRect v257;

  v9 = a6;
  v12 = a4;
  v178 = a8;
  context = objc_autoreleasePoolPush();
  v193 = (uint64_t *)a5;
  v181 = v12;
  if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
  {
    c = a3;
    if (v12)
    {
      objc_msgSend(v12, "frame");
      objc_msgSend(v12, "transform");
      sub_10005FDDC();
      m11 = v235.m11;
      m12 = v235.m12;
      v250 = *(_OWORD *)&v235.m21;
      v249 = *(_OWORD *)&v235.m13;
      v246 = *(_OWORD *)&v235.m13;
      v247 = *(_OWORD *)&v235.m21;
      if (v16 > 0.0 && v13 > 0.0)
      {
        v176 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
        goto LABEL_21;
      }
    }
    else
    {
      ClipBoundingBox = CGContextGetClipBoundingBox(a3);
      width = ClipBoundingBox.size.width;
      height = ClipBoundingBox.size.height;
      CGContextGetCTM((CGAffineTransform *)&v235, a3);
      m11 = v235.m11;
      m12 = v235.m12;
      v249 = *(_OWORD *)&v235.m13;
      v250 = *(_OWORD *)&v235.m21;
      if (-[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:", a3))
      {
        v248.a = m11;
        v248.b = m12;
        *(_OWORD *)&v248.c = v249;
        *(_OWORD *)&v248.tx = v250;
        CGAffineTransformScale((CGAffineTransform *)&v235, &v248, 3.0, 3.0);
        m11 = v235.m11;
        m12 = v235.m12;
        v249 = *(_OWORD *)&v235.m13;
        v250 = *(_OWORD *)&v235.m21;
      }
      v246 = v249;
      v247 = v250;
      if (width > 0.0 && height > 0.0)
      {
        if (a3)
        {
          v176 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke colorForCGContext:](self, "colorForCGContext:", a3));
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125CDA8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E32CB4();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125CDC8);
          v19 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1168, 0, "Should have either a direct context or a CGContext.");

          v176 = 0;
          v12 = v181;
        }
LABEL_21:
        -[CRLStroke width](self, "width");
        v23 = v22;
        objc_msgSend(v176, "alphaComponent");
        v24 = sqrt(m12 * m12 + m11 * m11);
        v26 = v25;
        v27 = 1.0 / v24;
        v28 = v23 * v24 * v26;
        if (v23 < v27)
          v26 = v28;
        if (v9)
          v26 = 1.0;
        v186 = v26;
        if (v12)
        {
          v171 = 0;
          v166 = 0;
          x = CGRectZero.origin.x;
          v29 = CGRectZero.size.width;
          y = CGRectZero.origin.y;
          v30 = CGRectZero.size.height;
        }
        else
        {
          CGContextSaveGState(c);
          v244.a = m11;
          v244.b = m12;
          *(_OWORD *)&v244.c = v246;
          *(_OWORD *)&v244.tx = v247;
          CGAffineTransformInvert(&transform, &v244);
          CGContextConcatCTM(c, &transform);
          v31 = *(_OWORD *)&CGAffineTransformIdentity.tx;
          v246 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v247 = v31;
          v255 = CGContextGetClipBoundingBox(c);
          v256 = CGRectIntegral(v255);
          x = v256.origin.x;
          y = v256.origin.y;
          v29 = v256.size.width;
          v30 = v256.size.height;
          v166 = (uint64_t)fmin(v256.size.width, 1024.0);
          v171 = (uint64_t)fmin(v256.size.height, 1024.0);
        }
        v32 = sub_1000A6700();
        v185 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v174 = v9;
        if (v12)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metalDeviceOverride"));
          v34 = v33 == 0;

          if (!v34)
          {
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "metalDeviceOverride"));

            v185 = (void *)v35;
          }
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v37 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
        if (v37)
        {
          v38 = 0;
          v39 = v37 >> 5;
          v191 = v37 >> 5;
          do
          {
            v40 = 0;
            v41 = *v193;
            v42 = (unsigned __int8 *)(*v193 + 32 * v38);
            v43 = v38;
            do
            {
              v44 = *v42;
              v42 += 32;
              if (v44)
              {
                if (v40)
                  break;
                ++v38;
              }
              else
              {
                ++v40;
              }
              ++v43;
            }
            while (v43 < v39);
            v45 = (const void *)(v41 + 32 * v38);
            v38 += v40;
            memset(&v235, 0, 24);
            sub_10042440C(&v235, v45, v41 + 32 * v38, v40);
            v46 = v235.m12;
            v47 = *(_QWORD *)&v235.m12 - *(_QWORD *)&v235.m11;
            if (*(_QWORD *)&v235.m12 != *(_QWORD *)&v235.m11)
            {
              v195 = v38;
              v48 = 0;
              v49 = v47 >> 5;
              v202 = (v47 >> 5) - 3;
              do
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLGLDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](CRLGLDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("position"), 35044, 5, 0, 2));
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLGLDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](CRLGLDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("textureCoordinate"), 35044, 5, 0, 2));
                v52 = (void *)objc_claimAutoreleasedReturnValue(+[CRLGLDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](CRLGLDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("clampedTextureCoordinate"), 35044, 5, 0, 2));
                v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRLGLDataBufferAttribute attributeWithName:bufferUsage:dataType:normalized:componentCount:](CRLGLDataBufferAttribute, "attributeWithName:bufferUsage:dataType:normalized:componentCount:", CFSTR("percentAlongPath"), 35044, 5, 1, 1));
                v253[0] = v50;
                v253[1] = v51;
                v253[2] = v52;
                v253[3] = v53;
                v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v253, 4));
                v55 = 65534;
                if (v49 - v48 <= 0xFFFE)
                  v55 = v49 - v48;
                if (v55 + v48 <= v202 || v55 + v48 >= v49)
                  v57 = v55;
                else
                  v57 = v49 - v48 - 3;
                v58 = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](CRLGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:", v54, v57, 0, v185);
                objc_msgSend(v58, "setMetalDrawMode:", 4);
                v239[0] = _NSConcreteStackBlock;
                v239[1] = 3321888768;
                v239[2] = sub_100422058;
                v239[3] = &unk_10125CDE8;
                v239[4] = v57;
                v239[5] = v48;
                v243 = a7;
                v239[6] = v49;
                v241 = 0;
                v242 = 0;
                __p = 0;
                sub_100424484(&__p, *(const void **)&v235.m11, *(uint64_t *)&v235.m12, (uint64_t)(*(_QWORD *)&v235.m12 - *(_QWORD *)&v235.m11) >> 5);
                objc_msgSend(v58, "updateMetalDataBufferAttributes:withBlock:", v54, v239);
                objc_msgSend(v36, "addObject:", v58);
                v48 += v57;
                v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v48 >= v49));
                objc_msgSend(v204, "addObject:", v59);

                if (__p)
                {
                  v241 = __p;
                  operator delete(__p);
                }

              }
              while (v48 < v49);
              v46 = v235.m11;
              v38 = v195;
              v39 = v191;
            }
            if (v46 != 0.0)
            {
              v235.m12 = v46;
              operator delete(*(void **)&v46);
            }
          }
          while (v38 < v39);
        }
        if (v181)
        {
          if (+[CRLBrushStroke p_isDirectContextWideColorCapable:](CRLBrushStroke, "p_isDirectContextWideColorCapable:", v181))
          {
            v60 = 115;
          }
          else
          {
            v60 = 70;
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "metalDrawable"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "texture"));
          v63 = objc_msgSend(v62, "width");

          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "metalDrawable"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "texture"));
          v66 = objc_msgSend(v65, "height");

        }
        else
        {
          v60 = 70;
          v66 = (id)v171;
          v63 = (id)v166;
        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
        objc_msgSend(v67, "maximumMetalTextureSizeForDevice:", v185);
        v69 = v68;
        v71 = v70;

        v72 = (unint64_t)v66;
        v73 = v63;
        if (v174
          || ((v74 = (double)(unint64_t)v63 + (double)(unint64_t)v63,
               v75 = (double)(unint64_t)v66 + (double)(unint64_t)v66,
               v74 <= v69)
            ? (v76 = v75 > v71)
            : (v76 = 1),
              v72 = (unint64_t)v66,
              v73 = v63,
              v76))
        {
          if (!v73)
          {
LABEL_87:

            goto LABEL_88;
          }
        }
        else
        {
          v72 = (unint64_t)v75;
          if (!(unint64_t)v74)
            goto LABEL_87;
        }
        if (v72 && v63 && v66)
        {
          v198 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10));
          objc_msgSend(v198, "setUsage:", 5);
          objc_msgSend(v198, "setStorageMode:", 2);
          v192 = objc_msgSend(v185, "newTextureWithDescriptor:", v198);
          v203 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v60, v63, v66, 0));
          objc_msgSend(v203, "setUsage:", 5);
          objc_msgSend(v203, "setStorageMode:", 0);
          if (v181)
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "metalDrawable"));
            v194 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "texture"));

          }
          else
          {
            v194 = objc_msgSend(v185, "newTextureWithDescriptor:", v203);
          }
          v189 = (void *)objc_claimAutoreleasedReturnValue(+[MTLRenderPassDescriptor renderPassDescriptor](MTLRenderPassDescriptor, "renderPassDescriptor"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "colorAttachments"));
          v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectAtIndexedSubscript:", 0));

          objc_msgSend(v165, "setTexture:", v192);
          objc_msgSend(v165, "setStoreAction:", 1);
          objc_msgSend(v165, "setLoadAction:", 2);
          objc_msgSend(v165, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
          v79 = c;
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStroke p_metalBrushShaderForPixelFormat:andDevice:](self, "p_metalBrushShaderForPixelFormat:andDevice:", 10, v185));
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:](self, "p_metalOpacityShaderForPixelFormat:andDevice:", v60, v185));
          v188 = +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v185, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v194, "width"), (double)(unint64_t)objc_msgSend(v194, "height"), 0.0, 0.0, 1.0, 1.0);
          v236[0] = v174;
          __asm { FMOV            V0.4S, #1.0 }
          v237 = _Q0;
          objc_msgSend(v178, "strokeEnd");
          *(float *)&v85 = v85;
          v238 = LODWORD(v85);
          v86 = (CGColor *)objc_msgSend(v176, "CGColor");
          if (v181)
            v86 = +[CRLBrushStroke p_colorForDrawingIntoDirectContext:fromOriginalColor:](CRLBrushStroke, "p_colorForDrawingIntoDirectContext:fromOriginalColor:", v181, v176);
          Components = CGColorGetComponents(v86);
          v89 = *Components;
          v88 = Components[1];
          v90 = Components[2];
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStroke p_metalTextureForCurrentStrokeAndDevice:](self, "p_metalTextureForCurrentStrokeAndDevice:", v185));
          v91 = sub_1000A699C(v185);
          v182 = (void *)objc_claimAutoreleasedReturnValue(v91);
          v92 = v89;
          v93.f32[0] = v186 * v92;
          v94 = v88;
          v95 = v90;
          v93.f32[1] = v186 * v94;
          v93.i64[1] = __PAIR64__(LODWORD(v186), v186 * v95);
          v187 = v93;
          if (v181)
          {
            objc_msgSend(v181, "frame");
            v97 = v96;
            v99 = v98;
            v100 = *(_OWORD *)&CATransform3DIdentity.m13;
            *(_OWORD *)&v234.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
            *(_OWORD *)&v234.m13 = v100;
            v101 = *(_OWORD *)&CATransform3DIdentity.m23;
            *(_OWORD *)&v234.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
            *(_OWORD *)&v234.m23 = v101;
            v102 = *(_OWORD *)&CATransform3DIdentity.m33;
            *(_OWORD *)&v234.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
            *(_OWORD *)&v234.m33 = v102;
            v103 = *(_OWORD *)&CATransform3DIdentity.m43;
            *(_OWORD *)&v234.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
            *(_OWORD *)&v234.m43 = v103;
            CATransform3DScale(&v235, &v234, 2.0 / v96, -2.0 / v98, 1.0);
            v233 = v235;
            CATransform3DTranslate(&v235, &v233, v97 * -0.5, v99 * -0.5, 0.0);
            v232 = v235;
            objc_msgSend(v181, "contentsScale");
            v105 = v104;
            objc_msgSend(v181, "contentsScale");
            CATransform3DScale(&v235, &v232, 1.0 / v105, 1.0 / v106, 1.0);
            v107 = v235.m11;
            v108 = v235.m12;
            m13 = v235.m13;
            m14 = v235.m14;
            m21 = v235.m21;
            m22 = v235.m22;
            v113 = *(_OWORD *)&v235.m23;
            v114 = *(_OWORD *)&v235.m31;
            v115 = *(_OWORD *)&v235.m33;
            v116 = *(_OWORD *)&v235.m41;
            sxa = v235.m44;
            m43 = v235.m43;
            m.a = m11;
            m.b = m12;
            *(_OWORD *)&m.tx = v250;
            *(_OWORD *)&m.c = v249;
            CATransform3DMakeAffineTransform(&a, &m);
            b.m11 = v107;
            b.m12 = v108;
            b.m13 = m13;
            b.m14 = m14;
            b.m21 = m21;
            b.m22 = m22;
            *(_OWORD *)&b.m23 = v113;
            *(_OWORD *)&b.m31 = v114;
            *(_OWORD *)&b.m33 = v115;
            *(_OWORD *)&b.m41 = v116;
            b.m43 = m43;
            b.m44 = sxa;
            CATransform3DConcat(&v235, &a, &b);
            *(_OWORD *)ca = *(_OWORD *)&v235.m23;
            v167 = *(float64x2_t *)&v235.m11;
            v170 = *(float64x2_t *)&v235.m21;
            v196 = *(float64x2_t *)&v235.m33;
            v172 = *(float64x2_t *)&v235.m31;
            v175 = *(float64x2_t *)&v235.m13;
            v200 = *(float64x2_t *)&v235.m43;
            v180 = *(float64x2_t *)&v235.m41;
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "commandBuffer"));
            v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "renderCommandEncoderWithDescriptor:", v189));
            v227[1] = 0;
            v227[0] = 0;
            *(double *)&v227[2] = (double)(unint64_t)objc_msgSend(v198, "width");
            *(double *)&v227[3] = (double)(unint64_t)objc_msgSend(v198, "height");
            v228 = xmmword_100EED720;
            objc_msgSend(v118, "setViewport:", v227);
            objc_msgSend(v118, "setFragmentTexture:atIndex:", v190, 0);
            *(float32x4_t *)&v235.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v167), v175);
            *(float32x4_t *)&v235.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v170), *(float64x2_t *)ca);
            *(float32x4_t *)&v235.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v172), v196);
            *(float32x4_t *)&v235.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v180), v200);
            objc_msgSend(v80, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v118, &v235, v236);
            v226 = 0u;
            v225 = 0u;
            v224 = 0u;
            v223 = 0u;
            v119 = v36;
            v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v223, v252, 16);
            if (v120)
            {
              v121 = *(_QWORD *)v224;
              do
              {
                for (i = 0; i != v120; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v224 != v121)
                    objc_enumerationMutation(v119);
                  objc_msgSend(*(id *)(*((_QWORD *)&v223 + 1) + 8 * (_QWORD)i), "drawWithEncoder:atIndex:", v118, objc_msgSend(v80, "bufferIndex"));
                }
                v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v223, v252, 16);
              }
              while (v120);
            }

            objc_msgSend(v118, "endEncoding");
            v123 = (void *)objc_claimAutoreleasedReturnValue(+[MTLRenderPassDescriptor renderPassDescriptor](MTLRenderPassDescriptor, "renderPassDescriptor"));
            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "colorAttachments"));
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "objectAtIndexedSubscript:", 0));

            objc_msgSend(v125, "setTexture:", v194);
            objc_msgSend(v125, "setStoreAction:", 1);
            objc_msgSend(v125, "setLoadAction:", 2);
            objc_msgSend(v125, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
            v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "renderCommandEncoderWithDescriptor:", v123));
            v221[1] = 0;
            v221[0] = 0;
            *(double *)&v221[2] = (double)(unint64_t)objc_msgSend(v203, "width");
            *(double *)&v221[3] = (double)(unint64_t)objc_msgSend(v203, "height");
            v222 = xmmword_100EED720;
            objc_msgSend(v126, "setViewport:", v221);
            objc_msgSend(v126, "setFragmentTexture:atIndex:", v192, 0);
            sub_1000FC444((uint64_t)v220, 0.0, (double)(unint64_t)objc_msgSend(v203, "width"), 0.0, (double)(unint64_t)objc_msgSend(v203, "height"), -1.0, 1.0);
            *(float32x4_t *)&v251.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[0]), v220[1]);
            *(float32x4_t *)&v251.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[2]), v220[3]);
            *(float32x4_t *)&v251.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[4]), v220[5]);
            *(float32x4_t *)&v251.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[6]), v220[7]);
            v208 = v187;
            v209.i8[0] = 1;
            objc_msgSend(v197, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v126, &v251, &v208);
            objc_msgSend(v188, "drawWithEncoder:atIndex:", v126, objc_msgSend(v197, "bufferIndex"));
            objc_msgSend(v126, "endEncoding");
            objc_msgSend(v117, "enqueue");
            v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "metalDrawable"));
            objc_msgSend(v117, "presentDrawable:", v127);

            objc_msgSend(v117, "commit");
          }
          else
          {
            v158 = vcvtpd_s64_f64(v29 * 0.0009765625);
            if (v158 >= 1)
            {
              v159 = 0;
              v128 = vcvtpd_s64_f64(v30 * 0.0009765625);
              v129 = (double)v166;
              sx = 2.0 / (double)v166;
              v130 = (double)v171;
              v157 = (double)-v166 * 0.5;
              v168 = (double)-v171 * 0.5;
              v131 = 2.0 / (double)v171;
              v160 = v128;
              do
              {
                if (v128 >= 1)
                {
                  v173 = 0;
                  v132 = (double)(int)(x + (double)(v159 << 10));
                  v133 = v157 - v132;
                  do
                  {
                    memset(&v235, 0, sizeof(v235));
                    CATransform3DMakeScale(&v235, sx, v131, 1.0);
                    v219 = v235;
                    v134 = (double)(int)(y + (double)(v173 << 10));
                    CATransform3DTranslate(&v251, &v219, v133, v168 - v134, 0.0);
                    v235 = v251;
                    v217.a = m11;
                    v217.b = m12;
                    *(_OWORD *)&v217.c = v249;
                    *(_OWORD *)&v217.tx = v250;
                    CATransform3DMakeAffineTransform(&v218, &v217);
                    v216 = v235;
                    CATransform3DConcat(&v251, &v218, &v216);
                    v135 = 0;
                    v235 = v251;
                    while (v135 < (unint64_t)objc_msgSend(v36, "count", *(_QWORD *)&v157))
                    {
                      v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "commandBuffer"));
                      v136 = 0;
                      while (v135 < (unint64_t)objc_msgSend(v36, "count") && v136 <= 8)
                      {
                        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "renderCommandEncoderWithDescriptor:", v189));
                        v214[1] = 0;
                        v214[0] = 0;
                        *(double *)&v214[2] = (double)(unint64_t)objc_msgSend(v198, "width");
                        *(double *)&v214[3] = (double)(unint64_t)objc_msgSend(v198, "height");
                        v215 = xmmword_100EED720;
                        objc_msgSend(v137, "setViewport:", v214);
                        objc_msgSend(v137, "setFragmentTexture:atIndex:", v190, 0);
                        *(float32x4_t *)&v251.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m11), *(float64x2_t *)&v235.m13);
                        *(float32x4_t *)&v251.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m21), *(float64x2_t *)&v235.m23);
                        *(float32x4_t *)&v251.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m31), *(float64x2_t *)&v235.m33);
                        *(float32x4_t *)&v251.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m41), *(float64x2_t *)&v235.m43);
                        objc_msgSend(v80, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v137, &v251, v236);
                        v136 += 2;
                        v138 = v135;
                        do
                        {
                          if (v138 >= (unint64_t)objc_msgSend(v36, "count"))
                            break;
                          v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", v138));
                          objc_msgSend(v139, "drawWithEncoder:atIndex:", v137, objc_msgSend(v80, "bufferIndex"));
                          v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "objectAtIndexedSubscript:", v138));
                          v141 = objc_msgSend(v140, "BOOLValue");

                          ++v138;
                        }
                        while ((v141 & 1) == 0);
                        objc_msgSend(v137, "endEncoding");
                        v142 = (void *)objc_claimAutoreleasedReturnValue(+[MTLRenderPassDescriptor renderPassDescriptor](MTLRenderPassDescriptor, "renderPassDescriptor"));
                        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "colorAttachments"));
                        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "objectAtIndexedSubscript:", 0));

                        objc_msgSend(v144, "setTexture:", v194);
                        objc_msgSend(v144, "setStoreAction:", 1);
                        if (v135)
                        {
                          objc_msgSend(v144, "setLoadAction:", 1);
                        }
                        else
                        {
                          objc_msgSend(v144, "setLoadAction:", 2);
                          objc_msgSend(v144, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
                        }
                        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "renderCommandEncoderWithDescriptor:", v142));
                        v212[1] = 0;
                        v212[0] = 0;
                        *(double *)&v212[2] = (double)(unint64_t)objc_msgSend(v203, "width");
                        *(double *)&v212[3] = (double)(unint64_t)objc_msgSend(v203, "height");
                        v213 = xmmword_100EED720;
                        objc_msgSend(v145, "setViewport:", v212);
                        objc_msgSend(v145, "setFragmentTexture:atIndex:", v192, 0);
                        sub_1000FC444((uint64_t)v207, 0.0, (double)(unint64_t)objc_msgSend(v203, "width"), 0.0, (double)(unint64_t)objc_msgSend(v203, "height"), -1.0, 1.0);
                        v208 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v207[0]), v207[1]);
                        v209 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v207[2]), v207[3]);
                        v210 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v207[4]), v207[5]);
                        v211 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v207[6]), v207[7]);
                        v205 = v187;
                        v206 = 1;
                        objc_msgSend(v197, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v145, &v208, &v205);
                        objc_msgSend(v188, "drawWithEncoder:atIndex:", v145, objc_msgSend(v197, "bufferIndex"));
                        objc_msgSend(v145, "endEncoding");

                        v135 = v138;
                      }
                      if (v135 > (unint64_t)objc_msgSend(v36, "count"))
                      {
                        v146 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                        if (qword_10147E370 != -1)
                          dispatch_once(&qword_10147E370, &stru_10125CE18);
                        v147 = off_1013D9070;
                        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v251.m11) = 67109890;
                          HIDWORD(v251.m11) = v146;
                          LOWORD(v251.m12) = 2082;
                          *(_QWORD *)((char *)&v251.m12 + 2) = "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:"
                                                               "pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]";
                          WORD1(v251.m13) = 2082;
                          *(_QWORD *)((char *)&v251.m13 + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRL"
                                                               "Canvas/CRLBrushStroke.mm";
                          WORD2(v251.m14) = 1024;
                          *(_DWORD *)((char *)&v251.m14 + 6) = 1523;
                          _os_log_error_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The buffer index should not be greater than the number of buffers.", (uint8_t *)&v251, 0x22u);
                        }
                        if (qword_10147E370 != -1)
                          dispatch_once(&qword_10147E370, &stru_10125CE38);
                        v148 = off_1013D9070;
                        if (os_log_type_enabled((os_log_t)v148, OS_LOG_TYPE_ERROR))
                        {
                          v152 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                          LODWORD(v251.m11) = 67109378;
                          HIDWORD(v251.m11) = v146;
                          LOWORD(v251.m12) = 2114;
                          *(_QWORD *)((char *)&v251.m12 + 2) = v152;
                          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v148, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v251, 0x12u);

                        }
                        v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]"));
                        v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
                        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v149, v150, 1523, 0, "The buffer index should not be greater than the number of buffers.");

                      }
                      v151 = objc_msgSend(v36, "count");
                      objc_msgSend(v201, "enqueue");
                      objc_msgSend(v201, "commit");
                      if (v135 >= (unint64_t)v151)
                        objc_msgSend(v201, "waitUntilCompleted");

                      v79 = c;
                    }
                    v153 = sub_1000A6760(v194);
                    if (v174)
                    {
                      v257.origin.x = (double)(int)(x + (double)(v159 << 10));
                      v257.origin.y = (double)(int)(y + (double)(v173 << 10));
                      v257.size.width = v129;
                      v257.size.height = v130;
                      CGContextDrawImage(v79, v257, v153);
                    }
                    else
                    {
                      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "colorWithAlphaComponent:", 1.0));
                      objc_opt_class(self, v155);
                      objc_msgSend(v156, "p_drawColor:intoContext:usingImageAsMask:withRect:", v154, v79, v153, v132, v134, v129, v130);

                      v79 = c;
                    }
                    CGImageRelease(v153);
                    ++v173;
                  }
                  while (v173 != v160);
                }
                ++v159;
                v128 = v160;
              }
              while (v159 != v158);
            }
            CGContextRestoreGState(v79);
          }

        }
        goto LABEL_87;
      }
    }
  }
LABEL_88:
  objc_autoreleasePoolPop(context);

}

+ (BOOL)p_isDirectContextWideColorCapable:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "metalDrawable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "texture"));
  v5 = objc_msgSend(v4, "pixelFormat") == (id)115;

  return v5;
}

+ (CGColor)p_colorForDrawingIntoDirectContext:(id)a3 fromOriginalColor:(id)a4
{
  id v6;
  id v7;
  CGColor *v8;
  CGColorSpace *v9;
  unsigned int v10;
  CFStringRef *v11;
  CGColorSpaceRef v12;
  CGColorRef CopyByMatchingToColorSpace;

  v6 = a3;
  v7 = a4;
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");
  if (objc_msgSend(v6, "destinationColorSpaceOverride") || objc_msgSend(v7, "colorRGBSpace") == (id)1)
  {
    v9 = (CGColorSpace *)objc_msgSend(v6, "destinationColorSpaceOverride");
    if (!v9)
    {
      v10 = objc_msgSend(a1, "p_isDirectContextWideColorCapable:", v6);
      v11 = (CFStringRef *)&kCGColorSpaceExtendedSRGB;
      if (!v10)
        v11 = (CFStringRef *)&kCGColorSpaceSRGB;
      v12 = CGColorSpaceCreateWithName(*v11);
      v9 = (CGColorSpace *)CFAutorelease(v12);
    }
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v9, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v7, "CGColor"), 0);
    v8 = (CGColor *)CFAutorelease(CopyByMatchingToColorSpace);
  }

  return v8;
}

+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  size_t v13;
  size_t v14;
  CGContext *v15;
  size_t v16;
  size_t v17;
  CGImage *Image;
  size_t v19;
  size_t v20;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v26;
  int v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  CGContext *v32;
  CGImage *v33;
  char v34;
  size_t v35;
  size_t v36;
  __int128 v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a3;
  CGContextSaveGState(a4);
  v13 = CGImageGetWidth(a5);
  v14 = CGImageGetHeight(a5);
  v15 = sub_10040FA64(2, (double)v13, (double)v14);
  v16 = CGImageGetWidth(a5);
  v17 = CGImageGetHeight(a5);
  v38.size.width = (double)v16;
  v38.size.height = (double)v17;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  CGContextDrawImage(v15, v38, a5);
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  v37 = xmmword_100EF00B0;
  v19 = CGImageGetWidth(Image);
  v20 = CGImageGetHeight(Image);
  BitsPerComponent = CGImageGetBitsPerComponent(Image);
  BitsPerPixel = CGImageGetBitsPerPixel(Image);
  BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  ShouldInterpolate = CGImageGetShouldInterpolate(Image);
  v26 = CGImageMaskCreate(v19, v20, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, (const CGFloat *)&v37, ShouldInterpolate);
  CGImageRelease(Image);
  if (sub_100411FB8((uint64_t)a4) && !CGBitmapContextGetBitmapInfo(a4))
  {
    if (objc_msgSend(v12, "colorRGBSpace", v37) == (id)1)
      v34 = 35;
    else
      v34 = 3;
    v35 = CGImageGetWidth(a5);
    v36 = CGImageGetHeight(a5);
    v32 = sub_10040FA64(v34, (double)v35, (double)v36);
    v30 = (double)CGImageGetWidth(a5);
    v31 = (double)CGImageGetHeight(a5);
    v28 = 0.0;
    v27 = 1;
    v29 = 0.0;
  }
  else
  {
    v27 = 0;
    v28 = x;
    v29 = y;
    v30 = width;
    v31 = height;
    v32 = a4;
  }
  v39.origin.x = v28;
  v39.origin.y = v29;
  v39.size.width = v30;
  v39.size.height = v31;
  CGContextClipToMask(v32, v39, v26);
  CGImageRelease(v26);
  CGContextSetFillColorWithColor(v32, (CGColorRef)objc_msgSend(v12, "CGColor"));
  v40.origin.x = v28;
  v40.origin.y = v29;
  v40.size.width = v30;
  v40.size.height = v31;
  CGContextFillRect(v32, v40);
  if (v27)
  {
    v33 = CGBitmapContextCreateImage(v32);
    CGContextRelease(v32);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    CGContextDrawImage(a4, v41, v33);
    CGImageRelease(v33);
  }
  CGContextRestoreGState(a4);

}

- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v5 = sub_100411FB8((uint64_t)a3);
    if (v5)
      LOBYTE(v5) = !-[CRLBrushStroke p_prefersRasterRenderingInContext:](self, "p_prefersRasterRenderingInContext:", a3);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CE58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32D34();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CE78);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldDrawAsVectorInContext:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1667, 0, "invalid nil value for '%{public}s'", "ctx");

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CE98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32DC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CEB8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_prefersRasterRenderingInContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1675, 0, "invalid nil value for '%{public}s'", "ctx");

  }
  if ((sub_100412B3C((uint64_t)a3) & 1) != 0)
    return 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("Crayon"));

  }
  return v8;
}

- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CED8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32E4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125CEF8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1680, 0, "invalid nil value for '%{public}s'", "ctx");

  }
  v8 = sub_100411FB8((uint64_t)a3);
  if (v8)
    LOBYTE(v8) = !-[CRLBrushStroke p_shouldDrawAsVectorInContext:](self, "p_shouldDrawAsVectorInContext:", a3);
  return v8;
}

- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName"));
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("Crayon"));

  }
  return v4;
}

- (int64_t)p_fastElementPercentage:(double *)a3 forOverallPercentage:(double)a4 onPath:(id)a5 withCachedCurrentElementPercentage:(id *)a6
{
  id v10;
  double v11;
  double var2;
  int64_t v13;
  id v14;
  double v15;
  unint64_t var1;

  v10 = a5;
  objc_msgSend(v10, "length");
  var2 = 0.0;
  if (a6->var0 == v10 && a6->var2 <= v11 * a4)
  {
    var1 = a6->var1;
    if (var1 <= 1)
      v13 = 1;
    else
      v13 = a6->var1;
    if (var1 <= 1)
      var2 = 0.0;
    else
      var2 = a6->var2;
  }
  else
  {
    v13 = 1;
  }
  v14 = objc_msgSend(v10, "elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:", a3, v13, a4, var2);
  if ((uint64_t)v14 > v13)
  {
    do
    {
      objc_msgSend(v10, "lengthOfElement:", v13);
      var2 = var2 + v15;
      ++v13;
    }
    while (v14 != (id)v13);
    objc_storeStrong(&a6->var0, a5);
    a6->var1 = (unint64_t)v14;
    a6->var2 = var2;
  }

  return (int64_t)v14;
}

+ (id)p_metalTextureQueue
{
  if (qword_101415968 != -1)
    dispatch_once(&qword_101415968, &stru_10125CF18);
  return (id)qword_101415960;
}

+ (id)p_metalShaderQueue
{
  if (qword_101415978 != -1)
    dispatch_once(&qword_101415978, &stru_10125CF38);
  return (id)qword_101415970;
}

- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CRLBrushStroke *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100423218;
  v17 = sub_100423228;
  v18 = 0;
  if (qword_101415988 != -1)
    dispatch_once(&qword_101415988, &stru_10125CF58);
  v5 = objc_claimAutoreleasedReturnValue(+[CRLBrushStroke p_metalTextureQueue](CRLBrushStroke, "p_metalTextureQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100423268;
  block[3] = &unk_10125D040;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100423218;
  v18 = sub_100423228;
  v19 = 0;
  if (qword_101415998 != -1)
    dispatch_once(&qword_101415998, &stru_10125D060);
  v6 = objc_claimAutoreleasedReturnValue(+[CRLBrushStroke p_metalShaderQueue](CRLBrushStroke, "p_metalShaderQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100423D24;
  block[3] = &unk_10125D088;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100423218;
  v18 = sub_100423228;
  v19 = 0;
  if (qword_1014159A8 != -1)
    dispatch_once(&qword_1014159A8, &stru_10125D0A8);
  v6 = objc_claimAutoreleasedReturnValue(+[CRLBrushStroke p_metalShaderQueue](CRLBrushStroke, "p_metalShaderQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100424048;
  block[3] = &unk_10125D088;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

@end
