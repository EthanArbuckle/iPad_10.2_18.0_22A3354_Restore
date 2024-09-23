@implementation PlayerViewController

- (void)dealloc
{
  void *v3;
  _TtC23ShelfKitCollectionViews20PlayerViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  -[PlayerViewController dealloc](&v6, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  v4 = v6.receiver;
  -[PlayerViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  if (*((_BYTE *)v4 + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) == 1)
  {
    v5 = objc_msgSend(v4, "player", v6.receiver, v6.super_class);
    objc_msgSend(v5, "play");

    v4 = v5;
  }

}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews20PlayerViewController *v2;

  v2 = self;
  sub_268A98();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  v4 = v6.receiver;
  -[PlayerViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = objc_msgSend(v4, "player", v6.receiver, v6.super_class);
  objc_msgSend(v5, "pause");

}

- (void)playerItemDidPlayToEndWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) == 1)
    -[PlayerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (UIViewController)presentingViewController
{
  UIViewController *v2;
  objc_super v4;

  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) == 1)
  {
    v2 = (UIViewController *)-[PlayerViewController parentViewController](self, "parentViewController");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for PlayerViewController();
    v2 = -[PlayerViewController presentingViewController](&v4, "presentingViewController");
  }
  return v2;
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC23ShelfKitCollectionViews20PlayerViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PlayerViewController();
  v11 = -[PlayerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return -[PlayerViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC23ShelfKitCollectionViews20PlayerViewController)initWithPlayerLayerView:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_autoplay) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return -[PlayerViewController initWithPlayerLayerView:](&v5, "initWithPlayerLayerView:", a3);
}

@end
