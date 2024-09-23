@implementation PFFairPlayInvalidationManager

- (PFFairPlayInvalidationManager)init
{
  objc_class *ObjectType;
  id v3;
  uint64_t v4;
  PFFairPlayInvalidationManager *v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FairPlayKeyLoader()), sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  v4 = swift_allocObject();
  v5 = (PFFairPlayInvalidationManager *)sub_1A93BDACC(v3, v4, (char *)objc_allocWithZone(ObjectType));

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFFairPlayInvalidationManager *v8;

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
  v8 = self;
  FairPlayInvalidationManager.invalidateFairPlayKey(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = sub_1A93F726C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7200();
  _s18PodcastsFoundation27FairPlayInvalidationManagerC010markKeyForE02at12shouldRemovey0B03URLV_SbtF_0((uint64_t)v8, a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFFairPlayInvalidationManager *v8;

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
  v8 = self;
  FairPlayInvalidationManager.markAllFairPlayKeysForInvalidation(shouldRemove:completion:)(a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)removalAllFairPlayKeysWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  PFFairPlayInvalidationManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A9115814;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  FairPlayInvalidationManager.removalAllFairPlayKeys(completion:)((uint64_t)v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (id)removeKeyFor:(id)a3
{
  id v4;
  PFFairPlayInvalidationManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s18PodcastsFoundation27FairPlayInvalidationManagerC9removeKey3fors5Error_pSgAA0cD5AssetC_tF_0(v4);

  if (v6)
  {
    v7 = (void *)sub_1A93F711C();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayInvalidationManager_episodeFetcher);

}

@end
