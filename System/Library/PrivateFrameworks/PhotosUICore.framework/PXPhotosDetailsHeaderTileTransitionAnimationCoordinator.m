@implementation PXPhotosDetailsHeaderTileTransitionAnimationCoordinator

- (PXPhotosDetailsHeaderTileTransitionAnimationCoordinator)init
{
  PXPhotosDetailsHeaderTileTransitionAnimationCoordinator *v2;
  uint64_t v3;
  PXBasicTileAnimationOptions *basicAnimationOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsHeaderTileTransitionAnimationCoordinator;
  v2 = -[PXPhotosDetailsHeaderTileTransitionAnimationCoordinator init](&v6, sel_init);
  if (v2)
  {
    +[PXBasicTileAnimationOptions defaultAnimationOptions](PXBasicTileAnimationOptions, "defaultAnimationOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    basicAnimationOptions = v2->__basicAnimationOptions;
    v2->__basicAnimationOptions = (PXBasicTileAnimationOptions *)v3;

    -[PXBasicTileAnimationOptions setShouldNotifyTiles:](v2->__basicAnimationOptions, "setShouldNotifyTiles:", 1);
  }
  return v2;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  CGPoint origin;
  CGSize size;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  a6->alpha = 0.0;
  origin = a6->frame.origin;
  size = a6->frame.size;
  v9 = a6->size;
  a3->center = a6->center;
  a3->size = v9;
  a3->frame.origin = origin;
  a3->frame.size = size;
  v10 = *(_OWORD *)&a6->hidden;
  v11 = *(_OWORD *)&a6->contentSize.height;
  v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  v13 = *(_OWORD *)&a6->transform.a;
  v14 = *(_OWORD *)&a6->transform.c;
  v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  CGPoint origin;
  CGSize size;
  CGSize v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  a6->alpha = 0.0;
  origin = a6->frame.origin;
  size = a6->frame.size;
  v9 = a6->size;
  a3->center = a6->center;
  a3->size = v9;
  a3->frame.origin = origin;
  a3->frame.size = size;
  v10 = *(_OWORD *)&a6->hidden;
  v11 = *(_OWORD *)&a6->contentSize.height;
  v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  v13 = *(_OWORD *)&a6->transform.a;
  v14 = *(_OWORD *)&a6->transform.c;
  v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = objc_retainAutorelease(a7);
  return 1;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (PXBasicTileAnimationOptions)_basicAnimationOptions
{
  return self->__basicAnimationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__basicAnimationOptions, 0);
}

@end
