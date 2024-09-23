@implementation CRLFreehandDrawingPathCreator

- (CRLFreehandDrawingPathCreator)initWithPencilKitSmoothing:(BOOL)a3
{
  _BOOL4 v3;
  CRLFreehandDrawingPathCreator *v4;
  CRLPKStrokeGenerator *v5;
  CRLPKStrokeGenerator *strokeGenerator;
  uint64_t v7;
  CRLBezierPath *immutableBezierPath;
  uint64_t v9;
  CRLBezierPath *mutableBezierPath;
  uint64_t v11;
  CRLBezierPath *committedPath;
  CGSize size;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLFreehandDrawingPathCreator;
  v4 = -[CRLFreehandDrawingPathCreator init](&v15, "init");
  if (v4)
  {
    if (v3)
    {
      v5 = objc_alloc_init(CRLPKStrokeGenerator);
      strokeGenerator = v4->_strokeGenerator;
      v4->_strokeGenerator = v5;

      -[CRLPKStrokeGenerator setSmoothingThresholdMultiplier:](v4->_strokeGenerator, "setSmoothingThresholdMultiplier:", 1.0);
      -[CRLPKStrokeGenerator setPointReductionFilterThresholdMultiplier:](v4->_strokeGenerator, "setPointReductionFilterThresholdMultiplier:", 1.0);
    }
    v4->_immutablePointCount = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    immutableBezierPath = v4->_immutableBezierPath;
    v4->_immutableBezierPath = (CRLBezierPath *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    mutableBezierPath = v4->_mutableBezierPath;
    v4->_mutableBezierPath = (CRLBezierPath *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    committedPath = v4->_committedPath;
    v4->_committedPath = (CRLBezierPath *)v11;

    v4->_initialPoint = (CGPoint)xmmword_100EEC438;
    v4->_creatorState = 0;
    size = CGRectNull.size;
    v4->_lastMutableDirtyRect.origin = CGRectNull.origin;
    v4->_lastMutableDirtyRect.size = size;
    v4->_nextImmutablePointIndexForDirtyRect = 0;
    v4->_minimumLengthForFinalCreatedPath = 0.100000001;
  }
  return v4;
}

- (CRLFreehandDrawingPathCreator)init
{
  return -[CRLFreehandDrawingPathCreator initWithPencilKitSmoothing:](self, "initWithPencilKitSmoothing:", 1);
}

- (void)setSmoothingThresholdMultiplier:(double)a3
{
  int64_t *p_creatorState;
  void *v6;
  void *v7;
  void *v8;
  CRLPKStrokeGenerator *strokeGenerator;
  void *v10;
  void *v11;
  void *v12;

  p_creatorState = &self->_creatorState;
  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F708);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3681C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F728);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setSmoothingThresholdMultiplier:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 129, 0, "Unexpected creator state, %lu", *p_creatorState);

  }
  strokeGenerator = self->_strokeGenerator;
  if (!strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F748);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36784();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F768);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setSmoothingThresholdMultiplier:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 130, 0, "invalid nil value for '%{public}s'", "_strokeGenerator");

    strokeGenerator = self->_strokeGenerator;
  }
  -[CRLPKStrokeGenerator setSmoothingThresholdMultiplier:](strokeGenerator, "setSmoothingThresholdMultiplier:", a3);
}

- (void)setPointReductionFilterThresholdMultiplier:(double)a3
{
  int64_t *p_creatorState;
  void *v6;
  void *v7;
  void *v8;
  CRLPKStrokeGenerator *strokeGenerator;
  void *v10;
  void *v11;
  void *v12;

  p_creatorState = &self->_creatorState;
  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F788);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36944();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F7A8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setPointReductionFilterThresholdMultiplier:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 136, 0, "Unexpected creator state, %lu", *p_creatorState);

  }
  strokeGenerator = self->_strokeGenerator;
  if (!strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F7C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E368AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F7E8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator setPointReductionFilterThresholdMultiplier:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 137, 0, "invalid nil value for '%{public}s'", "_strokeGenerator");

    strokeGenerator = self->_strokeGenerator;
  }
  -[CRLPKStrokeGenerator setPointReductionFilterThresholdMultiplier:](strokeGenerator, "setPointReductionFilterThresholdMultiplier:", a3);
}

