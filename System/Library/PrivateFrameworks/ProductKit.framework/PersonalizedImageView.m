@implementation PersonalizedImageView

- (_TtC10ProductKit21PersonalizedImageView)initWithFrame:(CGRect)a3
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _TtC10ProductKit21PersonalizedImageView *result;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler);
  *v5 = 0;
  v5[1] = 0;

  result = (_TtC10ProductKit21PersonalizedImageView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (_TtC10ProductKit21PersonalizedImageView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _TtC10ProductKit21PersonalizedImageView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler);
  *v6 = 0;
  v6[1] = 0;
  v7 = a3;

  result = (_TtC10ProductKit21PersonalizedImageView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler));
}

@end
