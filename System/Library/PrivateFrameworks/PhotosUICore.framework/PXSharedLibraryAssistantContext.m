@implementation PXSharedLibraryAssistantContext

- (id)sharedLibraryStepContextForStepContextIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext+Internal.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepContextIdentifier"));

  }
  -[PXSharedLibraryAssistantContext stepContextIdentifiersToContexts](self, "stepContextIdentifiersToContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierIntroSetup")))
    {
      -[PXSharedLibraryAssistantContext _setupIntroStepContextWithIdentifier:](self, "_setupIntroStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierIntroReply")))
    {
      -[PXSharedLibraryAssistantContext _replyIntroStepContextWithIdentifier:](self, "_replyIntroStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierParticipants")))
    {
      -[PXSharedLibraryAssistantContext _participantsStepContextWithIdentifier:](self, "_participantsStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierRules")))
    {
      -[PXSharedLibraryAssistantContext _rulesStepContextWithIdentifier:](self, "_rulesStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierDateSelection")))
    {
      -[PXSharedLibraryAssistantContext _dateSelectionStepContextWithIdentifier:](self, "_dateSelectionStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierPeopleSelection")))
    {
      -[PXSharedLibraryAssistantContext _peopleSelectionStepContextWithIdentifier:](self, "_peopleSelectionStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierPreview")))
    {
      -[PXSharedLibraryAssistantContext _summaryStepContextWithIdentifier:](self, "_summaryStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewReplyDirect")))
    {
      -[PXSharedLibraryAssistantContext _reviewReplyDirectStepContextWithIdentifier:](self, "_reviewReplyDirectStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewReplyPreview")))
    {
      -[PXSharedLibraryAssistantContext _reviewReplyPreviewStepContextWithIdentifier:](self, "_reviewReplyPreviewStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierFutureRules")))
    {
      -[PXSharedLibraryAssistantContext _cameraStepContextWithIdentifier:](self, "_cameraStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect")))
    {
      -[PXSharedLibraryAssistantContext _reviewParticipantsSetupDirectStepContextWithIdentifier:](self, "_reviewParticipantsSetupDirectStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview")))
    {
      -[PXSharedLibraryAssistantContext _reviewParticipantsSetupPreviewStepContextWithIdentifier:](self, "_reviewParticipantsSetupPreviewStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierHowTo")))
    {
      -[PXSharedLibraryAssistantContext _howToStepContextWithIdentifier:](self, "_howToStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierLegacyDevicesFallback")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXSharedLibraryAssistantContext(Internal) sharedLibraryStepContextForStepContextIdentifier:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXSharedLibraryAssistantContext+Internal.m"), 101, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      -[PXSharedLibraryAssistantContext _legacyDevicesFallbackStepContextWithIdentifier:](self, "_legacyDevicesFallbackStepContextWithIdentifier:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext+Internal.m"), 104, CFSTR("Didn't build step context for identifier %@"), v5);

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);
  }

  return v7;
}

- (id)_setupIntroStepContextWithIdentifier:(id)a3
{
  id v4;
  PXSharedLibraryAssistantWelcomeViewController *v5;
  void *v6;
  void *v7;
  PXSharedLibraryAssistantWelcomeViewController *v8;
  PXAssistantStepContext *v9;

  v4 = a3;
  v5 = [PXSharedLibraryAssistantWelcomeViewController alloc];
  -[PXSharedLibraryAssistantContext legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantContext legacyDevicesRemoteController](self, "legacyDevicesRemoteController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryAssistantWelcomeViewController initWithLegacyDevicesFallbackMonitor:legacyDevicesRemoteController:](v5, "initWithLegacyDevicesFallbackMonitor:legacyDevicesRemoteController:", v6, v7);

  v9 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v8);
  -[PXAssistantStepContext performChanges:](v9, "performChanges:", &__block_literal_global_69020);

  return v9;
}

- (id)_replyIntroStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryReplyAssistantViewController *v6;
  void *v7;
  PXSharedLibraryReplyAssistantViewController *v8;
  PXAssistantStepContext *v9;
  _QWORD v11[5];

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PXSharedLibraryReplyAssistantViewController alloc];
  -[PXSharedLibraryAssistantContext legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryReplyAssistantViewController initWithViewModel:legacyDevicesFallbackMonitor:](v6, "initWithViewModel:legacyDevicesFallbackMonitor:", v5, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke;
  v11[3] = &unk_1E5144D60;
  v11[4] = self;
  objc_msgSend(v5, "performChanges:", v11);
  v9 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v8);

  -[PXAssistantStepContext performChanges:](v9, "performChanges:", &__block_literal_global_171_69019);
  return v9;
}

