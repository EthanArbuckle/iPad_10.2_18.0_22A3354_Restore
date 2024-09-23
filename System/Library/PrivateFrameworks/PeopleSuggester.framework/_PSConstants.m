@implementation _PSConstants

+ (id)mobileMessagesBundleId
{
  return CFSTR("com.apple.MobileSMS");
}

+ (id)macMessagesBundleId
{
  return CFSTR("com.apple.iChat");
}

+ (id)mobilePhotosBundleId
{
  return CFSTR("com.apple.mobileslideshow");
}

+ (id)mobileScreenshotsBundleId
{
  return CFSTR("com.apple.ScreenshotServicesService");
}

+ (id)mobileCameraBundleId
{
  return CFSTR("com.apple.camera");
}

+ (id)twitterBundleId
{
  return CFSTR("com.atebits.Tweetie2");
}

+ (id)whatsappBundleId
{
  return CFSTR("net.whatsapp.WhatsApp");
}

+ (id)instagramBundleId
{
  return CFSTR("com.burbn.instagram");
}

+ (id)mobileMailBundleId
{
  return CFSTR("com.apple.mobilemail");
}

+ (id)mobileMailAccountSettingsBundleId
{
  return CFSTR("com.apple.mobilemail.accountsettings");
}

+ (id)macMailBundleId
{
  return CFSTR("com.apple.mail");
}

+ (id)mobileCalendarBundleId
{
  return CFSTR("com.apple.mobilecal");
}

+ (id)macCalendarBundleId
{
  return CFSTR("com.apple.iCal");
}

+ (id)mobilePhoneBundleId
{
  return CFSTR("com.apple.InCallService");
}

+ (id)mobileFacetimeBundleId
{
  return CFSTR("com.apple.facetime");
}

+ (id)macFacetimeBundleId
{
  return CFSTR("com.apple.FaceTime");
}

+ (id)appleNewsBundleId
{
  return CFSTR("com.apple.news");
}

+ (id)notesBundleId
{
  return CFSTR("com.apple.mobilenotes");
}

+ (id)remindersBundleId
{
  return CFSTR("com.apple.reminders");
}

+ (id)journalBundleId
{
  return CFSTR("com.apple.journal");
}

+ (id)freeformBundleId
{
  return CFSTR("com.apple.freeform");
}

+ (id)booksBundleId
{
  return CFSTR("com.apple.iBooks");
}

+ (id)facetimeBundleId
{
  return +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
}

+ (id)shareSheetTargetBundleIdMessages
{
  return CFSTR("com.apple.UIKit.activity.Message");
}

+ (id)shareSheetTargetBundleIdMail
{
  return CFSTR("com.apple.UIKit.activity.Mail");
}

+ (id)mobileSafariBundleId
{
  return CFSTR("com.apple.mobilesafari");
}

+ (id)macSafariBundleId
{
  return CFSTR("com.apple.Safari");
}

+ (id)macSafariTechnologyPreviewBundleId
{
  return CFSTR("com.apple.SafariTechnologyPreview");
}

+ (id)macSafariPlatformSupportBundleId
{
  return CFSTR("com.apple.SafariPlatformSupport.Helper");
}

+ (id)mobileMessagesComposeBundleId
{
  return CFSTR("com.apple.mobilesms.compose");
}

+ (id)eligibleShareSheetTargets
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___PSConstants_eligibleShareSheetTargets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (eligibleShareSheetTargets__pasOnceToken2 != -1)
    dispatch_once(&eligibleShareSheetTargets__pasOnceToken2, block);
  return (id)eligibleShareSheetTargets__pasExprOnceResult;
}

+ (id)photoAssetPresenceHeuristicReason
{
  return CFSTR("Person in photo suggestions heuristic (asset presence)");
}

+ (id)inCallHeuristicReason
{
  return CFSTR("In-call heuristic");
}

+ (id)inCallCollaborationHeuristicReason
{
  return CFSTR("In-call collaboration heuristic");
}

+ (id)inExpanseSessionHeuristicReason
{
  return CFSTR("In-expanse session heuristic");
}

+ (id)mobileCoreDuetBundleId
{
  return CFSTR("com.apple.coreduetd");
}

+ (id)macKnowledgeAgentBundleId
{
  return CFSTR("com.apple.knowledge-agent");
}

