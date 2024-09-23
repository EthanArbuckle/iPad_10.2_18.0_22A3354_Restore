@implementation CRLiOSMiniFormatterPopoverContainerViewController

- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_builder) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_widthAnchorConstraint) = 0;
  v4 = a3;

  result = (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSMiniFormatterPopoverContainerViewController.swift", 64, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[CRLiOSMiniFormatterPopoverContainerViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  _TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *v2;

  v2 = self;
  sub_1005B5070();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  v4 = (char *)v10.receiver;
  -[CRLiOSMiniFormatterPopoverContainerViewController viewDidDisappear:](&v10, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate + 8];
    ObjectType = swift_getObjectType(*(_QWORD *)&v4[OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate]);
    v8 = *(_QWORD *)(v6 + 8);
    v9 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    swift_unknownObjectRetain(v5);
    v9(v4, ObjectType, v8);

    swift_unknownObjectRelease(v5);
  }
  else
  {

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  swift_unknownObjectRetain(a4);
  v7 = v10.receiver;
  -[CRLiOSMiniFormatterPopoverContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(v7, "view", v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setNeedsLayout");
    swift_unknownObjectRelease(a4);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *v2;

  v2 = self;
  sub_1005B5BF8();

}

- (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *result;

  v4 = a4;
  result = (_TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMiniFormatterPopoverContainerViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_contentView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_delegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_builder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform49CRLiOSMiniFormatterPopoverContainerViewController_widthAnchorConstraint));
}

@end