- (void)beginDrawingWithViewScale:(double)a3 inputType:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  CRLPKStroke *v10;
  void *v11;

  if (self->_creatorState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F808);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E369D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F828);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 143, 0, "beginDrawing should be called from the waiting state.");

  }
  self->_creatorState = 1;
  self->_viewScale = a3;
  self->_inputType = a4;
  if (self->_strokeGenerator)
  {
    v10 = objc_alloc_init(CRLPKStroke);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v11, "systemUptime");
    -[CRLPKStroke setTimestamp:](v10, "setTimestamp:");

    -[CRLPKStrokeGenerator drawingBeganWithStroke:inputType:inputScale:start:](self->_strokeGenerator, "drawingBeganWithStroke:inputType:inputScale:start:", v10, a4 == 2, &stru_10125F848, 1.0 / a3);
  }
}

- (void)drawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5
{
  -[CRLFreehandDrawingPathCreator p_nonUpdatingDrawToPoint:atTime:predicted:](self, "p_nonUpdatingDrawToPoint:atTime:predicted:", a5, a3.x, a3.y, a4);
  -[CRLFreehandDrawingPathCreator p_updatePath](self, "p_updatePath");
}

- (void)endDrawing
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  CRLPKStrokeGenerator *strokeGenerator;
  NSObject *v8;
  const CGPath *v9;
  CRLBezierPath *v10;
  CRLBezierPath *immutableBezierPath;
  double v12;
  double v13;
  double v14;
  CRLBezierPath *v15;
  CRLBezierPath *v16;
  CRLBezierPath *v17;
  CRLBezierPath *mutableBezierPath;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  if (self->_creatorState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36A54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F888);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator endDrawing]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 186, 0, "endDrawing should be called from the started state.");

  }
  self->_creatorState = 2;
  if (self->_strokeGenerator)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_10045E52C;
    v29 = sub_10045E53C;
    v30 = 0;
    v6 = dispatch_semaphore_create(0);
    strokeGenerator = self->_strokeGenerator;
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10045E544;
    v22 = &unk_10123C480;
    v24 = &v25;
    v8 = v6;
    v23 = v8;
    -[CRLPKStrokeGenerator drawingEndedWithCompletion:](strokeGenerator, "drawingEndedWithCompletion:", &v19);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = (const CGPath *)objc_msgSend((id)v26[5], "newPathRepresentation", v19, v20, v21, v22);
    v10 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v9));
    immutableBezierPath = self->_immutableBezierPath;
    self->_immutableBezierPath = v10;

    CGPathRelease(v9);
    if (-[CRLBezierPath isEmpty](self->_immutableBezierPath, "isEmpty")
      || (-[CRLBezierPath length](self->_immutableBezierPath, "length"),
          v13 = v12,
          -[CRLFreehandDrawingPathCreator minimumLengthForFinalCreatedPath](self, "minimumLengthForFinalCreatedPath"),
          v13 < v14))
    {
      if (self->_initialPoint.x != INFINITY || self->_initialPoint.y != INFINITY)
      {
        -[CRLFreehandDrawingPathCreator minimumLengthForFinalCreatedPath](self, "minimumLengthForFinalCreatedPath");
        v15 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPathCreator p_pathWithLength:fromPoint:](self, "p_pathWithLength:fromPoint:"));
        v16 = self->_immutableBezierPath;
        self->_immutableBezierPath = v15;

      }
    }
    v17 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    mutableBezierPath = self->_mutableBezierPath;
    self->_mutableBezierPath = v17;

    self->_immutablePointCount = 0xCCCCCCCCCCCCCCCDLL
                               * (((char *)self->_filteredStrokePoints.__end_
                                 - (char *)self->_filteredStrokePoints.__begin_) >> 4);

    _Block_object_dispose(&v25, 8);
  }
}

