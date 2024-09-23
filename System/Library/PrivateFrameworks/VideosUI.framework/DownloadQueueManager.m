@implementation DownloadQueueManager

- (_TtC8VideosUI20DownloadQueueManager)init
{
  _TtC8VideosUI20DownloadQueueManager *result;

  sub_1D97E2BC0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)fetchSeasonPlayables:(VUISeasonDownloadMetadata *)a3 forActionHandler:(VUIDownloadButtonActionHandler *)a4 completionBlock:(id)a5
{
  void *v8;
  _QWORD *v9;
  VUISeasonDownloadMetadata *v10;
  VUIDownloadButtonActionHandler *v11;
  _TtC8VideosUI20DownloadQueueManager *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)OUTLINED_FUNCTION_48();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1D9BCFD10((uint64_t)&unk_1F022B7A0, (uint64_t)v9);
}

- (void)addDownload:(id)a3 allowCellular:(BOOL)a4 downloadQuality:(int64_t)a5 markAsDeletedOnCancellationOrFailure:(BOOL)a6 prefer3DOrImmersiveDownload:(BOOL)a7
{
  id v8;
  _TtC8VideosUI20DownloadQueueManager *v9;

  v8 = a3;
  v9 = self;
  sub_1DA013EAC();

}

- (void)removeDownload:(id)a3
{
  id v4;
  _TtC8VideosUI20DownloadQueueManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_2_13();
  sub_1DA014744();

  OUTLINED_FUNCTION_4_3(v6);
}

- (id)assetControllersForShowCanonicalId:(id)a3
{
  return sub_1DA014EEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1DA014BA4);
}

- (id)assetControllersForSeasonCanonicalId:(id)a3
{
  return sub_1DA014EEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1DA014D8C);
}

- (id)playablesFetcher
{
  OUTLINED_FUNCTION_304();
  return self;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  swift_release();
}

- (void)assetControllerDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8VideosUI20DownloadQueueManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_2_13();
  sub_1DA01597C();

  OUTLINED_FUNCTION_4_3(v6);
}

@end
