@implementation CRLiOSFolderGridViewController.Item.ViewController

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)init
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *)sub_100B31AA8();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100B362A0();
}

- (void)loadView
{
  objc_class *v3;
  char *v4;
  uint64_t v5;
  _TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *v6;
  _TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *v7;
  objc_super v8;

  v3 = (objc_class *)_s4ItemC14ViewControllerC8ItemViewCMa();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController8ItemView_owningViewController]);
  swift_unknownObjectWeakAssign(v5, self);
  v8.receiver = v4;
  v8.super_class = v3;
  v6 = self;
  v7 = -[CRLiOSFolderGridViewController.Item.ViewController initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[CRLiOSFolderGridViewController.Item.ViewController setView:](v6, "setView:", v7, v8.receiver, v8.super_class);

}

- (void)viewDidLoad
{
  _TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *v2;

  v2 = self;
  sub_100B31F24();

}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *result;

  v4 = a4;
  result = (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.ViewController", 23, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_owningItem);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_dropShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_roundedCornersContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_attributionHostingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_selectionStateBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_boardTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_lastEditedTimestampLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_collaboratorNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_overrideTraitCollection));
}

@end
