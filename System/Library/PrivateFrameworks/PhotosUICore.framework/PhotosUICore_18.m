BOOL MKMapRectSpans180thMeridian(MKMapRect rect)
{
  return MEMORY[0x1E0CC1660]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  MKMapRect result;

  MEMORY[0x1E0CC1668]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  CLLocationDistance result;

  MEMORY[0x1E0CC1688]((__n128)a, *(__n128 *)&a.y, (__n128)b, *(__n128 *)&b.y);
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1E0CC69D0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_mainScreenHeight()
{
  return MEMORY[0x1E0DE2C48]();
}

uint64_t MobileGestalt_get_mainScreenWidth()
{
  return MEMORY[0x1E0DE2C50]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1E0DC32D8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromPLCloudFeedEntryFilter()
{
  return MEMORY[0x1E0D71560]();
}

uint64_t NSStringFromPXEdgeInsets()
{
  return off_1E50B0160();
}

uint64_t NSStringFromPXGSpriteIndexRange()
{
  return off_1E50B0168();
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NUPixelRectIsEmpty()
{
  return MEMORY[0x1E0D51E80]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x1E0D51EC8]();
}

uint64_t PFAllPlatformsLivePhotoBundleTypes()
{
  return MEMORY[0x1E0D75370]();
}

uint64_t PFArrayRandomObjectWithRandomNumberGenerator()
{
  return MEMORY[0x1E0D75378]();
}

uint64_t PFBitmaskDescription()
{
  return MEMORY[0x1E0D753C8]();
}

uint64_t PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround()
{
  return MEMORY[0x1E0D753D0]();
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x1E0D753F8]();
}

uint64_t PFDeviceScreenScale()
{
  return MEMORY[0x1E0D75408]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x1E0D75410]();
}

uint64_t PFDisplayAssetPlaybackStyleDescription()
{
  return MEMORY[0x1E0D75418]();
}

uint64_t PFExists()
{
  return MEMORY[0x1E0D710A0]();
}

uint64_t PFFilter()
{
  return MEMORY[0x1E0D710A8]();
}

uint64_t PFFrameApplyingContentsRectInBounds()
{
  return MEMORY[0x1E0D75470]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x1E0D75480]();
}

uint64_t PFLocalizedStringWithValidatedFormat()
{
  return MEMORY[0x1E0D710C0]();
}

uint64_t PFMap()
{
  return MEMORY[0x1E0D710C8]();
}

uint64_t PFMessagesStackLayoutGeometryGetScale()
{
  return MEMORY[0x1E0D75538]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1E0D710D8]();
}

uint64_t PFOSVariantHasInternalUI()
{
  return MEMORY[0x1E0D710E0]();
}

uint64_t PFPosterShuffleSmartAlbumsDescription()
{
  return MEMORY[0x1E0D75878]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x1E0D71108]();
}

uint64_t PFSceneTaxonomyEnumerateTopologicallyOrderedNodes()
{
  return MEMORY[0x1E0D758A0]();
}

uint64_t PFSceneTaxonomyNodeExtendedSceneClassId()
{
  return MEMORY[0x1E0D758B8]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x1E0D758E8]();
}

uint64_t PFSharedFigDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x1E0D75928]();
}

uint64_t PFShuffledArrayWithRandomNumberGenerator()
{
  return MEMORY[0x1E0D75960]();
}

uint64_t PFStoryColorGradeCategoryFromValenceArousal()
{
  return MEMORY[0x1E0D75968]();
}

uint64_t PFStoryColorGradeCategoryGetArousal()
{
  return MEMORY[0x1E0D75970]();
}

uint64_t PFStoryColorGradeCategoryNamed()
{
  return MEMORY[0x1E0D75978]();
}

uint64_t PFStoryColorGradeKindToString()
{
  return MEMORY[0x1E0D75988]();
}

uint64_t PFStoryColorGradeSupportedCategories()
{
  return MEMORY[0x1E0D75990]();
}

uint64_t PFStoryDurationInfoDescription()
{
  return MEMORY[0x1E0D75998]();
}

uint64_t PFStoryOverallDurationInfoDescription()
{
  return MEMORY[0x1E0D759A8]();
}

uint64_t PFStoryOverallDurationKindDescription()
{
  return MEMORY[0x1E0D759B8]();
}

uint64_t PFStoryRecipeClipMotionStyleDescription()
{
  return MEMORY[0x1E0D759D0]();
}

uint64_t PFStoryRecipeClipTransitionKindDescription()
{
  return MEMORY[0x1E0D759D8]();
}

uint64_t PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision()
{
  return MEMORY[0x1E0D759E0]();
}

uint64_t PFStoryRecipeSongPaceDescription()
{
  return MEMORY[0x1E0D75A00]();
}

uint64_t PFStoryRecipeSongPaceFromVisualTempo()
{
  return MEMORY[0x1E0D75A08]();
}

uint64_t PFStoryTitleCategoryGenerateWithWrappedIndex()
{
  return MEMORY[0x1E0D75A20]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x1E0D71140]();
}

uint64_t PFStringWithValidatedFormatAndLocale()
{
  return MEMORY[0x1E0D71148]();
}

uint64_t PFUIGetLog()
{
  return MEMORY[0x1E0D71150]();
}

uint64_t PHAssetDeferredProcessingInvalidatesContentWhenCompleted()
{
  return MEMORY[0x1E0CD1868]();
}

uint64_t PHAssetDeferredProcessingNeededDescription()
{
  return MEMORY[0x1E0CD1870]();
}

uint64_t PHAssetExportRequestPassthroughConversionIsSupportedByType()
{
  return MEMORY[0x1E0CD18A8]();
}

uint64_t PHAssetImportSourceDescription()
{
  return MEMORY[0x1E0CD18D0]();
}

uint64_t PHAssetMediaAnalysisStringsWithMultipleAudioClassifications()
{
  return MEMORY[0x1E0CD18E0]();
}

uint64_t PHAssetMediaAnalysisSyndicationProcessingValueDescription()
{
  return MEMORY[0x1E0CD18E8]();
}

uint64_t PHAssetMediaSubtypesDebugDescription()
{
  return MEMORY[0x1E0CD18F0]();
}

uint64_t PHAssetMediaTypeDebugDescription()
{
  return MEMORY[0x1E0CD18F8]();
}

uint64_t PHAssetOriginalLocationForAsset()
{
  return MEMORY[0x1E0CD1900]();
}

uint64_t PHAssetPlaybackStyleDebugDescription()
{
  return MEMORY[0x1E0CD1908]();
}

uint64_t PHAssetPlaybackVariationDebugDescription()
{
  return MEMORY[0x1E0CD1910]();
}

uint64_t PHAssetSyndicationEligibilityDescription()
{
  return MEMORY[0x1E0CD1AA8]();
}

uint64_t PHAssetSyndicationEligibilityShortDescription()
{
  return MEMORY[0x1E0CD1AB0]();
}

uint64_t PHAssetSyndicationProcessingVersionDescription()
{
  return MEMORY[0x1E0CD1AC0]();
}

uint64_t PHDescriptionForSharingComposition()
{
  return MEMORY[0x1E0CD1B40]();
}

uint64_t PHMemoryCreationTypeDescription()
{
  return MEMORY[0x1E0CD1CD8]();
}

