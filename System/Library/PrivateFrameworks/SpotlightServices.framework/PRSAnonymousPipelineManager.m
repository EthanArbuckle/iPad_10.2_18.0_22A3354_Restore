@implementation PRSAnonymousPipelineManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_12);
  return (id)sharedAnonManager;
}

void __44__PRSAnonymousPipelineManager_sharedManager__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[58];
  _QWORD v8[66];

  v8[65] = *MEMORY[0x1E0C80C00];
  v0 = (void *)sNSNotFound;
  sNSNotFound = (uint64_t)&unk_1E6E978C0;

  v1 = objc_opt_new();
  v2 = (void *)sharedAnonManager;
  sharedAnonManager = v1;

  v8[0] = CFSTR("kMDItemSpecialCondition1");
  v8[1] = CFSTR("kMDItemSpecialCondition2");
  v8[2] = CFSTR("kMDItemSpecialCondition3");
  v8[3] = CFSTR("kMDItemSpecialCondition4");
  v8[4] = CFSTR("kMDItemSpecialCondition5");
  v8[5] = CFSTR("ItemIsFlagged");
  v8[6] = CFSTR("PortraitImportantPeople");
  v8[7] = CFSTR("PhoneFavoritesInReceivers");
  v8[8] = CFSTR("PhoneFavoritesInSender");
  v8[9] = CFSTR("VIPInEmails");
  v8[10] = CFSTR("receiver_is_vip2");
  v8[11] = CFSTR("sender_is_vip2");
  v8[12] = CFSTR("kMDItemNamedLocationExactWord");
  v8[13] = CFSTR("kMDItemNamedLocationExactPrefix");
  v8[14] = CFSTR("kMDItemNamedLocationExact");
  v8[15] = CFSTR("kMDItemArtistPrefixTokenized");
  v8[16] = CFSTR("kMDItemArtistPrefixWord");
  v8[17] = CFSTR("kMDItemArtistExactWord");
  v8[18] = CFSTR("kMDItemArtistExactPrefix");
  v8[19] = CFSTR("kMDItemAuthorsPrefixTokenized");
  v8[20] = CFSTR("kMDItemRecipientsPrefixTokenized");
  v8[21] = CFSTR("kMDItemAuthorsPrefixWord");
  v8[22] = CFSTR("kMDItemRecipientsPrefixWord");
  v8[23] = CFSTR("kMDItemAuthorsExactPrefix");
  v8[24] = CFSTR("kMDItemRecipientsExactPrefix");
  v8[25] = CFSTR("kMDItemAuthorsExact");
  v8[26] = CFSTR("kMDItemRecipientsExact");
  v8[27] = CFSTR("kMDItemDisplayNamePrefixWord");
  v8[28] = CFSTR("kMDItemSubjectPrefixWord");
  v8[29] = CFSTR("kMDItemTitlePrefixWord");
  v8[30] = CFSTR("kMDItemRankingTagMatch");
  v8[31] = CFSTR("kMDItemUserIsSender");
  v8[32] = CFSTR("kMDItemContentCreationRecent");
  v8[33] = CFSTR("kMDItemEscapedWord");
  v8[34] = CFSTR("kMDItemCreationDateThisYear");
  v8[35] = CFSTR("kMDItemLastUsedDateThisYear");
  v8[36] = CFSTR("kMDItemContentCreationThisMonth");
  v8[37] = CFSTR("kMDItemLastUsedDateThisMonth");
  v8[38] = CFSTR("kMDItemContentCreationThisWeek");
  v8[39] = CFSTR("kMDItemLastUsedDateThisWeek");
  v8[40] = CFSTR("kMDItemEventTodayToNextYear");
  v8[41] = CFSTR("kMDItemEventLastMonthToToday");
  v8[42] = CFSTR("kMDItemEventTodayToNextMonth");
  v8[43] = CFSTR("kMDItemEventTodayToNextWeek");
  v8[44] = CFSTR("kMDItemEventTodayToLastWeek");
  v8[45] = CFSTR("kMDItemEventYesterdayToToday");
  v8[46] = CFSTR("kMDItemEventToday");
  v8[47] = CFSTR("kMDItemTextContentTokenizedMatch");
  v8[48] = CFSTR("kMDItemTextContentMatch");
  v8[49] = CFSTR("kMDItemAuthorsOrRecipientsTokenizedPrefixMatch");
  v8[50] = CFSTR("kMDItemDescriptionTokenizedPrefixMatch");
  v8[51] = CFSTR("kMDItemAlbumTokenizedPrefixMatch");
  v8[52] = CFSTR("kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch");
  v8[53] = CFSTR("kMDItemDescriptionPrefixWordMatch");
  v8[54] = CFSTR("kMDItemComposerPrefixWordMatch");
  v8[55] = CFSTR("kMDItemAlbumPrefixWordMatch");
  v8[56] = CFSTR("kMDItemComposerNonTokenizedPrefixMatch");
  v8[57] = CFSTR("kMDItemComposerNonTokenizedWordMatch");
  v8[58] = CFSTR("kMDItemAppSBLaunchedDateLastWeek");
  v8[59] = CFSTR("kMDItemAuthorsOrRecipientsPrefixWordMatch");
  v8[60] = CFSTR("kMDItemDescriptionExactPrefixMatch");
  v8[61] = CFSTR("kMDItemAlbumNonTokenizedPrefixMatch");
  v8[62] = CFSTR("kMDItemAuthorsOrRecipientsExactMatch");
  v8[63] = CFSTR("kMDItemDescriptionNonTokenizedWordMatch");
  v8[64] = CFSTR("kMDItemAlbumNonTokenizedWordMatch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 65);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sScoreMappingLSB;
  sScoreMappingLSB = v3;

  v7[0] = CFSTR("kMDItemUserActivity");
  v7[1] = CFSTR("kMDItemAlternateNameNonTokenizedWordMatch");
  v7[2] = CFSTR("kMDItemAlternateNamePrefixWordMatch");
  v7[3] = CFSTR("kMDItemAlternateNameExactMatch");
  v7[4] = CFSTR("kMDItemShortcutRecent");
  v7[5] = CFSTR("kMDItemDueDateInLastOneToNextTwentyFourHours");
  v7[6] = CFSTR("kMDItemDueDateInLastOneToNextOneHour");
  v7[7] = CFSTR("kMDItemDisplayNameCorrections");
  v7[8] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch");
  v7[9] = CFSTR("kMDItemContentCreationDateToday");
  v7[10] = CFSTR("kMDItemBoostedVIPFavorites");
  v7[11] = CFSTR("kMDItemBoostedVIPFavoritesRecent");
  v7[12] = CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch");
  v7[13] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch");
  v7[14] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch");
  v7[15] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch");
  v7[16] = CFSTR("PRSRankingRecency365Days");
  v7[17] = CFSTR("PRSRankingRecency270Days");
  v7[18] = CFSTR("PRSRankingRecency180Days");
  v7[19] = CFSTR("PRSRankingRecency90Days");
  v7[20] = CFSTR("PRSRankingRecency30Days");
  v7[21] = CFSTR("PRSRankingRecency15Days");
  v7[22] = CFSTR("PRSRankingRecency7Days");
  v7[23] = CFSTR("PRSRankingRecency1Days");
  v7[24] = CFSTR("kMDItemPolicyPrefixMatch_0_3");
  v7[25] = CFSTR("kMDItemPolicyPrefixMatch_1_3");
  v7[26] = CFSTR("kMDItemPolicyPrefixMatch_2_3");
  v7[27] = CFSTR("kMDItemPolicyExactWordMatch_0_3");
  v7[28] = CFSTR("kMDItemPolicyExactWordMatch_1_3");
  v7[29] = CFSTR("kMDItemPolicyExactWordMatch_2_3");
  v7[30] = CFSTR("PRSRankingMostlyExactMultiFieldsDomainTCMatch");
  v7[31] = CFSTR("PRSRankingTCNearMatch");
  v7[32] = CFSTR("PRSRankingOneTwoTermsMultiPhraseTCNearMatch");
  v7[33] = CFSTR("PRSRankingTCOrderedMatch");
  v7[34] = CFSTR("PRSRankingOneTwoTermsMultiPhraseTCOrderedMatch");
  v7[35] = CFSTR("PRSRankingTCOrderedPhraseMatch");
  v7[36] = CFSTR("PRSRankingOneTwoTermsMultiPhraseTCOrderedPhraseMatch");
  v7[37] = CFSTR("PRSRankingMostlyExactMultiFieldsTCMatch");
  v7[38] = CFSTR("PRSRankingMostlyExactMultiFieldsTCNearMatch");
  v7[39] = CFSTR("PRSRankingTCMostlyExactOrderedPhraseMatch");
  v7[40] = CFSTR("PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch");
  v7[41] = CFSTR("PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch");
  v7[42] = CFSTR("PRSRankingExactMultiFieldsTCNearMatch");
  v7[43] = CFSTR("PRSRankingTCExactNearMatch");
  v7[44] = CFSTR("PRSRankingOneTermMultiPhraseTCExactNearMatch");
  v7[45] = CFSTR("PRSRankingTwoTermsMultiPhraseTCExactNearMatch");
  v7[46] = CFSTR("PRSRankingTCExactOrderedMatch");
  v7[47] = CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedMatch");
  v7[48] = CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch");
  v7[49] = CFSTR("PRSRankingTCExactOrderedPhraseMatch");
  v7[50] = CFSTR("PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch");
  v7[51] = CFSTR("PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch");
  v7[52] = CFSTR("PRSPolicyFieldsPrefixMatch");
  v7[53] = CFSTR("PRSPolicyFieldsPhraseMatchBit");
  v7[54] = CFSTR("PRSPolicyFieldsMostlyExactPhraseMatchBit");
  v7[55] = CFSTR("exact_policy_flag_bit");
  v7[56] = CFSTR("PRSPolicyFieldsExactPhraseMatchBit");
  v7[57] = CFSTR("kMDItemShortcutWithinBagParamValue");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 58);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)sScoreMappingMSB;
  sScoreMappingMSB = v5;

}

