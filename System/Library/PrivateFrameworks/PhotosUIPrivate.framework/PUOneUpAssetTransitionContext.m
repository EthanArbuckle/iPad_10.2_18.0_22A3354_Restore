@implementation PUOneUpAssetTransitionContext

- (id)oneUpTransitionContextWithContextWithContainerView:(id)a3
{
  id v4;
  PUOneUpAssetTransitionContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  -[PUOneUpAssetTransitionContext _setContainerView:](v5, "_setContainerView:", v4);

  -[PUOneUpAssetTransitionContext _setFromView:](v5, "_setFromView:", self->_fromView);
  -[PUOneUpAssetTransitionContext _setSnapshotView:](v5, "_setSnapshotView:", self->_snapshotView);
  -[PUOneUpAssetTransitionContext _setTransitionInfo:](v5, "_setTransitionInfo:", self->_transitionInfo);
  -[PUOneUpAssetTransitionContext _setTrailingAssetTransitionInfo:](v5, "_setTrailingAssetTransitionInfo:", self->_trailingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setLeadingAssetTransitionInfo:](v5, "_setLeadingAssetTransitionInfo:", self->_leadingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setShouldHideBackground:](v5, "_setShouldHideBackground:", self->_shouldHideBackground);
  -[PUOneUpAssetTransitionContext setExecutedAction:](v5, "setExecutedAction:", self->_executedAction);
  return v5;
}

- (id)oneUpTransitionContextWithContextShouldHideBackground:(BOOL)a3
{
  _BOOL8 v3;
  PUOneUpAssetTransitionContext *v5;

  v3 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  -[PUOneUpAssetTransitionContext _setContainerView:](v5, "_setContainerView:", self->_containerView);
  -[PUOneUpAssetTransitionContext _setFromView:](v5, "_setFromView:", self->_fromView);
  -[PUOneUpAssetTransitionContext _setSnapshotView:](v5, "_setSnapshotView:", self->_snapshotView);
  -[PUOneUpAssetTransitionContext _setTransitionInfo:](v5, "_setTransitionInfo:", self->_transitionInfo);
  -[PUOneUpAssetTransitionContext _setTrailingAssetTransitionInfo:](v5, "_setTrailingAssetTransitionInfo:", self->_trailingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setLeadingAssetTransitionInfo:](v5, "_setLeadingAssetTransitionInfo:", self->_leadingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setShouldHideBackground:](v5, "_setShouldHideBackground:", v3);
  -[PUOneUpAssetTransitionContext setExecutedAction:](v5, "setExecutedAction:", self->_executedAction);
  return v5;
}

- (id)oneUpTransitionContextWithAnimationBlock:(id)a3
{
  id v4;
  PUOneUpAssetTransitionContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  -[PUOneUpAssetTransitionContext _setContainerView:](v5, "_setContainerView:", self->_containerView);
  -[PUOneUpAssetTransitionContext _setFromView:](v5, "_setFromView:", self->_fromView);
  -[PUOneUpAssetTransitionContext _setSnapshotView:](v5, "_setSnapshotView:", self->_snapshotView);
  -[PUOneUpAssetTransitionContext _setTransitionInfo:](v5, "_setTransitionInfo:", self->_transitionInfo);
  -[PUOneUpAssetTransitionContext _setTrailingAssetTransitionInfo:](v5, "_setTrailingAssetTransitionInfo:", self->_trailingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setLeadingAssetTransitionInfo:](v5, "_setLeadingAssetTransitionInfo:", self->_leadingAssetTransitionInfo);
  -[PUOneUpAssetTransitionContext _setAnimationBlock:](v5, "_setAnimationBlock:", v4);

  -[PUOneUpAssetTransitionContext _setShouldHideBackground:](v5, "_setShouldHideBackground:", self->_shouldHideBackground);
  -[PUOneUpAssetTransitionContext setExecutedAction:](v5, "setExecutedAction:", self->_executedAction);
  return v5;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)_setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)fromView
{
  return self->_fromView;
}

- (void)_setFromView:(id)a3
{
  objc_storeStrong((id *)&self->_fromView, a3);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)_setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (BOOL)shouldHideBackground
{
  return self->_shouldHideBackground;
}

- (void)_setShouldHideBackground:(BOOL)a3
{
  self->_shouldHideBackground = a3;
}

- (PUAssetTransitionInfo)transitionInfo
{
  return self->_transitionInfo;
}

- (void)_setTransitionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_transitionInfo, a3);
}

- (PUAssetTransitionInfo)trailingAssetTransitionInfo
{
  return self->_trailingAssetTransitionInfo;
}

- (void)_setTrailingAssetTransitionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, a3);
}

- (PUAssetTransitionInfo)leadingAssetTransitionInfo
{
  return self->_leadingAssetTransitionInfo;
}

- (void)_setLeadingAssetTransitionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, a3);
}

- (PXAction)executedAction
{
  return self->_executedAction;
}

- (void)setExecutedAction:(id)a3
{
  objc_storeStrong((id *)&self->_executedAction, a3);
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)_setAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_executedAction, 0);
  objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_transitionInfo, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PUOneUpAssetTransitionContext *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(PUOneUpAssetTransitionContext);
  -[PUOneUpAssetTransitionContext _setContainerView:](v13, "_setContainerView:", v12);

  -[PUOneUpAssetTransitionContext _setFromView:](v13, "_setFromView:", v11);
  -[PUOneUpAssetTransitionContext _setSnapshotView:](v13, "_setSnapshotView:", v10);

  -[PUOneUpAssetTransitionContext _setTransitionInfo:](v13, "_setTransitionInfo:", v9);
  return v13;
}

+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6 trailingAssetTransitionInfo:(id)a7 leadingAssetTransitionInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PUOneUpAssetTransitionContext *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(PUOneUpAssetTransitionContext);
  -[PUOneUpAssetTransitionContext _setContainerView:](v19, "_setContainerView:", v18);

  -[PUOneUpAssetTransitionContext _setFromView:](v19, "_setFromView:", v17);
  -[PUOneUpAssetTransitionContext _setSnapshotView:](v19, "_setSnapshotView:", v16);

  -[PUOneUpAssetTransitionContext _setTransitionInfo:](v19, "_setTransitionInfo:", v15);
  -[PUOneUpAssetTransitionContext _setTrailingAssetTransitionInfo:](v19, "_setTrailingAssetTransitionInfo:", v14);

  -[PUOneUpAssetTransitionContext _setLeadingAssetTransitionInfo:](v19, "_setLeadingAssetTransitionInfo:", v13);
  return v19;
}

@end
