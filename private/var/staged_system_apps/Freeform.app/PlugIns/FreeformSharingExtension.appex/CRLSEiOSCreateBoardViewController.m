@implementation CRLSEiOSCreateBoardViewController

- (void)viewDidLoad
{
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v2;

  v2 = self;
  sub_100026F58();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v4;

  v4 = self;
  sub_10002775C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v4;

  v4 = self;
  sub_1000278B4(a3);

}

- (void)createBoardButtonAction:(id)a3
{
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v5;
  uint64_t v6;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v7;
  void *v8;
  id v9;
  void *v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v14, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v7 = self;
  }
  v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField);
  if (v8)
  {
    v9 = objc_msgSend(v8, "text");
    if (v9)
    {
      v10 = v9;
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      v13 = v12;

    }
    else
    {
      v11 = 0;
      v13 = 0xE000000000000000;
    }
    sub_100027D14(v11, v13);

    swift_bridgeObjectRelease(v13);
    sub_100028780((uint64_t)v14);
  }
  else
  {
    __break(1u);
  }
}

- (void)cancel:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v5;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v6;
  id v7;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *)-[CRLSEiOSCreateBoardViewController navigationController](v8, "navigationController");
  if (v5)
  {
    v6 = v5;
    v7 = -[CRLSEiOSCreateBoardViewController popToRootViewControllerAnimated:](v5, "popToRootViewControllerAnimated:", 1);

    v4 = v7;
    v8 = v6;
  }

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v5;
  id v6;
  void *v7;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "text");
  if (v6)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xE000000000000000;
  }
  sub_100027D14(v8, v10);

  swift_bridgeObjectRelease(v10);
  return 0;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100027BD8(v4);

}

- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSString v10;
  char *v11;
  id v12;
  _TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate;
    *((_QWORD *)v8 + 1) = 0;
    swift_unknownObjectWeakInit(v8, 0);
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate;
    *((_QWORD *)v11 + 1) = 0;
    swift_unknownObjectWeakInit(v11, 0);
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  v13 = -[CRLSEiOSCreateBoardViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  return -[CRLSEiOSCreateBoardViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000287FC((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField));
}

@end
