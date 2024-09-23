@implementation MTEpisode

- (BOOL)isPartiallyPlayed
{
  return -[MTEpisode playState](self, "playState") == 1;
}

- (BOOL)isPlayheadPartiallyPlayed
{
  float v2;

  -[MTEpisode playhead](self, "playhead");
  return v2 > 15.0;
}

- (BOOL)isVisuallyPlayed
{
  return !-[MTEpisode isBackCatalogItem](self, "isBackCatalogItem") && -[MTEpisode isPlayed](self, "isPlayed");
}

- (BOOL)isPartiallyPlayedBackCatalogItem
{
  return -[MTEpisode isBackCatalogItem](self, "isBackCatalogItem")
      && -[MTEpisode isPlayheadPartiallyPlayed](self, "isPlayheadPartiallyPlayed");
}

- (BOOL)isBackCatalogItem
{
  if (-[MTEpisode playState](self, "playState")
    || !-[MTEpisode playStateManuallySet](self, "playStateManuallySet"))
  {
    return 0;
  }
  else
  {
    return -[MTEpisode backCatalog](self, "backCatalog");
  }
}

- (BOOL)isPlayed
{
  return -[MTEpisode playState](self, "playState") == 0;
}

- (BOOL)isDownloaded
{
  void *v2;
  BOOL v3;

  -[MTEpisode assetURL](self, "assetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "predicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:useOptimizedPredicate:", v8, v6, a5, os_feature_enable_use_optimized_predicate());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 useOptimizedPredicate:(BOOL)a6
{
  if (a6)
    objc_msgSend(a1, "optimizedPredicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:", a3, a4, a5);
  else
    objc_msgSend(a1, "legacyPredicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isExplicit
{
  void *v4;
  char v5;

  if ((-[MTEpisode explicit](self, "explicit") & 1) != 0)
    return 1;
  -[MTEpisode podcast](self, "podcast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExplicit");

  return v5;
}

+ (id)predicateForEpisodesToPreserveForUser:(BOOL)a3 episodeLimit:(int64_t)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[4];

  v4 = a3;
  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForEpisodesDeterminedByLimitSettings:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optimizedPredicatePlaystateForPreservation:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(a1, "predicateForUserPreservedDownload:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(a1, "predicateForIsFromiTunesSync:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForEpisodesDeterminedByLimitSettings:(int64_t)a3
{
  int64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString **v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
      goto LABEL_8;
    case 4:
      v3 = 5;
      goto LABEL_8;
    case 5:
      v3 = 10;
LABEL_8:
      if (os_feature_enabled_serial_sort_auto_downloads())
        v8 = kEpisodeShowTypeSpecificLevel;
      else
        v8 = kEpisodeLevel;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %ld"), *v8, v3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6:
      v10 = -1;
      goto LABEL_18;
    case 7:
      v10 = -7;
      goto LABEL_18;
    case 8:
      v10 = -14;
      goto LABEL_18;
    case 9:
      v10 = -30;
      goto LABEL_18;
    default:
      if (a3 == 0x100000000)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (a3 == 0x100000001)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "episodeLimitForKey:", CFSTR("MTPodcastEpisodeLimitDefaultKey"));

        objc_msgSend(a1, "predicateForEpisodesDeterminedByLimitSettings:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v9 = (void *)v7;
        return v9;
      }
      v10 = 0x8000000000000001;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 28, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setDay:", objc_msgSend(v13, "day") + v10);
      objc_msgSend(v11, "dateFromComponents:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("pubDate"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
  }
}

+ (id)optimizedRemovalPredicateForRecentlyPlayed:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  if (a3)
  {
    objc_msgSend(a1, "predicateForPlayed:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(a1, "predicateForRecentlyPlayed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    objc_msgSend(a1, "predicateForPlayStateManuallySet:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v7;
    objc_msgSend(a1, "predicateForIsFromiTunesSync:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v8;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v17;
    v11 = 4;
  }
  else
  {
    objc_msgSend(a1, "predicateForDownloadBehavior:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForPlayed:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    objc_msgSend(a1, "predicateForIsBackCatalogItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "NOT");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v8;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v16;
    v11 = 3;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "NOT");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForIsFromiTunesSync:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isFromITunesSync"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForRecentlyPlayed
{
  return (id)objc_msgSend(a1, "predicateForPlayedInInterval:", 86400.0);
}

+ (id)predicateForPlayedInInterval:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForAtLeastPartiallyPlayedInInterval:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPlayed:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForAtLeastPartiallyPlayedInInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateForBeginningOfHour");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("lastDatePlayed"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("lastUserMarkedAsPlayedDate"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "OR:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForStationEligibleEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "predicateForEntitledEpisodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForSaved:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "OR:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForPodcastIsSubscribed:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OR:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "AND:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForDownloaded:(BOOL)a3 excludeHidden:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K > %@"), a4, CFSTR("assetURL"), CFSTR("assetURL"), &stru_1E5500770);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL"), a4, CFSTR("assetURL"), v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForNotEntitlementState:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K != %@)"), CFSTR("entitlementState"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEntitledEpisodes
{
  return (id)objc_msgSend(a1, "_predicateForNotEntitlementState:", 2);
}

+ (id)predicateForExternalType:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("externalType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForVisuallyPlayed:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(a1, "predicateForPlayed:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForIsBackCatalogItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "NOT");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AND:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "predicateForPlayed:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForIsBackCatalogItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "OR:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)predicateForIsBackCatalogItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForBacklog:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPlayed:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(a1, "predicateForPlayStateManuallySet:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForPlayed:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
    v3 = 4;
  else
    v3 = 5;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("playState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E5539560);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForBacklog:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("backCatalog"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPlayStateManuallySet:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("playStateManuallySet"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@)"), CFSTR("podcastUuid"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    +[MTEpisode predicateForAudio:](MTEpisode, "predicateForAudio:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AND:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)predicateForSaved:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("saved"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPodcastIsSubscribed:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("podcast.%K = %@"), CFSTR("subscribed"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEntitled
{
  return -[MTEpisode entitlementState](self, "entitlementState") != 2;
}

+ (id)sortDescriptorsForRecentlyPlayed
{
  return (id)objc_msgSend(a1, "sortDescriptorsForLastDatePlayedAscending:", 0);
}

+ (id)sortDescriptorsForLastDatePlayedAscending:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v3 = a3;
  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastDatePlayed"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), !v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sortDescriptorsForListenNow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("podcast.modifiedDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastDatePlayed"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodeUuids:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)metricsContentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;

  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MTEpisode storeTrackId](self, "storeTrackId"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[MTEpisode storeTrackId](self, "storeTrackId"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adamId"));

    }
    -[MTEpisode guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MTEpisode guid](self, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("guid"));

    }
    -[MTEpisode title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MTEpisode title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("title"));

    }
    -[MTEpisode podcast](self, "podcast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MTEpisode podcast](self, "podcast");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("podcast"));

    }
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)endOfTrack
{
  double result;

  -[MTEpisode duration](self, "duration");
  +[MTEpisode endOfTrackForDuration:](MTEpisode, "endOfTrackForDuration:");
  return result;
}

- (BOOL)isPlayheadResumable
{
  float v3;
  double v4;
  double v5;

  -[MTEpisode playhead](self, "playhead");
  v4 = v3;
  -[MTEpisode duration](self, "duration");
  return +[MTEpisode isPlayhead:resumableForDuration:](MTEpisode, "isPlayhead:resumableForDuration:", v4, v5);
}

- (id)numberedTitle
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[MTEpisode itunesTitle](self, "itunesTitle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[MTEpisode episodeNumber](self, "episodeNumber"), v4, v5 >= 1))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EPISODE_NUMBER_AND_TITLE_FORMAT"), &stru_1E5500770, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[MTEpisode episodeNumber](self, "episodeNumber");
    -[MTEpisode itunesTitle](self, "itunesTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%1$lld %2$@"), 0, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MTEpisode bestTitle](self, "bestTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)bestTitle
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;

  v3 = os_feature_enabled_remove_clean_episode_title();
  -[MTEpisode itunesTitle](self, "itunesTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      -[MTEpisode title](self, "title");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = v6;
      goto LABEL_7;
    }
LABEL_5:
    v6 = v4;
    goto LABEL_6;
  }
  if (v4)
    goto LABEL_5;
  -[MTEpisode cleanedTitle](self, "cleanedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[MTEpisode title](self, "title");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v11;

LABEL_7:
  return v7;
}

- (id)bestSummary
{
  void *v3;
  void *v4;

  if (os_feature_enabled_use_episode_description_for_summary())
  {
    -[MTEpisode itemDescription](self, "itemDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "hasHTML") & 1) != 0)
      -[MTEpisode itemDescriptionWithoutHTML](self, "itemDescriptionWithoutHTML");
    else
      -[MTEpisode itemDescription](self, "itemDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MTEpisode itunesSubtitle](self, "itunesSubtitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isTrailer
{
  return -[MTEpisode episodeTypeResolvedValue](self, "episodeTypeResolvedValue") == 1;
}

- (BOOL)isBonus
{
  return -[MTEpisode episodeTypeResolvedValue](self, "episodeTypeResolvedValue") == 2;
}

- (int64_t)episodeTypeResolvedValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;

  -[MTEpisode episodeType](self, "episodeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[MTEpisode episodeType](self, "episodeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("trailer"));

  if (!v6)
    return 1;
  -[MTEpisode episodeType](self, "episodeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("bonus")) == 0;

  return 2 * v8;
}

- (id)bestUrl
{
  void *v3;
  void *v4;
  void *v5;

  -[MTEpisode assetURL](self, "assetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (-[MTEpisode assetURL](self, "assetURL"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MTEpisode enclosureURL](self, "enclosureURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)assetURL
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v10;
  unsigned __int8 v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MTEpisode securityScopedAssetData](self, "securityScopedAssetData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_12;
  v11 = 0;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v3, 0, 0, &v11, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
    v6 = 0;
  else
    v6 = v11 == 0;
  if (!v6)
  {
    _MTLogCategoryDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 1024;
      v15 = v11;
      _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_ERROR, "Error resolving security scoped bookmark data %@.  Data is stale %d", buf, 0x12u);
    }

  }
  if (!v4)
  {

LABEL_12:
    -[MTEpisode primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("assetURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v4, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return (NSString *)v8;
}

+ (id)predicateForPreviouslyPlayedHidingFutureTimestamps
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForPreviouslyPlayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForHidingFuturePlayedTimestamps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPreviouslyPlayed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "predicateForHasBeenPlayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHidden");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPlayedDateSetByListening");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForListenNow
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("listenNowEpisode"), MEMORY[0x1E0C9AAB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_feature_enabled_unfollowed_shows_in_up_next())
    objc_msgSend(a1, "predicateForPodcastIsNotHidden");
  else
    objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPodcastIsNotHidden
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("podcast.%K = 0"), CFSTR("hidden"));
}

+ (id)predicateForPlayedDateSetByListening
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForNotManuallyMarkedAsPlayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForListenedAfterMarkedAsPlayed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForListenedAfterMarkedAsPlayed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDateKey:", CFSTR("lastDatePlayed"), CFSTR("lastUserMarkedAsPlayedDate"));
}

+ (id)predicateForNotManuallyMarkedAsPlayed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("lastUserMarkedAsPlayedDate"));
}

+ (id)predicateForHidingFuturePlayedTimestamps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2592000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("lastDatePlayed"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNilValueForKey:", CFSTR("lastDatePlayed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForHasBeenPlayed
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K != NULL AND %K > %@"), CFSTR("lastDatePlayed"), CFSTR("lastDatePlayed"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v10, a4, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodesFromiTunesSyncOnPodcastUuid:](MTEpisode, "predicateForEpisodesFromiTunesSyncOnPodcastUuid:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OR:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "AND:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  +[MTEpisode predicateForLimittedEpisodesOnPodcastUuid:determinedByLimit:deletePlayedEpisodes:](MTEpisode, "predicateForLimittedEpisodesOnPodcastUuid:determinedByLimit:deletePlayedEpisodes:", v10, a4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:](MTEpisode, "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:", v10, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "AND:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v11, "OR:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "AND:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)predicateForOtherEpisodesOnPodcastUuid:(id)a3 baseEpisodesPredicate:(id)a4 deletePlayedEpisodes:(BOOL)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v8 = (void *)MEMORY[0x1E0CB3528];
  v9 = a3;
  objc_msgSend(v8, "notPredicateWithSubpredicate:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "AND:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForPlayStateManuallySet:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForIsFromiTunesSync:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OR:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "AND:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "AND:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "OR:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v21;
  }
  objc_msgSend(v12, "AND:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)predicateForLimittedEpisodesOnPodcastUuid:(id)a3 determinedByLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  objc_msgSend(a1, "predicateForEpisodesDeterminedByLimitSettings:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "AND:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "OR:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v9, "AND:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "AND:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)predicateForEpisodesFromiTunesSyncOnPodcastUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForIsFromiTunesSync:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  void *v13;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v12 = a3;
  if (os_feature_enable_use_optimized_predicate())
    objc_msgSend(a1, "optimizedPredicateForAutomaticDownloadsOnShow:deletePlayedEpisodes:episodeLimit:serialNextEpisodesSort:includePlayableWithoutAccount:", v12, v10, a5, v8, v7);
  else
    objc_msgSend(a1, "legacyPredicateForAutomaticDownloadsOnShow:deletePlayedEpisodes:episodeLimit:serialNextEpisodesSort:includePlayableWithoutAccount:", v12, v10, a5, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)optimizedPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[6];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[3];
  _QWORD v61[4];

  v52 = a7;
  v61[2] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!a4)
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    v61[0] = v9;
    +[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v51 = v10;
  v15 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForEpisodesDeterminedByLimitSettings:](MTEpisode, "predicateForEpisodesDeterminedByLimitSettings:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v16;
  +[MTEpisode predicateForDownloadLimitForEpisodeLimit:](MTEpisode, "predicateForDownloadLimitForEpisodeLimit:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB3528];
  v59[0] = v10;
  +[MTEpisode predicateForIsBackCatalogItem](MTEpisode, "predicateForIsBackCatalogItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v19;
  +[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "orPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v25);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v27;
  +[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v28;
  +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "andPredicateWithSubpredicates:", v30);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForIsFromiTunesSync:](MTEpisode, "predicateForIsFromiTunesSync:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v32;
  v56[1] = v50;
  v56[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "orPredicateWithSubpredicates:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 0, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v36;
  +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v37;
  +[MTEpisode predicateForPlayableEpisode:](MTEpisode, "predicateForPlayableEpisode:", v52);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v38;
  +[MTEpisode predicateForFeedDeleted:](MTEpisode, "predicateForFeedDeleted:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v39;
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v40;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("enclosureURL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "andPredicateWithSubpredicates:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v53);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = v45;
  v54[1] = v43;
  v54[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "andPredicateWithSubpredicates:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (id)predicateForFeedDeleted:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("feedDeleted"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForUserPreservedDownload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v3 = a3;
  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForDownloadBehavior:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForDownloadBehavior:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "optimizedPredicatePlaystateForPreservation:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(a1, "predicateForIsBackCatalogItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)predicateForDownloadBehavior:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("downloadBehavior"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)optimizedPredicatePlaystateForPreservation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a1, "predicateForPlayed:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForIsBackCatalogItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "OR:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)optimizedPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v6 = a4;
  v18[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "predicateForEpisodesToPreserveForUser:episodeLimit:", v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  objc_msgSend(a1, "predicateForDownloaded:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(a1, "optimizedRemovalPredicateForRecentlyPlayed:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:", a3, 1);
}

+ (id)predicateForDownloaded:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K > %@"), CFSTR("assetURL"), CFSTR("assetURL"), &stru_1E5500770);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL"), CFSTR("assetURL"), v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForPlayableEpisode:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MTEpisode predicateForEpisodesPlayableWithoutAccount](MTEpisode, "predicateForEpisodesPlayableWithoutAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AND:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)predicateForEpisodesPlayableWithoutAccount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForEpisodesRequiringAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notPredicateWithSubpredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesRequiringAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForPriceType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPriceType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPriceType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_predicateForPriceType:excluding:", a3, 0);
}

+ (id)_predicateForPriceType:(int64_t)a3 forPriceTypeKey:(id)a4 excluding:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a5;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a4;
  NSPersistentStringForMTEpisodePriceType(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(%K != NULL) && (%K = %@)"), v8, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "NOT");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  return v10;
}

- (BOOL)hasFreeVersion
{
  void *v2;
  uint64_t v3;

  -[MTEpisode freePriceType](self, "freePriceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MTEpisodePriceTypeFromPersistentString(v2);

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (id)_predicateForPriceType:(int64_t)a3 excluding:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_predicateForPriceType:forPriceTypeKey:excluding:", a3, CFSTR("priceType"), a4);
}

+ (id)predicateForDownloadLimitForEpisodeLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(a1, "predicateForPodcastIsSerial:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(a1, "predicateForEpisodesDeterminedByLimitSettings:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

- (BOOL)isRestricted
{
  return !+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed")
      && -[MTEpisode isExplicit](self, "isExplicit");
}

+ (id)predicateForEpisodeUuid:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), a3);
}

+ (BOOL)isPlayhead:(double)a3 resumableForDuration:(double)a4
{
  double v6;

  if (a3 < 0.100000001)
    return 0;
  +[MTEpisode endOfTrackForDuration:](MTEpisode, "endOfTrackForDuration:", a4);
  return v6 > a3;
}

+ (double)endOfTrackForDuration:(double)a3
{
  if (a3 <= 360.0)
    return a3 * 0.9;
  else
    return a3 + -240.0;
}

+ (id)predicateForEpisodeGuid:(id)a3 onFeedURL:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K.%K = %@"), CFSTR("guid"), a3, CFSTR("podcast"), CFSTR("feedURL"), a4);
}

+ (id)predicateForDownloadedFairPlayEpisodes
{
  void *v2;
  void *v3;
  void *v4;

  +[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode assetURLIsPackagedMedia](MTEpisode, "assetURLIsPackagedMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)assetURLIsPackagedMedia
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K ENDSWITH %@)"), CFSTR("assetURL"), CFSTR("movpkg"));
}

+ (id)predicateForPartiallyPlayedInLastTwoMonths
{
  return (id)objc_msgSend(a1, "predicateForAtLeastPartiallyPlayedInInterval:", 5184000.0);
}

+ (id)episodicSortDescriptors:(int64_t)a3
{
  return (id)objc_msgSend(a1, "sortDescriptorsForPubDateAscending:", +[MTPodcast sortOrderAscForShowType:](MTPodcast, "sortOrderAscForShowType:", a3));
}

+ (id)sortDescriptorsForPubDateAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a3;
  v10[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), v3 ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sortDescriptorsForFirstAvailableAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a3;
  v10[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("firstTimeAvailable"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), v3 ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sortDescriptorsForLastBookmarkedDateAscending:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastBookmarkedDate"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForDownloadedDateAscending:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("downloadDate"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastDatePlayed"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sortDescriptorsForUpNextScore
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("upNextScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("podcast.modifiedDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sortDescriptorsForModifiedDateUpNextScore
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modifiedDateScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sortDescriptorsForListenNowLatestEpisodes
{
  return (id)objc_msgSend(a1, "sortDescriptorsForPubDateAscending:", 0);
}

+ (id)sortDescriptorsForSeasonsWithOldestEpisodesFirst:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a3;
  v10[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("seasonNumber"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), v3 ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)seasonSortDescriptors:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = +[MTPodcast sortOrderAscForShowType:](MTPodcast, "sortOrderAscForShowType:");
  if (a3 == 4)
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:reverseNullOrder:", CFSTR("seasonNumber"), 1, 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("seasonNumber"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, 0);
  objc_msgSend(a1, "sortDescriptorsForEpisodeNumberAscending:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  return v7;
}

+ (id)sortDescriptorsForSeasonAndEpisodeNumberAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:reverseNullOrder:", CFSTR("seasonNumber"), v3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
  objc_msgSend(a1, "sortDescriptorsForEpisodeNumberAscending:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  return v6;
}

+ (id)sortDescriptorsForEpisodeNumberAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a3;
  v10[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:reverseNullOrder:", CFSTR("episodeNumber"), v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sortDescriptorsForCalculatingEpisodeLevel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)propertyPathForPodcastProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("podcast");
  v8[1] = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setPersistentID:(int64_t)a3
{
  void *v5;

  if (-[MTEpisode persistentID](self, "persistentID") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("persistentID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("persistentID"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("persistentID"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MTEpisode didChangePersistentID](self, "didChangePersistentID");
  }
}

- (void)setPodcast:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("podcast"));
  -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("podcast"));
  -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("podcast"));
  objc_msgSend(v5, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisode setPodcastUuid:](self, "setPodcastUuid:", v4);

  if ((objc_msgSend(v5, "currentEpisodeLimitAllowsAutomaticDownloads") & 1) == 0)
    -[MTEpisode suppressAutomaticDownloadsIfNeeded](self, "suppressAutomaticDownloadsIfNeeded");
  if ((objc_msgSend(v5, "notifications") & 1) == 0)
    -[MTEpisode setSentNotification:](self, "setSentNotification:", 1);

}

- (void)setFeedDeleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTEpisode feedDeleted](self, "feedDeleted") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("feedDeleted"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("feedDeleted"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("feedDeleted"));
  }
}

