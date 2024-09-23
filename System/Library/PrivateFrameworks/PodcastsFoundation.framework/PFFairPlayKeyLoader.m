@implementation PFFairPlayKeyLoader

- (PFFairPlayKeyLoader)init
{
  objc_class *ObjectType;
  id v3;
  uint64_t v4;
  PFFairPlayKeyLoader *v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  type metadata accessor for FairPlayKeySessionProvider();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  v5 = (PFFairPlayKeyLoader *)sub_1A9066800((uint64_t)v3, v4, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)createSessionWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  PFFairPlayKeyLoader *v9;

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
  FairPlayKeyLoader.createSession(asset:completion:)(v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFFairPlayKeyLoader *v8;

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
  FairPlayKeyLoader.startKeyRequest(session:completion:)((uint64_t)a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  char *v8;
  PFFairPlayKeyLoader *v9;

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
  v8 = (char *)a3;
  v9 = self;
  FairPlayKeyLoader.renewKeyRequest(asset:completion:)(v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PFFairPlayKeyLoader *v8;

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
  FairPlayKeyLoader.renewKeyRequests(assets:completion:)(v6, (uint64_t)v5, v7);
  sub_1A9085818((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)renewKeyWithSession:(id)a3
{
  PFFairPlayKeyLoader *v5;

  swift_unknownObjectRetain();
  v5 = self;
  FairPlayKeyLoader.renewKey(session:)(a3);
  swift_unknownObjectRelease();

}

- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  char *v8;
  PFFairPlayKeyLoader *v9;

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
  v8 = (char *)a3;
  v9 = self;
  FairPlayKeyLoader.stopKeyRequest(asset:completion:)(v8, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  PFFairPlayKeyLoader *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_1A9115814;
  }
  else
  {
    v7 = 0;
  }
  swift_unknownObjectRetain();
  v8 = self;
  FairPlayKeyLoader.stopKeyRequest(session:completion:)(a3, v6, v7);
  sub_1A9085818((uint64_t)v6);
  swift_unknownObjectRelease();

}

@end
