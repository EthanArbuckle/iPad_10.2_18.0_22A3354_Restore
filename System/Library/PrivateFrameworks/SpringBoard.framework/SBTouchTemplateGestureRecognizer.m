@implementation SBTouchTemplateGestureRecognizer

- (SBTouchTemplateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBTouchTemplateGestureRecognizer *v4;
  SBTouchTemplateGestureRecognizer *v5;
  UIGestureRecognizerTransformAnalyzer *v6;
  UIGestureRecognizerTransformAnalyzer *transformAnalyzer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTouchTemplateGestureRecognizer;
  v4 = -[SBTouchTemplateGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_sequenceNumber = 1;
    v6 = objc_alloc_init(UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v5->_transformAnalyzer;
    v5->_transformAnalyzer = v6;

  }
  return v5;
}

- (double)cumulativePercentage
{
  double cumulativeMotion;
  double v4;

  if (!-[SBTouchTemplateGestureRecognizer state](self, "state"))
    return 0.0;
  cumulativeMotion = self->_cumulativeMotion;
  -[SBTouchTemplateGestureRecognizer animationDistance](self, "animationDistance");
  return cumulativeMotion / v4;
}

- (int64_t)projectedCompletionTypeForInterval:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  int v12;

  -[SBTouchTemplateGestureRecognizer animationDistance](self, "animationDistance");
  v6 = v5;
  -[SBTouchTemplateGestureRecognizer _projectedMotionForInterval:](self, "_projectedMotionForInterval:", a3);
  v8 = v7;
  v9 = -[SBTouchTemplateGestureRecognizer _directionallyAcceptMotion:](self, "_directionallyAcceptMotion:");
  v10 = fabs(v8);
  v11 = fabs(self->_cumulativeMotionEnvelope) * 0.899999976;
  v12 = !v9;
  if (v10 <= v6 * 0.5)
    v12 = 1;
  if (v10 <= v11)
    v12 = 1;
  if (v8 * self->_cumulativeMotion < 0.0)
    v12 = 1;
  if (v12)
    return -1;
  else
    return 1;
}

- (void)log:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  SBLogSystemGesture();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v8);
    -[SBTouchTemplateGestureRecognizer _log:](self, "_log:", v7);

  }
}

- (void)_log:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[SBTouchTemplateGestureRecognizer logCategory](self, "logCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBTouchTemplateGestureRecognizer _log:].cold.1((uint64_t)self, (uint64_t)v4, v5);

}

- (void)setTemplates:(id)a3 forTouchType:(int64_t)a4
{
  NSMutableDictionary *templatesForTouchType;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  templatesForTouchType = self->_templatesForTouchType;
  if (!templatesForTouchType)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_templatesForTouchType;
    self->_templatesForTouchType = v7;

    templatesForTouchType = self->_templatesForTouchType;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](templatesForTouchType, "setObject:forKey:", v10, v9);

}

- (id)templatesForTouchType:(int64_t)a3
{
  NSMutableDictionary *templatesForTouchType;
  void *v4;
  void *v5;

  templatesForTouchType = self->_templatesForTouchType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](templatesForTouchType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasSignificantMotionToBegin
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = -[SBTouchTemplateGestureRecognizer _directionallyAcceptMotion:](self, "_directionallyAcceptMotion:", self->_cumulativeMotion);
  if (!v3)
  {
    SBLogSystemGesture();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
      -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("hasSignificantMotionToBegin is NO because it hasn't been directionally accepted for required direction: %d cumulativeMotion: %f"), -[SBTouchTemplateGestureRecognizer requiredDirectionality](self, "requiredDirectionality"), *(_QWORD *)&self->_cumulativeMotion);
  }
  return v3;
}

- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchTemplateGestureRecognizer.m"), 128, CFSTR("Subclasses must override this function"));

  return 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v15 = a3;
  v6 = a4;
  self->_trackingTouchCount += objc_msgSend(v15, "count");
  -[SBTouchTemplateGestureRecognizer _matchedTemplate](self, "_matchedTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  if (-[SBTouchTemplateGestureRecognizer _shouldAddNewTouchesAfterGestureRecognition](self, "_shouldAddNewTouchesAfterGestureRecognition"))
  {
    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "unionSet:", v15);
    -[SBTouchTemplateGestureRecognizer _updateMatchedTemplateForTouchesBeganOrEnded:](self, "_updateMatchedTemplateForTouchesBeganOrEnded:", v9);

LABEL_4:
    objc_msgSend(v15, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v11 != 1)
      -[SBTouchTemplateGestureRecognizer _pingNoChangeCancellationTimer](self, "_pingNoChangeCancellationTimer");
    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTouchTemplateGestureRecognizer _updateForTouchesBeganOrMoved:](self, "_updateForTouchesBeganOrMoved:", v12);

    goto LABEL_10;
  }
  SBLogSystemGesture();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("%s - Got another touch but we're already matching, so ignore this one"), "-[SBTouchTemplateGestureRecognizer touchesBegan:withEvent:]");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__SBTouchTemplateGestureRecognizer_touchesBegan_withEvent___block_invoke;
  v16[3] = &unk_1E8EB4E88;
  v16[4] = self;
  v17 = v6;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);

LABEL_10:
}

uint64_t __59__SBTouchTemplateGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  return objc_msgSend(*(id *)(a1 + 32), "ignoreTouch:forEvent:", a2, *(_QWORD *)(a1 + 40));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;

  objc_msgSend(a4, "touchesForGestureRecognizer:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTouchTemplateGestureRecognizer _updateForTouchesBeganOrMoved:](self, "_updateForTouchesBeganOrMoved:", v5);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SBTouchTemplateGestureRecognizer _matchedTemplate](self, "_matchedTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "minusSet:", v11);
    -[SBTouchTemplateGestureRecognizer _polygonForTouches:](self, "_polygonForTouches:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTouchTemplateGestureRecognizer _computeGestureMotionWithTouches:polygon:](self, "_computeGestureMotionWithTouches:polygon:", v9, v10);
    -[SBTouchTemplateGestureRecognizer _updateMatchedTemplateForTouchesBeganOrEnded:](self, "_updateMatchedTemplateForTouchesBeganOrEnded:", v9);

  }
  -[SBTouchTemplateGestureRecognizer _updateForTouchesCancelledOrEnded:state:withEvent:](self, "_updateForTouchesCancelledOrEnded:state:withEvent:", v11, 3, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "touchesForGestureRecognizer:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v7);
  -[SBTouchTemplateGestureRecognizer _updateForTouchesBeganOrMoved:](self, "_updateForTouchesBeganOrMoved:", v9);
  -[SBTouchTemplateGestureRecognizer _updateForTouchesCancelledOrEnded:state:withEvent:](self, "_updateForTouchesCancelledOrEnded:state:withEvent:", v7, 4, v6);

}

- (void)reset
{
  objc_super v3;

  -[SBTouchTemplateGestureRecognizer _reset](self, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)SBTouchTemplateGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer reset](&v3, sel_reset);
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  objc_super v10;

  if (-[SBTouchTemplateGestureRecognizer state](self, "state") != a3)
  {
    SBLogSystemGesture();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      SBSystemGestureRecognizerStateDescription(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("Recognizer changing state to %@"), v7);

    }
    if (a3 == 1)
    {
      self->_recognitionBegan = 1;
      SBLogSystemGesture();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

      if (v9)
        -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("Beginning gesture recognition sequence number %lu"), self->_sequenceNumber);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SBTouchTemplateGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer setState:](&v10, sel_setState_, a3);
}

- (void)_pingNoChangeCancellationTimer
{
  NSTimer *noChangeCancellationTimer;
  NSTimer *v4;
  NSTimer *v5;
  NSTimer *v6;
  id v7;

  noChangeCancellationTimer = self->_noChangeCancellationTimer;
  if (noChangeCancellationTimer)
  {
    if (!-[NSTimer isValid](noChangeCancellationTimer, "isValid"))
      return;
    v4 = self->_noChangeCancellationTimer;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](v4, "setFireDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__noChangeCancellationTimerFired_, 0, 0, 0.2);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v6 = self->_noChangeCancellationTimer;
    self->_noChangeCancellationTimer = v5;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", self->_noChangeCancellationTimer, *MEMORY[0x1E0C99860]);
  }

}

- (void)_invalidateNoChangeCancellationTimer
{
  -[NSTimer invalidate](self->_noChangeCancellationTimer, "invalidate");
}

