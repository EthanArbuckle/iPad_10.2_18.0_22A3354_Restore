@implementation CRLCanvasButtonKnobTracker

- (CRLCanvasButtonKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLCanvasButtonKnobTracker *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class(CRLCanvasButtonKnob, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012580F8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2B374(v10, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101258118);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasButtonKnobTracker initWithRep:knob:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasButtonKnobTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 27, 0, "button knob tracker made without a button knob");

  }
  v17.receiver = self;
  v17.super_class = (Class)CRLCanvasButtonKnobTracker;
  v15 = -[CRLCanvasKnobTracker initWithRep:knob:](&v17, "initWithRep:knob:", v6, v7);

  return v15;
}

- (BOOL)allowHUDToDisplay
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 0;
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 0;
}

- (BOOL)p_knobContainsCurrentPosition
{
  CRLCanvasButtonKnobTracker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  -[CRLCanvasKnobTracker currentPosition](v2, "currentPosition");
  LOBYTE(v2) = objc_msgSend(v3, "isHitByUnscaledPoint:inputType:", 1);

  return (char)v2;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  *(_QWORD *)&v4 = objc_opt_class(CRLCanvasButtonKnob, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob", v4));
  v8 = sub_100221D0C(v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "isEnabled"))
    objc_msgSend(v9, "setHighlighted:", -[CRLCanvasButtonKnobTracker p_knobContainsCurrentPosition](self, "p_knobContainsCurrentPosition"));

}

- (void)endMovingKnob
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  CRLCanvasButtonKnobTracker *v9;
  void *v10;
  objc_super v11;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasButtonKnob, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "setHighlighted:", 0);
  v9 = self;
  if (objc_msgSend(v8, "isEnabled")
    && -[CRLCanvasButtonKnobTracker p_knobContainsCurrentPosition](v9, "p_knobContainsCurrentPosition"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnobTracker target](v9, "target"));
    objc_msgSend(v10, -[CRLCanvasButtonKnobTracker action](v9, "action"), v9);

  }
  v11.receiver = v9;
  v11.super_class = (Class)CRLCanvasButtonKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v11, "endMovingKnob");

}

- (BOOL)traceIfDesiredForBeginOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101258138);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin button knob interaction", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101258158);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end button knob interaction", v4, 2u);
  }
  return 1;
}

- (id)target
{
  return objc_loadWeakRetained(&self->mTarget);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->mTarget, a3);
}

- (SEL)action
{
  return self->mAction;
}

- (void)setAction:(SEL)a3
{
  self->mAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->mTarget);
}

@end
