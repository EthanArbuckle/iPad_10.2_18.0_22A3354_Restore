@implementation MOBiomeManager

- (MOBiomeManager)initWithEventManager:(id)a3 setDefaultValues:(BOOL)a4
{
  id v8;
  MOBiomeManager *v9;
  MOBiomeManager *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BMStream *stream;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BMStream *engagementStream;
  NSNumber *stateIHA;
  NSNumber *age;
  NSNumber *ageBucketed;
  NSNumber *biologicalSex;
  MOBiomeDonationUtility *v27;
  MOBiomeDonationUtility *biomeDonationUtility;
  MOBiomeManager *v29;
  id os_log;
  NSObject *v31;
  void *v32;
  objc_super v34;

  v8 = a3;
  if (v8)
  {
    if (initWithEventManager_setDefaultValues__onceToken != -1)
      dispatch_once(&initWithEventManager_setDefaultValues__onceToken, &__block_literal_global_34);
    v34.receiver = self;
    v34.super_class = (Class)MOBiomeManager;
    v9 = -[MOBiomeManager init](&v34, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_queue, (id)initWithEventManager_setDefaultValues__sharedQueue);
      v11 = BiomeLibrary();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "Moments"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "Stats"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "EventData"));
      stream = v10->_stream;
      v10->_stream = (BMStream *)v15;

      v17 = BiomeLibrary();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "Moments"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "Events"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "Engagement"));
      engagementStream = v10->_engagementStream;
      v10->_engagementStream = (BMStream *)v21;

      objc_storeStrong((id *)&v10->_eventManager, a3);
      stateIHA = v10->_stateIHA;
      v10->_stateIHA = (NSNumber *)&__kCFBooleanFalse;

      age = v10->_age;
      v10->_age = (NSNumber *)&off_1002DA358;

      ageBucketed = v10->_ageBucketed;
      v10->_ageBucketed = (NSNumber *)&off_1002DA358;

      biologicalSex = v10->_biologicalSex;
      v10->_biologicalSex = (NSNumber *)&off_1002DA358;

      v10->_setDefault = a4;
      v27 = objc_alloc_init(MOBiomeDonationUtility);
      biomeDonationUtility = v10->_biomeDonationUtility;
      v10->_biomeDonationUtility = v27;

    }
    self = v10;
    v29 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MOBiomeManager initWithEventManager:setDefaultValues:].cold.1(v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOBiomeManager.m"), 143, CFSTR("Invalid parameter not satisfying: eventManager"));

    v29 = 0;
  }

  return v29;
}

void __56__MOBiomeManager_initWithEventManager_setDefaultValues___block_invoke(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("MOBiomeManager", v4);
  v3 = (void *)initWithEventManager_setDefaultValues__sharedQueue;
  initWithEventManager_setDefaultValues__sharedQueue = (uint64_t)v2;

}

