@implementation _UIFluidSliderElasticPanDriver

- (_UIFluidSliderDrivable)drivable
{
  return (_UIFluidSliderDrivable *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UIFluidSliderElasticPanDriver_drivable, a2);
}

- (void)setDrivable:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer));
}

- (void)setPanGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (unint64_t)trackAxis
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_trackAxis);
}

- (void)setTrackAxis:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_trackAxis) = (Class)a3;
}

- (double)stretchAmount
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_stretchAmount);
}

- (void)setStretchAmount:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_stretchAmount) = a3;
}

- (double)velocityMultiplier
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_velocityMultiplier);
}

- (void)setVelocityMultiplier:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_velocityMultiplier) = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)delegate
{
  return (_UIFluidSliderDirectDrivingDelegate *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UIFluidSliderElasticPanDriver_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_1865074F8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_name);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_UIFluidSliderElasticPanDriver)init
{
  return (_UIFluidSliderElasticPanDriver *)sub_18563CBFC();
}

- (void)stop
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_state) = (Class)3;
}

- (void)cancel
{
  _UIFluidSliderElasticPanDriver *v2;

  v2 = self;
  sub_18563CFB0();

}

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_view, a2);
}

- (void)setView:(id)a3
{
  _UIFluidSliderElasticPanDriver *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18563E450();

}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  void *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_enabled) = a3;
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIFluidSliderElasticPanDriver_panGestureRecognizer);
  if (v3)
    objc_msgSend(v3, sel_setEnabled_);
}

- (void)handleGesture:(id)a3
{
  id v4;
  _UIFluidSliderElasticPanDriver *v5;

  v4 = a3;
  v5 = self;
  sub_18563D10C(v4);

}

- (void).cxx_destruct
{

  sub_18563E558((uint64_t)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_drivable);
  sub_18563E558((uint64_t)self + OBJC_IVAR____UIFluidSliderElasticPanDriver_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _UIFluidSliderElasticPanDriver *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_18563E178(v4);

  return self & 1;
}

@end
