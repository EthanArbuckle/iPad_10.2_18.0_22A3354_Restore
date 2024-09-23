@implementation MTSecureDownloadRenewalManager

- (MTSecureDownloadRenewalManager)initWithDelegate:(id)a3
{
  MTSecureDownloadRenewalManager *v4;

  swift_unknownObjectRetain();
  v4 = (MTSecureDownloadRenewalManager *)sub_1A90723F4((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (MTSecureDownloadRenewalManager)init
{
  return -[MTSecureDownloadRenewalManager initWithDelegate:](self, sel_initWithDelegate_, 0);
}

- (void)requestSecureDeletionOfOrphanedKeysWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  MTSecureDownloadRenewalManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A9273D90;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1A9266ACC((void (*)(_QWORD))v7, v6);
  sub_1A9085818((uint64_t)v7);

}

- (void)requestSecureDeletionOf:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  MTSecureDownloadRenewalManager *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A9273D90;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1A9267134(a3, (uint64_t)v6, v7);
  sub_1A9085818((uint64_t)v6);

}

- (void)requestSecureDeletionOfStoreTrackIds:(id)a3 completionHandler:(id)a4
{
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  MTSecureDownloadRenewalManager *v8;

  v5 = (uint64_t (*)())_Block_copy(a4);
  v6 = sub_1A93F8310();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = sub_1A9273D90;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1A92676D8(v6, (uint64_t)v5, v7);
  sub_1A9085818((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)updateDRMKeysForDownloads
{
  MTSecureDownloadRenewalManager *v2;

  v2 = self;
  sub_1A9271AF4(0, 0);

}

- (void)updateDRMKeysForDownloadsWithUrlProtocolDelegate:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  MTSecureDownloadRenewalManager *v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_1A908C20C;
  }
  else
  {
    v6 = 0;
  }
  swift_unknownObjectRetain();
  v7 = self;
  sub_1A9271AF4((uint64_t)v5, v6);
  sub_1A9085818((uint64_t)v5);
  swift_unknownObjectRelease();

}

+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  _s18PodcastsFoundation28SecureDownloadRenewalManagerC16inContextKeyData3for3ctxSo09MTOfflineiJ0CSgs5Int64V_So015NSManagedObjectH0CtFZ_0(a3, v5);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MTSecureDownloadRenewalManager_bugReporter);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MTSecureDownloadRenewalManager____lazy_storage___secureKeyLoader));
}

@end
