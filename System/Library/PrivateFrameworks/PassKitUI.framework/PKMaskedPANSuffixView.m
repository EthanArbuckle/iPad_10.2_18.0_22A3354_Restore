@implementation PKMaskedPANSuffixView

- (PKMaskedPANSuffixView)initWithSuffix:(id)a3 foregroundColor:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_19DE87BF4();
  return (PKMaskedPANSuffixView *)MaskedPANSuffixView.init(suffix:foregroundColor:)(v5, v6, a4);
}

- (PKMaskedPANSuffixView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  objc_class *v6;
  PKMaskedPANSuffixView *result;

  v4 = OBJC_IVAR___PKMaskedPANSuffixView_fontSize;
  v5 = a3;
  PKPaymentPassPANSuffixFontSize();
  *(Class *)((char *)&self->super.super.super.isa + v4) = v6;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKMaskedPANSuffixView_viewSpacing) = (Class)0x4018000000000000;

  result = (PKMaskedPANSuffixView *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  PKMaskedPANSuffixView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_19D6BF7FC(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MaskedPANSuffixView();
  v2 = v3.receiver;
  -[PKMaskedPANSuffixView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_19D6BF990(0);

}

- (PKMaskedPANSuffixView)initWithFrame:(CGRect)a3
{
  PKMaskedPANSuffixView *result;

  result = (PKMaskedPANSuffixView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
