@implementation SeparatorView

- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13SeparatorView *)sub_2C1118(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews13SeparatorView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC23ShelfKitCollectionViews13SeparatorView *result;

  v5 = OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "separatorColor");

  result = (_TtC23ShelfKitCollectionViews13SeparatorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/SeparatorView.swift", 43, 2, 31, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC23ShelfKitCollectionViews13SeparatorView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[SeparatorView traitCollection](v4, "traitCollection");
  v6 = static Separator.thickness(compatibleWith:)();

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC23ShelfKitCollectionViews13SeparatorView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = self;
  v3 = -[SeparatorView traitCollection](v2, "traitCollection");
  v4 = static Separator.thickness(compatibleWith:)();

  v5 = UIViewNoIntrinsicMetric;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews13SeparatorView *v2;

  v2 = self;
  sub_2C1414();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13SeparatorView_lineColor));
}

@end
