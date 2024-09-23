@implementation CRLiOSMiniFormatterBaseLayerButton

- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_isPresentingPopover) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_formatterBuilder, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterBaseLayerButton();
  return -[CRLiOSMiniFormatterBaseLayerButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton)initWithCoder:(id)a3
{
  objc_super v6;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_isPresentingPopover) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_formatterBuilder, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterBaseLayerButton();
  return -[CRLiOSMiniFormatterBaseLayerButton initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton_formatterBuilder);
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton *v7;
  uint64_t v8;
  _TtC8Freeform34CRLiOSMiniFormatterBaseLayerButton *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v18, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  sub_100DE2F38((uint64_t)a3, (uint64_t)v18, (uint64_t)v19);

  sub_1004CB800((uint64_t)v18, &qword_1013E0230);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_1004BB5A4(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v19);
  return v16;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_100DE33BC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, (void (*)(unint64_t, unint64_t))sub_10066AAE4);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_100DE33BC(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willEndForConfiguration_animator_, (void (*)(unint64_t, unint64_t))sub_10066B1AC);
}

@end
