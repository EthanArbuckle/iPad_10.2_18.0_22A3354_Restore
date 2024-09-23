@implementation StockSectionFooterView

- (_TtC8StocksUI22StockSectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI22StockSectionFooterView *)sub_1DC37702C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI22StockSectionFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC3774E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_moreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_symbolLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_arrowShapeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_topLineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_onTap));
}

- (CGRect)accessibilityFrame
{
  void *v2;
  _TtC8StocksUI22StockSectionFooterView *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;
  CGRect v38;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_moreLabel);
  v3 = self;
  objc_msgSend(v2, sel_accessibilityFrame);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_symbolLabel), sel_accessibilityFrame);
  v37.origin.x = v12;
  v37.origin.y = v13;
  v37.size.width = v14;
  v37.size.height = v15;
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  v33 = CGRectUnion(v32, v37);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_arrowShapeView), sel_accessibilityFrame);
  v38.origin.x = v20;
  v38.origin.y = v21;
  v38.size.width = v22;
  v38.size.height = v23;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectUnion(v34, v38);
  v24 = v35.origin.x;
  v25 = v35.origin.y;
  v26 = v35.size.width;
  v27 = v35.size.height;

  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

@end
