@implementation PXSharedLibraryAssistantViewModel

- (PXSharedLibraryAssistantViewModel)init
{
  PXSharedLibraryAssistantViewModel *v2;
  PXSharedLibraryAssistantViewModel *v3;
  NSArray *personUUIDs;
  PXSharedLibraryParticipantDataSourceManager *v5;
  PXSharedLibraryParticipantDataSourceManager *participantDataSourceManager;
  NSArray *v7;
  NSArray *infosWithBothPeopleAndParticipants;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantViewModel;
  v2 = -[PXSharedLibraryAssistantViewModel init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    v2->_autoSharePolicy = 0;
    personUUIDs = v2->_personUUIDs;
    v2->_personUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_autoShareEnabled = 0;
    v5 = objc_alloc_init(PXSharedLibraryParticipantDataSourceManager);
    participantDataSourceManager = v3->_participantDataSourceManager;
    v3->_participantDataSourceManager = v5;

    -[PXSectionedDataSourceManager registerChangeObserver:context:](v3->_participantDataSourceManager, "registerChangeObserver:context:", v3, _PXSharedLibraryParticipantDataSourceManagerObservationContext);
    v3->_selectedRuleType = 0;
    v3->_cachedShareCounts.othersCount = *((_QWORD *)off_1E50B7ED8 + 2);
    *(_OWORD *)&v3->_cachedShareCounts.photosCount = *(_OWORD *)off_1E50B7ED8;
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    infosWithBothPeopleAndParticipants = v3->_infosWithBothPeopleAndParticipants;
    v3->_infosWithBothPeopleAndParticipants = v7;

  }
  return v3;
}

- (PXSharedLibraryRule)sharedLibraryRule
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PXSharedLibraryAssistantViewModel autoSharePolicy](self, "autoSharePolicy");
  if (v3 == 2)
  {
    -[PXSharedLibraryAssistantViewModel startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantViewModel personUUIDs](self, "personUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryRule customizedRuleWithStartDate:personUUIDs:](PXSharedLibraryRule, "customizedRuleWithStartDate:personUUIDs:", v6, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3 == 1)
  {
    +[PXSharedLibraryRule everythingRule](PXSharedLibraryRule, "everythingRule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v5 = 0;
  }
  else
  {
    -[PXSharedLibraryAssistantViewModel assetLocalIdentifiers](self, "assetLocalIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryRule manualRuleWithAssetLocalIdentifiers:](PXSharedLibraryRule, "manualRuleWithAssetLocalIdentifiers:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PXSharedLibraryRule *)v5;
}

- (id)localizedSelectedPeopleWithAdditionalPeopleCount:(int64_t *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantViewModel.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("additionalPeopleCount"));

  }
  -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXSharedLibraryAssistantViewModel personUUIDs](self, "personUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "px_localizedName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            objc_msgSend(v11, "addObject:", v17);
            if ((unint64_t)objc_msgSend(v11, "count") >= 3)
            {

              goto LABEL_20;
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_20:

    v19 = objc_msgSend(v12, "count");
    v18 = v19 - objc_msgSend(v11, "count");

    if (v18 && objc_msgSend(v11, "count") == 3)
    {
      ++v18;
      objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v20;
    }
  }
  else
  {
    v18 = 0;
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  *a3 = v18;

  return v11;
}

- (NSString)localizedParticipantList
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedLibraryAssistantViewModel participantDataSource](self, "participantDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "names");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)shareCounts
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  void *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;

  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E50B7EE0;
  -[PXSharedLibraryAssistantViewModel sharedLibrary](self, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInPreview"))
    v6 = !self->_previewIsOutdated;
  else
    v6 = 0;

  -[PXSharedLibraryAssistantViewModel sharedLibrary](self, "sharedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isPublished"))
  {
    -[PXSharedLibraryAssistantViewModel sharedLibrary](self, "sharedLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isOwned");

  }
  else
  {
    v9 = 0;
  }

  if ((v6 | v9) == 1)
  {
    -[PXSharedLibraryAssistantViewModel sharedLibrary](self, "sharedLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "fetchItemCounts");
    }
    else
    {
      v13 = 0uLL;
      v14 = 0;
    }
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var2 = v14;

  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_cachedShareCounts.photosCount;
    retstr->var2 = self->_cachedShareCounts.othersCount;
  }
  return result;
}

- (int64_t)shouldShowPeopleState
{
  int64_t result;
  void *v4;
  id v5;
  void *v6;
  PXPeopleProgressManager *v7;
  _BOOL4 v8;
  int64_t v9;

  result = self->_shouldShowPeopleState;
  if (!result)
  {
    -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[PXPeopleProgressManager initWithPhotoLibrary:]([PXPeopleProgressManager alloc], "initWithPhotoLibrary:", v6);
      v8 = -[PXPeopleProgressManager featureUnlocked](v7, "featureUnlocked");
      v9 = 1;
      if (!v8)
        v9 = 2;
      self->_shouldShowPeopleState = v9;

    }
    else
    {
      self->_shouldShowPeopleState = 2;
    }

    return self->_shouldShowPeopleState;
  }
  return result;
}

