@implementation FallbackPluginViewController

- (_TtC5TeaUIP33_555B43D3A3BE92296C45DE65B67B87E428FallbackPluginViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1B16B9860();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5TeaUIP33_555B43D3A3BE92296C45DE65B67B87E428FallbackPluginViewController *)sub_1B14A0104(v5, v7, a4);
}

- (_TtC5TeaUIP33_555B43D3A3BE92296C45DE65B67B87E428FallbackPluginViewController)initWithCoder:(id)a3
{
  return (_TtC5TeaUIP33_555B43D3A3BE92296C45DE65B67B87E428FallbackPluginViewController *)sub_1B14A0220(a3);
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self+ OBJC_IVAR____TtC5TeaUIP33_555B43D3A3BE92296C45DE65B67B87E428FallbackPluginViewController_pluggableDelegate);
}

@end
