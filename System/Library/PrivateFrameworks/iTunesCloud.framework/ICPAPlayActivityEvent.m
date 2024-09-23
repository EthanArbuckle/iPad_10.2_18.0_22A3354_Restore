@implementation ICPAPlayActivityEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPAPlayActivityEvent;
  -[ICPAPlayActivityEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPAPlayActivityEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  void *v5;
  NSString *lyricsID;
  $1C24819EE6FCB6BF7661081CD3A68180 v7;
  void *v8;
  void *v9;
  NSString *globalPlaylistID;
  NSString *stationHash;
  NSString *stationStringID;
  void *v13;
  NSString *cloudAlbumID;
  void *v15;
  NSString *playlistVersionHash;
  void *v17;
  NSString *deviceName;
  $1C24819EE6FCB6BF7661081CD3A68180 v19;
  void *v20;
  void *v21;
  NSString *featureName;
  $1C24819EE6FCB6BF7661081CD3A68180 v23;
  void *v24;
  NSData *timedMetadata;
  NSData *trackInfo;
  NSData *recommendationData;
  NSString *storeFrontID;
  NSString *buildVersion;
  NSString *requestingBundleIdentifier;
  NSString *requestingBundleVersion;
  ICPAPlayActivityEnqueuerProperties *enqueuerProperties;
  void *v33;
  NSString *householdID;
  $1C24819EE6FCB6BF7661081CD3A68180 v35;
  void *v36;
  NSString *eventTimeZoneName;
  $1C24819EE6FCB6BF7661081CD3A68180 v38;
  void *v39;
  void *v40;
  NSString *lyricLanguage;
  NSMutableArray *buildFeatures;
  ICPAPlayModeDictionary *playMode;
  void *v44;
  $1C24819EE6FCB6BF7661081CD3A68180 v45;
  void *v46;
  void *v47;
  ICPAAudioQualityDictionary *targetedAudioQuality;
  void *v49;
  ICPAAudioQualityDictionary *providedAudioQuality;
  void *v51;
  NSString *queueGroupingID;
  $1C24819EE6FCB6BF7661081CD3A68180 v53;
  void *v54;
  NSString *containerID;
  NSString *personalizedContainerID;
  NSString *storeID;
  NSString *externalID;
  $1C24819EE6FCB6BF7661081CD3A68180 v59;
  void *v60;
  id v61;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_eventType);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("eventType"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x40000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_4;
      goto LABEL_118;
    }
  }
  else if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_reasonHintType);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("reasonHintType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_subscriptionAdamID);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("subscriptionAdamID"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_purchasedAdamID);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("purchasedAdamID"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_radioAdamID);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("radioAdamID"));

  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_itemCloudID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("itemCloudID"));

  }
LABEL_8:
  lyricsID = self->_lyricsID;
  if (lyricsID)
    objc_msgSend(v3, "setObject:forKey:", lyricsID, CFSTR("lyricsID"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_equivalencySourceAdamID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("equivalencySourceAdamID"));

    v7 = self->_has;
  }
  if ((*(_BYTE *)&v7 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_containerAdamID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("containerAdamID"));

  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID)
    objc_msgSend(v3, "setObject:forKey:", globalPlaylistID, CFSTR("globalPlaylistID"));
  stationHash = self->_stationHash;
  if (stationHash)
    objc_msgSend(v3, "setObject:forKey:", stationHash, CFSTR("stationHash"));
  stationStringID = self->_stationStringID;
  if (stationStringID)
    objc_msgSend(v3, "setObject:forKey:", stationStringID, CFSTR("stationStringID"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stationID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("stationID"));

  }
  cloudAlbumID = self->_cloudAlbumID;
  if (cloudAlbumID)
    objc_msgSend(v3, "setObject:forKey:", cloudAlbumID, CFSTR("cloudAlbumID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_cloudPlaylistID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cloudPlaylistID"));

  }
  playlistVersionHash = self->_playlistVersionHash;
  if (playlistVersionHash)
    objc_msgSend(v3, "setObject:forKey:", playlistVersionHash, CFSTR("playlistVersionHash"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_containerType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("containerType"));

  }
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endReasonType);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("endReasonType"));

    v19 = self->_has;
  }
  if ((*(_BYTE *)&v19 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventDateTimestamp);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("eventDateTimestamp"));

  }
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v3, "setObject:forKey:", featureName, CFSTR("featureName"));
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemDuration);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("itemDuration"));

    v23 = self->_has;
    if ((*(_WORD *)&v23 & 0x100) == 0)
    {
LABEL_40:
      if ((*(_WORD *)&v23 & 0x200) == 0)
        goto LABEL_41;
      goto LABEL_124;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemEndTime);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("itemEndTime"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x200) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v23 & 0x8000000) == 0)
      goto LABEL_42;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemStartTime);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("itemStartTime"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v23 & 0x10000000) == 0)
      goto LABEL_43;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_itemType);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("itemType"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
      goto LABEL_44;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mediaType);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("mediaType"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v23 & 0x400) == 0)
      goto LABEL_45;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_offline);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("offline"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x400) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v23 & 0x10000000000) == 0)
      goto LABEL_46;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("persistentID"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x10000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v23 & 0x100000000) == 0)
      goto LABEL_47;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sBEnabled);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("SBEnabled"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x100000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v23 & 0x20000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sourceType);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("sourceType"));

  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_storeAccountID);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("storeAccountID"));

  }
LABEL_49:
  timedMetadata = self->_timedMetadata;
  if (timedMetadata)
    objc_msgSend(v3, "setObject:forKey:", timedMetadata, CFSTR("timedMetadata"));
  trackInfo = self->_trackInfo;
  if (trackInfo)
    objc_msgSend(v3, "setObject:forKey:", trackInfo, CFSTR("trackInfo"));
  recommendationData = self->_recommendationData;
  if (recommendationData)
    objc_msgSend(v3, "setObject:forKey:", recommendationData, CFSTR("recommendationData"));
  storeFrontID = self->_storeFrontID;
  if (storeFrontID)
    objc_msgSend(v3, "setObject:forKey:", storeFrontID, CFSTR("storeFrontID"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestingBundleIdentifier, CFSTR("requestingBundleIdentifier"));
  requestingBundleVersion = self->_requestingBundleVersion;
  if (requestingBundleVersion)
    objc_msgSend(v3, "setObject:forKey:", requestingBundleVersion, CFSTR("requestingBundleVersion"));
  enqueuerProperties = self->_enqueuerProperties;
  if (enqueuerProperties)
  {
    -[ICPAPlayActivityEnqueuerProperties dictionaryRepresentation](enqueuerProperties, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("enqueuerProperties"));

  }
  householdID = self->_householdID;
  if (householdID)
    objc_msgSend(v3, "setObject:forKey:", householdID, CFSTR("householdID"));
  v35 = self->_has;
  if ((*(_QWORD *)&v35 & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateListeningEnabled);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("privateListeningEnabled"));

    v35 = self->_has;
    if ((*(_QWORD *)&v35 & 0x20000000000) == 0)
    {
LABEL_69:
      if ((*(_QWORD *)&v35 & 0x200000000) == 0)
        goto LABEL_71;
      goto LABEL_70;
    }
  }
  else if ((*(_QWORD *)&v35 & 0x20000000000) == 0)
  {
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriInitiated);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("siriInitiated"));

  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_70:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_systemReleaseType);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("systemReleaseType"));

  }
LABEL_71:
  eventTimeZoneName = self->_eventTimeZoneName;
  if (eventTimeZoneName)
    objc_msgSend(v3, "setObject:forKey:", eventTimeZoneName, CFSTR("eventTimeZoneName"));
  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_displayType);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("displayType"));

    v38 = self->_has;
  }
  if ((*(_BYTE *)&v38 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_characterDisplayedCount);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("characterDisplayedCount"));

  }
  lyricLanguage = self->_lyricLanguage;
  if (lyricLanguage)
    objc_msgSend(v3, "setObject:forKey:", lyricLanguage, CFSTR("lyricLanguage"));
  buildFeatures = self->_buildFeatures;
  if (buildFeatures)
    objc_msgSend(v3, "setObject:forKey:", buildFeatures, CFSTR("buildFeatures"));
  playMode = self->_playMode;
  if (playMode)
  {
    -[ICPAPlayModeDictionary dictionaryRepresentation](playMode, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("play_mode"));

  }
  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioQualityPreference);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("audioQualityPreference"));

    v45 = self->_has;
  }
  if ((*(_DWORD *)&v45 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackFormatPreference);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("playbackFormatPreference"));

  }
  targetedAudioQuality = self->_targetedAudioQuality;
  if (targetedAudioQuality)
  {
    -[ICPAAudioQualityDictionary dictionaryRepresentation](targetedAudioQuality, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("targetedAudioQuality"));

  }
  providedAudioQuality = self->_providedAudioQuality;
  if (providedAudioQuality)
  {
    -[ICPAAudioQualityDictionary dictionaryRepresentation](providedAudioQuality, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("providedAudioQuality"));

  }
  queueGroupingID = self->_queueGroupingID;
  if (queueGroupingID)
    objc_msgSend(v3, "setObject:forKey:", queueGroupingID, CFSTR("queueGroupingID"));
  v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportingAdamID);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("reportingAdamID"));

    v53 = self->_has;
    if ((*(_WORD *)&v53 & 0x4000) == 0)
    {
LABEL_95:
      if ((*(_WORD *)&v53 & 0x8000) == 0)
        goto LABEL_96;
      goto LABEL_137;
    }
  }
  else if ((*(_WORD *)&v53 & 0x4000) == 0)
  {
    goto LABEL_95;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sharedActivityGroupSizeCurrent);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("sharedActivityGroupSizeCurrent"));

  v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x8000) == 0)
  {
LABEL_96:
    if ((*(_QWORD *)&v53 & 0x400000000) == 0)
      goto LABEL_97;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sharedActivityGroupSizeMax);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("sharedActivityGroupSizeMax"));

  v53 = self->_has;
  if ((*(_QWORD *)&v53 & 0x400000000) == 0)
  {
LABEL_97:
    if ((*(_DWORD *)&v53 & 0x200000) == 0)
      goto LABEL_98;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_vocalAttenuationAvailibility);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("vocalAttenuationAvailibility"));

  v53 = self->_has;
  if ((*(_DWORD *)&v53 & 0x200000) == 0)
  {
LABEL_98:
    if ((*(_QWORD *)&v53 & 0x800000000) == 0)
      goto LABEL_99;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_vocalAttenuationDuration);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("vocalAttenuationDuration"));

  v53 = self->_has;
  if ((*(_QWORD *)&v53 & 0x800000000) == 0)
  {
LABEL_99:
    if ((*(_QWORD *)&v53 & 0x2000000000) == 0)
      goto LABEL_100;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_continuityCameraUsed);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("continuityCameraUsed"));

  v53 = self->_has;
  if ((*(_QWORD *)&v53 & 0x2000000000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&v53 & 0x80000000) == 0)
      goto LABEL_102;
    goto LABEL_101;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCollaborativePlaylist);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("isCollaborativePlaylist"));

  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_101:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sharedActivityType);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("sharedActivityType"));

  }