- (id)suggestionTypeToString:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[32];
  _QWORD v9[32];

  v3 = *(_QWORD *)&a3;
  v8[0] = &off_1002DA370;
  v8[1] = &off_1002DA388;
  v9[0] = CFSTR("Unknown");
  v9[1] = CFSTR("Selected");
  v8[2] = &off_1002DA3A0;
  v8[3] = &off_1002DA3B8;
  v9[2] = CFSTR("Shared");
  v9[3] = CFSTR("Liked");
  v8[4] = &off_1002DA3D0;
  v8[5] = &off_1002DA3E8;
  v9[4] = CFSTR("Disliked");
  v9[5] = CFSTR("Dismissed");
  v8[6] = &off_1002DA400;
  v8[7] = &off_1002DA418;
  v9[6] = CFSTR("Deleted");
  v9[7] = CFSTR("Hidden");
  v8[8] = &off_1002DA430;
  v8[9] = &off_1002DA448;
  v9[8] = CFSTR("QuickAddEntry");
  v9[9] = CFSTR("Viewed");
  v8[10] = &off_1002DA460;
  v8[11] = &off_1002DA478;
  v9[10] = CFSTR("ThumbsDown");
  v9[11] = CFSTR("Favorite");
  v8[12] = &off_1002DA490;
  v8[13] = &off_1002DA4A8;
  v9[12] = CFSTR("ThumbsUp");
  v9[13] = CFSTR("EntryCreated");
  v8[14] = &off_1002DA4C0;
  v8[15] = &off_1002DA4D8;
  v9[14] = CFSTR("EntryEdited");
  v9[15] = CFSTR("EntryDeleted");
  v8[16] = &off_1002DA4F0;
  v8[17] = &off_1002DA508;
  v9[16] = CFSTR("EntryCancelled");
  v9[17] = CFSTR("Annotated");
  v8[18] = &off_1002DA520;
  v8[19] = &off_1002DA538;
  v9[18] = CFSTR("Positive");
  v9[19] = CFSTR("Negative");
  v8[20] = &off_1002DA550;
  v8[21] = &off_1002DA568;
  v9[20] = CFSTR("Neutral");
  v9[21] = CFSTR("Rejected");
  v8[22] = &off_1002DA580;
  v8[23] = &off_1002DA598;
  v9[22] = CFSTR("Accepted");
  v9[23] = CFSTR("Posted");
  v8[24] = &off_1002DA5B0;
  v8[25] = &off_1002DA5C8;
  v9[24] = CFSTR("Filtered");
  v9[25] = CFSTR("EntryCreatedWithUpdates");
  v8[26] = &off_1002DA5E0;
  v8[27] = &off_1002DA5F8;
  v9[26] = CFSTR("NotificationQueued");
  v9[27] = CFSTR("NotificationDequeued");
  v8[28] = &off_1002DA610;
  v8[29] = &off_1002DA628;
  v9[28] = CFSTR("NotificationTapped");
  v9[29] = CFSTR("NotificationDismissed");
  v8[30] = &off_1002DA640;
  v8[31] = &off_1002DA658;
  v9[30] = CFSTR("NotificationPosted");
  v9[31] = CFSTR("NotificationOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (id)appEntryTypeToString:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = *(_QWORD *)&a3;
  v8[0] = &off_1002DA370;
  v8[1] = &off_1002DA388;
  v9[0] = CFSTR("Unknown");
  v9[1] = CFSTR("EntryCreated");
  v8[2] = &off_1002DA3A0;
  v8[3] = &off_1002DA3B8;
  v9[2] = CFSTR("EntryEdited");
  v9[3] = CFSTR("EntryDeleted");
  v8[4] = &off_1002DA3D0;
  v9[4] = CFSTR("EntryCancelled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (id)generateBiomeEventsFromEvent:(id)a3 andOnboardingStatus:(id)a4
{
  id v6;
  MOBiomeDonationUtility *biomeDonationUtility;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  id v28;
  NSNumber *age;
  NSNumber *stateIHA;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v6 = a4;
  biomeDonationUtility = self->_biomeDonationUtility;
  v8 = a3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertEvent:](biomeDonationUtility, "convertEvent:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));
    v31 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)objc_msgSend(v10, "intValue"));

  }
  else
  {
    v31 = 0;
  }
  v11 = objc_alloc((Class)BMMomentsEventData);
  stateIHA = self->_stateIHA;
  v28 = v11;
  age = self->_age;
  v27 = -[NSNumber intValue](self->_ageBucketed, "intValue");
  v26 = -[NSNumber intValue](self->_biologicalSex, "intValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "describeCategory"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("journalIsInstalled")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("journalConfigLockJournal")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("journalConfigSkipSuggestions")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchActivity")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchCommunication")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchLocation")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchMedia")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchPeople")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchPhoto")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchStateOfMind")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingSwitchReflection")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("settingBroaderSwitchLocation")));
  LODWORD(v20) = v31;
  LODWORD(v19) = v26;
  v32 = objc_msgSend(v28, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v33, 0, &__kCFBooleanFalse, stateIHA, age, v27, v19, v37, v25, v24, 0, 0,
          0,
          0,
          0,
          0,
          0,
          v20,
          v36,
          v35,
          v34,
          v23,
          v12,
          v22,
          v13,
          v21,
          v14,
          v15,
          v16,
          v17);

  return v32;
}

