@implementation CaptureGestureRecognizer

- (char)touchesBegan:(uint64_t)a3 withEvent:(void *)a4
{
  void (*v5)(id);
  char *v6;
  id v7;

  if (a4)
  {
    v5 = *(void (**)(id))&result[OBJC_IVAR____TtC16ScreenSharingKit24CaptureGestureRecognizer_eventHandler];
    v6 = result;
    v7 = a4;
    swift_retain();
    v5(v7);

    return (char *)swift_release();
  }
  return result;
}

- (_TtC16ScreenSharingKit24CaptureGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC16ScreenSharingKit24CaptureGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_245956748();
    swift_unknownObjectRelease();
  }
  result = (_TtC16ScreenSharingKit24CaptureGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
