@implementation PFDispatchingFairPlayInvalidationManaging

+ (id)invalidationManager:(id)a3 receivingCallbacksOnQueue:(id)a4
{
  objc_class *ObjCClassMetadata;
  char *v7;
  id v8;
  objc_super v10;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance] = a3;
  *(_QWORD *)&v7[OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_responseQueue] = a4;
  v10.receiver = v7;
  v10.super_class = ObjCClassMetadata;
  swift_unknownObjectRetain();
  v8 = a4;
  return objc_msgSendSuper2(&v10, sel_init);
}

- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFDispatchingFairPlayInvalidationManaging *v8;

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
  DispatchingFairPlayInvalidationManaging.invalidateFairPlayKey(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  PFDispatchingFairPlayInvalidationManaging *v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v6 = sub_1A93F726C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7200();
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance);
  v11 = self;
  v12 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_markKeyForInvalidationAt_shouldRemove_, v12, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  PFDispatchingFairPlayInvalidationManaging *v8;

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
  DispatchingFairPlayInvalidationManaging.markAllFairPlayKeysForInvalidation(shouldRemove:completion:)(a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (id)removeKeyFor:(id)a3
{
  void *v4;
  id v5;
  PFDispatchingFairPlayInvalidationManaging *v6;
  id v7;
  void *v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, sel_removeKeyFor_, v5);

  if (v7)
  {
    v8 = (void *)sub_1A93F711C();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)removalAllFairPlayKeysWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  PFDispatchingFairPlayInvalidationManaging *v8;

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
  DispatchingFairPlayInvalidationManaging.removalAllFairPlayKeys(completion:)((uint64_t)v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (PFDispatchingFairPlayInvalidationManaging)init
{
  PFDispatchingFairPlayInvalidationManaging *result;

  result = (PFDispatchingFairPlayInvalidationManaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