- (id)generateBiomeEventsFromBundle:(id)a3 andOnboardingStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  id v35;
  NSNumber *age;
  NSNumber *stateIHA;
  unsigned int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[3];

  v6 = a3;
  v7 = a4;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertEventBundle:](self->_biomeDonationUtility, "convertEventBundle:", v6));
  v49[0] = CFSTR("shopping");
  v49[1] = CFSTR("eating out");
  v49[2] = CFSTR("flight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionName"));
  v43 = v8;
  LODWORD(v8) = objc_msgSend(v8, "containsObject:", v11);

  if ((_DWORD)v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionName"));

  }
  else
  {
    v42 = 0;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getBundleType"));
  if (objc_msgSend(v9, "interfaceType") == (id)11
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resources")),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resources"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));

  }
  else
  {
    v40 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("onboardingStatus")));
    v38 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)objc_msgSend(v18, "intValue"));

  }
  else
  {
    v38 = 0;
  }
  v19 = objc_alloc((Class)BMMomentsEventData);
  stateIHA = self->_stateIHA;
  v35 = v19;
  age = self->_age;
  v34 = -[NSNumber intValue](self->_ageBucketed, "intValue");
  v33 = -[NSNumber intValue](self->_biologicalSex, "intValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("journalIsInstalled")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("journalConfigLockJournal")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("journalConfigSkipSuggestions")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchActivity")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchCommunication")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchLocation")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchMedia")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchPeople")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchPhoto")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchStateOfMind")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingSwitchReflection")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("settingBroaderSwitchLocation")));
  LODWORD(v26) = v38;
  LODWORD(v25) = v33;
  v39 = objc_msgSend(v35, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v44, &__kCFBooleanTrue, stateIHA, age, v34, v25, v32, v48, 0, v41, v40,
          0,
          0,
          v42,
          0,
          0,
          v26,
          v47,
          v46,
          v45,
          v31,
          v30,
          v29,
          v28,
          v27,
          v20,
          v21,
          v22,
          v23);

  return v39;
}

- (void)donateEvents:(id)a3 andBundles:(id)a4 andOnboardingStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MOBiomeManager *v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke;
  v11[3] = &unk_1002B3B70;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = v12;
  -[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:](self, "_fetchAndSetDemographicsWithCompletionHandler:", v11);

}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  unint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[16];
  _BYTE v47[128];
  _BYTE v48[128];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5 | v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_cold_1();
  }
  else
  {
    v33 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "moving onto biome donation", buf, 2u);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v32 = (id)v6;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        v15 = 0;
        v16 = v10;
        v17 = v9;
        do
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate", v32));
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "earlierDate:", v17));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "laterDate:", v16));

          v15 = (char *)v15 + 1;
          v16 = v10;
          v17 = v9;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v13);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = *(id *)(a1 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
      do
      {
        v25 = 0;
        v26 = v10;
        v27 = v9;
        do
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate", v32));
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "earlierDate:", v27));

          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "laterDate:", v26));

          v25 = (char *)v25 + 1;
          v26 = v10;
          v27 = v9;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v23);
    }

    v31 = *(void **)(a1 + 48);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_436;
    v34[3] = &unk_1002B3B48;
    v34[4] = v31;
    v35 = *(id *)(a1 + 32);
    v36 = *(id *)(a1 + 56);
    v37 = *(id *)(a1 + 40);
    objc_msgSend(v31, "fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v34);

    v6 = (unint64_t)v32;
    v5 = v33;
  }

}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_436(uint64_t a1, void *a2)
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSMutableSet *v18;
  _QWORD block[5];
  id v20;
  NSMutableSet *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a2;
  v4 = objc_opt_new(NSMutableSet);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isBundle"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
LABEL_12:
            v15 = (void *)v13;
            -[NSMutableSet addObject:](v4, "addObject:", v13);

            continue;
          }
        }
        if ((objc_msgSend(v10, "isBundle") & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));

          if (v14)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_2;
  block[3] = &unk_1002B3B20;
  v17 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v20 = v17;
  v21 = v4;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v18 = v4;
  dispatch_async(v16, block);

}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id os_log;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stream"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "source"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v4)
  {
    v5 = v4;
    v27 = 0;
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v9 = objc_autoreleasePoolPush();
        v10 = *(void **)(a1 + 48);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
        LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v12);

        if ((v10 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateBiomeEventsFromEvent:andOnboardingStatus:", v8, *(_QWORD *)(a1 + 56)));
          objc_msgSend(v28, "sendEvent:", v13);
          ++v27;

        }
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v5);
  }
  else
  {
    v27 = 0;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = *(id *)(a1 + 64);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        v21 = *(void **)(a1 + 48);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier", v27));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
        LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v23);

        if ((v21 & 1) == 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateBiomeEventsFromBundle:andOnboardingStatus:", v20, *(_QWORD *)(a1 + 56)));
          objc_msgSend(v28, "sendEvent:", v24);
          ++v17;

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v26 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v38 = v27;
    v39 = 2048;
    v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "biome donation, event count: %lu, bundle count: %lu", buf, 0x16u);
  }

}

