@implementation SASafariAssistantAssetManager

- (void)subscribeToAndPreloadSafariSummarizationAssetsForLocale:(NSString *)a3 completionHandler:(id)a4
{
  sub_2459B8F44(self, (int)a2, a3, a4);
}

- (void)ensureSafariSummarizationAssetsDownloadedForLocale:(NSString *)a3 completionHandler:(id)a4
{
  sub_2459B8F44(self, (int)a2, a3, a4);
}

- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12SearchAssets29SASafariAssistantAssetManager *v7;
  id v8;

  v4 = sub_2459D9728();
  v6 = v5;
  v7 = self;
  v8 = sub_2459B9090(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)prefilterSafariSummarizationPrefetchRequestModelWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12SearchAssets29SASafariAssistantAssetManager *v8;
  id v9;

  v5 = sub_2459D9728();
  v7 = v6;
  v8 = self;
  v9 = sub_2459B92A0(v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)prefilterSafariSummarizationPrefetchRequestWithUrlString:(id)a3 prefetchHashPrefixLength:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12SearchAssets29SASafariAssistantAssetManager *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = sub_2459D9728();
  v7 = v6;
  v8 = self;
  sub_2459B9304(v5, v7);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)unsubscribeFromSafariSummarizationAssetsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12SearchAssets29SASafariAssistantAssetManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_2459B89FC((uint64_t)&unk_2574D8DF8, v5);
}

- (void)resetSafariSummarizationAssets
{
  _TtC12SearchAssets29SASafariAssistantAssetManager *v2;

  v2 = self;
  sub_2459B95A8();

}

- (id)assetVersionForLocale:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12SearchAssets29SASafariAssistantAssetManager *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_2459D9728();
  v6 = v5;
  v7 = self;
  sub_2459B9648(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_TtC12SearchAssets29SASafariAssistantAssetManager)init
{
  sub_2459B9970();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter);
  swift_release();
}

@end
