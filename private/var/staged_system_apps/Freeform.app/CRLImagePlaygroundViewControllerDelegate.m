@implementation CRLImagePlaygroundViewControllerDelegate

- (void)imagePlaygroundViewController:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate *v12;
  uint64_t v13;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100D56F68();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)imagePlaygroundViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100D57198();

}

- (_TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate_helper);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLImagePlaygroundViewControllerDelegate();
  return -[CRLImagePlaygroundViewControllerDelegate init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate_helper);
}

@end
