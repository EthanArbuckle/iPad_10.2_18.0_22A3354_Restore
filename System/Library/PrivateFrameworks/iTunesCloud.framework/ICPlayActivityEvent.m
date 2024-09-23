@implementation ICPlayActivityEvent

- (ICPlayActivityEvent)init
{
  ICPlayActivityEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICPlayActivityEvent;
  result = -[ICPlayActivityEvent init](&v3, sel_init);
  if (result)
  {
    result->_eventType = 0;
    result->_version = 2;
  }
  return result;
}

- (ICPlayActivityEvent)initWithDataRepresentation:(id)a3
{
  id v4;
  ICPAPlayActivityEvent *v5;
  ICPlayActivityEvent *v6;
  $1C24819EE6FCB6BF7661081CD3A68180 has;
  uint64_t v8;
  unint64_t v9;
  int playbackFormatPreference;
  _BOOL8 v11;
  BOOL v12;
  uint64_t v13;
  ICMutablePlayActivityAudioQualityProperties *v14;
  ICPAAudioQualityDictionary *v15;
  ICPAAudioQualityDictionary *v16;
  NSString *channelLayoutDescription;
  NSString *v18;
  _BOOL8 isSpatialized;
  ICMutablePlayActivityAudioQualityProperties *v20;
  ICPAAudioQualityDictionary *v21;
  ICPAAudioQualityDictionary *v22;
  NSString *v23;
  NSString *v24;
  _BOOL8 v25;
  $1C24819EE6FCB6BF7661081CD3A68180 v26;
  unsigned int v27;
  unint64_t v28;
  NSString *deviceName;
  $1C24819EE6FCB6BF7661081CD3A68180 v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  NSDate *eventDate;
  NSString *eventTimeZoneName;
  NSTimeZone *v38;
  uint64_t v39;
  NSTimeZone *eventTimeZone;
  double eventSecondsFromGMT;
  uint64_t v42;
  NSString *featureName;
  $1C24819EE6FCB6BF7661081CD3A68180 v44;
  NSString *lyricLanguage;
  $1C24819EE6FCB6BF7661081CD3A68180 v46;
  NSString *queueGroupingID;
  NSData *recommendationData;
  $1C24819EE6FCB6BF7661081CD3A68180 v49;
  NSString *storeFrontID;
  NSData *timedMetadata;
  NSData *trackInfo;
  $1C24819EE6FCB6BF7661081CD3A68180 v53;
  int eventType;
  _BOOL8 v55;
  uint64_t v56;
  NSString *buildVersion;
  NSString *requestingBundleVersion;
  NSString *requestingBundleIdentifier;
  ICPAPlayModeDictionary *playMode;
  ICPAPlayModeDictionary *v61;
  int autoPlayMode;
  uint64_t v63;
  unint64_t v64;
  int sourceType;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  int repeatPlayMode;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  int shufflePlayMode;
  $1C24819EE6FCB6BF7661081CD3A68180 v75;
  uint64_t v76;
  uint64_t v77;
  ICPAPlayActivityEnqueuerProperties *enqueuerProperties;
  ICPAPlayActivityEnqueuerProperties *v79;
  ICMutablePlayActivityEnqueuerProperties *v80;
  NSString *v81;
  NSString *v82;
  NSString *deviceGUID;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  NSString *timeZoneName;
  NSString *v88;
  void *v89;
  char v90;
  NSString *v91;
  NSString *v92;
  void *v93;
  uint64_t v94;
  ICPlayActivityEnqueuerProperties *v95;
  NSString *householdID;
  $1C24819EE6FCB6BF7661081CD3A68180 v97;
  NSString *containerID;
  BOOL v99;
  NSString *externalID;
  NSString *personalizedContainerID;
  NSString *storeID;
  uint64_t v103;
  NSNumber *privateListeningEnabled;
  uint64_t v105;
  NSNumber *siriInitiated;
  unsigned int v107;
  int64_t v108;
  uint64_t v109;
  uint64_t v110;
  int vocalAttenuationAvailibility;
  _BOOL8 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (**v116)(_QWORD);
  void *v117;
  NSString *v118;
  void *v119;
  NSString *v120;
  void *v121;
  NSString *v122;
  void *v123;
  NSString *v124;
  void *v125;
  NSString *v126;
  uint64_t v127;
  void (**v128)(_QWORD);
  $1C24819EE6FCB6BF7661081CD3A68180 v129;
  void *v130;
  NSString *v131;
  $1C24819EE6FCB6BF7661081CD3A68180 v132;
  ICPlayActivityEvent *v133;
  id v135;
  void *v136;
  _QWORD v137[5];
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  _QWORD v144[5];
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;

  v4 = a3;
  v5 = -[ICPAPlayActivityEvent initWithData:]([ICPAPlayActivityEvent alloc], "initWithData:", v4);
  if (v5)
  {
    v6 = -[ICPlayActivityEvent init](self, "init");

    if (v6)
    {
      has = v5->_has;
      if ((*(_DWORD *)&has & 0x400000) != 0)
      {
        v8 = (v5->_audioQualityPreference - 1);
        if (v8 < 4)
          v9 = v8 + 1;
        else
          v9 = 0;
        v6->_audioQualityPreference = v9;
        has = v5->_has;
      }
      v135 = v4;
      if ((*(_DWORD *)&has & 0x20000000) != 0)
      {
        playbackFormatPreference = v5->_playbackFormatPreference;
        v11 = playbackFormatPreference == 1;
        v12 = playbackFormatPreference == 2;
        v13 = 2;
        if (!v12)
          v13 = v11;
        v6->_playbackFormatPreference = v13;
      }
      if (v5->_targetedAudioQuality)
      {
        v14 = objc_alloc_init(ICMutablePlayActivityAudioQualityProperties);
        v15 = v5->_targetedAudioQuality;
        v16 = v15;
        if (v15)
        {
          -[ICMutablePlayActivityAudioQualityProperties setBitRate:](v14, "setBitRate:", v15->_bitRate);
          -[ICMutablePlayActivityAudioQualityProperties setBitDepth:](v14, "setBitDepth:", v16->_bitDepth);
          channelLayoutDescription = v16->_channelLayoutDescription;
        }
        else
        {
          -[ICMutablePlayActivityAudioQualityProperties setBitRate:](v14, "setBitRate:", 0);
          -[ICMutablePlayActivityAudioQualityProperties setBitDepth:](v14, "setBitDepth:", 0);
          channelLayoutDescription = 0;
        }
        v18 = channelLayoutDescription;
        -[ICMutablePlayActivityAudioQualityProperties setChannelLayoutDescription:](v14, "setChannelLayoutDescription:", v18);

        if (v16)
        {
          -[ICMutablePlayActivityAudioQualityProperties setCodec:](v14, "setCodec:", v16->_codec);
          -[ICMutablePlayActivityAudioQualityProperties setSampleRate:](v14, "setSampleRate:", v16->_sampleRate);
          isSpatialized = v16->_isSpatialized;
        }
        else
        {
          -[ICMutablePlayActivityAudioQualityProperties setCodec:](v14, "setCodec:", 0);
          -[ICMutablePlayActivityAudioQualityProperties setSampleRate:](v14, "setSampleRate:", 0);
          isSpatialized = 0;
        }
        -[ICMutablePlayActivityAudioQualityProperties setSpatialized:](v14, "setSpatialized:", isSpatialized, v4);
        objc_storeStrong((id *)&v6->_targetedAudioQuality, v14);

      }
      if (v5->_providedAudioQuality)
      {
        v20 = objc_alloc_init(ICMutablePlayActivityAudioQualityProperties);
        v21 = v5->_providedAudioQuality;
        v22 = v21;
        if (v21)
        {
          -[ICMutablePlayActivityAudioQualityProperties setBitRate:](v20, "setBitRate:", v21->_bitRate);
          -[ICMutablePlayActivityAudioQualityProperties setBitDepth:](v20, "setBitDepth:", v22->_bitDepth);
          v23 = v22->_channelLayoutDescription;
        }
        else
        {
          -[ICMutablePlayActivityAudioQualityProperties setBitRate:](v20, "setBitRate:", 0);
          -[ICMutablePlayActivityAudioQualityProperties setBitDepth:](v20, "setBitDepth:", 0);
          v23 = 0;
        }
        v24 = v23;
        -[ICMutablePlayActivityAudioQualityProperties setChannelLayoutDescription:](v20, "setChannelLayoutDescription:", v24);

        if (v22)
        {
          -[ICMutablePlayActivityAudioQualityProperties setCodec:](v20, "setCodec:", v22->_codec);
          -[ICMutablePlayActivityAudioQualityProperties setSampleRate:](v20, "setSampleRate:", v22->_sampleRate);
          v25 = v22->_isSpatialized;
        }
        else
        {
          -[ICMutablePlayActivityAudioQualityProperties setCodec:](v20, "setCodec:", 0);
          -[ICMutablePlayActivityAudioQualityProperties setSampleRate:](v20, "setSampleRate:", 0);
          v25 = 0;
        }
        -[ICMutablePlayActivityAudioQualityProperties setSpatialized:](v20, "setSpatialized:", v25, v135);
        objc_storeStrong((id *)&v6->_providedAudioQuality, v20);

      }
      v26 = v5->_has;
      if ((*(_DWORD *)&v26 & 0x800000) != 0)
      {
        v27 = v5->_containerType - 1;
        if (v27 > 3)
          v28 = 0;
        else
          v28 = qword_1A06E7468[v27];
        v6->_containerType = v28;
        v26 = v5->_has;
      }
      if ((*(_QWORD *)&v26 & 0x800000000) != 0)
        v6->_continuityCameraUsed = v5->_continuityCameraUsed;
      deviceName = v5->_deviceName;
      if (deviceName)
        objc_storeStrong((id *)&v6->_deviceName, deviceName);
      v30 = v5->_has;
      if ((*(_DWORD *)&v30 & 0x1000000) != 0)
      {
        v31 = (v5->_displayType - 1);
        if (v31 < 3)
          v32 = v31 + 1;
        else
          v32 = 0;
        v6->_displayType = v32;
        v30 = v5->_has;
        if ((*(_DWORD *)&v30 & 0x2000000) == 0)
        {
LABEL_36:
          if ((*(_BYTE *)&v30 & 0x10) == 0)
            goto LABEL_48;
LABEL_46:
          if (fabs(v5->_eventDateTimestamp) > 2.22044605e-16)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
            v35 = objc_claimAutoreleasedReturnValue();
            eventDate = v6->_eventDate;
            v6->_eventDate = (NSDate *)v35;

          }
LABEL_48:
          eventTimeZoneName = v5->_eventTimeZoneName;
          if (eventTimeZoneName)
          {
            v38 = eventTimeZoneName;
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v38);
            v39 = objc_claimAutoreleasedReturnValue();
            eventTimeZone = v6->_eventTimeZone;
            v6->_eventTimeZone = (NSTimeZone *)v39;

          }
          else
          {
            if ((*(_BYTE *)&v5->_has & 0x20) == 0
              || (eventSecondsFromGMT = v5->_eventSecondsFromGMT, fabs(eventSecondsFromGMT) <= 2.22044605e-16))
            {
LABEL_54:
              featureName = v5->_featureName;
              if (featureName)
                objc_storeStrong((id *)&v6->_featureName, featureName);
              v44 = v5->_has;
              if ((*(_BYTE *)&v44 & 0x80) != 0)
              {
                v6->_itemDuration = v5->_itemDuration;
                v44 = v5->_has;
                if ((*(_WORD *)&v44 & 0x100) == 0)
                {
LABEL_58:
                  if ((*(_WORD *)&v44 & 0x200) == 0)
                    goto LABEL_59;
                  goto LABEL_101;
                }
              }
              else if ((*(_WORD *)&v44 & 0x100) == 0)
              {
                goto LABEL_58;
              }
              v6->_itemEndTime = v5->_itemEndTime;
              v44 = v5->_has;
              if ((*(_WORD *)&v44 & 0x200) == 0)
              {
LABEL_59:
                if ((*(_DWORD *)&v44 & 0x8000000) == 0)
                  goto LABEL_60;
                goto LABEL_102;
              }
LABEL_101:
              v6->_itemStartTime = v5->_itemStartTime;
              v44 = v5->_has;
              if ((*(_DWORD *)&v44 & 0x8000000) == 0)
              {
LABEL_60:
                if ((*(_BYTE *)&v44 & 1) == 0)
                  goto LABEL_62;
                goto LABEL_61;
              }
LABEL_102:
              v63 = (v5->_itemType - 1);
              if (v63 < 9)
                v64 = v63 + 1;
              else
                v64 = 0;
              v6->_itemType = v64;
              if ((*(_QWORD *)&v5->_has & 1) == 0)
              {
LABEL_62:
                lyricLanguage = v5->_lyricLanguage;
                if (lyricLanguage)
                  objc_storeStrong((id *)&v6->_lyricsLanguage, lyricLanguage);
                v46 = v5->_has;
                if ((*(_DWORD *)&v46 & 0x10000000) != 0)
                {
                  v6->_mediaType = v5->_mediaType == 1;
                  v46 = v5->_has;
                  if ((*(_QWORD *)&v46 & 0x4000000000) == 0)
                  {
LABEL_66:
                    if ((*(_WORD *)&v46 & 0x400) == 0)
                      goto LABEL_68;
                    goto LABEL_67;
                  }
                }
                else if ((*(_QWORD *)&v46 & 0x4000000000) == 0)
                {
                  goto LABEL_66;
                }
                v6->_offline = v5->_offline;
                if ((*(_QWORD *)&v5->_has & 0x400) == 0)
                {
LABEL_68:
                  queueGroupingID = v5->_queueGroupingID;
                  if (queueGroupingID)
                    objc_storeStrong((id *)&v6->_queueGroupingID, queueGroupingID);
                  recommendationData = v5->_recommendationData;
                  if (recommendationData)
                    objc_storeStrong((id *)&v6->_recommendationData, recommendationData);
                  v49 = v5->_has;
                  if ((*(_QWORD *)&v49 & 0x10000000000) != 0)
                  {
                    v6->_SBEnabled = v5->_sBEnabled;
                    v49 = v5->_has;
                    if ((*(_QWORD *)&v49 & 0x100000000) == 0)
                    {
LABEL_74:
                      if ((*(_DWORD *)&v49 & 0x20000) == 0)
                        goto LABEL_76;
                      goto LABEL_75;
                    }
                  }
                  else if ((*(_QWORD *)&v49 & 0x100000000) == 0)
                  {
                    goto LABEL_74;
                  }
                  sourceType = v5->_sourceType;
                  v66 = sourceType == 1;
                  v12 = sourceType == 2;
                  v67 = 2;
                  if (!v12)
                    v67 = v66;
                  v6->_sourceType = v67;
                  if ((*(_QWORD *)&v5->_has & 0x20000) == 0)
                  {
LABEL_76:
                    storeFrontID = v5->_storeFrontID;
                    if (storeFrontID)
                      objc_storeStrong((id *)&v6->_storeFrontID, storeFrontID);
                    timedMetadata = v5->_timedMetadata;
                    if (timedMetadata)
                      objc_storeStrong((id *)&v6->_timedMetadata, timedMetadata);
                    trackInfo = v5->_trackInfo;
                    if (trackInfo)
                      objc_storeStrong((id *)&v6->_trackInfo, trackInfo);
                    v53 = v5->_has;
                    if ((*(_DWORD *)&v53 & 0x4000000) != 0)
                    {
                      eventType = v5->_eventType;
                      v55 = eventType == 2;
                      v12 = eventType == 3;
                      v56 = 2;
                      if (!v12)
                        v56 = v55;
                      v6->_eventType = v56;
                      v53 = v5->_has;
                    }
                    if ((*(_DWORD *)&v53 & 0x40000000) != 0)
                      v6->_reasonHintType = v5->_reasonHintType == 1;
                    if (-[NSMutableArray count](v5->_buildFeatures, "count", v135))
                      objc_storeStrong((id *)&v6->_buildFeatures, v5->_buildFeatures);
                    buildVersion = v5->_buildVersion;
                    if (buildVersion)
                      objc_storeStrong((id *)&v6->_buildVersion, buildVersion);
                    requestingBundleVersion = v5->_requestingBundleVersion;
                    if (requestingBundleVersion)
                      objc_storeStrong((id *)&v6->_requestingBundleVersion, requestingBundleVersion);
                    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
                    if (requestingBundleIdentifier)
                      objc_storeStrong((id *)&v6->_requestingBundleIdentifier, requestingBundleIdentifier);
                    playMode = v5->_playMode;
                    if (playMode)
                    {
                      v61 = playMode;
                      if ((*(_BYTE *)&v61->_has & 1) != 0)
                        autoPlayMode = v61->_autoPlayMode;
                      else
                        autoPlayMode = 0;
                      v68 = (autoPlayMode - 1);
                      if (v68 < 3)
                        v69 = v68 + 1;
                      else
                        v69 = 0;
                      v6->_autoPlayMode = v69;
                      if ((*(_BYTE *)&v61->_has & 2) != 0)
                        repeatPlayMode = v61->_repeatPlayMode;
                      else
                        repeatPlayMode = 0;
                      v71 = 0;
                      v72 = (repeatPlayMode - 1);
                      if (v72 < 3)
                        v73 = v72 + 1;
                      else
                        v73 = 0;
                      v6->_repeatPlayMode = v73;
                      if ((*(_BYTE *)&v61->_has & 4) != 0)
                      {
                        shufflePlayMode = v61->_shufflePlayMode;
                        v71 = shufflePlayMode == 1;
                        if (shufflePlayMode == 2)
                          v71 = 2;
                      }
                      v6->_shufflePlayMode = v71;

                    }
                    v75 = v5->_has;
                    if ((*(_QWORD *)&v75 & 0x200000000) != 0)
                    {
                      v77 = (v5->_systemReleaseType - 1);
                      if (v77 >= 4)
                        v76 = 0;
                      else
                        v76 = v77 + 1;
                    }
                    else
                    {
                      if ((*(_QWORD *)&v75 & 0x1000000000) == 0)
                        goto LABEL_136;
                      v76 = 4 * v5->_internalBuild;
                    }
                    v6->_systemReleaseType = v76;
LABEL_136:
                    enqueuerProperties = v5->_enqueuerProperties;
                    if (!enqueuerProperties)
                      goto LABEL_154;
                    v79 = enqueuerProperties;
                    v80 = objc_alloc_init(ICMutablePlayActivityEnqueuerProperties);
                    v81 = v79->_buildVersion;
                    if (v81)
                    {
                      v82 = v81;
                      -[ICMutablePlayActivityEnqueuerProperties setBuildVersion:](v80, "setBuildVersion:", v82);

                    }
                    deviceGUID = v79->_deviceGUID;
                    if (deviceGUID)
                    {
                      v84 = deviceGUID;
                      -[ICMutablePlayActivityEnqueuerProperties setDeviceGUID:](v80, "setDeviceGUID:", v84);

                    }
                    v85 = v79->_deviceName;
                    if (v85)
                    {
                      v86 = v85;
                      -[ICMutablePlayActivityEnqueuerProperties setDeviceName:](v80, "setDeviceName:", v86);

                    }
                    timeZoneName = v79->_timeZoneName;
                    if (timeZoneName)
                    {
                      v88 = timeZoneName;
                      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v88);
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      -[ICMutablePlayActivityEnqueuerProperties setTimeZone:](v80, "setTimeZone:", v89);

                    }
                    v90 = (char)v79->_has;
                    if ((v90 & 2) != 0)
                    {
                      v109 = (v79->_systemReleaseType - 1);
                      if (v109 < 4)
                        v110 = v109 + 1;
                      else
                        v110 = 0;
                      -[ICMutablePlayActivityEnqueuerProperties setSystemReleaseType:](v80, "setSystemReleaseType:", v110);
                      v90 = (char)v79->_has;
                      if ((v90 & 8) == 0)
                      {
LABEL_147:
                        if ((v90 & 1) == 0)
                        {
LABEL_149:
                          v91 = v79->_storeFrontID;
                          if (v91)
                          {
                            v92 = v91;
                            -[ICMutablePlayActivityEnqueuerProperties setStoreFrontID:](v80, "setStoreFrontID:", v92);

                          }
                          if ((*(_BYTE *)&v79->_has & 4) != 0)
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v79->_privateListeningEnabled);
                            v93 = (void *)objc_claimAutoreleasedReturnValue();
                            -[ICMutablePlayActivityEnqueuerProperties setPrivateListeningEnabled:](v80, "setPrivateListeningEnabled:", v93);

                          }
                          v94 = -[ICMutablePlayActivityEnqueuerProperties copy](v80, "copy");
                          v95 = v6->_enqueuerProperties;
                          v6->_enqueuerProperties = (ICPlayActivityEnqueuerProperties *)v94;

LABEL_154:
                          householdID = v5->_householdID;
                          if (householdID)
                            objc_storeStrong((id *)&v6->_householdID, householdID);
                          v97 = v5->_has;
                          if ((*(_QWORD *)&v97 & 0x8000000000) != 0)
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_privateListeningEnabled);
                            v103 = objc_claimAutoreleasedReturnValue();
                            privateListeningEnabled = v6->_privateListeningEnabled;
                            v6->_privateListeningEnabled = (NSNumber *)v103;

                            v97 = v5->_has;
                            if ((*(_QWORD *)&v97 & 0x20000000000) == 0)
                            {
LABEL_158:
                              if ((*(_WORD *)&v97 & 0x4000) == 0)
                                goto LABEL_159;
                              goto LABEL_175;
                            }
                          }
                          else if ((*(_QWORD *)&v97 & 0x20000000000) == 0)
                          {
                            goto LABEL_158;
                          }
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5->_siriInitiated);
                          v105 = objc_claimAutoreleasedReturnValue();
                          siriInitiated = v6->_siriInitiated;
                          v6->_siriInitiated = (NSNumber *)v105;

                          v97 = v5->_has;
                          if ((*(_WORD *)&v97 & 0x4000) == 0)
                          {
LABEL_159:
                            if ((*(_WORD *)&v97 & 0x8000) == 0)
                              goto LABEL_160;
                            goto LABEL_176;
                          }
LABEL_175:
                          v6->_sharedActivityGroupSizeCurrent = v5->_sharedActivityGroupSizeCurrent;
                          v97 = v5->_has;
                          if ((*(_WORD *)&v97 & 0x8000) == 0)
                          {
LABEL_160:
                            if ((*(_DWORD *)&v97 & 0x80000000) == 0)
                              goto LABEL_161;
                            goto LABEL_177;
                          }
LABEL_176:
                          v6->_sharedActivityGroupSizeMax = v5->_sharedActivityGroupSizeMax;
                          v97 = v5->_has;
                          if ((*(_DWORD *)&v97 & 0x80000000) == 0)
                          {
LABEL_161:
                            if ((*(_QWORD *)&v97 & 0x2000000000) == 0)
                              goto LABEL_162;
                            goto LABEL_187;
                          }
LABEL_177:
                          v107 = v5->_sharedActivityType - 1;
                          if (v107 > 5)
                            v108 = 0;
                          else
                            v108 = qword_1A06E7500[v107];
                          v6->_sharedActivityType = v108;
                          v97 = v5->_has;
                          if ((*(_QWORD *)&v97 & 0x2000000000) == 0)
                          {
LABEL_162:
                            if ((*(_QWORD *)&v97 & 0x400000000) == 0)
                              goto LABEL_163;
                            goto LABEL_188;
                          }
LABEL_187:
                          v6->_collaborativePlaylist = v5->_isCollaborativePlaylist;
                          v97 = v5->_has;
                          if ((*(_QWORD *)&v97 & 0x400000000) == 0)
                          {
LABEL_163:
                            if ((*(_DWORD *)&v97 & 0x200000) == 0)
                              goto LABEL_165;
                            goto LABEL_164;
                          }
LABEL_188:
                          vocalAttenuationAvailibility = v5->_vocalAttenuationAvailibility;
                          v112 = vocalAttenuationAvailibility == 1;
                          v12 = vocalAttenuationAvailibility == 2;
                          v113 = 2;
                          if (!v12)
                            v113 = v112;
                          v6->_vocalAttenuationAvailability = v113;
                          if ((*(_QWORD *)&v5->_has & 0x200000) == 0)
                          {
LABEL_165:
                            if (v6->_version <= 1)
                            {
                              containerID = v5->_containerID;
                              v99 = containerID != 0;
                              if (containerID)
                                objc_storeStrong((id *)&v6->_containerID, containerID);
                              externalID = v5->_externalID;
                              if (externalID)
                              {
                                objc_storeStrong((id *)&v6->_externalID, externalID);
                                v99 = 1;
                              }
                              personalizedContainerID = v5->_personalizedContainerID;
                              if (personalizedContainerID)
                              {
                                objc_storeStrong((id *)&v6->_personalizedContainerID, personalizedContainerID);
                                storeID = v5->_storeID;
                                if (!storeID)
                                  goto LABEL_227;
                                goto LABEL_193;
                              }
                              storeID = v5->_storeID;
                              if (storeID)
                              {
LABEL_193:
                                objc_storeStrong((id *)&v6->_storeID, storeID);
LABEL_227:
                                v4 = v136;
                                goto LABEL_228;
                              }
                              if (v99 || v6->_version < 2)
                                goto LABEL_227;
                            }
                            v145 = 0;
                            v146 = &v145;
                            v147 = 0x3032000000;
                            v148 = __Block_byref_object_copy__18947;
                            v149 = __Block_byref_object_dispose__18948;
                            v114 = MEMORY[0x1E0C809B0];
                            v150 = 0;
                            v144[0] = MEMORY[0x1E0C809B0];
                            v144[1] = 3221225472;
                            v144[2] = __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke;
                            v144[3] = &unk_1E4391138;
                            v144[4] = &v145;
                            v115 = MEMORY[0x1A1AFA8D0](v144);
                            v116 = (void (**)(_QWORD))v115;
                            if ((*(_BYTE *)&v5->_has & 4) != 0)
                            {
                              (*(void (**)(uint64_t))(v115 + 16))(v115);
                              objc_msgSend((id)v146[5], "setAdamID:", v5->_containerAdamID);
                            }
                            if (v5->_globalPlaylistID)
                            {
                              v116[2](v116);
                              v117 = (void *)v146[5];
                              v118 = v5->_globalPlaylistID;
                              objc_msgSend(v117, "setGlobalPlaylistID:", v118);

                            }
                            if (v5->_playlistVersionHash)
                            {
                              v116[2](v116);
                              v119 = (void *)v146[5];
                              v120 = v5->_playlistVersionHash;
                              objc_msgSend(v119, "setPlaylistVersionHash:", v120);

                            }
                            if (v5->_stationHash)
                            {
                              v116[2](v116);
                              v121 = (void *)v146[5];
                              v122 = v5->_stationHash;
                              objc_msgSend(v121, "setStationHash:", v122);

                            }
                            if (v5->_stationStringID)
                            {
                              v116[2](v116);
                              v123 = (void *)v146[5];
                              v124 = v5->_stationStringID;
                              objc_msgSend(v123, "setStationStringID:", v124);

                            }
                            if ((*((_BYTE *)&v5->_has + 2) & 1) != 0)
                            {
                              v116[2](v116);
                              objc_msgSend((id)v146[5], "setStationID:", v5->_stationID);
                            }
                            if (v5->_cloudAlbumID)
                            {
                              v116[2](v116);
                              v125 = (void *)v146[5];
                              v126 = v5->_cloudAlbumID;
                              objc_msgSend(v125, "setCloudAlbumID:", v126);

                            }
                            if ((*(_BYTE *)&v5->_has & 2) != 0)
                            {
                              v116[2](v116);
                              objc_msgSend((id)v146[5], "setCloudPlaylistID:", v5->_cloudPlaylistID);
                            }
                            objc_storeStrong((id *)&v6->_containerIDs, (id)v146[5]);
                            v138 = 0;
                            v139 = &v138;
                            v140 = 0x3032000000;
                            v141 = __Block_byref_object_copy__18947;
                            v142 = __Block_byref_object_dispose__18948;
                            v143 = 0;
                            v137[0] = v114;
                            v137[1] = 3221225472;
                            v137[2] = __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke_2;
                            v137[3] = &unk_1E4391138;
                            v137[4] = &v138;
                            v127 = MEMORY[0x1A1AFA8D0](v137);
                            v128 = (void (**)(_QWORD))v127;
                            v129 = v5->_has;
                            if ((*(_DWORD *)&v129 & 0x40000) != 0)
                            {
                              (*(void (**)(uint64_t))(v127 + 16))(v127);
                              objc_msgSend((id)v139[5], "setSubscriptionAdamID:", v5->_subscriptionAdamID);
                              v129 = v5->_has;
                            }
                            if ((*(_WORD *)&v129 & 0x800) != 0)
                            {
                              v128[2](v128);
                              objc_msgSend((id)v139[5], "setPurchasedAdamID:", v5->_purchasedAdamID);
                              v129 = v5->_has;
                            }
                            if ((*(_WORD *)&v129 & 0x1000) != 0)
                            {
                              v128[2](v128);
                              objc_msgSend((id)v139[5], "setRadioAdamID:", v5->_radioAdamID);
                              v129 = v5->_has;
                            }
                            if ((*(_BYTE *)&v129 & 0x40) != 0)
                            {
                              v128[2](v128);
                              objc_msgSend((id)v139[5], "setCloudID:", v5->_itemCloudID);
                            }
                            if (v5->_lyricsID)
                            {
                              v128[2](v128);
                              v130 = (void *)v139[5];
                              v131 = v5->_lyricsID;
                              objc_msgSend(v130, "setLyricsID:", v131);

                            }
                            v132 = v5->_has;
                            if ((*(_BYTE *)&v132 & 8) != 0)
                            {
                              v128[2](v128);
                              objc_msgSend((id)v139[5], "setEquivalencySourceAdamID:", v5->_equivalencySourceAdamID);
                              v132 = v5->_has;
                            }
                            if ((*(_WORD *)&v132 & 0x2000) != 0)
                            {
                              v128[2](v128);
                              objc_msgSend((id)v139[5], "setReportingAdamID:", v5->_reportingAdamID);
                            }
                            objc_storeStrong((id *)&v6->_itemIDs, (id)v139[5]);

                            _Block_object_dispose(&v138, 8);
                            _Block_object_dispose(&v145, 8);

                            goto LABEL_227;
                          }
LABEL_164:
                          v6->_vocalAttenuationDuration = v5->_vocalAttenuationDuration;
                          goto LABEL_165;
                        }
LABEL_148:
                        -[ICMutablePlayActivityEnqueuerProperties setStoreAccountID:](v80, "setStoreAccountID:", v79->_storeAccountID);
                        goto LABEL_149;
                      }
                    }
                    else if ((*(_BYTE *)&v79->_has & 8) == 0)
                    {
                      goto LABEL_147;
                    }
                    -[ICMutablePlayActivityEnqueuerProperties setSBEnabled:](v80, "setSBEnabled:", v79->_sBEnabled);
                    if ((*(_BYTE *)&v79->_has & 1) == 0)
                      goto LABEL_149;
                    goto LABEL_148;
                  }
LABEL_75:
                  v6->_storeAccountID = v5->_storeAccountID;
                  goto LABEL_76;
                }