- (id)handoffToNewPathCreator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLFreehandDrawingPathCreator *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double v11;
  double v12;
  double v13;
  char v14;

  if (self->_strokeGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F8A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36B54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F8C8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator handoffToNewPathCreator]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 247, 0, "Can't handoff to a new path creator when using PencilKit.");

  }
  if (self->_inputPointCount <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F8E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36AD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F908);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator handoffToNewPathCreator]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 248, 0, "Need at least two points to do a handoff.");

  }
  -[CRLFreehandDrawingPathCreator endDrawing](self, "endDrawing");
  v9 = -[CRLFreehandDrawingPathCreator initWithPencilKitSmoothing:]([CRLFreehandDrawingPathCreator alloc], "initWithPencilKitSmoothing:", 0);
  -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](v9, "beginDrawingWithViewScale:inputType:", self->_inputType, self->_viewScale);
  end = self->_allInputPoints.__end_;
  v11 = *((double *)end - 11);
  v12 = *((double *)end - 10);
  v13 = *((double *)end - 5);
  v14 = *((_BYTE *)end - 32);
  -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v9, "drawToPoint:atTime:predicted:", *((_BYTE *)end - 120) & 1, *((double *)end - 22), *((double *)end - 21), *((double *)end - 16));
  -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v9, "drawToPoint:atTime:predicted:", v14 & 1, v11, v12, v13);
  return v9;
}

- (id)copyOfEntirePath
{
  id v3;

  v3 = -[CRLBezierPath copy](self->_immutableBezierPath, "copy");
  objc_msgSend(v3, "appendBezierPath:skippingInitialMoveIfPossible:", self->_mutableBezierPath, 1);
  return v3;
}

- (id)copyOfCommittedPath
{
  return -[CRLBezierPath copy](self->_committedPath, "copy");
}

- (id)commitAllAvailablePoints
{
  id v3;

  v3 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", -[CRLBezierPath elementCount](self->_committedPath, "elementCount"), -[CRLFreehandDrawingPathCreator pointCountAvailableToCommit](self, "pointCountAvailableToCommit"));
  -[CRLBezierPath appendBezierPath:skippingInitialMoveIfPossible:](self->_committedPath, "appendBezierPath:skippingInitialMoveIfPossible:", v3, 1);
  return v3;
}

- (id)copyOfUncommittedPath
{
  id v3;

  v3 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", -[CRLBezierPath elementCount](self->_committedPath, "elementCount"), -[CRLFreehandDrawingPathCreator p_immutableUncommittedCountNotAdjustedForLastPoint](self, "p_immutableUncommittedCountNotAdjustedForLastPoint"));
  objc_msgSend(v3, "appendBezierPath:skippingInitialMoveIfPossible:", self->_mutableBezierPath, 1);
  return v3;
}