- (void)setImportDate:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  +[FutureDateChecker lenientSharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "lenientSharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestampBoundByNow:", a3);
  v7 = v6;

  -[MTEpisode importDate](self, "importDate");
  if (v8 != v7)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importDate"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, CFSTR("importDate"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importDate"));
  }
}

- (void)setCleanedTitle:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode cleanedTitle](self, "cleanedTitle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode cleanedTitle](self, "cleanedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cleanedTitle"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("cleanedTitle"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cleanedTitle"));
    }
  }

}

- (void)setByteSize:(int64_t)a3
{
  void *v5;

  if (-[MTEpisode byteSize](self, "byteSize") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("byteSize"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("byteSize"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("byteSize"));
  }
}

- (void)setEnclosureURL:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode enclosureURL](self, "enclosureURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode enclosureURL](self, "enclosureURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("enclosureURL"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("enclosureURL"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("enclosureURL"));
    }
  }

}

- (void)setPodcastUuid:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (!v4 && (-[MTEpisode isDeleted](self, "isDeleted") & 1) == 0)
  {
    _MTLogCategoryDatabase();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[MTEpisode(Core) setPodcastUuid:].cold.1(self, v5);

  }
  -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("podcastUuid"));
  -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("podcastUuid"));
  -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("podcastUuid"));

}

