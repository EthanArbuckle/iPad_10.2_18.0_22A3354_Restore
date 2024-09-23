@implementation ProgressKeyValueObservation

- (void)dealloc
{
  _TtC19VoiceShortcutClient27ProgressKeyValueObservation *v2;

  v2 = self;
  ProgressKeyValueObservation.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19VoiceShortcutClient27ProgressKeyValueObservation_progress));

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  _TtC19VoiceShortcutClient27ProgressKeyValueObservation *v10;
  id v11;
  _TtC19VoiceShortcutClient27ProgressKeyValueObservation *v12;
  _OWORD v13[2];

  if (a3)
  {
    sub_1AF76A57C();
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v13, 0, sizeof(v13));
    v11 = a5;
    v12 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  sub_1AF76A8DC();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1AF69F5C4();
    sub_1AF76A4B0();

  }
LABEL_7:
  sub_1AF69F420();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF69B16C((uint64_t)v13);
}

- (_TtC19VoiceShortcutClient27ProgressKeyValueObservation)init
{
  ProgressKeyValueObservation.init()();
}

@end
