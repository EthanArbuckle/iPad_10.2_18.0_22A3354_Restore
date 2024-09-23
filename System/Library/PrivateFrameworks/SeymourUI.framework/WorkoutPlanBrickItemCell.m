@implementation WorkoutPlanBrickItemCell

- (_TtC9SeymourUI24WorkoutPlanBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24WorkoutPlanBrickItemCell *)sub_22B4F02E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24WorkoutPlanBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4F2F74();
}

- (void)prepareForReuse
{
  _TtC9SeymourUI24WorkoutPlanBrickItemCell *v2;

  v2 = self;
  sub_22B4F173C();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI24WorkoutPlanBrickItemCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[WorkoutPlanBrickItemCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)swapButtonTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI24WorkoutPlanBrickItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B4F3604();

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_contentViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_titleLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_actionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24WorkoutPlanBrickItemCell_swapButton));
}

@end