LABEL_102:
  containerID = self->_containerID;
  if (containerID)
    objc_msgSend(v3, "setObject:forKey:", containerID, CFSTR("containerID"));
  personalizedContainerID = self->_personalizedContainerID;
  if (personalizedContainerID)
    objc_msgSend(v3, "setObject:forKey:", personalizedContainerID, CFSTR("personalizedContainerID"));
  storeID = self->_storeID;
  if (storeID)
    objc_msgSend(v3, "setObject:forKey:", storeID, CFSTR("storeID"));
  externalID = self->_externalID;
  if (externalID)
    objc_msgSend(v3, "setObject:forKey:", externalID, CFSTR("externalID"));
  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_tvShowPurchasedAdamID);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("tvShowPurchasedAdamID"));

    v59 = self->_has;
    if ((*(_DWORD *)&v59 & 0x100000) == 0)
    {
LABEL_112:
      if ((*(_QWORD *)&v59 & 0x1000000000) == 0)
        goto LABEL_113;
LABEL_145:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_internalBuild);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("internalBuild"));

      if ((*(_QWORD *)&self->_has & 0x20) == 0)
        goto LABEL_115;
      goto LABEL_114;
    }
  }
  else if ((*(_DWORD *)&v59 & 0x100000) == 0)
  {
    goto LABEL_112;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_tvShowSubscriptionAdamID);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("tvShowSubscriptionAdamID"));

  v59 = self->_has;
  if ((*(_QWORD *)&v59 & 0x1000000000) != 0)
    goto LABEL_145;
LABEL_113:
  if ((*(_BYTE *)&v59 & 0x20) != 0)
  {
LABEL_114:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventSecondsFromGMT);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("eventSecondsFromGMT"));

  }