- (id)_participantsStepContextWithIdentifier:(id)a3
{
  id v4;
  PXSharedLibraryAssistantParticipantViewModel *v5;
  PXSharedLibraryAssistantParticipantViewController *v6;
  void *v7;
  PXSharedLibraryAssistantParticipantViewController *v8;
  PXAssistantStepContext *v9;

  v4 = a3;
  v5 = objc_alloc_init(PXSharedLibraryAssistantParticipantViewModel);
  -[PXSharedLibraryAssistantParticipantViewModel performChanges:](v5, "performChanges:", &__block_literal_global_174_69014);
  v6 = [PXSharedLibraryAssistantParticipantViewController alloc];
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryAssistantParticipantViewController initWithAssistantViewModel:participantViewModel:](v6, "initWithAssistantViewModel:participantViewModel:", v7, v5);

  v9 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v8);
  -[PXSharedLibraryAssistantContext configureParticipantListForStepContext:isReviewStep:](self, "configureParticipantListForStepContext:isReviewStep:", v9, 0);
  -[PXAssistantStepContext performChanges:](v9, "performChanges:", &__block_literal_global_180);

  return v9;
}

- (id)_rulesStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryAssistantRulesViewController *v6;
  PXAssistantStepContext *v7;

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSharedLibraryAssistantRulesViewController initWithViewModel:]([PXSharedLibraryAssistantRulesViewController alloc], "initWithViewModel:", v5);
  v7 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v6);

  -[PXAssistantStepContext performChanges:](v7, "performChanges:", &__block_literal_global_182_69013);
  return v7;
}

- (id)_dateSelectionStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryAssistantDatePickerViewController *v6;
  PXAssistantStepContext *v7;

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSharedLibraryAssistantDatePickerViewController initWithViewModel:]([PXSharedLibraryAssistantDatePickerViewController alloc], "initWithViewModel:", v5);
  v7 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v6);

  -[PXAssistantStepContext performChanges:](v7, "performChanges:", &__block_literal_global_184_69012);
  return v7;
}

- (id)_peopleSelectionStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryAssistantPeopleViewController *v6;
  PXAssistantStepContext *v7;

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSharedLibraryAssistantPeopleViewController initWithViewModel:]([PXSharedLibraryAssistantPeopleViewController alloc], "initWithViewModel:", v5);
  v7 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v6);

  -[PXAssistantStepContext performChanges:](v7, "performChanges:", &__block_literal_global_186_69011);
  return v7;
}

- (id)_summaryStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryAssistantSummaryViewController *v6;
  void *v7;
  void *v8;
  PXSharedLibraryAssistantSummaryViewController *v9;
  PXAssistantStepContext *v10;
  _QWORD v12[5];

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PXSharedLibraryAssistantSummaryViewController alloc];
  -[PXSharedLibraryAssistantContext statusProvider](self, "statusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantContext libraryFilterState](self, "libraryFilterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSharedLibraryAssistantSummaryViewController initWithViewModel:sharedLibraryStatusProvider:libraryFilterState:](v6, "initWithViewModel:sharedLibraryStatusProvider:libraryFilterState:", v5, v7, v8);

  v10 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke;
  v12[3] = &unk_1E5144D60;
  v12[4] = self;
  objc_msgSend(v5, "performChanges:", v12);
  -[PXAssistantStepContext performChanges:](v10, "performChanges:", &__block_literal_global_188);

  return v10;
}

- (id)_reviewReplyStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryReplyAssistantReviewViewController *v6;
  void *v7;
  PXSharedLibraryReplyAssistantReviewViewController *v8;
  PXAssistantStepContext *v9;
  _QWORD v11[5];

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PXSharedLibraryReplyAssistantReviewViewController alloc];
  -[PXSharedLibraryAssistantContext statusProvider](self, "statusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryReplyAssistantReviewViewController initWithViewModel:sharedLibraryStatusProvider:](v6, "initWithViewModel:sharedLibraryStatusProvider:", v5, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PXSharedLibraryAssistantContext_Internal___reviewReplyStepContextWithIdentifier___block_invoke;
  v11[3] = &unk_1E5144D60;
  v11[4] = self;
  objc_msgSend(v5, "performChanges:", v11);
  v9 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v8);

  return v9;
}

