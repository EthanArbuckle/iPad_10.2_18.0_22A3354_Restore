@implementation VMPlayerItem

- (VMPlaybackController)controller
{
  return (VMPlaybackController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_controller);
}

- (void)setController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_controller, a3);
}

- (AVAsset)asset
{
  return (AVAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset));
}

- (void)setAsset:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset) = (Class)a3;
  v3 = a3;

}

- (_TtC10VoiceMemos12VMPlayerItem)initWithAsset:(id)a3
{
  char *v5;
  id v6;
  objc_super v8;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayer, 0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_seekCount) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayerItem) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_controller, 0);
  v5 = (char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset) = (Class)a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VMPlayerItem();
  v6 = a3;
  return -[VMPlayerItem init](&v8, "init");
}

- (void)seekToTime:(double)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(char);
  _TtC10VoiceMemos12VMPlayerItem *v10;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject(&unk_1001AFB08, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_1000C6670;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = self;
  sub_1000C6278((uint64_t (*)(_QWORD))v9, v8, a3);
  sub_1000A8AC0((uint64_t)v9, v8);

}

- (BOOL)seeking
{
  return *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_seekCount) > 0;
}

- (double)currentTime
{
  uint64_t Strong;
  void *v4;
  _TtC10VoiceMemos12VMPlayerItem *v5;
  uint64_t v6;
  double v7;
  double v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayer);
  if (!Strong)
    return 0.0;
  v4 = (void *)Strong;
  v5 = self;
  v6 = sub_10000B940();
  sub_1000A5A58();
  v8 = v7;

  swift_release(v6);
  return v8;
}

- (void)setPlayableRangeEndTime:(double)a3
{
  double *v5;
  uint64_t Strong;
  void *v7;
  _TtC10VoiceMemos12VMPlayerItem *v8;
  uint64_t v9;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime);
  *v5 = a3;
  *((_BYTE *)v5 + 8) = 0;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayer);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = self;
    v9 = sub_10000B940();
    sub_1000A5DDC(a3);

    swift_release(v9);
  }
}

- (_TtC10VoiceMemos12VMPlayerItem)init
{
  _TtC10VoiceMemos12VMPlayerItem *result;

  result = (_TtC10VoiceMemos12VMPlayerItem *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.VMPlayerItem", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayer);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_audioPlayerItem));
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_controller);

}

@end