- (void)_resetNoChangeCancellationTimer
{
  NSTimer *noChangeCancellationTimer;

  -[NSTimer invalidate](self->_noChangeCancellationTimer, "invalidate");
  noChangeCancellationTimer = self->_noChangeCancellationTimer;
  self->_noChangeCancellationTimer = 0;

}

- (void)_noChangeCancellationTimerFired:(id)a3
{
  if (!-[SBTouchTemplateGestureRecognizer state](self, "state", a3))
    -[SBTouchTemplateGestureRecognizer _failMeForReason:](self, "_failMeForReason:", CFSTR("No change cancellation timer fired."));
}

- (id)_polygonForTouches:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  SBPolygon *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBTouchTemplateGestureRecognizer__polygonForTouches___block_invoke;
  v9[3] = &unk_1E8EB4EB0;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  if (objc_msgSend(v6, "count"))
    v7 = -[SBPolygon initWithPoints:]([SBPolygon alloc], "initWithPoints:", v6);
  else
    v7 = 0;

  return v7;
}

void __55__SBTouchTemplateGestureRecognizer__polygonForTouches___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "locationInView:", 0);
  objc_msgSend(v3, "valueWithCGPoint:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_directionallyAcceptMotion:(double)a3
{
  int64_t requiredDirectionality;

  requiredDirectionality = self->_requiredDirectionality;
  if (requiredDirectionality == 1)
    return a3 >= 0.0;
  if (requiredDirectionality == -1)
    return a3 <= 0.0;
  return 1;
}

- (double)_projectedMotionForInterval:(double)a3
{
  return self->_cumulativeMotion + self->_smoothedIncrementalMotion * (a3 / 0.016);
}

- (void)_updateForTouchesCancelledOrEnded:(id)a3 state:(int64_t)a4 withEvent:(id)a5
{
  id v9;
  unint64_t trackingTouchCount;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTouchTemplateGestureRecognizer.m"), 267, CFSTR("state must be cancelled or ended."));

  }
  trackingTouchCount = self->_trackingTouchCount;
  if (trackingTouchCount < 3 || trackingTouchCount == objc_msgSend(v13, "count"))
  {
    if (-[SBTouchTemplateGestureRecognizer state](self, "state"))
    {
      -[SBTouchTemplateGestureRecognizer setState:](self, "setState:", a4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s - hadn't recognized yet and we were tracking this touch"), "-[SBTouchTemplateGestureRecognizer _updateForTouchesCancelledOrEnded:state:withEvent:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTouchTemplateGestureRecognizer _failMeForReason:](self, "_failMeForReason:", v11);

    }
  }
  self->_trackingTouchCount -= objc_msgSend(v13, "count");

}

- (void)_updateForTouchesBeganOrMoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBTouchTemplateGestureRecognizer _polygonForTouches:](self, "_polygonForTouches:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBTouchTemplateGestureRecognizer state](self, "state"))
  {
    -[SBTouchTemplateGestureRecognizer _matchedTemplate](self, "_matchedTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[SBTouchTemplateGestureRecognizer _attemptTemplateMatchWithTouches:polygon:](self, "_attemptTemplateMatchWithTouches:polygon:", v6, v4);
  }
  -[SBTouchTemplateGestureRecognizer _computeGestureMotionWithTouches:polygon:](self, "_computeGestureMotionWithTouches:polygon:", v6, v4);

}

- (id)_matchedTemplateForTouches:(id)a3 polygon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  SBTouchTemplateGestureRecognizer *v25;
  _QWORD *v26;
  uint64_t *v27;
  id v28[2];
  id location;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[3];
  char v37;

  v6 = a3;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v7 = a4;
  SBLogSystemGesture();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("%s - candidate: %@ from points: %@"), "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]", v7, 0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__77;
  v34 = __Block_byref_object_dispose__77;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  objc_msgSend(v6, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  -[SBTouchTemplateGestureRecognizer templatesForTouchType:](self, "templatesForTouchType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == 1)
    v14 = 4.0;
  else
    v14 = 1.0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__SBTouchTemplateGestureRecognizer__matchedTemplateForTouches_polygon___block_invoke;
  v22[3] = &unk_1E8EB4ED8;
  v15 = v6;
  v23 = v15;
  v26 = v36;
  v16 = v7;
  v24 = v16;
  v28[1] = *(id *)&v14;
  objc_copyWeak(v28, &location);
  v25 = self;
  v27 = &v30;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);

  SBLogSystemGesture();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  if (v18)
  {
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("%s - attemptedTemplateMatch: %@ # of attempts so far: %lu"), "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]", v19, -[SBTouchTemplateGestureRecognizer _failedRecognitionAttempts](self, "_failedRecognitionAttempts"));

  }
  v20 = (id)v31[5];
  objc_destroyWeak(v28);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(v36, 8);
  return v20;
}

