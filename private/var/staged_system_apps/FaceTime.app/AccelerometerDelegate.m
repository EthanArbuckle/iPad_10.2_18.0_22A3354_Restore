@implementation AccelerometerDelegate

- (void)dealloc
{
  void *v2;
  _TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer);
  v3 = self;
  objc_msgSend(v2, "setDelegate:", 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AccelerometerDelegate();
  -[AccelerometerDelegate dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->onOrientationChange[OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_onOrientationChange]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate_accelerometer));
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6;
  _TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_10004B53C(a4);

}

- (_TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate)init
{
  _TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate *result;

  result = (_TtC8FaceTimeP33_2FA875DA5813DA1C29A712559EA29D9721AccelerometerDelegate *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.AccelerometerDelegate", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
