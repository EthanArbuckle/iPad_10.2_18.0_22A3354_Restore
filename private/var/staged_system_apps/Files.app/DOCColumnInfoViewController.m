@implementation DOCColumnInfoViewController

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting, a2);
}

- (void)setActionReporting:(id)a3
{
  _TtC5Files27DOCColumnInfoViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10023EDF4((uint64_t)a3);

  swift_unknownObjectRelease(a3);
}

- (_TtC5Files27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files27DOCColumnInfoViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files27DOCColumnInfoViewController_itemInfoViewController) = 0;
  v4 = a3;

  result = (_TtC5Files27DOCColumnInfoViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCColumnInfoViewController.swift", 39, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4;
  _TtC5Files27DOCColumnInfoViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10023E49C(v4);

}

- (void)viewDidLoad
{
  _TtC5Files27DOCColumnInfoViewController *v2;

  v2 = self;
  sub_10023E6CC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files27DOCColumnInfoViewController_nodes));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCColumnInfoViewController_itemInfoViewController));
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  _TtC5Files27DOCColumnInfoViewController *v2;

  v2 = self;
  sub_10023E9A0();

}

- (id)actionContextFrom:(id)a3
{
  _TtC5Files27DOCColumnInfoViewController *v5;
  uint64_t v6;
  _TtC5Files27DOCColumnInfoViewController *v7;
  id v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100353918();

  sub_10000CB4C((uint64_t)v10, &qword_100642730);
  return v8;
}

@end
