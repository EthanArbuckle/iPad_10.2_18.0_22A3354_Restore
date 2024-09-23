@implementation CRLCanvasAnimation

- (CRLCanvasAnimation)initWithAnimationID:(id)a3
{
  id v5;
  CRLCanvasAnimation *v6;
  CRLCanvasAnimation *v7;
  uint64_t v8;
  CAMediaTimingFunction *timingFunction;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasAnimation;
  v6 = -[CRLCanvasAnimation init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animationID, a3);
    v7->_duration = 0.2;
    v8 = objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    timingFunction = v7->_timingFunction;
    v7->_timingFunction = (CAMediaTimingFunction *)v8;

    v7->_allAnimationsFinishedBeforeStopping = 1;
  }

  return v7;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_animationDictionariesForLayers, "objectForKeyedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  if (!v8)
  {
    if (self->_firstAnimationDidStart)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F470);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0423C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F490);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation actionForLayer:forKey:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 53, 0, "shouldn't be adding animations after we've started showing them");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v6));
    objc_msgSend(v8, "setDuration:", self->_duration);
    objc_msgSend(v8, "setTimingFunction:", self->_timingFunction);
  }
  objc_msgSend(v8, "setDelegate:", self);
  ++self->_outstandingAnimationCount;

  return v8;
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  NSMapTable *animationDictionariesForLayers;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  animationDictionariesForLayers = self->_animationDictionariesForLayers;
  if (!animationDictionariesForLayers)
  {
    v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    v12 = self->_animationDictionariesForLayers;
    self->_animationDictionariesForLayers = v11;

    animationDictionariesForLayers = self->_animationDictionariesForLayers;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](animationDictionariesForLayers, "objectForKeyedSubscript:", v8));
  if (!v13)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    -[NSMapTable setObject:forKeyedSubscript:](self->_animationDictionariesForLayers, "setObject:forKeyedSubscript:", v13, v8);
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v9);

}

- (void)animationDidStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!self->_outstandingAnimationCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F4B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E042BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F4D0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStart:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 87, 0, "unexpected animation started");

  }
  if (!self->_firstAnimationDidStart)
    self->_firstAnimationDidStart = 1;

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int outstandingAnimationCount;
  BOOL v14;
  unsigned int v15;
  void (**completionBlock)(void);

  v6 = a3;
  if (!self->_outstandingAnimationCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F4F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E043BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F510);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStop:finished:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 95, 0, "unexpected animation stopped");

  }
  if (!self->_firstAnimationDidStart)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F530);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0433C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F550);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAnimation animationDidStop:finished:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAnimation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 96, 0, "animation stopped before starting");

  }
  outstandingAnimationCount = self->_outstandingAnimationCount;
  v14 = self->_allAnimationsFinishedBeforeStopping || a4;
  self->_allAnimationsFinishedBeforeStopping = v14;
  v15 = outstandingAnimationCount - 1;
  self->_outstandingAnimationCount = v15;
  if (!v15)
  {
    completionBlock = (void (**)(void))self->_completionBlock;
    if (completionBlock)
      completionBlock[2]();
  }

}

- (NSString)animationID
{
  return self->_animationID;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_animationID, 0);
  objc_storeStrong((id *)&self->_animationDictionariesForLayers, 0);
}

@end
