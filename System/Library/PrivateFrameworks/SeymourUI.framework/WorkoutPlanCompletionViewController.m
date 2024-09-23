@implementation WorkoutPlanCompletionViewController

- (CGSize)preferredContentSize
{
  objc_class *ObjectType;
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v4;
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

    v6 = 0x4081300000000000;
    v7 = 0x407F400000000000;
  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    -[WorkoutPlanCompletionViewController preferredContentSize](&v12, sel_preferredContentSize);
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
  objc_class *ObjectType;
  uint64_t v7;
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = self;
  v7 = sub_22BA7D46C();
  if (v7 == sub_22BA7D46C())
  {

  }
  else
  {
    v9.receiver = v8;
    v9.super_class = ObjectType;
    -[WorkoutPlanCompletionViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);

  }
}

- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA453E0();
}

- (void)repeatButtonPressed
{
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v2;

  v2 = self;
  sub_22BA43170();

}

- (void)doneButtonPressed
{
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v2;

  v2 = self;
  sub_22BA435EC();

}

- (void)viewDidLoad
{
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v2;

  v2 = self;
  WorkoutPlanCompletionViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *v4;

  v4 = self;
  WorkoutPlanCompletionViewController.viewDidAppear(_:)(a3);

}

- (_TtC9SeymourUI35WorkoutPlanCompletionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI35WorkoutPlanCompletionViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI35WorkoutPlanCompletionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_medalContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___metricsContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___mainStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___scrollingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___medalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___buttonContentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___textStackContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___textStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___repeatButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35WorkoutPlanCompletionViewController____lazy_storage___buttonStack));
}

@end
