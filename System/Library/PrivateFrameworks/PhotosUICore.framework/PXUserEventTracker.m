@implementation PXUserEventTracker

+ (PXUserEventTracker)sharedInstance
{
  if (sharedInstance_onceToken_246023 != -1)
    dispatch_once(&sharedInstance_onceToken_246023, &__block_literal_global_246024);
  return (PXUserEventTracker *)(id)sharedInstance_sharedInstance_246025;
}

void __36__PXUserEventTracker_sharedInstance__block_invoke()
{
  PXUserEventTracker *v0;
  void *v1;

  v0 = objc_alloc_init(PXUserEventTracker);
  v1 = (void *)sharedInstance_sharedInstance_246025;
  sharedInstance_sharedInstance_246025 = (uint64_t)v0;

}

- (PXUserEventTracker)init
{
  PXUserEventTracker *v2;
  PXUserEventTracker *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXUserEventTracker;
  v2 = -[PXUserEventTrackerCommon init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeLoggedOnDetailViewWillAppear = 0.0;
    v2->_timeLoggedOnMemoriesFeedWillAppear = 0.0;
    v2->_totalNumberOfRelatedJumps = 0;
    v2->_MaxDepthOfRelatedJumps = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUserEventTracker _setRelatedLookupTable:](v3, "_setRelatedLookupTable:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  }
  return v3;
}

- (void)_setRelatedLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->__relatedLookupTable, a3);
}

- (void)willViewDetailsWithCurrentContext:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "parentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[NSHashTable containsObject:](self->__relatedLookupTable, "containsObject:", v4))
      ++self->_totalNumberOfRelatedJumps;
    -[NSHashTable addObject:](self->__relatedLookupTable, "addObject:", v4);
  }
  v6 = 0;
  if (v4)
  {
    do
    {
      objc_msgSend(v4, "parentContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        ++v6;
      objc_msgSend(v4, "parentContext");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    while (v8);
  }
  self->_timeLoggedOnDetailViewWillAppear = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logSetValueForScalarKey:forKey:", v6, *MEMORY[0x1E0D725D8]);

    if (v6 > self->_MaxDepthOfRelatedJumps)
      self->_MaxDepthOfRelatedJumps = v6;
  }
}

- (void)didFinishViewingDetailsWithCurrentContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "parentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_timeLoggedOnDetailViewWillAppear != 0.0)
  {
    if (CFAbsoluteTimeGetCurrent() - self->_timeLoggedOnDetailViewWillAppear <= 5.0)
    {
      self->_timeLoggedOnDetailViewWillAppear = 0.0;
    }
    else
    {
      +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D725F8]);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "photosDataSource");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "collectionListFetchResult");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 && objc_msgSend(v8, "assetCollectionType") == 4)
        {
          v9 = objc_msgSend(MEMORY[0x1E0CD1630], "isTriggeredMemoryCategory:", objc_msgSend(v8, "category"));
          +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v9)
            v12 = CFSTR("com.apple.mobileslideshows.memories.feed.viewedTriggeredMemoriesCount");
          else
            v12 = CFSTR("com.apple.mobileslideshows.memories.feed.viewedRandomMemoriesCount");
          objc_msgSend(v10, "logAddValueForScalarKey:forKey:", 1, v12);

        }
      }
      self->_timeLoggedOnDetailViewWillAppear = 0.0;
      if (v4)
      {
        +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72600]);

      }
    }
  }
  -[NSHashTable removeObject:](self->__relatedLookupTable, "removeObject:", v14);

}

- (void)willViewMemoriesFeedView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUserEventTracker;
  -[PXUserEventTrackerCommon willViewMemoriesFeedView](&v3, sel_willViewMemoriesFeedView);
  self->_timeLoggedOnMemoriesFeedWillAppear = CFAbsoluteTimeGetCurrent();
}

- (void)didFinishViewingMemoriesFeedView
{
  double v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = CFAbsoluteTimeGetCurrent() - self->_timeLoggedOnDetailViewWillAppear;
  if (v3 > 5.0)
  {
    +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72788]);

  }
  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logPushValueForDistributionKey:forKey:", *MEMORY[0x1E0D72780], v3);

  v6.receiver = self;
  v6.super_class = (Class)PXUserEventTracker;
  -[PXUserEventTrackerCommon didFinishViewingMemoriesFeedView](&v6, sel_didFinishViewingMemoriesFeedView);
}

- (void)didViewDetailsForAssetCollection:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D725E8]);

  if (objc_msgSend(v5, "assetCollectionType") == 4 && (objc_msgSend(v5, "isTransient") & 1) == 0)
  {
    +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72758]);

  }
}

- (void)didPlayMovieForAssetCollection:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "assetCollectionType") == 4)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CD1630], "isTriggeredMemoryCategory:", objc_msgSend(v7, "category"));
    +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = CFSTR("com.apple.mobileslideshows.memories.feed.playedTriggeredMemoriesCount");
    else
      v6 = CFSTR("com.apple.mobileslideshows.memories.feed.playedRandomMemoriesCount");
    objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, v6);

  }
}

