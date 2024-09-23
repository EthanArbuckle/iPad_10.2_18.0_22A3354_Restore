@implementation PFDispatchingFairPlayValidationManaging

+ (id)receiveOn:(id)a3 manager:(id)a4
{
  objc_class *ObjCClassMetadata;
  char *v7;
  id v8;
  objc_super v10;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayValidationManaging_wrappedInstance] = a4;
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayValidationManaging_responseQueue] = a3;
  v10.receiver = v7;
  v10.super_class = ObjCClassMetadata;
  v8 = a3;
  swift_unknownObjectRetain();
  return objc_msgSendSuper2(&v10, sel_init);
}

- (void)validateDownloadedEpisodesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  PFDispatchingFairPlayValidationManaging *v8;

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
  DispatchingFairPlayValidationManaging.validateDownloadedEpisodes(completion:)((uint64_t)v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (PFDispatchingFairPlayValidationManaging)init
{
  PFDispatchingFairPlayValidationManaging *result;

  result = (PFDispatchingFairPlayValidationManaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
