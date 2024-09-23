@implementation PosterLabel

- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100037478();
}

- (void)updateConstraints
{
  _TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel *v2;

  v2 = self;
  sub_1000375E4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel *v6;

  v5 = a3;
  v6 = self;
  sub_10003765C((uint64_t)a3);

}

- (_TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel)initWithFrame:(CGRect)a3
{
  sub_10003770C();
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->model[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model];
  swift_bridgeObjectRelease(*(_QWORD *)&self->model[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model
                                                  + 16]);
  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint));
}

@end
