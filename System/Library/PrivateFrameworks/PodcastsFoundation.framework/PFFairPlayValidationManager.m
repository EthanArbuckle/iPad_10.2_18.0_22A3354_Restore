@implementation PFFairPlayValidationManager

- (PFFairPlayValidationManager)initWithEpisodeRemovalManager:(id)a3
{
  objc_class *ObjectType;
  id v5;
  id v6;
  uint64_t v7;
  PFFairPlayValidationManager *v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = objc_allocWithZone((Class)type metadata accessor for FairPlayKeyLoader());
  swift_unknownObjectRetain();
  v6 = objc_msgSend(v5, sel_init);
  type metadata accessor for CoreDataFairPlayEpisodeDataFetcher();
  v7 = swift_allocObject();
  v8 = (PFFairPlayValidationManager *)sub_1A906AF34(v6, (uint64_t)a3, v7, (char *)objc_allocWithZone(ObjectType));

  swift_unknownObjectRelease();
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)validateDownloadedEpisodesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  PFFairPlayValidationManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A90CAB4C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  FairPlayValidationManager.validateDownloadedEpisodes(completion:)((uint64_t)v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (PFFairPlayValidationManager)init
{
  PFFairPlayValidationManager *result;

  result = (PFFairPlayValidationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFFairPlayValidationManager_episodeFetcher);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
