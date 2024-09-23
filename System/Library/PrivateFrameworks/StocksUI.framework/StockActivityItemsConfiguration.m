@implementation StockActivityItemsConfiguration

- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithObjects:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  _TtC8StocksUI31StockActivityItemsConfiguration *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DC0995E8(0, &qword_1F034DDF8);
  sub_1DC408CD4();
  v5 = (void *)sub_1DC408CC8();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[StockActivityItemsConfiguration initWithObjects:](&v8, sel_initWithObjects_, v5);

  return v6;
}

- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithItemProviders:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  _TtC8StocksUI31StockActivityItemsConfiguration *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DC1C92D4();
  sub_1DC408CD4();
  v5 = (void *)sub_1DC408CC8();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[StockActivityItemsConfiguration initWithItemProviders:](&v8, sel_initWithItemProviders_, v5);

  return v6;
}

@end