LABEL_115:
  v61 = v3;

  return v61;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  objc_class *v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  objc_class *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  char v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char v119;
  char v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  char v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  char v144;
  unsigned int v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  char v149;
  char v150;
  unsigned int v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  char v156;
  char v157;
  unsigned int v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  char v162;
  char v163;
  unsigned int v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  char v168;
  ICPAPlayActivityEnqueuerProperties *v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char v176;
  char v177;
  unsigned int v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  char v183;
  char v184;
  unsigned int v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  char v189;
  int v190;
  char v191;
  unsigned int v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  char v196;
  char v197;
  unsigned int v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  char v202;
  char v203;
  unsigned int v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  char v208;
  char v209;
  unsigned int v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  char v214;
  uint64_t v215;
  void *v216;
  char v217;
  unsigned int v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  char v222;
  char v223;
  unsigned int v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  char v228;
  char v229;
  unsigned int v230;
  uint64_t v231;
  uint64_t v232;
  unint64_t v233;
  char v234;
  char v235;
  unsigned int v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  char v240;
  uint64_t v241;
  unint64_t v242;
  char v243;
  unsigned int v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  char v249;
  char v250;
  unsigned int v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  unint64_t v255;
  char v256;
  char v257;
  unsigned int v258;
  uint64_t v259;
  uint64_t v260;
  unint64_t v261;
  char v262;
  uint64_t v263;
  BOOL v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        v14 = v13 + 1;
        if (v13 == -1 || v14 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v15 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v16 = v10++ >= 9;
        if (v16)
        {
          v11 = 0;
          v17 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v17 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v17 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 216;
          goto LABEL_276;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x800000uLL;
          while (2)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
              *(_QWORD *)((char *)a3 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_332;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_332:
          v263 = 224;
          goto LABEL_475;
        case 3u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 232;
          goto LABEL_276;
        case 4u:
          v28 = 0;
          v29 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x2000000uLL;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v32;
              v23 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_336;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_336:
          v263 = 244;
          goto LABEL_475;
        case 5u:
          *(_QWORD *)&self->_has |= 0x10uLL;
          v34 = *v4;
          v35 = *(_QWORD *)((char *)a3 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v35);
            *(_QWORD *)((char *)a3 + v34) = v35 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 40;
          goto LABEL_488;
        case 6u:
          *(_QWORD *)&self->_has |= 0x20uLL;
          v37 = *v4;
          v38 = *(_QWORD *)((char *)a3 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v38);
            *(_QWORD *)((char *)a3 + v37) = v38 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 48;
          goto LABEL_488;
        case 7u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 272;
          goto LABEL_276;
        case 8u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 280;
          goto LABEL_276;
        case 9u:
          *(_QWORD *)&self->_has |= 0x80uLL;
          v39 = *v4;
          v40 = *(_QWORD *)((char *)a3 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v40);
            *(_QWORD *)((char *)a3 + v39) = v40 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 64;
          goto LABEL_488;
        case 0xAu:
          *(_QWORD *)&self->_has |= 0x100uLL;
          v41 = *v4;
          v42 = *(_QWORD *)((char *)a3 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v42);
            *(_QWORD *)((char *)a3 + v41) = v42 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 72;
          goto LABEL_488;
        case 0xBu:
          *(_QWORD *)&self->_has |= 0x200uLL;
          v43 = *v4;
          v44 = *(_QWORD *)((char *)a3 + v43);
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v44);
            *(_QWORD *)((char *)a3 + v43) = v44 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 80;
          goto LABEL_488;
        case 0xCu:
          v45 = 0;
          v46 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x8000000uLL;
          while (2)
          {
            v47 = *v4;
            v48 = *(_QWORD *)((char *)a3 + v47);
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v48);
              *(_QWORD *)((char *)a3 + v47) = v49;
              v23 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_340;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_340:
          v263 = 304;
          goto LABEL_475;
        case 0xDu:
          v51 = 0;
          v52 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x10000000uLL;
          while (2)
          {
            v53 = *v4;
            v54 = *(_QWORD *)((char *)a3 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v54);
              *(_QWORD *)((char *)a3 + v53) = v55;
              v23 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v16 = v52++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_344;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_344:
          v263 = 328;
          goto LABEL_475;
        case 0xEu:
          v57 = 0;
          v58 = 0;
          v59 = 0;
          *(_QWORD *)&self->_has |= 0x4000000000uLL;
          while (2)
          {
            v60 = *v4;
            v61 = *(_QWORD *)((char *)a3 + v60);
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v61);
              *(_QWORD *)((char *)a3 + v60) = v62;
              v59 |= (unint64_t)(v63 & 0x7F) << v57;
              if (v63 < 0)
              {
                v57 += 7;
                v16 = v58++ >= 9;
                if (v16)
                {
                  v59 = 0;
                  goto LABEL_348;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v59 = 0;
LABEL_348:
          v264 = v59 != 0;
          v265 = 495;
          goto LABEL_470;
        case 0xFu:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x400uLL;
          while (2)
          {
            v67 = *v4;
            v68 = *(_QWORD *)((char *)a3 + v67);
            v69 = v68 + 1;
            if (v68 == -1 || v69 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v68);
              *(_QWORD *)((char *)a3 + v67) = v69;
              v66 |= (unint64_t)(v70 & 0x7F) << v64;
              if (v70 < 0)
              {
                v64 += 7;
                v16 = v65++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_352;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_352:
          v266 = 88;
          goto LABEL_457;
        case 0x10u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 336;
          goto LABEL_276;
        case 0x11u:
          v71 = 0;
          v72 = 0;
          v73 = 0;
          *(_QWORD *)&self->_has |= 0x10000000000uLL;
          while (2)
          {
            v74 = *v4;
            v75 = *(_QWORD *)((char *)a3 + v74);
            v76 = v75 + 1;
            if (v75 == -1 || v76 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v75);
              *(_QWORD *)((char *)a3 + v74) = v76;
              v73 |= (unint64_t)(v77 & 0x7F) << v71;
              if (v77 < 0)
              {
                v71 += 7;
                v16 = v72++ >= 9;
                if (v16)
                {
                  v73 = 0;
                  goto LABEL_356;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v73 = 0;
LABEL_356:
          v264 = v73 != 0;
          v265 = 497;
          goto LABEL_470;
        case 0x12u:
          v78 = 0;
          v79 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x100000000uLL;
          while (2)
          {
            v80 = *v4;
            v81 = *(_QWORD *)((char *)a3 + v80);
            v82 = v81 + 1;
            if (v81 == -1 || v82 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v83 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v81);
              *(_QWORD *)((char *)a3 + v80) = v82;
              v23 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                v16 = v79++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_360;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_360:
          v263 = 420;
          goto LABEL_475;
        case 0x13u:
          v84 = 0;
          v85 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x20000uLL;
          while (2)
          {
            v86 = *v4;
            v87 = *(_QWORD *)((char *)a3 + v86);
            v88 = v87 + 1;
            if (v87 == -1 || v88 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v89 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v87);
              *(_QWORD *)((char *)a3 + v86) = v88;
              v66 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                v16 = v85++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_364;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_364:
          v266 = 144;
          goto LABEL_457;
        case 0x14u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 448;
          goto LABEL_276;
        case 0x15u:
          PBReaderReadData();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 472;
          goto LABEL_276;
        case 0x16u:
          PBReaderReadData();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 480;
          goto LABEL_276;
        case 0x17u:
          PBReaderReadData();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 392;
          goto LABEL_276;
        case 0x18u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 440;
          goto LABEL_276;
        case 0x19u:
          v90 = 0;
          v91 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x4000000uLL;
          while (2)
          {
            v92 = *v4;
            v93 = *(_QWORD *)((char *)a3 + v92);
            v94 = v93 + 1;
            if (v93 == -1 || v94 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v95 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v93);
              *(_QWORD *)((char *)a3 + v92) = v94;
              v23 |= (unint64_t)(v95 & 0x7F) << v90;
              if (v95 < 0)
              {
                v90 += 7;
                v16 = v91++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_368;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_368:
          v263 = 264;
          goto LABEL_475;
        case 0x1Au:
          v96 = 0;
          v97 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x40000uLL;
          while (2)
          {
            v98 = *v4;
            v99 = *(_QWORD *)((char *)a3 + v98);
            v100 = v99 + 1;
            if (v99 == -1 || v100 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v101 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v99);
              *(_QWORD *)((char *)a3 + v98) = v100;
              v66 |= (unint64_t)(v101 & 0x7F) << v96;
              if (v101 < 0)
              {
                v96 += 7;
                v16 = v97++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_372;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_372:
          v266 = 152;
          goto LABEL_457;
        case 0x1Bu:
          v102 = 0;
          v103 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x800uLL;
          while (2)
          {
            v104 = *v4;
            v105 = *(_QWORD *)((char *)a3 + v104);
            v106 = v105 + 1;
            if (v105 == -1 || v106 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v107 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v105);
              *(_QWORD *)((char *)a3 + v104) = v106;
              v66 |= (unint64_t)(v107 & 0x7F) << v102;
              if (v107 < 0)
              {
                v102 += 7;
                v16 = v103++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_376;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_376:
          v266 = 96;
          goto LABEL_457;
        case 0x1Cu:
          v108 = 0;
          v109 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x1000uLL;
          while (2)
          {
            v110 = *v4;
            v111 = *(_QWORD *)((char *)a3 + v110);
            v112 = v111 + 1;
            if (v111 == -1 || v112 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v113 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v111);
              *(_QWORD *)((char *)a3 + v110) = v112;
              v66 |= (unint64_t)(v113 & 0x7F) << v108;
              if (v113 < 0)
              {
                v108 += 7;
                v16 = v109++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_380;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_380:
          v266 = 104;
          goto LABEL_457;
        case 0x1Du:
          v114 = 0;
          v115 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x40uLL;
          while (2)
          {
            v116 = *v4;
            v117 = *(_QWORD *)((char *)a3 + v116);
            v118 = v117 + 1;
            if (v117 == -1 || v118 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v119 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v117);
              *(_QWORD *)((char *)a3 + v116) = v118;
              v66 |= (unint64_t)(v119 & 0x7F) << v114;
              if (v119 < 0)
              {
                v114 += 7;
                v16 = v115++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_384;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_384:
          v266 = 56;
          goto LABEL_457;
        case 0x1Eu:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 320;
          goto LABEL_276;
        case 0x1Fu:
          v120 = 0;
          v121 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 4uLL;
          while (2)
          {
            v122 = *v4;
            v123 = *(_QWORD *)((char *)a3 + v122);
            v124 = v123 + 1;
            if (v123 == -1 || v124 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v125 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v123);
              *(_QWORD *)((char *)a3 + v122) = v124;
              v66 |= (unint64_t)(v125 & 0x7F) << v120;
              if (v125 < 0)
              {
                v120 += 7;
                v16 = v121++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_388;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_388:
          v266 = 24;
          goto LABEL_457;
        case 0x20u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 288;
          goto LABEL_276;
        case 0x21u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 424;
          goto LABEL_276;
        case 0x22u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 432;
          goto LABEL_276;
        case 0x23u:
          v126 = 0;
          v127 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x10000uLL;
          while (2)
          {
            v128 = *v4;
            v129 = *(_QWORD *)((char *)a3 + v128);
            v130 = v129 + 1;
            if (v129 == -1 || v130 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v131 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v129);
              *(_QWORD *)((char *)a3 + v128) = v130;
              v66 |= (unint64_t)(v131 & 0x7F) << v126;
              if (v131 < 0)
              {
                v126 += 7;
                v16 = v127++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_392;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_392:
          v266 = 136;
          goto LABEL_457;
        case 0x24u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 208;
          goto LABEL_276;
        case 0x25u:
          v132 = 0;
          v133 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 2uLL;
          while (2)
          {
            v134 = *v4;
            v135 = *(_QWORD *)((char *)a3 + v134);
            v136 = v135 + 1;
            if (v135 == -1 || v136 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v137 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v135);
              *(_QWORD *)((char *)a3 + v134) = v136;
              v66 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                v16 = v133++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_396;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_396:
          v266 = 16;
          goto LABEL_457;
        case 0x26u:
          v138 = 0;
          v139 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x40000000uLL;
          while (2)
          {
            v140 = *v4;
            v141 = *(_QWORD *)((char *)a3 + v140);
            v142 = v141 + 1;
            if (v141 == -1 || v142 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v143 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v141);
              *(_QWORD *)((char *)a3 + v140) = v142;
              v23 |= (unint64_t)(v143 & 0x7F) << v138;
              if (v143 < 0)
              {
                v138 += 7;
                v16 = v139++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_400;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_400:
          v263 = 384;
          goto LABEL_475;
        case 0x27u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 200;
          goto LABEL_276;
        case 0x28u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 360;
          goto LABEL_276;
        case 0x29u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 400;
          goto LABEL_276;
        case 0x2Au:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 408;
          goto LABEL_276;
        case 0x2Bu:
          v144 = 0;
          v145 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 8uLL;
          while (2)
          {
            v146 = *v4;
            v147 = *(_QWORD *)((char *)a3 + v146);
            v148 = v147 + 1;
            if (v147 == -1 || v148 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v149 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v147);
              *(_QWORD *)((char *)a3 + v146) = v148;
              v66 |= (unint64_t)(v149 & 0x7F) << v144;
              if (v149 < 0)
              {
                v144 += 7;
                v16 = v145++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_404;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_404:
          v266 = 32;
          goto LABEL_457;
        case 0x2Cu:
          v150 = 0;
          v151 = 0;
          v152 = 0;
          *(_QWORD *)&self->_has |= 0x1000000000uLL;
          while (2)
          {
            v153 = *v4;
            v154 = *(_QWORD *)((char *)a3 + v153);
            v155 = v154 + 1;
            if (v154 == -1 || v155 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v156 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v154);
              *(_QWORD *)((char *)a3 + v153) = v155;
              v152 |= (unint64_t)(v156 & 0x7F) << v150;
              if (v156 < 0)
              {
                v150 += 7;
                v16 = v151++ >= 9;
                if (v16)
                {
                  v152 = 0;
                  goto LABEL_408;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v152 = 0;
LABEL_408:
          v264 = v152 != 0;
          v265 = 493;
          goto LABEL_470;
        case 0x2Du:
          v157 = 0;
          v158 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x80000uLL;
          while (2)
          {
            v159 = *v4;
            v160 = *(_QWORD *)((char *)a3 + v159);
            v161 = v160 + 1;
            if (v160 == -1 || v161 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v162 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v160);
              *(_QWORD *)((char *)a3 + v159) = v161;
              v66 |= (unint64_t)(v162 & 0x7F) << v157;
              if (v162 < 0)
              {
                v157 += 7;
                v16 = v158++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_412;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_412:
          v266 = 160;
          goto LABEL_457;
        case 0x2Eu:
          v163 = 0;
          v164 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x100000uLL;
          while (2)
          {
            v165 = *v4;
            v166 = *(_QWORD *)((char *)a3 + v165);
            v167 = v166 + 1;
            if (v166 == -1 || v167 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v168 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v166);
              *(_QWORD *)((char *)a3 + v165) = v167;
              v66 |= (unint64_t)(v168 & 0x7F) << v163;
              if (v168 < 0)
              {
                v163 += 7;
                v16 = v164++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_416;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_416:
          v266 = 168;
          goto LABEL_457;
        case 0x2Fu:
          v169 = objc_alloc_init(ICPAPlayActivityEnqueuerProperties);
          objc_storeStrong((id *)&self->_enqueuerProperties, v169);
          if (!PBReaderPlaceMark()
            || (ICPAPlayActivityEnqueuerPropertiesReadFrom((uint64_t)v169, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_491;
          }
          goto LABEL_273;
        case 0x30u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 296;
          goto LABEL_276;
        case 0x31u:
          v170 = 0;
          v171 = 0;
          v172 = 0;
          *(_QWORD *)&self->_has |= 0x8000000000uLL;
          while (2)
          {
            v173 = *v4;
            v174 = *(_QWORD *)((char *)a3 + v173);
            v175 = v174 + 1;
            if (v174 == -1 || v175 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v176 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v174);
              *(_QWORD *)((char *)a3 + v173) = v175;
              v172 |= (unint64_t)(v176 & 0x7F) << v170;
              if (v176 < 0)
              {
                v170 += 7;
                v16 = v171++ >= 9;
                if (v16)
                {
                  v172 = 0;
                  goto LABEL_420;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v172 = 0;
LABEL_420:
          v264 = v172 != 0;
          v265 = 496;
          goto LABEL_470;
        case 0x32u:
          v177 = 0;
          v178 = 0;
          v179 = 0;
          *(_QWORD *)&self->_has |= 0x20000000000uLL;
          while (2)
          {
            v180 = *v4;
            v181 = *(_QWORD *)((char *)a3 + v180);
            v182 = v181 + 1;
            if (v181 == -1 || v182 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v183 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v181);
              *(_QWORD *)((char *)a3 + v180) = v182;
              v179 |= (unint64_t)(v183 & 0x7F) << v177;
              if (v183 < 0)
              {
                v177 += 7;
                v16 = v178++ >= 9;
                if (v16)
                {
                  v179 = 0;
                  goto LABEL_424;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v179 = 0;
LABEL_424:
          v264 = v179 != 0;
          v265 = 498;
          goto LABEL_470;
        case 0x33u:
          v184 = 0;
          v185 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x200000000uLL;
          while (2)
          {
            v186 = *v4;
            v187 = *(_QWORD *)((char *)a3 + v186);
            v188 = v187 + 1;
            if (v187 == -1 || v188 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v189 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v187);
              *(_QWORD *)((char *)a3 + v186) = v188;
              v23 |= (unint64_t)(v189 & 0x7F) << v184;
              if (v189 < 0)
              {
                v184 += 7;
                v16 = v185++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_428;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_428:
          v263 = 456;
          goto LABEL_475;
        case 0x34u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 256;
          goto LABEL_276;
        case 0x3Du:
          v191 = 0;
          v192 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x1000000uLL;
          while (2)
          {
            v193 = *v4;
            v194 = *(_QWORD *)((char *)a3 + v193);
            v195 = v194 + 1;
            if (v194 == -1 || v195 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v196 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v194);
              *(_QWORD *)((char *)a3 + v193) = v195;
              v23 |= (unint64_t)(v196 & 0x7F) << v191;
              if (v196 < 0)
              {
                v191 += 7;
                v16 = v192++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_432;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_432:
          v263 = 240;
          goto LABEL_475;
        case 0x56u:
          v197 = 0;
          v198 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 1uLL;
          while (2)
          {
            v199 = *v4;
            v200 = *(_QWORD *)((char *)a3 + v199);
            v201 = v200 + 1;
            if (v200 == -1 || v201 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v202 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v200);
              *(_QWORD *)((char *)a3 + v199) = v201;
              v66 |= (unint64_t)(v202 & 0x7F) << v197;
              if (v202 < 0)
              {
                v197 += 7;
                v16 = v198++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_436;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_436:
          v266 = 8;
          goto LABEL_457;
        case 0x57u:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 312;
          goto LABEL_276;
        case 0x58u:
          PBReaderReadString();
          v169 = (ICPAPlayActivityEnqueuerProperties *)objc_claimAutoreleasedReturnValue();
          if (v169)
            -[ICPAPlayActivityEvent addBuildFeatures:]((uint64_t)self, v169);
          goto LABEL_274;
        case 0x59u:
          v169 = objc_alloc_init(ICPAPlayModeDictionary);
          objc_storeStrong((id *)&self->_playMode, v169);
          if (!PBReaderPlaceMark() || !ICPAPlayModeDictionaryReadFrom((uint64_t)v169, (uint64_t)a3))
            goto LABEL_491;
          goto LABEL_273;
        case 0x5Au:
          v203 = 0;
          v204 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x400000uLL;
          while (2)
          {
            v205 = *v4;
            v206 = *(_QWORD *)((char *)a3 + v205);
            v207 = v206 + 1;
            if (v206 == -1 || v207 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v208 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v206);
              *(_QWORD *)((char *)a3 + v205) = v207;
              v23 |= (unint64_t)(v208 & 0x7F) << v203;
              if (v208 < 0)
              {
                v203 += 7;
                v16 = v204++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_440;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_440:
          v263 = 184;
          goto LABEL_475;
        case 0x5Bu:
          v209 = 0;
          v210 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x20000000uLL;
          while (2)
          {
            v211 = *v4;
            v212 = *(_QWORD *)((char *)a3 + v211);
            v213 = v212 + 1;
            if (v212 == -1 || v213 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v214 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v212);
              *(_QWORD *)((char *)a3 + v211) = v213;
              v23 |= (unint64_t)(v214 & 0x7F) << v209;
              if (v214 < 0)
              {
                v209 += 7;
                v16 = v210++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_444;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_444:
          v263 = 352;
          goto LABEL_475;
        case 0x5Cu:
          v169 = objc_alloc_init(ICPAAudioQualityDictionary);
          v215 = 464;
          goto LABEL_271;
        case 0x5Du:
          v169 = objc_alloc_init(ICPAAudioQualityDictionary);
          v215 = 368;
LABEL_271:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v215), v169);
          if (!PBReaderPlaceMark()
            || (ICPAAudioQualityDictionaryReadFrom((uint64_t)v169, (uint64_t)a3) & 1) == 0)
          {
LABEL_491:

            LOBYTE(v190) = 0;
            return v190;
          }
LABEL_273:
          PBReaderRecallMark();
LABEL_274:

LABEL_489:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_490;
          break;
        case 0x5Eu:
          PBReaderReadString();
          v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v20 = 376;
LABEL_276:
          v216 = *(Class *)((char *)&self->super.super.isa + v20);
          *(Class *)((char *)&self->super.super.isa + v20) = v19;

          goto LABEL_489;
        case 0x5Fu:
          v217 = 0;
          v218 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x2000uLL;
          while (2)
          {
            v219 = *v4;
            v220 = *(_QWORD *)((char *)a3 + v219);
            v221 = v220 + 1;
            if (v220 == -1 || v221 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v222 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v220);
              *(_QWORD *)((char *)a3 + v219) = v221;
              v66 |= (unint64_t)(v222 & 0x7F) << v217;
              if (v222 < 0)
              {
                v217 += 7;
                v16 = v218++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_448;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_448:
          v266 = 112;
          goto LABEL_457;
        case 0x60u:
          v223 = 0;
          v224 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x4000uLL;
          while (2)
          {
            v225 = *v4;
            v226 = *(_QWORD *)((char *)a3 + v225);
            v227 = v226 + 1;
            if (v226 == -1 || v227 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v228 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v226);
              *(_QWORD *)((char *)a3 + v225) = v227;
              v66 |= (unint64_t)(v228 & 0x7F) << v223;
              if (v228 < 0)
              {
                v223 += 7;
                v16 = v224++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_452;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_452:
          v266 = 120;
          goto LABEL_457;
        case 0x61u:
          v229 = 0;
          v230 = 0;
          v66 = 0;
          *(_QWORD *)&self->_has |= 0x8000uLL;
          while (2)
          {
            v231 = *v4;
            v232 = *(_QWORD *)((char *)a3 + v231);
            v233 = v232 + 1;
            if (v232 == -1 || v233 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v234 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v232);
              *(_QWORD *)((char *)a3 + v231) = v233;
              v66 |= (unint64_t)(v234 & 0x7F) << v229;
              if (v234 < 0)
              {
                v229 += 7;
                v16 = v230++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_456;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v66 = 0;
LABEL_456:
          v266 = 128;
LABEL_457:
          *(Class *)((char *)&self->super.super.isa + v266) = (Class)v66;
          goto LABEL_489;
        case 0x62u:
          v235 = 0;
          v236 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x400000000uLL;
          while (2)
          {
            v237 = *v4;
            v238 = *(_QWORD *)((char *)a3 + v237);
            v239 = v238 + 1;
            if (v238 == -1 || v239 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v240 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v238);
              *(_QWORD *)((char *)a3 + v237) = v239;
              v23 |= (unint64_t)(v240 & 0x7F) << v235;
              if (v240 < 0)
              {
                v235 += 7;
                v16 = v236++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_461:
          v263 = 488;
          goto LABEL_475;
        case 0x63u:
          *(_QWORD *)&self->_has |= 0x200000uLL;
          v241 = *v4;
          v242 = *(_QWORD *)((char *)a3 + v241);
          if (v242 <= 0xFFFFFFFFFFFFFFF7 && v242 + 8 <= *(_QWORD *)((char *)a3 + *v5))
          {
            v36 = *(objc_class **)(*(_QWORD *)((char *)a3 + *v8) + v242);
            *(_QWORD *)((char *)a3 + v241) = v242 + 8;
          }
          else
          {
            *((_BYTE *)a3 + *v6) = 1;
            v36 = 0;
          }
          v267 = 176;
LABEL_488:
          *(Class *)((char *)&self->super.super.isa + v267) = v36;
          goto LABEL_489;
        case 0x64u:
          v243 = 0;
          v244 = 0;
          v245 = 0;
          *(_QWORD *)&self->_has |= 0x800000000uLL;
          while (2)
          {
            v246 = *v4;
            v247 = *(_QWORD *)((char *)a3 + v246);
            v248 = v247 + 1;
            if (v247 == -1 || v248 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v249 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v247);
              *(_QWORD *)((char *)a3 + v246) = v248;
              v245 |= (unint64_t)(v249 & 0x7F) << v243;
              if (v249 < 0)
              {
                v243 += 7;
                v16 = v244++ >= 9;
                if (v16)
                {
                  v245 = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v245 = 0;
LABEL_465:
          v264 = v245 != 0;
          v265 = 492;
          goto LABEL_470;
        case 0x65u:
          v250 = 0;
          v251 = 0;
          v252 = 0;
          *(_QWORD *)&self->_has |= 0x2000000000uLL;
          while (2)
          {
            v253 = *v4;
            v254 = *(_QWORD *)((char *)a3 + v253);
            v255 = v254 + 1;
            if (v254 == -1 || v255 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v256 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v254);
              *(_QWORD *)((char *)a3 + v253) = v255;
              v252 |= (unint64_t)(v256 & 0x7F) << v250;
              if (v256 < 0)
              {
                v250 += 7;
                v16 = v251++ >= 9;
                if (v16)
                {
                  v252 = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v252 = 0;
LABEL_469:
          v264 = v252 != 0;
          v265 = 494;
LABEL_470:
          *((_BYTE *)&self->super.super.isa + v265) = v264;
          goto LABEL_489;
        case 0x66u:
          v257 = 0;
          v258 = 0;
          v23 = 0;
          *(_QWORD *)&self->_has |= 0x80000000uLL;
          while (2)
          {
            v259 = *v4;
            v260 = *(_QWORD *)((char *)a3 + v259);
            v261 = v260 + 1;
            if (v260 == -1 || v261 > *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v262 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v260);
              *(_QWORD *)((char *)a3 + v259) = v261;
              v23 |= (unint64_t)(v262 & 0x7F) << v257;
              if (v262 < 0)
              {
                v257 += 7;
                v16 = v258++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_474:
          v263 = 416;
LABEL_475:
          *(_DWORD *)((char *)&self->super.super.isa + v263) = v23;
          goto LABEL_489;
        default:
          v190 = PBReaderSkipValueWithTag();
          if (!v190)
            return v190;
          goto LABEL_489;
      }
    }
  }
LABEL_490:
  LOBYTE(v190) = *((_BYTE *)a3 + *v6) == 0;
  return v190;
}

- (void)writeTo:(id)a3
{
  id v4;
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  $1C24819EE6FCB6BF7661081CD3A68180 v6;
  $1C24819EE6FCB6BF7661081CD3A68180 v7;
  $1C24819EE6FCB6BF7661081CD3A68180 v8;
  $1C24819EE6FCB6BF7661081CD3A68180 v9;
  $1C24819EE6FCB6BF7661081CD3A68180 v10;
  $1C24819EE6FCB6BF7661081CD3A68180 v11;
  $1C24819EE6FCB6BF7661081CD3A68180 v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  $1C24819EE6FCB6BF7661081CD3A68180 v18;
  $1C24819EE6FCB6BF7661081CD3A68180 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_containerID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
LABEL_10:
    PBDataWriterWriteDoubleField();
LABEL_11:
  if (self->_externalID)
    PBDataWriterWriteStringField();
  if (self->_featureName)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_126;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_19;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_20;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
      goto LABEL_21;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x4000000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_129:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
LABEL_22:
    PBDataWriterWriteInt64Field();
LABEL_23:
  if (self->_personalizedContainerID)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_has;
    if ((*(_QWORD *)&v7 & 0x100000000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v7 & 0x20000) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x100000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
LABEL_28:
    PBDataWriterWriteUint64Field();
LABEL_29:
  if (self->_storeID)
    PBDataWriterWriteStringField();
  if (self->_timedMetadata)
    PBDataWriterWriteDataField();
  if (self->_trackInfo)
    PBDataWriterWriteDataField();
  if (self->_recommendationData)
    PBDataWriterWriteDataField();
  if (self->_storeFrontID)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0)
        goto LABEL_42;
      goto LABEL_136;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_43;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_137:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
LABEL_44:
    PBDataWriterWriteUint64Field();
LABEL_45:
  if (self->_lyricsID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_globalPlaylistID)
    PBDataWriterWriteStringField();
  if (self->_stationHash)
    PBDataWriterWriteStringField();
  if (self->_stationStringID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_cloudAlbumID)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_buildVersion)
    PBDataWriterWriteStringField();
  if (self->_playlistVersionHash)
    PBDataWriterWriteStringField();
  if (self->_requestingBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_requestingBundleVersion)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x1000000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x80000) == 0)
        goto LABEL_74;
      goto LABEL_141;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x1000000000) == 0)
  {
    goto LABEL_73;
  }
  PBDataWriterWriteBOOLField();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
LABEL_75:
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_enqueuerProperties)
    PBDataWriterWriteSubmessage();
  if (self->_householdID)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_QWORD *)&v11 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_has;
    if ((*(_QWORD *)&v11 & 0x20000000000) == 0)
    {
LABEL_82:
      if ((*(_QWORD *)&v11 & 0x200000000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_QWORD *)&v11 & 0x20000000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
LABEL_83:
    PBDataWriterWriteInt32Field();
LABEL_84:
  if (self->_eventTimeZoneName)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
  }
  if ((*(_BYTE *)&v12 & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_lyricLanguage)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_buildFeatures;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  if (self->_playMode)
    PBDataWriterWriteSubmessage();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x20000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_targetedAudioQuality)
    PBDataWriterWriteSubmessage();
  if (self->_providedAudioQuality)
    PBDataWriterWriteSubmessage();
  if (self->_queueGroupingID)
    PBDataWriterWriteStringField();
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x4000) == 0)
    {
LABEL_113:
      if ((*(_WORD *)&v19 & 0x8000) == 0)
        goto LABEL_114;
      goto LABEL_148;
    }
  }
  else if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
    goto LABEL_113;
  }
  PBDataWriterWriteInt64Field();
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) == 0)
  {
LABEL_114:
    if ((*(_QWORD *)&v19 & 0x400000000) == 0)
      goto LABEL_115;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt64Field();
  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x400000000) == 0)
  {
LABEL_115:
    if ((*(_DWORD *)&v19 & 0x200000) == 0)
      goto LABEL_116;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteInt32Field();
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x200000) == 0)
  {
LABEL_116:
    if ((*(_QWORD *)&v19 & 0x800000000) == 0)
      goto LABEL_117;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x800000000) == 0)
  {
LABEL_117:
    if ((*(_QWORD *)&v19 & 0x2000000000) == 0)
      goto LABEL_118;
LABEL_152:
    PBDataWriterWriteBOOLField();
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_120;
    goto LABEL_119;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x2000000000) != 0)
    goto LABEL_152;
LABEL_118:
  if ((*(_DWORD *)&v19 & 0x80000000) != 0)
LABEL_119:
    PBDataWriterWriteInt32Field();
LABEL_120:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  $1C24819EE6FCB6BF7661081CD3A68180 v15;
  uint64_t v16;
  void *v17;
  $1C24819EE6FCB6BF7661081CD3A68180 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  $1C24819EE6FCB6BF7661081CD3A68180 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $1C24819EE6FCB6BF7661081CD3A68180 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  $1C24819EE6FCB6BF7661081CD3A68180 v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  $1C24819EE6FCB6BF7661081CD3A68180 v54;
  uint64_t v55;
  void *v56;
  $1C24819EE6FCB6BF7661081CD3A68180 v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  $1C24819EE6FCB6BF7661081CD3A68180 v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  $1C24819EE6FCB6BF7661081CD3A68180 v75;
  id v76;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_containerID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v6;

  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_containerType;
    *(_QWORD *)(v5 + 500) |= 0x800000uLL;
  }
  v8 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v8;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_endReasonType;
    *(_QWORD *)(v5 + 500) |= 0x2000000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 40) = self->_eventDateTimestamp;
  *(_QWORD *)(v5 + 500) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(double *)(v5 + 48) = self->_eventSecondsFromGMT;
    *(_QWORD *)(v5 + 500) |= 0x20uLL;
  }
LABEL_7:
  v11 = -[NSString copyWithZone:](self->_externalID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v11;

  v13 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v13;

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_itemDuration;
    *(_QWORD *)(v5 + 500) |= 0x80uLL;
    v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x100) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v15 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v15 & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 72) = self->_itemEndTime;
  *(_QWORD *)(v5 + 500) |= 0x100uLL;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&v15 & 0x8000000) == 0)
      goto LABEL_11;
    goto LABEL_73;
  }
LABEL_72:
  *(double *)(v5 + 80) = self->_itemStartTime;
  *(_QWORD *)(v5 + 500) |= 0x200uLL;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v15 & 0x10000000) == 0)
      goto LABEL_12;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 304) = self->_itemType;
  *(_QWORD *)(v5 + 500) |= 0x8000000uLL;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&v15 & 0x4000000000) == 0)
      goto LABEL_13;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 328) = self->_mediaType;
  *(_QWORD *)(v5 + 500) |= 0x10000000uLL;
  v15 = self->_has;
  if ((*(_QWORD *)&v15 & 0x4000000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_75:
  *(_BYTE *)(v5 + 495) = self->_offline;
  *(_QWORD *)(v5 + 500) |= 0x4000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    *(_QWORD *)(v5 + 88) = self->_persistentID;
    *(_QWORD *)(v5 + 500) |= 0x400uLL;
  }
LABEL_15:
  v16 = -[NSString copyWithZone:](self->_personalizedContainerID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v16;

  v18 = self->_has;
  if ((*(_QWORD *)&v18 & 0x10000000000) != 0)
  {
    *(_BYTE *)(v5 + 497) = self->_sBEnabled;
    *(_QWORD *)(v5 + 500) |= 0x10000000000uLL;
    v18 = self->_has;
    if ((*(_QWORD *)&v18 & 0x100000000) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v18 & 0x20000) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_QWORD *)&v18 & 0x100000000) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 420) = self->_sourceType;
  *(_QWORD *)(v5 + 500) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_18:
    *(_QWORD *)(v5 + 144) = self->_storeAccountID;
    *(_QWORD *)(v5 + 500) |= 0x20000uLL;
  }
LABEL_19:
  v19 = -[NSString copyWithZone:](self->_storeID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v19;

  v21 = -[NSData copyWithZone:](self->_timedMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 472);
  *(_QWORD *)(v5 + 472) = v21;

  v23 = -[NSData copyWithZone:](self->_trackInfo, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 480);
  *(_QWORD *)(v5 + 480) = v23;

  v25 = -[NSData copyWithZone:](self->_recommendationData, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v25;

  v27 = -[NSString copyWithZone:](self->_storeFrontID, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v27;

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_eventType;
    *(_QWORD *)(v5 + 500) |= 0x4000000uLL;
    v29 = self->_has;
    if ((*(_DWORD *)&v29 & 0x40000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v29 & 0x800) == 0)
        goto LABEL_22;
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)&v29 & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  *(_QWORD *)(v5 + 152) = self->_subscriptionAdamID;
  *(_QWORD *)(v5 + 500) |= 0x40000uLL;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v29 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_83;
  }
LABEL_82:
  *(_QWORD *)(v5 + 96) = self->_purchasedAdamID;
  *(_QWORD *)(v5 + 500) |= 0x800uLL;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v29 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_83:
  *(_QWORD *)(v5 + 104) = self->_radioAdamID;
  *(_QWORD *)(v5 + 500) |= 0x1000uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *(_QWORD *)(v5 + 56) = self->_itemCloudID;
    *(_QWORD *)(v5 + 500) |= 0x40uLL;
  }
LABEL_25:
  v30 = -[NSString copyWithZone:](self->_lyricsID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v30;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_containerAdamID;
    *(_QWORD *)(v5 + 500) |= 4uLL;
  }
  v32 = -[NSString copyWithZone:](self->_globalPlaylistID, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v32;

  v34 = -[NSString copyWithZone:](self->_stationHash, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v34;

  v36 = -[NSString copyWithZone:](self->_stationStringID, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v36;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_QWORD *)(v5 + 136) = self->_stationID;
    *(_QWORD *)(v5 + 500) |= 0x10000uLL;
  }
  v38 = -[NSString copyWithZone:](self->_cloudAlbumID, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v38;

  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_cloudPlaylistID;
    *(_QWORD *)(v5 + 500) |= 2uLL;
    v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x40000000) != 0)
  {
    *(_DWORD *)(v5 + 384) = self->_reasonHintType;
    *(_QWORD *)(v5 + 500) |= 0x40000000uLL;
  }
  v41 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v41;

  v43 = -[NSString copyWithZone:](self->_playlistVersionHash, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v43;

  v45 = -[NSString copyWithZone:](self->_requestingBundleIdentifier, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v45;

  v47 = -[NSString copyWithZone:](self->_requestingBundleVersion, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v47;

  v49 = self->_has;
  if ((*(_BYTE *)&v49 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_equivalencySourceAdamID;
    *(_QWORD *)(v5 + 500) |= 8uLL;
    v49 = self->_has;
    if ((*(_QWORD *)&v49 & 0x1000000000) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v49 & 0x80000) == 0)
        goto LABEL_36;
      goto LABEL_87;
    }
  }
  else if ((*(_QWORD *)&v49 & 0x1000000000) == 0)
  {
    goto LABEL_35;
  }
  *(_BYTE *)(v5 + 493) = self->_internalBuild;
  *(_QWORD *)(v5 + 500) |= 0x1000000000uLL;
  v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v49 & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_87:
  *(_QWORD *)(v5 + 160) = self->_tvShowPurchasedAdamID;
  *(_QWORD *)(v5 + 500) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_37:
    *(_QWORD *)(v5 + 168) = self->_tvShowSubscriptionAdamID;
    *(_QWORD *)(v5 + 500) |= 0x100000uLL;
  }
LABEL_38:
  v50 = -[ICPAPlayActivityEnqueuerProperties copyWithZone:](self->_enqueuerProperties, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v50;

  v52 = -[NSString copyWithZone:](self->_householdID, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v52;

  v54 = self->_has;
  if ((*(_QWORD *)&v54 & 0x8000000000) != 0)
  {
    *(_BYTE *)(v5 + 496) = self->_privateListeningEnabled;
    *(_QWORD *)(v5 + 500) |= 0x8000000000uLL;
    v54 = self->_has;
    if ((*(_QWORD *)&v54 & 0x20000000000) == 0)
    {
LABEL_40:
      if ((*(_QWORD *)&v54 & 0x200000000) == 0)
        goto LABEL_42;
      goto LABEL_41;
    }
  }
  else if ((*(_QWORD *)&v54 & 0x20000000000) == 0)
  {
    goto LABEL_40;
  }
  *(_BYTE *)(v5 + 498) = self->_siriInitiated;
  *(_QWORD *)(v5 + 500) |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 456) = self->_systemReleaseType;
    *(_QWORD *)(v5 + 500) |= 0x200000000uLL;
  }
LABEL_42:
  v55 = -[NSString copyWithZone:](self->_eventTimeZoneName, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v55;

  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_displayType;
    *(_QWORD *)(v5 + 500) |= 0x1000000uLL;
    v57 = self->_has;
  }
  if ((*(_BYTE *)&v57 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_characterDisplayedCount;
    *(_QWORD *)(v5 + 500) |= 1uLL;
  }
  v58 = -[NSString copyWithZone:](self->_lyricLanguage, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v58;

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v60 = self->_buildFeatures;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v79;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v79 != v63)
          objc_enumerationMutation(v60);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v64), "copyWithZone:", a3, (_QWORD)v78);
        -[ICPAPlayActivityEvent addBuildFeatures:](v5, v65);

        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    }
    while (v62);
  }

  v66 = -[ICPAPlayModeDictionary copyWithZone:](self->_playMode, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v66;

  v68 = self->_has;
  if ((*(_DWORD *)&v68 & 0x400000) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_audioQualityPreference;
    *(_QWORD *)(v5 + 500) |= 0x400000uLL;
    v68 = self->_has;
  }
  if ((*(_DWORD *)&v68 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 352) = self->_playbackFormatPreference;
    *(_QWORD *)(v5 + 500) |= 0x20000000uLL;
  }
  v69 = -[ICPAAudioQualityDictionary copyWithZone:](self->_targetedAudioQuality, "copyWithZone:", a3, (_QWORD)v78);
  v70 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v69;

  v71 = -[ICPAAudioQualityDictionary copyWithZone:](self->_providedAudioQuality, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v71;

  v73 = -[NSString copyWithZone:](self->_queueGroupingID, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v73;

  v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x2000) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_reportingAdamID;
    *(_QWORD *)(v5 + 500) |= 0x2000uLL;
    v75 = self->_has;
    if ((*(_WORD *)&v75 & 0x4000) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v75 & 0x8000) == 0)
        goto LABEL_60;
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v75 & 0x4000) == 0)
  {
    goto LABEL_59;
  }
  *(_QWORD *)(v5 + 120) = self->_sharedActivityGroupSizeCurrent;
  *(_QWORD *)(v5 + 500) |= 0x4000uLL;
  v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v75 & 0x400000000) == 0)
      goto LABEL_61;
    goto LABEL_95;
  }
LABEL_94:
  *(_QWORD *)(v5 + 128) = self->_sharedActivityGroupSizeMax;
  *(_QWORD *)(v5 + 500) |= 0x8000uLL;
  v75 = self->_has;
  if ((*(_QWORD *)&v75 & 0x400000000) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v75 & 0x200000) == 0)
      goto LABEL_62;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v5 + 488) = self->_vocalAttenuationAvailibility;
  *(_QWORD *)(v5 + 500) |= 0x400000000uLL;
  v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x200000) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v75 & 0x800000000) == 0)
      goto LABEL_63;
    goto LABEL_97;
  }
LABEL_96:
  *(double *)(v5 + 176) = self->_vocalAttenuationDuration;
  *(_QWORD *)(v5 + 500) |= 0x200000uLL;
  v75 = self->_has;
  if ((*(_QWORD *)&v75 & 0x800000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v75 & 0x2000000000) == 0)
      goto LABEL_64;
LABEL_98:
    *(_BYTE *)(v5 + 494) = self->_isCollaborativePlaylist;
    *(_QWORD *)(v5 + 500) |= 0x2000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_97:
  *(_BYTE *)(v5 + 492) = self->_continuityCameraUsed;
  *(_QWORD *)(v5 + 500) |= 0x800000000uLL;
  v75 = self->_has;
  if ((*(_QWORD *)&v75 & 0x2000000000) != 0)
    goto LABEL_98;
LABEL_64:
  if ((*(_DWORD *)&v75 & 0x80000000) != 0)
  {
LABEL_65:
    *(_DWORD *)(v5 + 416) = self->_sharedActivityType;
    *(_QWORD *)(v5 + 500) |= 0x80000000uLL;
  }
LABEL_66:
  v76 = (id)v5;

  return v76;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *containerID;
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  uint64_t v7;
  NSString *deviceName;
  NSString *externalID;
  NSString *featureName;
  $1C24819EE6FCB6BF7661081CD3A68180 v11;
  uint64_t v12;
  NSString *personalizedContainerID;
  NSString *storeID;
  NSData *timedMetadata;
  NSData *trackInfo;
  NSData *recommendationData;
  NSString *storeFrontID;
  $1C24819EE6FCB6BF7661081CD3A68180 v19;
  uint64_t v20;
  NSString *lyricsID;
  NSString *globalPlaylistID;
  NSString *stationHash;
  NSString *stationStringID;
  $1C24819EE6FCB6BF7661081CD3A68180 v25;
  uint64_t v26;
  NSString *cloudAlbumID;
  NSString *buildVersion;
  NSString *playlistVersionHash;
  NSString *requestingBundleIdentifier;
  NSString *requestingBundleVersion;
  $1C24819EE6FCB6BF7661081CD3A68180 v32;
  uint64_t v33;
  ICPAPlayActivityEnqueuerProperties *enqueuerProperties;
  NSString *householdID;
  $1C24819EE6FCB6BF7661081CD3A68180 v36;
  uint64_t v37;
  NSString *eventTimeZoneName;
  NSString *lyricLanguage;
  NSMutableArray *buildFeatures;
  ICPAPlayModeDictionary *playMode;
  $1C24819EE6FCB6BF7661081CD3A68180 v42;
  uint64_t v43;
  ICPAAudioQualityDictionary *targetedAudioQuality;
  ICPAAudioQualityDictionary *providedAudioQuality;
  NSString *queueGroupingID;
  $1C24819EE6FCB6BF7661081CD3A68180 v47;
  uint64_t v48;
  BOOL v49;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_294;
  containerID = self->_containerID;
  if ((unint64_t)containerID | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](containerID, "isEqual:"))
      goto LABEL_294;
  }
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 500);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_containerType != *((_DWORD *)v4 + 56))
      goto LABEL_294;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_294;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_294;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 500);
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_endReasonType != *((_DWORD *)v4 + 61))
      goto LABEL_294;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_eventDateTimestamp != *((double *)v4 + 5))
      goto LABEL_294;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_eventSecondsFromGMT != *((double *)v4 + 6))
      goto LABEL_294;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_294;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((_QWORD *)v4 + 34)
    && !-[NSString isEqual:](externalID, "isEqual:"))
  {
    goto LABEL_294;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:"))
      goto LABEL_294;
  }
  v11 = self->_has;
  v12 = *(_QWORD *)(v4 + 500);
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_itemDuration != *((double *)v4 + 8))
      goto LABEL_294;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_itemEndTime != *((double *)v4 + 9))
      goto LABEL_294;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_itemStartTime != *((double *)v4 + 10))
      goto LABEL_294;
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) == 0 || self->_itemType != *((_DWORD *)v4 + 76))
      goto LABEL_294;
  }
  else if ((v12 & 0x8000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
    if ((v12 & 0x10000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 82))
      goto LABEL_294;
  }
  else if ((v12 & 0x10000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v11 & 0x4000000000) != 0)
  {
    if ((v12 & 0x4000000000) == 0)
      goto LABEL_294;
    if (self->_offline)
    {
      if (!v4[495])
        goto LABEL_294;
    }
    else if (v4[495])
    {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x4000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_persistentID != *((_QWORD *)v4 + 11))
      goto LABEL_294;
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_294;
  }
  personalizedContainerID = self->_personalizedContainerID;
  if ((unint64_t)personalizedContainerID | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](personalizedContainerID, "isEqual:"))
      goto LABEL_294;
    v11 = self->_has;
    v12 = *(_QWORD *)(v4 + 500);
  }
  if ((*(_QWORD *)&v11 & 0x10000000000) != 0)
  {
    if ((v12 & 0x10000000000) == 0)
      goto LABEL_294;
    if (self->_sBEnabled)
    {
      if (!v4[497])
        goto LABEL_294;
    }
    else if (v4[497])
    {
      goto LABEL_294;
    }
  }
  else if ((v12 & 0x10000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v11 & 0x100000000) != 0)
  {
    if ((v12 & 0x100000000) == 0 || self->_sourceType != *((_DWORD *)v4 + 105))
      goto LABEL_294;
  }
  else if ((v12 & 0x100000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_storeAccountID != *((_QWORD *)v4 + 18))
      goto LABEL_294;
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_294;
  }
  storeID = self->_storeID;
  if ((unint64_t)storeID | *((_QWORD *)v4 + 56) && !-[NSString isEqual:](storeID, "isEqual:"))
    goto LABEL_294;
  timedMetadata = self->_timedMetadata;
  if ((unint64_t)timedMetadata | *((_QWORD *)v4 + 59))
  {
    if (!-[NSData isEqual:](timedMetadata, "isEqual:"))
      goto LABEL_294;
  }
  trackInfo = self->_trackInfo;
  if ((unint64_t)trackInfo | *((_QWORD *)v4 + 60))
  {
    if (!-[NSData isEqual:](trackInfo, "isEqual:"))
      goto LABEL_294;
  }
  recommendationData = self->_recommendationData;
  if ((unint64_t)recommendationData | *((_QWORD *)v4 + 49))
  {
    if (!-[NSData isEqual:](recommendationData, "isEqual:"))
      goto LABEL_294;
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((_QWORD *)v4 + 55))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:"))
      goto LABEL_294;
  }
  v19 = self->_has;
  v20 = *(_QWORD *)(v4 + 500);
  if ((*(_DWORD *)&v19 & 0x4000000) != 0)
  {
    if ((v20 & 0x4000000) == 0 || self->_eventType != *((_DWORD *)v4 + 66))
      goto LABEL_294;
  }
  else if ((v20 & 0x4000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    if ((v20 & 0x40000) == 0 || self->_subscriptionAdamID != *((_QWORD *)v4 + 19))
      goto LABEL_294;
  }
  else if ((v20 & 0x40000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0 || self->_purchasedAdamID != *((_QWORD *)v4 + 12))
      goto LABEL_294;
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    if ((v20 & 0x1000) == 0 || self->_radioAdamID != *((_QWORD *)v4 + 13))
      goto LABEL_294;
  }
  else if ((v20 & 0x1000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_itemCloudID != *((_QWORD *)v4 + 7))
      goto LABEL_294;
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_294;
  }
  lyricsID = self->_lyricsID;
  if ((unint64_t)lyricsID | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](lyricsID, "isEqual:"))
      goto LABEL_294;
    v19 = self->_has;
    v20 = *(_QWORD *)(v4 + 500);
  }
  if ((*(_BYTE *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_containerAdamID != *((_QWORD *)v4 + 3))
      goto LABEL_294;
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_294;
  }
  globalPlaylistID = self->_globalPlaylistID;
  if ((unint64_t)globalPlaylistID | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](globalPlaylistID, "isEqual:"))
  {
    goto LABEL_294;
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((_QWORD *)v4 + 53))
  {
    if (!-[NSString isEqual:](stationHash, "isEqual:"))
      goto LABEL_294;
  }
  stationStringID = self->_stationStringID;
  if ((unint64_t)stationStringID | *((_QWORD *)v4 + 54))
  {
    if (!-[NSString isEqual:](stationStringID, "isEqual:"))
      goto LABEL_294;
  }
  v25 = self->_has;
  v26 = *(_QWORD *)(v4 + 500);
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0 || self->_stationID != *((_QWORD *)v4 + 17))
      goto LABEL_294;
  }
  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_294;
  }
  cloudAlbumID = self->_cloudAlbumID;
  if ((unint64_t)cloudAlbumID | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](cloudAlbumID, "isEqual:"))
      goto LABEL_294;
    v25 = self->_has;
    v26 = *(_QWORD *)(v4 + 500);
  }
  if ((*(_BYTE *)&v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_cloudPlaylistID != *((_QWORD *)v4 + 2))
      goto LABEL_294;
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v25 & 0x40000000) != 0)
  {
    if ((v26 & 0x40000000) == 0 || self->_reasonHintType != *((_DWORD *)v4 + 96))
      goto LABEL_294;
  }
  else if ((v26 & 0x40000000) != 0)
  {
    goto LABEL_294;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](buildVersion, "isEqual:"))
  {
    goto LABEL_294;
  }
  playlistVersionHash = self->_playlistVersionHash;
  if ((unint64_t)playlistVersionHash | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](playlistVersionHash, "isEqual:"))
      goto LABEL_294;
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if ((unint64_t)requestingBundleIdentifier | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](requestingBundleIdentifier, "isEqual:"))
      goto LABEL_294;
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if ((unint64_t)requestingBundleVersion | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](requestingBundleVersion, "isEqual:"))
      goto LABEL_294;
  }
  v32 = self->_has;
  v33 = *(_QWORD *)(v4 + 500);
  if ((*(_BYTE *)&v32 & 8) != 0)
  {
    if ((v33 & 8) == 0 || self->_equivalencySourceAdamID != *((_QWORD *)v4 + 4))
      goto LABEL_294;
  }
  else if ((v33 & 8) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v32 & 0x1000000000) != 0)
  {
    if ((v33 & 0x1000000000) == 0)
      goto LABEL_294;
    if (self->_internalBuild)
    {
      if (!v4[493])
        goto LABEL_294;
    }
    else if (v4[493])
    {
      goto LABEL_294;
    }
  }
  else if ((v33 & 0x1000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v32 & 0x80000) != 0)
  {
    if ((v33 & 0x80000) == 0 || self->_tvShowPurchasedAdamID != *((_QWORD *)v4 + 20))
      goto LABEL_294;
  }
  else if ((v33 & 0x80000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v32 & 0x100000) != 0)
  {
    if ((v33 & 0x100000) == 0 || self->_tvShowSubscriptionAdamID != *((_QWORD *)v4 + 21))
      goto LABEL_294;
  }
  else if ((v33 & 0x100000) != 0)
  {
    goto LABEL_294;
  }
  enqueuerProperties = self->_enqueuerProperties;
  if ((unint64_t)enqueuerProperties | *((_QWORD *)v4 + 31)
    && !-[ICPAPlayActivityEnqueuerProperties isEqual:](enqueuerProperties, "isEqual:"))
  {
    goto LABEL_294;
  }
  householdID = self->_householdID;
  if ((unint64_t)householdID | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](householdID, "isEqual:"))
      goto LABEL_294;
  }
  v36 = self->_has;
  v37 = *(_QWORD *)(v4 + 500);
  if ((*(_QWORD *)&v36 & 0x8000000000) != 0)
  {
    if ((v37 & 0x8000000000) == 0)
      goto LABEL_294;
    if (self->_privateListeningEnabled)
    {
      if (!v4[496])
        goto LABEL_294;
    }
    else if (v4[496])
    {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x8000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v36 & 0x20000000000) != 0)
  {
    if ((v37 & 0x20000000000) == 0)
      goto LABEL_294;
    if (self->_siriInitiated)
    {
      if (!v4[498])
        goto LABEL_294;
    }
    else if (v4[498])
    {
      goto LABEL_294;
    }
  }
  else if ((v37 & 0x20000000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v36 & 0x200000000) != 0)
  {
    if ((v37 & 0x200000000) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 114))
      goto LABEL_294;
  }
  else if ((v37 & 0x200000000) != 0)
  {
    goto LABEL_294;
  }
  eventTimeZoneName = self->_eventTimeZoneName;
  if ((unint64_t)eventTimeZoneName | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](eventTimeZoneName, "isEqual:"))
      goto LABEL_294;
    v36 = self->_has;
    v37 = *(_QWORD *)(v4 + 500);
  }
  if ((*(_DWORD *)&v36 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0 || self->_displayType != *((_DWORD *)v4 + 60))
      goto LABEL_294;
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_BYTE *)&v36 & 1) != 0)
  {
    if ((v37 & 1) == 0 || self->_characterDisplayedCount != *((_QWORD *)v4 + 1))
      goto LABEL_294;
  }
  else if ((v37 & 1) != 0)
  {
    goto LABEL_294;
  }
  lyricLanguage = self->_lyricLanguage;
  if ((unint64_t)lyricLanguage | *((_QWORD *)v4 + 39)
    && !-[NSString isEqual:](lyricLanguage, "isEqual:"))
  {
    goto LABEL_294;
  }
  buildFeatures = self->_buildFeatures;
  if ((unint64_t)buildFeatures | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](buildFeatures, "isEqual:"))
      goto LABEL_294;
  }
  playMode = self->_playMode;
  if ((unint64_t)playMode | *((_QWORD *)v4 + 43))
  {
    if (!-[ICPAPlayModeDictionary isEqual:](playMode, "isEqual:"))
      goto LABEL_294;
  }
  v42 = self->_has;
  v43 = *(_QWORD *)(v4 + 500);
  if ((*(_DWORD *)&v42 & 0x400000) != 0)
  {
    if ((v43 & 0x400000) == 0 || self->_audioQualityPreference != *((_DWORD *)v4 + 46))
      goto LABEL_294;
  }
  else if ((v43 & 0x400000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v42 & 0x20000000) != 0)
  {
    if ((v43 & 0x20000000) == 0 || self->_playbackFormatPreference != *((_DWORD *)v4 + 88))
      goto LABEL_294;
  }
  else if ((v43 & 0x20000000) != 0)
  {
    goto LABEL_294;
  }
  targetedAudioQuality = self->_targetedAudioQuality;
  if ((unint64_t)targetedAudioQuality | *((_QWORD *)v4 + 58)
    && !-[ICPAAudioQualityDictionary isEqual:](targetedAudioQuality, "isEqual:"))
  {
    goto LABEL_294;
  }
  providedAudioQuality = self->_providedAudioQuality;
  if ((unint64_t)providedAudioQuality | *((_QWORD *)v4 + 46))
  {
    if (!-[ICPAAudioQualityDictionary isEqual:](providedAudioQuality, "isEqual:"))
      goto LABEL_294;
  }
  queueGroupingID = self->_queueGroupingID;
  if ((unint64_t)queueGroupingID | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](queueGroupingID, "isEqual:"))
      goto LABEL_294;
  }
  v47 = self->_has;
  v48 = *(_QWORD *)(v4 + 500);
  if ((*(_WORD *)&v47 & 0x2000) != 0)
  {
    if ((v48 & 0x2000) == 0 || self->_reportingAdamID != *((_QWORD *)v4 + 14))
      goto LABEL_294;
  }
  else if ((v48 & 0x2000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    if ((v48 & 0x4000) == 0 || self->_sharedActivityGroupSizeCurrent != *((_QWORD *)v4 + 15))
      goto LABEL_294;
  }
  else if ((v48 & 0x4000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_WORD *)&v47 & 0x8000) != 0)
  {
    if ((v48 & 0x8000) == 0 || self->_sharedActivityGroupSizeMax != *((_QWORD *)v4 + 16))
      goto LABEL_294;
  }
  else if ((v48 & 0x8000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v47 & 0x400000000) != 0)
  {
    if ((v48 & 0x400000000) == 0 || self->_vocalAttenuationAvailibility != *((_DWORD *)v4 + 122))
      goto LABEL_294;
  }
  else if ((v48 & 0x400000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_DWORD *)&v47 & 0x200000) != 0)
  {
    if ((v48 & 0x200000) == 0 || self->_vocalAttenuationDuration != *((double *)v4 + 22))
      goto LABEL_294;
  }
  else if ((v48 & 0x200000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v47 & 0x800000000) != 0)
  {
    if ((v48 & 0x800000000) == 0)
      goto LABEL_294;
    if (self->_continuityCameraUsed)
    {
      if (!v4[492])
        goto LABEL_294;
    }
    else if (v4[492])
    {
      goto LABEL_294;
    }
  }
  else if ((v48 & 0x800000000) != 0)
  {
    goto LABEL_294;
  }
  if ((*(_QWORD *)&v47 & 0x2000000000) == 0)
  {
    if ((v48 & 0x2000000000) == 0)
      goto LABEL_289;
LABEL_294:
    v49 = 0;
    goto LABEL_295;
  }
  if ((v48 & 0x2000000000) == 0)
    goto LABEL_294;
  if (!self->_isCollaborativePlaylist)
  {
    if (!v4[494])
      goto LABEL_289;
    goto LABEL_294;
  }
  if (!v4[494])
    goto LABEL_294;
