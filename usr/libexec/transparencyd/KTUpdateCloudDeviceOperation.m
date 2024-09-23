@implementation KTUpdateCloudDeviceOperation

- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)initWithDeps:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_shouldRetry) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_deps) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_context) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KTUpdateCloudDeviceOperation();
  v6 = a3;
  v7 = a4;
  return -[KTGroupOperation init](&v9, "init");
}

- (void)groupStart
{
  _TtC13transparencyd28KTUpdateCloudDeviceOperation *v2;

  v2 = self;
  KTUpdateCloudDeviceOperation.groupStart()();

}

- (_TtC13transparencyd28KTUpdateCloudDeviceOperation)init
{
  _TtC13transparencyd28KTUpdateCloudDeviceOperation *result;

  result = (_TtC13transparencyd28KTUpdateCloudDeviceOperation *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTUpdateCloudDeviceOperation", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_deps));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTUpdateCloudDeviceOperation_context));
}

@end
