@implementation FairPlayKeyLoadingMock

- (void)createSessionWithAsset:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(id, void (*)(uint64_t, uint64_t), uint64_t);
  id v10;
  id v11;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_1A90CAB4C;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t, uint64_t), uint64_t))self->createSessionHandler;
  if (v9)
  {
    v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    v11 = a3;
    swift_retain();
  }
  sub_1A9085818((uint64_t)v8);
  swift_release();

}

- (void)startKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void (*v10)(id, void (*)(uint64_t), uint64_t);

  v6 = _Block_copy(a4);
  if (!v6)
  {
    v9 = 0;
    v8 = 0;
    v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->startKeyRequestHandler;
    if (v10)
      goto LABEL_3;
LABEL_5:
    swift_unknownObjectRetain();
    swift_retain();
    goto LABEL_6;
  }
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = sub_1A914398C;
  v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->startKeyRequestHandler;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  swift_unknownObjectRetain();
  swift_retain();
  v10(a3, v9, v8);
LABEL_6:
  sub_1A9085818((uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
}

- (void)renewKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void (*v9)(id, void (*)(uint64_t), uint64_t);
  id v10;
  id v11;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_1A914398C;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->renewKeyRequestHandler;
  if (v9)
  {
    v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    v11 = a3;
    swift_retain();
  }
  sub_1A9085818((uint64_t)v8);
  swift_release();

}

- (void)renewKeyRequestsWithAssets:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t);

  v5 = _Block_copy(a4);
  type metadata accessor for FairPlayAsset();
  v6 = sub_1A93F8310();
  if (!v5)
  {
    v8 = 0;
    v7 = 0;
    v9 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))self->renewKeyRequestsHandler;
    if (v9)
      goto LABEL_3;
LABEL_5:
    swift_retain();
    goto LABEL_6;
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = sub_1A9143984;
  v9 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))self->renewKeyRequestsHandler;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  swift_retain();
  v9(v6, v8, v7);
LABEL_6:
  sub_1A9085818((uint64_t)v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)renewKeyWithSession:(id)a3
{
  void (*v3)(id);

  v3 = *(void (**)(id))self->renewKeyHandler;
  if (v3)
  {
    swift_unknownObjectRetain();
    swift_retain();
    v3(a3);
    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)stopKeyRequestWithAsset:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void (*v9)(id, void (*)(uint64_t), uint64_t);
  id v10;
  id v11;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_1A914398C;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestAssetHandler;
  if (v9)
  {
    v10 = a3;
    swift_retain();
    v9(v10, v8, v7);
  }
  else
  {
    v11 = a3;
    swift_retain();
  }
  sub_1A9085818((uint64_t)v8);
  swift_release();

}

- (void)stopKeyRequestWithSession:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void (*v10)(id, void (*)(uint64_t), uint64_t);

  v6 = _Block_copy(a4);
  if (!v6)
  {
    v9 = 0;
    v8 = 0;
    v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestSessionHandler;
    if (v10)
      goto LABEL_3;
LABEL_5:
    swift_unknownObjectRetain();
    swift_retain();
    goto LABEL_6;
  }
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = sub_1A9115814;
  v10 = *(void (**)(id, void (*)(uint64_t), uint64_t))self->stopKeyRequestSessionHandler;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  swift_unknownObjectRetain();
  swift_retain();
  v10(a3, v9, v8);
LABEL_6:
  sub_1A9085818((uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
}

@end