+ (id)relativePositionKey
{
  return CFSTR("rel_pos");
}

+ (id)logURLForCurrentTimeAndBundle:(id)a3 forEngagement:(BOOL)a4
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (__CFString *)a3;
  +[PRSAnonymousPipelineManager candidateLogsURLForBundle:](PRSAnonymousPipelineManager, "candidateLogsURLForBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v4, "length");
  v7 = CFSTR("searchd");
  if (v6)
    v7 = v4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = v7;
  +[PRSAnonymousPipelineManager dateFormatter](PRSAnonymousPipelineManager, "dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("json"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)submittedLogsURLForUser:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;

  NSHomeDirectoryForUser((NSString *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/Spotlight/Diagnostics/SubmittedReports"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PRSAnonymousPipelineManager_submittedLogsURLForUser___block_invoke;
  block[3] = &unk_1E6E42FD8;
  v10 = v4;
  v5 = submittedLogsURLForUser__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&submittedLogsURLForUser__onceToken, block);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __55__PRSAnonymousPipelineManager_submittedLogsURLForUser___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);

}

+ (id)submittedLogsURL
{
  void *v2;
  void *v3;

  NSUserName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager submittedLogsURLForUser:](PRSAnonymousPipelineManager, "submittedLogsURLForUser:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)candidateLogsBasePath
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/Spotlight/Diagnostics/CandidateReports"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)candidateLogsURLForBundle:(id)a3
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (__CFString *)a3;
  +[PRSAnonymousPipelineManager candidateLogsBasePath](PRSAnonymousPipelineManager, "candidateLogsBasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v3, "length"))
    v5 = v3;
  else
    v5 = CFSTR("com.apple.searchd");
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) == 0)
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v6, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dateFormatter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

+ (id)dateFromFileURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rangeOfString:", CFSTR("com.apple.searchd.suggestions"));
  if (!v5 && (objc_msgSend(v4, "rangeOfString:", CFSTR("com.apple.searchd")), !v5)
    || (v6 = v5 + 1, v5 + 1 >= (unint64_t)objc_msgSend(v4, "length")))
  {
LABEL_6:
    objc_msgSend(v4, "rangeOfString:", CFSTR("com.apple.mobilemail"));
    if (v8)
    {
      v9 = v8 + 1;
      if (v8 + 1 < (unint64_t)objc_msgSend(v4, "length"))
      {
        objc_msgSend(v4, "substringFromIndex:", v9);
        v7 = objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_9;
        v4 = 0;
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "substringFromIndex:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v4 = 0;
    goto LABEL_6;
  }
LABEL_9:
  +[PRSAnonymousPipelineManager dateFormatter](PRSAnonymousPipelineManager, "dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v7;

LABEL_12:
  return v11;
}

+ (id)allowedBundles
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobilemail");
  v3[1] = CFSTR("com.apple.searchd");
  v3[2] = CFSTR("com.apple.searchd.suggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_dataCollectionAllowedForBundle:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[PRSAnonymousPipelineManager allowedBundles](PRSAnonymousPipelineManager, "allowedBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)engagementCountKeyForBundle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("engagementCount-%@"), a3);
}

+ (id)engagementDateKeyForBundle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("engagementDate-%@"), a3);
}