- (id)_reviewReplyDirectStepContextWithIdentifier:(id)a3
{
  void *v3;

  -[PXSharedLibraryAssistantContext _reviewReplyStepContextWithIdentifier:](self, "_reviewReplyStepContextWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_190_69009);
  return v3;
}

- (id)_reviewReplyPreviewStepContextWithIdentifier:(id)a3
{
  void *v3;

  -[PXSharedLibraryAssistantContext _reviewReplyStepContextWithIdentifier:](self, "_reviewReplyStepContextWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_191);
  return v3;
}

- (id)_cameraStepContextWithIdentifier:(id)a3
{
  id v3;
  PXSharedLibraryAssistantCameraViewController *v4;
  PXAssistantStepContext *v5;

  v3 = a3;
  v4 = objc_alloc_init(PXSharedLibraryAssistantCameraViewController);
  v5 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v3, v4);

  -[PXAssistantStepContext performChanges:](v5, "performChanges:", &__block_literal_global_193);
  return v5;
}

- (id)_howToStepContextWithIdentifier:(id)a3
{
  id v4;
  PXSharedLibraryAssistantHowToViewController *v5;
  void *v6;
  PXSharedLibraryAssistantHowToViewController *v7;
  PXAssistantStepContext *v8;

  v4 = a3;
  v5 = [PXSharedLibraryAssistantHowToViewController alloc];
  -[PXSharedLibraryAssistantContext libraryFilterState](self, "libraryFilterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSharedLibraryAssistantHowToViewController initWithLibraryFilterState:](v5, "initWithLibraryFilterState:", v6);

  v8 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v7);
  -[PXAssistantStepContext performChanges:](v8, "performChanges:", &__block_literal_global_195_69008);

  return v8;
}

- (id)_legacyDevicesFallbackStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PXSharedLibraryLegacyDevicesFallbackViewController *v7;
  PXAssistantStepContext *v8;

  v4 = a3;
  -[PXSharedLibraryAssistantContext legacyDevicesFallbackMonitor](self, "legacyDevicesFallbackMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXSharedLibraryLegacyDevicesFallbackViewController initWithDevices:]([PXSharedLibraryLegacyDevicesFallbackViewController alloc], "initWithDevices:", v6);
  v8 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v7);

  -[PXAssistantStepContext performChanges:](v8, "performChanges:", &__block_literal_global_197_69007);
  return v8;
}

- (id)_reviewParticipantsSetupStepContextWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  PXSharedLibraryAssistantParticipantViewModel *v6;
  PXSharedLibraryAssistantReviewParticipantsViewController *v7;
  void *v8;
  PXSharedLibraryAssistantReviewParticipantsViewController *v9;
  PXAssistantStepContext *v10;

  v4 = a3;
  -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(PXSharedLibraryAssistantParticipantViewModel);
  -[PXSharedLibraryAssistantParticipantViewModel performChanges:](v6, "performChanges:", &__block_literal_global_198);
  v7 = [PXSharedLibraryAssistantReviewParticipantsViewController alloc];
  -[PXSharedLibraryAssistantContext statusProvider](self, "statusProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSharedLibraryAssistantReviewParticipantsViewController initWithViewModel:participantViewModel:sharedLibraryStatusProvider:](v7, "initWithViewModel:participantViewModel:sharedLibraryStatusProvider:", v5, v6, v8);

  v10 = -[PXAssistantStepContext initWithIdentifier:viewController:]([PXAssistantStepContext alloc], "initWithIdentifier:viewController:", v4, v9);
  -[PXSharedLibraryAssistantContext configureParticipantListForStepContext:isReviewStep:](self, "configureParticipantListForStepContext:isReviewStep:", v10, 1);

  return v10;
}

- (id)_reviewParticipantsSetupDirectStepContextWithIdentifier:(id)a3
{
  void *v3;

  -[PXSharedLibraryAssistantContext _reviewParticipantsSetupStepContextWithIdentifier:](self, "_reviewParticipantsSetupStepContextWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_204);
  return v3;
}

- (id)_reviewParticipantsSetupPreviewStepContextWithIdentifier:(id)a3
{
  void *v3;

  -[PXSharedLibraryAssistantContext _reviewParticipantsSetupStepContextWithIdentifier:](self, "_reviewParticipantsSetupStepContextWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_205_69000);
  return v3;
}

void __102__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupPreviewStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFirstButtonType:", 4);
  objc_msgSend(v2, "setSecondButtonType:", 0);

}

uint64_t __101__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupDirectStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

void __95__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ReviewRecipients_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ReviewRecipients_Title_Table_Header"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v4);

}

uint64_t __93__PXSharedLibraryAssistantContext_Internal___legacyDevicesFallbackStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

uint64_t __77__PXSharedLibraryAssistantContext_Internal___howToStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 3);
}

void __78__PXSharedLibraryAssistantContext_Internal___cameraStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFirstButtonType:", 3);
  objc_msgSend(v2, "setSecondButtonType:", 2);

}

uint64_t __90__PXSharedLibraryAssistantContext_Internal___reviewReplyPreviewStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 3);
}

