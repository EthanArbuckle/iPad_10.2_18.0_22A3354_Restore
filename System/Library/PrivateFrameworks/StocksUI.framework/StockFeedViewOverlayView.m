@implementation StockFeedViewOverlayView

- (_TtC8StocksUI24StockFeedViewOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI24StockFeedViewOverlayView *)sub_1DC3FA870(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI24StockFeedViewOverlayView)initWithCoder:(id)a3
{
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  _QWORD *v9;
  _TtC8StocksUI24StockFeedViewOverlayView *result;

  v5 = OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onTap;
  sub_1DC0835D8(0, (unint64_t *)&qword_1EDB2A930, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DBC348]);
  v7 = objc_allocWithZone(v6);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC8StocksUI24StockFeedViewOverlayView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8StocksUI24StockFeedViewOverlayView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1DC3FAAD8((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{

  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest));
}

@end
