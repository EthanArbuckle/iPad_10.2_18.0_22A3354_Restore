@implementation StockSparklineView.NonAnimatingDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _TtCC8StocksUI18StockSparklineViewP33_D110489D7989A286557923EB4206D59120NonAnimatingDelegate *v8;
  id v9;

  v6 = objc_allocWithZone(MEMORY[0x1E0C99E38]);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_init);

  return v9;
}

- (_TtCC8StocksUI18StockSparklineViewP33_D110489D7989A286557923EB4206D59120NonAnimatingDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StockSparklineView.NonAnimatingDelegate();
  return -[StockSparklineView.NonAnimatingDelegate init](&v3, sel_init);
}

@end
