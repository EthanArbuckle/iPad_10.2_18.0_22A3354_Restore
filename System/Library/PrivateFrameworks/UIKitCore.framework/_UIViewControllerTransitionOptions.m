@implementation _UIViewControllerTransitionOptions

- (UIColor)dimmingColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor));
}

- (void)setDimmingColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor) = (Class)a3;
  v3 = a3;

}

- (NSArray)dimmingVisualEffects
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingVisualEffects))
  {
    sub_1851F9080(0, &qword_1EDD81E78);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_18650763C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setDimmingVisualEffects:(id)a3
{
  objc_class *v4;

  if (a3)
  {
    sub_1851F9080(0, &qword_1EDD81E78);
    v4 = (objc_class *)sub_186507654();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingVisualEffects) = v4;
  swift_bridgeObjectRelease();
}

- (CGRect)frameOfSourceInDestination
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination);
  v3 = *(double *)&self->dimmingColor[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  v4 = *(double *)&self->dimmingVisualEffects[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  v5 = *(double *)&self->frameOfSourceInDestination[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameOfSourceInDestination:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination) = a3;
}

- (BOOL)popPreemptsPushInSwiftUIEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_popPreemptsPushInSwiftUIEnabled);
}

- (void)setPopPreemptsPushInSwiftUIEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_popPreemptsPushInSwiftUIEnabled) = a3;
}

- (_UIViewControllerTransitionOptions)init
{
  return (_UIViewControllerTransitionOptions *)sub_18563B084();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
