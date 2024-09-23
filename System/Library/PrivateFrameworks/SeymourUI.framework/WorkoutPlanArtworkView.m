@implementation WorkoutPlanArtworkView

- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5D162C();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC9SeymourUI22WorkoutPlanArtworkView *v7;
  __C::CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  WorkoutPlanArtworkView.draw(_:)(v8);

}

- (void)layoutSubviews
{
  _TtC9SeymourUI22WorkoutPlanArtworkView *v2;

  v2 = self;
  WorkoutPlanArtworkView.layoutSubviews()();

}

- (_TtC9SeymourUI22WorkoutPlanArtworkView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI22WorkoutPlanArtworkView *result;

  result = (_TtC9SeymourUI22WorkoutPlanArtworkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B5D1714(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView____lazy_storage___placeholderImage));
  sub_22B2C6E1C(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_bottomLineColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22WorkoutPlanArtworkView_dimmedGradientLayer));
}

@end
