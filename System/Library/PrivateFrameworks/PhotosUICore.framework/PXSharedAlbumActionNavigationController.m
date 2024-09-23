@implementation PXSharedAlbumActionNavigationController

- (PXSharedAlbumActionNavigationControllerDelegate)actionControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXSharedAlbumActionNavigationController_actionControllerDelegate;
  swift_beginAccess();
  return (PXSharedAlbumActionNavigationControllerDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setActionControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PXSharedAlbumActionNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1A7AE3764();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (PXSharedAlbumActionNavigationController *)sub_1A6D74320(v5, v7, a4);
}

- (PXSharedAlbumActionNavigationController)initWithAssets:(id)a3 batchComment:(id)a4 options:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4430);
  v6 = sub_1A7AE3A10();
  sub_1A7AE3764();
  v8 = v7;
  v9 = a5;
  return (PXSharedAlbumActionNavigationController *)PXSharedAlbumActionNavigationController.init(assets:batchComment:options:)(v6, v10, v8, v9);
}

- (PXSharedAlbumActionNavigationController)initWithCoder:(id)a3
{
  id v5;
  PXSharedAlbumActionNavigationController *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PXSharedAlbumActionNavigationController_viewModel) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR___PXSharedAlbumActionNavigationController_didDismissSharedAlbumsActionView) = 0;
  v5 = a3;

  result = (PXSharedAlbumActionNavigationController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  PXSharedAlbumActionNavigationController *v4;

  v4 = self;
  PXSharedAlbumActionNavigationController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  PXSharedAlbumActionNavigationController *v4;

  v4 = self;
  PXSharedAlbumActionNavigationController.viewWillDisappear(_:)(a3);

}

- (PXSharedAlbumActionNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  PXSharedAlbumActionNavigationController *result;

  result = (PXSharedAlbumActionNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PXSharedAlbumActionNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  PXSharedAlbumActionNavigationController *result;

  v3 = a3;
  result = (PXSharedAlbumActionNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXSharedAlbumActionNavigationController_actionControllerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PXSharedAlbumActionNavigationController_viewModel));
}

@end
