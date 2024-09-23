@implementation ContextMenuPreviewViewController

- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_DA0AC();
}

- (void)loadView
{
  _TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController *v2;

  v2 = self;
  sub_D89D4();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_D8D14(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_D8D14(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillDisappear_);
}

- (void)viewWillLayoutSubviews
{
  _TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController *v2;

  v2 = self;
  sub_D8FB8();

}

- (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ContextMenuPreviewViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(uint64_t *)((_BYTE *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController_preview) & 0x3FFFFFFFFFFFFFFFLL);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews32ContextMenuPreviewViewController_lockupView));
}

@end