- (NSArray)emailAddresses
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedLibraryAssistantViewModel participantDataSource](self, "participantDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)phoneNumbers
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedLibraryAssistantViewModel participantDataSource](self, "participantDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantViewModel;
  -[PXSharedLibraryAssistantViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)performChanges:(id)a3 shareCountsCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id shareCountsCompletionHandler;
  void (**v9)(void);
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  shareCountsCompletionHandler = self->_shareCountsCompletionHandler;
  self->_shareCountsCompletionHandler = v7;

  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantViewModel;
  -[PXSharedLibraryAssistantViewModel performChanges:](&v11, sel_performChanges_, v6);

  v9 = (void (**)(void))self->_shareCountsCompletionHandler;
  if (v9)
  {
    v9[2]();
    v10 = self->_shareCountsCompletionHandler;
    self->_shareCountsCompletionHandler = 0;

  }
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantViewModel;
  -[PXSharedLibraryAssistantViewModel didPerformChanges](&v3, sel_didPerformChanges);
  if (!self->_performingInitialChanges && !self->_hasChangedUserInputValues)
    self->_hasChangedUserInputValues = (-[PXSharedLibraryAssistantViewModel currentChanges](self, "currentChanges") & 0x6AE) != 0;
  -[PXSharedLibraryAssistantViewModel _recalculateShareCountsIfNeeded](self, "_recalculateShareCountsIfNeeded");
  -[PXSharedLibraryAssistantViewModel _recalculateSuggestedStartDateIfNeeded](self, "_recalculateSuggestedStartDateIfNeeded");
}

- (void)performInitialChanges:(id)a3
{
  id v4;
  BOOL performingInitialChanges;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  performingInitialChanges = self->_performingInitialChanges;
  self->_performingInitialChanges = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PXSharedLibraryAssistantViewModel_performInitialChanges___block_invoke;
  v7[3] = &unk_1E5144C70;
  v8 = v4;
  v6 = v4;
  -[PXSharedLibraryAssistantViewModel performChanges:](self, "performChanges:", v7);
  self->_performingInitialChanges = performingInitialChanges;

}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setAutoSharePolicy:(int64_t)a3
{
  if (self->_autoSharePolicy != a3)
  {
    self->_autoSharePolicy = a3;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 128);
    -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
    -[PXSharedLibraryAssistantViewModel _didChangeShareCountRelatedProperty](self, "_didChangeShareCountRelatedProperty");
  }
}

- (void)setStartDate:(id)a3
{
  NSDate *v4;
  char v5;
  NSDate *v6;
  NSDate *startDate;
  NSDate *v8;

  v8 = (NSDate *)a3;
  v4 = self->_startDate;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDate isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDate *)-[NSDate copy](v8, "copy");
      startDate = self->_startDate;
      self->_startDate = v6;

      -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 4);
      -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
      -[PXSharedLibraryAssistantViewModel _didChangeShareCountRelatedProperty](self, "_didChangeShareCountRelatedProperty");
    }
  }

}