+ (id)engagementCountForDateKeyForBundle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("engagementCountForDate-%@"), a3);
}

- (PRSAnonymousPipelineManager)init
{
  PRSAnonymousPipelineManager *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRSAnonymousPipelineManager;
  v2 = -[PRSAnonymousPipelineManager init](&v7, sel_init);
  if (v2)
  {
    -[PRSAnonymousPipelineManager setSubmissionEnabled:](v2, "setSubmissionEnabled:", DiagnosticLogSubmissionEnabled());
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    -[PRSAnonymousPipelineManager setUserDefaults:](v2, "setUserDefaults:", v3);

    -[PRSAnonymousPipelineManager setIsInternalDevice:](v2, "setIsInternalDevice:", os_variant_has_internal_diagnostics());
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.spotlight.dataCollection", v4);
    -[PRSAnonymousPipelineManager setQueue:](v2, "setQueue:", v5);

    -[PRSAnonymousPipelineManager registerXPCActivity](v2, "registerXPCActivity");
  }
  return v2;
}

- (void)sendMLFeedbackActivity:(id)a3 clientID:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (-[PRSAnonymousPipelineManager submissionEnabled](self, "submissionEnabled"))
  {
    if (v6)
      dispatch_group_enter(v6);
    -[PRSAnonymousPipelineManager queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PRSAnonymousPipelineManager_sendMLFeedbackActivity_clientID___block_invoke;
    block[3] = &unk_1E6E43000;
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

void __63__PRSAnonymousPipelineManager_sendMLFeedbackActivity_clientID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const std::__fs::filesystem::path *v25;
  void *v26;
  void *v27;
  id v28;
  const std::__fs::filesystem::path *v29;
  std::error_code *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  +[PRSAnonymousPipelineManager candidateLogsBasePath](PRSAnonymousPipelineManager, "candidateLogsBasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = *MEMORY[0x1E0C9B5A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v32 = v2;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v6, 0, &v42);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v42;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    v13 = 0x1E0C99000uLL;
    v34 = v9;
    v35 = a1;
    v33 = *(_QWORD *)v39;
    do
    {
      v14 = 0;
      v15 = v8;
      v36 = v11;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "retrieveFeedbackURLToSendInDirectory:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_alloc(*(Class *)(v13 + 3408));
          v37 = v15;
          v18 = (void *)objc_msgSend(v17, "initWithContentsOfURL:options:error:", v16, 8, &v37);
          v8 = v37;

          if (v8)
          {
            PRSLogCategoryAnonymousPipeline();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (uint64_t)v8;
              _os_log_error_impl(&dword_1B86C5000, v19, OS_LOG_TYPE_ERROR, "Error reading file for submission %@", buf, 0xCu);
            }
          }
          else
          {
            v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C318]), "initWithType:data:", 3, v18);
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sendCustomFeedback:clientID:", v19, *(_QWORD *)(a1 + 40));

            PRSLogCategoryAnonymousPipeline();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = objc_msgSend(v18, "length");
              *(_DWORD *)buf = 134217984;
              v44 = v22;
              _os_log_impl(&dword_1B86C5000, v21, OS_LOG_TYPE_DEFAULT, "Sending custom feedback len %lu", buf, 0xCu);
            }

            objc_msgSend(v16, "lastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "path");
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v25 = (const std::__fs::filesystem::path *)objc_msgSend(v24, "UTF8String");

            +[PRSAnonymousPipelineManager submittedLogsURL](PRSAnonymousPipelineManager, "submittedLogsURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "URLByAppendingPathComponent:", v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "path");
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v29 = (const std::__fs::filesystem::path *)objc_msgSend(v28, "UTF8String");

            if (v25 && v29)
              rename(v25, v29, v30);

            v9 = v34;
            a1 = v35;
            v11 = v36;
            v8 = 0;
            v12 = v33;
            v13 = 0x1E0C99000;
          }

          v15 = v8;
        }
        else
        {
          v8 = v15;
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "cleanUp");
  v31 = *(NSObject **)(a1 + 48);
  if (v31)
    dispatch_group_leave(v31);

}

- (void)registerXPCActivity
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  PRSLogCategoryAnonymousPipeline();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "com.apple.searchd.sendmlfeedback";
    _os_log_impl(&dword_1B86C5000, v2, OS_LOG_TYPE_DEFAULT, "Registering XPC activity:%s", buf, 0xCu);
  }

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke;
  v3[3] = &unk_1E6E43CF0;
  objc_copyWeak(&v4, &location);
  xpc_activity_register("com.apple.searchd.sendmlfeedback", (xpc_object_t)*MEMORY[0x1E0C80748], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  NSObject *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  xpc_activity_state_t v10;
  _QWORD block[4];
  _xpc_activity_s *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  xpc_activity_state_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCB3708]();
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      PRSLogCategoryAnonymousPipeline();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "com.apple.searchd.sendmlfeedback";
        _os_log_impl(&dword_1B86C5000, v7, OS_LOG_TYPE_INFO, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      v8 = dispatch_group_create();
      -[NSObject sendMLFeedbackActivity:clientID:](WeakRetained, "sendMLFeedbackActivity:clientID:", v8, 0);
      dispatch_get_global_queue(9, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke_140;
      block[3] = &unk_1E6E42FD8;
      v12 = v3;
      dispatch_group_notify(v8, v9, block);

    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
LABEL_12:

    goto LABEL_13;
  }
  v10 = state;
  if (xpc_activity_should_defer(v3) && xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3))
  {
    PRSLogCategoryAnonymousPipeline();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "com.apple.searchd.sendmlfeedback";
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1B86C5000, WeakRetained, OS_LOG_TYPE_INFO, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_autoreleasePoolPop(v4);

}