- (CGRect)takeDirtyRect
{
  CGRect *p_lastMutableDirtyRect;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t nextImmutablePointIndexForDirtyRect;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGSize size;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;
  CGRect v33;

  x = self->_lastMutableDirtyRect.origin.x;
  y = self->_lastMutableDirtyRect.origin.y;
  p_lastMutableDirtyRect = &self->_lastMutableDirtyRect;
  width = self->_lastMutableDirtyRect.size.width;
  height = self->_lastMutableDirtyRect.size.height;
  if (!-[CRLBezierPath isEmpty](self->_immutableBezierPath, "isEmpty"))
  {
    nextImmutablePointIndexForDirtyRect = self->_nextImmutablePointIndexForDirtyRect;
    if (nextImmutablePointIndexForDirtyRect < -[CRLBezierPath elementCount](self->_immutableBezierPath, "elementCount"))
    {
      v9 = -[CRLBezierPath copyWithPointsInRange:](self->_immutableBezierPath, "copyWithPointsInRange:", self->_nextImmutablePointIndexForDirtyRect, (char *)-[CRLBezierPath elementCount](self->_immutableBezierPath, "elementCount")- self->_nextImmutablePointIndexForDirtyRect);
      objc_msgSend(v9, "bounds");
      v32.origin.x = v10;
      v32.origin.y = v11;
      v32.size.width = v12;
      v32.size.height = v13;
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectUnion(v27, v32);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      self->_nextImmutablePointIndexForDirtyRect = -[CRLBezierPath elementCount](self->_immutableBezierPath, "elementCount");

    }
  }
  if (-[CRLBezierPath isEmpty](self->_mutableBezierPath, "isEmpty"))
  {
    size = CGRectNull.size;
    p_lastMutableDirtyRect->origin = CGRectNull.origin;
    p_lastMutableDirtyRect->size = size;
  }
  else
  {
    -[CRLBezierPath bounds](self->_mutableBezierPath, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    v30 = CGRectUnion(v29, v33);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    self->_lastMutableDirtyRect.origin.x = v16;
    self->_lastMutableDirtyRect.origin.y = v18;
    self->_lastMutableDirtyRect.size.width = v20;
    self->_lastMutableDirtyRect.size.height = v22;
  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (unint64_t)pointCountAvailableToCommit
{
  unint64_t result;

  result = -[CRLFreehandDrawingPathCreator p_immutableUncommittedCountNotAdjustedForLastPoint](self, "p_immutableUncommittedCountNotAdjustedForLastPoint");
  if (result)
    result -= self->_creatorState != 2;
  return result;
}

- (BOOL)p_shouldSaveAllPoints
{
  if (!self->_strokeGenerator)
    return 1;
  if (qword_10147E620 != -1)
    dispatch_once(&qword_10147E620, &stru_10125F928);
  return os_log_type_enabled((os_log_t)off_1013DC6C8, OS_LOG_TYPE_DEBUG);
}

- (unint64_t)p_immutableUncommittedCountNotAdjustedForLastPoint
{
  int64_t v3;
  unint64_t result;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CRLBezierPath elementCount](self->_immutableBezierPath, "elementCount");
  result = v3 - -[CRLBezierPath elementCount](self->_committedPath, "elementCount");
  if ((result & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F948);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36BD4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F968);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_immutableUncommittedCountNotAdjustedForLastPoint]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 339, 0, "Out-of-bounds type assignment was clamped to min");

    return 0;
  }
  return result;
}

