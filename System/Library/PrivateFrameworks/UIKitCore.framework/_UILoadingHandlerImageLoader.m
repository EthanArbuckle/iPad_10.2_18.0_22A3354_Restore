@implementation _UILoadingHandlerImageLoader

- (_UILoadingHandlerImageLoader)initWithLoadingQueue:(id)a3 handler:(id)a4
{
  id v8;
  id v9;
  _UILoadingHandlerImageLoader *v10;
  _UILoadingHandlerImageLoader *v11;
  void *v12;
  id loadingHandler;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageLoader.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadingHandler != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_UILoadingHandlerImageLoader;
  v10 = -[_UIImageLoader init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_loadingQueue, a3);
    v12 = _Block_copy(v9);
    loadingHandler = v11->_loadingHandler;
    v11->_loadingHandler = v12;

  }
  return v11;
}

- (void)_really_loadImage:(id)a3
{
  id v4;
  NSObject *loadingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  loadingQueue = self->_loadingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(loadingQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingHandler, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
}

@end