uint64_t PHMemoryMoodForString()
{
  return MEMORY[0x1E0CD1D00]();
}

uint64_t PHMemoryPendingStateDescription()
{
  return MEMORY[0x1E0CD1D18]();
}

uint64_t PHPhotosHighlightTypeConsideredTrip()
{
  return MEMORY[0x1E0CD1D90]();
}

uint64_t PHQuestionOptionsDebugDescription()
{
  return MEMORY[0x1E0CD1DA0]();
}

uint64_t PHShortDescriptionForPhotosHighlightCategory()
{
  return MEMORY[0x1E0CD1DF8]();
}

uint64_t PHShortDescriptionForPhotosHighlightEnrichmentState()
{
  return MEMORY[0x1E0CD1E00]();
}

uint64_t PHShortDescriptionForPhotosHighlightKind()
{
  return MEMORY[0x1E0CD1E08]();
}

uint64_t PHShortDescriptionForPhotosHighlightType()
{
  return MEMORY[0x1E0CD1E10]();
}

uint64_t PHShortDescriptionForPhotosHighlightVisibilityState()
{
  return MEMORY[0x1E0CD1E18]();
}

uint64_t PHStringForMemoryMood()
{
  return MEMORY[0x1E0CD1E20]();
}

uint64_t PHSuggestionNotificationStateStringWithNotificationState()
{
  return MEMORY[0x1E0CD1E30]();
}

uint64_t PHSuggestionStateStringWithState()
{
  return MEMORY[0x1E0CD1E38]();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x1E0CD1E40]();
}

uint64_t PHSuggestionStringWithType()
{
  return MEMORY[0x1E0CD1E48]();
}

uint64_t PIAutoLoopFlavorFromString()
{
  return MEMORY[0x1E0D712F8]();
}

uint64_t PLAlbumImportOperationDebugDescription()
{
  return MEMORY[0x1E0D71C30]();
}

uint64_t PLAnimationTelemetryGetLog()
{
  return MEMORY[0x1E0D733C0]();
}

uint64_t PLAppIntentsGetLog()
{
  return MEMORY[0x1E0D733C8]();
}

uint64_t PLAudioPlaybackGetLog()
{
  return MEMORY[0x1E0D73488]();
}

uint64_t PLBoopGetLog()
{
  return MEMORY[0x1E0D734B8]();
}

uint64_t PLCMMTitleAndSubtitleForTitleAndFallbackDates()
{
  return MEMORY[0x1E0D71C68]();
}

uint64_t PLCPLErrorDebugDescription()
{
  return MEMORY[0x1E0D71C70]();
}

uint64_t PLCPLRecordDidNotifyDeleteBehaviorForCurrentAccount()
{
  return MEMORY[0x1E0D71CA8]();
}

uint64_t PLCPLShouldNotifyDeleteBehaviorForCurrentAccount()
{
  return MEMORY[0x1E0D71CC0]();
}

uint64_t PLCPLShouldRequireStorageUpgradeForError()
{
  return MEMORY[0x1E0D71CC8]();
}

uint64_t PLCanEnableCloudPhotoLibraryForAccount()
{
  return MEMORY[0x1E0D71CE0]();
}

uint64_t PLCloudFeedGetLog()
{
  return MEMORY[0x1E0D73558]();
}

uint64_t PLCloudPhotoLibraryLocalModeEnabled()
{
  return MEMORY[0x1E0D71D28]();
}

uint64_t PLContentPrivacyUIGetLog()
{
  return MEMORY[0x1E0D73578]();
}

uint64_t PLCuratedLibraryGetLog()
{
  return MEMORY[0x1E0D73DB0]();
}

uint64_t PLCurationAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D71D80]();
}

uint64_t PLDragAndDropGetLog()
{
  return MEMORY[0x1E0D73E60]();
}

uint64_t PLDuplicateDetectionGetLog()
{
  return MEMORY[0x1E0D73E68]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1E0D73E98]();
}

uint64_t PLGadgetsGetLog()
{
  return MEMORY[0x1E0D74038]();
}

uint64_t PLGenericImageNameForExtension()
{
  return MEMORY[0x1E0D71DF0]();
}

uint64_t PLGraphAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D71E18]();
}

uint64_t PLGridInlinePlaybackGetLog()
{
  return MEMORY[0x1E0D74088]();
}

uint64_t PLGridZeroGetLog()
{
  return MEMORY[0x1E0D74090]();
}

uint64_t PLHasHomeButton()
{
  return MEMORY[0x1E0D740A0]();
}

uint64_t PLHasInternalDiagnostics()
{
  return MEMORY[0x1E0D740A8]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x1E0D740B0]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1E0D740D8]();
}

uint64_t PLIsCPLDataclassEnabled()
{
  return MEMORY[0x1E0D71E48]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1E0D74148]();
}

uint64_t PLIsChinaSKU()
{
  return MEMORY[0x1E0D74160]();
}

uint64_t PLIsCloudPhotoLibraryEnabledForCurrentUser()
{
  return MEMORY[0x1E0D71E50]();
}

uint64_t PLIsContentPrivacyEnabled()
{
  return MEMORY[0x1E0D74170]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x1E0D741C0]();
}

uint64_t PLIsFeaturedContentAllowedGetLastDateSet()
{
  return MEMORY[0x1E0D741C8]();
}

uint64_t PLIsLockdownMode()
{
  return MEMORY[0x1E0D741E8]();
}

uint64_t PLIsMobileSlideShow()
{
  return MEMORY[0x1E0D74200]();
}

uint64_t PLIsPeopleViewService()
{
  return MEMORY[0x1E0D74220]();
}

uint64_t PLIsPhotoPicker()
{
  return MEMORY[0x1E0D74228]();
}

uint64_t PLIsPhotosAppAnyPlatform()
{
  return MEMORY[0x1E0D74240]();
}

uint64_t PLIsPhotosMessagesApp()
{
  return MEMORY[0x1E0D74248]();
}

uint64_t PLIsPhotosReliveWidget()
{
  return MEMORY[0x1E0D74250]();
}

uint64_t PLIsPreferences()
{
  return MEMORY[0x1E0D74258]();
}

uint64_t PLIsSharedAlbumsAllowed()
{
  return MEMORY[0x1E0D74278]();
}

uint64_t PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled()
{
  return MEMORY[0x1E0D74280]();
}

uint64_t PLIsSharedLibrarySuggestionsEnabled()
{
  return MEMORY[0x1E0D74288]();
}

uint64_t PLIsSpotlight()
{
  return MEMORY[0x1E0D74290]();
}

uint64_t PLIsSystemLibraryAccessProhibited()
{
  return MEMORY[0x1E0D742A8]();
}

uint64_t PLIsXcTest()
{
  return MEMORY[0x1E0D742C8]();
}

uint64_t PLLemonadeGetLog()
{
  return MEMORY[0x1E0D742E8]();
}

uint64_t PLLiveStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x1E0D71F10]();
}

uint64_t PLLocalizedCountDescription()
{
  return MEMORY[0x1E0D74328]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74330]();
}

uint64_t PLLocalizedStringForAction()
{
  return MEMORY[0x1E0D74360]();
}

