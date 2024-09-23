@implementation RemoteBrowsingDiscoveryViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2BCF6C();
}

- (void)handleKohnahmiCodeSequence
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v7;
  uint64_t v8;

  v3 = sub_22BA7FE00();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_22BA7F9B0();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_22B568EC8();

}

- (void)viewDidLoad
{
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v2;

  v2 = self;
  sub_22B2BA724();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_22B2BAF8C(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (void (*)(id))sub_22B568324);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_22B2BAF8C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(id))sub_22B568B14);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v4;

  v4 = self;
  sub_22B2BAFFC(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v4;

  v4 = self;
  sub_22B2BB360(a3);

}

- (void)handleMenuButtonTapped
{
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v2;

  v2 = self;
  sub_22B2BB520();

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_titleLabel));
}

- (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_currentlyConnectingCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_promptLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_promptIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_menuGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_playPauseGestureRecognizer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v12;

  v5 = type metadata accessor for RemoteBrowsingDiscoveryPresenter.State(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI37RemoteBrowsingDiscoveryViewController_presenter)
     + OBJC_IVAR____TtC9SeymourUI32RemoteBrowsingDiscoveryPresenter_state;
  swift_beginAccess();
  sub_22B1273C4((uint64_t)v8, (uint64_t)v7, type metadata accessor for RemoteBrowsingDiscoveryPresenter.State);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    sub_22B119E2C((uint64_t)v7, type metadata accessor for RemoteBrowsingDiscoveryPresenter.State);
  }
  else
  {
    v10 = sub_22BA7B2C4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v7, v10);
  }
  return EnumCaseMultiPayload == 0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v11;
  unint64_t v12;
  uint64_t v13;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  v12 = sub_22BA79BFC();
  sub_22B56F500(v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC9SeymourUI37RemoteBrowsingDiscoveryViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_22B2BD5F8(v7);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

@end