LABEL_67:
                v6->_persistentID = v5->_persistentID;
                goto LABEL_68;
              }
LABEL_61:
              v6->_lyricsDisplayedCharacterCount = v5->_characterDisplayedCount;
              goto LABEL_62;
            }
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)eventSecondsFromGMT);
            v42 = objc_claimAutoreleasedReturnValue();
            v38 = v6->_eventTimeZone;
            v6->_eventTimeZone = (NSTimeZone *)v42;
          }

          goto LABEL_54;
        }
      }
      else if ((*(_DWORD *)&v30 & 0x2000000) == 0)
      {
        goto LABEL_36;
      }
      v33 = v5->_endReasonType - 1;
      if (v33 > 0xE)
        v34 = 0;
      else
        v34 = qword_1A06E7488[v33];
      v6->_endReasonType = v34;
      if ((*(_QWORD *)&v5->_has & 0x10) == 0)
        goto LABEL_48;
      goto LABEL_46;
    }
  }
  else
  {

    v6 = 0;
  }
LABEL_228:
  v133 = v6;

  return v133;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSNumber *privateListeningEnabled;
  const __CFString *v10;
  const __CFString *v11;
  NSNumber *siriInitiated;
  const __CFString *v13;
  NSUInteger v14;
  NSArray *buildFeatures;
  void *v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p persistentID:%llu version:%lu\n"), v5, self, -[ICPlayActivityEvent persistentID](self, "persistentID"), self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("    eventType: %lu\n"), self->_eventType);
  if (self->_containerID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    containerID:'%@'\n"), self->_containerID);
  if (self->_containerIDs)
    objc_msgSend(v6, "appendFormat:", CFSTR("    containerIDs:'%@'\n"), self->_containerIDs);
  if (self->_containerType)
    objc_msgSend(v6, "appendFormat:", CFSTR("    containerType:%td\n"), self->_containerType);
  if (self->_continuityCameraUsed)
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  objc_msgSend(v6, "appendFormat:", CFSTR("    continuityCameraUsed:%@\n"), v7);
  if (self->_deviceName)
    objc_msgSend(v6, "appendFormat:", CFSTR("    deviceName:'%@'\n"), self->_deviceName);
  objc_msgSend(v6, "appendFormat:", CFSTR("    endReasonType:%td\n"), self->_endReasonType);
  if (self->_enqueuerProperties)
    objc_msgSend(v6, "appendFormat:", CFSTR("    enqueuerProperties:'%@'\n"), self->_enqueuerProperties);
  if (self->_eventDate)
    objc_msgSend(v6, "appendFormat:", CFSTR("    eventDate:%@\n"), self->_eventDate);
  if (self->_eventTimeZone)
    objc_msgSend(v6, "appendFormat:", CFSTR("    eventTimeZone:%@\n"), self->_eventTimeZone);
  if (self->_externalID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    externalID:'%@'\n"), self->_externalID);
  if (self->_featureName)
    objc_msgSend(v6, "appendFormat:", CFSTR("    featureName:'%@'\n"), self->_featureName);
  if (self->_householdID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    householdID:'%@'\n"), self->_householdID);
  if (self->_systemReleaseType)
    objc_msgSend(v6, "appendFormat:", CFSTR("    systemReleaseType: %li\n"), self->_systemReleaseType);
  objc_msgSend(v6, "appendFormat:", CFSTR("    itemDuration:%f\n    itemStartTime:%f  \n    itemEndTime:%f\n"), *(_QWORD *)&self->_itemDuration, *(_QWORD *)&self->_itemStartTime, *(_QWORD *)&self->_itemEndTime);
  objc_msgSend(v6, "appendFormat:", CFSTR("    itemType:%td\n"), self->_itemType);
  if (self->_itemIDs)
    objc_msgSend(v6, "appendFormat:", CFSTR("    itemIDs:'%@'\n"), self->_itemIDs);
  objc_msgSend(v6, "appendFormat:", CFSTR("    mediaType:%td\n"), self->_mediaType);
  if (self->_offline)
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  objc_msgSend(v6, "appendFormat:", CFSTR("    offline:%@\n"), v8);
  if (self->_personalizedContainerID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    personalizedContainerID:'%@'\n"), self->_personalizedContainerID);
  if (self->_queueGroupingID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    queueGroupingID:'%@'\n"), self->_queueGroupingID);
  if (self->_recommendationData)
    objc_msgSend(v6, "appendFormat:", CFSTR("    hasRecommendationData:true\n"));
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if (-[NSNumber BOOLValue](privateListeningEnabled, "BOOLValue"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v6, "appendFormat:", CFSTR("    privateListeningEnabled: %@\n"), v10);
  }
  if (self->_SBEnabled)
    v11 = CFSTR("true");
  else
    v11 = CFSTR("false");
  objc_msgSend(v6, "appendFormat:", CFSTR("    SBEnabled:%@\n"), v11);
  siriInitiated = self->_siriInitiated;
  if (siriInitiated)
  {
    if (-[NSNumber BOOLValue](siriInitiated, "BOOLValue"))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v6, "appendFormat:", CFSTR("    siriInitiated: %@\n"), v13);
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("    sourceType:%td\n"), self->_sourceType);
  objc_msgSend(v6, "appendFormat:", CFSTR("    storeAccountID:%llu\n"), self->_storeAccountID);
  objc_msgSend(v6, "appendFormat:", CFSTR("    storeFrontID:%@\n"), self->_storeFrontID);
  if (self->_storeID)
    objc_msgSend(v6, "appendFormat:", CFSTR("    storeID:'%@'\n"), self->_storeID);
  if (self->_requestingBundleIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("    requestingBundleIdentifier:'%@'\n"), self->_requestingBundleIdentifier);
  if (self->_requestingBundleVersion)
    objc_msgSend(v6, "appendFormat:", CFSTR("    requestingBundleVersion:'%@'\n"), self->_requestingBundleVersion);
  v14 = -[NSData length](self->_timedMetadata, "length");
  if (v14)
    objc_msgSend(v6, "appendFormat:", CFSTR("    timedMetadata(length):%td\n"), v14);
  if (self->_trackInfo)
    objc_msgSend(v6, "appendString:", CFSTR("    hasTrackInfo:true\n"));
  buildFeatures = self->_buildFeatures;
  if (buildFeatures)
  {
    -[NSArray msv_compactDescription](buildFeatures, "msv_compactDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("    buildFeatures:[%@]\n"), v16);

  }
  if (self->_autoPlayMode)
    objc_msgSend(v6, "appendFormat:", CFSTR("    autoPlayMode:%td\n"), self->_autoPlayMode);
  if (self->_repeatPlayMode)
    objc_msgSend(v6, "appendFormat:", CFSTR("    repeatPlayMode:%td\n"), self->_repeatPlayMode);
  if (self->_shufflePlayMode)
    objc_msgSend(v6, "appendFormat:", CFSTR("    shufflePlayMode:%td\n"), self->_shufflePlayMode);
  if (self->_audioQualityPreference)
    objc_msgSend(v6, "appendFormat:", CFSTR("    audioQualityPreference:%lu\n"), self->_audioQualityPreference);
  if (self->_playbackFormatPreference)
    objc_msgSend(v6, "appendFormat:", CFSTR("    playbackFormatPreference:%lu\n"), self->_playbackFormatPreference);
  if (self->_targetedAudioQuality)
    objc_msgSend(v6, "appendFormat:", CFSTR("    targetedAudioQuality:%@\n"), self->_targetedAudioQuality);
  if (self->_providedAudioQuality)
    objc_msgSend(v6, "appendFormat:", CFSTR("    providedAudioQuality:%@\n"), self->_providedAudioQuality);
  if (self->_sharedActivityGroupSizeCurrent)
    objc_msgSend(v6, "appendFormat:", CFSTR("    sharedActivityGroupSizeCurrent:%llu\n"), self->_sharedActivityGroupSizeCurrent);
  if (self->_sharedActivityGroupSizeMax)
    objc_msgSend(v6, "appendFormat:", CFSTR("    sharedActivityGroupSizeMax:%llu\n"), self->_sharedActivityGroupSizeMax);
  if (self->_sharedActivityType)
    objc_msgSend(v6, "appendFormat:", CFSTR("    sharedActivityType:%lu\n"), self->_sharedActivityType);
  if (self->_collaborativePlaylist)
    objc_msgSend(v6, "appendFormat:", CFSTR("    isCollaborativePlaylist:true\n"));
  if (self->_vocalAttenuationAvailability)
    objc_msgSend(v6, "appendFormat:", CFSTR("    vocalAttenuationAvailability:%lu\n"), self->_vocalAttenuationAvailability);
  if (self->_vocalAttenuationDuration != 0.0)
    objc_msgSend(v6, "appendFormat:", CFSTR("    vocalAttenuationDuration:%f\n"), *(_QWORD *)&self->_vocalAttenuationDuration);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v17 = v6;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  ICPlayActivityEvent *v4;
  int64_t v5;
  BOOL v6;

  v4 = (ICPlayActivityEvent *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ICPlayActivityEvent persistentID](self, "persistentID");
      v6 = v5 == -[ICPlayActivityEvent persistentID](v4, "persistentID");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  unint64_t autoPlayMode;
  NSArray *buildFeatures;
  NSArray *v7;
  NSArray *v8;
  int v9;
  unint64_t containerType;
  int continuityCameraUsed;
  NSString *deviceName;
  NSString *v13;
  NSString *v14;
  int v15;
  unint64_t displayType;
  unint64_t endReasonType;
  NSDate *eventDate;
  NSDate *v19;
  NSDate *v20;
  int v21;
  NSTimeZone *eventTimeZone;
  NSTimeZone *v23;
  NSTimeZone *v24;
  int v25;
  unint64_t eventType;
  NSString *externalID;
  NSString *v28;
  NSString *v29;
  int v30;
  NSString *featureName;
  NSString *v32;
  NSString *v33;
  int v34;
  NSString *householdID;
  NSString *v36;
  NSString *v37;
  int v38;
  double itemDuration;
  double v40;
  double itemEndTime;
  double v42;
  double itemStartTime;
  double v44;
  unint64_t itemType;
  unint64_t lyricsDisplayedCharacterCount;
  NSString *lyricsLanguage;
  NSString *v48;
  NSString *v49;
  int v50;
  unint64_t mediaType;
  int offline;
  int64_t persistentID;
  NSNumber *privateListeningEnabled;
  NSNumber *v55;
  NSNumber *v56;
  int v57;
  NSString *queueGroupingID;
  NSString *v59;
  NSString *v60;
  int v61;
  unint64_t reasonHintType;
  NSData *recommendationData;
  NSData *v64;
  NSData *v65;
  int v66;
  unint64_t repeatPlayMode;
  NSString *requestingBundleIdentifier;
  NSString *v69;
  NSString *v70;
  int v71;
  NSString *v72;
  NSString *v73;
  NSString *v74;
  int v75;
  NSString *requestingBundleVersion;
  NSString *v77;
  NSString *v78;
  int v79;
  int SBEnabled;
  NSNumber *siriInitiated;
  NSNumber *v82;
  NSNumber *v83;
  int v84;
  unint64_t shufflePlayMode;
  unint64_t sourceType;
  int64_t systemReleaseType;
  unint64_t storeAccountID;
  NSString *storeFrontID;
  NSString *v90;
  NSString *v91;
  int v92;
  NSData *timedMetadata;
  NSData *v94;
  NSData *v95;
  int v96;
  NSData *trackInfo;
  NSData *v98;
  NSData *v99;
  int v100;
  unint64_t audioQualityPreference;
  unint64_t playbackFormatPreference;
  unint64_t sharedActivityGroupSizeCurrent;
  unint64_t sharedActivityGroupSizeMax;
  int64_t sharedActivityType;
  int collaborativePlaylist;
  unint64_t vocalAttenuationAvailability;
  double vocalAttenuationDuration;
  double v109;
  BOOL v110;

  v4 = a3;
  if (!-[ICPlayActivityEvent isEqual:](self, "isEqual:", v4))
    goto LABEL_103;
  autoPlayMode = self->_autoPlayMode;
  if (autoPlayMode != objc_msgSend(v4, "autoPlayMode"))
    goto LABEL_103;
  buildFeatures = self->_buildFeatures;
  objc_msgSend(v4, "buildFeatures");
  v7 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  if (buildFeatures == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSArray isEqual:](buildFeatures, "isEqual:", v7);

    if (!v9)
      goto LABEL_103;
  }
  containerType = self->_containerType;
  if (containerType != objc_msgSend(v4, "containerType"))
    goto LABEL_103;
  continuityCameraUsed = self->_continuityCameraUsed;
  if (continuityCameraUsed != objc_msgSend(v4, "isContinuityCameraUsed"))
    goto LABEL_103;
  deviceName = self->_deviceName;
  objc_msgSend(v4, "deviceName");
  v13 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (deviceName == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = -[NSString isEqual:](deviceName, "isEqual:", v13);

    if (!v15)
      goto LABEL_103;
  }
  displayType = self->_displayType;
  if (displayType != objc_msgSend(v4, "displayType"))
    goto LABEL_103;
  endReasonType = self->_endReasonType;
  if (endReasonType != objc_msgSend(v4, "endReasonType"))
    goto LABEL_103;
  eventDate = self->_eventDate;
  objc_msgSend(v4, "eventDate");
  v19 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  if (eventDate == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = -[NSDate isEqual:](eventDate, "isEqual:", v19);

    if (!v21)
      goto LABEL_103;
  }
  eventTimeZone = self->_eventTimeZone;
  objc_msgSend(v4, "eventTimeZone");
  v23 = (NSTimeZone *)(id)objc_claimAutoreleasedReturnValue();
  if (eventTimeZone == v23)
  {

  }
  else
  {
    v24 = v23;
    v25 = -[NSTimeZone isEqual:](eventTimeZone, "isEqual:", v23);

    if (!v25)
      goto LABEL_103;
  }
  eventType = self->_eventType;
  if (eventType != objc_msgSend(v4, "eventType"))
    goto LABEL_103;
  externalID = self->_externalID;
  objc_msgSend(v4, "externalID");
  v28 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (externalID == v28)
  {

  }
  else
  {
    v29 = v28;
    v30 = -[NSString isEqual:](externalID, "isEqual:", v28);

    if (!v30)
      goto LABEL_103;
  }
  featureName = self->_featureName;
  objc_msgSend(v4, "featureName");
  v32 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (featureName == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = -[NSString isEqual:](featureName, "isEqual:", v32);

    if (!v34)
      goto LABEL_103;
  }
  householdID = self->_householdID;
  objc_msgSend(v4, "householdID");
  v36 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (householdID == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = -[NSString isEqual:](householdID, "isEqual:", v36);

    if (!v38)
      goto LABEL_103;
  }
  itemDuration = self->_itemDuration;
  objc_msgSend(v4, "itemDuration");
  if (itemDuration != v40)
    goto LABEL_103;
  itemEndTime = self->_itemEndTime;
  objc_msgSend(v4, "itemEndTime");
  if (itemEndTime != v42)
    goto LABEL_103;
  itemStartTime = self->_itemStartTime;
  objc_msgSend(v4, "itemStartTime");
  if (itemStartTime != v44)
    goto LABEL_103;
  itemType = self->_itemType;
  if (itemType != objc_msgSend(v4, "itemType"))
    goto LABEL_103;
  lyricsDisplayedCharacterCount = self->_lyricsDisplayedCharacterCount;
  if (lyricsDisplayedCharacterCount != objc_msgSend(v4, "lyricsDisplayedCharacterCount"))
    goto LABEL_103;
  lyricsLanguage = self->_lyricsLanguage;
  objc_msgSend(v4, "lyricsLanguage");
  v48 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (lyricsLanguage == v48)
  {

  }
  else
  {
    v49 = v48;
    v50 = -[NSString isEqual:](lyricsLanguage, "isEqual:", v48);

    if (!v50)
      goto LABEL_103;
  }
  mediaType = self->_mediaType;
  if (mediaType != objc_msgSend(v4, "mediaType"))
    goto LABEL_103;
  offline = self->_offline;
  if (offline != objc_msgSend(v4, "isOffline"))
    goto LABEL_103;
  persistentID = self->_persistentID;
  if (persistentID != objc_msgSend(v4, "persistentID"))
    goto LABEL_103;
  privateListeningEnabled = self->_privateListeningEnabled;
  objc_msgSend(v4, "isPrivateListeningEnabled");
  v55 = (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
  if (privateListeningEnabled == v55)
  {

  }
  else
  {
    v56 = v55;
    v57 = -[NSNumber isEqual:](privateListeningEnabled, "isEqual:", v55);

    if (!v57)
      goto LABEL_103;
  }
  queueGroupingID = self->_queueGroupingID;
  objc_msgSend(v4, "queueGroupingID");
  v59 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (queueGroupingID == v59)
  {

  }
  else
  {
    v60 = v59;
    v61 = -[NSString isEqual:](queueGroupingID, "isEqual:", v59);

    if (!v61)
      goto LABEL_103;
  }
  reasonHintType = self->_reasonHintType;
  if (reasonHintType != objc_msgSend(v4, "reasonHintType"))
    goto LABEL_103;
  recommendationData = self->_recommendationData;
  objc_msgSend(v4, "recommendationData");
  v64 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
  if (recommendationData == v64)
  {

  }
  else
  {
    v65 = v64;
    v66 = -[NSData isEqual:](recommendationData, "isEqual:", v64);

    if (!v66)
      goto LABEL_103;
  }
  repeatPlayMode = self->_repeatPlayMode;
  if (repeatPlayMode != objc_msgSend(v4, "repeatPlayMode"))
    goto LABEL_103;
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  objc_msgSend(v4, "requestingBundleIdentifier");
  v69 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (requestingBundleIdentifier == v69)
  {

  }
  else
  {
    v70 = v69;
    v71 = -[NSString isEqual:](requestingBundleIdentifier, "isEqual:", v69);

    if (!v71)
      goto LABEL_103;
  }
  v72 = self->_requestingBundleIdentifier;
  objc_msgSend(v4, "requestingBundleIdentifier");
  v73 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (v72 == v73)
  {

  }
  else
  {
    v74 = v73;
    v75 = -[NSString isEqual:](v72, "isEqual:", v73);

    if (!v75)
      goto LABEL_103;
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  objc_msgSend(v4, "requestingBundleVersion");
  v77 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (requestingBundleVersion == v77)
  {

  }
  else
  {
    v78 = v77;
    v79 = -[NSString isEqual:](requestingBundleVersion, "isEqual:", v77);

    if (!v79)
      goto LABEL_103;
  }
  SBEnabled = self->_SBEnabled;
  if (SBEnabled != objc_msgSend(v4, "isSBEnabled"))
  {
LABEL_103:
    v110 = 0;
    goto LABEL_104;
  }
  siriInitiated = self->_siriInitiated;
  objc_msgSend(v4, "isSiriInitiated");
  v82 = (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
  if (siriInitiated == v82)
  {

  }
  else
  {
    v83 = v82;
    v84 = -[NSNumber isEqual:](siriInitiated, "isEqual:", v82);

    if (!v84)
      goto LABEL_103;
  }
  shufflePlayMode = self->_shufflePlayMode;
  if (shufflePlayMode != objc_msgSend(v4, "shufflePlayMode"))
    goto LABEL_103;
  sourceType = self->_sourceType;
  if (sourceType != objc_msgSend(v4, "sourceType"))
    goto LABEL_103;
  systemReleaseType = self->_systemReleaseType;
  if (systemReleaseType != objc_msgSend(v4, "systemReleaseType"))
    goto LABEL_103;
  storeAccountID = self->_storeAccountID;
  if (storeAccountID != objc_msgSend(v4, "storeAccountID"))
    goto LABEL_103;
  storeFrontID = self->_storeFrontID;
  objc_msgSend(v4, "storeFrontID");
  v90 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (storeFrontID == v90)
  {

  }
  else
  {
    v91 = v90;
    v92 = -[NSString isEqual:](storeFrontID, "isEqual:", v90);

    if (!v92)
      goto LABEL_103;
  }
  timedMetadata = self->_timedMetadata;
  objc_msgSend(v4, "timedMetadata");
  v94 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
  if (timedMetadata == v94)
  {

  }
  else
  {
    v95 = v94;
    v96 = -[NSData isEqual:](timedMetadata, "isEqual:", v94);

    if (!v96)
      goto LABEL_103;
  }
  trackInfo = self->_trackInfo;
  objc_msgSend(v4, "trackInfo");
  v98 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
  if (trackInfo == v98)
  {

  }
  else
  {
    v99 = v98;
    v100 = -[NSData isEqual:](trackInfo, "isEqual:", v98);

    if (!v100)
      goto LABEL_103;
  }
  audioQualityPreference = self->_audioQualityPreference;
  if (audioQualityPreference != objc_msgSend(v4, "audioQualityPreference"))
    goto LABEL_103;
  playbackFormatPreference = self->_playbackFormatPreference;
  if (playbackFormatPreference != objc_msgSend(v4, "playbackFormatPreference"))
    goto LABEL_103;
  sharedActivityGroupSizeCurrent = self->_sharedActivityGroupSizeCurrent;
  if (sharedActivityGroupSizeCurrent != objc_msgSend(v4, "sharedActivityGroupSizeCurrent"))
    goto LABEL_103;
  sharedActivityGroupSizeMax = self->_sharedActivityGroupSizeMax;
  if (sharedActivityGroupSizeMax != objc_msgSend(v4, "sharedActivityGroupSizeMax"))
    goto LABEL_103;
  sharedActivityType = self->_sharedActivityType;
  if (sharedActivityType != objc_msgSend(v4, "sharedActivityType"))
    goto LABEL_103;
  collaborativePlaylist = self->_collaborativePlaylist;
  if (collaborativePlaylist != objc_msgSend(v4, "isCollaborativePlaylist"))
    goto LABEL_103;
  vocalAttenuationAvailability = self->_vocalAttenuationAvailability;
  if (vocalAttenuationAvailability != objc_msgSend(v4, "vocalAttenuationAvailability"))
    goto LABEL_103;
  vocalAttenuationDuration = self->_vocalAttenuationDuration;
  objc_msgSend(v4, "vocalAttenuationDuration");
  v110 = vocalAttenuationDuration == v109;
LABEL_104:

  return v110;
}

- (ICPlayActivityEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICPlayActivityEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ICPlayActivityEventCoderDataRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ICPlayActivityEvent initWithDataRepresentation:](self, "initWithDataRepresentation:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICPlayActivityEvent dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_ICPlayActivityEventCoderDataRepresentation"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_class *v5;
  uint64_t v6;

  v5 = -[ICPlayActivityEvent _mutableCopyClass](self, "_mutableCopyClass");
  v6 = -[objc_class init](-[objc_class allocWithZone:](v5, "allocWithZone:", a3), "init");

  if (v6)
  {
    *(_QWORD *)(v6 + 8) = self->_autoPlayMode;
    objc_storeStrong((id *)(v6 + 16), self->_buildFeatures);
    objc_storeStrong((id *)(v6 + 24), self->_buildVersion);
    objc_storeStrong((id *)(v6 + 32), self->_containerID);
    objc_storeStrong((id *)(v6 + 40), self->_containerIDs);
    *(_QWORD *)(v6 + 48) = self->_containerType;
    *(_BYTE *)(v6 + 56) = self->_continuityCameraUsed;
    objc_storeStrong((id *)(v6 + 64), self->_deviceName);
    *(_QWORD *)(v6 + 72) = self->_displayType;
    *(_QWORD *)(v6 + 80) = self->_endReasonType;
    objc_storeStrong((id *)(v6 + 88), self->_enqueuerProperties);
    objc_storeStrong((id *)(v6 + 96), self->_eventDate);
    objc_storeStrong((id *)(v6 + 104), self->_eventTimeZone);
    *(_QWORD *)(v6 + 112) = self->_eventType;
    objc_storeStrong((id *)(v6 + 120), self->_externalID);
    objc_storeStrong((id *)(v6 + 136), self->_householdID);
    objc_storeStrong((id *)(v6 + 128), self->_featureName);
    objc_storeStrong((id *)(v6 + 144), self->_itemIDs);
    *(double *)(v6 + 152) = self->_itemDuration;
    *(double *)(v6 + 160) = self->_itemEndTime;
    *(double *)(v6 + 168) = self->_itemStartTime;
    *(_QWORD *)(v6 + 176) = self->_itemType;
    *(_QWORD *)(v6 + 184) = self->_lyricsDisplayedCharacterCount;
    objc_storeStrong((id *)(v6 + 192), self->_lyricsLanguage);
    *(_QWORD *)(v6 + 200) = self->_mediaType;
    *(_BYTE *)(v6 + 208) = self->_offline;
    *(_QWORD *)(v6 + 216) = self->_persistentID;
    objc_storeStrong((id *)(v6 + 224), self->_personalizedContainerID);
    objc_storeStrong((id *)(v6 + 232), self->_privateListeningEnabled);
    objc_storeStrong((id *)(v6 + 240), self->_queueGroupingID);
    *(_QWORD *)(v6 + 248) = self->_reasonHintType;
    objc_storeStrong((id *)(v6 + 256), self->_recommendationData);
    *(_QWORD *)(v6 + 264) = self->_repeatPlayMode;
    objc_storeStrong((id *)(v6 + 272), self->_requestingBundleIdentifier);
    objc_storeStrong((id *)(v6 + 280), self->_requestingBundleVersion);
    *(_BYTE *)(v6 + 288) = self->_SBEnabled;
    *(_QWORD *)(v6 + 296) = self->_shufflePlayMode;
    objc_storeStrong((id *)(v6 + 304), self->_siriInitiated);
    *(_QWORD *)(v6 + 312) = self->_sourceType;
    *(_QWORD *)(v6 + 328) = self->_storeAccountID;
    objc_storeStrong((id *)(v6 + 336), self->_storeFrontID);
    objc_storeStrong((id *)(v6 + 344), self->_storeID);
    *(_QWORD *)(v6 + 320) = self->_systemReleaseType;
    objc_storeStrong((id *)(v6 + 352), self->_timedMetadata);
    objc_storeStrong((id *)(v6 + 360), self->_trackInfo);
    *(_QWORD *)(v6 + 368) = self->_version;
    *(_QWORD *)(v6 + 376) = self->_audioQualityPreference;
    *(_QWORD *)(v6 + 384) = self->_playbackFormatPreference;
    objc_storeStrong((id *)(v6 + 392), self->_targetedAudioQuality);
    objc_storeStrong((id *)(v6 + 400), self->_providedAudioQuality);
    *(_QWORD *)(v6 + 408) = self->_sharedActivityGroupSizeCurrent;
    *(_QWORD *)(v6 + 416) = self->_sharedActivityGroupSizeMax;
    *(_QWORD *)(v6 + 424) = self->_sharedActivityType;
    *(_BYTE *)(v6 + 432) = self->_collaborativePlaylist;
    *(_QWORD *)(v6 + 440) = self->_vocalAttenuationAvailability;
    *(double *)(v6 + 448) = self->_vocalAttenuationDuration;
  }
  return (id)v6;
}

- (NSData)dataRepresentation
{
  ICPAPlayActivityEvent *v3;
  unint64_t v4;
  int v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  int v22;
  _BOOL4 v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL SBEnabled;
  unint64_t v32;
  int v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int64_t v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  int v46;
  BOOL v47;
  unint64_t v48;
  int v49;
  double v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  int v54;
  void *v55;
  ICPAAudioQualityDictionary *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unsigned int v60;
  uint64_t v61;
  char v62;
  ICPAAudioQualityDictionary *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  unsigned int v67;
  uint64_t v68;
  char v69;
  ICPAPlayActivityEnqueuerProperties *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  int v82;
  char v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  ICPAPlayModeDictionary *v96;
  ICPAPlayModeDictionary *v97;
  void *storeID;
  unint64_t v99;
  int v100;
  unint64_t v101;
  int v102;
  unint64_t v103;
  int v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  unint64_t v110;
  int v111;
  _BOOL4 v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;

  v3 = objc_alloc_init(ICPAPlayActivityEvent);
  v4 = -[ICPlayActivityEvent containerType](self, "containerType");
  if (v4 - 1 > 3)
    v5 = 0;
  else
    v5 = dword_1A06E75F0[v4 - 1];
  if (v3)
  {
    *(_QWORD *)&v3->_has |= 0x800000uLL;
    v3->_containerType = v5;
    v6 = -[ICPlayActivityEvent isContinuityCameraUsed](self, "isContinuityCameraUsed");
    *(_QWORD *)&v3->_has |= 0x800000000uLL;
    v3->_continuityCameraUsed = v6;
    -[ICPlayActivityEvent deviceName](self, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_deviceName, v7);

    v8 = -[ICPlayActivityEvent displayType](self, "displayType");
    if (v8 - 1 < 3)
      v9 = v8;
    else
      v9 = 0;
    *(_QWORD *)&v3->_has |= 0x1000000uLL;
    v3->_displayType = v9;
  }
  else
  {
    -[ICPlayActivityEvent isContinuityCameraUsed](self, "isContinuityCameraUsed");
    -[ICPlayActivityEvent deviceName](self, "deviceName");

    -[ICPlayActivityEvent displayType](self, "displayType");
  }
  v10 = -[ICPlayActivityEvent endReasonType](self, "endReasonType");
  if (v10 - 1 > 0xE)
    v11 = 0;
  else
    v11 = dword_1A06E7548[v10 - 1];
  if (v3)
  {
    *(_QWORD *)&v3->_has |= 0x2000000uLL;
    v3->_endReasonType = v11;
  }
  -[ICPlayActivityEvent eventDate](self, "eventDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  if (v3)
  {
    *(_QWORD *)&v3->_has |= 0x10uLL;
    v3->_eventDateTimestamp = v13;
  }

  -[ICPlayActivityEvent eventTimeZone](self, "eventTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_eventTimeZoneName, v15);

  -[ICPlayActivityEvent featureName](self, "featureName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_featureName, v16);

    -[ICPlayActivityEvent itemDuration](self, "itemDuration");
    *(_QWORD *)&v3->_has |= 0x80uLL;
    v3->_itemDuration = v18;
    -[ICPlayActivityEvent itemEndTime](self, "itemEndTime");
    *(_QWORD *)&v3->_has |= 0x100uLL;
    v3->_itemEndTime = v19;
    -[ICPlayActivityEvent itemStartTime](self, "itemStartTime");
    *(_QWORD *)&v3->_has |= 0x200uLL;
    v3->_itemStartTime = v20;
    v21 = -[ICPlayActivityEvent itemType](self, "itemType");
    if (v21 - 1 < 9)
      v22 = v21;
    else
      v22 = 0;
    *(_QWORD *)&v3->_has |= 0x8000000uLL;
    v3->_itemType = v22;
    v23 = -[ICPlayActivityEvent mediaType](self, "mediaType") == 1;
    *(_QWORD *)&v3->_has |= 0x10000000uLL;
    v3->_mediaType = v23;
    v24 = -[ICPlayActivityEvent lyricsDisplayedCharacterCount](self, "lyricsDisplayedCharacterCount");
    *(_QWORD *)&v3->_has |= 1uLL;
    v3->_characterDisplayedCount = v24;
    -[ICPlayActivityEvent lyricsLanguage](self, "lyricsLanguage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_lyricLanguage, v25);

    v26 = -[ICPlayActivityEvent isOffline](self, "isOffline");
    *(_QWORD *)&v3->_has |= 0x4000000000uLL;
    v3->_offline = v26;
    v27 = -[ICPlayActivityEvent persistentID](self, "persistentID");
    *(_QWORD *)&v3->_has |= 0x400uLL;
    v3->_persistentID = v27;
    -[ICPlayActivityEvent queueGroupingID](self, "queueGroupingID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_queueGroupingID, v28);
  }
  else
  {

    -[ICPlayActivityEvent itemDuration](self, "itemDuration");
    -[ICPlayActivityEvent itemEndTime](self, "itemEndTime");
    -[ICPlayActivityEvent itemStartTime](self, "itemStartTime");
    -[ICPlayActivityEvent itemType](self, "itemType");
    -[ICPlayActivityEvent mediaType](self, "mediaType");
    -[ICPlayActivityEvent lyricsDisplayedCharacterCount](self, "lyricsDisplayedCharacterCount");
    -[ICPlayActivityEvent lyricsLanguage](self, "lyricsLanguage");

    -[ICPlayActivityEvent isOffline](self, "isOffline");
    -[ICPlayActivityEvent persistentID](self, "persistentID");
    -[ICPlayActivityEvent queueGroupingID](self, "queueGroupingID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[ICPlayActivityEvent recommendationData](self, "recommendationData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_recommendationData, v29);

    SBEnabled = self->_SBEnabled;
    *(_QWORD *)&v3->_has |= 0x10000000000uLL;
    v3->_sBEnabled = SBEnabled;
    v32 = -[ICPlayActivityEvent sourceType](self, "sourceType");
    v33 = v32 == 1;
    if (v32 == 2)
      v33 = 2;
    *(_QWORD *)&v3->_has |= 0x100000000uLL;
    v3->_sourceType = v33;
    v34 = -[ICPlayActivityEvent storeAccountID](self, "storeAccountID");
    *(_QWORD *)&v3->_has |= 0x20000uLL;
    v3->_storeAccountID = v34;
    -[ICPlayActivityEvent storeFrontID](self, "storeFrontID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_storeFrontID, v35);
  }
  else
  {

    -[ICPlayActivityEvent sourceType](self, "sourceType");
    -[ICPlayActivityEvent storeAccountID](self, "storeAccountID");
    -[ICPlayActivityEvent storeFrontID](self, "storeFrontID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[ICPlayActivityEvent timedMetadata](self, "timedMetadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_timedMetadata, v36);

  -[ICPlayActivityEvent trackInfo](self, "trackInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_trackInfo, v37);

  -[ICPlayActivityEvent requestingBundleIdentifier](self, "requestingBundleIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_requestingBundleIdentifier, v38);

  -[ICPlayActivityEvent requestingBundleVersion](self, "requestingBundleVersion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_requestingBundleVersion, v39);

    v41 = -[ICPlayActivityEvent systemReleaseType](self, "systemReleaseType");
    if ((unint64_t)(v41 - 1) < 4)
      v42 = v41;
    else
      v42 = 0;
    *(_QWORD *)&v3->_has |= 0x200000000uLL;
    v3->_systemReleaseType = v42;
    v43 = -[ICPlayActivityEvent sharedActivityGroupSizeCurrent](self, "sharedActivityGroupSizeCurrent");
    *(_QWORD *)&v3->_has |= 0x4000uLL;
    v3->_sharedActivityGroupSizeCurrent = v43;
    v44 = -[ICPlayActivityEvent sharedActivityGroupSizeMax](self, "sharedActivityGroupSizeMax");
    *(_QWORD *)&v3->_has |= 0x8000uLL;
    v3->_sharedActivityGroupSizeMax = v44;
  }
  else
  {

    -[ICPlayActivityEvent systemReleaseType](self, "systemReleaseType");
    -[ICPlayActivityEvent sharedActivityGroupSizeCurrent](self, "sharedActivityGroupSizeCurrent");
    -[ICPlayActivityEvent sharedActivityGroupSizeMax](self, "sharedActivityGroupSizeMax");
  }
  v45 = -[ICPlayActivityEvent sharedActivityType](self, "sharedActivityType");
  if ((unint64_t)(v45 - 1) > 5)
    v46 = 0;
  else
    v46 = dword_1A06E7530[v45 - 1];
  if (v3)
  {
    *(_QWORD *)&v3->_has |= 0x80000000uLL;
    v3->_sharedActivityType = v46;
    v47 = -[ICPlayActivityEvent isCollaborativePlaylist](self, "isCollaborativePlaylist");
    *(_QWORD *)&v3->_has |= 0x2000000000uLL;
    v3->_isCollaborativePlaylist = v47;
    v48 = -[ICPlayActivityEvent vocalAttenuationAvailability](self, "vocalAttenuationAvailability");
    v49 = v48 == 1;
    if (v48 == 2)
      v49 = 2;
    *(_QWORD *)&v3->_has |= 0x400000000uLL;
    v3->_vocalAttenuationAvailibility = v49;
    -[ICPlayActivityEvent vocalAttenuationDuration](self, "vocalAttenuationDuration");
    *(_QWORD *)&v3->_has |= 0x200000uLL;
    v3->_vocalAttenuationDuration = v50;
    v51 = -[ICPlayActivityEvent audioQualityPreference](self, "audioQualityPreference");
    if (v51 - 1 < 4)
      v52 = v51;
    else
      v52 = 0;
    *(_QWORD *)&v3->_has |= 0x400000uLL;
    v3->_audioQualityPreference = v52;
    v53 = -[ICPlayActivityEvent playbackFormatPreference](self, "playbackFormatPreference");
    v54 = v53 == 1;
    if (v53 == 2)
      v54 = 2;
    *(_QWORD *)&v3->_has |= 0x20000000uLL;
    v3->_playbackFormatPreference = v54;
  }
  else
  {
    -[ICPlayActivityEvent isCollaborativePlaylist](self, "isCollaborativePlaylist");
    -[ICPlayActivityEvent vocalAttenuationAvailability](self, "vocalAttenuationAvailability");
    -[ICPlayActivityEvent vocalAttenuationDuration](self, "vocalAttenuationDuration");
    -[ICPlayActivityEvent audioQualityPreference](self, "audioQualityPreference");
    -[ICPlayActivityEvent playbackFormatPreference](self, "playbackFormatPreference");
  }
  -[ICPlayActivityEvent targetedAudioQuality](self, "targetedAudioQuality");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v55;
  if (v55)
  {
    v56 = objc_alloc_init(ICPAAudioQualityDictionary);
    v57 = objc_msgSend(v55, "bitDepth");
    if (v56)
    {
      *(_BYTE *)&v56->_has |= 1u;
      v56->_bitDepth = v57;
      v58 = objc_msgSend(v55, "bitRate");
      *(_BYTE *)&v56->_has |= 2u;
      v56->_bitRate = v58;
    }
    else
    {
      objc_msgSend(v55, "bitRate");
    }
    objc_msgSend(v55, "channelLayoutDescription");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPAAudioQualityDictionary setChannelLayoutDescription:]((uint64_t)v56, v59);

    v55 = v135;
    v60 = objc_msgSend(v135, "codec");
    if (v56)
    {
      *(_BYTE *)&v56->_has |= 8u;
      v56->_codec = v60;
      v61 = objc_msgSend(v135, "sampleRate");
      *(_BYTE *)&v56->_has |= 4u;
      v56->_sampleRate = v61;
      v62 = objc_msgSend(v135, "isSpatialized");
      *(_BYTE *)&v56->_has |= 0x10u;
      v56->_isSpatialized = v62;
      if (!v3)
      {
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {
      objc_msgSend(v135, "sampleRate");
      objc_msgSend(v135, "isSpatialized");
      if (!v3)
        goto LABEL_56;
    }
    objc_storeStrong((id *)&v3->_targetedAudioQuality, v56);
    goto LABEL_56;
  }
LABEL_57:
  -[ICPlayActivityEvent providedAudioQuality](self, "providedAudioQuality");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v63 = objc_alloc_init(ICPAAudioQualityDictionary);
    v64 = objc_msgSend(v133, "bitDepth");
    if (v63)
    {
      *(_BYTE *)&v63->_has |= 1u;
      v63->_bitDepth = v64;
      v65 = objc_msgSend(v133, "bitRate");
      *(_BYTE *)&v63->_has |= 2u;
      v63->_bitRate = v65;
    }
    else
    {
      objc_msgSend(v133, "bitRate");
    }
    objc_msgSend(v133, "channelLayoutDescription");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPAAudioQualityDictionary setChannelLayoutDescription:]((uint64_t)v63, v66);

    v67 = objc_msgSend(v133, "codec");
    if (v63)
    {
      *(_BYTE *)&v63->_has |= 8u;
      v63->_codec = v67;
      v68 = objc_msgSend(v133, "sampleRate");
      *(_BYTE *)&v63->_has |= 4u;
      v63->_sampleRate = v68;
      v69 = objc_msgSend(v133, "isSpatialized");
      *(_BYTE *)&v63->_has |= 0x10u;
      v63->_isSpatialized = v69;
    }
    else
    {
      objc_msgSend(v133, "sampleRate");
      objc_msgSend(v133, "isSpatialized");
    }
    v55 = v135;
    if (v3)
      objc_storeStrong((id *)&v3->_providedAudioQuality, v63);

  }
  -[ICPlayActivityEvent enqueuerProperties](self, "enqueuerProperties");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v134)
  {
    v70 = objc_alloc_init(ICPAPlayActivityEnqueuerProperties);
    v71 = v134;
    objc_msgSend(v134, "buildVersion");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72 && v70)
      objc_storeStrong((id *)&v70->_buildVersion, v72);
    objc_msgSend(v134, "deviceGUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73 && v70)
      objc_storeStrong((id *)&v70->_deviceGUID, v73);
    objc_msgSend(v134, "deviceName");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74 && v70)
      objc_storeStrong((id *)&v70->_deviceName, v74);
    objc_msgSend(v134, "isPrivateListeningEnabled", v72);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v75)
    {
      v77 = objc_msgSend(v75, "BOOLValue");
      if (v70)
      {
        *(_BYTE *)&v70->_has |= 4u;
        v70->_privateListeningEnabled = v77;
      }
    }
    objc_msgSend(v134, "timeZone");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78;
    if (v78)
    {
      objc_msgSend(v78, "name");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
        objc_storeStrong((id *)&v70->_timeZoneName, v80);

      v71 = v134;
    }
    v81 = objc_msgSend(v71, "systemReleaseType");
    if (v70)
    {
      if ((unint64_t)(v81 - 1) < 4)
        v82 = v81;
      else
        v82 = 0;
      *(_BYTE *)&v70->_has |= 2u;
      v70->_systemReleaseType = v82;
      v83 = objc_msgSend(v71, "isSBEnabled");
      *(_BYTE *)&v70->_has |= 8u;
      v70->_sBEnabled = v83;
      v84 = objc_msgSend(v71, "storeAccountID");
      if (v84)
      {
        *(_BYTE *)&v70->_has |= 1u;
        v70->_storeAccountID = v84;
      }
    }
    else
    {
      objc_msgSend(v71, "isSBEnabled");
      objc_msgSend(v71, "storeAccountID");
    }
    objc_msgSend(v71, "storeFrontID");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85 && v70)
      objc_storeStrong((id *)&v70->_storeFrontID, v85);
    if (v3)
      objc_storeStrong((id *)&v3->_enqueuerProperties, v70);

    v55 = v135;
  }
  -[ICPlayActivityEvent householdID](self, "householdID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_householdID, v86);

  -[ICPlayActivityEvent isPrivateListeningEnabled](self, "isPrivateListeningEnabled");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    v89 = objc_msgSend(v87, "BOOLValue");
    if (v3)
    {
      *(_QWORD *)&v3->_has |= 0x8000000000uLL;
      v3->_privateListeningEnabled = v89;
    }
  }
  -[ICPlayActivityEvent isSiriInitiated](self, "isSiriInitiated");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    v92 = objc_msgSend(v90, "BOOLValue");
    if (v3)
    {
      *(_QWORD *)&v3->_has |= 0x20000000000uLL;
      v3->_siriInitiated = v92;
    }
  }
  if (self->_version > 1)
  {
    v97 = objc_alloc_init(ICPAPlayModeDictionary);
    v99 = -[ICPlayActivityEvent autoPlayMode](self, "autoPlayMode");
    if (v97)
    {
      if (v99 - 1 < 3)
        v100 = v99;
      else
        v100 = 0;
      *(_BYTE *)&v97->_has |= 1u;
      v97->_autoPlayMode = v100;
      v101 = -[ICPlayActivityEvent repeatPlayMode](self, "repeatPlayMode");
      if (v101 - 1 < 3)
        v102 = v101;
      else
        v102 = 0;
      *(_BYTE *)&v97->_has |= 2u;
      v97->_repeatPlayMode = v102;
      v103 = -[ICPlayActivityEvent shufflePlayMode](self, "shufflePlayMode");
      v104 = v103 == 1;
      if (v103 == 2)
        v104 = 2;
      *(_BYTE *)&v97->_has |= 4u;
      v97->_shufflePlayMode = v104;
      if (!v3)
        goto LABEL_122;
    }
    else
    {
      -[ICPlayActivityEvent repeatPlayMode](self, "repeatPlayMode");
      -[ICPlayActivityEvent shufflePlayMode](self, "shufflePlayMode");
      if (!v3)
        goto LABEL_122;
    }
    objc_storeStrong((id *)&v3->_playMode, v97);
LABEL_122:
    v105 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[ICPlayActivityEvent buildFeatures](self, "buildFeatures");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v105, "initWithArray:", v106);
    if (v3)
      objc_storeStrong((id *)&v3->_buildFeatures, v107);

    -[ICPlayActivityEvent buildVersion](self, "buildVersion");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_buildVersion, v108);

      v110 = -[ICPlayActivityEvent eventType](self, "eventType");
      if (v110 == 1)
        v111 = 2;
      else
        v111 = 1;
      if (v110 == 2)
        v111 = 3;
      *(_QWORD *)&v3->_has |= 0x4000000uLL;
      v3->_eventType = v111;
      v112 = -[ICPlayActivityEvent reasonHintType](self, "reasonHintType") == 1;
      *(_QWORD *)&v3->_has |= 0x40000000uLL;
      v3->_reasonHintType = v112;
    }
    else
    {

      -[ICPlayActivityEvent eventType](self, "eventType");
      -[ICPlayActivityEvent reasonHintType](self, "reasonHintType");
    }
    v55 = v135;
    -[ICPlayActivityEvent containerIDs](self, "containerIDs");
    storeID = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(storeID, "adamID");
    if (v3)
    {
      *(_QWORD *)&v3->_has |= 4uLL;
      v3->_containerAdamID = v113;
      objc_msgSend(storeID, "globalPlaylistID");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v3->_globalPlaylistID, v114);
    }
    else
    {
      objc_msgSend(storeID, "globalPlaylistID");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(storeID, "playlistVersionHash");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&v3->_playlistVersionHash, v115);

    objc_msgSend(storeID, "stationHash");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&v3->_stationHash, v116);

    objc_msgSend(storeID, "stationStringID");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v117;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_stationStringID, v117);

      v119 = objc_msgSend(storeID, "stationID");
      *(_QWORD *)&v3->_has |= 0x10000uLL;
      v3->_stationID = v119;
      objc_msgSend(storeID, "cloudAlbumID");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v3->_cloudAlbumID, v120);

      v121 = objc_msgSend(storeID, "cloudPlaylistID");
      *(_QWORD *)&v3->_has |= 2uLL;
      v3->_cloudPlaylistID = v121;
    }
    else
    {

      objc_msgSend(storeID, "stationID");
      objc_msgSend(storeID, "cloudAlbumID");

      objc_msgSend(storeID, "cloudPlaylistID");
    }
    -[ICPlayActivityEvent itemIDs](self, "itemIDs");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "subscriptionAdamID");
    if (v3)
    {
      *(_QWORD *)&v3->_has |= 0x40000uLL;
      v3->_subscriptionAdamID = v123;
      v124 = objc_msgSend(v122, "purchasedAdamID");
      *(_QWORD *)&v3->_has |= 0x800uLL;
      v3->_purchasedAdamID = v124;
      v125 = objc_msgSend(v122, "radioAdamID");
      *(_QWORD *)&v3->_has |= 0x1000uLL;
      v3->_radioAdamID = v125;
      v126 = objc_msgSend(v122, "cloudID");
      *(_QWORD *)&v3->_has |= 0x40uLL;
      v3->_itemCloudID = v126;
      objc_msgSend(v122, "lyricsID");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v3->_lyricsID, v127);

      v128 = objc_msgSend(v122, "equivalencySourceAdamID");
      *(_QWORD *)&v3->_has |= 8uLL;
      v3->_equivalencySourceAdamID = v128;
      v129 = objc_msgSend(v122, "reportingAdamID");
      *(_QWORD *)&v3->_has |= 0x2000uLL;
      v3->_reportingAdamID = v129;
    }
    else
    {
      objc_msgSend(v122, "purchasedAdamID");
      objc_msgSend(v122, "radioAdamID");
      objc_msgSend(v122, "cloudID");
      objc_msgSend(v122, "lyricsID");

      objc_msgSend(v122, "equivalencySourceAdamID");
      objc_msgSend(v122, "reportingAdamID");
    }

    goto LABEL_142;
  }
  -[ICPlayActivityEvent containerID](self, "containerID");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_containerID, v93);

  -[ICPlayActivityEvent externalID](self, "externalID");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_externalID, v94);

  -[ICPlayActivityEvent personalizedContainerID](self, "personalizedContainerID");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_personalizedContainerID, v95);

  -[ICPlayActivityEvent storeID](self, "storeID");
  v96 = (ICPAPlayModeDictionary *)objc_claimAutoreleasedReturnValue();
  v97 = v96;
  if (v3)
  {
    v97 = v96;
    storeID = v3->_storeID;
    v3->_storeID = (NSString *)&v97->super.super.isa;
LABEL_142:

  }
  -[ICPAPlayActivityEvent data](v3, "data");
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v130;
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