- (void)setExplicit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTEpisode explicit](self, "explicit") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("explicit"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("explicit"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("explicit"));
  }
}

- (void)setEpisodeLevel:(int64_t)a3
{
  void *v5;

  if (-[MTEpisode episodeLevel](self, "episodeLevel") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("episodeLevel"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("episodeLevel"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("episodeLevel"));
  }
}

- (void)setIsNew:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTEpisode isNew](self, "isNew") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isNew"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isNew"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isNew"));
  }
}

- (void)setItunesTitle:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode itunesTitle](self, "itunesTitle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode itunesTitle](self, "itunesTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("itunesTitle"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("itunesTitle"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("itunesTitle"));
    }
  }

}

- (void)setEpisodeType:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode episodeType](self, "episodeType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode episodeType](self, "episodeType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("episodeType"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("episodeType"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("episodeType"));
    }
  }

}

- (void)setWebpageURL:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode webpageURL](self, "webpageURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode webpageURL](self, "webpageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("webpageURL"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("webpageURL"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("webpageURL"));
    }
  }

}

- (void)setEpisodeNumber:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = v5;
  }
  else
  {

    v7 = 0;
  }
  -[MTEpisode primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("episodeNumber"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6 && (objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("episodeNumber"));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("episodeNumber"));
    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("episodeNumber"));
  }

}

- (void)setSeasonNumber:(int64_t)a3
{
  id v5;

  if (-[MTEpisode seasonNumber](self, "seasonNumber") != a3)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("seasonNumber"));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("seasonNumber"));
    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("seasonNumber"));

  }
}

- (void)setDuration:(double)a3
{
  double v5;
  void *v6;

  -[MTEpisode duration](self, "duration");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("duration"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
  }
}

- (void)setEntitledDuration:(double)a3
{
  double v5;
  void *v6;

  -[MTEpisode entitledDuration](self, "entitledDuration");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("entitledDuration"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("entitledDuration"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("entitledDuration"));
  }
}

- (void)setFreeDuration:(double)a3
{
  double v5;
  void *v6;

  -[MTEpisode freeDuration](self, "freeDuration");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("freeDuration"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("freeDuration"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("freeDuration"));
  }
}

- (void)setTrackNum:(int64_t)a3
{
  void *v5;

  if (-[MTEpisode trackNum](self, "trackNum") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("trackNum"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("trackNum"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("trackNum"));
  }
}

- (void)setPubDate:(double)a3
{
  double v5;
  void *v6;

  -[MTEpisode pubDate](self, "pubDate");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pubDate"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("pubDate"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pubDate"));
  }
}

