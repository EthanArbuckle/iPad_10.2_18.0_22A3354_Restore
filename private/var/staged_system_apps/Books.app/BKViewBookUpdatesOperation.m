@implementation BKViewBookUpdatesOperation

- (BKViewBookUpdatesOperation)initWithAdamID:(id)a3 version:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  objc_super v15;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_parameters);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error) = 0;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_adamID);
  *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_version);
  *v12 = v9;
  v12[1] = v13;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ViewBookUpdatesOperation();
  return -[BKViewBookUpdatesOperation init](&v15, "init");
}

- (NSString)parameters
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_parameters;
  swift_beginAccess((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_parameters, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return (NSString *)0;
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setParameters:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_parameters);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (NSError)error
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_error);
  swift_beginAccess((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_error, v6, 0, 0);
  v3 = *v2;
  if (!v3)
    return (NSError *)0;
  swift_errorRetain(v3);
  v4 = (void *)_convertErrorToNSError(_:)(v3);
  swift_errorRelease(v3);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  id *v4;
  id v5;
  id v6;
  char v7[24];

  v4 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error);
  swift_beginAccess((char *)self + OBJC_IVAR___BKViewBookUpdatesOperation_error, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;
  swift_errorRelease(v5);
}

- (void)main
{
  BKViewBookUpdatesOperation *v2;

  v2 = self;
  ViewBookUpdatesOperation.main()();

}

- (BKViewBookUpdatesOperation)init
{
  BKViewBookUpdatesOperation *result;

  result = (BKViewBookUpdatesOperation *)_swift_stdlib_reportUnimplementedInitializer("Books.ViewBookUpdatesOperation", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->adamID[OBJC_IVAR___BKViewBookUpdatesOperation_adamID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->adamID[OBJC_IVAR___BKViewBookUpdatesOperation_version]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->adamID[OBJC_IVAR___BKViewBookUpdatesOperation_parameters]);
  swift_errorRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKViewBookUpdatesOperation_error));
}

@end
