@implementation iCloudMailAccountProviderSwift

- (iCloudMailAccountProviderSwift)initWithPresenter:(id)a3 appleAccount:(id)a4 accountStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  return -[iCloudMailAccountProviderSwift init](&v12, sel_init);
}

- (void)presentWith:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  iCloudMailAccountProviderSwift *v8;

  v4 = a3;
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_24B4A4C38(v4, (uint64_t)sub_24B4A5998, v7);

  swift_release();
}

- (void)presentWith:(id)a3
{
  void *v4;
  uint64_t v5;
  iCloudMailAccountProviderSwift *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_24B4A511C((uint64_t)sub_24B4A5984, v5);

  swift_release();
}

- (iCloudMailAccountProviderSwift)init
{
  iCloudMailAccountProviderSwift *result;

  result = (iCloudMailAccountProviderSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator));
}

@end
