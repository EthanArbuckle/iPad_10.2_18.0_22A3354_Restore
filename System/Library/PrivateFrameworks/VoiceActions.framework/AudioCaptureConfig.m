@implementation AudioCaptureConfig

- (int64_t)leftOfStartFrameOffset
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setLeftOfStartFrameOffset:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)rightOfEndFrameOffset
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setRightOfEndFrameOffset:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset);
  swift_beginAccess();
  *v4 = a3;
}

- (AudioCaptureConfig)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset) = (Class)8;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioCapture();
  return -[AudioCaptureConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for AudioCapture, &qword_25790DBA0, (uint64_t)&protocol conformance descriptor for AudioCapture);
}

@end
