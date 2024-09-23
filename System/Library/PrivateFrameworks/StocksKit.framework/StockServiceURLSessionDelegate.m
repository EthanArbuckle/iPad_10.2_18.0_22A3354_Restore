@implementation StockServiceURLSessionDelegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  _TtC9StocksKit30StockServiceURLSessionDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_22CB7C9C0(v4);

}

- (_TtC9StocksKit30StockServiceURLSessionDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC9StocksKit30StockServiceURLSessionDelegate_sessionDidFinishObservers) = (Class)MEMORY[0x24BEE4AF8];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[StockServiceURLSessionDelegate init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