- (void)setPersonUUIDs:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *personUUIDs;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantViewModel.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs"));

    v5 = 0;
  }
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  personUUIDs = self->_personUUIDs;
  self->_personUUIDs = v6;

  -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 8);
  -[PXSharedLibraryAssistantViewModel _didChangeSuggestedStartDateRelatedProperty](self, "_didChangeSuggestedStartDateRelatedProperty");
  -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
  -[PXSharedLibraryAssistantViewModel _didChangeShareCountRelatedProperty](self, "_didChangeShareCountRelatedProperty");

}

- (void)setParticipantsImage:(id)a3
{
  UIImage *v4;
  char v5;
  UIImage *v6;
  UIImage *participantsImage;
  UIImage *v8;

  v8 = (UIImage *)a3;
  v4 = self->_participantsImage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImage isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)-[UIImage copy](v8, "copy");
      participantsImage = self->_participantsImage;
      self->_participantsImage = v6;

      -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setAssetLocalIdentifiers:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v5 = self->_assetLocalIdentifiers;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetLocalIdentifiers, a3);
      -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 512);
      -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
      -[PXSharedLibraryAssistantViewModel _didChangeShareCountRelatedProperty](self, "_didChangeShareCountRelatedProperty");
    }
  }

}

- (void)setAutoShareEnabled:(BOOL)a3
{
  if (self->_autoShareEnabled != a3)
  {
    self->_autoShareEnabled = a3;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsCancelingAssistant:(BOOL)a3
{
  if (self->_isCancelingAssistant != a3)
  {
    self->_isCancelingAssistant = a3;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setParticipantDataSource:(id)a3
{
  id v5;
  PXSharedLibraryParticipantDataSourceManager *participantDataSourceManager;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantViewModel.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participantDataSource"));

  }
  participantDataSourceManager = self->_participantDataSourceManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PXSharedLibraryAssistantViewModel_setParticipantDataSource___block_invoke;
  v9[3] = &unk_1E5144C98;
  v10 = v5;
  v7 = v5;
  -[PXSharedLibraryParticipantDataSourceManager performChanges:](participantDataSourceManager, "performChanges:", v9);

}

- (PXSharedLibraryParticipantDataSource)participantDataSource
{
  return (PXSharedLibraryParticipantDataSource *)-[PXSectionedDataSourceManager dataSource](self->_participantDataSourceManager, "dataSource");
}

- (void)setSharedLibrary:(id)a3
{
  PXSharedLibrary *v5;
  int v6;
  PXSharedLibrary *v7;

  v5 = (PXSharedLibrary *)a3;
  if (self->_sharedLibrary != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_sharedLibrary, a3);
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 64);
    v6 = -[PXSharedLibrary isInPreview](self->_sharedLibrary, "isInPreview");
    v5 = v7;
    if (v6)
      self->_hasChangedUserInputValues = 1;
  }

}

- (void)setSourceLibraryInfo:(id)a3
{
  PXSharedLibrarySourceLibraryInfo *v5;
  PXSharedLibrarySourceLibraryInfo *v6;

  v5 = (PXSharedLibrarySourceLibraryInfo *)a3;
  if (self->_sourceLibraryInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sourceLibraryInfo, a3);
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 256);
    v5 = v6;
  }

}

- (void)setSelectedRuleType:(int64_t)a3
{
  if (self->_selectedRuleType != a3)
  {
    self->_selectedRuleType = a3;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 1024);
    -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
    -[PXSharedLibraryAssistantViewModel _didChangeShareCountRelatedProperty](self, "_didChangeShareCountRelatedProperty");
  }
}

- (void)setInfosWithBothPeopleAndParticipants:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *infosWithBothPeopleAndParticipants;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_infosWithBothPeopleAndParticipants;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      infosWithBothPeopleAndParticipants = self->_infosWithBothPeopleAndParticipants;
      self->_infosWithBothPeopleAndParticipants = v6;

      -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 0x4000);
    }
  }

}

