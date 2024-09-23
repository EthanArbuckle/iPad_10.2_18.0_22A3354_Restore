@implementation PXTileTransitionSimpleAnimationCoordinator

- (PXTileTransitionSimpleAnimationCoordinator)init
{
  return -[PXTileTransitionSimpleAnimationCoordinator initWithAnimationOptions:](self, "initWithAnimationOptions:", 0);
}

- (PXTileTransitionSimpleAnimationCoordinator)initWithAnimationOptions:(id)a3
{
  id v5;
  PXTileTransitionSimpleAnimationCoordinator *v6;
  PXTileTransitionSimpleAnimationCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTileTransitionSimpleAnimationCoordinator;
  v6 = -[PXTileTransitionSimpleAnimationCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animationOptions, a3);

  return v7;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  return 0;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (NSObject)animationOptions
{
  return self->_animationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationOptions, 0);
}

@end