- (id)generateBiomeEventsFromMomentsEventDataBundle:(id)a3 withBundleEngagement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
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
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
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

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
  v81 = objc_alloc((Class)BMMomentsEventDataEventBundle);
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleStartDate"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleEndDate"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleCreationDate"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleExpirationDate"));
  v55 = objc_msgSend(v7, "bundleInterfaceType");
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceHealthExists")));
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourcePhotoExists")));
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceProactiveExists")));
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceRoutineExists")));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundlePromptLanguageFormat"));
  v54 = objc_msgSend(v7, "bundlePlaceType");
  v53 = objc_msgSend(v7, "bundlePlaceUserType");
  v52 = objc_msgSend(v7, "bundleBaseEventCateory");
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleEventIDs"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleActionType"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundActions"));
  v51 = objc_msgSend(v7, "bundleTimeTag");
  v50 = objc_msgSend(v5, "type");
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientIdentifier"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewContainerName"));
  objc_msgSend(v5, "viewVisibleTime");
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v49 = objc_msgSend(v5, "typeAppEntry");
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientIdentifierAppEntry"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestampAppEntry"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startTimeAppEntry"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endTimeAppEntry"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "totalCharactersAppEntry"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedCharactersAppEntry"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestionIdentifier"));
  v48 = objc_msgSend(v7, "photoSourceType");
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourcePostAnalyticsExists")));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourcePDExists")));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceMotionExists")));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceBooksExists")));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "bundleSourceScreenTimeExists")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "bundlePCount")));
  v46 = objc_msgSend(v7, "labelConfidenceScore");
  LODWORD(v45) = objc_msgSend(v7, "timeCorrelationScore");
  HIDWORD(v45) = objc_msgSend(v7, "callDuration");
  v44 = objc_msgSend(v7, "interactionCount");
  v42 = objc_msgSend(v7, "interactionType");
  v43 = objc_msgSend(v7, "callPlace");
  v41 = objc_msgSend(v7, "distanceFromHome");
  LODWORD(v40) = objc_msgSend(v7, "homeAvailability");
  HIDWORD(v40) = objc_msgSend(v7, "workAvailability");
  v39 = objc_msgSend(v7, "bundleVisitMapItemSource");
  v37 = objc_msgSend(v7, "bundleVisitPlaceType");
  v38 = objc_msgSend(v7, "bundleVisitPlaceLabelGranularity");
  v36 = objc_msgSend(v7, "bundleIncludesAnomalousEvent");
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isFiltered")));
  objc_msgSend(v7, "bundleSuperType");
  objc_msgSend(v7, "bundleSubType");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isAggregatedAndSuppressed")));
  objc_msgSend(v7, "summarizationGranularity");
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "includedInSummaryBundleOnly")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subBundleIDs"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subSuggestionIDs"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstCreationDate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resources"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persons"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainPlace"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "otherPlaces"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoTraits"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clusterMetadata"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outlierMetadata"));
  objc_msgSend(v7, "bundleGoodnessScore");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v7, "distinctnessScore");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v7, "richnessScore");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v7, "engagementScore");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v7, "heuristicsScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  HIDWORD(v24) = v46;
  LODWORD(v22) = v49;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadataForRank"));
  LODWORD(v24) = 0;
  LODWORD(v23) = 0;
  LODWORD(v21) = v50;
  LODWORD(v20) = 0;
  LODWORD(v19) = v51;
  LODWORD(v17) = v52;
  v82 = objc_msgSend(v81, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
          v116,
          v114,
          v112,
          v110,
          v108,
          v55,
          v106,
          v104,
          v102,
          v100,
          v98,
          0,
          0,
          __PAIR64__(v53, v54),
          v17,
          v94,
          v96,
          v87,
          0,
          v19,
          0,
          0,
          0,
          0,
          0,
          0,
          v20,
          0,
          0,
          v21,
          v88,
          v92,
          v89,
          v83,
          v22,
          v85,
          v78,
          v80,
          v76,
          v74,
          v67,
          v23,
          0,
          0,
          v72,
          v48,
          v66,
          v70,
          v65,
          v68,
          v64,
          &__NSArray0__struct,
          v47,
          v24,
          v45,
          __PAIR64__(v42, v44),
          __PAIR64__(v41, v43),
          v40,
          __PAIR64__(v37, v39),
          __PAIR64__(v36, v38),
          v63);

  v90 = objc_alloc((Class)BMMomentsEventData);
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "IHAState")));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "age")));
  LODWORD(v88) = objc_msgSend(v6, "ageRange");
  LODWORD(v87) = objc_msgSend(v6, "biologicalSex");
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "bundleStartDate"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "bundleEndDate"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleInterface"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleEvergreenType"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeManager suggestionTypeToString:](self, "suggestionTypeToString:", objc_msgSend(v5, "type")));
  v9 = objc_msgSend(v5, "typeAppEntry");

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeManager appEntryTypeToString:](self, "appEntryTypeToString:", v9));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "megaSignalTypeUsed"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "viewVisibleSuggestionsCount")));
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "viewTotalSuggestionsCount")));
  LODWORD(v80) = objc_msgSend(v6, "onboardingFlowCompletionState");
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isJournalAppInstalled")));
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isJournalAppLocked")));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isJournalSuggestionSkipped")));
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isActivitySettingsSwitchEnabled")));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isCommunicationSettingsSwitchEnabled")));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isSignificantLocationSettingsSwitchEnabled")));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isMediaSettingsSwitchEnabled")));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isNearbyPeopleSettingsSwitchEnabled")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isPhotoSettingsSwitchEnabled")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isStateOfMindSettingsSwitchEnabled")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isReflectionSettingsSwitchEnabled")));
  v13 = objc_msgSend(v6, "isBroadSystemLocationSettingsSwitchEnabled");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  LODWORD(v18) = (_DWORD)v80;
  LODWORD(v16) = (_DWORD)v87;
  v91 = objc_msgSend(v90, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v82, &__kCFBooleanTrue, v117, v115, v88, v16, v111, v113, 0, v109, v107,
          v105,
          v103,
          v86,
          v84,
          v101,
          v18,
          v79,
          v99,
          v77,
          v97,
          v73,
          v71,
          v75,
          v69,
          v10,
          v11,
          v12,
          v14);

  return v91;
}

