@implementation WorkoutPlanDetailHeaderCell

- (_TtC9SeymourUI27WorkoutPlanDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI27WorkoutPlanDetailHeaderCell *)sub_22B97AB38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI27WorkoutPlanDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B97BC20();
}

- (void)prepareForReuse
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9SeymourUI27WorkoutPlanDetailHeaderCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v7 = self;
  -[WorkoutPlanDetailHeaderCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI27WorkoutPlanDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v6, v9);
  swift_endAccess();

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27WorkoutPlanDetailHeaderCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27WorkoutPlanDetailHeaderCell_itemInfo);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27WorkoutPlanDetailHeaderCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27WorkoutPlanDetailHeaderCell_titleLabel));
}

@end