+ (id)propertiesToFetchBestTitle
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("itunesTitle");
  v3[1] = CFSTR("cleanedTitle");
  v3[2] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertiesToFetchIsPlayed
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("playState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertiesToFetchIsPartiallyPlayed
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("playState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isUnplayed
{
  return -[MTEpisode playState](self, "playState") == 2;
}

+ (id)propertiesToFetchIsVisuallyPlayed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesToFetchIsBackCatalogItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(a1, "propertiesToFetchIsPlayed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (id)propertiesToFetchIsBackCatalogItem
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("playState");
  v3[1] = CFSTR("playStateManuallySet");
  v3[2] = CFSTR("backCatalog");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertiesToFetchIsPartiallyPlayedBackCatalogItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesToFetchIsBackCatalogItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(a1, "propertiesToFetchIsPlayheadPartiallyPlayed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (id)propertiesToFetchPlaybackProgress
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("duration");
  v3[1] = CFSTR("playhead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)playbackProgress
{
  double v3;
  double v4;
  double result;
  float v6;
  double v7;
  double v8;

  -[MTEpisode duration](self, "duration");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[MTEpisode playhead](self, "playhead", 0.0);
    v7 = v6;
    -[MTEpisode duration](self, "duration");
    return v7 / v8;
  }
  return result;
}

- (double)playbackProgressSanitized
{
  uint64_t v3;
  double v4;
  double v5;
  float v6;
  double v7;
  double result;
  float v9;
  double v10;
  double v11;
  float v12;
  BOOL v13;

  v3 = -[MTEpisode playState](self, "playState");
  if (!v3)
    return 1.0;
  if (v3 == 2)
    return 0.0;
  if (v3 != 1)
    return -1.0;
  -[MTEpisode duration](self, "duration");
  v5 = v4;
  -[MTEpisode playhead](self, "playhead");
  v7 = v6;
  result = 0.5;
  if (v5 > v7)
  {
    -[MTEpisode playhead](self, "playhead", 0.5);
    v10 = v9;
    -[MTEpisode duration](self, "duration");
    v12 = v10 / v11;
    v13 = v12 > 1.0 || v12 < 0.0;
    result = v12;
    if (v13)
      return 0.5;
  }
  return result;
}

+ (id)propertiesToFetchTimeRemaining
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("duration");
  v3[1] = CFSTR("playhead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)timeRemaining
{
  double v3;
  double v4;
  float v5;

  -[MTEpisode duration](self, "duration");
  v4 = v3;
  -[MTEpisode playhead](self, "playhead");
  return v4 - v5;
}

+ (id)propertiesToFetchIsPlayheadPartiallyPlayed
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("playhead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertiesToFetchAssetURL
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("securityScopedAssetData");
  v3[1] = CFSTR("assetURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setAssetUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assetURL"));
  -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("assetURL"));

  -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assetURL"));
}

+ (id)propertiesToFetchIsExplicit
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("explicit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsForPrefetchingIsExplicit
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("podcast");
  v6[1] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isShareable
{
  void *v4;
  char v5;

  if (-[MTEpisode isExternalType](self, "isExternalType"))
    return 0;
  -[MTEpisode podcast](self, "podcast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShareable");

  return v5;
}

- (void)suppressAutomaticDownloadsIfNeeded
{
  if (!-[MTEpisode downloadBehavior](self, "downloadBehavior"))
    -[MTEpisode setDownloadBehavior:](self, "setDownloadBehavior:", 1);
}

- (void)unsuppressAutomaticDownloadsIfNeeded
{
  if (-[MTEpisode downloadBehavior](self, "downloadBehavior") == 1)
    -[MTEpisode setDownloadBehavior:](self, "setDownloadBehavior:", 0);
}

- (BOOL)hasNonZeroSeasonNumber
{
  return -[MTEpisode seasonNumber](self, "seasonNumber") > 0;
}

- (id)transcriptSnippet
{
  void *v3;
  void *v4;
  int v5;

  -[MTEpisode podcast](self, "podcast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "subscriptionActive");

  if (v5)
    -[MTEpisode entitledTranscriptSnippet](self, "entitledTranscriptSnippet");
  else
    -[MTEpisode freeTranscriptSnippet](self, "freeTranscriptSnippet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transcriptProvider
{
  void *v3;
  void *v4;
  int v5;

  -[MTEpisode podcast](self, "podcast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "subscriptionActive");

  if (v5)
    -[MTEpisode entitledTranscriptProvider](self, "entitledTranscriptProvider");
  else
    -[MTEpisode freeTranscriptProvider](self, "freeTranscriptProvider");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)parsePriceType
{
  void *v2;
  int64_t v3;

  -[MTEpisode priceType](self, "priceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MTEpisodePriceTypeFromPersistentString(v2);

  return v3;
}

- (int64_t)_resolvedEntitlementState
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  int v9;

  +[MTEpisode predicateForDerivedEntitlementStateFree](MTEpisode, "predicateForDerivedEntitlementStateFree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "evaluateWithObject:", self);

  if ((v4 & 1) != 0)
    return 0;
  +[MTEpisode predicateForDerivedEntitlementStateEntitled](MTEpisode, "predicateForDerivedEntitlementStateEntitled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "evaluateWithObject:", self);

  if ((v7 & 1) != 0)
    return 1;
  +[MTEpisode predicateForDerivedEntitlementStateUnentitled](MTEpisode, "predicateForDerivedEntitlementStateUnentitled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "evaluateWithObject:", self);

  if (v9)
    return 2;
  else
    return 0;
}

- (void)updateEntitlementState
{
  -[MTEpisode setEntitlementState:](self, "setEntitlementState:", -[MTEpisode _resolvedEntitlementState](self, "_resolvedEntitlementState"));
}

- (id)playURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTEpisode podcastUuid](self, "podcastUuid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("null");
  -[MTEpisode uuid](self, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("null");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("podcasts://play?podcastUuid=%@&episodeUuid=%@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)displayURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTEpisode podcastUuid](self, "podcastUuid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("null");
  -[MTEpisode uuid](self, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("null");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("podcasts://show?podcastUuid=%@&episodeUuid=%@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isMedia
{
  return -[MTEpisode isAudio](self, "isAudio") || -[MTEpisode isVideo](self, "isVideo");
}

- (BOOL)isTopLevel
{
  return -[MTEpisode flags](self, "flags") & 1;
}

- (void)setIsTopLevel:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  v5 = -[MTEpisode flags](self, "flags");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
    -[MTEpisode setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[19];

  v6[18] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("uuid");
  v6[1] = CFSTR("podcastUuid");
  v6[2] = CFSTR("pubDate");
  v6[3] = CFSTR("flags");
  v6[4] = CFSTR("explicit");
  v6[5] = CFSTR("backCatalog");
  v6[6] = CFSTR("playState");
  v6[7] = CFSTR("userEpisode");
  v6[8] = CFSTR("listenNowEpisode");
  v6[9] = CFSTR("episodeNumber");
  v6[10] = CFSTR("seasonNumber");
  v6[11] = CFSTR("entitlementState");
  v6[12] = CFSTR("isHidden");
  v6[13] = CFSTR("isBookmarked");
  v6[14] = CFSTR("lastDatePlayed");
  v6[15] = CFSTR("episodeLevel");
  v6[16] = CFSTR("episodeShowTypeSpecificLevel");
  v6[17] = CFSTR("lastBookmarkedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)friendlyPubDateStringForEpisode:(id)a3
{
  return (id)objc_msgSend(a1, "friendlyPubDateStringForEpisode:abbreviated:", a3, 0);
}

+ (id)friendlyPubDateStringForEpisode:(id)a3 abbreviated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("pubDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  if (v6 == 0.0)
  {

    v5 = 0;
LABEL_3:
    v7 = 0;
    goto LABEL_9;
  }
  if (!v5)
    goto LABEL_3;
  if (v4)
    objc_msgSend(v5, "abbreviatedFriendlyDisplayString");
  else
    objc_msgSend(v5, "friendlyDisplayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v7;
}

+ (id)timeRemainingStringForEpisode:(id)a3
{
  return (id)objc_msgSend(a1, "timeRemainingStringForEpisode:abbreviated:", a3, 0);
}

+ (id)timeRemainingStringForEpisode:(id)a3 abbreviated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __64__MTEpisode_Library__timeRemainingStringForEpisode_abbreviated___block_invoke;
  v13 = &unk_1E54D19C0;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "performBlockAndWait:", &v10);

  if (v17[3] <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 1, v4, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __64__MTEpisode_Library__timeRemainingStringForEpisode_abbreviated___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "timeRemaining");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

+ (BOOL)exists:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainOrPrivateContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__MTEpisode_Library__exists___block_invoke;
  v9[3] = &unk_1E54D13D0;
  v6 = v5;
  v10 = v6;
  v7 = v3;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __29__MTEpisode_Library__exists___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "episodeForUuid:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "podcast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(v2, "hidden") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

+ (BOOL)isExternalMedia:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainOrPrivateContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__MTEpisode_Library__isExternalMedia___block_invoke;
  v9[3] = &unk_1E54D13D0;
  v6 = v5;
  v10 = v6;
  v7 = v3;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __38__MTEpisode_Library__isExternalMedia___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "episodeForUuid:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isExternalType");

}

- (void)setMetadataIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MTLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTEpisode metadataIdentifier](self, "metadataIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode podcast](self, "podcast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode podcast](self, "podcast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updatedFeedURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode guid](self, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v6;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_DEFAULT, "Setting metadataIdentifier from %{public}@ to %{public}@, for feedUrl: %{public}@ updatedFeedUrl %{public}@, guid: %{public}@", (uint8_t *)&v12, 0x34u);

  }
  -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("metadataIdentifier"));
  -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("metadataIdentifier"));
  -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadataIdentifier"));

}

- (BOOL)isInPodcastDetailsUnplayedTab
{
  MTEpisode *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[MTEpisode podcastUuid](self, "podcastUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisode podcast](v2, "podcast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodesOnUnplayedTabOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:deletePlayedEpisodes:", v3, objc_msgSend(v4, "deletePlayedEpisodesResolvedValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "evaluateWithObject:", v2);

  return (char)v2;
}

- (void)setItunesSubtitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4
    || (-[MTEpisode itunesSubtitle](self, "itunesSubtitle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 = 0,
        v5))
  {
    if (objc_msgSend(v4, "hasHTML"))
    {
      objc_msgSend(v10, "stringBySmartlyStrippingHTML");
      v6 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v6;
    }
    -[MTEpisode itunesSubtitle](self, "itunesSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("itunesSubtitle"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, CFSTR("itunesSubtitle"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("itunesSubtitle"));
    }
    v9 = v10;
  }
  else
  {
    v9 = 0;
  }

}

- (void)setItemDescription:(id)a3
{
  void *v3;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12
    || (-[MTEpisode itemDescription](self, "itemDescription"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[MTEpisode itemDescription](self, "itemDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v12, "isEqualToString:", v5);

    if (v12)
    {
      if ((v6 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

      if ((v6 & 1) != 0)
        goto LABEL_11;
    }
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("itemDescription"));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v12, CFSTR("itemDescription"));
    v7 = (void *)MEMORY[0x1AF4138F4](-[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("itemDescription")));
    v8 = objc_msgSend(v12, "hasHTML");
    objc_autoreleasePoolPop(v7);
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("itemDescriptionHasHTML"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, CFSTR("itemDescriptionHasHTML"));

    v10 = (void *)MEMORY[0x1AF4138F4](-[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("itemDescriptionHasHTML")));
    if ((_DWORD)v8)
    {
      objc_msgSend(v12, "stringBySmartlyStrippingHTML");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("itemDescriptionWithoutHTML"));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v11, CFSTR("itemDescriptionWithoutHTML"));
    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("itemDescriptionWithoutHTML"));

    objc_autoreleasePoolPop(v10);
    -[MTEpisode setAttributedDescriptionFromHTML:](self, "setAttributedDescriptionFromHTML:", 0);
  }
LABEL_11:

}

- (id)playedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[MTEpisode isVisuallyPlayed](self, "isVisuallyPlayed"))
  {
    -[MTEpisode valueForKey:](self, "valueForKey:", CFSTR("lastDatePlayed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "verboseDisplayStringWithoutTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EPISODE_LAST_PLAYED_ON_DATE_FORMAT"), &stru_1E5500770, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EPISODE_PLAYED_TITLE"), &stru_1E5500770, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)playedTextForCarplay
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  if (-[MTEpisode isVisuallyPlayed](self, "isVisuallyPlayed"))
  {
    -[MTEpisode valueForKey:](self, "valueForKey:", CFSTR("lastDatePlayed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "friendlyDisplayString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isDateInToday:", v3);

      if (!v6)
      {
        v12 = objc_msgSend(v3, "isLessThanWeekOld");
        objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
          v15 = CFSTR("EPISODE_PLAYED_ON_DAY_FORMAT");
        else
          v15 = CFSTR("EPISODE_PLAYED_ON_DATE_FORMAT");
        objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E5500770, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v4);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("EPISODE_PLAYED_TODAY");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("EPISODE_PLAYED_TITLE");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E5500770, 0);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)v11;

    return v10;
  }
  v10 = 0;
  return v10;
}

- (void)setUti:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL4 v10;
  uint64_t v11;

  +[MTUTIUtil convertUti:](MTUTIUtil, "convertUti:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  -[MTEpisode uti](self, "uti");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4 | v11)
  {
    v5 = (void *)v4;
    -[MTEpisode uti](self, "uti");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v11);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("uti"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v11, CFSTR("uti"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("uti"));
    }
  }
  v8 = +[MTUTIUtil isAudio:](MTUTIUtil, "isAudio:");
  if (v8 != -[MTEpisode isAudio](self, "isAudio"))
    -[MTEpisode setAudio:](self, "setAudio:", v8);
  v9 = +[MTUTIUtil isVideo:](MTUTIUtil, "isVideo:", v11);
  if (v9 != -[MTEpisode isVideo](self, "isVideo"))
    -[MTEpisode setVideo:](self, "setVideo:", v9);
  v10 = v9 || v8;
  if (v10 == -[MTEpisode isExternalType](self, "isExternalType"))
    -[MTEpisode setExternalType:](self, "setExternalType:", !v10);

}

- (void)setAssetURL:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  -[MTEpisode assetURL](self, "assetURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v8 | v4;

  if (v5)
  {
    -[MTEpisode assetURL](self, "assetURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assetURL"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("assetURL"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assetURL"));
      -[MTEpisode suppressAutomaticDownloadsIfNeeded](self, "suppressAutomaticDownloadsIfNeeded");
      if (!v8)
      {
        -[MTEpisode setDownloadDate:](self, "setDownloadDate:", 0.0);
        -[MTEpisode setIsFromITunesSync:](self, "setIsFromITunesSync:", 0);
      }
    }
  }

}

- (void)setMetadataFirstSyncEligible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTEpisode metadataFirstSyncEligible](self, "metadataFirstSyncEligible") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("metadataFirstSyncEligible"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("metadataFirstSyncEligible"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadataFirstSyncEligible"));
  }
}

- (void)incremementPlayCount
{
  -[MTEpisode setPlayCount:](self, "setPlayCount:", -[MTEpisode playCount](self, "playCount") + 1);
}

- (void)updateListenNowSortingDate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  id v20;

  if (-[MTEpisode listenNowEpisode](self, "listenNowEpisode"))
  {
    -[MTEpisode podcast](self, "podcast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastDatePlayed");
    v5 = v4;

    -[MTEpisode lastDatePlayed](self, "lastDatePlayed");
    v7 = v6;
    -[MTEpisode podcast](self, "podcast");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addedDate");
    v9 = v8;
    if (v5 > 0.0 || v7 > 0.0)
    {

      -[MTEpisode pubDate](self, "pubDate");
      if (v9 < v11)
        v9 = v11;
      +[FutureDateChecker sharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isFutureWithTimestamp:", v5);

      if (v9 >= v5)
        v14 = v9;
      else
        v14 = v5;
      if (v13)
        v15 = v9;
      else
        v15 = v14;
      +[FutureDateChecker sharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "sharedInstance", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isFutureWithTimestamp:", v7);

      if (v15 >= v7)
        v18 = v15;
      else
        v18 = v7;
      if (v17)
        v19 = v15;
      else
        v19 = v18;
      -[MTEpisode podcast](self, "podcast", v18);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setModifiedDate:", v19);
    }
    else
    {
      -[MTEpisode podcast](self, "podcast");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setModifiedDate:", v9);

    }
  }
}

- (void)setLastDatePlayed:(double)a3
{
  double v5;
  void *v6;
  void *v7;

  -[MTEpisode lastDatePlayed](self, "lastDatePlayed");
  if (v5 < a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastDatePlayed"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("lastDatePlayed"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastDatePlayed"));
    -[MTEpisode podcast](self, "podcast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastDatePlayed:", a3);

    -[MTEpisode updateListenNowSortingDate](self, "updateListenNowSortingDate");
  }
}

- (void)setListenNowEpisode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (-[MTEpisode listenNowEpisode](self, "listenNowEpisode") != a3)
  {
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listenNowEpisode"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("listenNowEpisode"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listenNowEpisode"));
    -[MTEpisode podcast](self, "podcast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextEpisodeUuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v3)
    {
      if ((v9 & 1) != 0)
        return;
      _MTLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[MTEpisode podcast](self, "podcast");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextEpisodeUuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTEpisode uuid](self, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v12;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_DEFAULT, "ListenNowEpisode changed. Update podcast nextEpisodeUUID from %{public}@ to %{public}@", (uint8_t *)&v18, 0x16u);

      }
      -[MTEpisode podcast](self, "podcast");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTEpisode uuid](self, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNextEpisodeUuid:", v15);

    }
    else
    {
      if (!v9)
        return;
      _MTLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[MTEpisode uuid](self, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1A904E000, v16, OS_LOG_TYPE_DEFAULT, "ListenNowEpisode changed. Clear podcast nextEpisodeUUID from episode %{public}@", (uint8_t *)&v18, 0xCu);

      }
      -[MTEpisode podcast](self, "podcast");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNextEpisodeUuid:", 0);
    }

  }
}

+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 title:(id)a4 podcast:(id)a5 pubDate:(id)a6 byteSize:(int64_t)a7 guid:(id)a8 uti:(id)a9 contentId:(int64_t)a10 enclosureUrl:(id)a11 playStateSource:(int)a12 importSource:(int)a13 canSendNotifications:(BOOL)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v25;
  id v27;

  v27 = a4;
  v18 = a6;
  v19 = a8;
  v25 = a9;
  v20 = a11;
  v21 = a5;
  +[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:](MTEpisode, "insertNewEpisodeInManagedObjectContext:canSendNotifications:", a3, a14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPodcast:", v21);

  objc_msgSend(v22, "setStoreTrackId:", a10);
  objc_msgSend(v22, "setImportSource:", a13);
  objc_msgSend(v22, "setByteSize:", a7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    objc_msgSend(v22, "setPubDate:");
  }
  objc_msgSend(v22, "setUti:", v25, a7);
  if (v19)
    objc_msgSend(v22, "setGuid:", v19);
  if (v27)
    objc_msgSend(v22, "setTitle:", v27);
  if (v20)
    objc_msgSend(v22, "setEnclosureURL:", v20);
  objc_msgSend(a1, "prepareForPlatform:", v22);

  return v22;
}

+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 canSendNotifications:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("MTEpisode"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  objc_msgSend(v6, "setPlayState:manually:source:", 2, 0, 2);
  objc_msgSend(v6, "setVideo:", 0);
  objc_msgSend(v6, "setAudio:", 0);
  objc_msgSend(v6, "setExternalType:", 0);
  objc_msgSend(v6, "setMetadataTimestamp:", 0.0);
  objc_msgSend(v6, "setLastDatePlayed:", 0.0);
  objc_msgSend(v6, "setMetadataFirstSyncEligible:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "setImportDate:");
  objc_msgSend(v6, "setIsNew:", 1);
  objc_msgSend(v6, "setSentNotification:", !v4);
  objc_msgSend(a1, "prepareForPlatform:", v6);
  return v6;
}

- (void)setPlayed:(BOOL)a3 manually:(BOOL)a4 source:(int)a5
{
  uint64_t v5;

  if (a3)
    v5 = 0;
  else
    v5 = 2;
  -[MTEpisode setPlayState:manually:source:](self, "setPlayState:manually:source:", v5, a4, *(_QWORD *)&a5);
}

- (void)setPlayState:(int64_t)a3 manually:(BOOL)a4 source:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[MTEpisode playState](self, "playState");
    v11 = -[MTEpisode playStateManuallySet](self, "playStateManuallySet");
    -[MTEpisode title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134350594;
    v26 = v10;
    v27 = 2050;
    v28 = a3;
    v29 = 1026;
    v30 = v11;
    v31 = 1026;
    v32 = v6;
    v33 = 1026;
    v34 = v5;
    v35 = 2114;
    v36 = v12;
    v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_1A904E000, v9, OS_LOG_TYPE_DEFAULT, "Setting Playstate from %{public}lld to %{public}lld , Manual: from %{public}d to %{public}d, Source: %{public}u For: %{public}@, UUID: %{public}@", (uint8_t *)&v25, 0x3Cu);

  }
  if (-[MTEpisode playState](self, "playState") != a3
    || (-[MTEpisode valueForKey:](self, "valueForKey:", CFSTR("playState")),
        (v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v15 = (void *)v14,
        v16 = -[MTEpisode playStateManuallySet](self, "playStateManuallySet"),
        v15,
        v16 != v6))
  {
    v17 = -[MTEpisode playState](self, "playState");
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playState"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v18, CFSTR("playState"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playState"));
    -[MTEpisode updateUPPTimestamp](self, "updateUPPTimestamp");
    if (a3 == 2)
    {
      v19 = 0;
    }
    else
    {
      -[MTEpisode setIsNew:](self, "setIsNew:", 0);
      v19 = a3 == 0;
      if (!a3 && v17)
      {
        LODWORD(v20) = 0;
        -[MTEpisode setPlayhead:](self, "setPlayhead:", v20);
        v19 = 1;
      }
    }
    -[MTEpisode podcast](self, "podcast");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markPlaylistsForUpdate");

    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playStateManuallySet"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v22, CFSTR("playStateManuallySet"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playStateManuallySet"));
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playStateSource"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v23, CFSTR("playStateSource"));

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playStateSource"));
    if (-[MTEpisode backCatalog](self, "backCatalog"))
    {
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backCatalog"));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("backCatalog"));
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backCatalog"));
    }
    v24 = !v19;
    if ((_DWORD)v5 != 1)
      v24 = 1;
    if ((v24 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[MTEpisode setLastUserMarkedAsPlayedDate:](self, "setLastUserMarkedAsPlayedDate:");
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[MTEpisode setPlayStateLastModifiedDate:](self, "setPlayStateLastModifiedDate:");
  }
}

