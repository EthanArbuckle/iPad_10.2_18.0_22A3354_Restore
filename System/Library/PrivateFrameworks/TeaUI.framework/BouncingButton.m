@implementation BouncingButton

- (_TtC5TeaUI14BouncingButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI14BouncingButton *)BouncingButton.init(frame:)();
}

- (_TtC5TeaUI14BouncingButton)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  BouncingButton.init(coder:)((uint64_t)v3, v4, v5, v6);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B14B18DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_touchesBegan_withEvent_, (uint64_t (*)(void))sub_1B14B1978);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B14B18DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_touchesEnded_withEvent_, (uint64_t (*)(void))sub_1B14B1B4C);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1B14B18DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_touchesCancelled_withEvent_, (uint64_t (*)(void))sub_1B14B1B4C);
}

- (void).cxx_destruct
{

}

@end
