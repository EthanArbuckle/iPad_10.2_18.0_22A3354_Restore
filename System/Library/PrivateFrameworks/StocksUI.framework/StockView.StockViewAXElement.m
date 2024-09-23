@implementation StockView.StockViewAXElement

- (NSAttributedString)accessibilityAttributedValue
{
  uint64_t v3;
  void *v4;
  _TtCC8StocksUI9StockView18StockViewAXElement *v5;
  void *v6;

  v3 = MEMORY[0x1DF0CAD78]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    v6 = (void *)sub_1DC31E408();

  }
  else
  {
    v6 = 0;
  }
  return (NSAttributedString *)v6;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtCC8StocksUI9StockView18StockViewAXElement *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1DC31D99C();

  if (v3)
  {
    v4 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSArray)accessibilityCustomActions
{
  _TtCC8StocksUI9StockView18StockViewAXElement *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1DC31DE1C();

  if (v3)
  {
    sub_1DC0821D4(0, &qword_1EDB42CF8);
    v4 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  void *v4;
  _TtCC8StocksUI9StockView18StockViewAXElement *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = MEMORY[0x1DF0CAD78]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_accessibilityFrame);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = 0.0;
    v13 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  _TtCC8StocksUI9StockView18StockViewAXElement *v4;
  _BYTE *v5;
  unint64_t *v6;
  _TtCC8StocksUI9StockView18StockViewAXElement *v7;
  _TtCC8StocksUI9StockView18StockViewAXElement *v8;
  unint64_t v9;

  v3 = MEMORY[0x1DF0CAD78]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (!v3)
  {
    v7 = self;
LABEL_6:
    v6 = (unint64_t *)MEMORY[0x1E0DC4690];
    v4 = self;
    goto LABEL_7;
  }
  v4 = (_TtCC8StocksUI9StockView18StockViewAXElement *)v3;
  v5 = (_BYTE *)(v3 + OBJC_IVAR____TtC8StocksUI9StockView_isSelected);
  swift_beginAccess();
  if ((*v5 & 1) == 0)
  {
    v8 = self;

    goto LABEL_6;
  }
  v6 = (unint64_t *)MEMORY[0x1E0DC46B0];
LABEL_7:
  v9 = *v6;

  return v9;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  _TtCC8StocksUI9StockView18StockViewAXElement *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1DC31E010();

  return (NSAttributedString *)v3;
}

- (_TtCC8StocksUI9StockView18StockViewAXElement)initWithAccessibilityContainer:(id)a3
{
  _TtCC8StocksUI9StockView18StockViewAXElement *result;

  swift_unknownObjectRetain();
  sub_1DC409634();
  swift_unknownObjectRelease();
  result = (_TtCC8StocksUI9StockView18StockViewAXElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC8StocksUI9StockView18StockViewAXElement)init
{
  _TtCC8StocksUI9StockView18StockViewAXElement *result;

  result = (_TtCC8StocksUI9StockView18StockViewAXElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