+ (void)episodeUuidForGUID:(id)a3 feedURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length"))
  {
    if (objc_msgSend(v8, "length"))
      +[MTEpisode predicateForEpisodeGuid:onFeedURL:](MTEpisode, "predicateForEpisodeGuid:onFeedURL:", v7, v8);
    else
      +[MTEpisode predicateForEpisodeGuid:](MTEpisode, "predicateForEpisodeGuid:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTDB sharedInstance](MTDB, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__MTEpisode_Library__episodeUuidForGUID_feedURL_completion___block_invoke;
    v15[3] = &unk_1E54D3248;
    v16 = v12;
    v17 = v10;
    v18 = v9;
    v13 = v10;
    v14 = v12;
    objc_msgSend(v14, "performBlock:", v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __60__MTEpisode_Library__episodeUuidForGUID_feedURL_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v2 = a1[5];
  v8[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsInEntity:predicate:propertiesToFetch:limit:", CFSTR("MTEpisode"), v2, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)updateUPPTimestamp
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[MTEpisode setMetadataTimestamp:](self, "setMetadataTimestamp:");
}

- (BOOL)isInUserEpisodes
{
  MTEpisode *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[MTEpisode podcastUuid](self, "podcastUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisode podcast](v2, "podcast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v3, 0, objc_msgSend(v4, "deletePlayedEpisodesResolvedValue"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "evaluateWithObject:", v2);

  return (char)v2;
}

+ (id)userDefaultPropertiesAffectingPredicates
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("MTPodcastDeletePlayedEpisodesDefaultKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesWithGlobalLimitSetting
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %ld"), CFSTR("podcast"), CFSTR("episodeLimit"), 0x100000001);
}

+ (id)predicateForEpisodesOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  return (id)objc_msgSend(a1, "predicateForLimittedEpisodesOnPodcastUuid:determinedByLimit:deletePlayedEpisodes:", a3, 0, a4);
}

+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuids:includeNonAudioEpisodes:", a3, 1);
}

+ (id)predicateForHiddenPodcastForEpisodeUuids:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "predicateForEpisodeUuids:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHidden");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NOT");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForBookmarkedEpisodesOnPodcastUuid:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isBookmarked"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForDownloadedEpisodesOnPodcastUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForAllEpisodesIncludingHiddenOnPodcastUuid:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@)"), CFSTR("podcastUuid"), a3);
}