- (unint64_t)autoPlayMode
{
  return self->_autoPlayMode;
}

- (NSArray)buildFeatures
{
  return self->_buildFeatures;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (ICPlayActivityEventContainerIDs)containerIDs
{
  return self->_containerIDs;
}

- (unint64_t)containerType
{
  return self->_containerType;
}

- (BOOL)isContinuityCameraUsed
{
  return self->_continuityCameraUsed;
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

- (ICPlayActivityEnqueuerProperties)enqueuerProperties
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

- (ICPlayActivityEventItemIDs)itemIDs
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

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (unint64_t)reasonHintType
{
  return self->_reasonHintType;
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (unint64_t)repeatPlayMode
{
  return self->_repeatPlayMode;
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

- (unint64_t)shufflePlayMode
{
  return self->_shufflePlayMode;
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

- (unint64_t)audioQualityPreference
{
  return self->_audioQualityPreference;
}

- (unint64_t)playbackFormatPreference
{
  return self->_playbackFormatPreference;
}

- (ICPlayActivityAudioQualityProperties)targetedAudioQuality
{
  return self->_targetedAudioQuality;
}

- (ICPlayActivityAudioQualityProperties)providedAudioQuality
{
  return self->_providedAudioQuality;
}

- (unint64_t)sharedActivityGroupSizeCurrent
{
  return self->_sharedActivityGroupSizeCurrent;
}

- (unint64_t)sharedActivityGroupSizeMax
{
  return self->_sharedActivityGroupSizeMax;
}

- (int64_t)sharedActivityType
{
  return self->_sharedActivityType;
}

- (BOOL)isCollaborativePlaylist
{
  return self->_collaborativePlaylist;
}

- (unint64_t)vocalAttenuationAvailability
{
  return self->_vocalAttenuationAvailability;
}

- (void)setVocalAttenuationAvailability:(unint64_t)a3
{
  self->_vocalAttenuationAvailability = a3;
}

- (double)vocalAttenuationDuration
{
  return self->_vocalAttenuationDuration;
}

- (void)setVocalAttenuationDuration:(double)a3
{
  self->_vocalAttenuationDuration = a3;
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
  objc_storeStrong((id *)&self->_providedAudioQuality, 0);
  objc_storeStrong((id *)&self->_targetedAudioQuality, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
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
  objc_storeStrong((id *)&self->_buildFeatures, 0);
}

void __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke(uint64_t a1)
{
  ICMutablePlayActivityEventContainerIDs *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(ICMutablePlayActivityEventContainerIDs);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke_2(uint64_t a1)
{
  ICMutablePlayActivityEventItemIDs *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(ICMutablePlayActivityEventItemIDs);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