void __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke_140(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  PRSLogCategoryAnonymousPipeline();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.sendmlfeedback";
    _os_log_impl(&dword_1B86C5000, v1, OS_LOG_TYPE_INFO, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

- (id)_abandonedItemsFromItems:(id)a3 withIndexOfEngagedItem:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (a4)
  {
    v7 = a4 - 48;
    if (a4 > 0x30)
    {
      if (a4 == 49)
        goto LABEL_28;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v25);

      v8 = v5;
      v9 = v7;
      v10 = 48;
    }
    else
    {
      v8 = v5;
      v9 = 0;
      v10 = a4;
    }
LABEL_24:
    objc_msgSend(v8, "subarrayWithRange:", v9, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v26);

    goto LABEL_28;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 0x33)
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
      goto LABEL_28;
    v10 = objc_msgSend(v5, "count") - 1;
    v8 = v5;
    v9 = 1;
    goto LABEL_24;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataCollectionBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = v5;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v15)
    goto LABEL_18;
  v16 = v15;
  v17 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v19, "dataCollectionBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v20, "isEqualToString:", v12))
      {

LABEL_14:
        v23 = objc_msgSend(v6, "count");
        v22 = v6;
        if (v23 > 0x31)
          continue;
        goto LABEL_15;
      }
      v21 = objc_msgSend(v13, "count");

      v22 = v13;
      if (v21 >= 0x32)
        goto LABEL_14;
LABEL_15:
      objc_msgSend(v22, "addObject:", v19);
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v16);
LABEL_18:

  v24 = objc_msgSend(v6, "count");
  if ((unint64_t)(objc_msgSend(v13, "count") + v24) > 0x32)
  {
    v27 = 50 - objc_msgSend(v13, "count");
    v28 = objc_msgSend(v6, "count") - v27;
    objc_msgSend(v13, "subarrayWithRange:", 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceObjectsInRange:withObjectsFromArray:", v27, v28, v29);

    if (objc_msgSend(v13, "count") > v28)
    {
      objc_msgSend(v13, "subarrayWithRange:", v28, objc_msgSend(v13, "count") - v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v30);

    }
  }
  else
  {
    objc_msgSend(v6, "addObjectsFromArray:", v13);
  }

  v5 = v32;
LABEL_28:

  return v6;
}

- (id)_relativePositionForItem:(id)a3 inItems:(id)a4 withIndexOfEngagedItem:(int64_t)a5 forClientBundle:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v9 = a4;
  v10 = a6;
  v11 = objc_msgSend(v9, "indexOfObject:", a3);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (id)sNSNotFound;
  }
  else
  {
    v13 = v11;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.searchd.suggestions")) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      if (v13 >= a5)
        v15 = a5;
      else
        v15 = v13;
      if (v13 <= a5)
        v16 = a5;
      else
        v16 = v13;
      if (v15 >= v16)
      {
        v17 = 0;
      }
      else
      {
        v17 = 0;
        do
        {
          objc_msgSend(v9, "objectAtIndex:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 += ((unint64_t)objc_msgSend(v18, "bundleIDType") >> 19) & 1;

          ++v15;
        }
        while (v16 != v15);
      }
      if (v13 < a5)
        v14 = v17;
      else
        v14 = -v17;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 - a5 + v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;

  return v19;
}

- (void)_addRelativePositionToFeatureDict:(id)a3 relativePosition:(id)a4 forItem:(id)a5 debugInfoEnabled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "relativePositionKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v11);

  if (v6)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("identifier"));

  }
}

- (void)_addQueryInfoToJSONWriter:(json_writer *)a3 withQuery:(id)a4 cepData:(id)a5 forClient:(id)a6 debugInfoAllowed:(BOOL)a7 keyboardPrimaryLanguage:(id)a8
{
  _BOOL4 v8;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  char *v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  char *v27;
  id v28;
  uint64_t v29;
  char *v30;
  uint8_t v31[16];

  v8 = a7;
  v11 = a4;
  PRSLogCategoryAnonymousPipeline();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEFAULT, "[Logging] Writing query info to json writer.", v31, 2u);
  }

  if (v8)
  {
    json_writer_add_key((uint64_t)a3, "query", 5uLL, 1);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "countryCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  json_writer_add_key((uint64_t)a3, "country_code", 0xCuLL, 1);
  v16 = objc_retainAutorelease(v14);
  v17 = objc_msgSend(v16, "UTF8String");
  if (v17)
    v18 = (char *)v17;
  else
    v18 = "";
  json_writer_add_string((uint64_t)a3, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "language_code", 0xDuLL, 1);
  v19 = objc_retainAutorelease(v15);
  v20 = objc_msgSend(v19, "UTF8String");
  if (v20)
    v21 = (char *)v20;
  else
    v21 = "";
  json_writer_add_string((uint64_t)a3, v21, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "is_internal", 0xBuLL, 1);
  if (-[PRSAnonymousPipelineManager isInternalDevice](self, "isInternalDevice"))
    v22 = "1";
  else
    v22 = "0";
  json_writer_add_raw_value((uint64_t)a3, v22, 1uLL);
  v23 = (void *)MGCopyAnswer();
  v24 = (void *)MGCopyAnswer();
  json_writer_add_key((uint64_t)a3, "device_type", 0xBuLL, 1);
  v25 = objc_retainAutorelease(v23);
  v26 = objc_msgSend(v25, "UTF8String");
  if (v26)
    v27 = (char *)v26;
  else
    v27 = "";
  json_writer_add_string((uint64_t)a3, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "device_build_number", 0x13uLL, 1);
  v28 = objc_retainAutorelease(v24);
  v29 = objc_msgSend(v28, "UTF8String");
  if (v29)
    v30 = (char *)v29;
  else
    v30 = "";
  json_writer_add_string((uint64_t)a3, v30, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_increaseUserDefaultsEngagementCountForBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PRSAnonymousPipelineManager userDefaults](self, "userDefaults");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager engagementCountKeyForBundle:](PRSAnonymousPipelineManager, "engagementCountKeyForBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_1E6E978D8;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v5);

}

- (void)_updateUserDefaultsWithEngagedBundle:(id)a3 andQueryID:(id)a4 forClientBundle:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.searchd")))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("collectedBundleID"));
    if (objc_msgSend(v7, "integerValue") != -1)
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("lastQueryID"));

  }
}

