@implementation CRLCounterRotateRep

- (id)p_counterRotateInfo
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

  *(_QWORD *)&v3 = objc_opt_class(CRLCounterRotateInfo, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FA08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36D54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FA28);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_counterRotateInfo]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 25, 0, "invalid nil value for '%{public}s'", "counterRotateInfo");

  }
  return v8;
}

- (id)p_possibleChildRep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FA48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36DF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FA68);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_possibleChildRep]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 31, 0, "Should have either one or zero child reps.");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  return v8;
}

- (id)p_childRep
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_possibleChildRep](self, "p_possibleChildRep"));
  if (!v2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FA88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36E90();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FAA8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateRep p_childRep]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 37, 0, "invalid nil value for '%{public}s'", "childRepToReturn");

  }
  return v2;
}

- (CGRect)clipRect
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep"));
  objc_msgSend(v2, "clipRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v21, 0, sizeof(v21));
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v23 = CGRectApplyAffineTransform(v22, &v21);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setNeedsDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCounterRotateRep;
  -[CRLCanvasRep setNeedsDisplay](&v4, "setNeedsDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep"));
  objc_msgSend(v3, "setNeedsDisplay");

}

- (BOOL)isInDynamicOperation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_possibleChildRep](self, "p_possibleChildRep"));
  v3 = objc_msgSend(v2, "isInDynamicOperation");

  return v3;
}

- (id)dynamicResizeDidBegin
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLCounterRotateRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v8, "dynamicResizeDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep"));
  v6 = objc_msgSend(v5, "dynamicResizeDidBegin");

  return v4;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  v4 = a3;
  -[CRLCanvasRep dynamicallyResizingWithTracker:](&v6, "dynamicallyResizingWithTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep", v6.receiver, v6.super_class));
  objc_msgSend(v5, "dynamicallyResizingWithTracker:", v4);

}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep"));
  objc_msgSend(v4, "applyNewBoundsToRep:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v6, "dynamicResizeDidEndWithTracker:", v4);

}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  v4 = a3;
  -[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:](&v6, "dynamicFreeTransformDidBeginWithTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep", v6.receiver, v6.super_class));
  objc_msgSend(v5, "dynamicFreeTransformDidBeginWithTracker:", v4);

}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  v4 = a3;
  -[CRLCanvasRep dynamicallyFreeTransformingWithTracker:](&v6, "dynamicallyFreeTransformingWithTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep", v6.receiver, v6.super_class));
  objc_msgSend(v5, "dynamicallyFreeTransformingWithTracker:", v4);

}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateRep p_childRep](self, "p_childRep"));
  objc_msgSend(v4, "applyNewBoundsToRep:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CRLCounterRotateRep;
  -[CRLCanvasRep dynamicFreeTransformDidEndWithTracker:](&v6, "dynamicFreeTransformDidEndWithTracker:", v4);

}

@end
