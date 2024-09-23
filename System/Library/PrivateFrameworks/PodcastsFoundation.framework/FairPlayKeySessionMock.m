@implementation FairPlayKeySessionMock

- (NSString)id
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PFFairPlayAsset)asset
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t (**)(uint64_t))self->assetHandler;
  if (v2)
  {
    v3 = swift_retain();
    v4 = (void *)v2(v3);
    swift_release();
  }
  else
  {
    v4 = (void *)sub_1A914D50C();
  }
  return (PFFairPlayAsset *)v4;
}

- (BOOL)bypassCache
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char v4;

  v2 = *(uint64_t (**)(uint64_t))self->bypassCacheHandler;
  if (v2)
  {
    v3 = swift_retain();
    v4 = v2(v3);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (NSString)keyStoreFilePath
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void (**)(uint64_t))self->keyStoreFilePathHandler;
  if (v2 && (v3 = swift_retain(), v2(v3), v5 = v4, swift_release(), v5))
  {
    v6 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (PFFairPlayKeyResponseData)keyResponseData
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t (**)(uint64_t))self->keyResponseDataHandler;
  if (v2)
  {
    v3 = swift_retain();
    v4 = (void *)v2(v3);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return (PFFairPlayKeyResponseData *)v4;
}

- (void)pauseAutomaticKeyRenewal
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->pauseHandler;
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)resumeAutomaticKeyRenewal
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->resumeHandler;
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)register
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->registerHandler;
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)deregister
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->deregisterHandler;
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)processKeyWith:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void (*)(uint64_t), uint64_t);

  v5 = _Block_copy(a4);
  v6 = sub_1A93F8040();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), uint64_t))self->processHandler;
  swift_retain();
  if (v10)
    v10(v6, v8, sub_1A914398C, v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)renewKey
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->renewHandler;
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    swift_release();
  }
}

- (void)stopAndInvalidateKeysWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void (*v6)(void (*)(uint64_t), uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void (**)(void (*)(uint64_t), uint64_t))self->stopAndInvalidateHandler;
  if (v6)
  {
    swift_retain();
    v6(sub_1A9115814, v5);
    swift_release();
  }
  swift_release();
}

@end