uint64_t __89__PXSharedLibraryAssistantContext_Internal___reviewReplyDirectStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

void __83__PXSharedLibraryAssistantContext_Internal___reviewReplyStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sharedLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedLibrary:", v4);

}

void __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sharedLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedLibrary:", v4);

}

uint64_t __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

uint64_t __87__PXSharedLibraryAssistantContext_Internal___peopleSelectionStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

uint64_t __85__PXSharedLibraryAssistantContext_Internal___dateSelectionStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

uint64_t __77__PXSharedLibraryAssistantContext_Internal___rulesStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

uint64_t __84__PXSharedLibraryAssistantContext_Internal___participantsStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstButtonType:", 4);
}

void __84__PXSharedLibraryAssistantContext_Internal___participantsStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_Subtitle"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v4);

}

void __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sharedLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedLibrary:", v4);

}

void __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFirstButtonType:", 4);
  objc_msgSend(v2, "setSecondButtonType:", 2);

}

void __82__PXSharedLibraryAssistantContext_Internal___setupIntroStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFirstButtonType:", 3);
  objc_msgSend(v2, "setSecondButtonType:", 2);

}

- (PXSharedLibraryAssistantContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 50, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryAssistantContext init]");

  abort();
}

- (id)_initWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6 legacyDevicesRemoteController:(id)a7 mode:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PXSharedLibraryAssistantContext *v19;
  PXSharedLibraryAssistantContext *v20;
  PXLibraryFilterState *v21;
  PXLibraryFilterState *libraryFilterState;
  NSMutableDictionary *v23;
  NSMutableDictionary *stepContextIdentifiersToContexts;
  uint64_t v25;
  uint64_t v26;
  PXSharedLibraryFaceTileImageProvider *v27;
  PXSharedLibraryFaceTileImageProvider *faceTileImageProvider;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  PXSharedLibraryAssistantViewModel *v42;
  PXSharedLibraryAssistantViewModel *viewModel;
  PXSharedLibraryAssistantViewModel *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  PXSharedLibraryAssistantViewModel *v49;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v58[4];
  id v59;
  id v60;
  PXSharedLibraryAssistantContext *v61;
  id v62;
  id v63;
  id v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  int64_t v70;
  objc_super v71;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v71.receiver = self;
  v71.super_class = (Class)PXSharedLibraryAssistantContext;
  v19 = -[PXSharedLibraryAssistantContext init](&v71, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_statusProvider, a3);
    v21 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v20->_statusProvider);
    libraryFilterState = v20->_libraryFilterState;
    v20->_libraryFilterState = v21;

    objc_storeStrong((id *)&v20->_sharedLibrary, a4);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stepContextIdentifiersToContexts = v20->_stepContextIdentifiersToContexts;
    v20->_stepContextIdentifiersToContexts = v23;

    objc_storeStrong((id *)&v20->_legacyDevicesFallbackMonitor, a6);
    objc_storeStrong((id *)&v20->_legacyDevicesRemoteController, a7);
    if (v15)
    {
      PXSharedLibraryUIParticipantsForSharedLibrary(v15, 1u);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = MEMORY[0x1E0C9AA60];
    }
    +[PXSharedLibraryParticipantDataSourceManager aggregatedDataSourceWithParticipants:](PXSharedLibraryParticipantDataSourceManager, "aggregatedDataSourceWithParticipants:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(PXSharedLibraryFaceTileImageProvider);
    faceTileImageProvider = v20->_faceTileImageProvider;
    v20->_faceTileImageProvider = v27;

    -[PXSharedLibraryFaceTileImageProvider providerModel](v20->_faceTileImageProvider, "providerModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke;
    v68[3] = &unk_1E51295F8;
    v70 = a8;
    v30 = v15;
    v69 = v30;
    objc_msgSend(v29, "performChanges:", v68);
    -[PXSharedLibraryFaceTileImageProvider registerChangeObserver:context:](v20->_faceTileImageProvider, "registerChangeObserver:context:", v20, PXSharedLibraryFaceTileImageProviderObservationContext);
    v55 = v17;
    v56 = v14;
    v53 = (void *)v25;
    v54 = v18;
    v51 = (void *)v26;
    v52 = v29;
    if (v15 && objc_msgSend(v30, "isInPreview"))
    {
      objc_msgSend(v30, "rule");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "autoSharePolicy");
      v33 = v32;
      if (v32)
      {
        if (v32 == 2)
        {
          objc_msgSend(v31, "startDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "personUUIDs");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1E0C9AA60];
          v37 = 2;
        }
        else
        {
          v34 = 0;
          v35 = (void *)MEMORY[0x1E0C9AA60];
          v36 = (void *)MEMORY[0x1E0C9AA60];
          v37 = v32 == 1;
        }
      }
      else
      {
        objc_msgSend(v31, "assetLocalIdentifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v35 = (void *)MEMORY[0x1E0C9AA60];
        v37 = 3;
      }

    }
    else
    {
      v33 = 0;
      v34 = 0;
      v37 = 0;
      v35 = (void *)MEMORY[0x1E0C9AA60];
      v36 = (void *)MEMORY[0x1E0C9AA60];
    }
    v38 = v16;
    objc_msgSend(v16, "createDataSourceManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = v37;
      v41 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B16E8), "initWithAssetsDataSourceManager:", v39);
      objc_msgSend(v41, "prepareCountsIfNeeded");

      v37 = v40;
    }
    v42 = objc_alloc_init(PXSharedLibraryAssistantViewModel);
    viewModel = v20->_viewModel;
    v20->_viewModel = v42;

    v44 = v20->_viewModel;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke_2;
    v58[3] = &unk_1E5129620;
    v65 = a8;
    v66 = v33;
    v59 = v34;
    v60 = v35;
    v61 = v20;
    v62 = v51;
    v67 = v37;
    v63 = v38;
    v64 = v36;
    v45 = v36;
    v46 = v51;
    v47 = v35;
    v48 = v34;
    v49 = v44;
    v16 = v38;
    -[PXSharedLibraryAssistantViewModel performInitialChanges:](v49, "performInitialChanges:", v58);

    v17 = v55;
    v14 = v56;
    v18 = v54;
  }

  return v20;
}

