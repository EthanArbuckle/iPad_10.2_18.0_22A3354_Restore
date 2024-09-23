@implementation _UIDelayedPresentationContext

- (_UIDelayedPresentationContext)initWithTimeout:(double)a3 cancellationHandler:(id)a4
{
  id v5;
  _UIDelayedPresentationContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDelayedPresentationContext;
  v5 = a4;
  v6 = -[_UIDelayedPresentationContext init](&v8, sel_init);
  v6->_enableUserInteraction = 0;
  v6->_timeout = a3;
  -[_UIDelayedPresentationContext setCancellationHandler:](v6, "setCancellationHandler:", v5, v8.receiver, v8.super_class);

  v6->_reqcnt = 1;
  return v6;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowSceneIgnoringEvents);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_presentInvocation, 0);
}

- (int64_t)requestCount
{
  return self->_reqcnt;
}

- (int64_t)decrementRequestCount
{
  int64_t v2;

  v2 = self->_reqcnt - 1;
  self->_reqcnt = v2;
  return v2;
}

- (void)dealloc
{
  UIWindowScene **p_windowSceneIgnoringEvents;
  id WeakRetained;
  void *v5;
  objc_class *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_windowSceneIgnoringEvents = &self->_windowSceneIgnoringEvents;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);

  if (WeakRetained)
  {
    -[_UIDelayedPresentationContext delayingController](self, "delayingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state: deallocating delayed presentation of <%s: %p> while still ignoring events"), class_getName(v6), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dealloc___s_category_4;
    if (!dealloc___s_category_4)
    {
      v8 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&dealloc___s_category_4);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    v10 = objc_loadWeakRetained((id *)p_windowSceneIgnoringEvents);
    objc_msgSend(v10, "_endIgnoringInteractionEventsForReason:", v7);

    objc_storeWeak((id *)p_windowSceneIgnoringEvents, 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIDelayedPresentationContext;
  -[_UIDelayedPresentationContext dealloc](&v11, sel_dealloc);
}

- (id)invocationTarget
{
  return -[NSInvocation target](self->_presentInvocation, "target");
}

- (id)delayingController
{
  void *v2;
  void *v3;

  if (self->_presentInvocation)
  {
    -[_UIDelayedPresentationContext invocationTarget](self, "invocationTarget");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v2, &unk_1EDDB0F72);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)incrementRequestCount
{
  int64_t v2;

  v2 = self->_reqcnt + 1;
  self->_reqcnt = v2;
  return v2;
}

- (void)beginDelayedPresentation
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[4];
  id v12;
  id location;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      objc_msgSend((id)a1, "delayingController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (objc_class *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Beginning delayed presentation of <%s: %p>"), class_getName(v3), v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "windowSceneIgnoringEvents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_beginIgnoringInteractionEventsForReason:", v4);

    }
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v6;

    objc_initWeak(&location, (id)a1);
    v8 = *(NSObject **)(a1 + 48);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57___UIDelayedPresentationContext_beginDelayedPresentation__block_invoke;
    handler[3] = &unk_1E16B3F40;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v8, handler);
    v9 = *(NSObject **)(a1 + 48);
    v10 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, (unint64_t)(*(double *)(a1 + 40) * 10.0 * 1000000000.0), 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (NSInvocation)presentInvocation
{
  return self->_presentInvocation;
}

- (void)setPresentInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_presentInvocation, a3);
}

- (UIWindowScene)windowSceneIgnoringEvents
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);
}

- (void)setWindowSceneIgnoringEvents:(id)a3
{
  objc_storeWeak((id *)&self->_windowSceneIgnoringEvents, a3);
}

@end