- (void)didConfirmDeleteOfMemory
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72778]);

}

- (void)didFavoriteMemory
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72770]);

}

- (void)didCreateMemoryViaAddToMemories
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72768]);

}

- (void)_resetDetailViewTraversalStatistics
{
  self->_totalNumberOfRelatedJumps = 0;
  self->_MaxDepthOfRelatedJumps = 0;
}

- (void)logInterestingMemoryNotificationSeenCount
{
  PLSAggregateDictionaryIncrementValueForScalarKey();
}

- (void)logInterestingMemoryNotificationRespondedCount
{
  PLSAggregateDictionaryIncrementValueForScalarKey();
}

- (void)didPresentOneUpFromOrigin:(int64_t)a3
{
  int64_t v3;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0x2D && ((0x3FF7FFFFFFFFuLL >> v3) & 1) != 0)
  {
    if (**((_QWORD **)&unk_1E513D4A8 + v3))
      PLSAggregateDictionaryIncrementValueForScalarKey();
  }
}

- (void)didNavigateInOneUpFromOrigin:(int64_t)a3
{
  int64_t v3;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0x2D && ((0x3FF7FFFFFFFFuLL >> v3) & 1) != 0)
  {
    if (**((_QWORD **)&unk_1E513D618 + v3))
      PLSAggregateDictionaryIncrementValueForScalarKey();
  }
}

- (BOOL)isEventSourceSenderAppearingForTheFirstTime:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "lastOperation") != 2;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)logViewCountForLogState:(unint64_t)a3
{
  _QWORD *v3;

  if (a3 == 13)
  {
    v3 = (_QWORD *)MEMORY[0x1E0D72A18];
  }
  else
  {
    if (a3 != 10)
      return;
    v3 = (_QWORD *)MEMORY[0x1E0D72678];
  }
  if (*v3)
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", *v3, 1);
}

- (void)logViewCountForLogSubState:(unint64_t)a3
{
  uint64_t v3;

  if (a3 - 8 <= 3)
  {
    v3 = **((_QWORD **)&unk_1E513D788 + a3 - 8);
    if (v3)
      -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", v3, 1);
  }
}

- (void)logViewCountForLogSubSubState:(unint64_t)a3
{
  uint64_t v3;

  if (a3 - 1 <= 3)
  {
    v3 = **((_QWORD **)&unk_1E513D7A8 + a3 - 1);
    if (v3)
      -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", v3, 1);
  }
}

- (void)logCounterValuesForLogState:(unint64_t)a3 duration:(double)a4
{
  -[PXUserEventTracker _logAggdDurationCounterForLogState:duration:](self, "_logAggdDurationCounterForLogState:duration:", a4);
  if (a3 == 4)
    -[PXUserEventTracker _logAggdRelatedJumpStatistics:totalJumpCount:](self, "_logAggdRelatedJumpStatistics:totalJumpCount:", self->_MaxDepthOfRelatedJumps, self->_totalNumberOfRelatedJumps);
}

- (void)logImpressionCountForEventSource:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = a3 - 20;
  if (a3 - 20 <= 6 && ((0x77u >> v3) & 1) != 0)
  {
    v4 = **((_QWORD **)&unk_1E513D7C8 + v3);
    if (v4)
      -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", v4, 1);
  }
}

- (void)_logAggdAddValueForScalarKey:(__CFString *)a3 value:(int64_t)a4
{
  void *v8;
  id v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUserEventTracker+UI.m"), 674, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  PLSAggregateDictionaryAddValueForScalarKey();
  if (-[PXUserEventTrackerCommon enableDetailedDebugLogging](self, "enableDetailedDebugLogging"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("********** AggD key: %@, value: %@"), a3, v9);

  }
}

- (void)_logAggdDurationCounterForLogState:(unint64_t)a3 duration:(double)a4
{
  if (-[PXUserEventTrackerCommon enableDetailedDebugLogging](self, "enableDetailedDebugLogging"))
    -[PXUserEventTracker _aggdDurationLoggingDryrun:duration:](self, "_aggdDurationLoggingDryrun:duration:", a3, a4);
  if (a3 - 3 <= 0xA)
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", **((_QWORD **)&unk_1E513D800 + a3 - 3), llround(a4));
}

- (void)_logAggdDurationCounterForLogSubState:(unint64_t)a3 duration:(double)a4
{
  if (-[PXUserEventTrackerCommon enableDetailedDebugLogging](self, "enableDetailedDebugLogging"))
    -[PXUserEventTracker _aggdDurationLoggingDryrunForSubState:duration:](self, "_aggdDurationLoggingDryrunForSubState:duration:", a3, a4);
  if (a3 - 1 <= 0xA)
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", **((_QWORD **)&unk_1E513D858 + a3 - 1), llround(a4));
}

- (void)_logAggdDurationCounterForLogSubSubState:(unint64_t)a3 duration:(double)a4
{
  if (a3 - 1 <= 3)
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", **((_QWORD **)&unk_1E513D8B0 + a3 - 1), llround(a4));
}