- (void)configureParticipantListForStepContext:(id)a3 isReviewStep:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v6;

  v4 = a4;
  -[PXSharedLibraryAssistantContext _updateParticipantsInFaceTile](self, "_updateParticipantsInFaceTile", a3);
  v6 = &PXSharedLibraryAssistantReviewViewModelObservationContext;
  if (!v4)
    v6 = &PXSharedLibraryAssistantViewModelObservationContext_120006;
  -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, *v6);
}

- (id)initialStepContextIdentifiers
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;

  -[PXSharedLibraryAssistantContext _firstVisibleStepContextIdentifierIgnoringPreview:](self, "_firstVisibleStepContextIdentifierIgnoringPreview:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = 0;
  do
  {
    if (v6)
    {
      -[PXSharedLibraryAssistantContext _nextStepContextIdentifierFromStepContextIdentifier:](self, "_nextStepContextIdentifierFromStepContextIdentifier:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (v7)
        goto LABEL_4;
    }
    else
    {
      -[PXSharedLibraryAssistantContext _firstVisibleStepContextIdentifierIgnoringPreview:](self, "_firstVisibleStepContextIdentifierIgnoringPreview:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextIdentifier"));

LABEL_4:
    v8 = objc_msgSend(v6, "isEqualToString:", v4);
    objc_msgSend(v5, "addObject:", v6);
  }
  while (!v8);

  return v5;
}

- (id)nextStepContextIdentifierFromStepContextIdentifier:(id)a3
{
  if (a3)
    -[PXSharedLibraryAssistantContext _nextStepContextIdentifierFromStepContextIdentifier:](self, "_nextStepContextIdentifierFromStepContextIdentifier:");
  else
    -[PXSharedLibraryAssistantContext _firstVisibleStepContextIdentifierIgnoringPreview:](self, "_firstVisibleStepContextIdentifierIgnoringPreview:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_firstVisibleStepContextIdentifierIgnoringPreview:(BOOL)a3
{
  PXSharedLibrary *sharedLibrary;
  PXSharedLibrary *v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v12;

  if (a3)
    sharedLibrary = 0;
  else
    sharedLibrary = self->_sharedLibrary;
  v6 = sharedLibrary;
  v7 = -[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode");
  switch(v7)
  {
    case 1:
      v9 = CFSTR("PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview");
      if (!v6)
        v9 = CFSTR("PXSharedLibraryStepContextIdentifierIntroSetup");
      goto LABEL_13;
    case 2:
      v10 = -[PXSharedLibrary isInPreview](v6, "isInPreview");
      v9 = CFSTR("PXSharedLibraryStepContextIdentifierIntroReply");
      if (v10)
        v9 = CFSTR("PXSharedLibraryStepContextIdentifierReviewReplyPreview");
LABEL_13:
      v8 = v9;
      goto LABEL_14;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 211, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (id)_nextStepContextIdentifierFromStepContextIdentifier:(id)a3
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepContextIdentifier"));

  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierIntroSetup")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierIntroReply")))
    {
      v6 = CFSTR("PXSharedLibraryStepContextIdentifierRules");
      goto LABEL_7;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierParticipants")))
    {
LABEL_11:
      v8 = CFSTR("PXSharedLibraryStepContextIdentifierRules");
LABEL_12:
      v10 = v8;
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierRules")))
    {
      -[PXSharedLibraryAssistantContext _nextContextIdentifierForSelectedPolicy:](self, "_nextContextIdentifierForSelectedPolicy:", -[PXSharedLibraryAssistantViewModel autoSharePolicy](self->_viewModel, "autoSharePolicy"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierDateSelection")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierPeopleSelection")))
      {
        v8 = CFSTR("PXSharedLibraryStepContextIdentifierDateSelection");
        goto LABEL_12;
      }
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierPreview")))
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview")) & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewReplyDirect")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierReviewReplyPreview")))
        {
          v8 = CFSTR("PXSharedLibraryStepContextIdentifierFutureRules");
          goto LABEL_12;
        }
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierFutureRules")))
        {
          v8 = CFSTR("PXSharedLibraryStepContextIdentifierHowTo");
          goto LABEL_12;
        }
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierLegacyDevicesFallback")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 275, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        if (-[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode") == 1)
        {
          v8 = CFSTR("PXSharedLibraryStepContextIdentifierParticipants");
          goto LABEL_12;
        }
        goto LABEL_11;
      }
LABEL_35:
      objc_msgSend((id)objc_opt_class(), "_reviewContextIdentifierForMode:hasPreview:", -[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"), -[PXSharedLibrary isInPreview](self->_sharedLibrary, "isInPreview"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[PXSharedLibraryAssistantContext viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "shareCounts");
      v13 = v19;
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0;
        goto LABEL_32;
      }
      v16 = v20;
      v15 = v21;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v13 = 0;
    }
    v14 = 0;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
      v14 = v16 + v13 + v15 == 0;
LABEL_32:

    if (-[PXSharedLibraryAssistantViewModel autoSharePolicy](self->_viewModel, "autoSharePolicy") && !v14)
    {
      v8 = CFSTR("PXSharedLibraryStepContextIdentifierPreview");
      goto LABEL_12;
    }
    goto LABEL_35;
  }
  v6 = CFSTR("PXSharedLibraryStepContextIdentifierParticipants");