- (void)_updateDataStreamWithEngagement
{
  id os_log;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "update biome data stream with latest engagement.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeManager stream](self, "stream"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "source"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeManager stream](self, "stream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pruner"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke;
  v13[3] = &unk_1002B3BE8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  -[MOBiomeManager fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:](self, "fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v13);

}

void __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  _QWORD v19[4];
  NSMutableDictionary *v20;
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a2;
  v4 = objc_opt_new(NSMutableDictionary);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isBundle"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
          -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v10, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_2;
  v19[3] = &unk_1002B3BC0;
  v20 = v4;
  v15 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v21 = v16;
  v22 = v17;
  v23 = *(id *)(a1 + 48);
  v18 = v4;
  objc_msgSend(v15, "fetchMomentsEngagementForBundles:CompletionHandler:", v14, v19);

}

void __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id os_log;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  double v25;
  double v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MOBundleEngagement *v36;
  void *v37;
  NSMutableDictionary *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  NSMutableDictionary *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  NSMutableDictionary *v56;
  uint64_t v57;
  id v58;
  unsigned int v59;
  MOBundleEngagement *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *i;
  uint64_t v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  NSMutableDictionary *v83;
  __int128 *p_buf;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[128];
  uint8_t v90[4];
  uint64_t v91;
  __int128 buf;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  _BYTE v97[128];

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v2, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "number of engagement biome events %lu.", (uint8_t *)&buf, 0xCu);
  }

  v56 = objc_opt_new(NSMutableDictionary);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v2;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v57)
          objc_enumerationMutation(obj);
        v75 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("engagementSource == %lu"), 1));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v75));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v72));

        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0));
        v96 = v6;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "sortedArrayUsingDescriptors:", v7));

        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstObject"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("engagementSource == %lu"), 2));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v75));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v69));

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 0));
        v95 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "sortedArrayUsingDescriptors:", v10));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bundle"));
        v13 = objc_msgSend(v12, "suggestionType");
        if (v13 == objc_msgSend(v77, "type"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bundle"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionTimestamp"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "timestamp"));
          v17 = objc_msgSend(v15, "isEqualToDate:", v16);

          v18 = v17 ^ 1;
        }
        else
        {
          v18 = 1;
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bundle"));
        v20 = objc_msgSend(v19, "appEntryEventType");
        if (v20 != objc_msgSend(v11, "typeAppEntry"))
        {

LABEL_15:
          v60 = [MOBundleEngagement alloc];
          v59 = objc_msgSend(v77, "type");
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "timestamp"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "clientIdentifier"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "viewContainerName"));
          objc_msgSend(v77, "viewVisibleTime");
          v26 = v25;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "suggestionType"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "viewVisibleSuggestionsCount"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "viewTotalSuggestionsCount"));
          v28 = objc_msgSend(v11, "typeAppEntry");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "typeAppEntryStr"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timestampAppEntry"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startTimeAppEntry"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endTimeAppEntry"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientIdentifierAppEntry"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "totalCharactersAppEntry"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addedCharactersAppEntry"));
          LODWORD(v55) = v28;
          v36 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v60, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", v59, v65, v64, v63, v62, v61, v26, v27, v55, v29, v30, v31, v32, v33, v34,
                  v35,
                  0);

          -[NSMutableDictionary setValue:forKey:](v56, "setValue:forKey:", v36, v75);
          goto LABEL_16;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bundle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appEntryEventTimestamp"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timestampAppEntry"));
        v24 = objc_msgSend(v22, "isEqualToDate:", v23);

        if ((v18 | v24 ^ 1) == 1)
          goto LABEL_15;
