@implementation _UIImageLoader

+ (id)_imageLoaderWithLoadingQueue:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  _UILoadingHandlerImageLoader *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UILoadingHandlerImageLoader initWithLoadingQueue:handler:]([_UILoadingHandlerImageLoader alloc], "initWithLoadingQueue:handler:", v6, v5);

  return v7;
}

+ (id)_imageLoaderWithURLRequest:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  _UINSURLRequestImageLoader *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UINSURLRequestImageLoader initWithURLRequest:session:]([_UINSURLRequestImageLoader alloc], "initWithURLRequest:session:", v6, v5);

  return v7;
}

+ (id)_imageLoaderWithDataFromItemProvider:(id)a3 typeIdentifier:(id)a4
{
  id v5;
  id v6;
  _UINSItemProviderImageLoader *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UINSItemProviderImageLoader initWithItemProvider:typeIdentifier:]([_UINSItemProviderImageLoader alloc], "initWithItemProvider:typeIdentifier:", v6, v5);

  return v7;
}

- (_UIImageLoader)init
{
  _UIImageLoader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageLoader;
  result = -[_UIImageLoader init](&v3, sel_init);
  if (result)
  {
    atomic_store(0, (unsigned __int8 *)&result->_started);
    atomic_store(0, (unsigned __int8 *)&result->_finished);
    atomic_store(0, (unsigned __int8 *)&result->_cancelled);
    result->_trampolineLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)_isFinished
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (BOOL)_isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (UIImage)_image
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  if ((v2 & 1) != 0)
    return self->_image;
  else
    return (UIImage *)0;
}

- (NSError)_error
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  if ((v2 & 1) != 0)
    return self->_error;
  else
    return (NSError *)0;
}

- (void)_loadImageWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  atomic_flag *p_started;
  unsigned __int8 v9;
  os_unfair_lock_s *p_trampolineLock;
  _UIImageLoader *v11;
  NSObject *v12;
  id v13;
  unsigned __int8 v14;
  NSMutableArray *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD aBlock[4];
  NSObject *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  p_started = &self->_started;
  do
    v9 = __ldaxr((unsigned __int8 *)p_started);
  while (__stlxr(1u, (unsigned __int8 *)p_started));
  if ((v9 & 1) != 0)
  {
    p_trampolineLock = &self->_trampolineLock;
    os_unfair_lock_lock(&self->_trampolineLock);
    v11 = self;
    v12 = v6;
    v13 = v7;
    os_unfair_lock_assert_owner(p_trampolineLock);
    v14 = atomic_load((unsigned __int8 *)&v11->_finished);
    if ((v14 & 1) != 0)
    {
      dispatch_async(v12, v13);
    }
    else
    {
      v15 = v11->_completionTrampolines;
      if (!v15)
      {
        v15 = (NSMutableArray *)objc_opt_new();
        objc_storeStrong((id *)&v11->_completionTrampolines, v15);
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = ___addTrampoline_block_invoke;
      aBlock[3] = &unk_1E16B1D18;
      v21 = v12;
      v22 = v13;
      v16 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](v15, "addObject:", v16);

    }
    os_unfair_lock_unlock(p_trampolineLock);
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56___UIImageLoader__loadImageWithCompletionQueue_handler___block_invoke;
    v17[3] = &unk_1E16BAD68;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    -[_UIImageLoader _really_loadImage:](self, "_really_loadImage:", v17);

  }
}

- (void)_cancel
{
  atomic_flag *p_started;
  unsigned __int8 v4;
  unsigned __int8 v5;
  BOOL *p_cancelled;
  unsigned __int8 v7;

  p_started = &self->_started;
  do
    v4 = __ldaxr((unsigned __int8 *)p_started);
  while (__stlxr(1u, (unsigned __int8 *)p_started));
  if ((v4 & 1) == 0)
  {
    -[_UIImageLoader _really_cancel](self, "_really_cancel");
    atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
    atomic_store(1u, (unsigned __int8 *)&self->_finished);
LABEL_5:
    os_unfair_lock_lock(&self->_trampolineLock);
    atomic_store(1u, (unsigned __int8 *)&self->_finished);
    _drainTrampolines(self);
    os_unfair_lock_unlock(&self->_trampolineLock);
    return;
  }
  v5 = atomic_load((unsigned __int8 *)&self->_finished);
  if ((v5 & 1) == 0 && !-[_UIImageLoader _isCancelled](self, "_isCancelled"))
  {
    if (-[_UIImageLoader _really_cancel](self, "_really_cancel"))
    {
      p_cancelled = &self->_cancelled;
      do
        v7 = __ldaxr((unsigned __int8 *)p_cancelled);
      while (__stlxr(1u, (unsigned __int8 *)p_cancelled));
      if ((v7 & 1) == 0)
        goto LABEL_5;
    }
  }
}

- (void)_really_loadImage:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)_really_cancel
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionTrampolines, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
