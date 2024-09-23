@implementation TVWorkoutPlanBrickItemCell

- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell *)sub_22B56351C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TVWorkoutPlanBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B565E5C();
}

- (BOOL)canBecomeFocused
{
  void *v2;
  _TtC9SeymourUI26TVWorkoutPlanBrickItemCell *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_22B0F1718(0, (unint64_t *)&qword_255B853E0);
  v5 = sub_22BA808BC();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_22BA815E8();

    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v6 == 0;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC9SeymourUI26TVWorkoutPlanBrickItemCell *v3;
  id v4;
  unint64_t v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_22B0F1718(0, (unint64_t *)&qword_255B853E0);
  v5 = sub_22BA808BC();

  sub_22B8AD56C(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)prepareForReuse
{
  _TtC9SeymourUI26TVWorkoutPlanBrickItemCell *v2;

  v2 = self;
  sub_22B5641EC();

}

- (void)handleTappedButton:(id)a3
{
  id v4;
  _TtC9SeymourUI26TVWorkoutPlanBrickItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B564A68(v4);

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_itemInfo, &qword_255B861D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVWorkoutPlanBrickItemCell_textStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
