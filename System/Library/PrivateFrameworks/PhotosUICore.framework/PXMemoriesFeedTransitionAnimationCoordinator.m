@implementation PXMemoriesFeedTransitionAnimationCoordinator

- (PXMemoriesFeedTransitionAnimationCoordinator)init
{
  PXMemoriesFeedTransitionAnimationCoordinator *v2;
  uint64_t v3;
  PXBasicTileAnimationOptions *basicOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMemoriesFeedTransitionAnimationCoordinator;
  v2 = -[PXMemoriesFeedTransitionAnimationCoordinator init](&v6, sel_init);
  if (v2)
  {
    +[PXBasicTileAnimationOptions defaultAnimationOptions](PXBasicTileAnimationOptions, "defaultAnimationOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    basicOptions = v2->_basicOptions;
    v2->_basicOptions = (PXBasicTileAnimationOptions *)v3;

    -[PXBasicTileAnimationOptions setShouldNotifyTiles:](v2->_basicOptions, "setShouldNotifyTiles:", 1);
  }
  return v2;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  return self->_basicOptions;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  __int128 v11;
  CGSize contentSize;
  CGRect contentsRect;
  void *coordinateSpaceIdentifier;

  contentsRect = a6->contentsRect;
  coordinateSpaceIdentifier = a6->coordinateSpaceIdentifier;
  v11 = *(_OWORD *)&a6->zPosition;
  contentSize = a6->contentSize;
  memmove(a3, a6, 0x70uLL);
  a3->alpha = 0.0;
  a3->contentSize = contentSize;
  a3->contentsRect = contentsRect;
  a3->coordinateSpaceIdentifier = coordinateSpaceIdentifier;
  *(_OWORD *)&a3->zPosition = v11;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  __int128 v11;
  CGSize contentSize;
  CGRect contentsRect;
  void *coordinateSpaceIdentifier;

  contentsRect = a6->contentsRect;
  coordinateSpaceIdentifier = a6->coordinateSpaceIdentifier;
  v11 = *(_OWORD *)&a6->zPosition;
  contentSize = a6->contentSize;
  memmove(a3, a6, 0x70uLL);
  a3->alpha = 0.0;
  a3->contentSize = contentSize;
  a3->contentsRect = contentsRect;
  a3->coordinateSpaceIdentifier = coordinateSpaceIdentifier;
  *(_OWORD *)&a3->zPosition = v11;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (BOOL)useDoubleSidedAnimation
{
  return self->_useDoubleSidedAnimation;
}

- (void)setUseDoubleSidedAnimation:(BOOL)a3
{
  self->_useDoubleSidedAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicOptions, 0);
}

@end