LABEL_16:

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v58);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v93 = 0x2020000000;
  v94 = 0;
  v37 = *(void **)(a1 + 40);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_450;
  v82[3] = &unk_1002B3B98;
  v38 = v56;
  v83 = v38;
  p_buf = &buf;
  objc_msgSend(v37, "deleteEventsPassingTest:", v82);
  v39 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v90 = 134217984;
    v91 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "deleted %lu obsolete data events from biome.", v90, 0xCu);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v42 = v38;
  v43 = 0;
  v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v79;
    do
    {
      v46 = 0;
      v43 += (uint64_t)v44;
      do
      {
        if (*(_QWORD *)v79 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v47));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v47));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "generateBiomeEventsFromMomentsEventDataBundle:withBundleEngagement:", v48, v49));
        objc_msgSend(*(id *)(a1 + 56), "sendEvent:", v50);

        v46 = (char *)v46 + 1;
      }
      while (v44 != v46);
      v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    }
    while (v44);
  }

  v51 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v90 = 134217984;
    v91 = v43;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "recreate %lu biome events with updated engagement.", v90, 0xCu);
  }

  v53 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v90 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "update biome stream with latest engagement done.", v90, 2u);
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_450(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  if (objc_msgSend(v3, "isBundle")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundle")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier")),
        v7 = objc_msgSend(v4, "containsObject:", v6),
        v6,
        v5,
        v4,
        v7))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)fetchMomentsEngagementForBundles:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id os_log;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MOBiomeManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke;
    block[3] = &unk_1002AF730;
    block[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(v8, block);

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No bundle identifier is passed in to return any engagements.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke(id *a1)
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NSMutableDictionary *v9;
  _QWORD v10[4];
  NSMutableDictionary *v11;
  id v12;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "engagementStream"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisher"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2;
  v10[3] = &unk_1002B3C10;
  v11 = v2;
  v12 = a1[6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_454;
  v7[3] = &unk_1002B3C38;
  v8 = a1[5];
  v9 = v11;
  v5 = v11;
  v6 = objc_msgSend(v4, "sinkWithCompletion:receiveInput:", v10, v7);

}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    if (objc_msgSend(v3, "state") == (id)1)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
      v5 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2_cold_1(v3, v5);

      objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    }
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully fetched %ld engagement from MomentsEngagement.", (uint8_t *)&v9, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_454(uint64_t a1, void *a2)
{
  void *v3;
  MOBundleEngagement *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  MOBundleEngagement *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MOBundleEngagement *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  NSMutableArray *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  MOBundleEngagement *v57;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = [MOBundleEngagement alloc];
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v5 = objc_msgSend(v66, "type");
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "timestamp"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "clientIdentifier"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "viewContainerName"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  objc_msgSend(v58, "viewVisibleTime");
  v9 = v8;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "suggestionType"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v52, "viewVisibleSuggestionsCount")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "viewTotalSuggestionsCount")));
  LODWORD(v45) = 0;
  v13 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v4, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", v5, v6, v56, v7, v50, v10, v9, v12, v45, 0, 0, 0, 0, 0, 0,
          0,
          1);

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionEvent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fullBundleOrderedSet"));

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v74;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v74 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v19), "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleId"));

        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v21))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allKeys"));
          v23 = objc_msgSend(v22, "containsObject:", v21);

          if ((v23 & 1) == 0)
          {
            v24 = *(void **)(a1 + 40);
            v25 = objc_opt_new(NSMutableArray);
            objc_msgSend(v24, "setObject:forKey:", v25, v21);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21));
          objc_msgSend(v26, "addObject:", v13);

        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v17);
  }

  v57 = [MOBundleEngagement alloc];
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v55 = objc_msgSend(v65, "type");
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "appEntryEventType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "timestamp"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "startTime"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "endTime"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "clientIdentifier"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v48, "totalCharacters")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v30, "addedCharacters")));
  LODWORD(v46) = v55;
  v32 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v57, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", 0, 0, 0, 0, 0, 0, 0.0, 0, v46, v51, v67, v47, v27, v28, v29,
          v31,
          2);

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68 = v3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryEvent"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));

  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v70;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v70 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v38), "bundleId"));
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v39))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allKeys"));
          v41 = objc_msgSend(v40, "containsObject:", v39);

          if ((v41 & 1) == 0)
          {
            v42 = *(void **)(a1 + 40);
            v43 = objc_opt_new(NSMutableArray);
            objc_msgSend(v42, "setObject:forKey:", v43, v39);

          }
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v39));
          objc_msgSend(v44, "addObject:", v32);

        }
        v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v36);
  }

}

