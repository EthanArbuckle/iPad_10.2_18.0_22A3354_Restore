@implementation FTRecentsContainerViewController

- (FTRecentsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (FTRecentsContainerViewController *)sub_10004BC84(v5, v7, a4);
}

- (BOOL)hasRecentsListViewController
{
  return *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList) != 0;
}

- (void)showContent
{
  FTRecentsContainerViewController *v2;

  v2 = self;
  sub_10000C88C();

}

- (void)viewWillLayoutSubviews
{
  FTRecentsContainerViewController *v2;

  v2 = self;
  sub_10000848C();

}

- (id)presentScreenTimeShield
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield))
    return 0;
  v2 = *(_QWORD *)&self->presentScreenTimeShield[OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield];
  v6[4] = *(Class *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100049444;
  v6[3] = &unk_10008AD08;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setPresentScreenTimeShield:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  FTRecentsContainerViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10008ACF0, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_10004C00C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10004BF4C((uint64_t)v7, v6);
  sub_10000A730((uint64_t)v7, v6);

}

- (void)hideContent
{
  FTRecentsContainerViewController *v2;

  v2 = self;
  sub_10004B7A0();

}

- (void)showLinkDetailViewControllerForPseudonym:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FTRecentsContainerViewController *v9;
  Swift::String v10;
  id v11;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v7)
  {
    v8 = v4;
    v9 = self;
    v11 = v7;
    v10._countAndFlagsBits = v8;
    v10._object = v6;
    RecentsListViewController.showLinkDetailViewController(for:)(v10);

    swift_bridgeObjectRelease(v6);
  }
  else
  {
    swift_bridgeObjectRelease(v5);
  }
}

- (void)showVideoPlayerForMessageWithUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  FTRecentsContainerViewController *v11;
  id v12;
  uint64_t v13;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v10)
  {
    v11 = self;
    v12 = v10;
    RecentsListViewController.showVideoPlayerForMessage(withUUID:bypassSafety:)(v9, 0);

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)presentRecentsDetailsViewFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  FTRecentsContainerViewController *v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  sub_10004BA0C();

  swift_bridgeObjectRelease(v5);
}

- (UICollectionView)collectionView
{
  void *v2;
  FTRecentsContainerViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v2 = (void *)dispatch thunk of RecentsListViewController.collectionView.getter();

  }
  return (UICollectionView *)v2;
}

- (FTRecentsContainerViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_content) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  return -[FTRecentsContainerViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10000A730(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield), *(_QWORD *)&self->presentScreenTimeShield[OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield]);

}

@end
