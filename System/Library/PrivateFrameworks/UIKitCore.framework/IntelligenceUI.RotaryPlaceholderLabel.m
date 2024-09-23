@implementation IntelligenceUI.RotaryPlaceholderLabel

- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithFrame:(CGRect)a3
{
  return (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *)IntelligenceUI.RotaryPlaceholderLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithCoder:(id)a3
{
  return (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *)IntelligenceUI.RotaryPlaceholderLabel.init(coder:)(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel__attributedText;
  v4 = sub_186506910();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (CGSize)intrinsicContentSize
{
  _TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  swift_retain();
  v3 = sub_18572F248();
  v5 = v4;

  swift_release();
  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[IntelligenceUI.RotaryPlaceholderLabel intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *v2;

  v2 = self;
  IntelligenceUI.RotaryPlaceholderLabel.layoutSubviews()();

}

@end
