@implementation PUPickerSuggestionResultFetcherResult

- (id)fetchResult
{
  id v2;

  PickerSuggestionResultFetcher.Result.fetchResult.getter();
  return v2;
}

- (NSDictionary)suggestionSubtypeByAssetUUID
{
  void *v2;

  if (PickerSuggestionResultFetcher.Result.suggestionSubtypeByAssetUUID.getter())
  {
    sub_1AABE0574(0, (unint64_t *)&qword_1EEBBB360);
    v2 = (void *)sub_1AB08D390();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSSet)inlinePlaybackDisallowedAssetUUIDs
{
  void *v2;

  if (PickerSuggestionResultFetcher.Result.inlinePlaybackDisallowedAssetUUIDs.getter())
  {
    v2 = (void *)sub_1AB08D6E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (BOOL)shouldReverseSortOrder
{
  PUPickerSuggestionResultFetcherResult *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = PickerSuggestionResultFetcher.Result.shouldReverseSortOrder.getter();

  return v3 & 1;
}

- (BOOL)selectedFilterableSuggestion
{
  char v2;

  PickerSuggestionResultFetcher.Result.selectedFilterableSuggestion.getter();
  return v2 & 1;
}

- (NSString)analyticsName
{
  PUPickerSuggestionResultFetcherResult *v2;
  void *v3;

  v2 = self;
  PickerSuggestionResultFetcher.Result.analyticsName.getter();

  v3 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (unint64_t)posterClassification
{
  PUPickerSuggestionResultFetcherResult *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  PickerSuggestionResultFetcher.Result.posterClassification.getter();
  v4 = v3;

  return v4;
}

- (int64_t)numberOfItemsToPlayInline
{
  PUPickerSuggestionResultFetcherResult *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  PickerSuggestionResultFetcher.Result.numberOfItemsToPlayInline.getter();
  v4 = v3;

  return v4;
}

- (NSArray)allowedColumnsOverride
{
  uint64_t v2;
  void *v3;

  PickerSuggestionResultFetcher.Result.allowedColumnsOverride.getter();
  if (v2)
  {
    v3 = (void *)sub_1AB08D5B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (BOOL)isLiveWallpaperSuggestion
{
  char v2;

  PickerSuggestionResultFetcher.Result.isLiveWallpaperSuggestion.getter();
  return v2 & 1;
}

- (PUPickerSuggestionResultFetcherResult)init
{
  PickerSuggestionResultFetcher.Result.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionResultFetcherResult_fetchResult);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4();
}

@end