LABEL_289:
  if ((*(_DWORD *)&v47 & 0x80000000) != 0)
  {
    if ((v48 & 0x80000000) == 0 || self->_sharedActivityType != *((_DWORD *)v4 + 104))
      goto LABEL_294;
    v49 = 1;
  }
  else
  {
    v49 = (int)v48 >= 0;
  }
LABEL_295:

  return v49;
}

- (unint64_t)hash
{
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  double eventDateTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double eventSecondsFromGMT;
  double v11;
  long double v12;
  double v13;
  $1C24819EE6FCB6BF7661081CD3A68180 v14;
  unint64_t v15;
  double itemDuration;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double itemEndTime;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double itemStartTime;
  double v27;
  long double v28;
  double v29;
  $1C24819EE6FCB6BF7661081CD3A68180 v30;
  $1C24819EE6FCB6BF7661081CD3A68180 v31;
  $1C24819EE6FCB6BF7661081CD3A68180 v32;
  $1C24819EE6FCB6BF7661081CD3A68180 v33;
  $1C24819EE6FCB6BF7661081CD3A68180 v34;
  $1C24819EE6FCB6BF7661081CD3A68180 v35;
  $1C24819EE6FCB6BF7661081CD3A68180 v36;
  NSUInteger v37;
  $1C24819EE6FCB6BF7661081CD3A68180 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double vocalAttenuationDuration;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  NSUInteger v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSUInteger v71;
  NSUInteger v72;
  NSUInteger v73;
  NSUInteger v74;
  uint64_t v75;
  unint64_t v76;
  NSUInteger v77;
  uint64_t v78;
  NSUInteger v79;
  NSUInteger v80;
  NSUInteger v81;
  uint64_t v82;
  NSUInteger v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSUInteger v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSUInteger v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSUInteger v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  NSUInteger v103;
  NSUInteger v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  NSUInteger v108;
  uint64_t v109;
  NSUInteger v110;

  v110 = -[NSString hash](self->_containerID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    v109 = 2654435761 * self->_containerType;
  else
    v109 = 0;
  v108 = -[NSString hash](self->_deviceName, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    v107 = 2654435761 * self->_endReasonType;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_14;
  }
  v107 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  eventDateTimestamp = self->_eventDateTimestamp;
  v5 = -eventDateTimestamp;
  if (eventDateTimestamp >= 0.0)
    v5 = self->_eventDateTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  v106 = v8;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    eventSecondsFromGMT = self->_eventSecondsFromGMT;
    v11 = -eventSecondsFromGMT;
    if (eventSecondsFromGMT >= 0.0)
      v11 = self->_eventSecondsFromGMT;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v105 = v9;
  v104 = -[NSString hash](self->_externalID, "hash");
  v103 = -[NSString hash](self->_featureName, "hash");
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    itemDuration = self->_itemDuration;
    v17 = -itemDuration;
    if (itemDuration >= 0.0)
      v17 = self->_itemDuration;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    itemEndTime = self->_itemEndTime;
    v22 = -itemEndTime;
    if (itemEndTime >= 0.0)
      v22 = self->_itemEndTime;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    itemStartTime = self->_itemStartTime;
    v27 = -itemStartTime;
    if (itemStartTime >= 0.0)
      v27 = self->_itemStartTime;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) == 0)
  {
    v101 = 0;
    if ((*(_DWORD *)&v14 & 0x10000000) != 0)
      goto LABEL_48;
LABEL_51:
    v100 = 0;
    if ((*(_QWORD *)&v14 & 0x4000000000) != 0)
      goto LABEL_49;
    goto LABEL_52;
  }
  v101 = 2654435761 * self->_itemType;
  if ((*(_DWORD *)&v14 & 0x10000000) == 0)
    goto LABEL_51;
