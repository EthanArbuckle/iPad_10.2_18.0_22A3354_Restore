@implementation AEBookRenderingCallbackTargetProxy

- (AEBookRenderingCallbackTargetProxy)initWithTarget:(id)a3
{
  id v4;
  AEBookRenderingCallbackTargetProxy *v5;
  AEBookRenderingCallbackTargetProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEBookRenderingCallbackTargetProxy;
  v5 = -[AEBookRenderingCallbackTargetProxy init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_target, v4);

  return v6;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4
{
  IMRenderingCacheCallback **p_target;
  id v6;
  id v7;
  id WeakRetained;

  p_target = &self->_target;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "renderingCacheCallbackImage:context:", v7, v6);

}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5
{
  IMRenderingCacheCallback **p_target;
  id v8;
  id v9;
  id WeakRetained;

  p_target = &self->_target;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "renderingCacheCallbackImage:context:pageNumber:", v9, v8, a5);

}

- (IMRenderingCacheCallback)target
{
  return (IMRenderingCacheCallback *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