- (void)_increaseUserDefaultsEngagementCountForDateWithClientBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PRSAnonymousPipelineManager userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager engagementCountForDateKeyForBundle:](PRSAnonymousPipelineManager, "engagementCountForDateKeyForBundle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager engagementDateKeyForBundle:](PRSAnonymousPipelineManager, "engagementDateKeyForBundle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager dateFormatter](PRSAnonymousPipelineManager, "dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "isEqualToString:", v12))
    v13 = objc_msgSend(v8, "integerValue") + 1;
  else
    v13 = 1;
  objc_msgSend(v5, "setObject:forKey:", v12, v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, v6);

  PRSLogCategoryAnonymousPipeline();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = 134218754;
    v17 = objc_msgSend(v8, "integerValue");
    v18 = 2112;
    v19 = v9;
    v20 = 2048;
    v21 = v13;
    v22 = 2112;
    v23 = v12;
    _os_log_debug_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEBUG, "[Sampling] Previous count:%lu previous date:%@ new count:%lu new date:%@", (uint8_t *)&v16, 0x2Au);
  }

}

- (BOOL)_shouldDataCollectForEngagementReservoirSamplingForClientBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint32_t v10;
  BOOL v11;
  NSObject *v12;
  _BOOL4 v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.searchd")))
  {
    -[PRSAnonymousPipelineManager userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRSAnonymousPipelineManager engagementCountForDateKeyForBundle:](PRSAnonymousPipelineManager, "engagementCountForDateKeyForBundle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRSAnonymousPipelineManager engagementDateKeyForBundle:](PRSAnonymousPipelineManager, "engagementDateKeyForBundle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "integerValue") < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = arc4random_uniform(objc_msgSend(v8, "integerValue"));
      v11 = v10 == 0;
      PRSLogCategoryAnonymousPipeline();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v13)
        {
          v15 = 134218498;
          v16 = objc_msgSend(v8, "integerValue");
          v17 = 2048;
          v18 = v10;
          v19 = 2112;
          v20 = v9;
          _os_log_debug_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEBUG, "[Sampling] Skipping this sample. Engagement count:%lu random num:%lu date:%@", (uint8_t *)&v15, 0x20u);
        }
      }
      else if (v13)
      {
        -[PRSAnonymousPipelineManager _shouldDataCollectForEngagementReservoirSamplingForClientBundle:].cold.1(v8, (uint64_t)v9, v12);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldDataCollectWithEngagedBundle:(id)a3 withQueryId:(id)a4 forClientBundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  char v23;
  char v24;
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.searchd")))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    +[PRSAnonymousPipelineManager engagementCountKeyForBundle:](PRSAnonymousPipelineManager, "engagementCountKeyForBundle:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("lastQueryID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "integerValue") == -1
      || (v14 = objc_msgSend(v13, "unsignedLongLongValue"), v14 != objc_msgSend(v8, "unsignedLongLongValue")))
    {
      v26 = v12;
      v16 = objc_msgSend(v12, "integerValue");
      objc_msgSend(v10, "objectForKey:", CFSTR("collectedBundleID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSBagHandler sharedHandler](PRSBagHandler, "sharedHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anonymousMetadataUndesiredBundleIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      v21 = objc_msgSend(v20, "containsObject:", v17);
      v22 = objc_msgSend(v20, "containsObject:", v7);
      v23 = v22;
      if (!v21 || !v22)
        goto LABEL_12;
      if (v16 <= 2)
        v16 = 2;
      if (arc4random() % (unint64_t)v16)
      {
        v15 = 0;
      }
      else
      {
LABEL_12:
        if (v17)
          v24 = v21;
        else
          v24 = 1;
        v15 = v24 | v23 ^ 1;
      }

      v12 = v26;
    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 queryID:(id)a8 withCEPData:(id)a9 forClientBundle:(id)a10 debugInfoEnabled:(BOOL)a11 keyboardPrimaryLanguage:(id)a12 clientID:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  BOOL v46;
  BOOL v47;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a12;
  v24 = a13;
  -[PRSAnonymousPipelineManager queue](self, "queue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke;
  block[3] = &unk_1E6E43D18;
  block[4] = self;
  v37 = v22;
  v46 = a7;
  v38 = v17;
  v39 = v19;
  v40 = v18;
  v41 = v21;
  v47 = a11;
  v42 = v23;
  v43 = v20;
  v44 = v24;
  v45 = a3;
  v35 = v24;
  v26 = v20;
  v27 = v23;
  v28 = v21;
  v29 = v18;
  v30 = v19;
  v31 = v17;
  v32 = v22;
  dispatch_async(v25, block);

}

void __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_increaseUserDefaultsEngagementCountForBundle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_increaseUserDefaultsEngagementCountForDateWithClientBundle:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 112)
    && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.searchd.suggestions")) & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 104);
    if (v2 >= objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      PRSLogCategoryAnonymousPipeline();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(a1 + 104, v5, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "_shouldDataCollectForEngagementReservoirSamplingForClientBundle:", *(_QWORD *)(a1 + 40)))return;
      PRSLogCategoryAnonymousPipeline();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = objc_msgSend(*(id *)(a1 + 48), "count");
        *(_DWORD *)buf = 134217984;
        v15 = v4;
        _os_log_impl(&dword_1B86C5000, v3, OS_LOG_TYPE_DEFAULT, "[Logging] Extracting dataCollection for %lu items", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 104));
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject dataCollectionBundle](v5, "dataCollectionBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = *(_BYTE *)(a1 + 113);
      objc_msgSend(*(id *)(a1 + 32), "_extractTrainingSamplesForQuery:withIndexOfEngagedItem:withItems:withRanker:withCEPData:forClientBundle:debugInfoEnabled:keyboardPrimaryLanguage:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v13, *(_QWORD *)(a1 + 80));
      objc_msgSend(*(id *)(a1 + 32), "_updateUserDefaultsWithEngagedBundle:andQueryID:forClientBundle:", v6, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
      if (objc_msgSend(*(id *)(a1 + 32), "isInternalDevice"))
        objc_msgSend(*(id *)(a1 + 32), "sendMLFeedbackActivity:clientID:", 0, *(_QWORD *)(a1 + 96));

    }
  }
}

- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 forClientBundle:(id)a8 keyboardPrimaryLanguage:(id)a9 clientID:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  -[PRSAnonymousPipelineManager extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:queryID:withCEPData:forClientBundle:debugInfoEnabled:keyboardPrimaryLanguage:clientID:](self, "extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:queryID:withCEPData:forClientBundle:debugInfoEnabled:keyboardPrimaryLanguage:clientID:", a3, a4, a5, a6, a7, &unk_1E6E978F0, 0, a8, v10, a9, a10);
}

