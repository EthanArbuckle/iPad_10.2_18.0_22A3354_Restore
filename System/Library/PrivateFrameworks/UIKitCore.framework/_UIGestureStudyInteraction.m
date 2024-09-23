@implementation _UIGestureStudyInteraction

- (_UIGestureStudyInteraction)initWithDelegate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  _UIGestureStudyInteraction *v9;
  _UIGestureStudyInteraction *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.springboard"));

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIGestureStudyInteraction.m"), 89, CFSTR("This interaction is only intended for use in SpringBoard."));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIGestureStudyInteraction;
  v9 = -[_UIGestureStudyInteraction init](&v13, sel_init);
  v10 = v9;
  if (v9)
    -[_UIGestureStudyInteraction setDelegate:](v9, "setDelegate:", v5);

  return v10;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v4 = a3;
  -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIGestureStudyInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4, v8, v10);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UIGestureStudyInteraction forceClickInteraction](self, "forceClickInteraction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyInteraction forceClickInteraction](self, "forceClickInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteraction:", v6);

  -[_UIGestureStudyInteraction longPressClickInteraction](self, "longPressClickInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyInteraction longPressClickInteraction](self, "longPressClickInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeInteraction:", v9);

  -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeGestureRecognizer:", v11);

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  void *v6;
  int v7;
  void *v8;
  _UIGestureStudyClickInteraction *v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  _UIGestureStudyClickInteraction *v13;
  void *v14;
  void *v15;
  _UIGestureStudyMetricsGestureRecognizer *v16;
  void *v17;
  id v18;
  void *v19;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_supportsForceTouch");

    if (v7)
    {
      -[_UIGestureStudyInteraction forceClickInteraction](self, "forceClickInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = -[_UIGestureStudyClickInteraction initWithTarget:action:useForce:]([_UIGestureStudyClickInteraction alloc], "initWithTarget:action:useForce:", self, sel__interactionDidTrigger_, 1);
        -[_UIGestureStudyInteraction setForceClickInteraction:](self, "setForceClickInteraction:", v9);

      }
      WeakRetained = objc_loadWeakRetained((id *)p_view);
      -[_UIGestureStudyInteraction forceClickInteraction](self, "forceClickInteraction");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIGestureStudyInteraction longPressClickInteraction](self, "longPressClickInteraction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = -[_UIGestureStudyClickInteraction initWithTarget:action:useForce:]([_UIGestureStudyClickInteraction alloc], "initWithTarget:action:useForce:", self, sel__interactionDidTrigger_, 0);
        -[_UIGestureStudyInteraction setLongPressClickInteraction:](self, "setLongPressClickInteraction:", v13);

      }
      WeakRetained = objc_loadWeakRetained((id *)p_view);
      -[_UIGestureStudyInteraction longPressClickInteraction](self, "longPressClickInteraction");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v11;
    objc_msgSend(WeakRetained, "addInteraction:", v11);

    -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = -[_UIGestureStudyMetricsGestureRecognizer initWithTarget:action:]([_UIGestureStudyMetricsGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleMetricsEvent_);
      -[_UIGestureStudyInteraction setMetricsGestureRecognizer:](self, "setMetricsGestureRecognizer:", v16);

      -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegate:", self);

    }
    v18 = objc_loadWeakRetained((id *)p_view);
    -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addGestureRecognizer:", v19);

  }
}