LABEL_7:
  -[PXSharedLibraryAssistantContext _legacyDeviceStepContextIdentifierOrNextContextIdentifier:](self, "_legacyDeviceStepContextIdentifierOrNextContextIdentifier:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = (__CFString *)v7;
LABEL_9:

  return v8;
}

- (id)_nextContextIdentifierForSelectedPolicy:(int64_t)a3
{
  unint64_t v4;
  PXSharedLibraryAssistantViewModel *viewModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = -[PXSharedLibraryAssistantViewModel autoSharePolicy](self->_viewModel, "autoSharePolicy", a3);
  if (v4 >= 2)
  {
    if (v4 != 2)
      return 0;
    if (-[PXSharedLibraryAssistantViewModel shouldShowPeopleState](self->_viewModel, "shouldShowPeopleState") == 1)
      v9 = CFSTR("PXSharedLibraryStepContextIdentifierPeopleSelection");
    else
      v9 = CFSTR("PXSharedLibraryStepContextIdentifierDateSelection");
    goto LABEL_16;
  }
  viewModel = self->_viewModel;
  if (!viewModel)
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_10;
  }
  -[PXSharedLibraryAssistantViewModel shareCounts](viewModel, "shareCounts");
  v6 = v12;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v13;
    v8 = v14;
