@implementation SliderView.SliderGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer *v7;
  void *v8;
  objc_super v9;

  sub_22B0F1718(0, &qword_255B9A938);
  sub_22B4DF8C8();
  sub_22BA80AF0();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_22BA80AE4();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for SliderView.SliderGestureRecognizer();
  -[SliderView.SliderGestureRecognizer touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v8, v6);

  -[SliderView.SliderGestureRecognizer setState:](v7, sel_setState_, 1);
  swift_bridgeObjectRelease();
}

- (_TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_22BA812E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer *)sub_22BA20788((uint64_t)v6, (uint64_t)a4);
}

@end
