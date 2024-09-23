@implementation TVCatalogModalityDetailViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator);
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v5 = *(void **)(v4 + qword_255BE5D00);
  *(_QWORD *)(v3 + 32) = v5;
  sub_22BA808D4();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v7 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithCoder:(id)a3
{
  _TtC9SeymourUI37TVCatalogModalityDetailViewController *result;

  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVCatalogModalityDetailViewController();
  v2 = (char *)v3.receiver;
  -[TVCatalogModalityDetailViewController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_showDetailViewController_sender_, *(_QWORD *)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator]+ qword_255BE5CE0), 0, v3.receiver, v3.super_class);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI37TVCatalogModalityDetailViewController *v4;

  v4 = self;
  sub_22B88E978(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI37TVCatalogModalityDetailViewController *v4;

  v4 = self;
  sub_22B88EB74(a3);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TVCatalogModalityDetailViewController();
  v6 = a3;
  v7 = a4;
  v8 = v9.receiver;
  -[TVCatalogModalityDetailViewController didUpdateFocusInContext:withAnimationCoordinator:](&v9, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, v7);
  sub_22B88E184(v6);

}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI37TVCatalogModalityDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI37TVCatalogModalityDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC9SeymourUI37TVCatalogModalityDetailViewController *result;

  result = (_TtC9SeymourUI37TVCatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37TVCatalogModalityDetailViewController_coordinator));
}

@end
