@implementation StereoOrientationProvider

- (_TtC10VoiceMemos25StereoOrientationProvider)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25StereoOrientationProvider_interfaceOrientation) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StereoOrientationProvider();
  return -[StereoOrientationProvider init](&v3, "init");
}

- (void)interfaceOrientationDidUpdate:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25StereoOrientationProvider_interfaceOrientation) = (Class)a3;
}

- (id)preferredDataSourceOrientation
{
  return AVAudioSessionOrientationFront;
}

- (int64_t)preferredInputOrientationFor:(id)a3
{
  id v4;
  _TtC10VoiceMemos25StereoOrientationProvider *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000F625C(v4);

  return v6;
}

@end
