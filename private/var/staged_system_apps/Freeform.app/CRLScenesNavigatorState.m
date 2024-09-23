@implementation CRLScenesNavigatorState

- (_TtC8Freeform23CRLScenesNavigatorState)init
{
  return (_TtC8Freeform23CRLScenesNavigatorState *)sub_100711818();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState_objectDidChange));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isOpen;
  v4 = sub_1004B804C(&qword_10140B9D0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isCompactUI, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__isLandscapeUI, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState__areNavigatorButtonsEnabled, v4);
}

@end