uint64_t PLManagedAssetPredicateToFetchAssetsSuggestedForSharing()
{
  return MEMORY[0x1E0D71F60]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D71FB8]();
}

uint64_t PLMemoriesGetLog()
{
  return MEMORY[0x1E0D74388]();
}

uint64_t PLOneUpGetLog()
{
  return MEMORY[0x1E0D743D8]();
}

uint64_t PLParseHashtags()
{
  return MEMORY[0x1E0D72038]();
}

uint64_t PLPeopleGetLog()
{
  return MEMORY[0x1E0D74408]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x1E0D74438]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1E0D74440]();
}

uint64_t PLPhotoLibraryServicesFrameworkBundle()
{
  return MEMORY[0x1E0D74460]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1E0D74478]();
}

uint64_t PLPhotosSearchCurationGetLog()
{
  return MEMORY[0x1E0D744C0]();
}

uint64_t PLPhotosSearchGetLog()
{
  return MEMORY[0x1E0D744C8]();
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return MEMORY[0x1E0D744E0]();
}

uint64_t PLPhysicalScreenScale()
{
  return MEMORY[0x1E0D744E8]();
}

uint64_t PLPrettyPrintPList()
{
  return MEMORY[0x1E0D724A8]();
}

uint64_t PLProgressDescription()
{
  return MEMORY[0x1E0D724D0]();
}

uint64_t PLRecordLibrarySizeWithReason()
{
  return MEMORY[0x1E0D724E8]();
}

uint64_t PLRecordiCPLEnableState()
{
  return MEMORY[0x1E0D724F0]();
}

uint64_t PLRelatedAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D72500]();
}

uint64_t PLRelatedGetLog()
{
  return MEMORY[0x1E0D745D0]();
}

uint64_t PLRelativePrettyDateForDate()
{
  return MEMORY[0x1E0D745D8]();
}

uint64_t PLResourceLocalAvailabilityName()
{
  return MEMORY[0x1E0D72530]();
}

uint64_t PLResourceLocalAvailabilityTargetName()
{
  return MEMORY[0x1E0D72538]();
}

uint64_t PLResourceRemoteAvailabilityName()
{
  return MEMORY[0x1E0D72560]();
}

uint64_t PLResourceTypeName()
{
  return MEMORY[0x1E0D72568]();
}

uint64_t PLSAggregateDictionaryAddValueForScalarKey()
{
  return MEMORY[0x1E0D72578]();
}

uint64_t PLSAggregateDictionaryIncrementValueForScalarKey()
{
  return MEMORY[0x1E0D72690]();
}

uint64_t PLSAggregateDictionaryKeyForEDRHeadroomRequest()
{
  return MEMORY[0x1E0D726C0]();
}

uint64_t PLSAggregateDictionaryPushValueForDistributionKey()
{
  return MEMORY[0x1E0D729F8]();
}

uint64_t PLSAggregateDictionarySetValueForScalarKey()
{
  return MEMORY[0x1E0D72A08]();
}

uint64_t PLSearchHomeItemTypeName()
{
  return MEMORY[0x1E0D72B08]();
}

uint64_t PLSearchIndexCategoriesForCategoryMask()
{
  return MEMORY[0x1E0D72B18]();
}

uint64_t PLSearchIndexCategoryIsPerson()
{
  return MEMORY[0x1E0D72B20]();
}

uint64_t PLSearchIndexCategoryIsPet()
{
  return MEMORY[0x1E0D72B28]();
}

uint64_t PLSearchIndexCategoryMaskForCategory()
{
  return MEMORY[0x1E0D72B30]();
}

uint64_t PLSearchUIAssetCurationGetLog()
{
  return MEMORY[0x1E0D746F0]();
}

uint64_t PLSearchUIBiomeGetLog()
{
  return MEMORY[0x1E0D746F8]();
}

uint64_t PLSearchUIParsecAnalyticsGetLog()
{
  return MEMORY[0x1E0D74700]();
}

uint64_t PLSearchUIQueryGetLog()
{
  return MEMORY[0x1E0D74708]();
}

uint64_t PLSearchableIdentifierFromMessagesSyndicationID()
{
  return MEMORY[0x1E0D72DD8]();
}

uint64_t PLServicesLivePortraitLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74728]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74730]();
}

uint64_t PLServicesSharedLibraryLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74740]();
}

uint64_t PLSetFeaturedContentAllowed()
{
  return MEMORY[0x1E0D74748]();
}

uint64_t PLSetSharedLibraryAssetTrashedByParticipantsNotificationEnabled()
{
  return MEMORY[0x1E0D74750]();
}

uint64_t PLSetSharedLibrarySuggestionsEnabled()
{
  return MEMORY[0x1E0D74758]();
}

uint64_t PLSharedAlbumsGetLog()
{
  return MEMORY[0x1E0D74768]();
}

uint64_t PLSharedCountFormatter()
{
  return MEMORY[0x1E0D74770]();
}

uint64_t PLSharedLibraryGetLog()
{
  return MEMORY[0x1E0D74778]();
}

uint64_t PLSharingGetLog()
{
  return MEMORY[0x1E0D74780]();
}

uint64_t PLShouldConstructDisplayNameForAppBundle()
{
  return MEMORY[0x1E0D72E18]();
}

uint64_t PLSidebarGetLog()
{
  return MEMORY[0x1E0D74790]();
}

uint64_t PLStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x1E0D72E80]();
}

uint64_t PLStoryGetLog()
{
  return MEMORY[0x1E0D747D8]();
}

uint64_t PLStringFromPLQueryComparatorType()
{
  return MEMORY[0x1E0D747E8]();
}

uint64_t PLStringFromPLQueryConjunction()
{
  return MEMORY[0x1E0D747F0]();
}

uint64_t PLStringFromPLQueryKey()
{
  return MEMORY[0x1E0D747F8]();
}

uint64_t PLStringFromPLQueryUnit()
{
  return MEMORY[0x1E0D74800]();
}

uint64_t PLSuffixForItems()
{
  return MEMORY[0x1E0D74830]();
}

uint64_t PLSuppressionContextForMomentShareUUID()
{
  return MEMORY[0x1E0D74860]();
}

uint64_t PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs()
{
  return MEMORY[0x1E0D72E98]();
}

uint64_t PLSyndicationGetLog()
{
  return MEMORY[0x1E0D74870]();
}

uint64_t PLSyndicationUIGetLog()
{
  return MEMORY[0x1E0D74878]();
}

uint64_t PLTimelineGetLog()
{
  return MEMORY[0x1E0D748A8]();
}

uint64_t PLTipsGetLog()
{
  return MEMORY[0x1E0D748B0]();
}

uint64_t PLUIActionsGetLog()
{
  return MEMORY[0x1E0D748C0]();
}

uint64_t PLUIGetLog()
{
  return MEMORY[0x1E0D748C8]();
}

uint64_t PLUpNextGetLog()
{
  return MEMORY[0x1E0D74918]();
}

uint64_t PLUserSmartAlbumGetLog()
{
  return MEMORY[0x1E0D74930]();
}

uint64_t PLUserStatusGetLog()
{
  return MEMORY[0x1E0D74938]();
}

uint64_t PLUserStatusUIGetLog()
{
  return MEMORY[0x1E0D74940]();
}