- (void)p_nonUpdatingDrawToPoint:(CGPoint)a3 atTime:(double)a4 predicted:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CRLPKStrokeGenerator *strokeGenerator;
  _OWORD v40[5];
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  if (self->_creatorState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F988);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36C54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F9A8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_nonUpdatingDrawToPoint:atTime:predicted:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 343, 0, "continueDrawing should be called from the started state.");

  }
  if (self->_initialPoint.x == INFINITY && self->_initialPoint.y == INFINITY)
  {
    self->_initialPoint.x = x;
    self->_initialPoint.y = y;
  }
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  -[CRLFreehandDrawingPathCreator p_drawingInputPoint:atTime:predicted:](self, "p_drawingInputPoint:atTime:predicted:", v5, x, y, a4);
  if (-[CRLFreehandDrawingPathCreator p_shouldSaveAllPoints](self, "p_shouldSaveAllPoints"))
  {
    value = self->_allInputPoints.__end_cap_.__value_;
    end = self->_allInputPoints.__end_;
    if (end >= value)
    {
      begin = self->_allInputPoints.__begin_;
      v22 = 0x2E8BA2E8BA2E8BA3 * ((end - begin) >> 3);
      v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) > 0x2E8BA2E8BA2E8BALL)
        sub_100007810();
      v24 = 0x2E8BA2E8BA2E8BA3 * ((value - begin) >> 3);
      if (2 * v24 > v23)
        v23 = 2 * v24;
      if (v24 >= 0x1745D1745D1745DLL)
        v25 = 0x2E8BA2E8BA2E8BALL;
      else
        v25 = v23;
      if (v25)
        v26 = (char *)sub_100007898((uint64_t)&self->_allInputPoints.__end_cap_, v25);
      else
        v26 = 0;
      v27 = &v26[88 * v22];
      v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v26[88 * v25];
      v29 = v43;
      *(_OWORD *)v27 = v42;
      *((_OWORD *)v27 + 1) = v29;
      v30 = v44;
      v31 = v45;
      v32 = v46;
      *((_QWORD *)v27 + 10) = v47;
      *((_OWORD *)v27 + 3) = v31;
      *((_OWORD *)v27 + 4) = v32;
      *((_OWORD *)v27 + 2) = v30;
      v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v27 + 88);
      v34 = self->_allInputPoints.__begin_;
      v33 = self->_allInputPoints.__end_;
      if (v33 != v34)
      {
        do
        {
          v35 = *(_OWORD *)((char *)v33 - 88);
          *(_OWORD *)(v27 - 72) = *(_OWORD *)((char *)v33 - 72);
          *(_OWORD *)(v27 - 88) = v35;
          v36 = *(_OWORD *)((char *)v33 - 56);
          v37 = *(_OWORD *)((char *)v33 - 40);
          v38 = *(_OWORD *)((char *)v33 - 24);
          *((_QWORD *)v27 - 1) = *((_QWORD *)v33 - 1);
          *(_OWORD *)(v27 - 24) = v38;
          *(_OWORD *)(v27 - 40) = v37;
          *(_OWORD *)(v27 - 56) = v36;
          v27 -= 88;
          v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 88);
        }
        while (v33 != v34);
        v33 = self->_allInputPoints.__begin_;
      }
      self->_allInputPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v27;
      self->_allInputPoints.__end_ = v20;
      self->_allInputPoints.__end_cap_.__value_ = v28;
      if (v33)
        operator delete(v33);
    }
    else
    {
      v16 = v43;
      *(_OWORD *)end = v42;
      *((_OWORD *)end + 1) = v16;
      v17 = v44;
      v18 = v45;
      v19 = v46;
      *((_QWORD *)end + 10) = v47;
      *((_OWORD *)end + 3) = v18;
      *((_OWORD *)end + 4) = v19;
      *((_OWORD *)end + 2) = v17;
      v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
    }
    self->_allInputPoints.__end_ = v20;
  }
  strokeGenerator = self->_strokeGenerator;
  if (strokeGenerator)
  {
    v40[2] = v44;
    v40[3] = v45;
    v40[4] = v46;
    v41 = v47;
    v40[0] = v42;
    v40[1] = v43;
    -[CRLPKStrokeGenerator addPoint:](strokeGenerator, "addPoint:", v40);
  }
  ++self->_inputPointCount;
}

