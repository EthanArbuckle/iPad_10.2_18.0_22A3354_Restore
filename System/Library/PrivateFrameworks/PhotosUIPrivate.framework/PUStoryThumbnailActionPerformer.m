@implementation PUStoryThumbnailActionPerformer

- (PUStoryThumbnailActionPerformer)initWithModel:(id)a3
{
  return (PUStoryThumbnailActionPerformer *)StoryThumbnailActionPerformer.init(model:)(a3);
}

- (id)presentPlayerAction
{
  return sub_1AAC82888((uint64_t)self, (uint64_t)a2, sub_1AAC826C0, (uint64_t)&block_descriptor_19_2);
}

- (void)setPresentPlayerAction:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  PUStoryThumbnailActionPerformer *v6;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AAC84418;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AAC82754((uint64_t)v4, v5);

}

- (id)presentDetailsViewAction
{
  return sub_1AAC82888((uint64_t)self, (uint64_t)a2, sub_1AAC82900, (uint64_t)&block_descriptor_52);
}

- (void)setPresentDetailsViewAction:(id)a3
{
  void *v4;
  uint64_t v5;
  PUStoryThumbnailActionPerformer *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AAC842E0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AAC829E8((uint64_t)v4, v5);

}

- (void)setFavorite:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  PUStoryThumbnailActionPerformer *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1AAC842B8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1AAC82B60(a3, (uint64_t)v6, v7);
  sub_1AAB88C0C((uint64_t)v6);

}

- (void)presentShareSheet
{
  PUStoryThumbnailActionPerformer *v2;

  v2 = self;
  sub_1AAC82DD8();

}

- (void)presentTitleEditor
{
  PUStoryThumbnailActionPerformer *v2;

  v2 = self;
  sub_1AAC8300C();

}

- (void)deleteMemory
{
  PUStoryThumbnailActionPerformer *v2;

  v2 = self;
  sub_1AAC8304C();

}

- (void)featureLess:(id)a3
{
  id v4;
  PUStoryThumbnailActionPerformer *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC830B8();

}

- (void)fileRadar
{
  PUStoryThumbnailActionPerformer *v2;

  v2 = self;
  sub_1AAC83168();

}

- (void)showVisualDiagnostics
{
  PUStoryThumbnailActionPerformer *v2;

  v2 = self;
  sub_1AAC837C4();

}

- (PUStoryThumbnailActionPerformer)init
{
  StoryThumbnailActionPerformer.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  sub_1AAC84300((uint64_t)self + OBJC_IVAR___PUStoryThumbnailActionPerformer_currentAssetCollection);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR___PUStoryThumbnailActionPerformer_presentPlayerAction);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR___PUStoryThumbnailActionPerformer_presentDetailsViewAction);
  swift_release();
}

@end
