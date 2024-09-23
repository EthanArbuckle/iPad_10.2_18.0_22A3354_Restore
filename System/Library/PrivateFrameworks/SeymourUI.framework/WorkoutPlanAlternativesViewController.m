@implementation WorkoutPlanAlternativesViewController

- (CGSize)preferredContentSize
{
  objc_class *ObjectType;
  _TtC9SeymourUI37WorkoutPlanAlternativesViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = sub_22BA7D46C();
  if (v5 == sub_22BA7D46C())
  {

    v6 = 0x407B800000000000;
    v7 = 0x4079000000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    -[WorkoutPlanAlternativesViewController preferredContentSize](&v12, sel_preferredContentSize);
    v7 = v8;
    v6 = v9;

  }
  v10 = *(double *)&v7;
  v11 = *(double *)&v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v5;

  height = a3.height;
  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  -[WorkoutPlanAlternativesViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI37WorkoutPlanAlternativesViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_resignActiveObserver) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_visibility) = 1;
  v4 = a3;

  result = (_TtC9SeymourUI37WorkoutPlanAlternativesViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI37WorkoutPlanAlternativesViewController *v2;

  v2 = self;
  WorkoutPlanAlternativesViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_22B301A78(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(objc_class *, uint64_t, uint64_t))MEMORY[0x24BE8E9F8]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9SeymourUI37WorkoutPlanAlternativesViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_22BA799A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  -[WorkoutPlanAlternativesViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  v11[1] = v10;
  sub_22BA79998();
  sub_22B30241C(&qword_255B8ECD0, (uint64_t)&protocol conformance descriptor for WorkoutPlanAlternativesViewController);
  sub_22BA7E114();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_22B301A78(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(objc_class *, uint64_t, uint64_t))MEMORY[0x24BE8EA00]);
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
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  -[WorkoutPlanAlternativesViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_dataProvider] + 48);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)onCloseButtonTapped:(id)a3
{
  -[WorkoutPlanAlternativesViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9SeymourUI37WorkoutPlanAlternativesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI37WorkoutPlanAlternativesViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI37WorkoutPlanAlternativesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI37WorkoutPlanAlternativesViewController_pageNavigator);
}

@end
