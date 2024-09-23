@implementation StockView.PriceChangeButton

- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  Class v9;
  id v10;
  _TtCC8StocksUI9StockView17PriceChangeButton *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap;
  sub_1DC083594(0, (unint64_t *)&qword_1EDB2A930, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v10 = objc_allocWithZone(v9);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for StockView.PriceChangeButton();
  return -[StockView.PriceChangeButton initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _TtCC8StocksUI9StockView17PriceChangeButton *v9;
  _TtCC8StocksUI9StockView17PriceChangeButton *v10;
  objc_super v12;

  v5 = OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap;
  sub_1DC083594(0, (unint64_t *)&qword_1EDB2A930, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for StockView.PriceChangeButton();
  v10 = -[StockView.PriceChangeButton initWithCoder:](&v12, sel_initWithCoder_, v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap));
}

@end
