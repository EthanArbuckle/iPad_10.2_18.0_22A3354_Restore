@implementation SBScrollToTopSceneProxyView

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SBScrollToTopSceneProxyView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBScrollToTopSceneProxyView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToTopSceneProxyViewWillExitViewHierarchy:rootedAtWindow:", self, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)SBScrollToTopSceneProxyView;
  -[SBScrollToTopSceneProxyView willMoveToWindow:](&v7, sel_willMoveToWindow_, v4);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBScrollToTopSceneProxyView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBScrollToTopSceneProxyView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollToTopSceneProxyViewDidEnterViewHierarchy:rootedAtWindow:", self, v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBScrollToTopSceneProxyView;
  -[SBScrollToTopSceneProxyView didMoveToWindow](&v5, sel_didMoveToWindow);

}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t);

  x = a3.x;
  v10 = (void (**)(id, uint64_t))a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA10]), "initWithType:xPosition:", 0, x);
  -[SBScrollToTopSceneProxyView sceneHandle](self, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendActions:", v9);

  if (v10)
    v10[2](v10, 1);

}

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)setSceneHandle:(id)a3
{
  objc_storeStrong((id *)&self->_sceneHandle, a3);
}

- (SBScrollToTopSceneProxyViewDelegate)delegate
{
  return (SBScrollToTopSceneProxyViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
