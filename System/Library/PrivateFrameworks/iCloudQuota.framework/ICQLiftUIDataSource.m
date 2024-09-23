@implementation ICQLiftUIDataSource

- (_TtC11iCloudQuota19ICQLiftUIDataSource)initWithAccount:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID) = xmmword_1CDF39D90;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[ICQLiftUIDataSource init](&v8, sel_init);
}

- (_TtC11iCloudQuota19ICQLiftUIDataSource)init
{
  _TtC11iCloudQuota19ICQLiftUIDataSource *result;

  result = (_TtC11iCloudQuota19ICQLiftUIDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1CDF2E34C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID), *(_QWORD *)&self->account[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID]);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _TtC11iCloudQuota19ICQLiftUIDataSource *v20;
  uint64_t v21;

  v12 = sub_1CDF32928();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  sub_1CDF3291C();
  _Block_copy(v16);
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = self;
  sub_1CDF2E3D4((uint64_t)v15, (uint64_t)v20, (uint64_t)v16);
  _Block_release(v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

@end
