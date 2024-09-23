@implementation PhotosDynamicTitleOverlayController

- (UIViewController)containerViewController
{
  unsigned __int8 *v2;

  v2 = &self->containerViewController[7];
  swift_beginAccess();
  return (UIViewController *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setContainerViewController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CGSize)effectiveContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&self->computedEffectiveContentSize[7];
  v3 = *(double *)&self->computedEffectiveContentSize[15];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)providesContentSizeForMeasurements
{
  BOOL v2;

  sub_1A7ADBF34();
  v2 = sub_1A6A606CC();
  swift_release();
  return v2;
}

@end
