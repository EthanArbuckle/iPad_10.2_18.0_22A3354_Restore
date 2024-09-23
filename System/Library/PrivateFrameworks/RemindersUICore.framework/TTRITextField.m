@implementation TTRITextField

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B4312830(self, (uint64_t)a2, (void (*)(void))TTRITextField.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_1B43E12EC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1B4312830(self, (uint64_t)a2, (void (*)(void))TTRITextField.accessibilityValue.getter);
}

- (void)setAccessibilityValue:(id)a3
{
  sub_1B43E12EC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC15RemindersUICore13TTRITextField *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TTRITextField.accessibilityUserInputLabels.getter();

  if (v3)
  {
    v4 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  _TtC15RemindersUICore13TTRITextField *v4;
  void *v5;
  _TtC15RemindersUICore13TTRITextField *v6;
  objc_super v7;

  if (a3)
  {
    sub_1B4906DAC();
    v4 = self;
    v5 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRITextField();
  -[TTRITextField setAccessibilityUserInputLabels:](&v7, sel_setAccessibilityUserInputLabels_, v5);

}

- (_TtC15RemindersUICore13TTRITextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore13TTRITextField_ttriAccessibilityLabeledWithPlaceholder) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRITextField();
  return -[TTRITextField initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore13TTRITextField)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore13TTRITextField_ttriAccessibilityLabeledWithPlaceholder) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRITextField();
  return -[TTRITextField initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
