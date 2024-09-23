@implementation WorkoutPlanCalendarViewController

- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_dataSource) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_isApplyingSnapshot) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_isTappingScrollView) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI33WorkoutPlanCalendarViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *v2;

  v2 = self;
  sub_22B31F304();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_22B31FE90(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC9SeymourUI33WorkoutPlanCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI33WorkoutPlanCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_collectionView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_layoutProvider);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33WorkoutPlanCalendarViewController_dataSource));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *v11;
  uint64_t v12;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  sub_22B320E04();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v9;
  _TtC9SeymourUI33WorkoutPlanCalendarViewController *v10;

  v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  sub_22B320418(a3, a4, a5);

  swift_unknownObjectRelease();
}

@end
