@implementation PhotosFullscreenPlaybackOverlayController

- (UIViewController)containerViewController
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosFullscreenPlaybackOverlayController_containerViewController;
  swift_beginAccess();
  return (UIViewController *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setContainerViewController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)providesContentSizeForMeasurements
{
  return 0;
}

- (CGSize)effectiveContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
