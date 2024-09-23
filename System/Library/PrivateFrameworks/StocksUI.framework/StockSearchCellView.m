@implementation StockSearchCellView

- (_TtC8StocksUI19StockSearchCellView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI19StockSearchCellView *)sub_1DC319D90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI19StockSearchCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC31AE08();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_exchangeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_priceChangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_watchlistSelectionButton));
}

- (unint64_t)accessibilityTraits
{
  _TtC8StocksUI19StockSearchCellView *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1DC31A3A0();

  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[StockSearchCellView setAccessibilityTraits:](&v4, sel_setAccessibilityTraits_, a3);
}

- (BOOL)accessibilityActivate
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8StocksUI19StockSearchCellView_watchlistSelectionButton), sel_sendActionsForControlEvents_, 64);
  return 1;
}

- (NSString)accessibilityHint
{
  uint64_t ObjCClassFromMetadata;
  void *v4;
  _TtC8StocksUI19StockSearchCellView *v5;
  id v6;
  void *v7;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DC3FFC80();

  v7 = (void *)sub_1DC408A1C();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSArray)accessibilityCustomActions
{
  _TtC8StocksUI19StockSearchCellView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1DC31A668();

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

- (void)setAccessibilityCustomActions:(id)a3
{
  objc_class *ObjectType;
  _TtC8StocksUI19StockSearchCellView *v6;
  _TtC8StocksUI19StockSearchCellView *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DC0821D4(0, &qword_1EDB42CF8);
    sub_1DC408CD4();
    v6 = self;
    a3 = (id)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[StockSearchCellView setAccessibilityCustomActions:](&v8, sel_setAccessibilityCustomActions_, a3);

}

@end
