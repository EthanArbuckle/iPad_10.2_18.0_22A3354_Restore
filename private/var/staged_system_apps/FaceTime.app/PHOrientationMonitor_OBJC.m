@implementation PHOrientationMonitor_OBJC

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), a2);
}

- (int64_t)makeInterfaceOrientationFrom:(int64_t)a3 whenFailing:(int64_t)a4
{
  int64_t v5;

  v5 = a3;
  if (!sub_1000151B4(a3))
    return a4;
  switch(v5)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      return v5;
    default:
      return a4;
  }
}

- (int64_t)lastValidInterfaceOrientation
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), "lastValidInterfaceOrientation");
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), "setOrientationEventsEnabled:", a3);
}

- (int64_t)deviceOrientation
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), "deviceOrientation");
}

- (int64_t)interfaceOrientation
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), "interfaceOrientation");
}

- (BOOL)orientationEventsEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped), "orientationEventsEnabled");
}

- (_TtC8FaceTime25PHOrientationMonitor_OBJC)init
{
  _TtC8FaceTime25PHOrientationMonitor_OBJC *result;

  result = (_TtC8FaceTime25PHOrientationMonitor_OBJC *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.PHOrientationMonitor_OBJC", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
