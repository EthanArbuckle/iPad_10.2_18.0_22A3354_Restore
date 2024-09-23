@implementation CRLiOSMiniFormatterStrokeBuilder

- (void)segmentedControlChangedWithSelectedIndices:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder *v9;
  uint64_t v10;

  v5 = type metadata accessor for IndexSet(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10088817C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)stepperValueDidChange:(id)a3
{
  id v5;
  _TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder *v6;

  v5 = a3;
  v6 = self;
  sub_100889194(a3);

}

- (void)interactionStarted:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  _TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder *v12;

  v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v11 = a3;
    v12 = self;
    v10(ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (void)interactionEnded:(id)a3
{
  id v4;
  _TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder *v5;

  v4 = a3;
  v5 = self;
  sub_100889934();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder_strokeWidthLabel));
}

@end
