@implementation AudioPreviewPlayer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC16MusicMessagesApp18AudioPreviewPlayer *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _TtC16MusicMessagesApp18AudioPreviewPlayer *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_100004D8C(&qword_1004B7038, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1003C60E0);
  v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_100008360(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_10000594C((uint64_t)v21);
}

- (_TtC16MusicMessagesApp18AudioPreviewPlayer)init
{
  return (_TtC16MusicMessagesApp18AudioPreviewPlayer *)sub_100009264();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp18AudioPreviewPlayer__playerDispatchQueue));
  sub_10000594C((uint64_t)self + OBJC_IVAR____TtC16MusicMessagesApp18AudioPreviewPlayer__playerBoundaryTimeObservationToken);
}

@end