LABEL_10:
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL && !(v7 + v6 + v8))
    {
      objc_msgSend((id)objc_opt_class(), "_reviewContextIdentifierForMode:hasPreview:", -[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"), -[PXSharedLibrary isInPreview](self->_sharedLibrary, "isInPreview"));
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = CFSTR("PXSharedLibraryStepContextIdentifierPreview");
LABEL_16:
  v11 = v9;
  return v9;
}

- (id)_legacyDeviceStepContextIdentifierOrNextContextIdentifier:(id)a3
{
  __CFString *v4;
  PXSharedLibraryLegacyDevicesFallbackMonitor *legacyDevicesFallbackMonitor;
  _BOOL4 v6;
  PXSharedLibraryLegacyDevicesRemoteController *legacyDevicesRemoteController;
  void *v8;
  uint64_t v9;
  int v10;
  __CFString *v11;
  __CFString *v12;

  v4 = (__CFString *)a3;
  legacyDevicesFallbackMonitor = self->_legacyDevicesFallbackMonitor;
  if (legacyDevicesFallbackMonitor
    && -[PXSharedLibraryLegacyDevicesFallbackMonitor state](legacyDevicesFallbackMonitor, "state") != 1)
  {
    legacyDevicesRemoteController = self->_legacyDevicesRemoteController;
    if (legacyDevicesRemoteController)
      v6 = -[PXSharedLibraryLegacyDevicesRemoteController state](legacyDevicesRemoteController, "state") == 3;
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[PXSharedLibraryLegacyDevicesFallbackMonitor devices](self->_legacyDevicesFallbackMonitor, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    v10 = v6;
  else
    v10 = 1;
  if (v10)
    v11 = v4;
  else
    v11 = CFSTR("PXSharedLibraryStepContextIdentifierLegacyDevicesFallback");
  v12 = v11;

  return v12;
}

- (id)stepContextForStepContextIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepContextIdentifier"));

  }
  -[PXSharedLibraryAssistantContext sharedLibraryStepContextForStepContextIdentifier:](self, "sharedLibraryStepContextForStepContextIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAssistantTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "displayScale");
  v6 = v5;
  v7 = objc_msgSend(v4, "isRTL");

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryFaceTileImageProvider providerModel](self->_faceTileImageProvider, "providerModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PXSharedLibraryAssistantContext_setAssistantTraitCollection___block_invoke;
  v11[3] = &unk_1E51296B8;
  v14 = v6;
  v15 = v7;
  v10 = v8;
  v12 = v10;
  v13 = v10;
  objc_msgSend(v9, "performChanges:", v11);

}

- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3
{
  id v5;
  int v6;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierFutureRules")) & 1) != 0)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryStepContextIdentifierHowTo")) ^ 1;
  v7 = v6 & -[PXSharedLibraryAssistantViewModel hasChangedUserInputValues](self->_viewModel, "hasChangedUserInputValues");

  return v7;
}

- (void)willCancelAssistant
{
  -[PXSharedLibraryAssistantViewModel performChanges:](self->_viewModel, "performChanges:", &__block_literal_global_120035);
}

- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4
{
  void (**v7)(id, const __CFString *, void *, void *, void *, void *, uint64_t);
  void *v8;
  int v9;
  void *v10;
  char v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = (void (**)(id, const __CFString *, void *, void *, void *, void *, uint64_t))a4;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v7)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertProperties"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_15;
LABEL_3:
  -[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInPreview");

  if (-[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode") == 1
    && (-[PXSharedLibraryAssistantViewModel sharedLibrary](self->_viewModel, "sharedLibrary"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isPublished"),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 0;
    v13 = 0;
    v14 = CFSTR("PXSharedLibrarySetupAssistant_CancelAfterPublish_ContinueButton");
    v15 = CFSTR("PXSharedLibrarySetupAssistant_CancelAfterPublish_ExitButton");
    v16 = CFSTR("PXSharedLibrarySetupAssistant_CancelAfterPublish_Description_iOS");
  }
  else
  {
    if (v9)
      v14 = CFSTR("PXSharedLibrarySetupAssistant_CancelAfterPreview_ContinueButton");
    else
      v14 = 0;
    v13 = v9 ^ 1;
    v15 = CFSTR("PXSharedLibrarySetupAssistant_Cancel_ExitButton");
    v16 = CFSTR("PXSharedLibrarySetupAssistant_Cancel_Description_iOS");
    v12 = 1;
  }
  PXLocalizedSharedLibraryString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    PXLocalizedSharedLibraryString(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Cancel_CancelButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, &stru_1E5149688, v17, v18, v20, v19, v12);

}

- (void)_updateCombinedImage
{
  PXSharedLibraryAssistantViewModel *viewModel;
  _QWORD v3[5];

  viewModel = self->_viewModel;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PXSharedLibraryAssistantContext__updateCombinedImage__block_invoke;
  v3[3] = &unk_1E5144D60;
  v3[4] = self;
  -[PXSharedLibraryAssistantViewModel performChanges:](viewModel, "performChanges:", v3);
}

- (void)_updateParticipantsInFaceTile
{
  void *v3;
  _QWORD v4[5];

  -[PXSharedLibraryFaceTileImageProvider providerModel](self->_faceTileImageProvider, "providerModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PXSharedLibraryAssistantContext__updateParticipantsInFaceTile__block_invoke;
  v4[3] = &unk_1E5129700;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryFaceTileImageProviderObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v12 = v9;
      -[PXSharedLibraryAssistantContext _updateCombinedImage](self, "_updateCombinedImage");
      goto LABEL_11;
    }
  }
  else
  {
    if ((void *)PXSharedLibraryAssistantViewModelObservationContext_120006 != a5
      && PXSharedLibraryAssistantReviewViewModelObservationContext != (_QWORD)a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantContext.m"), 450, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 0x20) != 0)
    {
      v12 = v9;
      -[PXSharedLibraryAssistantContext _updateParticipantsInFaceTile](self, "_updateParticipantsInFaceTile");
LABEL_11:
      v9 = v12;
    }
  }

}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (PXSharedLibraryLegacyDevicesRemoteController)legacyDevicesRemoteController
{
  return self->_legacyDevicesRemoteController;
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibrary)sharedLibrary
{
  return self->_sharedLibrary;
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (NSMutableDictionary)stepContextIdentifiersToContexts
{
  return self->_stepContextIdentifiersToContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepContextIdentifiersToContexts, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_legacyDevicesRemoteController, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_faceTileImageProvider, 0);
}

void __64__PXSharedLibraryAssistantContext__updateParticipantsInFaceTile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setIncludeMeContact:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "participantDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participantImageCombinerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaceTileCombinerItems:", v4);

}

void __55__PXSharedLibraryAssistantContext__updateCombinedImage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = a2;
  objc_msgSend(v2, "combinedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setParticipantsImage:", v4);

}

uint64_t __54__PXSharedLibraryAssistantContext_willCancelAssistant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsCancelingAssistant:", 1);
}