uint64_t PLVideoPlaybackGetLog()
{
  return MEMORY[0x1E0D74968]();
}

uint64_t PLVisualIntelligenceGetLog()
{
  return MEMORY[0x1E0D74970]();
}

uint64_t PLWallpaperGetLog()
{
  return MEMORY[0x1E0D74978]();
}

uint64_t PNExternalAssetRelevanceProcessingVersionDescription()
{
  return MEMORY[0x1E0D77F40]();
}

uint64_t PTGroupIDIsValid()
{
  return MEMORY[0x1E0D7F5E0]();
}

uint64_t PUPhotosAssetViewShowDebugOverlayView()
{
  return MEMORY[0x1E0CD22D0]();
}

uint64_t PXAffineTransformDecomposeTranslationScaleRotation()
{
  return off_1E50B7D78();
}

uint64_t PXAffineTransformMakeFromRects()
{
  return off_1E50B7D80();
}

uint64_t PXAffineTransformMakeHorizontalFlip()
{
  return off_1E50B7D88();
}

uint64_t PXAffineTransformMakeRotationAroundPoint()
{
  return off_1E50B7D90();
}

uint64_t PXAffineTransformMakeScaleAndRotationAroundPoint()
{
  return off_1E50B7D98();
}

uint64_t PXAffineTransformMakeScaleFromPoint()
{
  return off_1E50B7DA0();
}

uint64_t PXAffineTransformMakeWithTranslationScaleRotation()
{
  return off_1E50B7DA8();
}

uint64_t PXAffineTransformMakeWithTranslationScaleRotationTransform()
{
  return off_1E50B7DB0();
}

uint64_t PXAffineTransformOffsetFixpoint()
{
  return off_1E50B7DB8();
}

uint64_t PXArrayByMovingObjectFromIndexToIndex()
{
  return off_1E50B7DC0();
}

uint64_t PXArrayFromFrequencySortAndDeduplicationOfNSStringSet()
{
  return off_1E50B7DC8();
}

uint64_t PXAspectRatioIsPortrait()
{
  return off_1E50B7DD0();
}

uint64_t PXAssertGetLog()
{
  return off_1E50B7DD8();
}

uint64_t PXAssetBadgeInfoCreateWithBadges()
{
  return off_1E50B7DE0();
}

uint64_t PXAssetBadgeInfoCreateWithDuration()
{
  return off_1E50B7DE8();
}

uint64_t PXAssetBadgeInfoEqualToBadgeInfo()
{
  return off_1E50B7DF0();
}

uint64_t PXAssetBadgeInfoIsActionable()
{
  return off_1E50B7DF8();
}

uint64_t PXAssetBadgeInfoIsActionableDisabled()
{
  return off_1E50B7E00();
}

uint64_t PXAssetBadgeInfoIsNull()
{
  return off_1E50B7E08();
}

uint64_t PXAssetBadgeInfoIsToggleable()
{
  return off_1E50B7E10();
}

uint64_t PXAssetBadgeInfoIsToggledOn()
{
  return off_1E50B7E18();
}

uint64_t PXAttributedStringForBadgeText()
{
  return off_1E50B7E28();
}

uint64_t PXAxisFromUICollectionViewScrollDirection()
{
  return off_1E50B7E30();
}

uint64_t PXAxisTransposed()
{
  return off_1E50B7E38();
}

uint64_t PXCGImageGetSizeWithOrientation()
{
  return off_1E50B7E40();
}

uint64_t PXCanonicalErrorForError()
{
  return off_1E50B7E48();
}

uint64_t PXCappedFontWithTextStyle()
{
  return off_1E50B7E58();
}

uint64_t PXCappedFontWithTextStyleAndWeight()
{
  return off_1E50B7E60();
}

uint64_t PXCappedFontWithTextStyleSymbolicTraits()
{
  return off_1E50B7E68();
}

uint64_t PXClamp()
{
  return off_1E50B7E70();
}

uint64_t PXContentOffsetFlippedHorizontally()
{
  return off_1E50B7E78();
}

uint64_t PXCreateCGImageFromImageSourceWithMaxPixelSize()
{
  return off_1E50B7E80();
}

uint64_t PXCreateMutableIntegerArrayRef()
{
  return off_1E50B7E88();
}

uint64_t PXDataSourceIdentifierMakeUnique()
{
  return off_1E50B7E90();
}

uint64_t PXDebugDescriptionForError()
{
  return off_1E50B7EA0();
}

uint64_t PXDegreesToRadians()
{
  return off_1E50B7EA8();
}

uint64_t PXDerivative()
{
  return off_1E50B7EB0();
}

uint64_t PXDisplayAssetCollectionCurationLengthDescription()
{
  return off_1E50B7EB8();
}

uint64_t PXDisplayAssetColorNormalizationData()
{
  return off_1E50B7EC0();
}

uint64_t PXDisplayAssetDetailedCountsDescription()
{
  return off_1E50B7EC8();
}

uint64_t PXDisplayAssetDetailedCountsSubtract()
{
  return off_1E50B7ED0();
}

uint64_t PXDisplayAssetFetchResultEmpty()
{
  return off_1E50B7EE8();
}

uint64_t PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult()
{
  return off_1E50B7EF0();
}

uint64_t PXDisplayAssetFetchResultFastEnumeration()
{
  return off_1E50B7EF8();
}

uint64_t PXDisplayAssetFetchResultFromArray()
{
  return off_1E50B7F00();
}

uint64_t PXDisplayAssetFetchResultFromAsset()
{
  return off_1E50B7F08();
}

uint64_t PXDisplayAssetFetchResultFromFetchResults()
{
  return off_1E50B7F10();
}

uint64_t PXDisplayAssetFetchResultHash()
{
  return off_1E50B7F18();
}

uint64_t PXDisplayAssetFetchResultScaledWithMultiplier()
{
  return off_1E50B7F20();
}

uint64_t PXDisplayAssetFetchResultSubfetchResultWithIndexSet()
{
  return off_1E50B7F28();
}

uint64_t PXDisplayAssetFetchResultSubfetchResultWithRange()
{
  return off_1E50B7F30();
}

uint64_t PXDisplayAssetPlaybackStyleDescription()
{
  return off_1E50B7F38();
}

uint64_t PXDistanceBetweenPoints()
{
  return off_1E50B7F50();
}

uint64_t PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets()
{
  return off_1E50B7F58();
}

uint64_t PXEdgeInsetsAdd()
{
  return off_1E50B7F60();
}

uint64_t PXEdgeInsetsAddValueForEdges()
{
  return off_1E50B7F68();
}

uint64_t PXEdgeInsetsApproximatelyEqualToEdgeInsets()
{
  return off_1E50B7F70();
}

uint64_t PXEdgeInsetsBetweenRects()
{
  return off_1E50B7F78();
}

uint64_t PXEdgeInsetsByFlippingHorizontally()
{
  return off_1E50B7F80();
}

uint64_t PXEdgeInsetsEqualToEdgeInsets()
{
  return off_1E50B7F88();
}

uint64_t PXEdgeInsetsEqualToEdgeInsetsForEdges()
{
  return off_1E50B7F90();
}

uint64_t PXEdgeInsetsForEdges()
{
  return off_1E50B7F98();
}