- (void)_didChangePreviewRelatedProperty
{
  void *v3;
  int v4;

  if (!self->_performingInitialChanges && !self->_previewIsOutdated)
  {
    -[PXSharedLibraryAssistantViewModel sharedLibrary](self, "sharedLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInPreview");

    if (v4)
      self->_previewIsOutdated = 1;
  }
}

- (void)_didChangeShareCountRelatedProperty
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)off_1E50B7ED8;
  v3 = *((_QWORD *)off_1E50B7ED8 + 2);
  -[PXSharedLibraryAssistantViewModel _setCachedShareCounts:](self, "_setCachedShareCounts:", &v2);
}

- (void)_setCachedShareCounts:(id *)a3
{
  __int128 v5;

  if (self->_cachedShareCounts.photosCount != a3->var0
    || self->_cachedShareCounts.videosCount != a3->var1
    || self->_cachedShareCounts.othersCount != a3->var2)
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_cachedShareCounts.othersCount = a3->var2;
    *(_OWORD *)&self->_cachedShareCounts.photosCount = v5;
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)_recalculateShareCountsIfNeeded
{
  uint64_t v3;
  BOOL v4;
  id shareCountsCompletionHandler;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, __int128 *);
  void *v15;
  PXSharedLibraryAssistantViewModel *v16;
  id v17;

  v3 = -[PXSharedLibraryAssistantViewModel currentChanges](self, "currentChanges");
  if ((objc_msgSend((id)objc_opt_class(), "shareCountChangeDescriptors") & v3) != 0)
  {
    v4 = self->_cachedShareCounts.photosCount == 0x7FFFFFFFFFFFFFFFLL
      || self->_cachedShareCounts.videosCount == 0x7FFFFFFFFFFFFFFFLL;
    if (v4 || self->_cachedShareCounts.othersCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      shareCountsCompletionHandler = self->_shareCountsCompletionHandler;
      if (shareCountsCompletionHandler)
      {
        v7 = _Block_copy(shareCountsCompletionHandler);
        v8 = self->_shareCountsCompletionHandler;
        self->_shareCountsCompletionHandler = 0;

      }
      else
      {
        v7 = 0;
      }
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke;
      v15 = &unk_1E5144CE8;
      v16 = self;
      v17 = v7;
      v9 = v7;
      v10 = _Block_copy(&v12);
      v11 = -[PXSharedLibraryAssistantViewModel autoSharePolicy](self, "autoSharePolicy", v12, v13, v14, v15, v16);
      switch(v11)
      {
        case 2:
          -[PXSharedLibraryAssistantViewModel _recalculateCustomShareCountsWithCompletion:](self, "_recalculateCustomShareCountsWithCompletion:", v10);
          break;
        case 1:
          -[PXSharedLibraryAssistantViewModel _recalculateEverythingShareCountsWithCompletion:](self, "_recalculateEverythingShareCountsWithCompletion:", v10);
          break;
        case 0:
          -[PXSharedLibraryAssistantViewModel _recalculateManualSelectionShareCountsWithCompletion:](self, "_recalculateManualSelectionShareCountsWithCompletion:", v10);
          break;
      }

    }
  }
}

- (void)_recalculateEverythingShareCountsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:", v4);

}

- (void)_recalculateCustomShareCountsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXSharedLibraryAssistantViewModel startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantViewModel personUUIDs](self, "personUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 || objc_msgSend(v5, "count"))
  {
    -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchEstimatedAssetsCountsForStartDate:personUUIDs:completion:", v4, v6, v8);

  }
}

- (void)_recalculateManualSelectionShareCountsWithCompletion:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void (*v7)(_QWORD *, __int128 *);
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = 0uLL;
  v11 = 0;
  v4 = a3;
  -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantViewModel assetLocalIdentifiers](self, "assetLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "assetsCountsForAssetLocalIdentifiers:", v6);
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
  }

  v7 = (void (*)(_QWORD *, __int128 *))v4[2];
  v8 = v10;
  v9 = v11;
  v7(v4, &v8);

}