LABEL_48:
  v100 = 2654435761 * self->_mediaType;
  if ((*(_QWORD *)&v14 & 0x4000000000) != 0)
  {
LABEL_49:
    v99 = 2654435761 * self->_offline;
    goto LABEL_53;
  }
LABEL_52:
  v99 = 0;
LABEL_53:
  v102 = v25;
  if ((*(_WORD *)&v14 & 0x400) != 0)
    v98 = 2654435761 * self->_persistentID;
  else
    v98 = 0;
  v97 = -[NSString hash](self->_personalizedContainerID, "hash");
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x10000000000) == 0)
  {
    v96 = 0;
    if ((*(_QWORD *)&v30 & 0x100000000) != 0)
      goto LABEL_58;
LABEL_61:
    v95 = 0;
    if ((*(_DWORD *)&v30 & 0x20000) != 0)
      goto LABEL_59;
    goto LABEL_62;
  }
  v96 = 2654435761 * self->_sBEnabled;
  if ((*(_QWORD *)&v30 & 0x100000000) == 0)
    goto LABEL_61;
LABEL_58:
  v95 = 2654435761 * self->_sourceType;
  if ((*(_DWORD *)&v30 & 0x20000) != 0)
  {
LABEL_59:
    v94 = 2654435761u * self->_storeAccountID;
    goto LABEL_63;
  }