- (void)_writeResult:(json_writer *)a3 item:(id)a4
{
  id v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  id v14;
  char *v15;
  size_t v16;
  void *v17;
  float v18;
  char *v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  unint64_t v26;
  id v27;
  char *v28;
  size_t v29;
  void *v30;
  float v31;
  void *v32;
  char *v33;
  char *v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  unint64_t v40;
  id v41;
  char *v42;
  size_t v43;
  void *v44;
  float v45;
  char *v46;
  char *v47;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  unint64_t v53;
  id v54;
  char *v55;
  size_t v56;
  void *v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id object;

  object = a4;
  json_writer_add_key((uint64_t)a3, "_identifier", 0xBuLL, 1);
  objc_msgSend(object, "identifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v5, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 0);

  v6 = PRSModelManagerAssociatedObjectKeyForType(1);
  v7 = PRSModelManagerAssociatedObjectKeyForType(2);
  v8 = PRSModelManagerAssociatedObjectKeyForType(3);
  objc_getAssociatedObject(object, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(object, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(object, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  json_writer_add_key((uint64_t)a3, "_l2_score", 9uLL, 1);
  v66 = v11;
  objc_msgSend(v11, "doubleValue");
  json_writer_add_double(a3, v12);
  json_writer_add_key((uint64_t)a3, "_l2_inputs", 0xAuLL, 1);
  json_writer_begin_dictionary((uint64_t)a3);
  if (objc_msgSend(v10, "unsignedIntegerValue"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (char *)objc_msgSend(v14, "UTF8String");

      v16 = strlen(v15);
      json_writer_add_key((uint64_t)a3, v15, v16, 1);
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      json_writer_add_double(a3, v18);

      ++v13;
    }
    while (v13 < objc_msgSend(v10, "unsignedIntegerValue"));
  }
  json_writer_end_dictionary((uint64_t)a3);
  v19 = PRSModelManagerAssociatedObjectKeyForType(4);
  v20 = PRSModelManagerAssociatedObjectKeyForType(5);
  v21 = PRSModelManagerAssociatedObjectKeyForType(6);
  objc_getAssociatedObject(object, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(object, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(object, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  json_writer_add_key((uint64_t)a3, "_l2e_score", 0xAuLL, 1);
  v65 = v24;
  objc_msgSend(v24, "doubleValue");
  json_writer_add_double(a3, v25);
  json_writer_add_key((uint64_t)a3, "_l2e_inputs", 0xBuLL, 1);
  json_writer_begin_dictionary((uint64_t)a3);
  if (objc_msgSend(v23, "unsignedIntegerValue"))
  {
    v26 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v26);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (char *)objc_msgSend(v27, "UTF8String");

      v29 = strlen(v28);
      json_writer_add_key((uint64_t)a3, v28, v29, 1);
      objc_msgSend(v22, "objectAtIndexedSubscript:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      json_writer_add_double(a3, v31);

      ++v26;
    }
    while (v26 < objc_msgSend(v23, "unsignedIntegerValue"));
  }
  json_writer_end_dictionary((uint64_t)a3);
  objc_msgSend(object, "sectionBundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v62 = v32;
    v63 = v10;
    v64 = v9;
    v33 = PRSModelManagerAssociatedObjectKeyForType(7);
    v34 = PRSModelManagerAssociatedObjectKeyForType(8);
    v35 = PRSModelManagerAssociatedObjectKeyForType(9);
    objc_getAssociatedObject(object, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(object, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(object, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2_score", 0x17uLL, 1);
    v59 = v38;
    objc_msgSend(v38, "doubleValue");
    json_writer_add_double(a3, v39);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2_inputs", 0x18uLL, 1);
    json_writer_begin_dictionary((uint64_t)a3);
    if (objc_msgSend(v37, "unsignedIntegerValue"))
    {
      v40 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v40);
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = (char *)objc_msgSend(v41, "UTF8String");

        v43 = strlen(v42);
        json_writer_add_key((uint64_t)a3, v42, v43, 1);
        objc_msgSend(v36, "objectAtIndexedSubscript:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "floatValue");
        json_writer_add_double(a3, v45);

        ++v40;
      }
      while (v40 < objc_msgSend(v37, "unsignedIntegerValue"));
    }
    v60 = v37;
    v61 = v36;
    json_writer_end_dictionary((uint64_t)a3);
    v46 = PRSModelManagerAssociatedObjectKeyForType(10);
    v47 = PRSModelManagerAssociatedObjectKeyForType(11);
    v48 = PRSModelManagerAssociatedObjectKeyForType(12);
    objc_getAssociatedObject(object, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(object, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(object, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2e_score", 0x18uLL, 1);
    objc_msgSend(v51, "doubleValue");
    json_writer_add_double(a3, v52);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2e_inputs", 0x19uLL, 1);
    json_writer_begin_dictionary((uint64_t)a3);
    if (objc_msgSend(v50, "unsignedIntegerValue"))
    {
      v53 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v53);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v55 = (char *)objc_msgSend(v54, "UTF8String");

        v56 = strlen(v55);
        json_writer_add_key((uint64_t)a3, v55, v56, 1);
        objc_msgSend(v49, "objectAtIndexedSubscript:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "floatValue");
        json_writer_add_double(a3, v58);

        ++v53;
      }
      while (v53 < objc_msgSend(v50, "unsignedIntegerValue"));
    }
    json_writer_end_dictionary((uint64_t)a3);

    v10 = v63;
    v9 = v64;
    v32 = v62;
  }

}

- (void)_extractTrainingSamplesForQuery:(id)a3 withIndexOfEngagedItem:(unint64_t)a4 withItems:(id)a5 withRanker:(id)a6 withCEPData:(id)a7 forClientBundle:(id)a8 debugInfoEnabled:(BOOL)a9 keyboardPrimaryLanguage:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  PRSAnonymousPipelineManager *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  BOOL v38;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  PRSRankingSDEnabledFlagState();
  -[PRSAnonymousPipelineManager queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke;
  block[3] = &unk_1E6E43D40;
  v30 = v17;
  v31 = self;
  v32 = v20;
  v33 = v18;
  v34 = v16;
  v35 = v19;
  v38 = a9;
  v36 = v21;
  v37 = a4;
  v23 = v21;
  v24 = v19;
  v25 = v16;
  v26 = v18;
  v27 = v20;
  v28 = v17;
  dispatch_async(v22, block);

}

void __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int *v21;
  int *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  id v40;
  void *v41;
  void *v42;
  int err;
  id v44;
  int v45;
  int v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const std::__fs::filesystem::path *v54;
  const std::__fs::filesystem::path *v55;
  std::error_code *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 88;
  v1 = *(_QWORD *)(a1 + 88);
  if (v1 == 0x7FFFFFFFFFFFFFFFLL || v1 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    PRSLogCategoryAnonymousPipeline();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(v2, v5, v48, v49, v50, v51, v52, v53);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_abandonedItemsFromItems:withIndexOfEngagedItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");

    if ((unint64_t)-[NSObject count](v5, "count") >= 0x10)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        -[NSObject exchangeObjectAtIndex:withObjectAtIndex:](v5, "exchangeObjectAtIndex:withObjectAtIndex:", v7, v7 + arc4random_uniform(-[NSObject count](v5, "count") + v6));
        ++v7;
        --v6;
      }
      while (v6 != -15);
    }
    v8 = -[NSObject count](v5, "count");
    if (v8 >= 0xF)
      v9 = 15;
    else
      v9 = v8;
    -[NSObject subarrayWithRange:](v5, "subarrayWithRange:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v11 + 1;
    v13 = 14 - v11;
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v13 >= v14 - v12)
      v15 = v14 - v12;
    else
      v15 = v13;
    v16 = (void *)objc_opt_new();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v12, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v17);

    }
    objc_msgSend((id)objc_opt_class(), "logURLForCurrentTimeAndBundle:forEngagement:", *(_QWORD *)(a1 + 48), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", CFSTR(".tmp"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (int *)json_writer_create_with_path((const char *)objc_msgSend(v20, "UTF8String"), 0x10000);
    if (v21)
    {
      v22 = v21;
      v60 = v18;
      json_writer_begin_dictionary((uint64_t)v21);
      v23 = *(void **)(a1 + 56);
      if (v23)
        objc_msgSend(v23, "serializeAnonymousQueryLogFeaturesToJSONWithWriter:", v22);
      v58 = v20;
      v59 = v19;
      objc_msgSend(*(id *)(a1 + 40), "_addQueryInfoToJSONWriter:withQuery:cepData:forClient:debugInfoAllowed:keyboardPrimaryLanguage:", v22, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 80));
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 88));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      json_writer_add_key((uint64_t)v22, "ENGAGED_RESULT", 0xEuLL, 1);
      json_writer_begin_dictionary((uint64_t)v22);
      +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline](PRSL2FeatureVector, "allowedAttributeSetForAnonPipeline");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v24;
      objc_msgSend(v24, "serializeAnonymousLogFeaturesToJSONWithWriter:allowedAttributeSet:", v22, v25);

      json_writer_add_key((uint64_t)v22, "item_pos", 8uLL, 1);
      json_writer_add_uint64((uint64_t)v22, *(_QWORD *)(a1 + 88));
      if (*(_BYTE *)(a1 + 96))
      {
        json_writer_add_key((uint64_t)v22, "identifier", 0xAuLL, 1);
        json_writer_add_string((uint64_t)v22, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      json_writer_end_dictionary((uint64_t)v22);
      json_writer_add_key((uint64_t)v22, "ABANDONED_RESULTS", 0x11uLL, 1);
      json_writer_begin_array((uint64_t)v22);
      v26 = objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("com.apple.searchd.suggestions"));
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v61 = v10;
      v27 = v10;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v67 != v30)
              objc_enumerationMutation(v27);
            v32 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * i);
            v33 = v32;
            if ((v26 & 1) != 0 || (objc_msgSend(v32, "bundleIDType") & 0x80000) == 0)
            {
              json_writer_begin_dictionary((uint64_t)v22);
              +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline](PRSL2FeatureVector, "allowedAttributeSetForAnonPipeline");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "serializeAnonymousLogFeaturesToJSONWithWriter:allowedAttributeSet:", v22, v34);

              json_writer_end_dictionary((uint64_t)v22);
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        }
        while (v29);
      }

      json_writer_end_array((uint64_t)v22);
      json_writer_add_key((uint64_t)v22, "OTHER_RESULTS", 0xDuLL, 1);
      json_writer_begin_array((uint64_t)v22);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v35 = v16;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v63 != v38)
              objc_enumerationMutation(v35);
            v40 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * j);
            v41 = v40;
            if ((v26 & 1) != 0 || (objc_msgSend(v40, "bundleIDType") & 0x80000) == 0)
            {
              json_writer_begin_dictionary((uint64_t)v22);
              +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline](PRSL2FeatureVector, "allowedAttributeSetForAnonPipeline");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "serializeAnonymousLogFeaturesToJSONWithWriter:allowedAttributeSet:", v22, v42);

              json_writer_end_dictionary((uint64_t)v22);
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v37);
      }

      json_writer_end_array((uint64_t)v22);
      json_writer_end_dictionary((uint64_t)v22);
      json_writer_flush((ssize_t)v22);
      err = json_writer_get_err((uint64_t)v22);
      json_writer_dispose(v22);
      v20 = v58;
      v44 = objc_retainAutorelease(v58);
      objc_msgSend(v44, "UTF8String");
      v45 = compress_file_in_place();
      if (err | v45)
      {
        v46 = v45;
        PRSLogCategoryAnonymousPipeline();
        v47 = objc_claimAutoreleasedReturnValue();
        v19 = v59;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke_cold_2(err, v46, v47);

        unlink((const char *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
        v10 = v61;
      }
      else
      {
        v54 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
        v19 = v59;
        v55 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
        rename(v54, v55, v56);
        v10 = v61;
      }

      v18 = v60;
    }

  }
}