uint64_t PXEdgeInsetsForRectsFromEdgeInsetsForRect()
{
  return off_1E50B7FA0();
}

uint64_t PXEdgeInsetsInsetRect()
{
  return off_1E50B7FA8();
}

uint64_t PXEdgeInsetsInsetRectEdges()
{
  return off_1E50B7FB0();
}

uint64_t PXEdgeInsetsInsetSize()
{
  return off_1E50B7FB8();
}

uint64_t PXEdgeInsetsInvert()
{
  return off_1E50B7FC0();
}

uint64_t PXEdgeInsetsIsNull()
{
  return off_1E50B7FC8();
}

uint64_t PXEdgeInsetsIsZero()
{
  return off_1E50B7FD0();
}

uint64_t PXEdgeInsetsMake()
{
  return off_1E50B7FD8();
}

uint64_t PXEdgeInsetsMakeAll()
{
  return off_1E50B7FE0();
}

uint64_t PXEdgeInsetsMakeWithValueForEdges()
{
  return off_1E50B7FE8();
}

uint64_t PXEdgeInsetsMax()
{
  return off_1E50B7FF0();
}

uint64_t PXEdgeInsetsRoundToPixel()
{
  return off_1E50B8000();
}

uint64_t PXEdgeInsetsScale()
{
  return off_1E50B8008();
}

uint64_t PXEdgeInsetsWithValueForEdges()
{
  return off_1E50B8018();
}

uint64_t PXEdgesFlippedHorizontally()
{
  return off_1E50B8028();
}

uint64_t PXEdgesFlippedVertically()
{
  return off_1E50B8030();
}

uint64_t PXEdgesForAxis()
{
  return off_1E50B8038();
}

uint64_t PXEdgesFromCGRectEdge()
{
  return off_1E50B8040();
}

uint64_t PXEdgesGetCGRectEdge()
{
  return off_1E50B8048();
}

uint64_t PXEnumeratePageKeysForRect()
{
  return off_1E50B8060();
}

uint64_t PXEnumerateSubrangesMatchingTestUsingBlock()
{
  return off_1E50B8068();
}

uint64_t PXExists()
{
  return off_1E50B8078();
}

uint64_t PXFilter()
{
  return off_1E50B8080();
}

uint64_t PXFilterArrayForObjectsOfClass()
{
  return off_1E50B8088();
}

uint64_t PXFind()
{
  return off_1E50B8090();
}

uint64_t PXFirstIndexInSortedRangePassingTest()
{
  return off_1E50B8098();
}

uint64_t PXFlatMap()
{
  return off_1E50B80A0();
}

uint64_t PXFloatApproximatelyEqualToFloat()
{
  return off_1E50B80A8();
}

uint64_t PXFloatAtan()
{
  return off_1E50B80B0();
}

uint64_t PXFloatAtan2()
{
  return off_1E50B80B8();
}

uint64_t PXFloatByLinearlyInterpolatingFloats()
{
  return off_1E50B80C0();
}

uint64_t PXFloatByParabolicallyInterpolatingFloats()
{
  return off_1E50B80C8();
}

uint64_t PXFloatCeilingToPixel()
{
  return off_1E50B80D0();
}

uint64_t PXFloatCompare()
{
  return off_1E50B80D8();
}

uint64_t PXFloatCos()
{
  return off_1E50B80E0();
}

uint64_t PXFloatDenormalize()
{
  return off_1E50B80E8();
}

uint64_t PXFloatEqualToFloatWithTolerance()
{
  return off_1E50B80F0();
}

uint64_t PXFloatFloorToPixel()
{
  return off_1E50B80F8();
}

uint64_t PXFloatGreaterThanFloat()
{
  return off_1E50B8100();
}

uint64_t PXFloatHypot()
{
  return off_1E50B8108();
}

uint64_t PXFloatLog()
{
  return off_1E50B8110();
}

uint64_t PXFloatLog2()
{
  return off_1E50B8118();
}

uint64_t PXFloatNormalize()
{
  return off_1E50B8120();
}

uint64_t PXFloatPow()
{
  return off_1E50B8128();
}

uint64_t PXFloatProgressBetween()
{
  return off_1E50B8130();
}

uint64_t PXFloatRoundInDirection()
{
  return off_1E50B8138();
}

uint64_t PXFloatRoundToPixel()
{
  return off_1E50B8140();
}

uint64_t PXFloatSaturate()
{
  return off_1E50B8148();
}

uint64_t PXFloatSign()
{
  return off_1E50B8150();
}

uint64_t PXFloatSin()
{
  return off_1E50B8158();
}

uint64_t PXFloatTanh()
{
  return off_1E50B8160();
}

uint64_t PXFontCanEncodeString()
{
  return off_1E50B8168();
}

uint64_t PXFontCreate()
{
  return off_1E50B8170();
}

uint64_t PXFontScaleForTextStyle()
{
  return off_1E50B8178();
}

uint64_t PXFontWithTextStyle()
{
  return off_1E50B8180();
}

uint64_t PXFontWithTextStyleAndWeight()
{
  return off_1E50B8188();
}

uint64_t PXFontWithTextStyleSymbolicTraits()
{
  return off_1E50B8190();
}

uint64_t PXFontWithTextStyleSymbolicTraitsAndWeight()
{
  return off_1E50B8198();
}

uint64_t PXFrameRateRangeTypeGetCAFrameRateRange()
{
  return off_1E50B81A0();
}

uint64_t PXGAssertErrValidFloat()
{
  return off_1E50B81A8();
}

uint64_t PXGAssertErrValidPoint()
{
  return off_1E50B81B0();
}

uint64_t PXGAssertErrValidRect()
{
  return off_1E50B81B8();
}

uint64_t PXGAssertErrValidSize()
{
  return off_1E50B81C0();
}

uint64_t PXGBytesPerPixelForMetalPixelFormat()
{
  return off_1E50B81C8();
}

uint64_t PXGCGImageGetOpaque()
{
  return off_1E50B81D0();
}

uint64_t PXGCameraForVisibleRect()
{
  return off_1E50B81D8();
}

uint64_t PXGClearColorFromColor()
{
  return off_1E50B81E0();
}

uint64_t PXGColorOpcodeDescription()
{
  return off_1E50B81F0();
}

uint64_t PXGColorSpaceEqual()
{
  return off_1E50B8200();
}

uint64_t PXGColorSpaceNameFromCFStringRef()
{
  return off_1E50B8208();
}

uint64_t PXGColorSpaceSupportsExtendedRange()
{
  return off_1E50B8210();
}

uint64_t PXGCornerRadiusByLinearlyInterpolatingCornerRadii()
{
  return off_1E50B8220();
}

uint64_t PXGCornerRadiusDescription()
{
  return off_1E50B8228();
}

uint64_t PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect()
{
  return off_1E50B8230();
}

uint64_t PXGCornerRadiusIsNull()
{
  return off_1E50B8238();
}

uint64_t PXGCreateBurstImageStackFromImage()
{
  return off_1E50B8250();
}

uint64_t PXGCreateCGImageWithDrawBlock()
{
  return off_1E50B8258();
}

uint64_t PXGCreateMetalTextureFromBytesInCGImage()
{
  return off_1E50B8260();
}

