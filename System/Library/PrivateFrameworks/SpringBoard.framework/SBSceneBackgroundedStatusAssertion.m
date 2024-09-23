@implementation SBSceneBackgroundedStatusAssertion

- (SBSceneBackgroundedStatusAssertion)initWithScenes:(id)a3 invalidationHandler:(id)a4
{
  id v6;
  id v7;
  SBSceneBackgroundedStatusAssertion *v8;
  uint64_t v9;
  NSSet *scenes;
  uint64_t v11;
  id invalidationHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSceneBackgroundedStatusAssertion;
  v8 = -[SBSceneBackgroundedStatusAssertion init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    scenes = v8->_scenes;
    v8->_scenes = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    invalidationHandler = v8->_invalidationHandler;
    v8->_invalidationHandler = (id)v11;

  }
  return v8;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_invalidationHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneBackgroundedStatusAssertion.m"), 30, CFSTR("must invalidate before releasing"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSceneBackgroundedStatusAssertion;
  -[SBSceneBackgroundedStatusAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void (**invalidationHandler)(id, NSSet *);
  id v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneBackgroundedStatusAssertion invalidate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBSceneBackgroundedStatusAssertion.m"), 40, CFSTR("this call must be made on the main thread"));

  }
  invalidationHandler = (void (**)(id, NSSet *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, self->_scenes);
    v4 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (NSSet)scenes
{
  return self->_scenes;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_scenes, 0);
}

@end