void __63__PXSharedLibraryAssistantContext_setAssistantTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setDisplayScale:", v3);
  objc_msgSend(v4, "setIsRTL:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setBorderColor:", *(_QWORD *)(a1 + 40));

}

void __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setIncludeMeContact:", 0);
  objc_msgSend(v4, "setImageDiameter:", 80.0);
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    PXSharedLibraryRecipientsForSharedLibrary(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFaceTileCombinerItems:", v3);

  }
}

void __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a1[10];
  v5 = a2;
  objc_msgSend(v5, "setMode:", v3);
  objc_msgSend(v5, "setAutoSharePolicy:", a1[11]);
  objc_msgSend(v5, "setStartDate:", a1[4]);
  objc_msgSend(v5, "setPersonUUIDs:", a1[5]);
  objc_msgSend(*(id *)(a1[6] + 8), "combinedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParticipantsImage:", v4);

  objc_msgSend(v5, "setParticipantDataSource:", a1[7]);
  objc_msgSend(v5, "setSourceLibraryInfo:", a1[8]);
  objc_msgSend(v5, "setSharedLibrary:", *(_QWORD *)(a1[6] + 48));
  objc_msgSend(v5, "setSelectedRuleType:", a1[12]);
  objc_msgSend(v5, "setAssetLocalIdentifiers:", a1[9]);

}

+ (id)setupAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryAssistantContext.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

    if (v15)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v14)
  {
LABEL_3:
    +[PXSharedLibraryLegacyDevicesFallbackMonitor legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:](PXSharedLibraryLegacyDevicesFallbackMonitor, "legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:", v12 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  +[PXSharedLibraryLegacyDevicesRemoteController legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:](PXSharedLibraryLegacyDevicesRemoteController, "legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:", v12 != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXSharedLibraryAssistantContext _initWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:legacyDevicesRemoteController:mode:]([PXSharedLibraryAssistantContext alloc], "_initWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:legacyDevicesRemoteController:mode:", v11, v12, v13, v15, v16, 1);

  return v17;
}

+ (id)replyAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 legacyDevicesFallbackMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryAssistantContext.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryAssistantContext.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibrary"));

LABEL_3:
  v12 = objc_msgSend(v10, "isInPreview");
  if (!v11)
  {
    +[PXSharedLibraryLegacyDevicesFallbackMonitor legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:](PXSharedLibraryLegacyDevicesFallbackMonitor, "legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[PXSharedLibraryLegacyDevicesRemoteController legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:](PXSharedLibraryLegacyDevicesRemoteController, "legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceLibraryInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXSharedLibraryAssistantContext _initWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:legacyDevicesRemoteController:mode:]([PXSharedLibraryAssistantContext alloc], "_initWithSharedLibraryStatusProvider:sharedLibrary:sourceLibraryInfo:legacyDevicesFallbackMonitor:legacyDevicesRemoteController:mode:", v9, v10, v14, v11, v13, 2);

  return v15;
}

+ (id)_reviewContextIdentifierForMode:(int64_t)a3 hasPreview:(BOOL)a4
{
  __CFString *v4;
  __CFString **v5;
  __CFString **v6;
  void *v10;

  switch(a3)
  {
    case 1:
      v5 = PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect;
      v6 = PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview;
      break;
    case 2:
      v5 = PXSharedLibraryStepContextIdentifierReviewReplyDirect;
      v6 = PXSharedLibraryStepContextIdentifierReviewReplyPreview;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryAssistantContext.m"), 284, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v4 = 0;
      return v4;
  }
  if (a4)
    v5 = v6;
  v4 = *v5;
  return v4;
}

@end