- (void)fetchMomentsEventDataBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  unsigned int v12;
  id os_log;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earlierDate:", v9));
  v12 = objc_msgSend(v11, "isEqualToDate:", v9);

  if (v12)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MOBiomeManager fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:].cold.1();

    v10[2](v10, 0);
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(-[MOBiomeManager queue](self, "queue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke;
    v16[3] = &unk_1002AF708;
    v16[4] = self;
    v19 = v10;
    v17 = v9;
    v18 = v8;
    dispatch_async(v15, v16);

  }
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke(id *a1)
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  NSMutableArray *v12;
  _QWORD v13[4];
  NSMutableArray *v14;
  id v15;
  id v16;

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "stream"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisher"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v13[3] = &unk_1002B3C60;
  v5 = v2;
  v6 = a1[4];
  v14 = v5;
  v15 = v6;
  v16 = a1[7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_458;
  v9[3] = &unk_1002B3C88;
  v10 = a1[5];
  v11 = a1[6];
  v12 = v5;
  v7 = v5;
  v8 = objc_msgSend(v4, "sinkWithCompletion:receiveInput:", v13, v9);

}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    if (objc_msgSend(v3, "state") == (id)1)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
      v5 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(v3, v5);

      objc_msgSend(a1[4], "removeAllObjects");
    }
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(a1[4], "count");
      *(_DWORD *)buf = 134217984;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully fetched %ld MomentsEventData from Biome", buf, 0xCu);
    }

  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_457;
  v10[3] = &unk_1002B2DE0;
  v12 = a1[6];
  v11 = a1[4];
  dispatch_async(v9, v10);

}

