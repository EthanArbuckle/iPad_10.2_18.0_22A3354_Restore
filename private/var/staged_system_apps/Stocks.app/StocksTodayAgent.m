@implementation StocksTodayAgent

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC9StocksApp16StocksTodayAgent *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100043250, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_100007268((uint64_t)sub_10000FDA8, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9StocksApp16StocksTodayAgent *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[StocksTodayAgent dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_bundleSubscriptionManager));

  v3 = (char *)self + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_didWriteTodayDataSubject));

}

- (_TtC9StocksApp16StocksTodayAgent)init
{
  _TtC9StocksApp16StocksTodayAgent *result;

  result = (_TtC9StocksApp16StocksTodayAgent *)_swift_stdlib_reportUnimplementedInitializer("StocksApp.StocksTodayAgent", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)bundleSubscriptionDidSubscribe:(uint64_t)a1
{
  id result;

  result = *(id *)(a1 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (result)
    return objc_msgSend(result, "tickleWithQualityOfService:data:completion:", 9, 1, 0);
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  void *v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v4)
    objc_msgSend(v4, "tickleWithQualityOfService:data:completion:", 9, 1, 0);
  else
    __break(1u);
}

- (void)markPurchaseDirty
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v2)
    objc_msgSend(v2, "tickleWithQualityOfService:data:completion:", 9, 1, 0);
  else
    __break(1u);
}

@end
