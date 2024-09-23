@implementation PlayerView

- (_TtC7NotesUI10PlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC7NotesUI10PlayerView *)sub_1AC9E4FF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NotesUI10PlayerView)initWithCoder:(id)a3
{
  return (_TtC7NotesUI10PlayerView *)sub_1AC9E5250(a3);
}

- (void)back:(id)a3
{
  id v4;
  _TtC7NotesUI10PlayerView *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9EED2C((SEL *)&selRef_skipBackByInterval_completion_);

}

- (void)playPause:(id)a3
{
  id v4;
  _TtC7NotesUI10PlayerView *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9EEBFC((SEL *)&selRef_togglePlayPause, (uint64_t)&unk_1E5C2C940, (uint64_t)&unk_1EECA49A8, (void (*)(char *, uint64_t, _QWORD *))sub_1ACA213D8);

}

- (void)stopRecording:(id)a3
{
  id v4;
  _TtC7NotesUI10PlayerView *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9EEBFC((SEL *)&selRef_stop, (uint64_t)&unk_1E5C2C918, (uint64_t)&unk_1EECA4998, (void (*)(char *, uint64_t, _QWORD *))sub_1AC9366F0);

}

- (void)forward:(id)a3
{
  id v4;
  _TtC7NotesUI10PlayerView *v5;

  v4 = a3;
  v5 = self;
  sub_1AC9EED2C((SEL *)&selRef_skipAheadByInterval_completion_);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1AC8FC3B8((uint64_t)self + OBJC_IVAR____TtC7NotesUI10PlayerView_playbackController);
}

@end
