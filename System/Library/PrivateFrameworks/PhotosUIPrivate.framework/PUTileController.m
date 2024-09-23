@implementation PUTileController

- (PUTileController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 30, CFSTR("%s is not available as initializer"), "-[PUTileController init]");

  abort();
}

- (PUTileController)initWithReuseIdentifier:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUTileController;
  v5 = -[PUTileController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    *(_OWORD *)(v5 + 56) = *MEMORY[0x1E0C9D820];
  }

  return (PUTileController *)v5;
}

- (void)addToTilingView:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 43, CFSTR("must be implemented by concrete subclass"));

}

- (void)becomeReusable
{
  void *v4;

  if (-[PUTileController isReusable](self, "isReusable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 47, CFSTR("unexpected reusable state"));

  }
  -[PUTileController setReusable:](self, "setReusable:", 1);
  -[PUTileController setExpectedPresentationSize:](self, "setExpectedPresentationSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)prepareForReuse
{
  void *v4;
  void *v5;

  if (!-[PUTileController isReusable](self, "isReusable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 53, CFSTR("unexpected reusable state"));

  }
  -[PUTileController setReusable:](self, "setReusable:", 0);
  -[PUTileController setLayoutInfo:](self, "setLayoutInfo:", 0);
  -[PUTileController reasonsToSuppressAnimatedUpdates](self, "reasonsToSuppressAnimatedUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PUTileController removeAllAnimations](self, "removeAllAnimations");
}

- (PUTileLayoutInfo)presentationLayoutInfo
{
  void *v4;
  void *v6;

  -[PUTileController layoutInfo](self, "layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 62, CFSTR("missing layout info"));

  }
  return (PUTileLayoutInfo *)v4;
}

- (BOOL)isPresentationActive
{
  return 1;
}

- (id)freeze
{
  void *v3;

  -[PUTileController presentationLayoutInfo](self, "presentationLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileController removeAllAnimations](self, "removeAllAnimations");
  -[PUTileController applyLayoutInfo:](self, "applyLayoutInfo:", v3);
  -[PUTileController setLayoutInfo:](self, "setLayoutInfo:", v3);
  return v3;
}

- (void)removeAllAnimations
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 79, CFSTR("must be implemented by concrete subclass"));

}

- (void)applyLayoutInfo:(id)a3
{
  if (-[PUTileController isDetached](self, "isDetached", a3))
  {
    if (-[PUTileController wantsVisibleRectChanges](self, "wantsVisibleRectChanges"))
      -[PUTileController didChangeVisibleRect](self, "didChangeVisibleRect");
  }
}

- (CGRect)visibleRect
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 92, CFSTR("must be implemented by concrete subclass"));

  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)willBeginAnimation
{
  -[PUTileController setAnimationCount:](self, "setAnimationCount:", -[PUTileController animationCount](self, "animationCount") + 1);
  return willBeginAnimation_count++;
}

- (void)didEndAnimation:(int64_t)a3
{
  void *v5;
  id v6;

  -[PUTileController setAnimationCount:](self, "setAnimationCount:", -[PUTileController animationCount](self, "animationCount", a3) - 1);
  if (-[PUTileController animationCount](self, "animationCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileController.m"), 105, CFSTR("unbalanced animations"));

  }
  -[PUTileController reuseIfApplicable](self, "reuseIfApplicable");
  if (!-[PUTileController isAnimating](self, "isAnimating"))
  {
    -[PUTileController tilingView](self, "tilingView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tileControllerDidEndAnimating:", self);

  }
}

- (void)setAnimationCount:(int64_t)a3
{
  int64_t animationCount;

  animationCount = self->_animationCount;
  if (animationCount != a3)
  {
    self->_animationCount = a3;
    if ((a3 != 0) == (animationCount == 0))
      -[PUTileController didChangeAnimating](self, "didChangeAnimating");
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[PUTileController didChangeActive](self, "didChangeActive");
  }
}

- (void)reuseIfApplicable
{
  id v3;

  -[PUTileController tilingView](self, "tilingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3
    && !-[PUTileController isReusable](self, "isReusable")
    && !-[PUTileController isActive](self, "isActive")
    && !-[PUTileController isAnimating](self, "isAnimating")
    && !-[PUTileController isDetached](self, "isDetached"))
  {
    objc_msgSend(v3, "enqueueTileControllerForReuse:", self);
  }

}

- (BOOL)isAnimating
{
  return -[PUTileController animationCount](self, "animationCount") > 0;
}

- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut
{
  return -[PUTileController isAnimating](self, "isAnimating") || -[PUTileController isDetached](self, "isDetached");
}

- (void)setTilingView:(id)a3
{
  objc_storeWeak((id *)&self->_tilingView, a3);
}

- (void)setLayoutInfo:(id)a3
{
  PUTileLayoutInfo *v5;
  PUTileLayoutInfo *layoutInfo;
  PUTileLayoutInfo *v7;
  PUTileLayoutInfo *v8;

  v5 = (PUTileLayoutInfo *)a3;
  layoutInfo = self->_layoutInfo;
  if (layoutInfo != v5)
  {
    v8 = v5;
    v7 = layoutInfo;
    objc_storeStrong((id *)&self->_layoutInfo, a3);
    if (-[PUTileController wantsVisibleRectChanges](self, "wantsVisibleRectChanges")
      && !-[PUTileLayoutInfo isGeometryEqualToLayoutInfo:](v8, "isGeometryEqualToLayoutInfo:", v7))
    {
      -[PUTileController didChangeVisibleRect](self, "didChangeVisibleRect");
    }

    v5 = v8;
  }

}

- (id)generateAssetTransitionInfo
{
  return 0;
}

- (BOOL)adoptAssetTransitionInfo:(id)a3
{
  return 1;
}

- (void)viewControllerTransitionWillBegin
{
  -[PUTileController setIsViewControllerTransitioning:](self, "setIsViewControllerTransitioning:", 1);
}

- (void)viewControllerTransitionDidEnd
{
  -[PUTileController setIsViewControllerTransitioning:](self, "setIsViewControllerTransitioning:", 0);
}

- (void)setIsViewControllerTransitioning:(BOOL)a3
{
  if (self->_isViewControllerTransitioning != a3)
  {
    self->_isViewControllerTransitioning = a3;
    -[PUTileController isViewControllerTransitioningDidChange](self, "isViewControllerTransitioningDidChange");
  }
}

- (void)setExpectedPresentationSize:(CGSize)a3
{
  if (a3.width != self->_expectedPresentationSize.width || a3.height != self->_expectedPresentationSize.height)
  {
    self->_expectedPresentationSize = a3;
    -[PUTileController expectedPresentationSizeDidChange](self, "expectedPresentationSizeDidChange");
  }
}

- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    px_dispatch_on_main_queue();

  }
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUTileController layoutInfo](self, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(v3, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p; indexPath: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableArray)reasonsToSuppressAnimatedUpdates
{
  NSMutableArray *reasonsToSuppressAnimatedUpdates;
  NSMutableArray *v4;
  NSMutableArray *v5;

  reasonsToSuppressAnimatedUpdates = self->_reasonsToSuppressAnimatedUpdates;
  if (!reasonsToSuppressAnimatedUpdates)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_reasonsToSuppressAnimatedUpdates;
    self->_reasonsToSuppressAnimatedUpdates = v4;

    reasonsToSuppressAnimatedUpdates = self->_reasonsToSuppressAnimatedUpdates;
  }
  return reasonsToSuppressAnimatedUpdates;
}

- (void)startSuppressingAnimatedUpdatesWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUTileController removeAllAnimations](self, "removeAllAnimations");
  -[PUTileController reasonsToSuppressAnimatedUpdates](self, "reasonsToSuppressAnimatedUpdates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)stopSuppressingAnimatedUpdatesWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUTileController reasonsToSuppressAnimatedUpdates](self, "reasonsToSuppressAnimatedUpdates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)shouldSuppressAnimatedUpdates
{
  void *v2;
  BOOL v3;

  -[PUTileController reasonsToSuppressAnimatedUpdates](self, "reasonsToSuppressAnimatedUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)presentationProgressBlock
{
  return 0;
}

- (id)dismissalProgressBlock
{
  return 0;
}

- (BOOL)disappearanceAssertionsEnabled
{
  return 1;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isDetached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)shouldPreserveCurrentContent
{
  return self->_shouldPreserveCurrentContent;
}

- (void)setShouldPreserveCurrentContent:(BOOL)a3
{
  self->_shouldPreserveCurrentContent = a3;
}

- (CGSize)expectedPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expectedPresentationSize.width;
  height = self->_expectedPresentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setReasonsToSuppressAnimatedUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_reasonsToSuppressAnimatedUpdates, a3);
}

- (BOOL)isReusable
{
  return self->_reusable;
}

- (void)setReusable:(BOOL)a3
{
  self->_reusable = a3;
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (PUTilingView)tilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->_tilingView);
}

- (PUTileLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (BOOL)wantsVisibleRectChanges
{
  return self->_wantsVisibleRectChanges;
}

- (BOOL)isViewControllerTransitioning
{
  return self->_isViewControllerTransitioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_destroyWeak((id *)&self->_tilingView);
  objc_storeStrong((id *)&self->_reasonsToSuppressAnimatedUpdates, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

uint64_t __75__PUTileController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