void __71__SBTouchTemplateGestureRecognizer__matchedTemplateForTouches_polygon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id v12;
  id WeakRetained;
  SBTemplateAndMorph *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a2;
  v8 = objc_msgSend(v7, "pointCount");
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(double *)(a1 + 80);
    v18 = 0;
    v11 = objc_msgSend(v7, "matchesPolygon:matchTransformsAllowed:acceptanceFactor:outMorphedCandidate:", v9, 15, &v18, v10);
    v12 = v18;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v14 = -[SBTemplateAndMorph initWithTemplate:morph:]([SBTemplateAndMorph alloc], "initWithTemplate:morph:", v7, v12);
    objc_msgSend(WeakRetained, "addObject:", v14);

    SBLogSystemGesture();
    v15 = objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v14)
    {
      v16 = *(void **)(a1 + 48);
      stringForSBTouchTemplateMatchResult(v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "log:", CFSTR("%s - result: %@ template: %@"), "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]_block_invoke", v17, v7);

    }
    if (v11 == 1)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }

  }
}

- (void)_updateMatchedTemplateForTouchesBeganOrEnded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBTouchTemplateGestureRecognizer _touchesByFilteringRestingTrackpadTouches:](self, "_touchesByFilteringRestingTrackpadTouches:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTouchTemplateGestureRecognizer _polygonForTouches:](self, "_polygonForTouches:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:](self, "_matchedTemplateForTouches:polygon:", v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBTouchTemplateGestureRecognizer _setMatchedTemplate:](self, "_setMatchedTemplate:", v5);
    v6 = v4;
  }
  else
  {
    if (-[SBTouchTemplateGestureRecognizer state](self, "state"))
      goto LABEL_5;
    -[SBTouchTemplateGestureRecognizer _setMatchedTemplate:](self, "_setMatchedTemplate:", 0);
    v6 = 0;
  }
  -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](self, "_setMatchedPolygon:", v6);
LABEL_5:

}

- (void)_attemptTemplateMatchWithTouches:(id)a3 polygon:(id)a4
{
  id v6;
  void *v7;
  NSMapTable *v8;
  NSMapTable *initialTouchPointMap;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v6 = a4;
  -[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:](self, "_matchedTemplateForTouches:polygon:", v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBTouchTemplateGestureRecognizer _setMatchedTemplate:](self, "_setMatchedTemplate:", v7);
    -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](self, "_setMatchedPolygon:", v6);
    if (!self->_initialTouchPointMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      initialTouchPointMap = self->_initialTouchPointMap;
      self->_initialTouchPointMap = v8;

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__SBTouchTemplateGestureRecognizer__attemptTemplateMatchWithTouches_polygon___block_invoke;
    v12[3] = &unk_1E8EB4EB0;
    v12[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
    self->_failedRecognitionAttempts = 0;
  }
  else
  {
    ++self->_failedRecognitionAttempts;
    if (-[SBTouchTemplateGestureRecognizer _failedRecognitionAttempts](self, "_failedRecognitionAttempts") >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s - >%d attempts and still no template matches"), "-[SBTouchTemplateGestureRecognizer _attemptTemplateMatchWithTouches:polygon:]", 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTouchTemplateGestureRecognizer _failMeForReason:](self, "_failMeForReason:", v10);

    }
  }

}

void __77__SBTouchTemplateGestureRecognizer__attemptTemplateMatchWithTouches_polygon___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
  v3 = (void *)MEMORY[0x1E0CB3B18];
  v4 = a2;
  objc_msgSend(v4, "locationInView:", 0);
  objc_msgSend(v3, "valueWithCGPoint:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, v4);

}

- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double cumulativeMotion;
  double smoothedIncrementalMotion;
  float v15;
  double v16;
  double cumulativeMotionEnvelope;
  void *v18;
  double v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;

  v6 = a3;
  v7 = a4;
  -[UIGestureRecognizerTransformAnalyzer analyzeTouches:](self->_transformAnalyzer, "analyzeTouches:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  -[SBTouchTemplateGestureRecognizer incrementalGestureMotionForCandidate:withTransformAnalyzerInfo:](self, "incrementalGestureMotionForCandidate:withTransformAnalyzerInfo:", v9, v8);
  v11 = v10;
  self->_cumulativeMotion = v10 + self->_cumulativeMotion;
  -[SBTouchTemplateGestureRecognizer animationDistance](self, "animationDistance");
  cumulativeMotion = self->_cumulativeMotion;
  if (cumulativeMotion > v12 || (v12 = -v12, cumulativeMotion < v12))
    self->_cumulativeMotion = v12;
  smoothedIncrementalMotion = self->_smoothedIncrementalMotion;
  v15 = dbl_1D0E8A440[fabs(v11) > fabs(smoothedIncrementalMotion)];
  self->_smoothedIncrementalMotion = smoothedIncrementalMotion * (1.0 - v15) + v15 * v11;
  v16 = self->_cumulativeMotion;
  cumulativeMotionEnvelope = self->_cumulativeMotionEnvelope;
  if (fabs(v16) > fabs(cumulativeMotionEnvelope) || v16 * cumulativeMotionEnvelope < 0.0)
    self->_cumulativeMotionEnvelope = v16;
  if (-[SBTouchTemplateGestureRecognizer state](self, "state"))
    -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](self, "_setMatchedPolygon:", v9);
  if (!-[SBTouchTemplateGestureRecognizer state](self, "state"))
  {
    -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = fmin((float)(20.0 / (float)(unint64_t)objc_msgSend(v9, "pointCount")), 10.0);
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = fabs(self->_cumulativeMotion) >= v19;
      SBLogSystemGesture();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v21)
      {
        NSStringFromBOOL();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("motionAccepted: %@, _cumulativeMotion: %f commitDistance: %f"), v22, *(_QWORD *)&self->_cumulativeMotion, *(_QWORD *)&v19);

      }
      if (*((_BYTE *)v25 + 24))
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __77__SBTouchTemplateGestureRecognizer__computeGestureMotionWithTouches_polygon___block_invoke;
        v23[3] = &unk_1E8EB4F00;
        *(double *)&v23[6] = v19;
        v23[4] = self;
        v23[5] = &v24;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);
        if (*((_BYTE *)v25 + 24))
        {
          if (-[SBTouchTemplateGestureRecognizer hasSignificantMotionToBegin](self, "hasSignificantMotionToBegin"))
          {
            -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](self, "_setMatchedPolygon:", v9);
            -[SBTouchTemplateGestureRecognizer setState:](self, "setState:", 1);
            self->_cumulativeMotion = 0.0;
          }
          else
          {
            ++self->_failedRecognitionAttempts;
            if (-[SBTouchTemplateGestureRecognizer _failedRecognitionAttempts](self, "_failedRecognitionAttempts") >= 0xB)
              -[SBTouchTemplateGestureRecognizer _failMeForReason:](self, "_failMeForReason:", CFSTR("Have enough motion, but the subclass doesn't agree'"));
          }
        }
      }
      _Block_object_dispose(&v24, 8);
    }
  }

}

void __77__SBTouchTemplateGestureRecognizer__computeGestureMotionWithTouches_polygon___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double v7;
  id v8;

  v5 = a2;
  objc_msgSend(v5, "locationInView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v8, "CGPointValue");
    UIDistanceBetweenPoints();
    v6 = v8;
    if (v7 < *(double *)(a1 + 48))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }

}

- (void)_failMeForReason:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  SBLogSystemGesture();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("Failed: %@"), v6);
  -[SBTouchTemplateGestureRecognizer setState:](self, "setState:", 5);
  -[SBTouchTemplateGestureRecognizer _invalidateNoChangeCancellationTimer](self, "_invalidateNoChangeCancellationTimer");

}

