@implementation FolderComposerBaseViewController

- (void)cancelActionWithSender:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC11MobileNotes32FolderComposerBaseViewController *v7;

  v5 = swift_allocObject(&unk_10056FB70, 24, 7);
  swift_unknownObjectWeakInit(v5 + 16, self);
  v6 = a3;
  v7 = self;
  sub_1003F29F4((uint64_t)v6, v7, v5);

  swift_release(v5);
}

- (void)doneActionWithSender:(id)a3
{
  _TtC11MobileNotes32FolderComposerBaseViewController *v4;
  _TtC11MobileNotes32FolderComposerBaseViewController *v5;
  _TtC11MobileNotes32FolderComposerBaseViewController *v6;
  _TtC11MobileNotes32FolderComposerBaseViewController *v7;

  v4 = (_TtC11MobileNotes32FolderComposerBaseViewController *)a3;
  v7 = self;
  v5 = (_TtC11MobileNotes32FolderComposerBaseViewController *)-[FolderComposerBaseViewController navigationController](v7, "navigationController");
  if (v5)
  {
    v6 = v5;
    -[FolderComposerBaseViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v7;
    v7 = v6;
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerBaseViewController();
  v4 = v8.receiver;
  v5 = a3;
  -[FolderComposerBaseViewController willMoveToParentViewController:](&v8, "willMoveToParentViewController:", v5);
  if (v5)
  {
    v6 = objc_msgSend(v5, "presentationController", v8.receiver, v8.super_class);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setDelegate:", v4);

      v5 = v4;
      v4 = v7;
    }

  }
}

- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11MobileNotes32FolderComposerBaseViewController *)sub_1003F26E8(v5, v7, a4);
}

- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController_initialFilterSelection) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___cancelBarButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___doneBarButtonItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FolderComposerBaseViewController();
  return -[FolderComposerBaseViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController_initialFilterSelection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___doneBarButtonItem));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  _TtC11MobileNotes32FolderComposerBaseViewController *v3;
  uint64_t (*v4)(void);
  id v5;
  _TtC11MobileNotes32FolderComposerBaseViewController *v6;

  v3 = self;
  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x98);
  v5 = a3;
  v6 = v3;
  LOBYTE(v3) = v4();

  return (v3 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC11MobileNotes32FolderComposerBaseViewController *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_1003F23A8();
  v7 = swift_allocObject(&unk_10056FB70, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v5);
  sub_1003F29F4((uint64_t)v6, v5, v7);

  swift_release(v7);
}

@end
