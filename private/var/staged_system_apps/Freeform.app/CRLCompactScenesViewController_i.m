@implementation CRLCompactScenesViewController_i

- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithCoder:(id)a3
{
  id v4;
  _TtC8Freeform32CRLCompactScenesViewController_i *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_isTornDown) = 0;
  v4 = a3;

  result = (_TtC8Freeform32CRLCompactScenesViewController_i *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLScenesViewController_i.swift", 40, 2, 164, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  char v2;
  _TtC8Freeform32CRLCompactScenesViewController_i *v3;
  objc_super v4;

  v2 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2, 168, "teardown not called for CRLCompactScenesViewController_i", 56, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLScenesViewController_i.swift", 95, 2u, 168, (uint64_t)"teardown not called for CRLCompactScenesViewController_i", 56, 2u);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLCompactScenesViewController_i();
  -[CRLCompactScenesViewController_i dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_scenesPopoverState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLCompactScenesViewController_i_icc));
}

- (void)viewDidLoad
{
  _TtC8Freeform32CRLCompactScenesViewController_i *v2;

  v2 = self;
  sub_100564750();

}

- (void)presentScenesPopoverWith:(id)a3
{
  id v4;
  _TtC8Freeform32CRLCompactScenesViewController_i *v5;

  v4 = a3;
  v5 = self;
  sub_100564CC8(v4);

}

- (void)dismissScenesPopoverWithAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC8Freeform32CRLCompactScenesViewController_i *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10126C448, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100565828;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100565018(a3, (uint64_t)v6, v7);
  sub_1004C1024((uint64_t)v6, v7);

}

- (void)updateSheetPresentationDetents
{
  id v2;
  void *v3;
  uint64_t v4;
  Class isa;
  void *v6;
  _TtC8Freeform32CRLCompactScenesViewController_i *v7;

  v7 = self;
  v2 = -[CRLCompactScenesViewController_i sheetPresentationController](v7, "sheetPresentationController");
  if (v2)
  {
    v3 = v2;
    v4 = sub_100565708();
    sub_1004B8930(0, (unint64_t *)&qword_10140BD30, UISheetPresentationControllerDetent_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v3, "setDetents:", isa, swift_bridgeObjectRelease(v4).n128_f64[0]);

    v6 = isa;
  }
  else
  {
    v6 = v7;
  }

}

- (_TtC8Freeform32CRLCompactScenesViewController_i)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_100565248((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Freeform.CRLCompactScenesViewController_i", 41);
}

@end
