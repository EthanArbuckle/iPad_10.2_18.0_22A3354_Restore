@implementation TVLibraryGalleryViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(void **)((*(_QWORD **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_dataProvider))[2]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B992F24();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI30TVLibraryGalleryViewController *v2;

  v2 = self;
  sub_22B9923A4();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI30TVLibraryGalleryViewController *v2;

  v2 = self;
  sub_22B9924CC();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibraryGalleryViewController();
  v4 = v5.receiver;
  -[TVLibraryGalleryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B992EE4((unint64_t *)&unk_255BB70B0, (uint64_t)&unk_22BAC1200);
  sub_22B992EE4(&qword_255BB70C8, (uint64_t)&unk_22BAC1188);
  sub_22BA7E1E0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibraryGalleryViewController();
  v4 = v5.receiver;
  -[TVLibraryGalleryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B992EE4(&qword_255BB70C0, (uint64_t)&unk_22BAC11D0);
  sub_22BA7DC94();
  sub_22B992EE4((unint64_t *)&unk_255BB70B0, (uint64_t)&unk_22BAC1200);
  sub_22B992EE4(&qword_255BB70C8, (uint64_t)&unk_22BAC1188);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI30TVLibraryGalleryViewController *v4;

  v4 = self;
  sub_22B992764(a3);

}

- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI30TVLibraryGalleryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI30TVLibraryGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_metricPageCategory;
  v4 = sub_22BA7B3CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_storefrontLocalizer);
  swift_unknownObjectRelease();
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_timerProvider);
}

@end