LABEL_62:
  v94 = 0;
LABEL_63:
  v93 = -[NSString hash](self->_storeID, "hash");
  v92 = -[NSData hash](self->_timedMetadata, "hash");
  v91 = -[NSData hash](self->_trackInfo, "hash");
  v90 = -[NSData hash](self->_recommendationData, "hash");
  v89 = -[NSString hash](self->_storeFrontID, "hash");
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
    v88 = 2654435761 * self->_eventType;
    if ((*(_DWORD *)&v31 & 0x40000) != 0)
    {
LABEL_65:
      v87 = 2654435761 * self->_subscriptionAdamID;
      if ((*(_WORD *)&v31 & 0x800) != 0)
        goto LABEL_66;
      goto LABEL_71;
    }
  }
  else
  {
    v88 = 0;
    if ((*(_DWORD *)&v31 & 0x40000) != 0)
      goto LABEL_65;
  }
  v87 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_66:
    v86 = 2654435761 * self->_purchasedAdamID;
    if ((*(_WORD *)&v31 & 0x1000) != 0)
      goto LABEL_67;
LABEL_72:
    v85 = 0;
    if ((*(_BYTE *)&v31 & 0x40) != 0)
      goto LABEL_68;
    goto LABEL_73;
  }
LABEL_71:
  v86 = 0;
  if ((*(_WORD *)&v31 & 0x1000) == 0)
    goto LABEL_72;