- (void)_logAggdRelatedJumpStatistics:(unint64_t)a3 totalJumpCount:(unint64_t)a4
{
  if (a4 | a3)
  {
    if (-[PXUserEventTrackerCommon enableDetailedDebugLogging](self, "enableDetailedDebugLogging"))
      -[PXUserEventTracker _aggdJumpCountLoggingDryrun:totalJumpCount:](self, "_aggdJumpCountLoggingDryrun:totalJumpCount:", a3, a4);
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", *MEMORY[0x1E0D72A00], a3);
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", *MEMORY[0x1E0D72618], a4);
  }
  -[PXUserEventTracker _resetDetailViewTraversalStatistics](self, "_resetDetailViewTraversalStatistics");
}

- (void)logUserDidSelectGadgetAccessoryButtonWithKey:(__CFString *)a3
{
  id v4;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, a3);

}

- (void)logForYouMemoriesFeedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72688]);

}

- (void)logForYouMemoriesDetailsCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72680]);

}

- (void)logForYouContextualMemoriesDetailsCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72670]);

}

- (void)logForYouSharedAlbumInvitationAcceptedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72638]);

}

- (void)logForYouSharedAlbumInvitationDeclinedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72640]);

}

- (void)logForYouSharedAlbumInvitationReportedAsJunkCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72648]);

}

- (void)logForYouNavigatedToSharedAlbumActivityViewFromCollageView
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72628]);

}

- (void)logForYouNavigatedToSharedAlbumActivityViewFromRecentActivityEntry
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72630]);

}

- (void)logForYouSuggestionViewedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72668]);

}

- (void)logForYouSuggestionViewed1UpCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72650]);

}

- (void)logForYouSuggestionSharedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72660]);

}

- (void)logForYouSuggestionSavedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72658]);

}

- (void)logForYouInboxViewedCount
{
  id v2;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72620]);

}

- (void)logForYouInboxItemSelectedWithType:(int64_t)a3
{
  uint64_t v3;
  id v4;

  if ((unint64_t)(a3 - 1) <= 9)
  {
    v3 = **((_QWORD **)&unk_1E513D8D0 + a3 - 1);
    if (v3)
    {
      +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, v3);

    }
  }
}

- (void)logNavigationListViewTapWithKey:(__CFString *)a3
{
  id v4;

  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logAddValueForScalarKey:forKey:", 1, a3);

}

- (void)logFirstTimeExpericeReadiness:(BOOL)a3 forLibrarySize:(int64_t)a4
{
  __CFString *v5;

  v5 = -[PXUserEventTracker _aggdKeyForFirstTimeExperienceIsReady:librarySize:](self, "_aggdKeyForFirstTimeExperienceIsReady:librarySize:", a3, a4);
  if (v5)
    -[PXUserEventTracker _logAggdAddValueForScalarKey:value:](self, "_logAggdAddValueForScalarKey:value:", v5, 1);
}

- (__CFString)_aggdKeyForFirstTimeExperienceIsReady:(BOOL)a3 librarySize:(int64_t)a4
{
  __CFString **v4;
  __CFString **v5;

  if (!a4)
    return 0;
  v4 = (__CFString **)MEMORY[0x1E0D726B8];
  if (!a3)
    v4 = (__CFString **)MEMORY[0x1E0D726A0];
  v5 = (__CFString **)MEMORY[0x1E0D72698];
  if (a3)
    v5 = (__CFString **)MEMORY[0x1E0D726B0];
  if (a4 >= 30000)
    v5 = (__CFString **)MEMORY[0x1E0D726A8];
  if (a4 >= 1000)
    v4 = v5;
  return *v4;
}

- (void)_aggdDurationLoggingDryrunForSubState:(unint64_t)a3 duration:(double)a4
{
  const __CFString *v4;

  if (a3 - 1 > 6)
    v4 = CFSTR("Invalid State For Logging");
  else
    v4 = off_1E513D920[a3 - 1];
  NSLog(CFSTR("=========== %@ : %lld seconds"), a2, v4, llround(a4));
}

- (void)_aggdDurationLoggingDryrun:(unint64_t)a3 duration:(double)a4
{
  const __CFString *v4;

  if (a3 > 8)
    v4 = CFSTR("Invalid State For Logging");
  else
    v4 = off_1E513D958[a3];
  NSLog(CFSTR("=========== %@ : %lld seconds"), a2, v4, llround(a4));
}

- (void)_aggdJumpCountLoggingDryrun:(unint64_t)a3 totalJumpCount:(unint64_t)a4
{
  NSLog(CFSTR("=========== %@ : %ld =========="), a2, CFSTR("Max Related Jump Count"), a3);
  NSLog(CFSTR("=========== %@ : %ld =========="), CFSTR("Total Related Jump Count"), a4);
}

- (NSHashTable)_relatedLookupTable
{
  return self->__relatedLookupTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__relatedLookupTable, 0);
}

@end