uint64_t __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_457(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_458(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  if (v3)
  {
    v13 = v3;
    if ((objc_msgSend(v3, "isBundle") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundle"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleStartDate"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "event"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    }
    v6 = (void *)v5;

    if ((objc_msgSend(v13, "isBundle") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleEndDate"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "event"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    }
    v9 = (void *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earlierDate:", *(_QWORD *)(a1 + 32)));
    if (objc_msgSend(v10, "isEqualToDate:", *(_QWORD *)(a1 + 32)))
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "laterDate:", *(_QWORD *)(a1 + 40)));
      v12 = objc_msgSend(v11, "isEqualToDate:", *(_QWORD *)(a1 + 40));

      if ((v12 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
    }

    v3 = v13;
  }

}

- (void)_fetchAndSetDemographicsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[16];
  _QWORD block[5];
  id v17;

  v6 = a3;
  if (!v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:].cold.1(v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOBiomeManager.m"), 714, CFSTR("Invalid parameter not satisfying: completion (in %s:%d)"), "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]", 714);

  }
  if (self->_eventManager
    && objc_opt_class(MCProfileConnection, v5)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection")),
        v11 = objc_msgSend(v10, "isHealthDataSubmissionAllowed"),
        v10,
        v11))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MOBiomeManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke;
    block[3] = &unk_1002B0C18;
    block[4] = self;
    v17 = v6;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "no IHA permission", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  _QWORD block[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  id v66;
  _QWORD v67[4];
  NSObject *v68;
  uint8_t *v69;
  uint64_t *v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  uint8_t buf[8];
  uint8_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;

  objc_msgSend(*(id *)(a1 + 32), "setStateIHA:", &__kCFBooleanTrue);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex with IHA permission.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v75 = buf;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__27;
  v78 = __Block_byref_object_dispose__27;
  v79 = 0;
  v71 = 0;
  v72[0] = &v71;
  v72[1] = 0x3032000000;
  v72[2] = __Block_byref_object_copy__27;
  v72[3] = __Block_byref_object_dispose__27;
  v73 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getHealthKitManager"));

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_462;
  v67[3] = &unk_1002B0C40;
  v7 = v4;
  v68 = v7;
  v69 = buf;
  v70 = &v71;
  objc_msgSend(v6, "fetchUserBiologicalSexWithHandler:", v67);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Biome/MOBiomeManager.m", 736, "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]_block_invoke_2"));
  v66 = 0;
  v9 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v7, &v66, v8);
  v10 = v66;
  v11 = v66;
  if (!v9)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  if (*(_QWORD *)(v72[0] + 40))
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5((uint64_t)v72, v15, v16, v17, v18, v19, v20, v21);

  }
  if (v11)
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_4();

    objc_storeStrong((id *)(v72[0] + 40), v10);
  }
  v24 = (void *)*((_QWORD *)v75 + 5);
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v24, "biologicalSex")));
    objc_msgSend(*(id *)(a1 + 32), "setBiologicalSex:", v25);

  }
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__27;
  v64 = __Block_byref_object_dispose__27;
  v65 = 0;
  v57 = 0;
  v58[0] = &v57;
  v58[1] = 0x3032000000;
  v58[2] = __Block_byref_object_copy__27;
  v58[3] = __Block_byref_object_dispose__27;
  v59 = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_470;
  v53[3] = &unk_1002B0C68;
  v26 = dispatch_semaphore_create(0);
  v54 = v26;
  v55 = &v60;
  v56 = &v57;
  objc_msgSend(v6, "fetchUserAgeWithHandler:", v53);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Biome/MOBiomeManager.m", 765, "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]_block_invoke_2"));
  v52 = 0;
  v28 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v26, &v52, v27);
  v29 = v52;
  v30 = v52;
  if (!v28)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  if (*(_QWORD *)(v58[0] + 40))
  {
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2((uint64_t)v58, v34, v35, v36, v37, v38, v39, v40);

  }
  if (v30)
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_1();

    objc_storeStrong((id *)(v58[0] + 40), v29);
  }
  v43 = (void *)v61[5];
  if (v43)
  {
    v44 = objc_msgSend(v43, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setAge:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "age"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v45, &off_1002DC998));
  objc_msgSend(*(id *)(a1 + 32), "setAgeBucketed:", v46);

  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_479;
  block[3] = &unk_1002B3CB0;
  v49 = *(id *)(a1 + 40);
  v50 = &v71;
  v51 = &v57;
  dispatch_async(v47, block);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(buf, 8);

}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_462(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_470(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_479(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMStream)stream
{
  return self->_stream;
}

- (BMStream)engagementStream
{
  return self->_engagementStream;
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (MOBiomeDonationUtility)biomeDonationUtility
{
  return self->_biomeDonationUtility;
}

- (void)setBiomeDonationUtility:(id)a3
{
  objc_storeStrong((id *)&self->_biomeDonationUtility, a3);
}

- (NSNumber)stateIHA
{
  return self->_stateIHA;
}

- (void)setStateIHA:(id)a3
{
  objc_storeStrong((id *)&self->_stateIHA, a3);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSNumber)ageBucketed
{
  return self->_ageBucketed;
}

- (void)setAgeBucketed:(id)a3
{
  objc_storeStrong((id *)&self->_ageBucketed, a3);
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
  objc_storeStrong((id *)&self->_biologicalSex, a3);
}

- (BOOL)setDefault
{
  return self->_setDefault;
}

- (void)setSetDefault:(BOOL)a3
{
  self->_setDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_ageBucketed, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_stateIHA, 0);
  objc_storeStrong((id *)&self->_biomeDonationUtility, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_engagementStream, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithEventManager:(os_log_t)log setDefaultValues:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventManager", v1, 2u);
}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "fetching age/gender hit an error. biologicalSexFetchError: %@, ageFetchError: %@");
  OUTLINED_FUNCTION_1();
}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "returning no engagement due to biome query error: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "bad biome fetch parameters. startDate is after endDate. startDate: %@, endDate: %@");
  OUTLINED_FUNCTION_1();
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "completionHandler not called due to biome query error: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_fetchAndSetDemographicsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]";
  v3 = 1024;
  v4 = 714;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching age from health kit, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching gender from health kit, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
