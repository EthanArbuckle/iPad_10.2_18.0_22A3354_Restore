@implementation DOCDebugMenuButton#1inDOCFullDocumentManagerViewController.presentDebugMenu()

- (id)contextMenuInteraction:configurationForMenuAtLocation:
{
  id v5;
  _TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1001FEE88();

  return v7;
}

- (void)contextMenuInteraction:willEndForConfiguration:animator:
{
  -[DOCDebugMenuButton #1 in DOCFullDocumentManagerViewController.presentDebugMenu() removeFromSuperview](self, "removeFromSuperview", a3, a4, a5);
}

- (_TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton)initWithFrame:
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton_menuInteraction) = 0;
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton_target);
  v9.receiver = self;
  v9.super_class = (Class)_s18DOCDebugMenuButtonCMa();
  return -[DOCView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton_menuInteraction));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCFE5FilesCSo36DOCFullDocumentManagerViewControllerP33_C692D976BBFE9B383C702F853E4B344B16presentDebugMenuFT_T_L_18DOCDebugMenuButton_target);
}

@end
