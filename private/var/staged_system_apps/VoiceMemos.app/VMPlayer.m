@implementation VMPlayer

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate, a3);
}

- (_TtC10VoiceMemos8VMPlayer)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer____lazy_storage___audioPlayer) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate, 0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VMPlayer();
  return -[VMPlayer init](&v4, "init");
}

- (BOOL)playing
{
  _TtC10VoiceMemos8VMPlayer *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v3 = sub_10000B940();
  v4 = *(_BYTE *)(v3 + 16);

  swift_release(v3);
  return v4;
}

- (_TtP10VoiceMemos16VMPlayerDelegate_)delegate
{
  return (_TtP10VoiceMemos16VMPlayerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);
}

- (_TtC10VoiceMemos12VMPlayerItem)currentItem
{
  return (_TtC10VoiceMemos12VMPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem));
}

- (void)setCurrentItem:(id)a3
{
  void *v4;
  _TtC10VoiceMemos8VMPlayer *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1000C53A4();
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3
{
  void *v4;
  _TtC10VoiceMemos8VMPlayer *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1000C53A4();
}

- (void)seekTo:(double)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(char);
  uint64_t v10;
  _TtC10VoiceMemos8VMPlayer *v11;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject(&unk_1001AFBA8, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_1000C67B8;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v11 = self;
  v10 = sub_10000B940();
  sub_1000A5FA4((void (*)(_QWORD))v9, v8, a3);
  swift_release(v10);
  sub_1000A8AC0((uint64_t)v9, v8);

}

- (double)currentTime
{
  _TtC10VoiceMemos8VMPlayer *v2;
  uint64_t v3;
  double v4;
  double v5;

  v2 = self;
  v3 = sub_10000B940();
  sub_1000A5A58();
  v5 = v4;

  swift_release(v3);
  return v5;
}

- (float)targetRate
{
  _TtC10VoiceMemos8VMPlayer *v2;
  uint64_t v3;
  float v4;

  v2 = self;
  v3 = sub_10000B940();
  v4 = *(float *)(v3 + 84);

  swift_release(v3);
  return v4;
}

- (void)setTargetRate:(float)a3
{
  _TtC10VoiceMemos8VMPlayer *v4;

  v4 = self;
  sub_1000C5720(a3);

}

- (void)play
{
  _TtC10VoiceMemos8VMPlayer *v2;

  v2 = self;
  sub_1000C5778();

}

- (void)pause
{
  _TtC10VoiceMemos8VMPlayer *v2;

  v2 = self;
  sub_1000C5824();

}

- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _BYTE *v8;
  _TtC10VoiceMemos8VMPlayer *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  _BYTE *v15;
  _TtC10VoiceMemos8VMPlayer *v16;
  id v17;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1001AFB30, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_10000B940();
  v11 = *(void **)&v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset];
  v12 = *(_QWORD *)&v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime];
  v13 = v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime + 8];
  v14 = (_QWORD *)swift_allocObject(&unk_1001AFB58, 48, 7);
  v14[2] = v8;
  v14[3] = v9;
  v14[4] = sub_1000C6684;
  v14[5] = v7;
  v15 = v8;
  v16 = v9;
  v17 = v11;
  swift_retain(v7);
  sub_1000A6ADC(v17, v12, v13, (uint64_t)sub_1000C66C4, (uint64_t)v14);

  swift_release(v7);
  swift_release(v10);

  swift_release(v14);
}

- (BOOL)processingEnabled
{
  _TtC10VoiceMemos8VMPlayer *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v3 = sub_10000B940();
  v4 = *(_BYTE *)(v3 + 81);

  swift_release(v3);
  return v4;
}

- (void)setProcessingEnabled:(BOOL)a3
{
  _TtC10VoiceMemos8VMPlayer *v4;

  v4 = self;
  sub_1000C5C98(a3);

}

- (BOOL)silenceRemoverEnabled
{
  _TtC10VoiceMemos8VMPlayer *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v3 = sub_10000B940();
  v4 = *(_BYTE *)(v3 + 80);

  swift_release(v3);
  return v4;
}

- (void)setSilenceRemoverEnabled:(BOOL)a3
{
  _TtC10VoiceMemos8VMPlayer *v4;

  v4 = self;
  sub_1000C5D74(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer____lazy_storage___audioPlayer));
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);

}

- (id)audioEngineOutputNodeAccessQueue
{
  uint64_t Strong;
  void *v4;
  _TtC10VoiceMemos8VMPlayer *v5;
  id v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "audioEngineOutputNodeAccessQueue");

    swift_unknownObjectRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3
{
  _TtC10VoiceMemos8VMPlayer *v3;

  v3 = self;
  sub_1000C5F14();

  return 1;
}

- (void)audioPlayerError:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC10VoiceMemos8VMPlayer *v8;
  void *v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    v9 = (void *)_convertErrorToNSError(_:)(v7);
    objc_msgSend(v6, "vmPlayerError:", v9);

    swift_unknownObjectRelease(v6);
  }
}

- (void)audioPlayerIsPlayingChanged:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t Strong;
  void *v6;
  _TtC10VoiceMemos8VMPlayer *v7;

  v3 = a3;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = self;
    objc_msgSend(v6, "isPlayingDidChange:", v3);

    swift_unknownObjectRelease(v6);
  }
}

@end
