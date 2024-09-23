@implementation MagicGlueController

- (void)dealloc
{
  _TtC13EnsembleAgent19MagicGlueController *v2;

  v2 = self;
  sub_10002F1D0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_link;
  v4 = type metadata accessor for UniversalControlLink(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000E36C((uint64_t)self + OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_pointerController, &qword_1002AAF28);
  sub_10000E36C((uint64_t)self + OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_secureLayerHost, &qword_1002AAF30);
  sub_100031B90(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_pointerState), self->layer[OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_pointerState]);
  swift_release();
  sub_10003195C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_mode), *(_QWORD *)&self->layer[OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_mode], self->localLength[OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_mode]);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_pointerLayer);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_captureLayer);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_iconLayer);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_innerRimLayer);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_materialLayer);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_materialLayerMask);
  sub_10003236C(OBJC_IVAR____TtC13EnsembleAgent19MagicGlueController_rimLayer);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC13EnsembleAgent19MagicGlueController *v5;

  v4 = a3;
  v5 = self;
  sub_100030384(v4);

}

- (_TtC13EnsembleAgent19MagicGlueController)init
{
  sub_100030BBC();
}

@end
