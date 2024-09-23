@implementation MediaItemMetadataLoadingMock

- (void)keyIdentifiersFrom:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  void (*v7)(id, void (*)(uint64_t), uint64_t);
  id v8;
  id v9;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->keyIdentifiersHandler;
  if (v7)
  {
    v8 = a3;
    swift_retain();
    sub_1A90858C0((uint64_t)v7);
    v7(v8, sub_1A9183F90, v6);
    sub_1A9085818((uint64_t)v7);
    swift_release();
  }
  else
  {
    v9 = a3;
  }
  swift_release();

}

@end
