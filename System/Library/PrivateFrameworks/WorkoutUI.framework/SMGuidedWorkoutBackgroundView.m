@implementation SMGuidedWorkoutBackgroundView

- (SMGuidedWorkoutBackgroundView)initWithCornerRadius:(double)a3
{
  return (SMGuidedWorkoutBackgroundView *)GuidedWorkoutBackgroundView.init(cornerRadius:)(a3);
}

- (SMGuidedWorkoutBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_24A730FD8();
}

- (void)layoutSubviews
{
  SMGuidedWorkoutBackgroundView *v2;

  v2 = self;
  sub_24A73037C();

}

- (void)setImage:(id)a3 WithMediaType:(id)a4
{
  id v7;
  id v8;
  SMGuidedWorkoutBackgroundView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_24A730594(a3, a4);

}

- (void)updateWithActiveAppearance:(int64_t)a3
{
  void *v3;
  SMGuidedWorkoutBackgroundView *v5;
  id v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SMGuidedWorkoutBackgroundView_vignetteView);
  if (v3)
  {
    v5 = self;
    v6 = v3;
    sub_24A71F908(a3);

  }
}

- (SMGuidedWorkoutBackgroundView)initWithFrame:(CGRect)a3
{
  SMGuidedWorkoutBackgroundView *result;

  result = (SMGuidedWorkoutBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