uint64_t PXGCreateMetalTextureToRenderCIImage()
{
  return off_1E50B8268();
}

uint64_t PXGCreateMetalTexturesFromIOSurface()
{
  return off_1E50B8270();
}

uint64_t PXGCreateMetalTexturesFromPixelBuffer()
{
  return off_1E50B8278();
}

uint64_t PXGDarkPlaceholderImage()
{
  return off_1E50B8280();
}

uint64_t PXGDeviceIsKnownToHaveExtendedColorDisplay()
{
  return off_1E50B8288();
}

uint64_t PXGGetColorSpace()
{
  return off_1E50B82A0();
}

uint64_t PXGGetColorSpaceName()
{
  return off_1E50B82A8();
}

uint64_t PXGGetReconciledColorSpace()
{
  return off_1E50B82B0();
}

uint64_t PXGImageDataSpecDescription()
{
  return off_1E50B82B8();
}

uint64_t PXGLightPlaceholderImage()
{
  return off_1E50B82C0();
}

uint64_t PXGMaxTextureSize()
{
  return off_1E50B82C8();
}

uint64_t PXGMediaKindDescription()
{
  return off_1E50B82D0();
}

uint64_t PXGMediaKindGetSupportedResize()
{
  return off_1E50B82D8();
}

uint64_t PXGMetalCompatibleImageByRedrawingCGImage()
{
  return off_1E50B82E0();
}

uint64_t PXGMetalPixelFormatForCIImage()
{
  return off_1E50B82E8();
}

uint64_t PXGOffscreenMetalPixelFormatForDrawableFormat()
{
  return off_1E50B82F0();
}

uint64_t PXGPixelFormatNameToMetalFormat()
{
  return off_1E50B82F8();
}

uint64_t PXGPositionDescription()
{
  return off_1E50B8300();
}

uint64_t PXGRectForTopItemInBurstStackWithRect()
{
  return off_1E50B8310();
}

uint64_t PXGRequiresColorMatching()
{
  return off_1E50B8318();
}

uint64_t PXGResizeRect()
{
  return off_1E50B8320();
}

uint64_t PXGSectionedSpriteTagDecompose()
{
  return off_1E50B8328();
}

uint64_t PXGSectionedSpriteTagGetDataSourceIdentifierHash()
{
  return off_1E50B8330();
}

uint64_t PXGSectionedSpriteTagGetIndexPath()
{
  return off_1E50B8338();
}

uint64_t PXGSectionedSpriteTagMake()
{
  return off_1E50B8340();
}

uint64_t PXGShaderFlagsDescription()
{
  return off_1E50B8348();
}

uint64_t PXGSpriteApplyTransform()
{
  return off_1E50B8350();
}

uint64_t PXGSpriteGeometryTransformDescription()
{
  return off_1E50B8360();
}

uint64_t PXGSpriteIndexRangeIntersection()
{
  return off_1E50B8370();
}

uint64_t PXGSpriteIndexesEnumerateRangesForPositions()
{
  return off_1E50B8380();
}

uint64_t PXGSpriteInfoDescription()
{
  return off_1E50B8388();
}

uint64_t PXGSpriteInfoFlagsDescription()
{
  return off_1E50B8390();
}

uint64_t PXGSpriteStyleDescription()
{
  return off_1E50B83A8();
}

uint64_t PXGSpriteStyleUnionClippingRect()
{
  return off_1E50B83B0();
}

uint64_t PXGSpriteTextureInfoOrientationFromCGAffineTransform()
{
  return off_1E50B83C0();
}

uint64_t PXGSpriteTextureInfoOrientationFromCGOrientation()
{
  return off_1E50B83C8();
}

uint64_t PXGSpriteTextureInfoOrientationToCGAffineTransform()
{
  return off_1E50B83D0();
}

uint64_t PXGSpriteTextureInfoOrientationToCGOrientation()
{
  return off_1E50B83D8();
}

uint64_t PXGStringForOSType()
{
  return off_1E50B83E8();
}

uint64_t PXGSupportedPixelBufferFormats()
{
  return off_1E50B83F0();
}

uint64_t PXGTungstenGetLog()
{
  return off_1E50B8400();
}

uint64_t PXGUncompressedTypeForOSType()
{
  return off_1E50B8408();
}

uint64_t PXGYCbCrMatrixIsVideoRange()
{
  return off_1E50B8418();
}

uint64_t PXImageDynamicRangeIsGreaterThanStandard()
{
  return off_1E50B8428();
}

uint64_t PXImageFromCGImage()
{
  return off_1E50B8438();
}

uint64_t PXIndexPathFromSimpleIndexPath()
{
  return off_1E50B8460();
}

uint64_t PXInsetRectWithValueForEdges()
{
  return off_1E50B8468();
}

uint64_t PXIsPhotoPicker()
{
  return off_1E50B8470();
}

uint64_t PXIsSyncCallback()
{
  return off_1E50B8478();
}

uint64_t PXIterateAsynchronously()
{
  return off_1E50B8480();
}

uint64_t PXLargestSalientAspectFilledCropRect()
{
  return off_1E50B8488();
}

uint64_t PXLastIndexInSortedRangePassingTest()
{
  return off_1E50B8490();
}

uint64_t PXLocalizedVideoDuration()
{
  return off_1E50B84A0();
}

uint64_t PXMap()
{
  return off_1E50B84A8();
}

uint64_t PXMapValueFromRangeToNewRange()
{
  return off_1E50B84B0();
}

uint64_t PXMatrixMakeOrthoProjection()
{
  return off_1E50B84B8();
}

uint64_t PXMatrixMakePerspectiveProjection()
{
  return off_1E50B84C0();
}

uint64_t PXMatrixMakeScale()
{
  return off_1E50B84C8();
}

uint64_t PXMatrixMakeTranslation()
{
  return off_1E50B84D0();
}

uint64_t PXMaxRectEdgeForAxis()
{
  return off_1E50B84D8();
}

uint64_t PXMediaTypeForAssets()
{
  return off_1E50B84F0();
}

uint64_t PXMinRectEdgeForAxis()
{
  return off_1E50B84F8();
}

uint64_t PXPageAlignedRectForCGPoint()
{
  return off_1E50B8500();
}

uint64_t PXPageKeyForCGPoint()
{
  return off_1E50B8508();
}

uint64_t PXPerformWithSyncTokenOnQueue()
{
  return off_1E50B8510();
}

uint64_t PXPixelSizeAreaIsZero()
{
  return off_1E50B8518();
}

uint64_t PXPlatformImageDynamicRangeFromPXImageDynamicRange()
{
  return off_1E50B8520();
}

uint64_t PXPointAdd()
{
  return off_1E50B8528();
}

uint64_t PXPointApproximatelyEqualToPoint()
{
  return off_1E50B8530();
}

uint64_t PXPointByLinearlyInterpolatingPoints()
{
  return off_1E50B8538();
}

uint64_t PXPointCeilingToPixel()
{
  return off_1E50B8540();
}

uint64_t PXPointConvertFromCoordinateSpaceToCoordinateSpace()
{
  return off_1E50B8548();
}

uint64_t PXPointDenormalize()
{
  return off_1E50B8550();
}

