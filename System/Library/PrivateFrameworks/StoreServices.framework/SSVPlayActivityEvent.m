@implementation SSVPlayActivityEvent

- (SSVPlayActivityEvent)init
{
  SSVPlayActivityEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSVPlayActivityEvent;
  result = -[SSVPlayActivityEvent init](&v3, sel_init);
  if (result)
  {
    result->_eventType = 0;
    result->_version = 1;
  }
  return result;
}

- (SSVPlayActivityEvent)initWithDataRepresentation:(id)a3
{
  id v4;
  SSVPBPlayActivityEvent *v5;
  SSVPlayActivityEvent *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  NSString *deviceName;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  NSDate *eventDate;
  void *v18;
  uint64_t v19;
  NSTimeZone *eventTimeZone;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSString *featureName;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSString *lyricsLanguage;
  uint64_t v32;
  NSData *recommendationData;
  int v34;
  uint64_t v35;
  uint64_t v36;
  NSString *storeFrontID;
  uint64_t v38;
  NSData *timedMetadata;
  uint64_t v40;
  NSData *trackInfo;
  int v42;
  uint64_t v43;
  uint64_t version;
  uint64_t v45;
  uint64_t v46;
  NSString *buildVersion;
  uint64_t v48;
  uint64_t v49;
  NSString *requestingBundleVersion;
  uint64_t v51;
  NSString *requestingBundleIdentifier;
  uint64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  void *v56;
  SSVMutablePlayActivityEnqueuerProperties *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  SSVPlayActivityEnqueuerProperties *enqueuerProperties;
  uint64_t v69;
  NSString *householdID;
  uint64_t v71;
  NSNumber *privateListeningEnabled;
  uint64_t v73;
  NSNumber *siriInitiated;
  _BOOL4 v75;
  char v76;
  uint64_t v77;
  NSString *containerID;
  uint64_t v79;
  NSString *externalID;
  uint64_t v81;
  NSString *personalizedContainerID;
  uint64_t v83;
  NSString *storeID;
  uint64_t v85;
  void (**v86)(_QWORD);
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
  void (**v97)(_QWORD);
  void *v98;
  void *v99;
  SSVPlayActivityEvent *v100;
  _QWORD v102[5];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _QWORD v109[5];
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  NSString *v115;

  v4 = a3;
  v5 = -[SSVPBPlayActivityEvent initWithData:]([SSVPBPlayActivityEvent alloc], "initWithData:", v4);
  if (!v5)
  {

    v6 = 0;
    goto LABEL_172;
  }
  v6 = -[SSVPlayActivityEvent init](self, "init");

  if (v6)
  {
    if (-[SSVPBPlayActivityEvent hasContainerType](v5, "hasContainerType"))
    {
      v7 = -[SSVPBPlayActivityEvent containerType](v5, "containerType") - 1;
      if (v7 > 3)
        v8 = 0;
      else
        v8 = qword_1A27A0FD0[v7];
      v6->_containerType = v8;
    }
    if (-[SSVPBPlayActivityEvent hasDeviceName](v5, "hasDeviceName"))
    {
      -[SSVPBPlayActivityEvent deviceName](v5, "deviceName");
      v9 = objc_claimAutoreleasedReturnValue();
      deviceName = v6->_deviceName;
      v6->_deviceName = (NSString *)v9;

    }
    if (-[SSVPBPlayActivityEvent hasDisplayType](v5, "hasDisplayType"))
    {
      v11 = -[SSVPBPlayActivityEvent displayType](v5, "displayType") - 1;
      if (v11 < 3)
        v12 = v11 + 1;
      else
        v12 = 0;
      v6->_displayType = v12;
    }
    if (-[SSVPBPlayActivityEvent hasEndReasonType](v5, "hasEndReasonType"))
    {
      v13 = -[SSVPBPlayActivityEvent endReasonType](v5, "endReasonType") - 1;
      if (v13 > 0xD)
        v14 = 0;
      else
        v14 = qword_1A27A0FF0[v13];
      v6->_endReasonType = v14;
    }
    if (-[SSVPBPlayActivityEvent hasEventDateTimestamp](v5, "hasEventDateTimestamp"))
    {
      -[SSVPBPlayActivityEvent eventDateTimestamp](v5, "eventDateTimestamp");
      if (fabs(v15) > 2.22044605e-16)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v16 = objc_claimAutoreleasedReturnValue();
        eventDate = v6->_eventDate;
        v6->_eventDate = (NSDate *)v16;

      }
    }
    if (-[SSVPBPlayActivityEvent hasEventTimeZoneName](v5, "hasEventTimeZoneName"))
    {
      -[SSVPBPlayActivityEvent eventTimeZoneName](v5, "eventTimeZoneName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        eventTimeZone = v6->_eventTimeZone;
        v6->_eventTimeZone = (NSTimeZone *)v19;

      }
    }
    else
    {
      if (!-[SSVPBPlayActivityEvent hasEventSecondsFromGMT](v5, "hasEventSecondsFromGMT")
        || (-[SSVPBPlayActivityEvent eventSecondsFromGMT](v5, "eventSecondsFromGMT"), fabs(v21) <= 2.22044605e-16))
      {
LABEL_31:
        if (-[SSVPBPlayActivityEvent hasFeatureName](v5, "hasFeatureName"))
        {
          -[SSVPBPlayActivityEvent featureName](v5, "featureName");
          v23 = objc_claimAutoreleasedReturnValue();
          featureName = v6->_featureName;
          v6->_featureName = (NSString *)v23;

        }
        if (-[SSVPBPlayActivityEvent hasItemDuration](v5, "hasItemDuration"))
        {
          -[SSVPBPlayActivityEvent itemDuration](v5, "itemDuration");
          v6->_itemDuration = v25;
        }
        if (-[SSVPBPlayActivityEvent hasItemEndTime](v5, "hasItemEndTime"))
        {
          -[SSVPBPlayActivityEvent itemEndTime](v5, "itemEndTime");
          v6->_itemEndTime = v26;
        }
        if (-[SSVPBPlayActivityEvent hasItemStartTime](v5, "hasItemStartTime"))
        {
          -[SSVPBPlayActivityEvent itemStartTime](v5, "itemStartTime");
          v6->_itemStartTime = v27;
        }
        if (-[SSVPBPlayActivityEvent hasItemType](v5, "hasItemType"))
        {
          v28 = -[SSVPBPlayActivityEvent itemType](v5, "itemType") - 1;
          if (v28 < 9)
            v29 = v28 + 1;
          else
            v29 = 0;
          v6->_itemType = v29;
        }
        if (-[SSVPBPlayActivityEvent hasCharacterDisplayedCount](v5, "hasCharacterDisplayedCount"))
          v6->_lyricsDisplayedCharacterCount = -[SSVPBPlayActivityEvent characterDisplayedCount](v5, "characterDisplayedCount");
        if (-[SSVPBPlayActivityEvent hasLyricLanguage](v5, "hasLyricLanguage"))
        {
          -[SSVPBPlayActivityEvent lyricLanguage](v5, "lyricLanguage");
          v30 = objc_claimAutoreleasedReturnValue();
          lyricsLanguage = v6->_lyricsLanguage;
          v6->_lyricsLanguage = (NSString *)v30;

        }
        if (-[SSVPBPlayActivityEvent hasMediaType](v5, "hasMediaType"))
          v6->_mediaType = -[SSVPBPlayActivityEvent mediaType](v5, "mediaType") == 1;
        if (-[SSVPBPlayActivityEvent hasOffline](v5, "hasOffline"))
          v6->_offline = -[SSVPBPlayActivityEvent offline](v5, "offline");
        if (-[SSVPBPlayActivityEvent hasPersistentID](v5, "hasPersistentID"))
          v6->_persistentID = -[SSVPBPlayActivityEvent persistentID](v5, "persistentID");
        if (-[SSVPBPlayActivityEvent hasRecommendationData](v5, "hasRecommendationData"))
        {
          -[SSVPBPlayActivityEvent recommendationData](v5, "recommendationData");
          v32 = objc_claimAutoreleasedReturnValue();
          recommendationData = v6->_recommendationData;
          v6->_recommendationData = (NSData *)v32;

        }
        if (-[SSVPBPlayActivityEvent hasSBEnabled](v5, "hasSBEnabled"))
          v6->_SBEnabled = -[SSVPBPlayActivityEvent sBEnabled](v5, "sBEnabled");
        if (-[SSVPBPlayActivityEvent hasSourceType](v5, "hasSourceType"))
        {
          v34 = -[SSVPBPlayActivityEvent sourceType](v5, "sourceType");
          v35 = v34 == 1;
          if (v34 == 2)
            v35 = 2;
          v6->_sourceType = v35;
        }
        if (-[SSVPBPlayActivityEvent hasStoreAccountID](v5, "hasStoreAccountID"))
          v6->_storeAccountID = -[SSVPBPlayActivityEvent storeAccountID](v5, "storeAccountID");
        if (-[SSVPBPlayActivityEvent hasStoreFrontID](v5, "hasStoreFrontID"))
        {
          -[SSVPBPlayActivityEvent storeFrontID](v5, "storeFrontID");
          v36 = objc_claimAutoreleasedReturnValue();
          storeFrontID = v6->_storeFrontID;
          v6->_storeFrontID = (NSString *)v36;

        }
        if (-[SSVPBPlayActivityEvent hasTimedMetadata](v5, "hasTimedMetadata"))
        {
          -[SSVPBPlayActivityEvent timedMetadata](v5, "timedMetadata");
          v38 = objc_claimAutoreleasedReturnValue();
          timedMetadata = v6->_timedMetadata;
          v6->_timedMetadata = (NSData *)v38;

        }
        if (-[SSVPBPlayActivityEvent hasTrackInfo](v5, "hasTrackInfo"))
        {
          -[SSVPBPlayActivityEvent trackInfo](v5, "trackInfo");
          v40 = objc_claimAutoreleasedReturnValue();
          trackInfo = v6->_trackInfo;
          v6->_trackInfo = (NSData *)v40;

        }
        if (-[SSVPBPlayActivityEvent hasEventType](v5, "hasEventType"))
        {
          v42 = -[SSVPBPlayActivityEvent eventType](v5, "eventType");
          v43 = v42 == 2;
          if (v42 == 3)
            v43 = 2;
          v6->_eventType = v43;
          version = v6->_version;
          if (version <= 2)
            version = 2;
          v6->_version = version;
        }
        if (-[SSVPBPlayActivityEvent hasReasonHintType](v5, "hasReasonHintType"))
        {
          v6->_reasonHintType = -[SSVPBPlayActivityEvent reasonHintType](v5, "reasonHintType") == 1;
          v45 = v6->_version;
          if (v45 <= 2)
            v45 = 2;
          v6->_version = v45;
        }
        if (-[SSVPBPlayActivityEvent hasBuildVersion](v5, "hasBuildVersion"))
        {
          -[SSVPBPlayActivityEvent buildVersion](v5, "buildVersion");
          v46 = objc_claimAutoreleasedReturnValue();
          buildVersion = v6->_buildVersion;
          v6->_buildVersion = (NSString *)v46;

          v48 = v6->_version;
          if (v48 <= 2)
            v48 = 2;
          v6->_version = v48;
        }
        if (-[SSVPBPlayActivityEvent hasRequestingBundleVersion](v5, "hasRequestingBundleVersion"))
        {
          -[SSVPBPlayActivityEvent requestingBundleVersion](v5, "requestingBundleVersion");
          v49 = objc_claimAutoreleasedReturnValue();
          requestingBundleVersion = v6->_requestingBundleVersion;
          v6->_requestingBundleVersion = (NSString *)v49;

        }
        if (-[SSVPBPlayActivityEvent hasRequestingBundleIdentifier](v5, "hasRequestingBundleIdentifier"))
        {
          -[SSVPBPlayActivityEvent requestingBundleIdentifier](v5, "requestingBundleIdentifier");
          v51 = objc_claimAutoreleasedReturnValue();
          requestingBundleIdentifier = v6->_requestingBundleIdentifier;
          v6->_requestingBundleIdentifier = (NSString *)v51;

        }
        if (-[SSVPBPlayActivityEvent hasSystemReleaseType](v5, "hasSystemReleaseType"))
        {
          v53 = -[SSVPBPlayActivityEvent systemReleaseType](v5, "systemReleaseType") - 1;
          if (v53 >= 4)
            v54 = 0;
          else
            v54 = v53 + 1;
        }
        else
        {
          if (!-[SSVPBPlayActivityEvent hasInternalBuild](v5, "hasInternalBuild"))
          {
LABEL_97:
            if (-[SSVPBPlayActivityEvent hasEnqueuerProperties](v5, "hasEnqueuerProperties"))
            {
              -[SSVPBPlayActivityEvent enqueuerProperties](v5, "enqueuerProperties");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (v56)
              {
                v57 = objc_alloc_init(SSVMutablePlayActivityEnqueuerProperties);
                if (objc_msgSend(v56, "hasBuildVersion"))
                {
                  objc_msgSend(v56, "buildVersion");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVMutablePlayActivityEnqueuerProperties setBuildVersion:](v57, "setBuildVersion:", v58);

                }
                if (objc_msgSend(v56, "hasDeviceGUID"))
                {
                  objc_msgSend(v56, "deviceGUID");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVMutablePlayActivityEnqueuerProperties setDeviceGUID:](v57, "setDeviceGUID:", v59);

                }
                if (objc_msgSend(v56, "hasDeviceName"))
                {
                  objc_msgSend(v56, "deviceName");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVMutablePlayActivityEnqueuerProperties setDeviceName:](v57, "setDeviceName:", v60);

                }
                if (objc_msgSend(v56, "hasTimeZoneName"))
                {
                  objc_msgSend(v56, "timeZoneName");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v61)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SSVMutablePlayActivityEnqueuerProperties setTimeZone:](v57, "setTimeZone:", v62);

                  }
                }
                if (objc_msgSend(v56, "hasSystemReleaseType"))
                {
                  v63 = objc_msgSend(v56, "systemReleaseType") - 1;
                  if (v63 < 4)
                    v64 = v63 + 1;
                  else
                    v64 = 0;
                  -[SSVMutablePlayActivityEnqueuerProperties setSystemReleaseType:](v57, "setSystemReleaseType:", v64);
                }
                if (objc_msgSend(v56, "hasSBEnabled"))
                  -[SSVMutablePlayActivityEnqueuerProperties setSBEnabled:](v57, "setSBEnabled:", objc_msgSend(v56, "sBEnabled"));
                if (objc_msgSend(v56, "hasStoreAccountID"))
                  -[SSVMutablePlayActivityEnqueuerProperties setStoreAccountID:](v57, "setStoreAccountID:", objc_msgSend(v56, "storeAccountID"));
                if (objc_msgSend(v56, "hasStoreFrontID"))
                {
                  objc_msgSend(v56, "storeFrontID");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVMutablePlayActivityEnqueuerProperties setStoreFrontID:](v57, "setStoreFrontID:", v65);

                }
                if (objc_msgSend(v56, "hasPrivateListeningEnabled"))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v56, "privateListeningEnabled"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVMutablePlayActivityEnqueuerProperties setPrivateListeningEnabled:](v57, "setPrivateListeningEnabled:", v66);

                }
                v67 = -[SSVMutablePlayActivityEnqueuerProperties copy](v57, "copy");
                enqueuerProperties = v6->_enqueuerProperties;
                v6->_enqueuerProperties = (SSVPlayActivityEnqueuerProperties *)v67;

              }
            }
            if (-[SSVPBPlayActivityEvent hasHouseholdID](v5, "hasHouseholdID"))
            {
              -[SSVPBPlayActivityEvent householdID](v5, "householdID");
              v69 = objc_claimAutoreleasedReturnValue();
              householdID = v6->_householdID;
              v6->_householdID = (NSString *)v69;

            }
            if (-[SSVPBPlayActivityEvent hasPrivateListeningEnabled](v5, "hasPrivateListeningEnabled"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSVPBPlayActivityEvent privateListeningEnabled](v5, "privateListeningEnabled"));
              v71 = objc_claimAutoreleasedReturnValue();
              privateListeningEnabled = v6->_privateListeningEnabled;
              v6->_privateListeningEnabled = (NSNumber *)v71;

            }
            if (-[SSVPBPlayActivityEvent hasSiriInitiated](v5, "hasSiriInitiated"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSVPBPlayActivityEvent siriInitiated](v5, "siriInitiated"));
              v73 = objc_claimAutoreleasedReturnValue();
              siriInitiated = v6->_siriInitiated;
              v6->_siriInitiated = (NSNumber *)v73;

            }
            if (v6->_version > 1)
              goto LABEL_142;
            v75 = -[SSVPBPlayActivityEvent hasContainerID](v5, "hasContainerID");
            v76 = v75;
            if (v75)
            {
              -[SSVPBPlayActivityEvent containerID](v5, "containerID");
              v77 = objc_claimAutoreleasedReturnValue();
              containerID = v6->_containerID;
              v6->_containerID = (NSString *)v77;

            }
            if (-[SSVPBPlayActivityEvent hasExternalID](v5, "hasExternalID"))
            {
              -[SSVPBPlayActivityEvent externalID](v5, "externalID");
              v79 = objc_claimAutoreleasedReturnValue();
              externalID = v6->_externalID;
              v6->_externalID = (NSString *)v79;

              v76 = 1;
            }
            if (-[SSVPBPlayActivityEvent hasPersonalizedContainerID](v5, "hasPersonalizedContainerID"))
            {
              -[SSVPBPlayActivityEvent personalizedContainerID](v5, "personalizedContainerID");
              v81 = objc_claimAutoreleasedReturnValue();
              personalizedContainerID = v6->_personalizedContainerID;
              v6->_personalizedContainerID = (NSString *)v81;

              if (!-[SSVPBPlayActivityEvent hasStoreID](v5, "hasStoreID"))
                goto LABEL_172;
              goto LABEL_139;
            }
            if (-[SSVPBPlayActivityEvent hasStoreID](v5, "hasStoreID"))
            {
LABEL_139:
              -[SSVPBPlayActivityEvent storeID](v5, "storeID");
              v83 = objc_claimAutoreleasedReturnValue();
              storeID = v6->_storeID;
              v6->_storeID = (NSString *)v83;
LABEL_171:

              goto LABEL_172;
            }
            if ((v76 & 1) == 0 && v6->_version >= 2)
            {
LABEL_142:
              v110 = 0;
              v111 = &v110;
              v112 = 0x3032000000;
              v113 = __Block_byref_object_copy__59;
              v114 = __Block_byref_object_dispose__59;
              v85 = MEMORY[0x1E0C809B0];
              v115 = 0;
              v109[0] = MEMORY[0x1E0C809B0];
              v109[1] = 3221225472;
              v109[2] = __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke;
              v109[3] = &unk_1E47B8A28;
              v109[4] = &v110;
              v86 = (void (**)(_QWORD))MEMORY[0x1A8585DF0](v109);
              if (-[SSVPBPlayActivityEvent hasContainerAdamID](v5, "hasContainerAdamID"))
              {
                v86[2](v86);
                objc_msgSend((id)v111[5], "setAdamID:", -[SSVPBPlayActivityEvent containerAdamID](v5, "containerAdamID"));
              }
              if (-[SSVPBPlayActivityEvent hasGlobalPlaylistID](v5, "hasGlobalPlaylistID"))
              {
                v86[2](v86);
                v87 = (void *)v111[5];
                -[SSVPBPlayActivityEvent globalPlaylistID](v5, "globalPlaylistID");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "setGlobalPlaylistID:", v88);

              }
              if (-[SSVPBPlayActivityEvent hasPlaylistVersionHash](v5, "hasPlaylistVersionHash"))
              {
                v86[2](v86);
                v89 = (void *)v111[5];
                -[SSVPBPlayActivityEvent playlistVersionHash](v5, "playlistVersionHash");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "setPlaylistVersionHash:", v90);

              }
              if (-[SSVPBPlayActivityEvent hasStationHash](v5, "hasStationHash"))
              {
                v86[2](v86);
                v91 = (void *)v111[5];
                -[SSVPBPlayActivityEvent stationHash](v5, "stationHash");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "setStationHash:", v92);

              }
              if (-[SSVPBPlayActivityEvent hasStationStringID](v5, "hasStationStringID"))
              {
                v86[2](v86);
                v93 = (void *)v111[5];
                -[SSVPBPlayActivityEvent stationStringID](v5, "stationStringID");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "setStationStringID:", v94);

              }
              if (-[SSVPBPlayActivityEvent hasStationID](v5, "hasStationID"))
              {
                v86[2](v86);
                objc_msgSend((id)v111[5], "setStationID:", -[SSVPBPlayActivityEvent stationID](v5, "stationID"));
              }
              if (-[SSVPBPlayActivityEvent hasCloudAlbumID](v5, "hasCloudAlbumID"))
              {
                v86[2](v86);
                v95 = (void *)v111[5];
                -[SSVPBPlayActivityEvent cloudAlbumID](v5, "cloudAlbumID");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "setCloudAlbumID:", v96);

              }
              if (-[SSVPBPlayActivityEvent hasCloudPlaylistID](v5, "hasCloudPlaylistID"))
              {
                v86[2](v86);
                objc_msgSend((id)v111[5], "setCloudPlaylistID:", -[SSVPBPlayActivityEvent cloudPlaylistID](v5, "cloudPlaylistID"));
              }
              objc_storeStrong((id *)&v6->_containerIDs, (id)v111[5]);
              v103 = 0;
              v104 = &v103;
              v105 = 0x3032000000;
              v106 = __Block_byref_object_copy__59;
              v107 = __Block_byref_object_dispose__59;
              v108 = 0;
              v102[0] = v85;
              v102[1] = 3221225472;
              v102[2] = __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke_2;
              v102[3] = &unk_1E47B8A28;
              v102[4] = &v103;
              v97 = (void (**)(_QWORD))MEMORY[0x1A8585DF0](v102);
              if (-[SSVPBPlayActivityEvent hasSubscriptionAdamID](v5, "hasSubscriptionAdamID"))
              {
                v97[2](v97);
                objc_msgSend((id)v104[5], "setSubscriptionAdamID:", -[SSVPBPlayActivityEvent subscriptionAdamID](v5, "subscriptionAdamID"));
              }
              if (-[SSVPBPlayActivityEvent hasPurchasedAdamID](v5, "hasPurchasedAdamID"))
              {
                v97[2](v97);
                objc_msgSend((id)v104[5], "setPurchasedAdamID:", -[SSVPBPlayActivityEvent purchasedAdamID](v5, "purchasedAdamID"));
              }
              if (-[SSVPBPlayActivityEvent hasRadioAdamID](v5, "hasRadioAdamID"))
              {
                v97[2](v97);
                objc_msgSend((id)v104[5], "setRadioAdamID:", -[SSVPBPlayActivityEvent radioAdamID](v5, "radioAdamID"));
              }
              if (-[SSVPBPlayActivityEvent hasItemCloudID](v5, "hasItemCloudID"))
              {
                v97[2](v97);
                objc_msgSend((id)v104[5], "setCloudID:", -[SSVPBPlayActivityEvent itemCloudID](v5, "itemCloudID"));
              }
              if (-[SSVPBPlayActivityEvent hasLyricsID](v5, "hasLyricsID"))
              {
                v97[2](v97);
                v98 = (void *)v104[5];
                -[SSVPBPlayActivityEvent lyricsID](v5, "lyricsID");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "setLyricsID:", v99);

              }
              if (-[SSVPBPlayActivityEvent hasEquivalencySourceAdamID](v5, "hasEquivalencySourceAdamID"))
              {
                v97[2](v97);
                objc_msgSend((id)v104[5], "setEquivalencySourceAdamID:", -[SSVPBPlayActivityEvent equivalencySourceAdamID](v5, "equivalencySourceAdamID"));
              }
              objc_storeStrong((id *)&v6->_itemIDs, (id)v104[5]);

              _Block_object_dispose(&v103, 8);
              _Block_object_dispose(&v110, 8);
              storeID = v115;
              goto LABEL_171;
            }
            goto LABEL_172;
          }
          v55 = -[SSVPBPlayActivityEvent internalBuild](v5, "internalBuild");
          v54 = 4;
          if (!v55)
            v54 = 0;
        }
        v6->_systemReleaseType = v54;
        goto LABEL_97;
      }
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v18 = v6->_eventTimeZone;
      v6->_eventTimeZone = (NSTimeZone *)v22;
    }

    goto LABEL_31;
  }