- (void)p_updatePath
{
  unint64_t immutablePointCount;
  CRLPKStrokeGenerator *strokeGenerator;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _CRLPKStrokePoint *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _CRLPKStrokePoint *v23;
  CGPath *v24;
  CRLBezierPath *v25;
  CRLBezierPath *immutableBezierPath;
  _CRLPKStrokePoint *end;
  _CRLPKStrokePoint *v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  CRLBezierPath *v32;
  CRLBezierPath *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  CGPath *v37;
  CRLBezierPath *v38;
  CRLBezierPath *v39;
  CRLBezierPath *v40;
  CRLBezierPath *mutableBezierPath;
  void *v42;
  void *v43;
  uint64_t v44;
  void *__p;
  void *v46;
  uint64_t v47;
  _OWORD v48[5];
  uint64_t v49;
  void *v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  immutablePointCount = self->_immutablePointCount;
  strokeGenerator = self->_strokeGenerator;
  if (strokeGenerator)
  {
    v5 = -[CRLPKStrokeGenerator fetchFilteredPointsFromIndex:intoVector:](strokeGenerator, "fetchFilteredPointsFromIndex:intoVector:", immutablePointCount, &self->_filteredStrokePoints);
    self->_immutablePointCount = v5;
    if (v5 < immutablePointCount)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F9C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E36CD4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F9E8);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPathCreator p_updatePath]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPathCreator.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 368, 0, "The immutable point count should only ever increase.");

      v5 = self->_immutablePointCount;
    }
  }
  else
  {
    sub_10015639C((uint64_t)&self->_filteredStrokePoints, 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - self->_allInputPoints.__begin_) >> 3));
    v9 = self->_immutablePointCount;
    begin = self->_allInputPoints.__begin_;
    if (v9 < 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - begin) >> 3))
    {
      v11 = 88 * v9;
      v12 = v9;
      do
      {
        v13 = (char *)begin + v11;
        v14 = *((_OWORD *)v13 + 1);
        v48[0] = *(_OWORD *)v13;
        v48[1] = v14;
        v16 = *((_OWORD *)v13 + 3);
        v15 = *((_OWORD *)v13 + 4);
        v17 = *((_OWORD *)v13 + 2);
        v49 = *((_QWORD *)v13 + 10);
        v48[3] = v16;
        v48[4] = v15;
        v48[2] = v17;
        +[CRLPKStrokeGenerator outputPointFromInputPoint:](CRLPKStrokeGenerator, "outputPointFromInputPoint:", v48);
        v18 = &self->_filteredStrokePoints.__begin_[v12];
        *(_OWORD *)&v18->timestamp = *(_OWORD *)v50;
        v19 = v51;
        v20 = v52;
        v21 = v54;
        *(_OWORD *)&v18->force = v53;
        *(_OWORD *)&v18->altitude = v21;
        *(_OWORD *)&v18->location.y = v19;
        *(_OWORD *)&v18->aspectRatio = v20;
        ++v9;
        begin = self->_allInputPoints.__begin_;
        v11 += 88;
        ++v12;
      }
      while (v9 < 0x2E8BA2E8BA2E8BA3 * ((self->_allInputPoints.__end_ - begin) >> 3));
    }
    v5 = 0xCCCCCCCCCCCCCCCDLL
       * (((char *)self->_filteredStrokePoints.__end_ - (char *)self->_filteredStrokePoints.__begin_) >> 4);
    self->_immutablePointCount = v5;
  }
  if (v5 > immutablePointCount && v5 >= 2)
  {
    v23 = self->_filteredStrokePoints.__begin_;
    v50[1] = 0;
    *(_QWORD *)&v51 = 0;
    v50[0] = 0;
    sub_10045FA7C(v50, v23, (uint64_t)&v23[v5], v5);
    __p = 0;
    v46 = 0;
    v47 = 0;
    sub_10045FB44(&__p, v50[0], (uint64_t)v50[1], 0xCCCCCCCCCCCCCCCDLL * (((char *)v50[1] - (char *)v50[0]) >> 4));
    v24 = sub_1002EAA30(&__p, 0xCCCCCCCCCCCCCCCDLL* (((char *)self->_filteredStrokePoints.__end_ - (char *)self->_filteredStrokePoints.__begin_) >> 4) > self->_immutablePointCount);
    if (__p)
    {
      v46 = __p;
      operator delete(__p);
    }
    v25 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v24));
    immutableBezierPath = self->_immutableBezierPath;
    self->_immutableBezierPath = v25;

    CGPathRelease(v24);
    if (v50[0])
    {
      v50[1] = v50[0];
      operator delete(v50[0]);
    }
  }
  v28 = self->_filteredStrokePoints.__begin_;
  end = self->_filteredStrokePoints.__end_;
  v29 = 0xCCCCCCCCCCCCCCCDLL * (((char *)end - (char *)v28) >> 4);
  v30 = self->_immutablePointCount;
  if (v29 > 1)
  {
    if (v29 <= v30)
    {
      v40 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
      mutableBezierPath = self->_mutableBezierPath;
      self->_mutableBezierPath = v40;

    }
    else
    {
      v34 = v30 - 1;
      if (!v30)
        v34 = 0;
      v35 = v34 - 1;
      if (v30 >= 2)
        v36 = v35;
      else
        v36 = 0;
      v50[0] = 0;
      v50[1] = 0;
      *(_QWORD *)&v51 = 0;
      sub_10045FA7C(v50, &v28[v36], (uint64_t)end, 0xCCCCCCCCCCCCCCCDLL * (((char *)end - (char *)&v28[v36]) >> 4));
      v42 = 0;
      v43 = 0;
      v44 = 0;
      sub_10045FB44(&v42, v50[0], (uint64_t)v50[1], 0xCCCCCCCCCCCCCCCDLL * (((char *)v50[1] - (char *)v50[0]) >> 4));
      v37 = sub_1002EAA30(&v42, 0);
      if (v42)
      {
        v43 = v42;
        operator delete(v42);
      }
      v38 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v37));
      v39 = self->_mutableBezierPath;
      self->_mutableBezierPath = v38;

      CGPathRelease(v37);
      if (v50[0])
      {
        v50[1] = v50[0];
        operator delete(v50[0]);
      }
    }
  }
  else
  {
    v31 = v30 == 0;
    v32 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPathCreator p_pathWithLength:fromPoint:](self, "p_pathWithLength:fromPoint:", 0.100000001, self->_initialPoint.x, self->_initialPoint.y));
    if (v31)
    {
      v33 = self->_mutableBezierPath;
      self->_mutableBezierPath = v32;
    }
    else
    {
      v33 = self->_immutableBezierPath;
      self->_immutableBezierPath = v32;
    }

  }
}

