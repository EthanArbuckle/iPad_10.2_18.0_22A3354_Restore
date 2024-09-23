@implementation ATRawAssortmentServer

- (_TtC12textcontextd21ATRawAssortmentServer)init
{
  return (_TtC12textcontextd21ATRawAssortmentServer *)sub_100002DD0();
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC12textcontextd21ATRawAssortmentServer *v5;
  objc_super v6;

  v3 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener);
  v5 = self;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "invalidate");
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ATRawAssortmentServer();
  -[ATRawAssortmentServer dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC12textcontextd21ATRawAssortmentServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100003284(v7);

  return v9 & 1;
}

@end
