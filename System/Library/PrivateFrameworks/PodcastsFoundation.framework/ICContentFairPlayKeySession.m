@implementation ICContentFairPlayKeySession

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
  return (PFFairPlayAsset *)*(id *)self->asset;
}

- (BOOL)bypassCache
{
  swift_beginAccess();
  return self->bypassCache[0];
}

- (void)setBypassCache:(BOOL)a3
{
  id v5;

  swift_beginAccess();
  self->bypassCache[0] = a3;
  swift_retain();
  v5 = sub_1A93D9D14();
  objc_msgSend(v5, sel_setBypassCache_, self->bypassCache[0]);
  swift_release();

}

- (NSString)keyStoreFilePath
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)&self->keyStore[7];
  if (v2)
  {
    objc_opt_self();
    v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = (void *)v3;
      swift_retain();
      swift_unknownObjectRetain();
      v5 = objc_msgSend(v4, sel_filePath);
      sub_1A93F8040();
      swift_release();
      swift_unknownObjectRelease();

      v2 = (void *)sub_1A93F8010();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (PFFairPlayKeyResponseData)keyResponseData
{
  swift_beginAccess();
  return (PFFairPlayKeyResponseData *)*(id *)&self->keyResponseData[7];
}

- (void)setKeyResponseData:(id)a3
{
  void *v5;
  id v6;

  swift_beginAccess();
  v5 = *(void **)&self->keyResponseData[7];
  *(_QWORD *)&self->keyResponseData[7] = a3;
  v6 = a3;

}

- (void)pauseAutomaticKeyRenewal
{
  sub_1A93DA13C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_pauseAutomaticKeyRenewal);
}

- (void)resumeAutomaticKeyRenewal
{
  sub_1A93DA13C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_resumeAutomaticKeyRenewal);
}

- (void)register
{
  sub_1A93DA200((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_addAsset_);
}

- (void)deregister
{
  sub_1A93DA200((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_removeAsset_);
}

- (void)processKeyWith:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  void (**v7)(uint64_t);
  uint64_t v8;
  id v9;
  id v10;

  v5 = _Block_copy(a4);
  sub_1A93F8040();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  *v7 = sub_1A914398C;
  v7[1] = (void (*)(uint64_t))v6;
  swift_retain();
  sub_1A9085818(v8);
  swift_retain();
  v9 = sub_1A93D9D14();
  v10 = (id)sub_1A93F8010();
  objc_msgSend(v9, sel_processKeyWithIdentifier_, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)renewKey
{
  swift_retain();
  ICContentFairPlayKeySession.renewKey()();
  swift_release();
}

- (void)stopAndInvalidateKeysWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[6];

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v5 = sub_1A93D9D14();
  v7[4] = sub_1A9115814;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1A90BF160;
  v7[3] = &block_descriptor_5;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_stopSessionInvalidatingKeys_withCompletion_, 1, v6);
  _Block_release(v6);
  swift_release();
  swift_release();

}

@end
