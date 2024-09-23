@implementation KTUpdateCloudStorageOperation

- (_TtC13transparencyd29KTUpdateCloudStorageOperation)initWithDeps:(id)a3 source:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  objc_super v11;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_shouldRetry) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_deps) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_source) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_context) = (Class)a5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for KTUpdateCloudStorageOperation();
  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  return -[KTGroupOperation init](&v11, "init");
}

- (void)groupStart
{
  _TtC13transparencyd29KTUpdateCloudStorageOperation *v2;

  v2 = self;
  KTUpdateCloudStorageOperation.groupStart()();

}

- (_TtC13transparencyd29KTUpdateCloudStorageOperation)init
{
  _TtC13transparencyd29KTUpdateCloudStorageOperation *result;

  result = (_TtC13transparencyd29KTUpdateCloudStorageOperation *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTUpdateCloudStorageOperation", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_deps));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_source));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd29KTUpdateCloudStorageOperation_context));
}

@end
