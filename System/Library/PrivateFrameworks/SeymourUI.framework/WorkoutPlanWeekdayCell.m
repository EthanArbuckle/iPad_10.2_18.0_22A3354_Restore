@implementation WorkoutPlanWeekdayCell

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI22WorkoutPlanWeekdayCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255BA60F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for WorkoutPlanWeekdayCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[WorkoutPlanWeekdayCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  swift_beginAccess();
  sub_22B63429C((uint64_t)v5, v9);
  swift_endAccess();

}

- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  v9 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutPlanWeekdayCell();
  return -[WorkoutPlanWeekdayCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI22WorkoutPlanWeekdayCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier;
  v6 = type metadata accessor for HostedContentIdentifier();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WorkoutPlanWeekdayCell();
  return -[WorkoutPlanWeekdayCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContent));
  sub_22B6342E4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanWeekdayCell_hostedContentIdentifier);
}

@end
