@implementation PUTilingViewNavigationTransition

- (PUTilingViewNavigationTransition)initWithEndPoint:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  PUTilingViewNavigationTransition *v11;
  PUTilingViewTransitionHelper *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  PUTilingViewTransitionHelper *tilingViewTransitionHelper;
  objc_super v19;

  v4 = a3;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionDuration");
  v7 = v6;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationDragCoefficient");
  v10 = v7 * v9;

  v19.receiver = self;
  v19.super_class = (Class)PUTilingViewNavigationTransition;
  v11 = -[PUNavigationTransition initWithDuration:](&v19, sel_initWithDuration_, v10);
  if (v11)
  {
    v12 = [PUTilingViewTransitionHelper alloc];
    -[PUNavigationTransition pushDuration](v11, "pushDuration");
    v14 = v13;
    -[PUNavigationTransition popDuration](v11, "popDuration");
    v16 = -[PUTilingViewTransitionHelper initWithPresentationDuration:dismissalDuration:endPoint:](v12, "initWithPresentationDuration:dismissalDuration:endPoint:", v4, v14, v15);
    tilingViewTransitionHelper = v11->__tilingViewTransitionHelper;
    v11->__tilingViewTransitionHelper = (PUTilingViewTransitionHelper *)v16;

    -[PUTilingViewTransitionHelper setTransition:](v11->__tilingViewTransitionHelper, "setTransition:", v11);
  }

  return v11;
}

- (BOOL)isInteractive
{
  return 1;
}

- (void)animatePushTransition
{
  -[PUTilingViewNavigationTransition _animateTransitionWithOperation:](self, "_animateTransitionWithOperation:", 1);
}

- (void)animatePopTransition
{
  -[PUTilingViewNavigationTransition _animateTransitionWithOperation:](self, "_animateTransitionWithOperation:", 2);
}

- (void)_animateTransitionWithOperation:(int64_t)a3
{
  _BOOL8 v5;
  id v6;

  v5 = -[PUViewControllerTransition startedInteractively](self, "startedInteractively");
  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateTransitionWithOperation:startedInteractively:", a3, v5);

}

- (BOOL)hasStarted
{
  void *v2;
  char v3;

  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasStarted");

  return v3;
}

- (BOOL)isTransitionPaused
{
  void *v2;
  char v3;

  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitionPaused");

  return v3;
}

- (void)pauseTransition
{
  id v2;

  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseTransition");

}

- (void)pauseTransitionWithOptions:(unint64_t)a3
{
  id v4;

  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseTransitionWithOptions:", a3);

}

- (void)updatePausedTransitionWithProgress:(double)a3 interactionProgress:(double)a4
{
  id v6;

  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePausedTransitionWithProgress:interactionProgress:", a3, a4);

}

- (void)resumeTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUTilingViewNavigationTransition _tilingViewTransitionHelper](self, "_tilingViewTransitionHelper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeTransition:", v3);

}

- (PUTilingViewTransitionHelper)_tilingViewTransitionHelper
{
  return self->__tilingViewTransitionHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tilingViewTransitionHelper, 0);
}

@end
