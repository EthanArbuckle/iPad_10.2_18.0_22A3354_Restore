@implementation FMFindUnknownItemViewController

- (_TtC6FindMy31FMFindUnknownItemViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10045FFBC();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFindUnknownItemViewController();
  v2 = v3.receiver;
  -[FMFindUnknownItemViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100459810();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy31FMFindUnknownItemViewController *v4;

  v4 = self;
  sub_100459234(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC6FindMy31FMFindUnknownItemViewController *v4;

  v4 = self;
  sub_1004595C8(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMFindUnknownItemViewController();
  v4 = v9.receiver;
  v5 = a3;
  -[FMFindUnknownItemViewController traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "view", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  else
  {
    __break(1u);
  }
}

- (void)handleCloseButtonWithSender:(id)a3
{
  -[FMFindUnknownItemViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)handleContinueButton
{
  _TtC6FindMy31FMFindUnknownItemViewController *v2;

  v2 = self;
  sub_10045B5C4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_discoveryController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_continueButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_cancellables));
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler), *(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler]);
}

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC6FindMy31FMFindUnknownItemViewController *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler];
    v6 = a3;
    v7 = self;
    sub_1000A190C((uint64_t)v3, v5);
    v3(v6);
    sub_1000327F0((uint64_t)v3, v5);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC6FindMy31FMFindUnknownItemViewController *v15;
  void (*v16)(char *, uint64_t);
  Class isa;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100053F2C(&qword_1005D33C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  sub_10045C8EC((uint64_t)v10, (uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v16(v13, v7);
  }
  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy31FMFindUnknownItemViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10046031C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_headerView));
}

@end
