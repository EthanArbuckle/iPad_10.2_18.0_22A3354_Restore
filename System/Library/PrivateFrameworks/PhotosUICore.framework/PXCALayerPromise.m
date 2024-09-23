@implementation PXCALayerPromise

uint64_t __41__PXCALayerPromise__handlePreparedLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLayer:", *(_QWORD *)(a1 + 40));
}

- (void)_setLayer:(id)a3
{
  CALayer *v5;
  CALayer *v6;

  v5 = (CALayer *)a3;
  if (self->_layer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layer, a3);
    -[PXCALayerPromise signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
}

- (void)invalidateLayer
{
  id v4;

  if (self->_startedLayerRealization)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCALayerPromise.m"), 167, CFSTR("can't change layer promise attributes after realization has started"));

  }
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  if (self->_rendersAsynchronously != a3)
  {
    self->_rendersAsynchronously = a3;
    -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_bounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_bounds = &self->_bounds;
  if (!CGRectEqualToRect(a3, self->_bounds))
  {
    p_bounds->origin.x = x;
    p_bounds->origin.y = y;
    p_bounds->size.width = width;
    p_bounds->size.height = height;
    -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  -[PXCALayerPromise performChanges:](&v3, sel_performChanges_, a3);
}

- (void)startLayerRealization
{
  NSObject *v3;
  dispatch_block_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_startedLayerRealization)
  {
    self->_startedLayerRealization = 1;
    if (-[PXCALayerPromise rendersAsynchronously](self, "rendersAsynchronously"))
    {
      if (startLayerRealization_onceToken != -1)
        dispatch_once(&startLayerRealization_onceToken, &__block_literal_global_262317);
      objc_initWeak(&location, self);
      v3 = startLayerRealization_queue;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __41__PXCALayerPromise_startLayerRealization__block_invoke_2;
      v5[3] = &unk_1E5148D30;
      objc_copyWeak(&v6, &location);
      v4 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v5);
      dispatch_async(v3, v4);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PXCALayerPromise _realizeLayer](self, "_realizeLayer");
    }
  }
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (!-[PXCALayerPromise shouldCancel](self, "shouldCancel", a3))
    -[PXCALayerPromise drawLayerContentInContext:](self, "drawLayerContentInContext:", a4);
}

- (void)_realizeLayer
{
  void *v3;
  double v4;
  NSObject *v5;
  double v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  PXCALayerPromise *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[PXCALayerPromise shouldCancel](self, "shouldCancel"))
  {
    -[PXCALayerPromise createCustomLayer](self, "createCustomLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (-[PXCALayerPromise shouldCancel](self, "shouldCancel"))
      {
        v3 = 0;
      }
      else
      {
        -[PXCALayerPromise contentsScale](self, "contentsScale");
        if (v4 == 0.0)
        {
          PLUIGetLog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v12 = self;
            _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Invalid contentsScale for layer promise %@. Failing gracefully.", buf, 0xCu);
          }

          v6 = 1.0;
        }
        else
        {
          v6 = v4;
        }
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setDelegate:", self);
        -[PXCALayerPromise bounds](self, "bounds");
        objc_msgSend(v3, "setBounds:");
        objc_msgSend(v3, "setContentsScale:", v6);
        objc_msgSend(v3, "setNeedsDisplay");
        objc_msgSend(v3, "displayIfNeeded");
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
      }
    }
    if (-[PXCALayerPromise rendersAsynchronously](self, "rendersAsynchronously"))
    {
      objc_initWeak((id *)buf, self);
      objc_msgSend(off_1E50B4758, "sharedScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __33__PXCALayerPromise__realizeLayer__block_invoke;
      v8[3] = &unk_1E5147280;
      objc_copyWeak(&v10, (id *)buf);
      v9 = v3;
      objc_msgSend(v7, "dispatchInMainTransaction:", v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[PXCALayerPromise _handlePreparedLayer:](self, "_handlePreparedLayer:", v3);
    }

  }
}

- (BOOL)rendersAsynchronously
{
  return self->_rendersAsynchronously;
}

- (void)_handlePreparedLayer:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (!-[PXCALayerPromise shouldCancel](self, "shouldCancel"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__PXCALayerPromise__handlePreparedLayer___block_invoke;
    v5[3] = &unk_1E5144868;
    v5[4] = self;
    v6 = v4;
    -[PXCALayerPromise performChanges:](self, "performChanges:", v5);

  }
}

- (PXCALayerPromise)init
{
  PXCALayerPromise *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  result = -[PXCALayerPromise init](&v3, sel_init);
  if (result)
  {
    result->_contentsScale = 1.0;
    result->_rendersAsynchronously = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CALayer setDelegate:](self->_layer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXCALayerPromise;
  -[PXCALayerPromise dealloc](&v3, sel_dealloc);
}

- (void)cancelLayerRealization
{
  self->_shouldCancel = 1;
}

- (id)createCustomLayer
{
  return 0;
}

- (void)drawLayerContentInContext:(CGContext *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCALayerPromise.m"), 127, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCALayerPromise drawLayerContentInContext:]", v7);

  abort();
}

- (void)setContentsScale:(double)a3
{
  if (self->_contentsScale != a3)
  {
    self->_contentsScale = a3;
    -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
  }
}

- (double)contentsScale
{
  return self->_contentsScale;
}

void __33__PXCALayerPromise__realizeLayer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePreparedLayer:", *(_QWORD *)(a1 + 32));

}

void __41__PXCALayerPromise_startLayerRealization__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_realizeLayer");

}

void __41__PXCALayerPromise_startLayerRealization__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -8);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.layerpromise", v2);
  v1 = (void *)startLayerRealization_queue;
  startLayerRealization_queue = (uint64_t)v0;

}

@end
