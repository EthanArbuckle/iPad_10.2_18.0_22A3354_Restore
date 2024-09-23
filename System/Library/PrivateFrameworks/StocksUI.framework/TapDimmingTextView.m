@implementation TapDimmingTextView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1DC33FAE4(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, (uint64_t)&unk_1EA465370, (uint64_t)sub_1DC340080, (uint64_t)&block_descriptor_24_0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1DC33FAE4(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, (uint64_t)&unk_1EA4652D0, (uint64_t)sub_1DC340038, (uint64_t)&block_descriptor_12_0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1DC33FAE4(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, (uint64_t)&unk_1EA465230, (uint64_t)sub_1DC340004, (uint64_t)&block_descriptor_39);
}

- (_TtC8StocksUI18TapDimmingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[TapDimmingTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC8StocksUI18TapDimmingTextView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[TapDimmingTextView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
