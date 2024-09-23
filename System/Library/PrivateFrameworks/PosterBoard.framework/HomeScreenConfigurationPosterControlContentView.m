@implementation HomeScreenConfigurationPosterControlContentView

- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithCoder:(id)a3
{
  id v4;
  _TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImage) = 0;
  v4 = a3;

  result = (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView *v2;

  v2 = self;
  sub_1CBB01200();

}

- (_TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView)initWithFrame:(CGRect)a3
{
  sub_1CBB0168C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_primaryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard47HomeScreenConfigurationPosterControlContentView_floatingImageView));
}

@end
