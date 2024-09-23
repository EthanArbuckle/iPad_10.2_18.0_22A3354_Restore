@implementation CRLScenesViewController_i

- (_TtC8Freeform25CRLScenesViewController_i)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform25CRLScenesViewController_i *result;

  *(_QWORD *)&self->hostingController[OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesDelegate] = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_isTornDown) = 0;
  v5 = a3;

  result = (_TtC8Freeform25CRLScenesViewController_i *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLScenesViewController_i.swift", 40, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  char v2;
  _TtC8Freeform25CRLScenesViewController_i *v3;
  objc_super v4;

  v2 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 34, "teardown not called for CRLScenesViewController_i", 49, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2u, 34, (uint64_t)"teardown not called for CRLScenesViewController_i", 49, 2u);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLScenesViewController_i();
  -[CRLScenesViewController_i dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_hostingController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesPopoverState));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_scenesDelegate);
}

- (void)viewDidLoad
{
  _TtC8Freeform25CRLScenesViewController_i *v2;

  v2 = self;
  sub_1005634E0();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)delete:(id)a3
{
  _TtC8Freeform25CRLScenesViewController_i *v5;
  uint64_t v6;
  _TtC8Freeform25CRLScenesViewController_i *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100563994();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (void)deleteForward:(id)a3
{
  _TtC8Freeform25CRLScenesViewController_i *v5;
  uint64_t v6;
  _TtC8Freeform25CRLScenesViewController_i *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100563AF4((uint64_t)v8);

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (NSArray)keyCommands
{
  uint64_t v2;
  uint64_t v3;
  NSArray v4;

  v2 = sub_100565330();
  if (v2)
  {
    v3 = v2;
    sub_1004B8930(0, &qword_1013E7990, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (UIResponder)nextResponder
{
  void *v2;
  _TtC8Freeform25CRLScenesViewController_i *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLScenesViewController_i_icc);
  v3 = self;
  v4 = objc_msgSend(v2, "layerHost");
  if (!v4)
  {

LABEL_6:
    v6 = 0;
    return (UIResponder *)v6;
  }
  v5 = v4;
  if ((objc_msgSend(v4, "respondsToSelector:", "asiOSCVC") & 1) == 0)
  {

    swift_unknownObjectRelease(v5);
    goto LABEL_6;
  }
  v6 = objc_msgSend(v5, "asiOSCVC");

  swift_unknownObjectRelease(v5);
  return (UIResponder *)v6;
}

- (void)presentScenesPopoverWith:(id)a3 at:(id)a4 passthroughViews:(id)a5
{
  objc_class *v5;
  uint64_t v9;
  id v10;
  id v11;
  _TtC8Freeform25CRLScenesViewController_i *v12;

  v5 = (objc_class *)a5;
  if (a5)
  {
    v9 = sub_1004B8930(0, (unint64_t *)&qword_1013DFC10, UIView_ptr);
    v5 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v9);
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100563D58(v10, (uint64_t)v11, v5);

  swift_bridgeObjectRelease(v5);
}

- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  _TtC8Freeform25CRLScenesViewController_i *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10126C4E8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1005658F4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1005643E4(a3, (uint64_t)v6, v7);
  sub_1004C1024((uint64_t)v6, v7);

}

- (_TtC8Freeform25CRLScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_100565248((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Freeform.CRLScenesViewController_i", 34);
}

- (void)dismissScenesPopover
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_opt_self(CRLAccessibility);
  v4 = a1;
  v3 = objc_msgSend(v2, "isReduceMotionEnabled");
  if ((objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v3 ^ 1, 0);

}

@end
