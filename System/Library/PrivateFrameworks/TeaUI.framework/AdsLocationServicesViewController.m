@implementation AdsLocationServicesViewController

- (void)viewDidLoad
{
  _TtC5TeaUI33AdsLocationServicesViewController *v2;

  v2 = self;
  sub_1B16B5E04();

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI33AdsLocationServicesViewController *v2;

  v2 = self;
  sub_1B16B6170();

}

- (void)updateViewConstraints
{
  _TtC5TeaUI33AdsLocationServicesViewController *v2;

  v2 = self;
  sub_1B16B6244();

}

- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  sub_1B16B9860();
  if (a4)
  {
    sub_1B16B9860();
    if (!a5)
LABEL_3:
      sub_1B16B63F4();
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  sub_1B16B9860();
  sub_1B16B63F4();
}

- (_TtC5TeaUI33AdsLocationServicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v8;

  sub_1B16B9860();
  if (a4)
    sub_1B16B9860();
  v8 = a5;
  sub_1B16B6460();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_iconView));
  OUTLINED_FUNCTION_25_0(OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_continueCallback);
  OUTLINED_FUNCTION_25_0(OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_manageCallback);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_onboardingFlowDelegate);
}

- (void)didTapContinue
{
  _TtC5TeaUI33AdsLocationServicesViewController *v2;

  v2 = self;
  sub_1B16B656C(&OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_continueCallback);

}

- (void)didTapManage
{
  _TtC5TeaUI33AdsLocationServicesViewController *v2;

  v2 = self;
  sub_1B16B656C(&OBJC_IVAR____TtC5TeaUI33AdsLocationServicesViewController_manageCallback);

}

@end
