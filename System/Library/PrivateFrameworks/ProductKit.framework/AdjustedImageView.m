@implementation AdjustedImageView

- (_TtC10ProductKit17AdjustedImageView)initWithFrame:(CGRect)a3
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _TtC10ProductKit17AdjustedImageView *result;

  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler);
  *v5 = 0;
  v5[1] = 0;

  result = (_TtC10ProductKit17AdjustedImageView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (_TtC10ProductKit17AdjustedImageView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _TtC10ProductKit17AdjustedImageView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler);
  *v6 = 0;
  v6[1] = 0;
  v7 = a3;

  result = (_TtC10ProductKit17AdjustedImageView *)sub_213B2C38C();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10ProductKit17AdjustedImageView *v6;

  v5 = a3;
  v6 = self;
  sub_213B20710(a3);

}

- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3
{
  id v3;
  _TtC10ProductKit17AdjustedImageView *result;

  v3 = a3;
  result = (_TtC10ProductKit17AdjustedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC10ProductKit17AdjustedImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC10ProductKit17AdjustedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler));
  sub_213AD529C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler));
}

@end
