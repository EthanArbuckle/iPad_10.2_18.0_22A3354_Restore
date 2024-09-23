@implementation PUAssetHighlightTimeRangesProducer

- (PUAssetHighlightTimeRangesProducer)initWithUseDummyHighlight:(BOOL)a3
{
  PUAssetHighlightTimeRangesProducer *result;

  AssetHighlightTimeRangesProducer.init(useDummyHighlight:)(a3);
  return result;
}

- (PUAssetHighlightTimeRangesProducer)init
{
  return (PUAssetHighlightTimeRangesProducer *)AssetHighlightTimeRangesProducer.init()();
}

- (PUAssetHighlightTimeRangesProducer)initWithMediaAnalyzer:(id)a3 useDummyHighlight:(BOOL)a4
{
  swift_unknownObjectRetain();
  return (PUAssetHighlightTimeRangesProducer *)AssetHighlightTimeRangesProducer.init(mediaAnalyzer:useDummyHighlight:)((uint64_t)a3, a4);
}

- (PXDisplayAsset)asset
{
  id v2;

  sub_1AAC54D80();
  return (PXDisplayAsset *)v2;
}

- (void)setAsset:(id)a3
{
  PUAssetHighlightTimeRangesProducer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC54DE0((uint64_t)a3);

}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  id v2;

  sub_1AAC54F9C();
  return (PXSearchQueryMatchInfo *)v2;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  id v5;
  PUAssetHighlightTimeRangesProducer *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC55020(a3);

}

- (PUAssetHighlightTimeRangesProducerDelegate)delegate
{
  id v2;

  sub_1AAC55234();
  return (PUAssetHighlightTimeRangesProducerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  PUAssetHighlightTimeRangesProducer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC552B8();

}

- (NSArray)highlightTimeRanges
{
  uint64_t v2;
  void *v3;

  sub_1AAC553FC();
  if (v2)
  {
    sub_1AAB74D50(0, &qword_1EEBB7C18);
    v3 = (void *)sub_1AB08D5B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setHighlightTimeRanges:(id)a3
{
  uint64_t v3;
  PUAssetHighlightTimeRangesProducer *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1AAB74D50(0, &qword_1EEBB7C18);
    v3 = sub_1AB08D5C4();
  }
  v5 = self;
  sub_1AAC554B8(v3);

}

- (void)dealloc
{
  PUAssetHighlightTimeRangesProducer *v2;

  v2 = self;
  AssetHighlightTimeRangesProducer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUAssetHighlightTimeRangesProducer_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

@end
