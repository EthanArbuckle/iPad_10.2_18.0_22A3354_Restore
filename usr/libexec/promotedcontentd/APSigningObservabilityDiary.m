@implementation APSigningObservabilityDiary

- (void)recordSuccess
{
  _TtC7Metrics27APSigningObservabilityDiary *v2;

  v2 = self;
  sub_100152274();

}

- (void)recordFailure
{
  _TtC7Metrics27APSigningObservabilityDiary *v2;

  v2 = self;
  sub_100151B24();

}

- (_TtC7Metrics27APSigningObservabilityDiary)init
{
  return (_TtC7Metrics27APSigningObservabilityDiary *)sub_1001523FC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Metrics27APSigningObservabilityDiary_diary));
}

@end
