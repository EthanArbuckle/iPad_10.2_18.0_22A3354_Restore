@implementation SessionAudioPlaybackControls

- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28SessionAudioPlaybackControls *)sub_22BA11858(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _TtC9SeymourUI28SessionAudioPlaybackControls *result;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_stackView;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_init);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)v9;

  result = (_TtC9SeymourUI28SessionAudioPlaybackControls *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)playbackControlTapped:(id)a3
{
  void (*v3)(id);
  id v5;
  _TtC9SeymourUI28SessionAudioPlaybackControls *v6;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    sub_22B0FAA58((uint64_t)v3);
    v3(v5);
    sub_22B0FAA68((uint64_t)v3);

  }
}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_playPauseControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_skipBackwardControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_skipForwardControl));
}

@end