- (BOOL)dateIsExpired:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -604800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

- (void)deleteCandidateLogs
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager candidateLogsBasePath](PRSAnonymousPipelineManager, "candidateLogsBasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

- (void)deleteExpiredSubmittedLogs
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager submittedLogsURL](PRSAnonymousPipelineManager, "submittedLogsURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v24[0] = *MEMORY[0x1E0C9B5A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v16 = (void *)v4;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v5, 0, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[PRSAnonymousPipelineManager dateFromFileURL:](PRSAnonymousPipelineManager, "dateFromFileURL:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PRSAnonymousPipelineManager dateIsExpired:](self, "dateIsExpired:", v14))
        {
          v17 = v7;
          objc_msgSend(v3, "removeItemAtURL:error:", v13, &v17);
          v15 = v17;

          v7 = v15;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

}

- (id)retrieveFeedbackURLToSendInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = *MEMORY[0x1E0C9B5A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 0, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;

  if (v7)
  {
    PRSLogCategoryAnonymousPipeline();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRSAnonymousPipelineManager retrieveFeedbackURLToSendInDirectory:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_4;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v16)
  {
LABEL_4:
    v15 = 0;
    goto LABEL_16;
  }
  v17 = v16;
  v23 = v6;
  v18 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v25 != v18)
        objc_enumerationMutation(v8);
      v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "hasSuffix:", CFSTR(".json")) & 1) != 0)
      {
        v15 = v20;

        goto LABEL_15;
      }

    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
      continue;
    break;
  }
  v15 = 0;
