@implementation ActivityIndicatorLoadingView

- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B167B15C();
}

- (void)layoutSubviews
{
  _TtC5TeaUI28ActivityIndicatorLoadingView *v2;

  v2 = self;
  ActivityIndicatorLoadingView.layoutSubviews()();

}

- (_TtC5TeaUI28ActivityIndicatorLoadingView)initWithFrame:(CGRect)a3
{
  ActivityIndicatorLoadingView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI28ActivityIndicatorLoadingView_activityIndicatorView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI28ActivityIndicatorLoadingView_overrideColor));
}

@end