LABEL_67:
  v85 = 2654435761 * self->_radioAdamID;
  if ((*(_BYTE *)&v31 & 0x40) != 0)
  {
LABEL_68:
    v84 = 2654435761u * self->_itemCloudID;
    goto LABEL_74;
  }
LABEL_73:
  v84 = 0;
LABEL_74:
  v83 = -[NSString hash](self->_lyricsID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v82 = 2654435761 * self->_containerAdamID;
  else
    v82 = 0;
  v81 = -[NSString hash](self->_globalPlaylistID, "hash");
  v80 = -[NSString hash](self->_stationHash, "hash");
  v79 = -[NSString hash](self->_stationStringID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v78 = 2654435761 * self->_stationID;
  else
    v78 = 0;
  v77 = -[NSString hash](self->_cloudAlbumID, "hash");
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 2) != 0)
  {
    v76 = 2654435761u * self->_cloudPlaylistID;
    if ((*(_DWORD *)&v32 & 0x40000000) != 0)
      goto LABEL_82;
  }
  else
  {
    v76 = 0;
    if ((*(_DWORD *)&v32 & 0x40000000) != 0)
    {
LABEL_82:
      v75 = 2654435761 * self->_reasonHintType;
      goto LABEL_85;
    }
  }
  v75 = 0;