LABEL_15:
  v6 = v23;
LABEL_16:

  return v15;
}

- (void)cleanUp
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PRSAnonymousPipelineManager userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[PRSAnonymousPipelineManager allowedBundles](PRSAnonymousPipelineManager, "allowedBundles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        +[PRSAnonymousPipelineManager engagementCountKeyForBundle:](PRSAnonymousPipelineManager, "engagementCountKeyForBundle:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", &unk_1E6E978D8, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("collectedBundleID"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("lastQueryID"));
  -[PRSAnonymousPipelineManager deleteCandidateLogs](self, "deleteCandidateLogs");
  -[PRSAnonymousPipelineManager deleteExpiredSubmittedLogs](self, "deleteExpiredSubmittedLogs");

}

+ (id)submitttedSpotlightReportsError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSAnonymousPipelineManager submittedLogsURL](PRSAnonymousPipelineManager, "submittedLogsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0C9B5A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v6, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

- (void)queryWillFinishWithItems:(id)a3 forClient:(id)a4 forQuery:(id)a5 anonymousDataCollectionAllowed:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PRSAnonymousPipelineManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke;
  block[3] = &unk_1E6E43D68;
  block[4] = self;
  v18 = v11;
  v21 = a6;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, block);

}

void __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "submissionEnabled")
    && +[PRSAnonymousPipelineManager _dataCollectionAllowedForBundle:](PRSAnonymousPipelineManager, "_dataCollectionAllowedForBundle:", *(_QWORD *)(a1 + 40))&& *(_BYTE *)(a1 + 64))
  {
    PRSLogCategoryAnonymousPipeline();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = objc_msgSend(*(id *)(a1 + 48), "count");
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      v13 = v3;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1B86C5000, v2, OS_LOG_TYPE_INFO, "QueryWillFinish with %lu items client:%@ query:%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setLastTopHitQueryString:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setLastTopHitQueryItems:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "topHitDataCollectionTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "topHitDataCollectionTimer");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 1uLL, 0, v8);

    v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke_187;
    handler[3] = &unk_1E6E42FD8;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v9, handler);
    objc_msgSend(*(id *)(a1 + 32), "setTopHitDataCollectionTimer:", v9);
    dispatch_resume(v9);

  }
}

uint64_t __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke_187(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastTopHitQueryItems:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLastTopHitQueryString:", 0);
}

- (void)userEngagedItemWithIdentifier:(id)a3 forBundle:(id)a4 forQuery:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PRSLogCategoryAnonymousPipeline();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1B86C5000, v11, OS_LOG_TYPE_DEFAULT, "UserEngagedItem id:%@ bundle:%@ query:%@", buf, 0x20u);
  }

  v12 = v10;
  -[PRSAnonymousPipelineManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PRSAnonymousPipelineManager_userEngagedItemWithIdentifier_forBundle_forQuery___block_invoke;
  block[3] = &unk_1E6E43050;
  block[4] = self;
  v14 = v12;
  v18 = v14;
  v19 = v9;
  v20 = v8;
  v21 = v14;
  v15 = v8;
  v16 = v9;
  dispatch_async(v13, block);

}

void __80__PRSAnonymousPipelineManager_userEngagedItemWithIdentifier_forBundle_forQuery___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "lastTopHitQueryString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    goto LABEL_11;
  v2 = +[PRSAnonymousPipelineManager _dataCollectionAllowedForBundle:](PRSAnonymousPipelineManager, "_dataCollectionAllowedForBundle:", *(_QWORD *)(a1 + 48));

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastTopHitQueryItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 32), "lastTopHitQueryItems");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 56));

        if ((v9 & 1) != 0)
          break;
        ++v5;
        objc_msgSend(*(id *)(a1 + 32), "lastTopHitQueryItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v5 >= v11)
          return;
      }
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v12, "lastTopHitQueryItems");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:forClientBundle:keyboardPrimaryLanguage:clientID:", v5, 0, 0);
LABEL_11:

      }
    }
  }
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (NSString)lastTopHitQueryString
{
  return self->_lastTopHitQueryString;
}

- (void)setLastTopHitQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_lastTopHitQueryString, a3);
}

- (NSArray)lastTopHitQueryItems
{
  return self->_lastTopHitQueryItems;
}

- (void)setLastTopHitQueryItems:(id)a3
{
  objc_storeStrong((id *)&self->_lastTopHitQueryItems, a3);
}

- (OS_dispatch_source)topHitDataCollectionTimer
{
  return self->_topHitDataCollectionTimer;
}

- (void)setTopHitDataCollectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_topHitDataCollectionTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)submissionEnabled
{
  return self->_submissionEnabled;
}

- (void)setSubmissionEnabled:(BOOL)a3
{
  self->_submissionEnabled = a3;
}

- (SPCustomFeedbackSender)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topHitDataCollectionTimer, 0);
  objc_storeStrong((id *)&self->_lastTopHitQueryItems, 0);
  objc_storeStrong((id *)&self->_lastTopHitQueryString, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_shouldDataCollectForEngagementReservoirSamplingForClientBundle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 134218498;
  v6 = objc_msgSend(a1, "integerValue");
  v7 = 2048;
  v8 = 0;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_DEBUG, "[Sampling] Logging this sample. Engagement count:%lu random num:%lu date:%@", (uint8_t *)&v5, 0x20u);
}

void __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "Invalid index of engaged item %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke_cold_2(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "Json serialization err %d %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_8();
}

- (void)retrieveFeedbackURLToSendInDirectory:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, a2, a3, "Error reading contents of directory %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