+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("podcastUuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    +[MTEpisode predicateForAudio:](MTEpisode, "predicateForAudio:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "AND:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  +[MTEpisode predicateForAllEpisodes](MTEpisode, "predicateForAllEpisodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AND:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForAllEpisodesOnPodcast:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForAllEpisodesOnPodcast:includeNonAudioEpisodes:", a3, 1);
}

+ (id)predicateForAllEpisodesOnPodcast:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = %@)"), CFSTR("podcast"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    +[MTEpisode predicateForAudio:](MTEpisode, "predicateForAudio:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AND:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)predicateForLibraryEpisodesOnPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "predicateForAllBookmarkedEpisodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllBookmarksMigrationRecoveredEpisodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "OR:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OR:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "AND:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForNilLastDatePlayed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNilValueForKey:", CFSTR("lastDatePlayed"));
}

+ (id)predicateForNonNilLastDatePlayed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNonNilValueForKey:", CFSTR("lastDatePlayed"));
}

+ (id)predicateForNilLastUserMarkedAsPlayedDate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNilValueForKey:", CFSTR("lastUserMarkedAsPlayedDate"));
}

+ (id)predicateForNonNilLastUserMarkedAsPlayedDate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNonNilValueForKey:", CFSTR("lastUserMarkedAsPlayedDate"));
}

+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID:(id)a3 subscriptionState:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDerivedEntitlementStateFree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForNotEntitlementState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AND:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForPriceType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(a1, "_predicateForNotEntitlementState:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AND:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "OR:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "predicateForDerivedEntitlementStateFree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForNotEntitlementState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForDerivedEntitlementStateEntitled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForNotEntitlementState:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForDerivedEntitlementStateUnentitled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForNotEntitlementState:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "AND:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "OR:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OR:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForDerivedEntitlementStateFree
{
  return (id)objc_msgSend(a1, "predicateForNotPriceType:", 2);
}

+ (id)predicateForDerivedEntitlementStateEntitled
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForPodcastPaidSubscriptionActive:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPriceType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForDerivedEntitlementStateUnentitled
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForPodcastPaidSubscriptionActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPriceType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPodcastPaidSubscriptionActive:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K != NULL && %K.%K.%K = %@"), CFSTR("podcast"), CFSTR("channel"), CFSTR("podcast"), CFSTR("channel"), CFSTR("subscriptionActive"), &unk_1E5539530);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == NULL || %K.%K.%K = %@"), CFSTR("podcast"), CFSTR("channel"), CFSTR("podcast"), CFSTR("channel"), CFSTR("subscriptionActive"), &unk_1E5539548);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForSubscriptionOnly
{
  return (id)objc_msgSend((id)objc_opt_class(), "_predicateForPriceType:forPriceTypeKey:excluding:", 2, CFSTR("freePriceType"), 0);
}

+ (id)predicateForRSSEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  NSPersistentStringForMTEpisodePriceType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSPersistentStringForMTEpisodePriceType(1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("(%K == %@) || (%K == %@) || (%K == NULL)"), CFSTR("priceType"), v3, CFSTR("priceType"), v4, CFSTR("priceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAllEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
}

+ (id)predicateForPodcastIsNotHiddenNotImplicitlyFollowed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("podcast.%K = 0"), CFSTR("isHiddenOrImplicitlyFollowed"));
}