- (void)_handleMetricsEvent:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "state") != 3)
    goto LABEL_9;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__211;
  v18 = __Block_byref_object_dispose__211;
  -[_UIGestureStudyInteraction eventMetadata](self, "eventMetadata");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIGestureStudyInteraction setEventMetadata:](self, "setEventMetadata:", 0);
  if (!v15[5])
  {
    objc_msgSend(v4, "movement");
    if (v5 >= 100.0)
    {
LABEL_8:
      _Block_object_dispose(&v14, 8);

LABEL_9:
      return;
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___UIGestureStudyInteraction__handleMetricsEvent___block_invoke;
  aBlock[3] = &unk_1E16E73C0;
  v13 = &v14;
  v12 = v4;
  v6 = _Block_copy(aBlock);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = getAnalyticsSendEventLazySymbolLoc_ptr;
  v23 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v8 = CoreAnalyticsLibrary();
    v7 = dlsym(v8, "AnalyticsSendEventLazy");
    v21[3] = (uint64_t)v7;
    getAnalyticsSendEventLazySymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v20, 8);
  if (v7)
  {
    ((void (*)(const __CFString *, void *))v7)(CFSTR("com.apple.UIKit.CoverSheetStudy.v1"), v6);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool __AnalyticsSendEventLazy(NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_UIGestureStudyInteraction.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[_UIGestureStudyInteraction metricsGestureRecognizer](self, "metricsGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)_reportEventForTriggeredParticipant:(id)a3
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
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v5 = getAnalyticsIsEventUsedSymbolLoc_ptr;
  v19 = getAnalyticsIsEventUsedSymbolLoc_ptr;
  if (!getAnalyticsIsEventUsedSymbolLoc_ptr)
  {
    v6 = CoreAnalyticsLibrary();
    v5 = dlsym(v6, "AnalyticsIsEventUsed");
    v17[3] = (uint64_t)v5;
    getAnalyticsIsEventUsedSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    if (((unsigned int (*)(const __CFString *))v5)(CFSTR("com.apple.UIKit.CoverSheetStudy.v1")))
    {
      v7 = (void *)objc_opt_new();
      -[_UIGestureStudyInteraction _baseMetadataForTriggeredParticipant:](self, "_baseMetadataForTriggeredParticipant:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v8);

      -[_UIGestureStudyInteraction delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadataForTriggeredInteraction:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __66___UIGestureStudyInteraction__reportEventForTriggeredParticipant___block_invoke;
      v14[3] = &unk_1E16B5BD8;
      v15 = v7;
      v11 = v7;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
      -[_UIGestureStudyInteraction setEventMetadata:](self, "setEventMetadata:", v11);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool __AnalyticsIsEventUsed(NSString *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_UIGestureStudyInteraction.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (id)_baseMetadataForTriggeredParticipant:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  long double v17;
  long double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26[0] = CFSTR("gesture_type");
  objc_msgSend(v4, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v26[1] = CFSTR("duration_on_event");
  objc_msgSend(v4, "duration");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = 0.0;
  v9 = 0.0;
  if (v6 != 0.0)
  {
    v10 = fabs(v6);
    v11 = v6 / v10;
    v12 = log10(v10);
    v13 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v12));
    v9 = v11 * (round(v10 * v13) / v13);
  }
  objc_msgSend(v7, "numberWithDouble:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  v26[2] = CFSTR("movement_on_event");
  objc_msgSend(v4, "movement");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (v15 != 0.0)
  {
    v17 = fabs(v15);
    v18 = v15 / v17;
    v19 = log10(v17);
    v20 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v19));
    v8 = v18 * (round(v17 * v20) / v20);
  }
  objc_msgSend(v16, "numberWithDouble:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  v26[3] = CFSTR("display_region");
  -[_UIGestureStudyInteraction _viewRegionForTriggeredParticipant:](self, "_viewRegionForTriggeredParticipant:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v26[4] = CFSTR("touch_count_on_event");
  -[_UIGestureStudyInteraction _numberOfActiveTouches](self, "_numberOfActiveTouches");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_viewRegionForTriggeredParticipant:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  __CFString *v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  -[_UIGestureStudyInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInCoordinateSpace:", v5);
  v7 = v6;
  v9 = v8;

  -[_UIGestureStudyInteraction view](self, "view");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  v11 = (void *)v10;
  -[_UIGestureStudyInteraction view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v20.x = v7;
  v20.y = v9;
  v13 = CGRectContainsPoint(v21, v20);

  if (v13)
  {
    -[_UIGestureStudyInteraction view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = v7 / CGRectGetWidth(v22);
    -[_UIGestureStudyInteraction view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v17 = v9 / CGRectGetHeight(v23);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu,%lu"), llround(v15 / 0.333333333), llround(v17 / 0.333333333));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v18 = CFSTR("Unknown");
  }
  return v18;
}

- (id)_numberOfActiveTouches
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)UIApp;
  -[_UIGestureStudyInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_touchesEventForWindow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "allTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIGestureStudyInteractionDelegate)delegate
{
  return (_UIGestureStudyInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIGestureStudyClickInteraction)forceClickInteraction
{
  return self->_forceClickInteraction;
}

- (void)setForceClickInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_forceClickInteraction, a3);
}

- (_UIGestureStudyClickInteraction)longPressClickInteraction
{
  return self->_longPressClickInteraction;
}

- (void)setLongPressClickInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_longPressClickInteraction, a3);
}

- (_UIGestureStudyMetricsGestureRecognizer)metricsGestureRecognizer
{
  return self->_metricsGestureRecognizer;
}

- (void)setMetricsGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_metricsGestureRecognizer, a3);
}

- (NSMutableDictionary)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_metricsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressClickInteraction, 0);
  objc_storeStrong((id *)&self->_forceClickInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