+ (id)preferencesBundleId
{
  return CFSTR("com.apple.Preferences");
}

+ (id)passwordsAppBundleId
{
  return CFSTR("com.apple.Passwords");
}

+ (id)sharePlayBundleId
{
  id *v2;
  id v3;
  void *v4;
  __CFString *v5;
  _Unwind_Exception *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = (id *)getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr;
  v12 = getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr;
  if (!getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getTUBundleIdentifierCallServicesDaemonSymbolLoc_block_invoke;
    v8[3] = &unk_1E43FEA00;
    v8[4] = &v9;
    __getTUBundleIdentifierCallServicesDaemonSymbolLoc_block_invoke((uint64_t)v8);
    v2 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  v3 = *v2;
  v4 = v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("com.apple.telephonyutilities.callservicesd");

  return v5;
}

+ (id)mobileSharePlayPeoplePickerBundleId
{
  return CFSTR("com.apple.InCallService.RemotePeoplePicker");
}

+ (id)collaborationSuggestionBundleId
{
  return CFSTR("com.apple.InCallService.ShareExtension");
}

+ (id)macSharePlayPeoplePickerBundleId
{
  return CFSTR("com.apple.FaceTime.RemotePeoplePicker");
}

+ (id)contactsAutocompleteBundleId
{
  return CFSTR("com.apple.Contacts.Autocomplete");
}

+ (id)findMyBundleId
{
  return CFSTR("com.apple.findmy");
}

+ (id)realityLauncherBundleId
{
  return CFSTR("com.apple.RealityLauncher");
}

+ (id)peoplePickerBundleId
{
  return CFSTR("com.apple.PeoplePicker");
}

+ (id)peoplePickerTesterBundleId
{
  return CFSTR("com.apple.PeoplePickerTester");
}

+ (id)CKTesterBundleId
{
  return CFSTR("com.apple.CKTester");
}

+ (id)ensembleModel
{
  return CFSTR("ensembleModel");
}

+ (id)coreMLModel
{
  return CFSTR("coreMLModel");
}

+ (id)psDefaultsDomain
{
  return CFSTR("com.apple.PeopleSuggester.SeedSuggestions");
}

+ (id)returnToSenderReason
{
  return CFSTR("ReturnToSender");
}

+ (id)messagesBundleIds
{
  if (messagesBundleIds__pasOnceToken3 != -1)
    dispatch_once(&messagesBundleIds__pasOnceToken3, &__block_literal_global_5);
  return (id)messagesBundleIds__pasExprOnceResult;
}

+ (id)mailBundleIds
{
  if (mailBundleIds__pasOnceToken4 != -1)
    dispatch_once(&mailBundleIds__pasOnceToken4, &__block_literal_global_103);
  return (id)mailBundleIds__pasExprOnceResult;
}

+ (id)shareplayBundleIds
{
  if (shareplayBundleIds__pasOnceToken5 != -1)
    dispatch_once(&shareplayBundleIds__pasOnceToken5, &__block_literal_global_104);
  return (id)shareplayBundleIds__pasExprOnceResult;
}

+ (id)systemBundleIds
{
  if (systemBundleIds_onceToken != -1)
    dispatch_once(&systemBundleIds_onceToken, &__block_literal_global_105);
  return (id)systemBundleIds_systemBundleIds;
}

+ (id)ShareSheetDataHarvestingPluginCompletedNotificationName
{
  return CFSTR("ShareSheetDataHarvestingPluginCompletedNotificationName");
}

+ (id)suggestionPathNormal
{
  return CFSTR("Normal");
}

+ (id)suggestionPathBestEffort
{
  return CFSTR("BestEffort");
}

+ (id)suggestionPathCachedSuggestion
{
  return CFSTR("CachedSuggestion");
}

+ (id)suggestionPathXPCConnectionFailure
{
  return CFSTR("XPCConnectionFailure");
}

+ (id)suggestionPathXPCError
{
  return CFSTR("XPCError");
}

+ (id)suggestionPathPopulateCache
{
  return CFSTR("PopulateCache");
}

+ (id)peopleSuggesterShareSheetProjectName
{
  return CFSTR("PeopleSuggester_ShareSheet");
}

@end
