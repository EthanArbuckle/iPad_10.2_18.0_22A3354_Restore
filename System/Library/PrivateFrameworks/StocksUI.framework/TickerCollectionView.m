@implementation TickerCollectionView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TickerCollectionView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1DC095FEC();

}

- (_TtC8StocksUI20TickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC8StocksUI20TickerCollectionView *)sub_1DC0A7A0C(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)autoScrollWithDisplayWithDisplayLink:(id)a3
{
  id v4;
  _TtC8StocksUI20TickerCollectionView *v5;

  v4 = a3;
  v5 = self;
  sub_1DC330B7C(v4);

}

- (void)handleAccessibilitySettingsChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8StocksUI20TickerCollectionView *v8;
  uint64_t v9;

  v4 = sub_1DC3FFADC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC3FFAD0();
  v8 = self;
  sub_1DC3309FC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8StocksUI20TickerCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC330EA4();
}

- (void)dealloc
{
  _TtC8StocksUI20TickerCollectionView *v2;

  v2 = self;
  sub_1DC330D9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_displayLink));
}

@end