uint64_t PXPointDescription()
{
  return off_1E50B8558();
}

uint64_t PXPointIsNull()
{
  return off_1E50B8560();
}

uint64_t PXPointIsValid()
{
  return off_1E50B8568();
}

uint64_t PXPointMultiplyWithFloat()
{
  return off_1E50B8570();
}

uint64_t PXPointNormalize()
{
  return off_1E50B8578();
}

uint64_t PXPointRoundToPixel()
{
  return off_1E50B8588();
}

uint64_t PXPointSetValueForAxis()
{
  return off_1E50B8590();
}

uint64_t PXPointSubtract()
{
  return off_1E50B8598();
}

uint64_t PXPointValueForAxis()
{
  return off_1E50B85A0();
}

uint64_t PXProjectValueWithDecelerationRate()
{
  return off_1E50B85A8();
}

uint64_t PXRadiansToDegrees()
{
  return off_1E50B85B0();
}

uint64_t PXRectApproximatelyEqualToRect()
{
  return off_1E50B85B8();
}

uint64_t PXRectArea()
{
  return off_1E50B85C0();
}

uint64_t PXRectByFlippingHorizontallyInRect()
{
  return off_1E50B85C8();
}

uint64_t PXRectByLinearlyInterpolatingRects()
{
  return off_1E50B85D0();
}

uint64_t PXRectClampPoint()
{
  return off_1E50B85D8();
}

uint64_t PXRectCompareForHorizontalMovementInVerticalLayout()
{
  return off_1E50B85E0();
}

uint64_t PXRectCompareForVerticalMovementInVerticalLayoutWithSourceRect()
{
  return off_1E50B85E8();
}

uint64_t PXRectContainsRectWithTolerance()
{
  return off_1E50B85F0();
}

uint64_t PXRectConvertFromCoordinateSpaceToCoordinateSpace()
{
  return off_1E50B85F8();
}

uint64_t PXRectDenormalize()
{
  return off_1E50B8600();
}

uint64_t PXRectDerivativeIntegrate()
{
  return off_1E50B8608();
}

uint64_t PXRectDescription()
{
  return off_1E50B8618();
}

uint64_t PXRectDiff()
{
  return off_1E50B8620();
}

uint64_t PXRectEdgeAxis()
{
  return off_1E50B8628();
}

uint64_t PXRectEdgeFlippedHorizontally()
{
  return off_1E50B8630();
}

uint64_t PXRectEdgeOpposite()
{
  return off_1E50B8638();
}

uint64_t PXRectEdgeValue()
{
  return off_1E50B8640();
}

uint64_t PXRectFlippedVertically()
{
  return off_1E50B8648();
}

uint64_t PXRectFunctionDerivative()
{
  return off_1E50B8650();
}

uint64_t PXRectGetCenter()
{
  return off_1E50B8658();
}

uint64_t PXRectGetLengthForAxis()
{
  return off_1E50B8660();
}

uint64_t PXRectGetMaxForAxis()
{
  return off_1E50B8668();
}

uint64_t PXRectGetMidForAxis()
{
  return off_1E50B8670();
}

uint64_t PXRectGetMinForAxis()
{
  return off_1E50B8678();
}

uint64_t PXRectIdenticalToRect()
{
  return off_1E50B8680();
}

uint64_t PXRectIntersectWithBasicRemainders()
{
  return off_1E50B8688();
}

uint64_t PXRectIsValid()
{
  return off_1E50B8690();
}

uint64_t PXRectNormalize()
{
  return off_1E50B8698();
}

uint64_t PXRectRoundToPixel()
{
  return off_1E50B86A0();
}

uint64_t PXRectScale()
{
  return off_1E50B86A8();
}

uint64_t PXRectScaleFromCenter()
{
  return off_1E50B86B0();
}

uint64_t PXRectShiftedInsideConstrainingRect()
{
  return off_1E50B86B8();
}

uint64_t PXRectShortestDistanceToPoint()
{
  return off_1E50B86C0();
}

uint64_t PXRectShrinkToPixel()
{
  return off_1E50B86C8();
}

uint64_t PXRectWithAspectRatioFillingRect()
{
  return off_1E50B86D8();
}

uint64_t PXRectWithAspectRatioFittingRect()
{
  return off_1E50B86E0();
}

uint64_t PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect()
{
  return off_1E50B86E8();
}

uint64_t PXRectWithCenterAndSize()
{
  return off_1E50B86F0();
}

uint64_t PXRectWithEdges()
{
  return off_1E50B86F8();
}

uint64_t PXRectWithMinimumSize()
{
  return off_1E50B8700();
}

uint64_t PXRectWithOriginAndSize()
{
  return off_1E50B8708();
}

uint64_t PXRectWithSize()
{
  return off_1E50B8710();
}

uint64_t PXRectWithSizeAlignedToRectEdges()
{
  return off_1E50B8718();
}

uint64_t PXRectWithSizeAlignedToRectEdgesWithPadding()
{
  return off_1E50B8720();
}

uint64_t PXReduceF()
{
  return off_1E50B8728();
}

uint64_t PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits()
{
  return off_1E50B8740();
}

uint64_t PXScaledValueForTextStyleWithSymbolicTraits()
{
  return off_1E50B8748();
}

uint64_t PXSectionedFetchResultIndexOfObject()
{
  return off_1E50B8750();
}

uint64_t PXSectionedFetchResultIndexOfObjectInRange()
{
  return off_1E50B8758();
}

uint64_t PXSimpleIndexPathCompare()
{
  return off_1E50B8760();
}

uint64_t PXSimpleIndexPathDescription()
{
  return off_1E50B8768();
}

uint64_t PXSimpleIndexPathFromIndexPath()
{
  return off_1E50B8770();
}

