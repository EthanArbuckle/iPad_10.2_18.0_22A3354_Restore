@implementation CatalogTipGalleryViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI31CatalogTipGalleryViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_resignActiveObserver) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_hasPostedEnterEvent) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_hasPostedExitEvent) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI31CatalogTipGalleryViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC9SeymourUI31CatalogTipGalleryViewController *v2;
  objc_super v3;

  v2 = self;
  sub_22B285404();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  -[CatalogTipGalleryViewController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_pageNavigator);
  swift_release();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI31CatalogTipGalleryViewController *v2;

  v2 = self;
  sub_22B284A08();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  v4 = v9.receiver;
  -[CatalogTipGalleryViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
    objc_msgSend(v7, sel_setTintColor_, v8);

    v4 = v8;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI31CatalogTipGalleryViewController *v4;

  v4 = self;
  sub_22B284C24(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI31CatalogTipGalleryViewController *v4;

  v4 = self;
  sub_22B2850C8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  v4 = v7.receiver;
  -[CatalogTipGalleryViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255B8B818, v5, (uint64_t (*)(uint64_t))type metadata accessor for CatalogTipGalleryViewController, (uint64_t)&unk_22BA95AB8);
  sub_22B106EC0(&qword_255B8B820, v6, (uint64_t (*)(uint64_t))type metadata accessor for CatalogTipGalleryViewController, (uint64_t)&unk_22BA958D0);
  sub_22BA7E1E0();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  v2 = (char *)v10.receiver;
  -[CatalogTipGalleryViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_dataProvider] + 56);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI31CatalogTipGalleryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI31CatalogTipGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
