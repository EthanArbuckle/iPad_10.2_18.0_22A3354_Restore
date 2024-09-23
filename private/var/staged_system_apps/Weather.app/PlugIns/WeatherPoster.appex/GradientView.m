@implementation GradientView

- (_TtC13WeatherPoster12GradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100022868();
}

- (void)layoutSubviews
{
  _TtC13WeatherPoster12GradientView *v2;

  v2 = self;
  sub_100022918();

}

- (_TtC13WeatherPoster12GradientView)initWithFrame:(CGRect)a3
{
  sub_100022AA8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100022D74((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12GradientView_rotationState);
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
  v4 = sub_100022F0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