uint64_t PXSizeAdd()
{
  return off_1E50B8780();
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSize()
{
  return off_1E50B8788();
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance()
{
  return off_1E50B8790();
}

uint64_t PXSizeApproximatelyEqualToSize()
{
  return off_1E50B8798();
}

uint64_t PXSizeByLinearlyInterpolatingSize()
{
  return off_1E50B87A0();
}

uint64_t PXSizeCeilingToPixel()
{
  return off_1E50B87A8();
}

uint64_t PXSizeClampToSize()
{
  return off_1E50B87B0();
}

uint64_t PXSizeDescription()
{
  return off_1E50B87B8();
}

uint64_t PXSizeGetArea()
{
  return off_1E50B87C0();
}

uint64_t PXSizeGetAspectRatio()
{
  return off_1E50B87C8();
}

uint64_t PXSizeGetAspectRatioWithDefault()
{
  return off_1E50B87D0();
}

uint64_t PXSizeIsEmpty()
{
  return off_1E50B87D8();
}

uint64_t PXSizeIsNull()
{
  return off_1E50B87E0();
}

uint64_t PXSizeIsValid()
{
  return off_1E50B87E8();
}

uint64_t PXSizeLargerThanSize()
{
  return off_1E50B87F0();
}

uint64_t PXSizeMakeSquare()
{
  return off_1E50B87F8();
}

uint64_t PXSizeMax()
{
  return off_1E50B8800();
}

uint64_t PXSizeMin()
{
  return off_1E50B8808();
}

uint64_t PXSizeRound()
{
  return off_1E50B8818();
}

uint64_t PXSizeRoundToEven()
{
  return off_1E50B8820();
}

uint64_t PXSizeRoundToPixel()
{
  return off_1E50B8828();
}

uint64_t PXSizeSafeInset()
{
  return off_1E50B8830();
}

uint64_t PXSizeScale()
{
  return off_1E50B8838();
}

uint64_t PXSizeSetValueForAxis()
{
  return off_1E50B8840();
}

uint64_t PXSizeSubtract()
{
  return off_1E50B8848();
}

uint64_t PXSizeTranspose()
{
  return off_1E50B8850();
}

uint64_t PXSizeValueForAxis()
{
  return off_1E50B8858();
}

uint64_t PXSizeWithAspectRatioFillingSize()
{
  return off_1E50B8860();
}

uint64_t PXSizeWithAspectRatioFittingSize()
{
  return off_1E50B8868();
}

uint64_t PXSoftClamp()
{
  return off_1E50B8870();
}

uint64_t PXStoryAffineTransformFittingRectsIntoRect()
{
  return off_1E50B8878();
}

uint64_t PXStoryRectApplyAffineTransform()
{
  return off_1E50B8880();
}

uint64_t PXStoryRectDecompose()
{
  return off_1E50B8888();
}

uint64_t PXStoryRectDenormalize()
{
  return off_1E50B8890();
}

uint64_t PXStoryRectDescription()
{
  return off_1E50B8898();
}

uint64_t PXStoryRectEqualToRect()
{
  return off_1E50B88A0();
}

uint64_t PXStoryRectFitIntoRect()
{
  return off_1E50B88A8();
}

uint64_t PXStoryRectFitIntoUnitRect()
{
  return off_1E50B88B0();
}

uint64_t PXStoryRectFromCGRect()
{
  return off_1E50B88B8();
}

uint64_t PXStoryRectFromCGRectCenterRotation()
{
  return off_1E50B88C0();
}

uint64_t PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint()
{
  return off_1E50B88C8();
}

uint64_t PXStoryRectIsEmpty()
{
  return off_1E50B88D0();
}

uint64_t PXStoryRectIsNull()
{
  return off_1E50B88D8();
}

uint64_t PXStoryRectLinearlyInterpolatingRects()
{
  return off_1E50B88E0();
}

uint64_t PXStoryRectNormalize()
{
  return off_1E50B88E8();
}

uint64_t PXStoryRectOuterBounds()
{
  return off_1E50B88F8();
}

uint64_t PXStoryRectPath()
{
  return off_1E50B8900();
}

uint64_t PXStoryRectsFitIntoRect()
{
  return off_1E50B8910();
}

uint64_t PXSyncCallbackBegin()
{
  return off_1E50B8918();
}

uint64_t PXSyncCallbackEnd()
{
  return off_1E50B8920();
}

uint64_t PXSystemFontOfSizeAndWeight()
{
  return off_1E50B8928();
}

uint64_t PXTileGeometryApplyAffineTransform()
{
  return off_1E50B8930();
}

uint64_t PXTileGeometryDescription()
{
  return off_1E50B8938();
}

uint64_t PXTimebaseConversionFactor()
{
  return off_1E50B8950();
}

uint64_t PXUIApplicationGetFirstKeyWindow()
{
  return off_1E50B8958();
}

uint64_t PXUpdateEndUpdates()
{
  return off_1E50B8960();
}

uint64_t PXUpdateFlagsInvalidate()
{
  return off_1E50B8970();
}

uint64_t PXUpdateIsUpdateNeeded()
{
  return off_1E50B8980();
}

uint64_t PXUpdateSectionedSpriteInfoTagsForItemsInRange()
{
  return off_1E50B8988();
}

uint64_t PXUpdateShouldBeginUpdates()
{
  return off_1E50B8990();
}

uint64_t PXUserInterfaceLayoutDirectionDescription()
{
  return off_1E50B8998();
}

uint64_t PXUserInterfaceStyleFromUITraitCollection()
{
  return off_1E50B89A0();
}

uint64_t PXVelocityFlippedHorizontally()
{
  return off_1E50B89A8();
}

uint64_t RPTViewFrameInScreenSpace()
{
  return MEMORY[0x1E0D83C98]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1E0DB1018]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x1E0DB1038]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1E0DC44D8]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1E0DC4540]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1E0DC4560]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x1E0DC4568]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0DC4570]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1E0DC4980]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1E0DC49C0]();
}

uint64_t UIFontTextStyleFromPXFontTextStyle()
{
  return off_1E50B8C28();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

uint64_t UIImageConfigurationFromPXImageConfiguration()
{
  return off_1E50B8CF8();
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C50](image);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1E0DC53A0]();
}

uint64_t VKCNormalizedSubrectInRect()
{
  return MEMORY[0x1E0DC6E30]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1E0DDDAD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _MKMapRectThatFits()
{
  return MEMORY[0x1E0CC1A90]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1E0D71158]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1E0D71160]();
}

uint64_t _PXGArrayCapacityResizeToCount()
{
  return off_1E50B8F60();
}

uint64_t _PXGArrayCopyRangeToArray()
{
  return off_1E50B8F68();
}

uint64_t _PXGArrayInsertRange()
{
  return off_1E50B8F70();
}

uint64_t _PXGArrayRemoveRange()
{
  return off_1E50B8F78();
}

uint64_t _PXGArrayResize()
{
  return off_1E50B8F80();
}

uint64_t _PXGArrayZeroRange()
{
  return off_1E50B8F88();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0DC5720]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E50B9030(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E50B9038(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1E0DE3DB8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1E0DE3E58]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1E0DE3FB0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1E0DE4020]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1E0DE4050]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cbrt(long double __x)
{
  long double result;

  MEMORY[0x1E0C81850](__x);
  return result;
}

float cbrtf(float a1)
{
  float result;

  MEMORY[0x1E0C81858](a1);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1E0D74FE8]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1E0D75030]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

uint64_t px_dispatch_on_main_queue()
{
  return off_1E50B9C20();
}

uint64_t px_dispatch_on_main_queue_sync()
{
  return off_1E50B9C28();
}

uint64_t px_dispatch_on_main_queue_when_idle_after_delay()
{
  return off_1E50B9C30();
}

uint64_t px_dispatch_qos_from_nsqualityofservice()
{
  return off_1E50B9C38();
}

uint64_t px_dispatch_queue_create()
{
  return off_1E50B9C40();
}

uint64_t px_dispatch_queue_create_serial()
{
  return off_1E50B9C48();
}

uint64_t px_dispatch_queue_create_serial_with_priority()
{
  return off_1E50B9C50();
}

uint64_t px_dispatch_queue_wait()
{
  return off_1E50B9C58();
}

uint64_t px_perform_on_main_runloop()
{
  return off_1E50B9C60();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1E0DEECA0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x1E0DF1018]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1E0DF1028]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x1E0DEEEE0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

long double tanh(long double __x)
{
  long double result;

  MEMORY[0x1E0C857F8](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtection(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AppProtection.framework/AppProtection", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_AppProtection);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___APApplication(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection))
    return dlopenHelper_AppProtection(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APGuard(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection))
    return dlopenHelper_AppProtection(result);
  return result;
}

