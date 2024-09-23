@implementation WorkoutPlanBrickRowCell

- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23WorkoutPlanBrickRowCell *)sub_22B764C6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23WorkoutPlanBrickRowCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B767ACC();
}

- (void)prepareForReuse
{
  _TtC9SeymourUI23WorkoutPlanBrickRowCell *v2;

  v2 = self;
  sub_22B765470();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI23WorkoutPlanBrickRowCell *v9;
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
  v10 = -[WorkoutPlanBrickRowCell contentView](v9, sel_contentView);
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

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23WorkoutPlanBrickRowCell_textLayoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
