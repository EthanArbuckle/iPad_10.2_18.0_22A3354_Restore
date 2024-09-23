@implementation CRLiOSFolderGridViewController.ListItem.ListViewController

- (void)updateViewConstraints
{
  _TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v2 = self;
  v3 = sub_1007F2658();
  if (v3)
  {
    v4 = v3;
    sub_1007F4B2C();
    sub_1007F4D48();
    sub_1007F5880();
    sub_1007F5AC0(0);
    sub_1007F5E58();
    swift_release(v4);
    v5.receiver = v2;
    v5.super_class = (Class)_s8ListItemC18ListViewControllerCMa();
    -[CRLiOSFolderGridViewController.ListItem.ListViewController updateViewConstraints](&v5, "updateViewConstraints");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s8ListItemC18ListViewControllerCMa();
  v2 = v3.receiver;
  -[CRLiOSFolderGridViewController.ListItem.ListViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_1007F45D8(1);

}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)init
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController *)sub_1007F47A8();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)initWithCoder:(id)a3
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController *)sub_1007F48D0(a3);
}

- (void).cxx_destruct
{
  sub_1007F8AB4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController____lazy_storage___textLayoutBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_textLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_primaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_secondaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_tertiaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_isInMultipleSelectionModeConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_isNotInMultipleSelectionModeConstraint));
}

@end