- (void)_didChangeSuggestedStartDateRelatedProperty
{
  -[PXSharedLibraryAssistantViewModel setSuggestedStartDate:](self, "setSuggestedStartDate:", 0);
}

- (void)setSuggestedStartDate:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToDate:", self->_suggestedStartDate) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedStartDate, a3);
    -[PXSharedLibraryAssistantViewModel signalChange:](self, "signalChange:", 0x2000);
  }

}

- (void)_recalculateSuggestedStartDateIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = -[PXSharedLibraryAssistantViewModel currentChanges](self, "currentChanges");
  if ((objc_msgSend((id)objc_opt_class(), "suggestedStartDateChangeDescriptors") & v3) != 0
    && !self->_suggestedStartDate)
  {
    objc_initWeak(&location, self);
    -[PXSharedLibraryAssistantViewModel sourceLibraryInfo](self, "sourceLibraryInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantViewModel personUUIDs](self, "personUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke;
    v6[3] = &unk_1E5144D38;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "fetchSuggestedStartDateForPersonUUIDs:completion:", v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)_PXSharedLibraryParticipantDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantViewModel.m"), 461, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PXSharedLibraryAssistantViewModel_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5144D60;
    v12[4] = self;
    -[PXSharedLibraryAssistantViewModel performChanges:](self, "performChanges:", v12);
    -[PXSharedLibraryAssistantViewModel _didChangePreviewRelatedProperty](self, "_didChangePreviewRelatedProperty");
  }

}

- (BOOL)hasChangedUserInputValues
{
  return self->_hasChangedUserInputValues;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)autoSharePolicy
{
  return self->_autoSharePolicy;
}

- (BOOL)autoShareEnabled
{
  return self->_autoShareEnabled;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (UIImage)participantsImage
{
  return self->_participantsImage;
}

- (PXSharedLibraryParticipantDataSourceManager)participantDataSourceManager
{
  return self->_participantDataSourceManager;
}

- (PXSharedLibrary)sharedLibrary
{
  return self->_sharedLibrary;
}

- (PXSharedLibrarySourceLibraryInfo)sourceLibraryInfo
{
  return self->_sourceLibraryInfo;
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (int64_t)selectedRuleType
{
  return self->_selectedRuleType;
}

- (BOOL)isCancelingAssistant
{
  return self->_isCancelingAssistant;
}

- (NSArray)infosWithBothPeopleAndParticipants
{
  return self->_infosWithBothPeopleAndParticipants;
}

- (BOOL)previewIsOutdated
{
  return self->_previewIsOutdated;
}

- (void)setShouldShowPeopleState:(int64_t)a3
{
  self->_shouldShowPeopleState = a3;
}

- (NSDate)suggestedStartDate
{
  return self->_suggestedStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStartDate, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceLibraryInfo, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_participantsImage, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_shareCountsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_participantDataSourceManager, 0);
}

uint64_t __66__PXSharedLibraryAssistantViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 32);
}

void __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke_2;
  v8[3] = &unk_1E5144D10;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v6 = v3;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  objc_msgSend(WeakRetained, "performChanges:", v8);

  objc_destroyWeak(&v11);
}

void __75__PXSharedLibraryAssistantViewModel__recalculateSuggestedStartDateIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "earlierDate:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSuggestedStartDate:", v4);

  if (v3)
}

void __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke(uint64_t a1, __int128 *a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5144CC0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v5 = v2;
  objc_msgSend(v4, "performChanges:", v3);

}

uint64_t __68__PXSharedLibraryAssistantViewModel__recalculateShareCountsIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "_setCachedShareCounts:", &v4);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__PXSharedLibraryAssistantViewModel_setParticipantDataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceDataSourceWithDataSource:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__PXSharedLibraryAssistantViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (unint64_t)shareCountChangeDescriptors
{
  return 2764;
}

+ (unint64_t)suggestedStartDateChangeDescriptors
{
  return 136;
}

@end
