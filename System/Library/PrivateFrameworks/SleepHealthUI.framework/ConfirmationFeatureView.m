@implementation ConfirmationFeatureView

- (_TtC13SleepHealthUI23ConfirmationFeatureView)init
{
  return (_TtC13SleepHealthUI23ConfirmationFeatureView *)sub_1A9BBE4DC();
}

- (_TtC13SleepHealthUI23ConfirmationFeatureView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC13SleepHealthUI23ConfirmationFeatureView *result;

  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_OWORD *)v4 + 5) = 0u;
  *((_QWORD *)v4 + 12) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_currentConstraints) = 0;
  v5 = a3;

  result = (_TtC13SleepHealthUI23ConfirmationFeatureView *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI23ConfirmationFeatureView)initWithFrame:(CGRect)a3
{
  sub_1A9BC0258();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_labelsView));
  sub_1A9BC0944(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(uint64_t *)((char *)&self->super._animationInfo + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(void **)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(void **)((char *)&self->super._layerRetained + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel), *(void **)((char *)&self->super._subviewCache + OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel));
  swift_bridgeObjectRelease();
}

@end
