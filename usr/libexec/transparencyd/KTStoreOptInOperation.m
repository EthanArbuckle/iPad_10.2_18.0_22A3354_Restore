@implementation KTStoreOptInOperation

- (void)groupStart
{
  _TtC13transparencyd21KTStoreOptInOperation *v2;

  v2 = self;
  KTStoreOptInOperation.groupStart()();

}

- (_TtC13transparencyd21KTStoreOptInOperation)init
{
  _TtC13transparencyd21KTStoreOptInOperation *result;

  result = (_TtC13transparencyd21KTStoreOptInOperation *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTStoreOptInOperation", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_context));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_records));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_storedRecords));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_database));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super.super._timeoutCanOccur
                                      + OBJC_IVAR____TtC13transparencyd21KTStoreOptInOperation_type));
}

@end
