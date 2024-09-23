@implementation PassLocationWeatherManager

- (void)fetchWeatherDisplayInformationFor:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC9PassKitUI26PassLocationWeatherManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_19D22DE6C(v7, (uint64_t)v8, (void (**)(const void *, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC9PassKitUI26PassLocationWeatherManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PassLocationWeatherManager init](&v3, sel_init);
}

@end
