@implementation IdentificationService

- (_TtC9StocksKit21IdentificationService)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  _TtC9StocksKit21IdentificationService *v6;
  void *v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC9StocksKit21IdentificationService_sensitiveUserDefaults;
  v5 = qword_255C34D70;
  v6 = self;
  if (v5 != -1)
    swift_once();
  v7 = (void *)qword_255C3A290;
  *(Class *)((char *)&v6->super.isa + v4) = (Class)qword_255C3A290;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC9StocksKit21IdentificationService_observers) = (Class)MEMORY[0x24BEE4AF8];
  v8 = v7;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return -[IdentificationService init](&v10, sel_init);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
