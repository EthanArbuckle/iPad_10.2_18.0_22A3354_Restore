@implementation PFDispatchingFairPlayKeyLoader

+ (id)receiveOn:(id)a3 loader:(id)a4
{
  objc_class *ObjCClassMetadata;
  char *v7;
  id v8;
  objc_super v10;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayKeyLoader_wrappedInstance] = a4;
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayKeyLoader_responseQueue] = a3;
  v10.receiver = v7;
  v10.super_class = ObjCClassMetadata;
  v8 = a3;
  swift_unknownObjectRetain();
  return objc_msgSendSuper2(&v10, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

- (void)createSessionWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PFDispatchingFairPlayKeyLoader *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A90CAB4C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  DispatchingFairPlayKeyLoading.createSession(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFDispatchingFairPlayKeyLoader *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A914398C;
  }
  else
  {
    v7 = 0;
  }
  swift_unknownObjectRetain();
  v8 = self;
  DispatchingFairPlayKeyLoading.startKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PFDispatchingFairPlayKeyLoader *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A914398C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  DispatchingFairPlayKeyLoading.renewKeyRequest(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PFDispatchingFairPlayKeyLoader *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for FairPlayAsset();
  v6 = sub_1A93F8310();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = sub_1A9143984;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  DispatchingFairPlayKeyLoading.renewKeyRequests(assets:completion:)(v6, (uint64_t)v5, v7);
  sub_1A9085818((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)renewKeyWithSession:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayKeyLoader_wrappedInstance), sel_renewKeyWithSession_, a3);
}

- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PFDispatchingFairPlayKeyLoader *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A914398C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  DispatchingFairPlayKeyLoading.stopKeyRequest(asset:completion:)((uint64_t)v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFDispatchingFairPlayKeyLoader *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A9115814;
  }
  else
  {
    v7 = 0;
  }
  swift_unknownObjectRetain();
  v8 = self;
  DispatchingFairPlayKeyLoading.stopKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (PFDispatchingFairPlayKeyLoader)init
{
  PFDispatchingFairPlayKeyLoader *result;

  result = (PFDispatchingFairPlayKeyLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
