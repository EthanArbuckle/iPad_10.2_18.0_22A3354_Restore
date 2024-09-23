@implementation PUPickerSuggestionResultFetcher

- (PUPickerSuggestion)currentSuggestion
{
  PUPickerSuggestionResultFetcher *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AAC0F088();

  return (PUPickerSuggestion *)v3;
}

- (void)setCurrentSuggestion:(id)a3
{
  PUPickerSuggestionResultFetcher *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC0F1FC((uint64_t)a3);

}

- (PUPickerSuggestionResultFetcher)initWithPhotoLibrary:(id)a3 isProcessing:(BOOL)a4 isDeviceAspectRatioContentMode:(BOOL)a5 contentHasSpecialFilter:(BOOL)a6 updateHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  PUPickerSuggestionResultFetcher *result;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  PickerSuggestionResultFetcher.init(photoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:)(a3, a4, a5, a6, (uint64_t)sub_1AAC112D4, v12);
  return result;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  PUPickerSuggestionResultFetcher *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC107DC(v4);

}

- (PUPickerSuggestionResultFetcher)init
{
  PickerSuggestionResultFetcher.init()();
}

- (void).cxx_destruct
{

  swift_release();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionResultFetcher_workQueue);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionResultFetcher_workQueue_result);
  OUTLINED_FUNCTION_4();
}

@end
