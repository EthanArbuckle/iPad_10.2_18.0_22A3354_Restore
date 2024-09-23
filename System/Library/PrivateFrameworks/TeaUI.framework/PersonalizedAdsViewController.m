@implementation PersonalizedAdsViewController

- (void)viewDidLoad
{
  _TtC5TeaUI29PersonalizedAdsViewController *v2;

  v2 = self;
  sub_1B16A5844();

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI29PersonalizedAdsViewController *v2;

  v2 = self;
  sub_1B16A5F20();

}

- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  sub_1B16B9860();
  if (a4)
  {
    sub_1B16B9860();
    if (!a5)
LABEL_3:
      sub_1B16A6418();
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  sub_1B16B9860();
  sub_1B16A6418();
}

- (_TtC5TeaUI29PersonalizedAdsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v8;

  sub_1B16B9860();
  if (a4)
    sub_1B16B9860();
  v8 = a5;
  sub_1B16A6484();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_adPrivacyHeaderIconView));
  OUTLINED_FUNCTION_25_0(OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOnCallback);
  OUTLINED_FUNCTION_25_0(OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOffCallback);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_onboardingFlowDelegate);
}

- (void)didTapLearnMore
{
  _TtC5TeaUI29PersonalizedAdsViewController *v2;

  v2 = self;
  sub_1B16A6550();

}

- (void)didTapTurnOn
{
  _TtC5TeaUI29PersonalizedAdsViewController *v2;

  v2 = self;
  sub_1B16A66BC(&OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOnCallback);

}

- (void)didTapTurnOff
{
  _TtC5TeaUI29PersonalizedAdsViewController *v2;

  v2 = self;
  sub_1B16A66BC(&OBJC_IVAR____TtC5TeaUI29PersonalizedAdsViewController_turnOffCallback);

}

@end
