@implementation FMUTAccessoryInformationViewController

- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014FA44();
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  _TtC6FindMy38FMUTAccessoryInformationViewController *v8;
  char *v9;
  __n128 v10;
  char v12[24];
  objc_super v13;

  v3 = type metadata accessor for FMIPUnknownItem(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (objc_class *)type metadata accessor for FMUTAccessoryInformationViewController(0);
  v13.receiver = self;
  v13.super_class = v7;
  v8 = self;
  -[FMUTAccessoryInformationViewController viewDidLoad](&v13, "viewDidLoad");
  v9 = (char *)v8 + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownItem;
  v10 = swift_beginAccess((char *)v8 + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownItem, v12, 0, 0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))(v6, v9, v3, v10);
  sub_10014C8B0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy38FMUTAccessoryInformationViewController *v4;

  v4 = self;
  sub_100147A70(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy38FMUTAccessoryInformationViewController *v4;

  v4 = self;
  sub_100147C14(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMUTAccessoryInformationViewController(0);
  -[FMUTAccessoryInformationViewController viewWillAppear:](&v4, "viewWillAppear:", v3);
}

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC6FindMy38FMUTAccessoryInformationViewController *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->scrollHandler[OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler];
    v6 = a3;
    v7 = self;
    sub_1000A190C((uint64_t)v3, v5);
    v3(v6);
    sub_1000327F0((uint64_t)v3, v5);

  }
}

- (void)doneAction
{
  sub_10014B42C(self, (uint64_t)a2, "FMUTAccessoryInformationViewController: Done button pressed");
}

- (void)cancelAction
{
  sub_10014B42C(self, (uint64_t)a2, "FMUTAccessoryInformationViewController: Cancel button pressed");
}

- (void)continueOnWebsiteAction
{
  _TtC6FindMy38FMUTAccessoryInformationViewController *v2;

  v2 = self;
  sub_10014B524();

}

- (void)continueOnDisableWebsiteAction
{
  _TtC6FindMy38FMUTAccessoryInformationViewController *v2;

  v2 = self;
  sub_10014B840();

}

- (_TtC6FindMy38FMUTAccessoryInformationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy38FMUTAccessoryInformationViewController *result;

  v4 = a4;
  result = (_TtC6FindMy38FMUTAccessoryInformationViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMUTAccessoryInformationViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler), *(_QWORD *)&self->scrollHandler[OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_mediator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_updateQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_playerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_productImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_heatZone));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_productImage));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_imageFetchCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_waitingView));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownItem;
  v4 = type metadata accessor for FMIPUnknownItem(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_nfcURL, (uint64_t *)&unk_1005D3470);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_unknownAccessoryDiscoveryController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_actionButtonShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_actionButtonHiddenConstraints));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy38FMUTAccessoryInformationViewController_devicesSubscription));
}

@end
