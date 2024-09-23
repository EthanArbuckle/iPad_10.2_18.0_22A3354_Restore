@implementation SampleReceiver.TapDelegate

- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4
{
  _TtCC9MusicCore14SampleReceiver11TapDelegate *v6;

  v6 = self;
  sub_10018B050(a3, a4);

}

- (_TtCC9MusicCore14SampleReceiver11TapDelegate)init
{
  _TtCC9MusicCore14SampleReceiver11TapDelegate *result;

  result = (_TtCC9MusicCore14SampleReceiver11TapDelegate *)_swift_stdlib_reportUnimplementedInitializer("MusicCore.TapDelegate", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtCC9MusicCore14SampleReceiver11TapDelegate_receiver);
}

@end