LABEL_172:
  v100 = v6;

  return v100;
}

void __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke(uint64_t a1)
{
  SSVMutablePlayActivityEventContainerIDs *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(SSVMutablePlayActivityEventContainerIDs);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke_2(uint64_t a1)
{
  SSVMutablePlayActivityEventItemIDs *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(SSVMutablePlayActivityEventItemIDs);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSNumber *privateListeningEnabled;
  const __CFString *v9;
  const __CFString *v10;
  NSNumber *siriInitiated;
  const __CFString *v12;
  NSUInteger v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p persistentID:%llu"), v5, self, -[SSVPlayActivityEvent persistentID](self, "persistentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_containerID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" containerID:'%@'"), self->_containerID);
  if (self->_containerIDs)
    objc_msgSend(v6, "appendFormat:", CFSTR(" containerIDs:'%@'"), self->_containerIDs);
  if (self->_containerType)
    objc_msgSend(v6, "appendFormat:", CFSTR(" containerType:%td"), self->_containerType);
  if (self->_deviceName)
    objc_msgSend(v6, "appendFormat:", CFSTR(" deviceName:'%@'"), self->_deviceName);
  objc_msgSend(v6, "appendFormat:", CFSTR(" endReasonType:%td"), self->_endReasonType);
  if (self->_enqueuerProperties)
    objc_msgSend(v6, "appendFormat:", CFSTR(" enqueuerProperties:'%@'"), self->_enqueuerProperties);
  if (self->_eventDate)
    objc_msgSend(v6, "appendFormat:", CFSTR(" eventDate:%@"), self->_eventDate);
  if (self->_eventTimeZone)
    objc_msgSend(v6, "appendFormat:", CFSTR(" eventTimeZone:%@"), self->_eventTimeZone);
  if (self->_externalID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" externalID:'%@'"), self->_externalID);
  if (self->_featureName)
    objc_msgSend(v6, "appendFormat:", CFSTR(" featureName:'%@'"), self->_featureName);
  if (self->_householdID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" householdID:'%@'"), self->_householdID);
  if (self->_systemReleaseType)
    objc_msgSend(v6, "appendFormat:", CFSTR(" systemReleaseType: %li"), self->_systemReleaseType);
  objc_msgSend(v6, "appendFormat:", CFSTR(" itemDuration:%f itemStartTime:%f itemEndTime:%f"), *(_QWORD *)&self->_itemDuration, *(_QWORD *)&self->_itemStartTime, *(_QWORD *)&self->_itemEndTime);
  if (self->_itemType)
    objc_msgSend(v6, "appendFormat:", CFSTR(" itemType:%td"), self->_itemType);
  if (self->_itemIDs)
    objc_msgSend(v6, "appendFormat:", CFSTR(" itemIDs:'%@'"), self->_itemIDs);
  objc_msgSend(v6, "appendFormat:", CFSTR(" mediaType:%td"), self->_mediaType);
  if (self->_offline)
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  objc_msgSend(v6, "appendFormat:", CFSTR(" offline:%@"), v7);
  if (self->_personalizedContainerID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" personalizedContainerID:'%@'"), self->_personalizedContainerID);
  if (self->_recommendationData)
    objc_msgSend(v6, "appendFormat:", CFSTR(" hasRecommendationData:true"));
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if (-[NSNumber BOOLValue](privateListeningEnabled, "BOOLValue"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v6, "appendFormat:", CFSTR(" privateListeningEnabled: %@"), v9);
  }
  if (self->_SBEnabled)
    v10 = CFSTR("true");
  else
    v10 = CFSTR("false");
  objc_msgSend(v6, "appendFormat:", CFSTR(" SBEnabled:%@"), v10);
  siriInitiated = self->_siriInitiated;
  if (siriInitiated)
  {
    if (-[NSNumber BOOLValue](siriInitiated, "BOOLValue"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v6, "appendFormat:", CFSTR(" siriInitiated: %@"), v12);
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" sourceType:%td"), self->_sourceType);
  objc_msgSend(v6, "appendFormat:", CFSTR(" storeAccountID:%llu"), self->_storeAccountID);
  objc_msgSend(v6, "appendFormat:", CFSTR(" storeFrontID:%@"), self->_storeFrontID);
  if (self->_storeID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" storeID:'%@'"), self->_storeID);
  if (self->_requestingBundleIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR(" requestingBundleIdentifier:'%@'"), self->_requestingBundleIdentifier);
  if (self->_requestingBundleVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR(" requestingBundleVersion:'%@'"), self->_requestingBundleVersion);
  v13 = -[NSData length](self->_timedMetadata, "length");
  if (v13)
    objc_msgSend(v6, "appendFormat:", CFSTR(" timedMetadata(length):%td"), v13);
  if (self->_trackInfo)
    objc_msgSend(v6, "appendString:", CFSTR(" hasTrackInfo:true"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SSVPlayActivityEvent *v4;
  int64_t v5;
  BOOL v6;

  v4 = (SSVPlayActivityEvent *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SSVPlayActivityEvent persistentID](self, "persistentID");
      v6 = v5 == -[SSVPlayActivityEvent persistentID](v4, "persistentID");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (SSVPlayActivityEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SSVPlayActivityEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_SSVPlayActivityEventCoderDataRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SSVPlayActivityEvent initWithDataRepresentation:](self, "initWithDataRepresentation:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SSVPlayActivityEvent dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_SSVPlayActivityEventCoderDataRepresentation"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_class *v5;
  uint64_t v6;

  v5 = -[SSVPlayActivityEvent _mutableCopyClass](self, "_mutableCopyClass");
  v6 = -[objc_class init](-[objc_class allocWithZone:](v5, "allocWithZone:", a3), "init");

  if (v6)
  {
    objc_storeStrong((id *)(v6 + 8), self->_buildVersion);
    objc_storeStrong((id *)(v6 + 16), self->_containerID);
    objc_storeStrong((id *)(v6 + 24), self->_containerIDs);
    *(_QWORD *)(v6 + 32) = self->_containerType;
    objc_storeStrong((id *)(v6 + 40), self->_deviceName);
    *(_QWORD *)(v6 + 48) = self->_displayType;
    *(_QWORD *)(v6 + 56) = self->_endReasonType;
    objc_storeStrong((id *)(v6 + 64), self->_enqueuerProperties);
    objc_storeStrong((id *)(v6 + 72), self->_eventDate);
    objc_storeStrong((id *)(v6 + 80), self->_eventTimeZone);
    *(_QWORD *)(v6 + 88) = self->_eventType;
    objc_storeStrong((id *)(v6 + 96), self->_externalID);
    objc_storeStrong((id *)(v6 + 112), self->_householdID);
    objc_storeStrong((id *)(v6 + 104), self->_featureName);
    objc_storeStrong((id *)(v6 + 120), self->_itemIDs);
    *(double *)(v6 + 128) = self->_itemDuration;
    *(double *)(v6 + 136) = self->_itemEndTime;
    *(double *)(v6 + 144) = self->_itemStartTime;
    *(_QWORD *)(v6 + 152) = self->_itemType;
    *(_QWORD *)(v6 + 160) = self->_lyricsDisplayedCharacterCount;
    objc_storeStrong((id *)(v6 + 168), self->_lyricsLanguage);
    *(_QWORD *)(v6 + 176) = self->_mediaType;
    *(_BYTE *)(v6 + 184) = self->_offline;
    *(_QWORD *)(v6 + 192) = self->_persistentID;
    objc_storeStrong((id *)(v6 + 200), self->_personalizedContainerID);
    objc_storeStrong((id *)(v6 + 208), self->_privateListeningEnabled);
    *(_QWORD *)(v6 + 216) = self->_reasonHintType;
    objc_storeStrong((id *)(v6 + 224), self->_recommendationData);
    objc_storeStrong((id *)(v6 + 232), self->_requestingBundleIdentifier);
    objc_storeStrong((id *)(v6 + 240), self->_requestingBundleVersion);
    *(_BYTE *)(v6 + 248) = self->_SBEnabled;
    objc_storeStrong((id *)(v6 + 256), self->_siriInitiated);
    *(_QWORD *)(v6 + 264) = self->_sourceType;
    *(_QWORD *)(v6 + 280) = self->_storeAccountID;
    objc_storeStrong((id *)(v6 + 288), self->_storeFrontID);
    objc_storeStrong((id *)(v6 + 296), self->_storeID);
    *(_QWORD *)(v6 + 272) = self->_systemReleaseType;
    objc_storeStrong((id *)(v6 + 304), self->_timedMetadata);
    objc_storeStrong((id *)(v6 + 312), self->_trackInfo);
    *(_QWORD *)(v6 + 320) = self->_version;
  }
  return (id)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataRepresentation
{
  SSVPBPlayActivityEvent *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  SSVPBPlayActivityEnqueuerProperties *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  unint64_t v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v3 = objc_alloc_init(SSVPBPlayActivityEvent);
  v4 = -[SSVPlayActivityEvent containerType](self, "containerType") - 1;
  if (v4 > 3)
    v5 = 0;
  else
    v5 = dword_1A27A10A0[v4];
  -[SSVPBPlayActivityEvent setContainerType:](v3, "setContainerType:", v5);
  -[SSVPlayActivityEvent deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setDeviceName:](v3, "setDeviceName:", v6);

  v7 = -[SSVPlayActivityEvent displayType](self, "displayType") - 1;
  if (v7 < 3)
    v8 = (v7 + 1);
  else
    v8 = 0;
  -[SSVPBPlayActivityEvent setDisplayType:](v3, "setDisplayType:", v8);
  v9 = -[SSVPlayActivityEvent endReasonType](self, "endReasonType");
  v10 = 0;
  if (v9 - 1 <= 0xD)
    v10 = dword_1A27A1060[v9 - 1];
  -[SSVPBPlayActivityEvent setEndReasonType:](v3, "setEndReasonType:", v10);
  -[SSVPlayActivityEvent eventDate](self, "eventDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  -[SSVPBPlayActivityEvent setEventDateTimestamp:](v3, "setEventDateTimestamp:");

  -[SSVPlayActivityEvent eventTimeZone](self, "eventTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setEventTimeZoneName:](v3, "setEventTimeZoneName:", v13);

  -[SSVPlayActivityEvent featureName](self, "featureName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setFeatureName:](v3, "setFeatureName:", v14);

  -[SSVPlayActivityEvent itemDuration](self, "itemDuration");
  -[SSVPBPlayActivityEvent setItemDuration:](v3, "setItemDuration:");
  -[SSVPlayActivityEvent itemEndTime](self, "itemEndTime");
  -[SSVPBPlayActivityEvent setItemEndTime:](v3, "setItemEndTime:");
  -[SSVPlayActivityEvent itemStartTime](self, "itemStartTime");
  -[SSVPBPlayActivityEvent setItemStartTime:](v3, "setItemStartTime:");
  v15 = -[SSVPlayActivityEvent itemType](self, "itemType") - 1;
  if (v15 < 9)
    v16 = (v15 + 1);
  else
    v16 = 0;
  -[SSVPBPlayActivityEvent setItemType:](v3, "setItemType:", v16);
  -[SSVPBPlayActivityEvent setMediaType:](v3, "setMediaType:", -[SSVPlayActivityEvent mediaType](self, "mediaType") == 1);
  -[SSVPBPlayActivityEvent setCharacterDisplayedCount:](v3, "setCharacterDisplayedCount:", -[SSVPlayActivityEvent lyricsDisplayedCharacterCount](self, "lyricsDisplayedCharacterCount"));
  -[SSVPlayActivityEvent lyricsLanguage](self, "lyricsLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setLyricLanguage:](v3, "setLyricLanguage:", v17);

  -[SSVPBPlayActivityEvent setOffline:](v3, "setOffline:", -[SSVPlayActivityEvent isOffline](self, "isOffline"));
  -[SSVPBPlayActivityEvent setPersistentID:](v3, "setPersistentID:", -[SSVPlayActivityEvent persistentID](self, "persistentID"));
  -[SSVPlayActivityEvent recommendationData](self, "recommendationData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setRecommendationData:](v3, "setRecommendationData:", v18);

  -[SSVPBPlayActivityEvent setSBEnabled:](v3, "setSBEnabled:", self->_SBEnabled);
  v19 = -[SSVPlayActivityEvent sourceType](self, "sourceType");
  if (v19 == 2)
    v20 = 2;
  else
    v20 = v19 == 1;
  -[SSVPBPlayActivityEvent setSourceType:](v3, "setSourceType:", v20);
  -[SSVPBPlayActivityEvent setStoreAccountID:](v3, "setStoreAccountID:", -[SSVPlayActivityEvent storeAccountID](self, "storeAccountID"));
  -[SSVPlayActivityEvent storeFrontID](self, "storeFrontID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setStoreFrontID:](v3, "setStoreFrontID:", v21);

  -[SSVPlayActivityEvent timedMetadata](self, "timedMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setTimedMetadata:](v3, "setTimedMetadata:", v22);

  -[SSVPlayActivityEvent trackInfo](self, "trackInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setTrackInfo:](v3, "setTrackInfo:", v23);

  -[SSVPlayActivityEvent requestingBundleIdentifier](self, "requestingBundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setRequestingBundleIdentifier:](v3, "setRequestingBundleIdentifier:", v24);

  -[SSVPlayActivityEvent requestingBundleVersion](self, "requestingBundleVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setRequestingBundleVersion:](v3, "setRequestingBundleVersion:", v25);

  v26 = -[SSVPlayActivityEvent systemReleaseType](self, "systemReleaseType") - 1;
  if (v26 < 4)
    v27 = (v26 + 1);
  else
    v27 = 0;
  -[SSVPBPlayActivityEvent setSystemReleaseType:](v3, "setSystemReleaseType:", v27);
  -[SSVPlayActivityEvent enqueuerProperties](self, "enqueuerProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = objc_alloc_init(SSVPBPlayActivityEnqueuerProperties);
    objc_msgSend(v28, "buildVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      -[SSVPBPlayActivityEnqueuerProperties setBuildVersion:](v29, "setBuildVersion:", v30);
    objc_msgSend(v28, "deviceGUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      -[SSVPBPlayActivityEnqueuerProperties setDeviceGUID:](v29, "setDeviceGUID:", v31);
    objc_msgSend(v28, "deviceName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      -[SSVPBPlayActivityEnqueuerProperties setDeviceName:](v29, "setDeviceName:", v32);
    objc_msgSend(v28, "isPrivateListeningEnabled");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      -[SSVPBPlayActivityEnqueuerProperties setPrivateListeningEnabled:](v29, "setPrivateListeningEnabled:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v28, "timeZone");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVPBPlayActivityEnqueuerProperties setTimeZoneName:](v29, "setTimeZoneName:", v37);

    }
    v38 = objc_msgSend(v28, "systemReleaseType") - 1;
    if (v38 < 4)
      v39 = (v38 + 1);
    else
      v39 = 0;
    -[SSVPBPlayActivityEnqueuerProperties setSystemReleaseType:](v29, "setSystemReleaseType:", v39);
    -[SSVPBPlayActivityEnqueuerProperties setSBEnabled:](v29, "setSBEnabled:", objc_msgSend(v28, "isSBEnabled"));
    v40 = objc_msgSend(v28, "storeAccountID");
    if (v40)
      -[SSVPBPlayActivityEnqueuerProperties setStoreAccountID:](v29, "setStoreAccountID:", v40);
    objc_msgSend(v28, "storeFrontID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      -[SSVPBPlayActivityEnqueuerProperties setStoreFrontID:](v29, "setStoreFrontID:", v41);
    -[SSVPBPlayActivityEvent setEnqueuerProperties:](v3, "setEnqueuerProperties:", v29);

  }
  -[SSVPlayActivityEvent householdID](self, "householdID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent setHouseholdID:](v3, "setHouseholdID:", v42);

  -[SSVPlayActivityEvent isPrivateListeningEnabled](self, "isPrivateListeningEnabled");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
    -[SSVPBPlayActivityEvent setPrivateListeningEnabled:](v3, "setPrivateListeningEnabled:", objc_msgSend(v43, "BOOLValue"));
  -[SSVPlayActivityEvent isSiriInitiated](self, "isSiriInitiated");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
    -[SSVPBPlayActivityEvent setSiriInitiated:](v3, "setSiriInitiated:", objc_msgSend(v45, "BOOLValue"));
  if (self->_version > 1)
  {
    -[SSVPlayActivityEvent buildVersion](self, "buildVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setBuildVersion:](v3, "setBuildVersion:", v51);

    v52 = -[SSVPlayActivityEvent eventType](self, "eventType");
    if (v52 == 1)
      v53 = 2;
    else
      v53 = 1;
    if (v52 == 2)
      v54 = 3;
    else
      v54 = v53;
    -[SSVPBPlayActivityEvent setEventType:](v3, "setEventType:", v54);
    -[SSVPBPlayActivityEvent setReasonHintType:](v3, "setReasonHintType:", -[SSVPlayActivityEvent reasonHintType](self, "reasonHintType") == 1);
    -[SSVPlayActivityEvent containerIDs](self, "containerIDs");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setContainerAdamID:](v3, "setContainerAdamID:", objc_msgSend(v50, "adamID"));
    objc_msgSend(v50, "globalPlaylistID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setGlobalPlaylistID:](v3, "setGlobalPlaylistID:", v55);

    objc_msgSend(v50, "playlistVersionHash");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setPlaylistVersionHash:](v3, "setPlaylistVersionHash:", v56);

    objc_msgSend(v50, "stationHash");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setStationHash:](v3, "setStationHash:", v57);

    objc_msgSend(v50, "stationStringID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setStationStringID:](v3, "setStationStringID:", v58);

    -[SSVPBPlayActivityEvent setStationID:](v3, "setStationID:", objc_msgSend(v50, "stationID"));
    objc_msgSend(v50, "cloudAlbumID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setCloudAlbumID:](v3, "setCloudAlbumID:", v59);

    -[SSVPBPlayActivityEvent setCloudPlaylistID:](v3, "setCloudPlaylistID:", objc_msgSend(v50, "cloudPlaylistID"));
    -[SSVPlayActivityEvent itemIDs](self, "itemIDs");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setSubscriptionAdamID:](v3, "setSubscriptionAdamID:", objc_msgSend(v60, "subscriptionAdamID"));
    -[SSVPBPlayActivityEvent setPurchasedAdamID:](v3, "setPurchasedAdamID:", objc_msgSend(v60, "purchasedAdamID"));
    -[SSVPBPlayActivityEvent setRadioAdamID:](v3, "setRadioAdamID:", objc_msgSend(v60, "radioAdamID"));
    -[SSVPBPlayActivityEvent setItemCloudID:](v3, "setItemCloudID:", objc_msgSend(v60, "cloudID"));
    objc_msgSend(v60, "lyricsID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setLyricsID:](v3, "setLyricsID:", v61);

    -[SSVPBPlayActivityEvent setEquivalencySourceAdamID:](v3, "setEquivalencySourceAdamID:", objc_msgSend(v60, "equivalencySourceAdamID"));
  }
  else
  {
    -[SSVPlayActivityEvent containerID](self, "containerID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setContainerID:](v3, "setContainerID:", v47);

    -[SSVPlayActivityEvent externalID](self, "externalID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setExternalID:](v3, "setExternalID:", v48);

    -[SSVPlayActivityEvent personalizedContainerID](self, "personalizedContainerID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setPersonalizedContainerID:](v3, "setPersonalizedContainerID:", v49);

    -[SSVPlayActivityEvent storeID](self, "storeID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPBPlayActivityEvent setStoreID:](v3, "setStoreID:", v50);
  }

  -[SSVPBPlayActivityEvent data](v3, "data");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v62;
}

- (BOOL)isInternalBuild
{
  return self->_systemReleaseType == 4;
}

- (int64_t)persistentID
{
  int64_t i;
  const __CFUUID *v4;

  for (i = self->_persistentID; !i; self->_persistentID = i)
  {
    v4 = CFUUIDCreate(0);
    i = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
  }
  return i;
}

- (Class)_mutableCopyClass
{
  objc_opt_class();
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (SSVPlayActivityEventContainerIDs)containerIDs
{
  return self->_containerIDs;
}

- (unint64_t)containerType
{
  return self->_containerType;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)endReasonType
{
  return self->_endReasonType;
}

- (SSVPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)householdID
{
  return self->_householdID;
}

- (SSVPlayActivityEventItemIDs)itemIDs
{
  return self->_itemIDs;
}

- (double)itemDuration
{
  return self->_itemDuration;
}

- (double)itemEndTime
{
  return self->_itemEndTime;
}

- (double)itemStartTime
{
  return self->_itemStartTime;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (unint64_t)lyricsDisplayedCharacterCount
{
  return self->_lyricsDisplayedCharacterCount;
}

- (NSString)lyricsLanguage
{
  return self->_lyricsLanguage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)isOffline
{
  return self->_offline;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (unint64_t)reasonHintType
{
  return self->_reasonHintType;
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (BOOL)isSBEnabled
{
  return self->_SBEnabled;
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (NSData)timedMetadata
{
  return self->_timedMetadata;
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)personalizedContainerID
{
  return self->_personalizedContainerID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsLanguage, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