- ($EB457B8D156C558632463A5C38AABCB2)p_drawingInputPoint:(SEL)a3 atTime:(CGPoint)a4 predicted:(double)a5
{
  retstr->var0 = (CGPoint)xmmword_100EED0E0;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)algn_100EED0F0;
  *(_QWORD *)&retstr->var9 = 0;
  *(_OWORD *)&retstr->var5 = unk_100EED110;
  *(_OWORD *)&retstr->var7 = xmmword_100EED120;
  *(_OWORD *)&retstr->var3 = xmmword_100EED100;
  retstr->var0 = a4;
  retstr->var1 = -1.0;
  retstr->var5 = a5;
  retstr->var6 = a6;
  retstr->var7 = -1;
  return self;
}

- (id)p_pathWithLength:(double)a3 fromPoint:(CGPoint)a4
{
  double y;
  CGFloat v6;
  void *v7;

  y = a4.y;
  v6 = a4.x + a3 * -0.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v7, "moveToPoint:", v6, y);
  objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v6 + a3, y, a3 / 3.0 + v6, y, v6 + a3 / 3.0 * 2.0, y);
  return v7;
}

- (unint64_t)inputPointCount
{
  return self->_inputPointCount;
}

- (double)minimumLengthForFinalCreatedPath
{
  return self->_minimumLengthForFinalCreatedPath;
}

- (void)setMinimumLengthForFinalCreatedPath:(double)a3
{
  self->_minimumLengthForFinalCreatedPath = a3;
}

- (void).cxx_destruct
{
  _CRLPKStrokePoint *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  objc_storeStrong((id *)&self->_committedPath, 0);
  objc_storeStrong((id *)&self->_mutableBezierPath, 0);
  objc_storeStrong((id *)&self->_immutableBezierPath, 0);
  begin = self->_filteredStrokePoints.__begin_;
  if (begin)
  {
    self->_filteredStrokePoints.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_allInputPoints.__begin_;
  if (v4)
  {
    self->_allInputPoints.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_strokeGenerator, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