+ (id)predicateForPodcastIsSerial:(BOOL)a3
{
  const __CFString *v3;

  v3 = CFSTR("episodic");
  if (a3)
    v3 = CFSTR("serial");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("podcast.%K = %@"), CFSTR("showTypeInFeed"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForSuppressAutoDownload:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("suppressAutoDownload"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForIsNew:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isNew"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForSentNotification:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sentNotification"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForExplicit:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("explicit"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForUnplayedTabFlag:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("unplayedTab"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForUserEpisode:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("userEpisode"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAllBookmarkedEpisodes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isBookmarked"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForAllUnbookmarkedEpisodes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isBookmarked"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForHasAnyVisualPlayState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForNotUnplayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForIsBackCatalogItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "NOT");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForNotUnplayed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("playState"), &unk_1E5539578);
}

+ (id)predicateForEpisodesOnUnplayedTab
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForUnplayedTabFlag:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForUserEpisodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForUserEpisode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodesInSearchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "predicateForBookmarkedEpisodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsSubscribed:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "OR:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForBookmarkedEpisodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForAllBookmarkedEpisodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForUnbookmarkedEpisodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForAllUnbookmarkedEpisodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForBookmarksMigrationRecoveredEpisodesOnPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "predicateForAllBookmarksMigrationRecoveredEpisodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForAllBookmarksMigrationRecoveredEpisodes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isBookmarksMigrationRecoveredEpisode"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForListenNowForPodcastUuid:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("listenNowEpisode"), MEMORY[0x1E0C9AAB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_feature_enabled_unfollowed_shows_in_up_next())
    objc_msgSend(a1, "predicateForPodcastIsNotHidden");
  else
    objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "AND:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForListenNowLatestEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "predicateForFeedDeleted:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsSubscribed:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEntitledEpisodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AND:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForCategoryPageFromYourShows:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __68__MTEpisode_NSPredicate__predicateForCategoryPageFromYourShows_ctx___block_invoke;
  v20 = &unk_1E54D3E40;
  v21 = v6;
  v22 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v17);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("podcast"), v9, v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEntitledEpisodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisuallyPlayed:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "AND:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "AND:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __68__MTEpisode_NSPredicate__predicateForCategoryPageFromYourShows_ctx___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectIDForURIRepresentation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

+ (id)predicateForPubDateLimit:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "predicateForEpisodesPublishedThisWeek", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "predicateForEpisodesPublishedLastTwoWeeks", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "predicateForEpisodesPublishedThisMonth", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)predicateForHLS
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K ENDSWITH '.movpkg'"), CFSTR("assetURL"));
}

+ (id)predicateForNonHLS
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "predicateForHLS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "NOT");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicateForHLSDownloadedExcludeHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForHLS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForNonHLSDownloadedExcludeHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForNonHLS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForVideo:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("video"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAudio:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("audio"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForMetadataFirstSyncEligible:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("metadataFirstSyncEligible"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodeGuid:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("guid"), a3);
}

+ (id)predicateForEpisodeGuids:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("guid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForFeedURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K = %@"), CFSTR("podcast"), CFSTR("feedURL"), a3);
}

+ (id)predicateForFeedURLs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K.%K in %@"), CFSTR("podcast"), CFSTR("feedURL"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPersistentId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("persistentID"), a3);
}

+ (id)predicateForPersistentIds:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("persistentID"), a3);
}

+ (id)predicateForHasValidPersistentId:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND (%K > %@ OR %K < %@)"), CFSTR("persistentID"), CFSTR("persistentID"), &unk_1E5539548, CFSTR("persistentID"), &unk_1E5539548);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL OR %K == %@"), CFSTR("persistentID"), CFSTR("persistentID"), &unk_1E5539548, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForEpisodeTitle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("title"), a3);
}

+ (id)predicateForHasNonEmptyEnclosureURL
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@"), CFSTR("enclosureURL"), CFSTR("enclosureURL"), &stru_1E5500770);
}

+ (id)predicateForEpisodesImportedAfterDate:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanDate:", CFSTR("importDate"), a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForEpisodeType:(int64_t)a3
{
  void *v3;
  __CFString **v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case 2:
      v3 = (void *)MEMORY[0x1E0CB3880];
      v4 = kEpisodeTypeBonus;
LABEL_7:
      objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K ==[c] %@"), CFSTR("episodeType"), *v4, v6, v7, v8);
      goto LABEL_8;
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3880];
      v4 = kEpisodeTypeTrailer;
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL OR (%K !=[c] %@ AND %K !=[c] %@)"), CFSTR("episodeType"), CFSTR("episodeType"), CFSTR("trailer"), CFSTR("episodeType"), CFSTR("bonus"));
LABEL_8:
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

+ (id)predicateForEpisodeTypeFilter:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v5 = 0;
      goto LABEL_6;
    case 2:
      v5 = 1;
      goto LABEL_6;
    case 3:
      v5 = 2;
LABEL_6:
      objc_msgSend(a1, "predicateForEpisodeType:", v5);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v3 = (void *)v4;
      return v3;
    case 4:
      objc_msgSend(a1, "predicateForEpisodeType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "predicateForEpisodeType:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "OR:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 5:
      objc_msgSend(a1, "predicateForEpisodeType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "NOT");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      break;
    case 6:
      objc_msgSend(a1, "predicateForEpisodeType:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "predicateForHasSomeSeasonNumberWithNoEpisodeNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "AND:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "NOT");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a4)
  {
    objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForRecentlyPlayed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AND:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForPlayStateManuallySet:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "AND:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForIsFromiTunesSync:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "AND:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (id)predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForIsFromiTunesSync:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  return (id)objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:episodeLimit:deletePlayedEpisodes:", a3, 0, a4);
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5
{
  return (id)objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", a3, a4, a5, 0);
}

+ (id)predicateForEpisodesInFeedForPodcastUuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForFeedDeleted:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPlaylistEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("playlists"));
}

+ (id)_dateWithOffset:(id)a3 fromDate:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v9, "components:fromDate:", 28, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "day");
  v12 = objc_msgSend(v10, "month");
  v13 = objc_msgSend(v10, "year");
  v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v14, "setDay:", v11);
  objc_msgSend(v14, "setMonth:", v12);
  objc_msgSend(v14, "setYear:", v13);
  objc_msgSend(v9, "dateFromComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (id)objc_opt_new();
  objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v5, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForEpisodesWithUnsatisfiedAvailabilityDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "predicateForEpisodesPublishedThisWeek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("firstTimeAvailableAsPaid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %K"), CFSTR("pubDate"), CFSTR("firstTimeAvailableAsPaid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %K"), CFSTR("firstTimeAvailable"), CFSTR("pubDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %K"), CFSTR("firstTimeAvailable"), CFSTR("firstTimeAvailableAsPaid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NOT");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "AND:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "AND:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "OR:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByGlobalLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "predicateForAutomaticallyDownloadedEpisodesExcludedByShowLimitSettings:excludeHidden:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesWithGlobalLimitSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((os_feature_enabled_serial_sort_auto_downloads() & 1) == 0)
  {
    objc_msgSend(a1, "predicateForPodcastIsSerial:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "AND:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByShowLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  objc_msgSend(a1, "predicateForEpisodesDeterminedByLimitSettings:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "NOT");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloadBehavior:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloadBehavior:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OR:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "NOT");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForAllUnbookmarkedEpisodes](MTEpisode, "predicateForAllUnbookmarkedEpisodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AND:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "AND:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "AND:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForEpisodesPriceChangedAfterOffset:(id)a3 fromDate:(id)a4
{
  void *v4;
  void *v5;

  +[MTEpisode _dateWithOffset:fromDate:](MTEpisode, "_dateWithOffset:fromDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("priceTypeChangedDate"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodesPublishedAfterOffset:(id)a3 fromDate:(id)a4
{
  void *v4;
  void *v5;

  +[MTEpisode _dateWithOffset:fromDate:](MTEpisode, "_dateWithOffset:fromDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("pubDate"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodesPublishedToday
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesPublishedOnDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesPublishedOnDate:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForEpisodesPublishedAfterOffset:fromDate:", 0, a3);
}

+ (id)predicateForEpisodesPriceTypeChangedThisWeek
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setWeekOfYear:", -1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesPriceChangedAfterOffset:fromDate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodesPublishedThisWeek
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesPublishedThisWeekWithTodayDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesPublishedThisWeekWithTodayDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setWeekOfYear:", -1);
  objc_msgSend(a1, "predicateForEpisodesPublishedAfterOffset:fromDate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForEpisodesPublishedLastTwoWeeks
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesPublishedLastTwoWeeksWithTodayDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesPublishedLastTwoWeeksWithTodayDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setWeekOfYear:", -2);
  objc_msgSend(a1, "predicateForEpisodesPublishedAfterOffset:fromDate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForEpisodesPublishedThisMonth
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEpisodesPublishedThisMonthWithTodayDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodesPublishedAfterDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanDate:", CFSTR("firstTimeAvailable"), a3);
}

+ (id)predicateForEpisodesPublishedBeforeDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("firstTimeAvailable"), a3);
}

+ (id)predicateForEpisodesWithinLevel:(unint64_t)a3
{
  int v4;
  __CFString **v5;

  v4 = os_feature_enabled_serial_sort_auto_downloads();
  v5 = kEpisodeShowTypeSpecificLevel;
  if (!v4)
    v5 = kEpisodeLevel;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %ld"), *v5, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForEpisodesPublishedThisMonthWithTodayDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setMonth:", -1);
  objc_msgSend(a1, "predicateForEpisodesPublishedAfterOffset:fromDate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForEpisodesInStationShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "predicateForStationEligibleEpisodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K = %@"), CFSTR("settings"), CFSTR("uuid"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "AND:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__MTEpisode_NSPredicate__predicateForUserEpisodesOnPodcastUuid_ctx___block_invoke;
  v12[3] = &unk_1E54D13D0;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  objc_msgSend(a1, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v9, 0, *((unsigned __int8 *)v17 + 24), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __68__MTEpisode_NSPredicate__predicateForUserEpisodesOnPodcastUuid_ctx___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForUuid:entityName:", *(_QWORD *)(a1 + 40), CFSTR("MTPodcast"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "deletePlayedEpisodesResolvedValue");

}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__MTEpisode_NSPredicate__predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx___block_invoke;
  v12[3] = &unk_1E54D13D0;
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:deletePlayedEpisodes:", v9, *((unsigned __int8 *)v17 + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __77__MTEpisode_NSPredicate__predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForUuid:entityName:", *(_QWORD *)(a1 + 40), CFSTR("MTPodcast"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "deletePlayedEpisodesResolvedValue");

}

+ (id)predicateForStoreIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MTStoreIdentifier isEmptyNumber:](MTStoreIdentifier, "isEmptyNumber:", v3))
    objc_msgSend(MEMORY[0x1E0CB3880], "falsePredicate");
  else
    +[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForEpisodeStoreTrackId:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("storeTrackId"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodeStoreTrackIds:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mt_filter:", &__block_literal_global_24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("storeTrackId"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__MTEpisode_NSPredicate__predicateForEpisodeStoreTrackIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MTStoreIdentifier isEmptyNumber:](MTStoreIdentifier, "isEmptyNumber:", a2) ^ 1;
}

+ (id)predicateForEpisodeGuid:(id)a3 onPodcastUuid:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("guid"), a3, CFSTR("podcastUuid"), a4);
}

+ (id)predicateForEpisodeTitle:(id)a3 onPodcastUuid:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("title"), a3, CFSTR("podcastUuid"), a4);
}

+ (id)predicateForHasEpisodeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), CFSTR("episodeNumber"));
}