- (void)_reset
{
  NSObject *v3;
  _BOOL4 v4;

  -[SBTouchTemplateGestureRecognizer _resetNoChangeCancellationTimer](self, "_resetNoChangeCancellationTimer");
  if (self->_recognitionBegan)
  {
    SBLogSystemGesture();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      -[SBTouchTemplateGestureRecognizer log:](self, "log:", CFSTR("Ending gesture recognition sequence %lu"), self->_sequenceNumber);
    self->_recognitionBegan = 0;
    ++self->_sequenceNumber;
  }
  self->_failedRecognitionAttempts = 0;
  -[SBTouchTemplateGestureRecognizer _setMatchedTemplate:](self, "_setMatchedTemplate:", 0);
  -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](self, "_setMatchedPolygon:", 0);
  -[UIGestureRecognizerTransformAnalyzer reset](self->_transformAnalyzer, "reset");
  -[NSMapTable removeAllObjects](self->_initialTouchPointMap, "removeAllObjects");
  self->_trackingTouchCount = 0;
  self->_cumulativeMotion = 0.0;
  self->_cumulativeMotionEnvelope = 0.0;
  self->_smoothedIncrementalMotion = 0.0;
}

- (BOOL)_shouldAddNewTouchesAfterGestureRecognition
{
  return 0;
}

- (id)_touchesByFilteringRestingTrackpadTouches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "_isRestingTouch"))
        {
          if (!v6)
            v6 = (void *)objc_msgSend(v3, "mutableCopy");
          objc_msgSend(v6, "removeObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v10 = v6;
  else
    v10 = v3;
  v11 = v10;

  return v11;
}

- (NSTimer)_noChangeCancellationTimer
{
  return self->_noChangeCancellationTimer;
}

- (void)_setNoChangeCancellationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_noChangeCancellationTimer, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSMutableDictionary)templatesForTouchType
{
  return self->_templatesForTouchType;
}

- (NSMapTable)_initialTouchPointMap
{
  return self->_initialTouchPointMap;
}

- (unint64_t)_failedRecognitionAttempts
{
  return self->_failedRecognitionAttempts;
}

- (void)_setFailedRecognitionAttempts:(unint64_t)a3
{
  self->_failedRecognitionAttempts = a3;
}

- (unint64_t)_trackingTouchCount
{
  return self->_trackingTouchCount;
}

- (void)_setTrackingTouchCount:(unint64_t)a3
{
  self->_trackingTouchCount = a3;
}

- (double)_cumulativeMotion
{
  return self->_cumulativeMotion;
}

- (void)_setCumulativeMotion:(double)a3
{
  self->_cumulativeMotion = a3;
}

- (double)_cumulativeMotionEnvelope
{
  return self->_cumulativeMotionEnvelope;
}

- (void)_setCumulativeMotionEnvelope:(double)a3
{
  self->_cumulativeMotionEnvelope = a3;
}

- (double)_smoothedIncrementalMotion
{
  return self->_smoothedIncrementalMotion;
}

- (void)_setSmoothedIncrementalMotion:(double)a3
{
  self->_smoothedIncrementalMotion = a3;
}

- (double)animationDistance
{
  return self->_animationDistance;
}

- (void)setAnimationDistance:(double)a3
{
  self->_animationDistance = a3;
}

- (int64_t)requiredDirectionality
{
  return self->_requiredDirectionality;
}

- (void)setRequiredDirectionality:(int64_t)a3
{
  self->_requiredDirectionality = a3;
}

- (UIGestureRecognizerTransformAnalyzer)transformAnalyzer
{
  return self->_transformAnalyzer;
}

- (SBTouchTemplate)_matchedTemplate
{
  return self->_matchedTemplate;
}

- (void)_setMatchedTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTemplate, a3);
}

- (SBPolygon)_matchedPolygon
{
  return self->_matchedPolygon;
}

- (void)_setMatchedPolygon:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPolygon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedPolygon, 0);
  objc_storeStrong((id *)&self->_matchedTemplate, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
  objc_storeStrong((id *)&self->_initialTouchPointMap, 0);
  objc_storeStrong((id *)&self->_templatesForTouchType, 0);
  objc_storeStrong((id *)&self->_noChangeCancellationTimer, 0);
}

- (id)logCategory
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)_log:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v7, 0x16u);

}

@end