LABEL_85:
  v74 = -[NSString hash](self->_buildVersion, "hash");
  v73 = -[NSString hash](self->_playlistVersionHash, "hash");
  v72 = -[NSString hash](self->_requestingBundleIdentifier, "hash");
  v71 = -[NSString hash](self->_requestingBundleVersion, "hash");
  v33 = self->_has;
  if ((*(_BYTE *)&v33 & 8) != 0)
  {
    v70 = 2654435761 * self->_equivalencySourceAdamID;
    if ((*(_QWORD *)&v33 & 0x1000000000) != 0)
    {
LABEL_87:
      v69 = 2654435761 * self->_internalBuild;
      if ((*(_DWORD *)&v33 & 0x80000) != 0)
        goto LABEL_88;
LABEL_92:
      v68 = 0;
      if ((*(_DWORD *)&v33 & 0x100000) != 0)
        goto LABEL_89;
      goto LABEL_93;
    }
  }
  else
  {
    v70 = 0;
    if ((*(_QWORD *)&v33 & 0x1000000000) != 0)
      goto LABEL_87;
  }
  v69 = 0;
  if ((*(_DWORD *)&v33 & 0x80000) == 0)
    goto LABEL_92;
LABEL_88:
  v68 = 2654435761 * self->_tvShowPurchasedAdamID;
  if ((*(_DWORD *)&v33 & 0x100000) != 0)
  {
LABEL_89:
    v67 = 2654435761 * self->_tvShowSubscriptionAdamID;
    goto LABEL_94;
  }
LABEL_93:
  v67 = 0;
LABEL_94:
  v66 = -[ICPAPlayActivityEnqueuerProperties hash](self->_enqueuerProperties, "hash");
  v65 = -[NSString hash](self->_householdID, "hash");
  v34 = self->_has;
  if ((*(_QWORD *)&v34 & 0x8000000000) == 0)
  {
    v64 = 0;
    if ((*(_QWORD *)&v34 & 0x20000000000) != 0)
      goto LABEL_96;
LABEL_99:
    v63 = 0;
    if ((*(_QWORD *)&v34 & 0x200000000) != 0)
      goto LABEL_97;
    goto LABEL_100;
  }
  v64 = 2654435761 * self->_privateListeningEnabled;
  if ((*(_QWORD *)&v34 & 0x20000000000) == 0)
    goto LABEL_99;
LABEL_96:
  v63 = 2654435761 * self->_siriInitiated;
  if ((*(_QWORD *)&v34 & 0x200000000) != 0)
  {
LABEL_97:
    v62 = 2654435761 * self->_systemReleaseType;
    goto LABEL_101;
  }
LABEL_100:
  v62 = 0;
LABEL_101:
  v61 = -[NSString hash](self->_eventTimeZoneName, "hash");
  v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x1000000) != 0)
  {
    v60 = 2654435761 * self->_displayType;
    if ((*(_BYTE *)&v35 & 1) != 0)
      goto LABEL_103;
  }
  else
  {
    v60 = 0;
    if ((*(_BYTE *)&v35 & 1) != 0)
    {
LABEL_103:
      v59 = 2654435761 * self->_characterDisplayedCount;
      goto LABEL_106;
    }
  }
  v59 = 0;
LABEL_106:
  v58 = -[NSString hash](self->_lyricLanguage, "hash");
  v57 = -[NSMutableArray hash](self->_buildFeatures, "hash");
  v56 = -[ICPAPlayModeDictionary hash](self->_playMode, "hash");
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    v55 = 2654435761 * self->_audioQualityPreference;
    if ((*(_DWORD *)&v36 & 0x20000000) != 0)
      goto LABEL_108;
  }
  else
  {
    v55 = 0;
    if ((*(_DWORD *)&v36 & 0x20000000) != 0)
    {
LABEL_108:
      v54 = 2654435761 * self->_playbackFormatPreference;
      goto LABEL_111;
    }
  }
  v54 = 0;
LABEL_111:
  v53 = -[ICPAAudioQualityDictionary hash](self->_targetedAudioQuality, "hash");
  v52 = -[ICPAAudioQualityDictionary hash](self->_providedAudioQuality, "hash");
  v37 = -[NSString hash](self->_queueGroupingID, "hash");
  v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x2000) != 0)
  {
    v39 = 2654435761 * self->_reportingAdamID;
    if ((*(_WORD *)&v38 & 0x4000) != 0)
    {
LABEL_113:
      v40 = 2654435761 * self->_sharedActivityGroupSizeCurrent;
      if ((*(_WORD *)&v38 & 0x8000) != 0)
        goto LABEL_114;
      goto LABEL_122;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_WORD *)&v38 & 0x4000) != 0)
      goto LABEL_113;
  }
  v40 = 0;
  if ((*(_WORD *)&v38 & 0x8000) != 0)
  {
LABEL_114:
    v41 = 2654435761 * self->_sharedActivityGroupSizeMax;
    if ((*(_QWORD *)&v38 & 0x400000000) != 0)
      goto LABEL_115;
LABEL_123:
    v42 = 0;
    if ((*(_DWORD *)&v38 & 0x200000) != 0)
      goto LABEL_116;
LABEL_124:
    v47 = 0;
    goto LABEL_127;
  }
LABEL_122:
  v41 = 0;
  if ((*(_QWORD *)&v38 & 0x400000000) == 0)
    goto LABEL_123;
LABEL_115:
  v42 = 2654435761 * self->_vocalAttenuationAvailibility;
  if ((*(_DWORD *)&v38 & 0x200000) == 0)
    goto LABEL_124;
LABEL_116:
  vocalAttenuationDuration = self->_vocalAttenuationDuration;
  v44 = -vocalAttenuationDuration;
  if (vocalAttenuationDuration >= 0.0)
    v44 = self->_vocalAttenuationDuration;
  v45 = floor(v44 + 0.5);
  v46 = (v44 - v45) * 1.84467441e19;
  v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0)
      v47 += (unint64_t)v46;
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
LABEL_127:
  if ((*(_QWORD *)&v38 & 0x800000000) == 0)
  {
    v48 = 0;
    if ((*(_QWORD *)&v38 & 0x2000000000) != 0)
      goto LABEL_129;
LABEL_132:
    v49 = 0;
    if ((*(_DWORD *)&v38 & 0x80000000) != 0)
      goto LABEL_130;
LABEL_133:
    v50 = 0;
    return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v15 ^ v20 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v47 ^ v48 ^ v49 ^ v50;
  }
  v48 = 2654435761 * self->_continuityCameraUsed;
  if ((*(_QWORD *)&v38 & 0x2000000000) == 0)
    goto LABEL_132;
LABEL_129:
  v49 = 2654435761 * self->_isCollaborativePlaylist;
  if ((*(_DWORD *)&v38 & 0x80000000) == 0)
    goto LABEL_133;
LABEL_130:
  v50 = 2654435761 * self->_sharedActivityType;
  return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v15 ^ v20 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v37 ^ v39 ^ v40 ^ v41 ^ v42 ^ v47 ^ v48 ^ v49 ^ v50;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_targetedAudioQuality, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_providedAudioQuality, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_playMode, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_lyricLanguage, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZoneName, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_buildFeatures, 0);
}

- (void)addBuildFeatures:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
