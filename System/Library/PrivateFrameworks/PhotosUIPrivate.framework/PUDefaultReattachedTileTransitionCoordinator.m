@implementation PUDefaultReattachedTileTransitionCoordinator

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUDefaultReattachedTileTransitionCoordinator;
  -[PUDefaultTileTransitionCoordinator optionsForAnimatingTileController:toLayoutInfo:withAnimationType:](&v12, sel_optionsForAnimatingTileController_toLayoutInfo_withAnimationType_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultReattachedTileTransitionCoordinator context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultTileTransitionCoordinator configureOptions:forSpringAnimationsZoomingIn:](self, "configureOptions:forSpringAnimationsZoomingIn:", v9, objc_msgSend(v10, "isZoomingIn"));
  if (v10)
  {
    objc_msgSend(v10, "velocityForTileController:", v8);
    objc_msgSend(v9, "setInitialVelocity:");
  }

  return v9;
}

- (PUTileReattachmentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
