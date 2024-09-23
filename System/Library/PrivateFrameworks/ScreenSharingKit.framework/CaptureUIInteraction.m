@implementation CaptureUIInteraction

- (_TtC16ScreenSharingKit20CaptureUIInteraction)init
{
  _TtC16ScreenSharingKit20CaptureUIInteraction *result;

  result = (_TtC16ScreenSharingKit20CaptureUIInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__availableHardwareGestures;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BCFD8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__isActive;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B9BB8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction_bufferedSendingContinuation, (uint64_t *)&unk_2574BD0F0);

}

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view));
}

- (void)setView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction__view) = (Class)a3;
  v3 = a3;

}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit20CaptureUIInteraction *v6;

  v5 = a3;
  v6 = self;
  CaptureUIInteraction.willMove(to:)((UIView_optional *)a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit20CaptureUIInteraction *v6;

  v5 = a3;
  v6 = self;
  CaptureUIInteraction.didMove(to:)((UIView_optional *)a3);

}

- (int64_t)_deviceOrientation
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC16ScreenSharingKit20CaptureUIInteraction_deviceOrientation);
  swift_beginAccess();
  return *v2;
}

- (void)set_deviceOrientation:(int64_t)a3
{
  _TtC16ScreenSharingKit20CaptureUIInteraction *v4;

  v4 = self;
  CaptureUIInteraction.deviceOrientation.setter(a3);

}

@end
