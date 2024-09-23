@implementation _SFPBCommand

- (_SFPBCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBTopic *v9;
  void *v10;
  _SFPBTopic *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBCommandReference *v15;
  void *v16;
  _SFPBCommandReference *v17;
  _SFPBShowContactCardCommand *v18;
  _SFPBShowSFCardCommand *v19;
  _SFPBShowAppStoreSheetCommand *v20;
  _SFPBOpenPunchoutCommand *v21;
  _SFPBOpenFileProviderItemCommand *v22;
  _SFPBOpenAppClipCommand *v23;
  _SFPBOpenWebClipCommand *v24;
  _SFPBRequestAppClipInstallCommand *v25;
  _SFPBRequestUserReportCommand *v26;
  _SFPBLaunchAppCommand *v27;
  _SFPBRunVoiceShortcutCommand *v28;
  _SFPBIndexedUserActivityCommand *v29;
  _SFPBOpenCoreSpotlightItemCommand *v30;
  _SFPBPerformIntentCommand *v31;
  _SFPBSearchInAppCommand *v32;
  _SFPBUpdateSearchQueryCommand *v33;
  _SFPBSearchWebCommand *v34;
  _SFPBInvokeSiriCommand *v35;
  _SFPBPerformContactQueryCommand *v36;
  _SFPBOpenCalculationCommand *v37;
  _SFPBPlayVideoCommand *v38;
  _SFPBCallCommand *v39;
  _SFPBEmailCommand *v40;
  _SFPBBeginMapsRoutingCommand *v41;
  _SFPBToggleAudioCommand *v42;
  _SFPBPerformPersonEntityQueryCommand *v43;
  _SFPBShowPurchaseRequestSheetCommand *v44;
  _SFPBShowScreenTimeRequestSheetCommand *v45;
  _SFPBPerformEntityQueryCommand *v46;
  _SFPBShareCommand *v47;
  _SFPBCopyCommand *v48;
  _SFPBToggleWatchListStatusCommand *v49;
  _SFPBShowPhotosOneUpViewCommand *v50;
  _SFPBPlayMediaCommand *v51;
  _SFPBOpenMediaCommand *v52;
  _SFPBAddToPhotosLibraryCommand *v53;
  _SFPBPerformContactActionCommand *v54;
  _SFPBExpandInlineCommand *v55;
  _SFPBSubscribeForUpdatesCommand *v56;
  _SFPBViewEmailCommand *v57;
  _SFPBRejectPeopleInPhotoCommand *v58;
  _SFPBShowWrapperResponseViewCommand *v59;
  _SFPBClearProactiveCategoryCommand *v60;
  _SFPBCreateContactCommand *v61;
  _SFPBCreateCalendarEventCommand *v62;
  _SFPBCreateReminderCommand *v63;
  _SFPBManageReservationCommand *v64;
  _SFPBUpdateSportsFollowingStatusCommand *v65;
  _SFPBRequestProductPageCommand *v66;
  _SFPBFlightCheckinCommand *v67;
  _SFPBCommand *v68;

  v4 = a3;
  v5 = -[_SFPBCommand init](self, "init");

  if (v5)
  {
    objc_msgSend(v4, "commandDetail");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "commandDetail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCommand setCommandDetail:](v5, "setCommandDetail:", v7);

    }
    objc_msgSend(v4, "normalizedTopic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBTopic alloc];
      objc_msgSend(v4, "normalizedTopic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBTopic initWithSFTopic:](v9, "initWithSFTopic:", v10);
      -[_SFPBCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v11);

    }
    objc_msgSend(v4, "backendData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "backendData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCommand setBackendData:](v5, "setBackendData:", v13);

    }
    objc_msgSend(v4, "commandReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBCommandReference alloc];
      objc_msgSend(v4, "commandReference");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBCommandReference initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBCommand setCommandReference:](v5, "setCommandReference:", v17);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBShowContactCardCommand initWithFacade:]([_SFPBShowContactCardCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowContactCardCommand:](v5, "setShowContactCardCommand:", v18);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBShowSFCardCommand initWithFacade:]([_SFPBShowSFCardCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowSFCardCommand:](v5, "setShowSFCardCommand:", v19);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBShowAppStoreSheetCommand initWithFacade:]([_SFPBShowAppStoreSheetCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowAppStoreSheetCommand:](v5, "setShowAppStoreSheetCommand:", v20);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBOpenPunchoutCommand initWithFacade:]([_SFPBOpenPunchoutCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenPunchoutCommand:](v5, "setOpenPunchoutCommand:", v21);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[_SFPBOpenFileProviderItemCommand initWithFacade:]([_SFPBOpenFileProviderItemCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenFileProviderItemCommand:](v5, "setOpenFileProviderItemCommand:", v22);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBOpenAppClipCommand initWithFacade:]([_SFPBOpenAppClipCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenAppClipCommand:](v5, "setOpenAppClipCommand:", v23);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[_SFPBOpenWebClipCommand initWithFacade:]([_SFPBOpenWebClipCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenWebClipCommand:](v5, "setOpenWebClipCommand:", v24);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBRequestAppClipInstallCommand initWithFacade:]([_SFPBRequestAppClipInstallCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setRequestAppClipInstallCommand:](v5, "setRequestAppClipInstallCommand:", v25);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[_SFPBRequestUserReportCommand initWithFacade:]([_SFPBRequestUserReportCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setRequestUserReportCommand:](v5, "setRequestUserReportCommand:", v26);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBLaunchAppCommand initWithFacade:]([_SFPBLaunchAppCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setLaunchAppCommand:](v5, "setLaunchAppCommand:", v27);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[_SFPBRunVoiceShortcutCommand initWithFacade:]([_SFPBRunVoiceShortcutCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setRunVoiceShortcutCommand:](v5, "setRunVoiceShortcutCommand:", v28);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBIndexedUserActivityCommand initWithFacade:]([_SFPBIndexedUserActivityCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setIndexedUserActivityCommand:](v5, "setIndexedUserActivityCommand:", v29);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[_SFPBOpenCoreSpotlightItemCommand initWithFacade:]([_SFPBOpenCoreSpotlightItemCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenCoreSpotlightItemCommand:](v5, "setOpenCoreSpotlightItemCommand:", v30);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBPerformIntentCommand initWithFacade:]([_SFPBPerformIntentCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPerformIntentCommand:](v5, "setPerformIntentCommand:", v31);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBSearchInAppCommand initWithFacade:]([_SFPBSearchInAppCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setSearchInAppCommand:](v5, "setSearchInAppCommand:", v32);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBUpdateSearchQueryCommand initWithFacade:]([_SFPBUpdateSearchQueryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setUpdateSearchQueryCommand:](v5, "setUpdateSearchQueryCommand:", v33);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBSearchWebCommand initWithFacade:]([_SFPBSearchWebCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setSearchWebCommand:](v5, "setSearchWebCommand:", v34);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBInvokeSiriCommand initWithFacade:]([_SFPBInvokeSiriCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setInvokeSiriCommand:](v5, "setInvokeSiriCommand:", v35);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[_SFPBPerformContactQueryCommand initWithFacade:]([_SFPBPerformContactQueryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPerformContactQueryCommand:](v5, "setPerformContactQueryCommand:", v36);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBOpenCalculationCommand initWithFacade:]([_SFPBOpenCalculationCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenCalculationCommand:](v5, "setOpenCalculationCommand:", v37);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBPlayVideoCommand initWithFacade:]([_SFPBPlayVideoCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPlayVideoCommand:](v5, "setPlayVideoCommand:", v38);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBCallCommand initWithFacade:]([_SFPBCallCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setCallCommand:](v5, "setCallCommand:", v39);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = -[_SFPBEmailCommand initWithFacade:]([_SFPBEmailCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setEmailCommand:](v5, "setEmailCommand:", v40);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[_SFPBBeginMapsRoutingCommand initWithFacade:]([_SFPBBeginMapsRoutingCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setBeginMapsRoutingCommand:](v5, "setBeginMapsRoutingCommand:", v41);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = -[_SFPBToggleAudioCommand initWithFacade:]([_SFPBToggleAudioCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setToggleAudioCommand:](v5, "setToggleAudioCommand:", v42);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[_SFPBPerformPersonEntityQueryCommand initWithFacade:]([_SFPBPerformPersonEntityQueryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPerformPersonEntityQueryCommand:](v5, "setPerformPersonEntityQueryCommand:", v43);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = -[_SFPBShowPurchaseRequestSheetCommand initWithFacade:]([_SFPBShowPurchaseRequestSheetCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowPurchaseRequestSheetCommand:](v5, "setShowPurchaseRequestSheetCommand:", v44);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[_SFPBShowScreenTimeRequestSheetCommand initWithFacade:]([_SFPBShowScreenTimeRequestSheetCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowScreenTimeRequestSheetCommand:](v5, "setShowScreenTimeRequestSheetCommand:", v45);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = -[_SFPBPerformEntityQueryCommand initWithFacade:]([_SFPBPerformEntityQueryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPerformEntityQueryCommand:](v5, "setPerformEntityQueryCommand:", v46);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[_SFPBShareCommand initWithFacade:]([_SFPBShareCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShareCommand:](v5, "setShareCommand:", v47);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = -[_SFPBCopyCommand initWithFacade:]([_SFPBCopyCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setCopyCommand:](v5, "setCopyCommand:", v48);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[_SFPBToggleWatchListStatusCommand initWithFacade:]([_SFPBToggleWatchListStatusCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setToggleWatchListStatusCommand:](v5, "setToggleWatchListStatusCommand:", v49);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[_SFPBShowPhotosOneUpViewCommand initWithFacade:]([_SFPBShowPhotosOneUpViewCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowPhotosOneUpViewCommand:](v5, "setShowPhotosOneUpViewCommand:", v50);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[_SFPBPlayMediaCommand initWithFacade:]([_SFPBPlayMediaCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPlayMediaCommand:](v5, "setPlayMediaCommand:", v51);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = -[_SFPBOpenMediaCommand initWithFacade:]([_SFPBOpenMediaCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setOpenMediaCommand:](v5, "setOpenMediaCommand:", v52);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[_SFPBAddToPhotosLibraryCommand initWithFacade:]([_SFPBAddToPhotosLibraryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setAddToPhotosLibraryCommand:](v5, "setAddToPhotosLibraryCommand:", v53);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = -[_SFPBPerformContactActionCommand initWithFacade:]([_SFPBPerformContactActionCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setPerformContactActionCommand:](v5, "setPerformContactActionCommand:", v54);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[_SFPBExpandInlineCommand initWithFacade:]([_SFPBExpandInlineCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setExpandInlineCommand:](v5, "setExpandInlineCommand:", v55);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = -[_SFPBSubscribeForUpdatesCommand initWithFacade:]([_SFPBSubscribeForUpdatesCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setSubscribeForUpdatesCommand:](v5, "setSubscribeForUpdatesCommand:", v56);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[_SFPBViewEmailCommand initWithFacade:]([_SFPBViewEmailCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setViewEmailCommand:](v5, "setViewEmailCommand:", v57);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = -[_SFPBRejectPeopleInPhotoCommand initWithFacade:]([_SFPBRejectPeopleInPhotoCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setRejectPeopleInPhotoCommand:](v5, "setRejectPeopleInPhotoCommand:", v58);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[_SFPBShowWrapperResponseViewCommand initWithFacade:]([_SFPBShowWrapperResponseViewCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setShowWrapperResponseViewCommand:](v5, "setShowWrapperResponseViewCommand:", v59);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = -[_SFPBClearProactiveCategoryCommand initWithFacade:]([_SFPBClearProactiveCategoryCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setClearProactiveCategoryCommand:](v5, "setClearProactiveCategoryCommand:", v60);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[_SFPBCreateContactCommand initWithFacade:]([_SFPBCreateContactCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setCreateContactCommand:](v5, "setCreateContactCommand:", v61);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = -[_SFPBCreateCalendarEventCommand initWithFacade:]([_SFPBCreateCalendarEventCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setCreateCalendarEventCommand:](v5, "setCreateCalendarEventCommand:", v62);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[_SFPBCreateReminderCommand initWithFacade:]([_SFPBCreateReminderCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setCreateReminderCommand:](v5, "setCreateReminderCommand:", v63);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = -[_SFPBManageReservationCommand initWithFacade:]([_SFPBManageReservationCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setManageReservationCommand:](v5, "setManageReservationCommand:", v64);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[_SFPBUpdateSportsFollowingStatusCommand initWithFacade:]([_SFPBUpdateSportsFollowingStatusCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setUpdateSportsFollowingStatusCommand:](v5, "setUpdateSportsFollowingStatusCommand:", v65);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = -[_SFPBRequestProductPageCommand initWithFacade:]([_SFPBRequestProductPageCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setRequestProductPageCommand:](v5, "setRequestProductPageCommand:", v66);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[_SFPBFlightCheckinCommand initWithFacade:]([_SFPBFlightCheckinCommand alloc], "initWithFacade:", v4);
      -[_SFPBCommand setFlightCheckinCommand:](v5, "setFlightCheckinCommand:", v67);

    }
    v68 = v5;
  }

  return v5;
}

- (void)setShowContactCardCommand:(id)a3
{
  _SFPBShowContactCardCommand *v4;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBShowContactCardCommand *showContactCardCommand;

  v4 = (_SFPBShowContactCardCommand *)a3;
  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = v4 != 0;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = v4;

}

- (_SFPBShowContactCardCommand)showContactCardCommand
{
  if (self->_whichValue == 1)
    return self->_showContactCardCommand;
  else
    return (_SFPBShowContactCardCommand *)0;
}

- (void)setShowSFCardCommand:(id)a3
{
  _SFPBShowSFCardCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;

  v4 = (_SFPBShowSFCardCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = 2 * (v4 != 0);
  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = v4;

}

- (_SFPBShowSFCardCommand)showSFCardCommand
{
  if (self->_whichValue == 2)
    return self->_showSFCardCommand;
  else
    return (_SFPBShowSFCardCommand *)0;
}

- (void)setShowAppStoreSheetCommand:(id)a3
{
  _SFPBShowAppStoreSheetCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;

  v4 = (_SFPBShowAppStoreSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 3;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = v4;

}

- (_SFPBShowAppStoreSheetCommand)showAppStoreSheetCommand
{
  if (self->_whichValue == 3)
    return self->_showAppStoreSheetCommand;
  else
    return (_SFPBShowAppStoreSheetCommand *)0;
}

- (void)setOpenPunchoutCommand:(id)a3
{
  _SFPBOpenPunchoutCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;

  v4 = (_SFPBOpenPunchoutCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = 4 * (v4 != 0);
  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = v4;

}

- (_SFPBOpenPunchoutCommand)openPunchoutCommand
{
  if (self->_whichValue == 4)
    return self->_openPunchoutCommand;
  else
    return (_SFPBOpenPunchoutCommand *)0;
}

- (void)setOpenFileProviderItemCommand:(id)a3
{
  _SFPBOpenFileProviderItemCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;

  v4 = (_SFPBOpenFileProviderItemCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 5;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = v4;

}

- (_SFPBOpenFileProviderItemCommand)openFileProviderItemCommand
{
  if (self->_whichValue == 5)
    return self->_openFileProviderItemCommand;
  else
    return (_SFPBOpenFileProviderItemCommand *)0;
}

- (void)setOpenAppClipCommand:(id)a3
{
  _SFPBOpenAppClipCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenAppClipCommand *openAppClipCommand;

  v4 = (_SFPBOpenAppClipCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 6;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = v4;

}

- (_SFPBOpenAppClipCommand)openAppClipCommand
{
  if (self->_whichValue == 6)
    return self->_openAppClipCommand;
  else
    return (_SFPBOpenAppClipCommand *)0;
}

- (void)setOpenWebClipCommand:(id)a3
{
  _SFPBOpenWebClipCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenWebClipCommand *openWebClipCommand;

  v4 = (_SFPBOpenWebClipCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 7;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = v4;

}

- (_SFPBOpenWebClipCommand)openWebClipCommand
{
  if (self->_whichValue == 7)
    return self->_openWebClipCommand;
  else
    return (_SFPBOpenWebClipCommand *)0;
}

- (void)setRequestAppClipInstallCommand:(id)a3
{
  _SFPBRequestAppClipInstallCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;

  v4 = (_SFPBRequestAppClipInstallCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = 8 * (v4 != 0);
  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = v4;

}

- (_SFPBRequestAppClipInstallCommand)requestAppClipInstallCommand
{
  if (self->_whichValue == 8)
    return self->_requestAppClipInstallCommand;
  else
    return (_SFPBRequestAppClipInstallCommand *)0;
}

- (void)setRequestUserReportCommand:(id)a3
{
  _SFPBRequestUserReportCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBRequestUserReportCommand *requestUserReportCommand;

  v4 = (_SFPBRequestUserReportCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 9;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = v4;

}

- (_SFPBRequestUserReportCommand)requestUserReportCommand
{
  if (self->_whichValue == 9)
    return self->_requestUserReportCommand;
  else
    return (_SFPBRequestUserReportCommand *)0;
}

- (void)setLaunchAppCommand:(id)a3
{
  _SFPBLaunchAppCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBLaunchAppCommand *launchAppCommand;

  v4 = (_SFPBLaunchAppCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 10;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = v4;

}

- (_SFPBLaunchAppCommand)launchAppCommand
{
  if (self->_whichValue == 10)
    return self->_launchAppCommand;
  else
    return (_SFPBLaunchAppCommand *)0;
}

- (void)setRunVoiceShortcutCommand:(id)a3
{
  _SFPBRunVoiceShortcutCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;

  v4 = (_SFPBRunVoiceShortcutCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 11;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = v4;

}

- (_SFPBRunVoiceShortcutCommand)runVoiceShortcutCommand
{
  if (self->_whichValue == 11)
    return self->_runVoiceShortcutCommand;
  else
    return (_SFPBRunVoiceShortcutCommand *)0;
}

- (void)setIndexedUserActivityCommand:(id)a3
{
  _SFPBIndexedUserActivityCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;

  v4 = (_SFPBIndexedUserActivityCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 12;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = v4;

}

- (_SFPBIndexedUserActivityCommand)indexedUserActivityCommand
{
  if (self->_whichValue == 12)
    return self->_indexedUserActivityCommand;
  else
    return (_SFPBIndexedUserActivityCommand *)0;
}

- (void)setOpenCoreSpotlightItemCommand:(id)a3
{
  _SFPBOpenCoreSpotlightItemCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;

  v4 = (_SFPBOpenCoreSpotlightItemCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 13;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = v4;

}

- (_SFPBOpenCoreSpotlightItemCommand)openCoreSpotlightItemCommand
{
  if (self->_whichValue == 13)
    return self->_openCoreSpotlightItemCommand;
  else
    return (_SFPBOpenCoreSpotlightItemCommand *)0;
}

- (void)setPerformIntentCommand:(id)a3
{
  _SFPBPerformIntentCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPerformIntentCommand *performIntentCommand;

  v4 = (_SFPBPerformIntentCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 14;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = v4;

}

- (_SFPBPerformIntentCommand)performIntentCommand
{
  if (self->_whichValue == 14)
    return self->_performIntentCommand;
  else
    return (_SFPBPerformIntentCommand *)0;
}

- (void)setSearchInAppCommand:(id)a3
{
  _SFPBSearchInAppCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBSearchInAppCommand *searchInAppCommand;

  v4 = (_SFPBSearchInAppCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 15;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = v4;

}

- (_SFPBSearchInAppCommand)searchInAppCommand
{
  if (self->_whichValue == 15)
    return self->_searchInAppCommand;
  else
    return (_SFPBSearchInAppCommand *)0;
}

- (void)setUpdateSearchQueryCommand:(id)a3
{
  _SFPBUpdateSearchQueryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;

  v4 = (_SFPBUpdateSearchQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = 16 * (v4 != 0);
  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = v4;

}

- (_SFPBUpdateSearchQueryCommand)updateSearchQueryCommand
{
  if (self->_whichValue == 16)
    return self->_updateSearchQueryCommand;
  else
    return (_SFPBUpdateSearchQueryCommand *)0;
}

- (void)setSearchWebCommand:(id)a3
{
  _SFPBSearchWebCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBSearchWebCommand *searchWebCommand;

  v4 = (_SFPBSearchWebCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 17;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = v4;

}

- (_SFPBSearchWebCommand)searchWebCommand
{
  if (self->_whichValue == 17)
    return self->_searchWebCommand;
  else
    return (_SFPBSearchWebCommand *)0;
}

- (void)setInvokeSiriCommand:(id)a3
{
  _SFPBInvokeSiriCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBInvokeSiriCommand *invokeSiriCommand;

  v4 = (_SFPBInvokeSiriCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 18;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = v4;

}

- (_SFPBInvokeSiriCommand)invokeSiriCommand
{
  if (self->_whichValue == 18)
    return self->_invokeSiriCommand;
  else
    return (_SFPBInvokeSiriCommand *)0;
}

- (void)setPerformContactQueryCommand:(id)a3
{
  _SFPBPerformContactQueryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;

  v4 = (_SFPBPerformContactQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 19;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = v4;

}

- (_SFPBPerformContactQueryCommand)performContactQueryCommand
{
  if (self->_whichValue == 19)
    return self->_performContactQueryCommand;
  else
    return (_SFPBPerformContactQueryCommand *)0;
}

- (void)setOpenCalculationCommand:(id)a3
{
  _SFPBOpenCalculationCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenCalculationCommand *openCalculationCommand;

  v4 = (_SFPBOpenCalculationCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 20;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = v4;

}

- (_SFPBOpenCalculationCommand)openCalculationCommand
{
  if (self->_whichValue == 20)
    return self->_openCalculationCommand;
  else
    return (_SFPBOpenCalculationCommand *)0;
}

- (void)setPlayVideoCommand:(id)a3
{
  _SFPBPlayVideoCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPlayVideoCommand *playVideoCommand;

  v4 = (_SFPBPlayVideoCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 21;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = v4;

}

- (_SFPBPlayVideoCommand)playVideoCommand
{
  if (self->_whichValue == 21)
    return self->_playVideoCommand;
  else
    return (_SFPBPlayVideoCommand *)0;
}

- (void)setCallCommand:(id)a3
{
  _SFPBCallCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBCallCommand *callCommand;

  v4 = (_SFPBCallCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 22;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  callCommand = self->_callCommand;
  self->_callCommand = v4;

}

- (_SFPBCallCommand)callCommand
{
  if (self->_whichValue == 22)
    return self->_callCommand;
  else
    return (_SFPBCallCommand *)0;
}

- (void)setEmailCommand:(id)a3
{
  _SFPBEmailCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBEmailCommand *emailCommand;

  v4 = (_SFPBEmailCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 23;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  emailCommand = self->_emailCommand;
  self->_emailCommand = v4;

}

- (_SFPBEmailCommand)emailCommand
{
  if (self->_whichValue == 23)
    return self->_emailCommand;
  else
    return (_SFPBEmailCommand *)0;
}

- (void)setBeginMapsRoutingCommand:(id)a3
{
  _SFPBBeginMapsRoutingCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;

  v4 = (_SFPBBeginMapsRoutingCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 24;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = v4;

}

- (_SFPBBeginMapsRoutingCommand)beginMapsRoutingCommand
{
  if (self->_whichValue == 24)
    return self->_beginMapsRoutingCommand;
  else
    return (_SFPBBeginMapsRoutingCommand *)0;
}

- (void)setToggleAudioCommand:(id)a3
{
  _SFPBToggleAudioCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBToggleAudioCommand *toggleAudioCommand;

  v4 = (_SFPBToggleAudioCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 25;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = v4;

}

- (_SFPBToggleAudioCommand)toggleAudioCommand
{
  if (self->_whichValue == 25)
    return self->_toggleAudioCommand;
  else
    return (_SFPBToggleAudioCommand *)0;
}

- (void)setPerformPersonEntityQueryCommand:(id)a3
{
  _SFPBPerformPersonEntityQueryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;

  v4 = (_SFPBPerformPersonEntityQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 26;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = v4;

}

- (_SFPBPerformPersonEntityQueryCommand)performPersonEntityQueryCommand
{
  if (self->_whichValue == 26)
    return self->_performPersonEntityQueryCommand;
  else
    return (_SFPBPerformPersonEntityQueryCommand *)0;
}

- (void)setShowPurchaseRequestSheetCommand:(id)a3
{
  _SFPBShowPurchaseRequestSheetCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;

  v4 = (_SFPBShowPurchaseRequestSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 27;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = v4;

}

- (_SFPBShowPurchaseRequestSheetCommand)showPurchaseRequestSheetCommand
{
  if (self->_whichValue == 27)
    return self->_showPurchaseRequestSheetCommand;
  else
    return (_SFPBShowPurchaseRequestSheetCommand *)0;
}

- (void)setShowScreenTimeRequestSheetCommand:(id)a3
{
  _SFPBShowScreenTimeRequestSheetCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;

  v4 = (_SFPBShowScreenTimeRequestSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 28;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = v4;

}

- (_SFPBShowScreenTimeRequestSheetCommand)showScreenTimeRequestSheetCommand
{
  if (self->_whichValue == 28)
    return self->_showScreenTimeRequestSheetCommand;
  else
    return (_SFPBShowScreenTimeRequestSheetCommand *)0;
}

- (void)setPerformEntityQueryCommand:(id)a3
{
  _SFPBPerformEntityQueryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;

  v4 = (_SFPBPerformEntityQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 29;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = v4;

}

- (_SFPBPerformEntityQueryCommand)performEntityQueryCommand
{
  if (self->_whichValue == 29)
    return self->_performEntityQueryCommand;
  else
    return (_SFPBPerformEntityQueryCommand *)0;
}

- (void)setShareCommand:(id)a3
{
  _SFPBShareCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShareCommand *shareCommand;

  v4 = (_SFPBShareCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 30;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  shareCommand = self->_shareCommand;
  self->_shareCommand = v4;

}

- (_SFPBShareCommand)shareCommand
{
  if (self->_whichValue == 30)
    return self->_shareCommand;
  else
    return (_SFPBShareCommand *)0;
}

- (void)setCopyCommand:(id)a3
{
  _SFPBCopyCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBCopyCommand *copyCommand;

  v4 = (_SFPBCopyCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 31;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  copyCommand = self->_copyCommand;
  self->_copyCommand = v4;

}

- (_SFPBCopyCommand)copyCommand
{
  if (self->_whichValue == 31)
    return self->_copyCommand;
  else
    return 0;
}

- (void)setToggleWatchListStatusCommand:(id)a3
{
  _SFPBToggleWatchListStatusCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;

  v4 = (_SFPBToggleWatchListStatusCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  self->_whichValue = 32 * (v4 != 0);
  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = v4;

}

- (_SFPBToggleWatchListStatusCommand)toggleWatchListStatusCommand
{
  if (self->_whichValue == 32)
    return self->_toggleWatchListStatusCommand;
  else
    return (_SFPBToggleWatchListStatusCommand *)0;
}

- (void)setShowPhotosOneUpViewCommand:(id)a3
{
  _SFPBShowPhotosOneUpViewCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;

  v4 = (_SFPBShowPhotosOneUpViewCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 33;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = v4;

}

- (_SFPBShowPhotosOneUpViewCommand)showPhotosOneUpViewCommand
{
  if (self->_whichValue == 33)
    return self->_showPhotosOneUpViewCommand;
  else
    return (_SFPBShowPhotosOneUpViewCommand *)0;
}

- (void)setPlayMediaCommand:(id)a3
{
  _SFPBPlayMediaCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPlayMediaCommand *playMediaCommand;

  v4 = (_SFPBPlayMediaCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 34;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = v4;

}

- (_SFPBPlayMediaCommand)playMediaCommand
{
  if (self->_whichValue == 34)
    return self->_playMediaCommand;
  else
    return (_SFPBPlayMediaCommand *)0;
}

- (void)setOpenMediaCommand:(id)a3
{
  _SFPBOpenMediaCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBOpenMediaCommand *openMediaCommand;

  v4 = (_SFPBOpenMediaCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 35;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = v4;

}

- (_SFPBOpenMediaCommand)openMediaCommand
{
  if (self->_whichValue == 35)
    return self->_openMediaCommand;
  else
    return (_SFPBOpenMediaCommand *)0;
}

- (void)setAddToPhotosLibraryCommand:(id)a3
{
  _SFPBAddToPhotosLibraryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;

  v4 = (_SFPBAddToPhotosLibraryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 36;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = v4;

}

- (_SFPBAddToPhotosLibraryCommand)addToPhotosLibraryCommand
{
  if (self->_whichValue == 36)
    return self->_addToPhotosLibraryCommand;
  else
    return (_SFPBAddToPhotosLibraryCommand *)0;
}

- (void)setPerformContactActionCommand:(id)a3
{
  _SFPBPerformContactActionCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBPerformContactActionCommand *performContactActionCommand;

  v4 = (_SFPBPerformContactActionCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 37;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = v4;

}

- (_SFPBPerformContactActionCommand)performContactActionCommand
{
  if (self->_whichValue == 37)
    return self->_performContactActionCommand;
  else
    return (_SFPBPerformContactActionCommand *)0;
}

- (void)setExpandInlineCommand:(id)a3
{
  _SFPBExpandInlineCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBExpandInlineCommand *expandInlineCommand;

  v4 = (_SFPBExpandInlineCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 38;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = v4;

}

- (_SFPBExpandInlineCommand)expandInlineCommand
{
  if (self->_whichValue == 38)
    return self->_expandInlineCommand;
  else
    return (_SFPBExpandInlineCommand *)0;
}

- (void)setSubscribeForUpdatesCommand:(id)a3
{
  _SFPBSubscribeForUpdatesCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;

  v4 = (_SFPBSubscribeForUpdatesCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 39;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = v4;

}

- (_SFPBSubscribeForUpdatesCommand)subscribeForUpdatesCommand
{
  if (self->_whichValue == 39)
    return self->_subscribeForUpdatesCommand;
  else
    return (_SFPBSubscribeForUpdatesCommand *)0;
}

- (void)setViewEmailCommand:(id)a3
{
  _SFPBViewEmailCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBViewEmailCommand *viewEmailCommand;

  v4 = (_SFPBViewEmailCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 40;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = v4;

}

- (_SFPBViewEmailCommand)viewEmailCommand
{
  if (self->_whichValue == 40)
    return self->_viewEmailCommand;
  else
    return (_SFPBViewEmailCommand *)0;
}

- (void)setRejectPeopleInPhotoCommand:(id)a3
{
  _SFPBRejectPeopleInPhotoCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;

  v4 = (_SFPBRejectPeopleInPhotoCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 41;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = v4;

}

- (_SFPBRejectPeopleInPhotoCommand)rejectPeopleInPhotoCommand
{
  if (self->_whichValue == 41)
    return self->_rejectPeopleInPhotoCommand;
  else
    return (_SFPBRejectPeopleInPhotoCommand *)0;
}

- (void)setShowWrapperResponseViewCommand:(id)a3
{
  _SFPBShowWrapperResponseViewCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;

  v4 = (_SFPBShowWrapperResponseViewCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 42;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = v4;

}

- (_SFPBShowWrapperResponseViewCommand)showWrapperResponseViewCommand
{
  if (self->_whichValue == 42)
    return self->_showWrapperResponseViewCommand;
  else
    return (_SFPBShowWrapperResponseViewCommand *)0;
}

- (void)setClearProactiveCategoryCommand:(id)a3
{
  _SFPBClearProactiveCategoryCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;

  v4 = (_SFPBClearProactiveCategoryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 43;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = v4;

}

- (_SFPBClearProactiveCategoryCommand)clearProactiveCategoryCommand
{
  if (self->_whichValue == 43)
    return self->_clearProactiveCategoryCommand;
  else
    return (_SFPBClearProactiveCategoryCommand *)0;
}

- (void)setCreateContactCommand:(id)a3
{
  _SFPBCreateContactCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBCreateContactCommand *createContactCommand;

  v4 = (_SFPBCreateContactCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 44;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = v4;

}

- (_SFPBCreateContactCommand)createContactCommand
{
  if (self->_whichValue == 44)
    return self->_createContactCommand;
  else
    return (_SFPBCreateContactCommand *)0;
}

- (void)setCreateCalendarEventCommand:(id)a3
{
  _SFPBCreateCalendarEventCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;

  v4 = (_SFPBCreateCalendarEventCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 45;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = v4;

}

- (_SFPBCreateCalendarEventCommand)createCalendarEventCommand
{
  if (self->_whichValue == 45)
    return self->_createCalendarEventCommand;
  else
    return (_SFPBCreateCalendarEventCommand *)0;
}

- (void)setCreateReminderCommand:(id)a3
{
  _SFPBCreateReminderCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBCreateReminderCommand *createReminderCommand;

  v4 = (_SFPBCreateReminderCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 46;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = v4;

}

- (_SFPBCreateReminderCommand)createReminderCommand
{
  if (self->_whichValue == 46)
    return self->_createReminderCommand;
  else
    return (_SFPBCreateReminderCommand *)0;
}

- (void)setManageReservationCommand:(id)a3
{
  _SFPBManageReservationCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBManageReservationCommand *manageReservationCommand;

  v4 = (_SFPBManageReservationCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 47;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = v4;

}

- (_SFPBManageReservationCommand)manageReservationCommand
{
  if (self->_whichValue == 47)
    return self->_manageReservationCommand;
  else
    return (_SFPBManageReservationCommand *)0;
}

- (void)setUpdateSportsFollowingStatusCommand:(id)a3
{
  _SFPBUpdateSportsFollowingStatusCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;

  v4 = (_SFPBUpdateSportsFollowingStatusCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 48;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = v4;

}

- (_SFPBUpdateSportsFollowingStatusCommand)updateSportsFollowingStatusCommand
{
  if (self->_whichValue == 48)
    return self->_updateSportsFollowingStatusCommand;
  else
    return (_SFPBUpdateSportsFollowingStatusCommand *)0;
}

- (void)setRequestProductPageCommand:(id)a3
{
  _SFPBRequestProductPageCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBFlightCheckinCommand *flightCheckinCommand;
  unint64_t v54;
  _SFPBRequestProductPageCommand *requestProductPageCommand;

  v4 = (_SFPBRequestProductPageCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  v54 = 49;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = v4;

}

- (_SFPBRequestProductPageCommand)requestProductPageCommand
{
  if (self->_whichValue == 49)
    return self->_requestProductPageCommand;
  else
    return (_SFPBRequestProductPageCommand *)0;
}

- (void)setFlightCheckinCommand:(id)a3
{
  _SFPBFlightCheckinCommand *v4;
  _SFPBShowContactCardCommand *showContactCardCommand;
  _SFPBShowSFCardCommand *showSFCardCommand;
  _SFPBShowAppStoreSheetCommand *showAppStoreSheetCommand;
  _SFPBOpenPunchoutCommand *openPunchoutCommand;
  _SFPBOpenFileProviderItemCommand *openFileProviderItemCommand;
  _SFPBOpenAppClipCommand *openAppClipCommand;
  _SFPBOpenWebClipCommand *openWebClipCommand;
  _SFPBRequestAppClipInstallCommand *requestAppClipInstallCommand;
  _SFPBRequestUserReportCommand *requestUserReportCommand;
  _SFPBLaunchAppCommand *launchAppCommand;
  _SFPBRunVoiceShortcutCommand *runVoiceShortcutCommand;
  _SFPBIndexedUserActivityCommand *indexedUserActivityCommand;
  _SFPBOpenCoreSpotlightItemCommand *openCoreSpotlightItemCommand;
  _SFPBPerformIntentCommand *performIntentCommand;
  _SFPBSearchInAppCommand *searchInAppCommand;
  _SFPBUpdateSearchQueryCommand *updateSearchQueryCommand;
  _SFPBSearchWebCommand *searchWebCommand;
  _SFPBInvokeSiriCommand *invokeSiriCommand;
  _SFPBPerformContactQueryCommand *performContactQueryCommand;
  _SFPBOpenCalculationCommand *openCalculationCommand;
  _SFPBPlayVideoCommand *playVideoCommand;
  _SFPBCallCommand *callCommand;
  _SFPBEmailCommand *emailCommand;
  _SFPBBeginMapsRoutingCommand *beginMapsRoutingCommand;
  _SFPBToggleAudioCommand *toggleAudioCommand;
  _SFPBPerformPersonEntityQueryCommand *performPersonEntityQueryCommand;
  _SFPBShowPurchaseRequestSheetCommand *showPurchaseRequestSheetCommand;
  _SFPBShowScreenTimeRequestSheetCommand *showScreenTimeRequestSheetCommand;
  _SFPBPerformEntityQueryCommand *performEntityQueryCommand;
  _SFPBShareCommand *shareCommand;
  _SFPBCopyCommand *copyCommand;
  _SFPBToggleWatchListStatusCommand *toggleWatchListStatusCommand;
  _SFPBShowPhotosOneUpViewCommand *showPhotosOneUpViewCommand;
  _SFPBPlayMediaCommand *playMediaCommand;
  _SFPBOpenMediaCommand *openMediaCommand;
  _SFPBAddToPhotosLibraryCommand *addToPhotosLibraryCommand;
  _SFPBPerformContactActionCommand *performContactActionCommand;
  _SFPBExpandInlineCommand *expandInlineCommand;
  _SFPBSubscribeForUpdatesCommand *subscribeForUpdatesCommand;
  _SFPBViewEmailCommand *viewEmailCommand;
  _SFPBRejectPeopleInPhotoCommand *rejectPeopleInPhotoCommand;
  _SFPBShowWrapperResponseViewCommand *showWrapperResponseViewCommand;
  _SFPBClearProactiveCategoryCommand *clearProactiveCategoryCommand;
  _SFPBCreateContactCommand *createContactCommand;
  _SFPBCreateCalendarEventCommand *createCalendarEventCommand;
  _SFPBCreateReminderCommand *createReminderCommand;
  _SFPBManageReservationCommand *manageReservationCommand;
  _SFPBUpdateSportsFollowingStatusCommand *updateSportsFollowingStatusCommand;
  _SFPBRequestProductPageCommand *requestProductPageCommand;
  unint64_t v54;
  _SFPBFlightCheckinCommand *flightCheckinCommand;

  v4 = (_SFPBFlightCheckinCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  v54 = 50;
  if (!v4)
    v54 = 0;
  self->_whichValue = v54;
  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = v4;

}

- (_SFPBFlightCheckinCommand)flightCheckinCommand
{
  if (self->_whichValue == 50)
    return self->_flightCheckinCommand;
  else
    return (_SFPBFlightCheckinCommand *)0;
}

- (void)setCommandDetail:(id)a3
{
  NSString *v4;
  NSString *commandDetail;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  commandDetail = self->_commandDetail;
  self->_commandDetail = v4;

}

- (void)setNormalizedTopic:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedTopic, a3);
}

- (void)setBackendData:(id)a3
{
  NSData *v4;
  NSData *backendData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  backendData = self->_backendData;
  self->_backendData = v4;

}

- (void)setCommandReference:(id)a3
{
  objc_storeStrong((id *)&self->_commandReference, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  _SFPBCopyCommand *v34;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v58 = a3;
  -[_SFPBCommand showContactCardCommand](self, "showContactCardCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showSFCardCommand](self, "showSFCardCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showAppStoreSheetCommand](self, "showAppStoreSheetCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openPunchoutCommand](self, "openPunchoutCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openFileProviderItemCommand](self, "openFileProviderItemCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openAppClipCommand](self, "openAppClipCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openWebClipCommand](self, "openWebClipCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand requestAppClipInstallCommand](self, "requestAppClipInstallCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand requestUserReportCommand](self, "requestUserReportCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand launchAppCommand](self, "launchAppCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand runVoiceShortcutCommand](self, "runVoiceShortcutCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand indexedUserActivityCommand](self, "indexedUserActivityCommand");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openCoreSpotlightItemCommand](self, "openCoreSpotlightItemCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand performIntentCommand](self, "performIntentCommand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand searchInAppCommand](self, "searchInAppCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand updateSearchQueryCommand](self, "updateSearchQueryCommand");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand searchWebCommand](self, "searchWebCommand");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand invokeSiriCommand](self, "invokeSiriCommand");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand performContactQueryCommand](self, "performContactQueryCommand");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openCalculationCommand](self, "openCalculationCommand");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand playVideoCommand](self, "playVideoCommand");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand callCommand](self, "callCommand");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand emailCommand](self, "emailCommand");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand beginMapsRoutingCommand](self, "beginMapsRoutingCommand");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand toggleAudioCommand](self, "toggleAudioCommand");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand performPersonEntityQueryCommand](self, "performPersonEntityQueryCommand");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showPurchaseRequestSheetCommand](self, "showPurchaseRequestSheetCommand");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showScreenTimeRequestSheetCommand](self, "showScreenTimeRequestSheetCommand");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand performEntityQueryCommand](self, "performEntityQueryCommand");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand shareCommand](self, "shareCommand");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    PBDataWriterWriteSubmessage();

  v34 = -[_SFPBCommand copyCommand](self, "copyCommand");
  if (v34)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand toggleWatchListStatusCommand](self, "toggleWatchListStatusCommand");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showPhotosOneUpViewCommand](self, "showPhotosOneUpViewCommand");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand playMediaCommand](self, "playMediaCommand");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand openMediaCommand](self, "openMediaCommand");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand addToPhotosLibraryCommand](self, "addToPhotosLibraryCommand");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand performContactActionCommand](self, "performContactActionCommand");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand expandInlineCommand](self, "expandInlineCommand");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand subscribeForUpdatesCommand](self, "subscribeForUpdatesCommand");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand viewEmailCommand](self, "viewEmailCommand");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand rejectPeopleInPhotoCommand](self, "rejectPeopleInPhotoCommand");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand showWrapperResponseViewCommand](self, "showWrapperResponseViewCommand");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand clearProactiveCategoryCommand](self, "clearProactiveCategoryCommand");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand createContactCommand](self, "createContactCommand");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand createCalendarEventCommand](self, "createCalendarEventCommand");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand createReminderCommand](self, "createReminderCommand");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand manageReservationCommand](self, "manageReservationCommand");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand updateSportsFollowingStatusCommand](self, "updateSportsFollowingStatusCommand");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand requestProductPageCommand](self, "requestProductPageCommand");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand flightCheckinCommand](self, "flightCheckinCommand");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand commandDetail](self, "commandDetail");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
    PBDataWriterWriteStringField();

  -[_SFPBCommand normalizedTopic](self, "normalizedTopic");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommand backendData](self, "backendData");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    PBDataWriterWriteDataField();

  -[_SFPBCommand commandReference](self, "commandReference");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _SFPBCopyCommand *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  _SFPBCopyCommand *v157;
  _SFPBCopyCommand *v158;
  _SFPBCopyCommand *v159;
  void *v160;
  _BOOL4 v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  int v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  int v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  int v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  int v226;
  uint64_t v227;
  void *v228;
  void *v229;
  void *v230;
  int v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  int v236;
  uint64_t v237;
  void *v238;
  void *v239;
  void *v240;
  int v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  int v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  int v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  int v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  int v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  int v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  int v271;
  uint64_t v272;
  void *v273;
  void *v274;
  void *v275;
  char v276;
  BOOL v277;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_272;
  -[_SFPBCommand showContactCardCommand](self, "showContactCardCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showContactCardCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showContactCardCommand](self, "showContactCardCommand");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCommand showContactCardCommand](self, "showContactCardCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showContactCardCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showSFCardCommand](self, "showSFCardCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showSFCardCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showSFCardCommand](self, "showSFCardCommand");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCommand showSFCardCommand](self, "showSFCardCommand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showSFCardCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showAppStoreSheetCommand](self, "showAppStoreSheetCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAppStoreSheetCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showAppStoreSheetCommand](self, "showAppStoreSheetCommand");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCommand showAppStoreSheetCommand](self, "showAppStoreSheetCommand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showAppStoreSheetCommand");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openPunchoutCommand](self, "openPunchoutCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openPunchoutCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openPunchoutCommand](self, "openPunchoutCommand");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBCommand openPunchoutCommand](self, "openPunchoutCommand");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openPunchoutCommand");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openFileProviderItemCommand](self, "openFileProviderItemCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openFileProviderItemCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openFileProviderItemCommand](self, "openFileProviderItemCommand");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBCommand openFileProviderItemCommand](self, "openFileProviderItemCommand");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openFileProviderItemCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openAppClipCommand](self, "openAppClipCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openAppClipCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openAppClipCommand](self, "openAppClipCommand");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBCommand openAppClipCommand](self, "openAppClipCommand");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openAppClipCommand");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openWebClipCommand](self, "openWebClipCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openWebClipCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openWebClipCommand](self, "openWebClipCommand");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBCommand openWebClipCommand](self, "openWebClipCommand");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openWebClipCommand");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand requestAppClipInstallCommand](self, "requestAppClipInstallCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestAppClipInstallCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand requestAppClipInstallCommand](self, "requestAppClipInstallCommand");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBCommand requestAppClipInstallCommand](self, "requestAppClipInstallCommand");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestAppClipInstallCommand");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand requestUserReportCommand](self, "requestUserReportCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestUserReportCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand requestUserReportCommand](self, "requestUserReportCommand");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBCommand requestUserReportCommand](self, "requestUserReportCommand");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestUserReportCommand");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand launchAppCommand](self, "launchAppCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchAppCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand launchAppCommand](self, "launchAppCommand");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBCommand launchAppCommand](self, "launchAppCommand");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchAppCommand");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand runVoiceShortcutCommand](self, "runVoiceShortcutCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runVoiceShortcutCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand runVoiceShortcutCommand](self, "runVoiceShortcutCommand");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBCommand runVoiceShortcutCommand](self, "runVoiceShortcutCommand");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runVoiceShortcutCommand");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand indexedUserActivityCommand](self, "indexedUserActivityCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexedUserActivityCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand indexedUserActivityCommand](self, "indexedUserActivityCommand");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_SFPBCommand indexedUserActivityCommand](self, "indexedUserActivityCommand");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexedUserActivityCommand");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openCoreSpotlightItemCommand](self, "openCoreSpotlightItemCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCoreSpotlightItemCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openCoreSpotlightItemCommand](self, "openCoreSpotlightItemCommand");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_SFPBCommand openCoreSpotlightItemCommand](self, "openCoreSpotlightItemCommand");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openCoreSpotlightItemCommand");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand performIntentCommand](self, "performIntentCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performIntentCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand performIntentCommand](self, "performIntentCommand");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_SFPBCommand performIntentCommand](self, "performIntentCommand");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performIntentCommand");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand searchInAppCommand](self, "searchInAppCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchInAppCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand searchInAppCommand](self, "searchInAppCommand");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[_SFPBCommand searchInAppCommand](self, "searchInAppCommand");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchInAppCommand");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand updateSearchQueryCommand](self, "updateSearchQueryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSearchQueryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand updateSearchQueryCommand](self, "updateSearchQueryCommand");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[_SFPBCommand updateSearchQueryCommand](self, "updateSearchQueryCommand");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSearchQueryCommand");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand searchWebCommand](self, "searchWebCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchWebCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand searchWebCommand](self, "searchWebCommand");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[_SFPBCommand searchWebCommand](self, "searchWebCommand");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchWebCommand");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand invokeSiriCommand](self, "invokeSiriCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeSiriCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand invokeSiriCommand](self, "invokeSiriCommand");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[_SFPBCommand invokeSiriCommand](self, "invokeSiriCommand");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeSiriCommand");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand performContactQueryCommand](self, "performContactQueryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performContactQueryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand performContactQueryCommand](self, "performContactQueryCommand");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    -[_SFPBCommand performContactQueryCommand](self, "performContactQueryCommand");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performContactQueryCommand");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v99, "isEqual:", v100);

    if (!v101)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openCalculationCommand](self, "openCalculationCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCalculationCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openCalculationCommand](self, "openCalculationCommand");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[_SFPBCommand openCalculationCommand](self, "openCalculationCommand");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openCalculationCommand");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if (!v106)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand playVideoCommand](self, "playVideoCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playVideoCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand playVideoCommand](self, "playVideoCommand");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_SFPBCommand playVideoCommand](self, "playVideoCommand");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playVideoCommand");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand callCommand](self, "callCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand callCommand](self, "callCommand");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    -[_SFPBCommand callCommand](self, "callCommand");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callCommand");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "isEqual:", v115);

    if (!v116)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand emailCommand](self, "emailCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand emailCommand](self, "emailCommand");
  v117 = objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    v118 = (void *)v117;
    -[_SFPBCommand emailCommand](self, "emailCommand");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailCommand");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v119, "isEqual:", v120);

    if (!v121)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand beginMapsRoutingCommand](self, "beginMapsRoutingCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginMapsRoutingCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand beginMapsRoutingCommand](self, "beginMapsRoutingCommand");
  v122 = objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    v123 = (void *)v122;
    -[_SFPBCommand beginMapsRoutingCommand](self, "beginMapsRoutingCommand");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginMapsRoutingCommand");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v124, "isEqual:", v125);

    if (!v126)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand toggleAudioCommand](self, "toggleAudioCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleAudioCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand toggleAudioCommand](self, "toggleAudioCommand");
  v127 = objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    v128 = (void *)v127;
    -[_SFPBCommand toggleAudioCommand](self, "toggleAudioCommand");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleAudioCommand");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v129, "isEqual:", v130);

    if (!v131)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand performPersonEntityQueryCommand](self, "performPersonEntityQueryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performPersonEntityQueryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand performPersonEntityQueryCommand](self, "performPersonEntityQueryCommand");
  v132 = objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    v133 = (void *)v132;
    -[_SFPBCommand performPersonEntityQueryCommand](self, "performPersonEntityQueryCommand");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performPersonEntityQueryCommand");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v134, "isEqual:", v135);

    if (!v136)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showPurchaseRequestSheetCommand](self, "showPurchaseRequestSheetCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showPurchaseRequestSheetCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showPurchaseRequestSheetCommand](self, "showPurchaseRequestSheetCommand");
  v137 = objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    v138 = (void *)v137;
    -[_SFPBCommand showPurchaseRequestSheetCommand](self, "showPurchaseRequestSheetCommand");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showPurchaseRequestSheetCommand");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(v139, "isEqual:", v140);

    if (!v141)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showScreenTimeRequestSheetCommand](self, "showScreenTimeRequestSheetCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showScreenTimeRequestSheetCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showScreenTimeRequestSheetCommand](self, "showScreenTimeRequestSheetCommand");
  v142 = objc_claimAutoreleasedReturnValue();
  if (v142)
  {
    v143 = (void *)v142;
    -[_SFPBCommand showScreenTimeRequestSheetCommand](self, "showScreenTimeRequestSheetCommand");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showScreenTimeRequestSheetCommand");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v144, "isEqual:", v145);

    if (!v146)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand performEntityQueryCommand](self, "performEntityQueryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performEntityQueryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand performEntityQueryCommand](self, "performEntityQueryCommand");
  v147 = objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    v148 = (void *)v147;
    -[_SFPBCommand performEntityQueryCommand](self, "performEntityQueryCommand");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performEntityQueryCommand");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v149, "isEqual:", v150);

    if (!v151)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand shareCommand](self, "shareCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand shareCommand](self, "shareCommand");
  v152 = objc_claimAutoreleasedReturnValue();
  if (v152)
  {
    v153 = (void *)v152;
    -[_SFPBCommand shareCommand](self, "shareCommand");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shareCommand");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(v154, "isEqual:", v155);

    if (!v156)
      goto LABEL_272;
  }
  else
  {

  }
  v5 = -[_SFPBCommand copyCommand](self, "copyCommand");
  v6 = (void *)objc_msgSend(v4, "copyCommand");
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  v157 = -[_SFPBCommand copyCommand](self, "copyCommand");
  if (v157)
  {
    v158 = v157;
    v159 = -[_SFPBCommand copyCommand](self, "copyCommand");
    v160 = (void *)objc_msgSend(v4, "copyCommand");
    v161 = -[_SFPBCopyCommand isEqual:](v159, "isEqual:", v160);

    if (!v161)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand toggleWatchListStatusCommand](self, "toggleWatchListStatusCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleWatchListStatusCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand toggleWatchListStatusCommand](self, "toggleWatchListStatusCommand");
  v162 = objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    v163 = (void *)v162;
    -[_SFPBCommand toggleWatchListStatusCommand](self, "toggleWatchListStatusCommand");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleWatchListStatusCommand");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v164, "isEqual:", v165);

    if (!v166)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showPhotosOneUpViewCommand](self, "showPhotosOneUpViewCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showPhotosOneUpViewCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showPhotosOneUpViewCommand](self, "showPhotosOneUpViewCommand");
  v167 = objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    v168 = (void *)v167;
    -[_SFPBCommand showPhotosOneUpViewCommand](self, "showPhotosOneUpViewCommand");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showPhotosOneUpViewCommand");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = objc_msgSend(v169, "isEqual:", v170);

    if (!v171)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand playMediaCommand](self, "playMediaCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playMediaCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand playMediaCommand](self, "playMediaCommand");
  v172 = objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v173 = (void *)v172;
    -[_SFPBCommand playMediaCommand](self, "playMediaCommand");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playMediaCommand");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v174, "isEqual:", v175);

    if (!v176)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand openMediaCommand](self, "openMediaCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openMediaCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand openMediaCommand](self, "openMediaCommand");
  v177 = objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    v178 = (void *)v177;
    -[_SFPBCommand openMediaCommand](self, "openMediaCommand");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openMediaCommand");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v179, "isEqual:", v180);

    if (!v181)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand addToPhotosLibraryCommand](self, "addToPhotosLibraryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToPhotosLibraryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand addToPhotosLibraryCommand](self, "addToPhotosLibraryCommand");
  v182 = objc_claimAutoreleasedReturnValue();
  if (v182)
  {
    v183 = (void *)v182;
    -[_SFPBCommand addToPhotosLibraryCommand](self, "addToPhotosLibraryCommand");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addToPhotosLibraryCommand");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend(v184, "isEqual:", v185);

    if (!v186)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand performContactActionCommand](self, "performContactActionCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performContactActionCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand performContactActionCommand](self, "performContactActionCommand");
  v187 = objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    v188 = (void *)v187;
    -[_SFPBCommand performContactActionCommand](self, "performContactActionCommand");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performContactActionCommand");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend(v189, "isEqual:", v190);

    if (!v191)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand expandInlineCommand](self, "expandInlineCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expandInlineCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand expandInlineCommand](self, "expandInlineCommand");
  v192 = objc_claimAutoreleasedReturnValue();
  if (v192)
  {
    v193 = (void *)v192;
    -[_SFPBCommand expandInlineCommand](self, "expandInlineCommand");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expandInlineCommand");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_msgSend(v194, "isEqual:", v195);

    if (!v196)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand subscribeForUpdatesCommand](self, "subscribeForUpdatesCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribeForUpdatesCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand subscribeForUpdatesCommand](self, "subscribeForUpdatesCommand");
  v197 = objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    v198 = (void *)v197;
    -[_SFPBCommand subscribeForUpdatesCommand](self, "subscribeForUpdatesCommand");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscribeForUpdatesCommand");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend(v199, "isEqual:", v200);

    if (!v201)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand viewEmailCommand](self, "viewEmailCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewEmailCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand viewEmailCommand](self, "viewEmailCommand");
  v202 = objc_claimAutoreleasedReturnValue();
  if (v202)
  {
    v203 = (void *)v202;
    -[_SFPBCommand viewEmailCommand](self, "viewEmailCommand");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewEmailCommand");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v204, "isEqual:", v205);

    if (!v206)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand rejectPeopleInPhotoCommand](self, "rejectPeopleInPhotoCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rejectPeopleInPhotoCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand rejectPeopleInPhotoCommand](self, "rejectPeopleInPhotoCommand");
  v207 = objc_claimAutoreleasedReturnValue();
  if (v207)
  {
    v208 = (void *)v207;
    -[_SFPBCommand rejectPeopleInPhotoCommand](self, "rejectPeopleInPhotoCommand");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rejectPeopleInPhotoCommand");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend(v209, "isEqual:", v210);

    if (!v211)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand showWrapperResponseViewCommand](self, "showWrapperResponseViewCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showWrapperResponseViewCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand showWrapperResponseViewCommand](self, "showWrapperResponseViewCommand");
  v212 = objc_claimAutoreleasedReturnValue();
  if (v212)
  {
    v213 = (void *)v212;
    -[_SFPBCommand showWrapperResponseViewCommand](self, "showWrapperResponseViewCommand");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showWrapperResponseViewCommand");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend(v214, "isEqual:", v215);

    if (!v216)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand clearProactiveCategoryCommand](self, "clearProactiveCategoryCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearProactiveCategoryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand clearProactiveCategoryCommand](self, "clearProactiveCategoryCommand");
  v217 = objc_claimAutoreleasedReturnValue();
  if (v217)
  {
    v218 = (void *)v217;
    -[_SFPBCommand clearProactiveCategoryCommand](self, "clearProactiveCategoryCommand");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearProactiveCategoryCommand");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = objc_msgSend(v219, "isEqual:", v220);

    if (!v221)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand createContactCommand](self, "createContactCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createContactCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand createContactCommand](self, "createContactCommand");
  v222 = objc_claimAutoreleasedReturnValue();
  if (v222)
  {
    v223 = (void *)v222;
    -[_SFPBCommand createContactCommand](self, "createContactCommand");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createContactCommand");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_msgSend(v224, "isEqual:", v225);

    if (!v226)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand createCalendarEventCommand](self, "createCalendarEventCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createCalendarEventCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand createCalendarEventCommand](self, "createCalendarEventCommand");
  v227 = objc_claimAutoreleasedReturnValue();
  if (v227)
  {
    v228 = (void *)v227;
    -[_SFPBCommand createCalendarEventCommand](self, "createCalendarEventCommand");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createCalendarEventCommand");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = objc_msgSend(v229, "isEqual:", v230);

    if (!v231)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand createReminderCommand](self, "createReminderCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createReminderCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand createReminderCommand](self, "createReminderCommand");
  v232 = objc_claimAutoreleasedReturnValue();
  if (v232)
  {
    v233 = (void *)v232;
    -[_SFPBCommand createReminderCommand](self, "createReminderCommand");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createReminderCommand");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v234, "isEqual:", v235);

    if (!v236)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand manageReservationCommand](self, "manageReservationCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manageReservationCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand manageReservationCommand](self, "manageReservationCommand");
  v237 = objc_claimAutoreleasedReturnValue();
  if (v237)
  {
    v238 = (void *)v237;
    -[_SFPBCommand manageReservationCommand](self, "manageReservationCommand");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manageReservationCommand");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v241 = objc_msgSend(v239, "isEqual:", v240);

    if (!v241)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand updateSportsFollowingStatusCommand](self, "updateSportsFollowingStatusCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSportsFollowingStatusCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand updateSportsFollowingStatusCommand](self, "updateSportsFollowingStatusCommand");
  v242 = objc_claimAutoreleasedReturnValue();
  if (v242)
  {
    v243 = (void *)v242;
    -[_SFPBCommand updateSportsFollowingStatusCommand](self, "updateSportsFollowingStatusCommand");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSportsFollowingStatusCommand");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = objc_msgSend(v244, "isEqual:", v245);

    if (!v246)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand requestProductPageCommand](self, "requestProductPageCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestProductPageCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand requestProductPageCommand](self, "requestProductPageCommand");
  v247 = objc_claimAutoreleasedReturnValue();
  if (v247)
  {
    v248 = (void *)v247;
    -[_SFPBCommand requestProductPageCommand](self, "requestProductPageCommand");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestProductPageCommand");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v249, "isEqual:", v250);

    if (!v251)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand flightCheckinCommand](self, "flightCheckinCommand");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightCheckinCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand flightCheckinCommand](self, "flightCheckinCommand");
  v252 = objc_claimAutoreleasedReturnValue();
  if (v252)
  {
    v253 = (void *)v252;
    -[_SFPBCommand flightCheckinCommand](self, "flightCheckinCommand");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightCheckinCommand");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = objc_msgSend(v254, "isEqual:", v255);

    if (!v256)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand commandDetail](self, "commandDetail");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand commandDetail](self, "commandDetail");
  v257 = objc_claimAutoreleasedReturnValue();
  if (v257)
  {
    v258 = (void *)v257;
    -[_SFPBCommand commandDetail](self, "commandDetail");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandDetail");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = objc_msgSend(v259, "isEqual:", v260);

    if (!v261)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand normalizedTopic](self, "normalizedTopic");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand normalizedTopic](self, "normalizedTopic");
  v262 = objc_claimAutoreleasedReturnValue();
  if (v262)
  {
    v263 = (void *)v262;
    -[_SFPBCommand normalizedTopic](self, "normalizedTopic");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedTopic");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = objc_msgSend(v264, "isEqual:", v265);

    if (!v266)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand backendData](self, "backendData");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backendData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_271;
  -[_SFPBCommand backendData](self, "backendData");
  v267 = objc_claimAutoreleasedReturnValue();
  if (v267)
  {
    v268 = (void *)v267;
    -[_SFPBCommand backendData](self, "backendData");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backendData");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = objc_msgSend(v269, "isEqual:", v270);

    if (!v271)
      goto LABEL_272;
  }
  else
  {

  }
  -[_SFPBCommand commandReference](self, "commandReference");
  v5 = (_SFPBCopyCommand *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBCommand commandReference](self, "commandReference");
    v272 = objc_claimAutoreleasedReturnValue();
    if (!v272)
    {

LABEL_275:
      v277 = 1;
      goto LABEL_273;
    }
    v273 = (void *)v272;
    -[_SFPBCommand commandReference](self, "commandReference");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandReference");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = objc_msgSend(v274, "isEqual:", v275);

    if ((v276 & 1) != 0)
      goto LABEL_275;
  }
  else
  {
LABEL_271:

  }
LABEL_272:
  v277 = 0;
LABEL_273:

  return v277;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  NSUInteger v53;
  unint64_t v54;
  uint64_t v55;

  v3 = -[_SFPBShowContactCardCommand hash](self->_showContactCardCommand, "hash");
  v4 = -[_SFPBShowSFCardCommand hash](self->_showSFCardCommand, "hash") ^ v3;
  v5 = -[_SFPBShowAppStoreSheetCommand hash](self->_showAppStoreSheetCommand, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBOpenPunchoutCommand hash](self->_openPunchoutCommand, "hash");
  v7 = -[_SFPBOpenFileProviderItemCommand hash](self->_openFileProviderItemCommand, "hash");
  v8 = v7 ^ -[_SFPBOpenAppClipCommand hash](self->_openAppClipCommand, "hash");
  v9 = v6 ^ v8 ^ -[_SFPBOpenWebClipCommand hash](self->_openWebClipCommand, "hash");
  v10 = -[_SFPBRequestAppClipInstallCommand hash](self->_requestAppClipInstallCommand, "hash");
  v11 = v10 ^ -[_SFPBRequestUserReportCommand hash](self->_requestUserReportCommand, "hash");
  v12 = v11 ^ -[_SFPBLaunchAppCommand hash](self->_launchAppCommand, "hash");
  v13 = v9 ^ v12 ^ -[_SFPBRunVoiceShortcutCommand hash](self->_runVoiceShortcutCommand, "hash");
  v14 = -[_SFPBIndexedUserActivityCommand hash](self->_indexedUserActivityCommand, "hash");
  v15 = v14 ^ -[_SFPBOpenCoreSpotlightItemCommand hash](self->_openCoreSpotlightItemCommand, "hash");
  v16 = v15 ^ -[_SFPBPerformIntentCommand hash](self->_performIntentCommand, "hash");
  v17 = v16 ^ -[_SFPBSearchInAppCommand hash](self->_searchInAppCommand, "hash");
  v18 = v13 ^ v17 ^ -[_SFPBUpdateSearchQueryCommand hash](self->_updateSearchQueryCommand, "hash");
  v19 = -[_SFPBSearchWebCommand hash](self->_searchWebCommand, "hash");
  v20 = v19 ^ -[_SFPBInvokeSiriCommand hash](self->_invokeSiriCommand, "hash");
  v21 = v20 ^ -[_SFPBPerformContactQueryCommand hash](self->_performContactQueryCommand, "hash");
  v22 = v21 ^ -[_SFPBOpenCalculationCommand hash](self->_openCalculationCommand, "hash");
  v23 = v22 ^ -[_SFPBPlayVideoCommand hash](self->_playVideoCommand, "hash");
  v24 = v18 ^ v23 ^ -[_SFPBCallCommand hash](self->_callCommand, "hash");
  v25 = -[_SFPBEmailCommand hash](self->_emailCommand, "hash");
  v26 = v25 ^ -[_SFPBBeginMapsRoutingCommand hash](self->_beginMapsRoutingCommand, "hash");
  v27 = v26 ^ -[_SFPBToggleAudioCommand hash](self->_toggleAudioCommand, "hash");
  v28 = v27 ^ -[_SFPBPerformPersonEntityQueryCommand hash](self->_performPersonEntityQueryCommand, "hash");
  v29 = v28 ^ -[_SFPBShowPurchaseRequestSheetCommand hash](self->_showPurchaseRequestSheetCommand, "hash");
  v30 = v29 ^ -[_SFPBShowScreenTimeRequestSheetCommand hash](self->_showScreenTimeRequestSheetCommand, "hash");
  v31 = v24 ^ v30 ^ -[_SFPBPerformEntityQueryCommand hash](self->_performEntityQueryCommand, "hash");
  v32 = -[_SFPBShareCommand hash](self->_shareCommand, "hash");
  v33 = v32 ^ -[_SFPBCopyCommand hash](self->_copyCommand, "hash");
  v34 = v33 ^ -[_SFPBToggleWatchListStatusCommand hash](self->_toggleWatchListStatusCommand, "hash");
  v35 = v34 ^ -[_SFPBShowPhotosOneUpViewCommand hash](self->_showPhotosOneUpViewCommand, "hash");
  v36 = v35 ^ -[_SFPBPlayMediaCommand hash](self->_playMediaCommand, "hash");
  v37 = v36 ^ -[_SFPBOpenMediaCommand hash](self->_openMediaCommand, "hash");
  v38 = v37 ^ -[_SFPBAddToPhotosLibraryCommand hash](self->_addToPhotosLibraryCommand, "hash");
  v39 = v31 ^ v38 ^ -[_SFPBPerformContactActionCommand hash](self->_performContactActionCommand, "hash");
  v40 = -[_SFPBExpandInlineCommand hash](self->_expandInlineCommand, "hash");
  v41 = v40 ^ -[_SFPBSubscribeForUpdatesCommand hash](self->_subscribeForUpdatesCommand, "hash");
  v42 = v41 ^ -[_SFPBViewEmailCommand hash](self->_viewEmailCommand, "hash");
  v43 = v42 ^ -[_SFPBRejectPeopleInPhotoCommand hash](self->_rejectPeopleInPhotoCommand, "hash");
  v44 = v43 ^ -[_SFPBShowWrapperResponseViewCommand hash](self->_showWrapperResponseViewCommand, "hash");
  v45 = v44 ^ -[_SFPBClearProactiveCategoryCommand hash](self->_clearProactiveCategoryCommand, "hash");
  v46 = v45 ^ -[_SFPBCreateContactCommand hash](self->_createContactCommand, "hash");
  v47 = v46 ^ -[_SFPBCreateCalendarEventCommand hash](self->_createCalendarEventCommand, "hash");
  v48 = v39 ^ v47 ^ -[_SFPBCreateReminderCommand hash](self->_createReminderCommand, "hash");
  v49 = -[_SFPBManageReservationCommand hash](self->_manageReservationCommand, "hash");
  v50 = v49 ^ -[_SFPBUpdateSportsFollowingStatusCommand hash](self->_updateSportsFollowingStatusCommand, "hash");
  v51 = v50 ^ -[_SFPBRequestProductPageCommand hash](self->_requestProductPageCommand, "hash");
  v52 = v51 ^ -[_SFPBFlightCheckinCommand hash](self->_flightCheckinCommand, "hash");
  v53 = v52 ^ -[NSString hash](self->_commandDetail, "hash");
  v54 = v53 ^ -[_SFPBTopic hash](self->_normalizedTopic, "hash");
  v55 = v54 ^ -[NSData hash](self->_backendData, "hash");
  return v48 ^ v55 ^ -[_SFPBCommandReference hash](self->_commandReference, "hash");
}

- (id)dictionaryRepresentation
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
  _SFPBCopyCommand *v24;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_addToPhotosLibraryCommand)
  {
    -[_SFPBCommand addToPhotosLibraryCommand](self, "addToPhotosLibraryCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("addToPhotosLibraryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("addToPhotosLibraryCommand"));

    }
  }
  if (self->_backendData)
  {
    -[_SFPBCommand backendData](self, "backendData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("backendData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backendData"));

    }
  }
  if (self->_beginMapsRoutingCommand)
  {
    -[_SFPBCommand beginMapsRoutingCommand](self, "beginMapsRoutingCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("beginMapsRoutingCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("beginMapsRoutingCommand"));

    }
  }
  if (self->_callCommand)
  {
    -[_SFPBCommand callCommand](self, "callCommand");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("callCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("callCommand"));

    }
  }
  if (self->_clearProactiveCategoryCommand)
  {
    -[_SFPBCommand clearProactiveCategoryCommand](self, "clearProactiveCategoryCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("clearProactiveCategoryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("clearProactiveCategoryCommand"));

    }
  }
  if (self->_commandDetail)
  {
    -[_SFPBCommand commandDetail](self, "commandDetail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("commandDetail"));

  }
  if (self->_commandReference)
  {
    -[_SFPBCommand commandReference](self, "commandReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("commandReference"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("commandReference"));

    }
  }
  if (self->_copyCommand)
  {
    v24 = -[_SFPBCommand copyCommand](self, "copyCommand");
    -[_SFPBCopyCommand dictionaryRepresentation](v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("copyCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("copyCommand"));

    }
  }
  if (self->_createCalendarEventCommand)
  {
    -[_SFPBCommand createCalendarEventCommand](self, "createCalendarEventCommand");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("createCalendarEventCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("createCalendarEventCommand"));

    }
  }
  if (self->_createContactCommand)
  {
    -[_SFPBCommand createContactCommand](self, "createContactCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("createContactCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("createContactCommand"));

    }
  }
  if (self->_createReminderCommand)
  {
    -[_SFPBCommand createReminderCommand](self, "createReminderCommand");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("createReminderCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("createReminderCommand"));

    }
  }
  if (self->_emailCommand)
  {
    -[_SFPBCommand emailCommand](self, "emailCommand");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("emailCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("emailCommand"));

    }
  }
  if (self->_expandInlineCommand)
  {
    -[_SFPBCommand expandInlineCommand](self, "expandInlineCommand");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("expandInlineCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("expandInlineCommand"));

    }
  }
  if (self->_flightCheckinCommand)
  {
    -[_SFPBCommand flightCheckinCommand](self, "flightCheckinCommand");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("flightCheckinCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("flightCheckinCommand"));

    }
  }
  if (self->_indexedUserActivityCommand)
  {
    -[_SFPBCommand indexedUserActivityCommand](self, "indexedUserActivityCommand");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("indexedUserActivityCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("indexedUserActivityCommand"));

    }
  }
  if (self->_invokeSiriCommand)
  {
    -[_SFPBCommand invokeSiriCommand](self, "invokeSiriCommand");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("invokeSiriCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("invokeSiriCommand"));

    }
  }
  if (self->_launchAppCommand)
  {
    -[_SFPBCommand launchAppCommand](self, "launchAppCommand");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("launchAppCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("launchAppCommand"));

    }
  }
  if (self->_manageReservationCommand)
  {
    -[_SFPBCommand manageReservationCommand](self, "manageReservationCommand");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("manageReservationCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("manageReservationCommand"));

    }
  }
  if (self->_normalizedTopic)
  {
    -[_SFPBCommand normalizedTopic](self, "normalizedTopic");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("normalizedTopic"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("normalizedTopic"));

    }
  }
  if (self->_openAppClipCommand)
  {
    -[_SFPBCommand openAppClipCommand](self, "openAppClipCommand");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "dictionaryRepresentation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("openAppClipCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("openAppClipCommand"));

    }
  }
  if (self->_openCalculationCommand)
  {
    -[_SFPBCommand openCalculationCommand](self, "openCalculationCommand");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dictionaryRepresentation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("openCalculationCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("openCalculationCommand"));

    }
  }
  if (self->_openCoreSpotlightItemCommand)
  {
    -[_SFPBCommand openCoreSpotlightItemCommand](self, "openCoreSpotlightItemCommand");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "dictionaryRepresentation");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("openCoreSpotlightItemCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("openCoreSpotlightItemCommand"));

    }
  }
  if (self->_openFileProviderItemCommand)
  {
    -[_SFPBCommand openFileProviderItemCommand](self, "openFileProviderItemCommand");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("openFileProviderItemCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("openFileProviderItemCommand"));

    }
  }
  if (self->_openMediaCommand)
  {
    -[_SFPBCommand openMediaCommand](self, "openMediaCommand");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "dictionaryRepresentation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("openMediaCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("openMediaCommand"));

    }
  }
  if (self->_openPunchoutCommand)
  {
    -[_SFPBCommand openPunchoutCommand](self, "openPunchoutCommand");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "dictionaryRepresentation");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("openPunchoutCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("openPunchoutCommand"));

    }
  }
  if (self->_openWebClipCommand)
  {
    -[_SFPBCommand openWebClipCommand](self, "openWebClipCommand");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "dictionaryRepresentation");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("openWebClipCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("openWebClipCommand"));

    }
  }
  if (self->_performContactActionCommand)
  {
    -[_SFPBCommand performContactActionCommand](self, "performContactActionCommand");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "dictionaryRepresentation");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("performContactActionCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("performContactActionCommand"));

    }
  }
  if (self->_performContactQueryCommand)
  {
    -[_SFPBCommand performContactQueryCommand](self, "performContactQueryCommand");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "dictionaryRepresentation");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("performContactQueryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("performContactQueryCommand"));

    }
  }
  if (self->_performEntityQueryCommand)
  {
    -[_SFPBCommand performEntityQueryCommand](self, "performEntityQueryCommand");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "dictionaryRepresentation");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("performEntityQueryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("performEntityQueryCommand"));

    }
  }
  if (self->_performIntentCommand)
  {
    -[_SFPBCommand performIntentCommand](self, "performIntentCommand");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "dictionaryRepresentation");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("performIntentCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("performIntentCommand"));

    }
  }
  if (self->_performPersonEntityQueryCommand)
  {
    -[_SFPBCommand performPersonEntityQueryCommand](self, "performPersonEntityQueryCommand");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "dictionaryRepresentation");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("performPersonEntityQueryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("performPersonEntityQueryCommand"));

    }
  }
  if (self->_playMediaCommand)
  {
    -[_SFPBCommand playMediaCommand](self, "playMediaCommand");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "dictionaryRepresentation");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("playMediaCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("playMediaCommand"));

    }
  }
  if (self->_playVideoCommand)
  {
    -[_SFPBCommand playVideoCommand](self, "playVideoCommand");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "dictionaryRepresentation");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("playVideoCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("playVideoCommand"));

    }
  }
  if (self->_rejectPeopleInPhotoCommand)
  {
    -[_SFPBCommand rejectPeopleInPhotoCommand](self, "rejectPeopleInPhotoCommand");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "dictionaryRepresentation");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("rejectPeopleInPhotoCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("rejectPeopleInPhotoCommand"));

    }
  }
  if (self->_requestAppClipInstallCommand)
  {
    -[_SFPBCommand requestAppClipInstallCommand](self, "requestAppClipInstallCommand");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "dictionaryRepresentation");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (v106)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("requestAppClipInstallCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("requestAppClipInstallCommand"));

    }
  }
  if (self->_requestProductPageCommand)
  {
    -[_SFPBCommand requestProductPageCommand](self, "requestProductPageCommand");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "dictionaryRepresentation");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v109, CFSTR("requestProductPageCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("requestProductPageCommand"));

    }
  }
  if (self->_requestUserReportCommand)
  {
    -[_SFPBCommand requestUserReportCommand](self, "requestUserReportCommand");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "dictionaryRepresentation");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("requestUserReportCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("requestUserReportCommand"));

    }
  }
  if (self->_runVoiceShortcutCommand)
  {
    -[_SFPBCommand runVoiceShortcutCommand](self, "runVoiceShortcutCommand");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "dictionaryRepresentation");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v115)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v115, CFSTR("runVoiceShortcutCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("runVoiceShortcutCommand"));

    }
  }
  if (self->_searchInAppCommand)
  {
    -[_SFPBCommand searchInAppCommand](self, "searchInAppCommand");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "dictionaryRepresentation");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v118, CFSTR("searchInAppCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("searchInAppCommand"));

    }
  }
  if (self->_searchWebCommand)
  {
    -[_SFPBCommand searchWebCommand](self, "searchWebCommand");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "dictionaryRepresentation");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("searchWebCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("searchWebCommand"));

    }
  }
  if (self->_shareCommand)
  {
    -[_SFPBCommand shareCommand](self, "shareCommand");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "dictionaryRepresentation");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if (v124)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v124, CFSTR("shareCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("shareCommand"));

    }
  }
  if (self->_showAppStoreSheetCommand)
  {
    -[_SFPBCommand showAppStoreSheetCommand](self, "showAppStoreSheetCommand");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "dictionaryRepresentation");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    if (v127)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v127, CFSTR("showAppStoreSheetCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("showAppStoreSheetCommand"));

    }
  }
  if (self->_showContactCardCommand)
  {
    -[_SFPBCommand showContactCardCommand](self, "showContactCardCommand");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "dictionaryRepresentation");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (v130)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v130, CFSTR("showContactCardCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("showContactCardCommand"));

    }
  }
  if (self->_showPhotosOneUpViewCommand)
  {
    -[_SFPBCommand showPhotosOneUpViewCommand](self, "showPhotosOneUpViewCommand");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "dictionaryRepresentation");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("showPhotosOneUpViewCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v134, CFSTR("showPhotosOneUpViewCommand"));

    }
  }
  if (self->_showPurchaseRequestSheetCommand)
  {
    -[_SFPBCommand showPurchaseRequestSheetCommand](self, "showPurchaseRequestSheetCommand");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "dictionaryRepresentation");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v136)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v136, CFSTR("showPurchaseRequestSheetCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("showPurchaseRequestSheetCommand"));

    }
  }
  if (self->_showSFCardCommand)
  {
    -[_SFPBCommand showSFCardCommand](self, "showSFCardCommand");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "dictionaryRepresentation");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (v139)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v139, CFSTR("showSFCardCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("showSFCardCommand"));

    }
  }
  if (self->_showScreenTimeRequestSheetCommand)
  {
    -[_SFPBCommand showScreenTimeRequestSheetCommand](self, "showScreenTimeRequestSheetCommand");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "dictionaryRepresentation");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    if (v142)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v142, CFSTR("showScreenTimeRequestSheetCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v143, CFSTR("showScreenTimeRequestSheetCommand"));

    }
  }
  if (self->_showWrapperResponseViewCommand)
  {
    -[_SFPBCommand showWrapperResponseViewCommand](self, "showWrapperResponseViewCommand");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "dictionaryRepresentation");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    if (v145)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v145, CFSTR("showWrapperResponseViewCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("showWrapperResponseViewCommand"));

    }
  }
  if (self->_subscribeForUpdatesCommand)
  {
    -[_SFPBCommand subscribeForUpdatesCommand](self, "subscribeForUpdatesCommand");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "dictionaryRepresentation");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    if (v148)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v148, CFSTR("subscribeForUpdatesCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v149, CFSTR("subscribeForUpdatesCommand"));

    }
  }
  if (self->_toggleAudioCommand)
  {
    -[_SFPBCommand toggleAudioCommand](self, "toggleAudioCommand");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "dictionaryRepresentation");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if (v151)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v151, CFSTR("toggleAudioCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v152, CFSTR("toggleAudioCommand"));

    }
  }
  if (self->_toggleWatchListStatusCommand)
  {
    -[_SFPBCommand toggleWatchListStatusCommand](self, "toggleWatchListStatusCommand");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "dictionaryRepresentation");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (v154)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v154, CFSTR("toggleWatchListStatusCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v155, CFSTR("toggleWatchListStatusCommand"));

    }
  }
  if (self->_updateSearchQueryCommand)
  {
    -[_SFPBCommand updateSearchQueryCommand](self, "updateSearchQueryCommand");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "dictionaryRepresentation");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (v157)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v157, CFSTR("updateSearchQueryCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v158, CFSTR("updateSearchQueryCommand"));

    }
  }
  if (self->_updateSportsFollowingStatusCommand)
  {
    -[_SFPBCommand updateSportsFollowingStatusCommand](self, "updateSportsFollowingStatusCommand");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "dictionaryRepresentation");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (v160)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v160, CFSTR("updateSportsFollowingStatusCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v161, CFSTR("updateSportsFollowingStatusCommand"));

    }
  }
  if (self->_viewEmailCommand)
  {
    -[_SFPBCommand viewEmailCommand](self, "viewEmailCommand");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "dictionaryRepresentation");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (v163)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v163, CFSTR("viewEmailCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v164, CFSTR("viewEmailCommand"));

    }
  }
  v165 = v3;

  return v165;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCommand *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCommand *v5;
  uint64_t v6;
  _SFPBShowContactCardCommand *v7;
  uint64_t v8;
  _SFPBShowSFCardCommand *v9;
  uint64_t v10;
  _SFPBShowAppStoreSheetCommand *v11;
  uint64_t v12;
  _SFPBOpenPunchoutCommand *v13;
  uint64_t v14;
  _SFPBOpenFileProviderItemCommand *v15;
  uint64_t v16;
  _SFPBOpenAppClipCommand *v17;
  uint64_t v18;
  _SFPBOpenWebClipCommand *v19;
  uint64_t v20;
  _SFPBRequestAppClipInstallCommand *v21;
  uint64_t v22;
  _SFPBRequestUserReportCommand *v23;
  uint64_t v24;
  _SFPBLaunchAppCommand *v25;
  uint64_t v26;
  _SFPBRunVoiceShortcutCommand *v27;
  uint64_t v28;
  _SFPBIndexedUserActivityCommand *v29;
  uint64_t v30;
  _SFPBOpenCoreSpotlightItemCommand *v31;
  uint64_t v32;
  _SFPBPerformIntentCommand *v33;
  uint64_t v34;
  _SFPBSearchInAppCommand *v35;
  uint64_t v36;
  _SFPBUpdateSearchQueryCommand *v37;
  uint64_t v38;
  _SFPBSearchWebCommand *v39;
  uint64_t v40;
  _SFPBInvokeSiriCommand *v41;
  uint64_t v42;
  _SFPBPerformContactQueryCommand *v43;
  uint64_t v44;
  _SFPBOpenCalculationCommand *v45;
  uint64_t v46;
  _SFPBPlayVideoCommand *v47;
  uint64_t v48;
  _SFPBCallCommand *v49;
  uint64_t v50;
  _SFPBEmailCommand *v51;
  uint64_t v52;
  _SFPBBeginMapsRoutingCommand *v53;
  uint64_t v54;
  _SFPBToggleAudioCommand *v55;
  uint64_t v56;
  _SFPBPerformPersonEntityQueryCommand *v57;
  uint64_t v58;
  _SFPBShowPurchaseRequestSheetCommand *v59;
  uint64_t v60;
  _SFPBShowScreenTimeRequestSheetCommand *v61;
  uint64_t v62;
  _SFPBPerformEntityQueryCommand *v63;
  uint64_t v64;
  _SFPBShareCommand *v65;
  uint64_t v66;
  _SFPBCopyCommand *v67;
  uint64_t v68;
  _SFPBToggleWatchListStatusCommand *v69;
  uint64_t v70;
  _SFPBShowPhotosOneUpViewCommand *v71;
  uint64_t v72;
  _SFPBPlayMediaCommand *v73;
  uint64_t v74;
  _SFPBOpenMediaCommand *v75;
  uint64_t v76;
  _SFPBAddToPhotosLibraryCommand *v77;
  uint64_t v78;
  _SFPBPerformContactActionCommand *v79;
  uint64_t v80;
  _SFPBExpandInlineCommand *v81;
  uint64_t v82;
  _SFPBSubscribeForUpdatesCommand *v83;
  uint64_t v84;
  _SFPBViewEmailCommand *v85;
  uint64_t v86;
  _SFPBRejectPeopleInPhotoCommand *v87;
  uint64_t v88;
  _SFPBShowWrapperResponseViewCommand *v89;
  uint64_t v90;
  _SFPBClearProactiveCategoryCommand *v91;
  uint64_t v92;
  _SFPBCreateContactCommand *v93;
  uint64_t v94;
  _SFPBCreateCalendarEventCommand *v95;
  uint64_t v96;
  _SFPBCreateReminderCommand *v97;
  uint64_t v98;
  _SFPBManageReservationCommand *v99;
  void *v100;
  _SFPBUpdateSportsFollowingStatusCommand *v101;
  void *v102;
  _SFPBRequestProductPageCommand *v103;
  void *v104;
  _SFPBFlightCheckinCommand *v105;
  void *v106;
  void *v107;
  void *v108;
  _SFPBTopic *v109;
  void *v110;
  void *v111;
  void *v112;
  _SFPBCommandReference *v113;
  _SFPBCommand *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  objc_super v163;

  v4 = a3;
  v163.receiver = self;
  v163.super_class = (Class)_SFPBCommand;
  v5 = -[_SFPBCommand init](&v163, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showContactCardCommand"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBShowContactCardCommand initWithDictionary:]([_SFPBShowContactCardCommand alloc], "initWithDictionary:", v6);
      -[_SFPBCommand setShowContactCardCommand:](v5, "setShowContactCardCommand:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showSFCardCommand"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBShowSFCardCommand initWithDictionary:]([_SFPBShowSFCardCommand alloc], "initWithDictionary:", v8);
      -[_SFPBCommand setShowSFCardCommand:](v5, "setShowSFCardCommand:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showAppStoreSheetCommand"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBShowAppStoreSheetCommand initWithDictionary:]([_SFPBShowAppStoreSheetCommand alloc], "initWithDictionary:", v10);
      -[_SFPBCommand setShowAppStoreSheetCommand:](v5, "setShowAppStoreSheetCommand:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openPunchoutCommand"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBOpenPunchoutCommand initWithDictionary:]([_SFPBOpenPunchoutCommand alloc], "initWithDictionary:", v12);
      -[_SFPBCommand setOpenPunchoutCommand:](v5, "setOpenPunchoutCommand:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openFileProviderItemCommand"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBOpenFileProviderItemCommand initWithDictionary:]([_SFPBOpenFileProviderItemCommand alloc], "initWithDictionary:", v14);
      -[_SFPBCommand setOpenFileProviderItemCommand:](v5, "setOpenFileProviderItemCommand:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openAppClipCommand"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBOpenAppClipCommand initWithDictionary:]([_SFPBOpenAppClipCommand alloc], "initWithDictionary:", v16);
      -[_SFPBCommand setOpenAppClipCommand:](v5, "setOpenAppClipCommand:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openWebClipCommand"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v162 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBOpenWebClipCommand initWithDictionary:]([_SFPBOpenWebClipCommand alloc], "initWithDictionary:", v18);
      -[_SFPBCommand setOpenWebClipCommand:](v5, "setOpenWebClipCommand:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestAppClipInstallCommand"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v161 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBRequestAppClipInstallCommand initWithDictionary:]([_SFPBRequestAppClipInstallCommand alloc], "initWithDictionary:", v20);
      -[_SFPBCommand setRequestAppClipInstallCommand:](v5, "setRequestAppClipInstallCommand:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestUserReportCommand"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v160 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBRequestUserReportCommand initWithDictionary:]([_SFPBRequestUserReportCommand alloc], "initWithDictionary:", v22);
      -[_SFPBCommand setRequestUserReportCommand:](v5, "setRequestUserReportCommand:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launchAppCommand"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v159 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBLaunchAppCommand initWithDictionary:]([_SFPBLaunchAppCommand alloc], "initWithDictionary:", v24);
      -[_SFPBCommand setLaunchAppCommand:](v5, "setLaunchAppCommand:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("runVoiceShortcutCommand"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v158 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRunVoiceShortcutCommand initWithDictionary:]([_SFPBRunVoiceShortcutCommand alloc], "initWithDictionary:", v26);
      -[_SFPBCommand setRunVoiceShortcutCommand:](v5, "setRunVoiceShortcutCommand:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("indexedUserActivityCommand"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v157 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBIndexedUserActivityCommand initWithDictionary:]([_SFPBIndexedUserActivityCommand alloc], "initWithDictionary:", v28);
      -[_SFPBCommand setIndexedUserActivityCommand:](v5, "setIndexedUserActivityCommand:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openCoreSpotlightItemCommand"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v156 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBOpenCoreSpotlightItemCommand initWithDictionary:]([_SFPBOpenCoreSpotlightItemCommand alloc], "initWithDictionary:", v30);
      -[_SFPBCommand setOpenCoreSpotlightItemCommand:](v5, "setOpenCoreSpotlightItemCommand:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performIntentCommand"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v155 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBPerformIntentCommand initWithDictionary:]([_SFPBPerformIntentCommand alloc], "initWithDictionary:", v32);
      -[_SFPBCommand setPerformIntentCommand:](v5, "setPerformIntentCommand:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchInAppCommand"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v154 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBSearchInAppCommand initWithDictionary:]([_SFPBSearchInAppCommand alloc], "initWithDictionary:", v34);
      -[_SFPBCommand setSearchInAppCommand:](v5, "setSearchInAppCommand:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updateSearchQueryCommand"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v153 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBUpdateSearchQueryCommand initWithDictionary:]([_SFPBUpdateSearchQueryCommand alloc], "initWithDictionary:", v36);
      -[_SFPBCommand setUpdateSearchQueryCommand:](v5, "setUpdateSearchQueryCommand:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchWebCommand"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v152 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBSearchWebCommand initWithDictionary:]([_SFPBSearchWebCommand alloc], "initWithDictionary:", v38);
      -[_SFPBCommand setSearchWebCommand:](v5, "setSearchWebCommand:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invokeSiriCommand"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v151 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[_SFPBInvokeSiriCommand initWithDictionary:]([_SFPBInvokeSiriCommand alloc], "initWithDictionary:", v40);
      -[_SFPBCommand setInvokeSiriCommand:](v5, "setInvokeSiriCommand:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performContactQueryCommand"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v150 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[_SFPBPerformContactQueryCommand initWithDictionary:]([_SFPBPerformContactQueryCommand alloc], "initWithDictionary:", v42);
      -[_SFPBCommand setPerformContactQueryCommand:](v5, "setPerformContactQueryCommand:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openCalculationCommand"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v149 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[_SFPBOpenCalculationCommand initWithDictionary:]([_SFPBOpenCalculationCommand alloc], "initWithDictionary:", v44);
      -[_SFPBCommand setOpenCalculationCommand:](v5, "setOpenCalculationCommand:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playVideoCommand"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v148 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[_SFPBPlayVideoCommand initWithDictionary:]([_SFPBPlayVideoCommand alloc], "initWithDictionary:", v46);
      -[_SFPBCommand setPlayVideoCommand:](v5, "setPlayVideoCommand:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callCommand"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v147 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[_SFPBCallCommand initWithDictionary:]([_SFPBCallCommand alloc], "initWithDictionary:", v48);
      -[_SFPBCommand setCallCommand:](v5, "setCallCommand:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emailCommand"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v146 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[_SFPBEmailCommand initWithDictionary:]([_SFPBEmailCommand alloc], "initWithDictionary:", v50);
      -[_SFPBCommand setEmailCommand:](v5, "setEmailCommand:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beginMapsRoutingCommand"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v145 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[_SFPBBeginMapsRoutingCommand initWithDictionary:]([_SFPBBeginMapsRoutingCommand alloc], "initWithDictionary:", v52);
      -[_SFPBCommand setBeginMapsRoutingCommand:](v5, "setBeginMapsRoutingCommand:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggleAudioCommand"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v144 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[_SFPBToggleAudioCommand initWithDictionary:]([_SFPBToggleAudioCommand alloc], "initWithDictionary:", v54);
      -[_SFPBCommand setToggleAudioCommand:](v5, "setToggleAudioCommand:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performPersonEntityQueryCommand"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v143 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[_SFPBPerformPersonEntityQueryCommand initWithDictionary:]([_SFPBPerformPersonEntityQueryCommand alloc], "initWithDictionary:", v56);
      -[_SFPBCommand setPerformPersonEntityQueryCommand:](v5, "setPerformPersonEntityQueryCommand:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showPurchaseRequestSheetCommand"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v142 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[_SFPBShowPurchaseRequestSheetCommand initWithDictionary:]([_SFPBShowPurchaseRequestSheetCommand alloc], "initWithDictionary:", v58);
      -[_SFPBCommand setShowPurchaseRequestSheetCommand:](v5, "setShowPurchaseRequestSheetCommand:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showScreenTimeRequestSheetCommand"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v141 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[_SFPBShowScreenTimeRequestSheetCommand initWithDictionary:]([_SFPBShowScreenTimeRequestSheetCommand alloc], "initWithDictionary:", v60);
      -[_SFPBCommand setShowScreenTimeRequestSheetCommand:](v5, "setShowScreenTimeRequestSheetCommand:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performEntityQueryCommand"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v140 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[_SFPBPerformEntityQueryCommand initWithDictionary:]([_SFPBPerformEntityQueryCommand alloc], "initWithDictionary:", v62);
      -[_SFPBCommand setPerformEntityQueryCommand:](v5, "setPerformEntityQueryCommand:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shareCommand"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v139 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[_SFPBShareCommand initWithDictionary:]([_SFPBShareCommand alloc], "initWithDictionary:", v64);
      -[_SFPBCommand setShareCommand:](v5, "setShareCommand:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("copyCommand"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v138 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[_SFPBCopyCommand initWithDictionary:]([_SFPBCopyCommand alloc], "initWithDictionary:", v66);
      -[_SFPBCommand setCopyCommand:](v5, "setCopyCommand:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggleWatchListStatusCommand"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v137 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[_SFPBToggleWatchListStatusCommand initWithDictionary:]([_SFPBToggleWatchListStatusCommand alloc], "initWithDictionary:", v68);
      -[_SFPBCommand setToggleWatchListStatusCommand:](v5, "setToggleWatchListStatusCommand:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showPhotosOneUpViewCommand"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v136 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[_SFPBShowPhotosOneUpViewCommand initWithDictionary:]([_SFPBShowPhotosOneUpViewCommand alloc], "initWithDictionary:", v70);
      -[_SFPBCommand setShowPhotosOneUpViewCommand:](v5, "setShowPhotosOneUpViewCommand:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playMediaCommand"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = (void *)v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[_SFPBPlayMediaCommand initWithDictionary:]([_SFPBPlayMediaCommand alloc], "initWithDictionary:", v72);
      -[_SFPBCommand setPlayMediaCommand:](v5, "setPlayMediaCommand:", v73);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openMediaCommand"));
    v74 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v134 = (void *)v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[_SFPBOpenMediaCommand initWithDictionary:]([_SFPBOpenMediaCommand alloc], "initWithDictionary:", v74);
      -[_SFPBCommand setOpenMediaCommand:](v5, "setOpenMediaCommand:", v75);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addToPhotosLibraryCommand"));
    v76 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v133 = (void *)v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[_SFPBAddToPhotosLibraryCommand initWithDictionary:]([_SFPBAddToPhotosLibraryCommand alloc], "initWithDictionary:", v76);
      -[_SFPBCommand setAddToPhotosLibraryCommand:](v5, "setAddToPhotosLibraryCommand:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performContactActionCommand"));
    v78 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v132 = (void *)v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[_SFPBPerformContactActionCommand initWithDictionary:]([_SFPBPerformContactActionCommand alloc], "initWithDictionary:", v78);
      -[_SFPBCommand setPerformContactActionCommand:](v5, "setPerformContactActionCommand:", v79);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expandInlineCommand"));
    v80 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = (void *)v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[_SFPBExpandInlineCommand initWithDictionary:]([_SFPBExpandInlineCommand alloc], "initWithDictionary:", v80);
      -[_SFPBCommand setExpandInlineCommand:](v5, "setExpandInlineCommand:", v81);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscribeForUpdatesCommand"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = (void *)v82;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[_SFPBSubscribeForUpdatesCommand initWithDictionary:]([_SFPBSubscribeForUpdatesCommand alloc], "initWithDictionary:", v82);
      -[_SFPBCommand setSubscribeForUpdatesCommand:](v5, "setSubscribeForUpdatesCommand:", v83);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewEmailCommand"));
    v84 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = (void *)v84;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[_SFPBViewEmailCommand initWithDictionary:]([_SFPBViewEmailCommand alloc], "initWithDictionary:", v84);
      -[_SFPBCommand setViewEmailCommand:](v5, "setViewEmailCommand:", v85);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rejectPeopleInPhotoCommand"));
    v86 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v128 = (void *)v86;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[_SFPBRejectPeopleInPhotoCommand initWithDictionary:]([_SFPBRejectPeopleInPhotoCommand alloc], "initWithDictionary:", v86);
      -[_SFPBCommand setRejectPeopleInPhotoCommand:](v5, "setRejectPeopleInPhotoCommand:", v87);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showWrapperResponseViewCommand"));
    v88 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v127 = (void *)v88;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = -[_SFPBShowWrapperResponseViewCommand initWithDictionary:]([_SFPBShowWrapperResponseViewCommand alloc], "initWithDictionary:", v88);
      -[_SFPBCommand setShowWrapperResponseViewCommand:](v5, "setShowWrapperResponseViewCommand:", v89);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clearProactiveCategoryCommand"));
    v90 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = (void *)v90;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = -[_SFPBClearProactiveCategoryCommand initWithDictionary:]([_SFPBClearProactiveCategoryCommand alloc], "initWithDictionary:", v90);
      -[_SFPBCommand setClearProactiveCategoryCommand:](v5, "setClearProactiveCategoryCommand:", v91);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createContactCommand"));
    v92 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = (void *)v92;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v93 = -[_SFPBCreateContactCommand initWithDictionary:]([_SFPBCreateContactCommand alloc], "initWithDictionary:", v92);
      -[_SFPBCommand setCreateContactCommand:](v5, "setCreateContactCommand:", v93);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createCalendarEventCommand"));
    v94 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = (void *)v94;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = -[_SFPBCreateCalendarEventCommand initWithDictionary:]([_SFPBCreateCalendarEventCommand alloc], "initWithDictionary:", v94);
      -[_SFPBCommand setCreateCalendarEventCommand:](v5, "setCreateCalendarEventCommand:", v95);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createReminderCommand"));
    v96 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = (void *)v96;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = -[_SFPBCreateReminderCommand initWithDictionary:]([_SFPBCreateReminderCommand alloc], "initWithDictionary:", v96);
      -[_SFPBCommand setCreateReminderCommand:](v5, "setCreateReminderCommand:", v97);

    }
    v117 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manageReservationCommand"));
    v98 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = -[_SFPBManageReservationCommand initWithDictionary:]([_SFPBManageReservationCommand alloc], "initWithDictionary:", v98);
      -[_SFPBCommand setManageReservationCommand:](v5, "setManageReservationCommand:", v99);

    }
    v122 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updateSportsFollowingStatusCommand"), v98);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = -[_SFPBUpdateSportsFollowingStatusCommand initWithDictionary:]([_SFPBUpdateSportsFollowingStatusCommand alloc], "initWithDictionary:", v100);
      -[_SFPBCommand setUpdateSportsFollowingStatusCommand:](v5, "setUpdateSportsFollowingStatusCommand:", v101);

    }
    v121 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestProductPageCommand"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = -[_SFPBRequestProductPageCommand initWithDictionary:]([_SFPBRequestProductPageCommand alloc], "initWithDictionary:", v102);
      -[_SFPBCommand setRequestProductPageCommand:](v5, "setRequestProductPageCommand:", v103);

    }
    v118 = (void *)v14;
    v120 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flightCheckinCommand"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v105 = -[_SFPBFlightCheckinCommand initWithDictionary:]([_SFPBFlightCheckinCommand alloc], "initWithDictionary:", v104);
      -[_SFPBCommand setFlightCheckinCommand:](v5, "setFlightCheckinCommand:", v105);

    }
    v119 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandDetail"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v107 = (void *)objc_msgSend(v106, "copy");
      -[_SFPBCommand setCommandDetail:](v5, "setCommandDetail:", v107);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("normalizedTopic"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v109 = -[_SFPBTopic initWithDictionary:]([_SFPBTopic alloc], "initWithDictionary:", v108);
      -[_SFPBCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v109);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backendData"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v110, 0);
      -[_SFPBCommand setBackendData:](v5, "setBackendData:", v111);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandReference"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v113 = -[_SFPBCommandReference initWithDictionary:]([_SFPBCommandReference alloc], "initWithDictionary:", v112);
      -[_SFPBCommand setCommandReference:](v5, "setCommandReference:", v113);

    }
    v114 = v5;

  }
  return v5;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (_SFPBTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (NSData)backendData
{
  return self->_backendData;
}

- (_SFPBCommandReference)commandReference
{
  return self->_commandReference;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_flightCheckinCommand, 0);
  objc_storeStrong((id *)&self->_requestProductPageCommand, 0);
  objc_storeStrong((id *)&self->_updateSportsFollowingStatusCommand, 0);
  objc_storeStrong((id *)&self->_manageReservationCommand, 0);
  objc_storeStrong((id *)&self->_createReminderCommand, 0);
  objc_storeStrong((id *)&self->_createCalendarEventCommand, 0);
  objc_storeStrong((id *)&self->_createContactCommand, 0);
  objc_storeStrong((id *)&self->_clearProactiveCategoryCommand, 0);
  objc_storeStrong((id *)&self->_showWrapperResponseViewCommand, 0);
  objc_storeStrong((id *)&self->_rejectPeopleInPhotoCommand, 0);
  objc_storeStrong((id *)&self->_viewEmailCommand, 0);
  objc_storeStrong((id *)&self->_subscribeForUpdatesCommand, 0);
  objc_storeStrong((id *)&self->_expandInlineCommand, 0);
  objc_storeStrong((id *)&self->_performContactActionCommand, 0);
  objc_storeStrong((id *)&self->_addToPhotosLibraryCommand, 0);
  objc_storeStrong((id *)&self->_openMediaCommand, 0);
  objc_storeStrong((id *)&self->_playMediaCommand, 0);
  objc_storeStrong((id *)&self->_showPhotosOneUpViewCommand, 0);
  objc_storeStrong((id *)&self->_toggleWatchListStatusCommand, 0);
  objc_storeStrong((id *)&self->_copyCommand, 0);
  objc_storeStrong((id *)&self->_shareCommand, 0);
  objc_storeStrong((id *)&self->_performEntityQueryCommand, 0);
  objc_storeStrong((id *)&self->_showScreenTimeRequestSheetCommand, 0);
  objc_storeStrong((id *)&self->_showPurchaseRequestSheetCommand, 0);
  objc_storeStrong((id *)&self->_performPersonEntityQueryCommand, 0);
  objc_storeStrong((id *)&self->_toggleAudioCommand, 0);
  objc_storeStrong((id *)&self->_beginMapsRoutingCommand, 0);
  objc_storeStrong((id *)&self->_emailCommand, 0);
  objc_storeStrong((id *)&self->_callCommand, 0);
  objc_storeStrong((id *)&self->_playVideoCommand, 0);
  objc_storeStrong((id *)&self->_openCalculationCommand, 0);
  objc_storeStrong((id *)&self->_performContactQueryCommand, 0);
  objc_storeStrong((id *)&self->_invokeSiriCommand, 0);
  objc_storeStrong((id *)&self->_searchWebCommand, 0);
  objc_storeStrong((id *)&self->_updateSearchQueryCommand, 0);
  objc_storeStrong((id *)&self->_searchInAppCommand, 0);
  objc_storeStrong((id *)&self->_performIntentCommand, 0);
  objc_storeStrong((id *)&self->_openCoreSpotlightItemCommand, 0);
  objc_storeStrong((id *)&self->_indexedUserActivityCommand, 0);
  objc_storeStrong((id *)&self->_runVoiceShortcutCommand, 0);
  objc_storeStrong((id *)&self->_launchAppCommand, 0);
  objc_storeStrong((id *)&self->_requestUserReportCommand, 0);
  objc_storeStrong((id *)&self->_requestAppClipInstallCommand, 0);
  objc_storeStrong((id *)&self->_openWebClipCommand, 0);
  objc_storeStrong((id *)&self->_openAppClipCommand, 0);
  objc_storeStrong((id *)&self->_openFileProviderItemCommand, 0);
  objc_storeStrong((id *)&self->_openPunchoutCommand, 0);
  objc_storeStrong((id *)&self->_showAppStoreSheetCommand, 0);
  objc_storeStrong((id *)&self->_showSFCardCommand, 0);
  objc_storeStrong((id *)&self->_showContactCardCommand, 0);
}

@end