+ (id)predicateForHasSeasonNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), CFSTR("seasonNumber"));
}

+ (id)predicateForSeasonNumber:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K = NULL OR %K = 0)"), CFSTR("seasonNumber"), CFSTR("seasonNumber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("seasonNumber"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)predicateForEpisodesWithSeasonNumbersOnPodcastUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[MTEpisode predicateForHasSeasonNumber](MTEpisode, "predicateForHasSeasonNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "AND:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForEpisodesWithEpisodeNumbersGreaterThan:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("episodeNumber"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:(int64_t)a3 seasonNumber:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("seasonNumber"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("episodeNumber"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AND:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("seasonNumber"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "OR:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForHasSomeSeasonNumberWithNoEpisodeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0 && (%K == 0 || %K == NULL)"), CFSTR("seasonNumber"), CFSTR("episodeNumber"), CFSTR("episodeNumber"));
}

+ (id)predicateForSeasonNumberWithNoEpisodeNumber:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@ && (%K == 0 || %K == NULL)"), CFSTR("seasonNumber"), v4, CFSTR("episodeNumber"), CFSTR("episodeNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForBookmarkedEpisodesExcludingUUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[MTEpisode predicateForAllBookmarkedEpisodes](MTEpisode, "predicateForAllBookmarkedEpisodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(%K IN %@)"), CFSTR("uuid"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForIsTopLevel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K != NULL) && (%K == %d)"), CFSTR("flags"), CFSTR("flags"), 1);
}

+ (id)predicateForIsNotTopLevel
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == NULL) || (%K == 0)"), CFSTR("flags"), CFSTR("flags"));
}

+ (id)predicateForUserSetTopLevelEpisodes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForIsTopLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForWatchBaseEpisodesIncludingOnlyAudio:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed](MTEpisode, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MTEpisode predicateForAudio:](MTEpisode, "predicateForAudio:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "AND:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)predicateForWatchRecentlyPlayed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanOrEqualToDate:", CFSTR("lastDatePlayed"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForPreviouslyPlayedHidingFutureTimestamps](MTEpisode, "predicateForPreviouslyPlayedHidingFutureTimestamps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForAudio:](MTEpisode, "predicateForAudio:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForNotPriceType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_predicateForPriceType:excluding:", a3, 1);
}

+ (id)predicateForDRMKeyRequired
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "isHLSEpisode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForDownloaded:excludeHidden:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)isHLSEpisode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForPriceType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForPriceType:", 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(a1, "assetURLIsPackagedMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)legacyPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v11 = a3;
  +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v11, a5, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForDownloadLimitForEpisodeLimit:](MTEpisode, "predicateForDownloadLimitForEpisodeLimit:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "AND:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "OR:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "AND:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  else
  {
    objc_msgSend(v14, "AND:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[MTEpisode predicateForFeedDeleted:](MTEpisode, "predicateForFeedDeleted:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "AND:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("enclosureURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "AND:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "AND:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[MTEpisode predicateForEpisodesPlayableWithoutAccount](MTEpisode, "predicateForEpisodesPlayableWithoutAccount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "AND:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v26;
  }
  if (v8)
    +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  else
    +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "AND:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 0, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "AND:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "AND:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)predicateForEpisodesThatShouldBeAutodownloadedForShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v11 = a3;
  +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v11, a5, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OR:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "AND:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForFeedDeleted:](MTEpisode, "predicateForFeedDeleted:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "AND:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("enclosureURL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "AND:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForEntitledEpisodes](MTEpisode, "predicateForEntitledEpisodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "AND:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[MTEpisode predicateForEpisodesPlayableWithoutAccount](MTEpisode, "predicateForEpisodesPlayableWithoutAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "AND:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  if (v8)
    +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  else
    +[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "AND:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "AND:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)optimizedPredicateForPlayedEpisodePreservation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v3 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForPlayed:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(a1, "predicateForIsBackCatalogItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = (void *)MEMORY[0x1E0CB3528];
    v19[0] = v9;
    objc_msgSend(a1, "predicateForPlayed:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(a1, "predicateForPlayStateManuallySet:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v16;
  }
  return v9;
}

+ (id)legacyPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  v6 = a4;
  v7 = a3;
  +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v7, a5, v6, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "NOT");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "NOT");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AND:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "AND:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notPredicateWithSubpredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "AND:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3528];
  if (v6)
  {
    +[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:", v7, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notPredicateWithSubpredicate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "AND:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "AND:", v20);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notPredicateWithSubpredicate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "AND:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)v22;
  }

  +[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "AND:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "AND:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (int64_t)bookmarksSyncType
{
  MTEpisode *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  v3 = -[MTEpisode priceType](v2, sel_priceType);
  if (v3)
  {
    v4 = v3;
    sub_1A93F8040();

  }
  v5 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  v6 = MTEpisodePriceTypeFromPersistentString(v5);

  return (unint64_t)(v6 - 2) < 3;
}

- (void)markAsBookmarked
{
  MTEpisode *v2;

  v2 = self;
  if ((-[MTEpisode isBookmarked](v2, sel_isBookmarked) & 1) == 0)
  {
    sub_1A93F72E4();
    -[MTEpisode markAsBookmarkedOnTimestamp:](v2, sel_markAsBookmarkedOnTimestamp_);
  }

}

- (void)markAsBookmarkedOnTimestamp:(double)a3
{
  double v4;
  MTEpisode *v5;

  v5 = self;
  -[MTEpisode setIsBookmarked:](v5, sel_setIsBookmarked_, 1);
  -[MTEpisode lastBookmarkedDate](v5, sel_lastBookmarkedDate);
  if (v4 < a3)
    -[MTEpisode setLastBookmarkedDate:](v5, sel_setLastBookmarkedDate_, a3);

}

- (void)markAsUnbookmarked
{
  MTEpisode *v2;

  v2 = self;
  if (-[MTEpisode isBookmarked](v2, sel_isBookmarked))
    -[MTEpisode setIsBookmarked:](v2, sel_setIsBookmarked_, 0);

}

- (NSAttributedString)attributedDescriptionFromHTML
{
  MTEpisode *v2;
  id v3;

  v2 = self;
  v3 = MTEpisode.attributedDescriptionFromHTML.getter();

  return (NSAttributedString *)v3;
}

- (void)setAttributedDescriptionFromHTML:(id)a3
{
  id v5;
  MTEpisode *v6;

  v5 = a3;
  v6 = self;
  MTEpisode.attributedDescriptionFromHTML.setter(a3);

}

+ (id)predicateForAutomaticallyDownloadedEpisodes
{
  return _sSo9MTEpisodeC18PodcastsFoundationE43predicateForAutomaticallyDownloadedEpisodesSo11NSPredicateCyFZ_0();
}

- (void)resolveAvailabilityDate
{
  MTEpisode *v2;

  v2 = self;
  MTEpisode.resolveAvailabilityDate()();

}

- (BOOL)isDownloadable
{
  return !-[MTEpisode isExternalType](self, sel_isExternalType);
}

@end
