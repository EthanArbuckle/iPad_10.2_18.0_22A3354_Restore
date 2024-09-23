@implementation SSVPlayActivityFeedSerialization

+ (id)defaultOverrideHTTPHeaderFields
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("X-Guid");
  v3[1] = CFSTR("User-Agent");
  v3[2] = CFSTR("X-Dsid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyListObjectWithPlayActivityEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  double v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  _BOOL8 v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  SSVPlayActivityFeedSerialization *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v35 = 0;
    goto LABEL_135;
  }
  v6 = objc_msgSend(v4, "eventType");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  objc_msgSend(v5, "enqueuerProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v9;
  v123 = v8;
  if (v8)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = objc_msgSend(v8, "isSBEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("sb-enabled"));

    objc_msgSend(v8, "deviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("device-name"));
    v119 = v15;
    v124 = v11;
    objc_msgSend(v8, "storeFrontID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("store-front"));
    v121 = self;
    objc_msgSend(v8, "timeZone");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v117, "secondsFromGMT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("utc-offset-in-seconds"));

    objc_msgSend(v8, "buildVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
      objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("build-version"));
    objc_msgSend(v8, "deviceGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("guid"));
    objc_msgSend(v8, "isPrivateListeningEnabled");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v12, "setObject:forKey:", v21, CFSTR("private-enabled"));
    if (objc_msgSend(v8, "systemReleaseType") == 4)
      objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("internal-build"));
    v22 = objc_msgSend(v8, "storeAccountID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("dsid"));

    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("enqueuer"));
    v10 = v124;
    self = v121;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isSBEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v24, CFSTR("sb-enabled"));

  objc_msgSend(v5, "deviceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
    objc_msgSend(v10, "setObject:forKey:", v25, CFSTR("device-name"));
  objc_msgSend(v5, "storeFrontID");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    v26 = self->_currentStoreFrontID;
  if (-[NSString length](v26, "length"))
    objc_msgSend(v10, "setObject:forKey:", v26, CFSTR("store-front"));
  objc_msgSend(v5, "eventTimeZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "secondsFromGMT"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v28, CFSTR("utc-offset-in-seconds"));

  objc_msgSend(v5, "buildVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
    objc_msgSend(v10, "setObject:forKey:", v29, CFSTR("build-version"));
  v30 = v6;
  if (objc_msgSend(v5, "systemReleaseType") == 4)
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("internal-build"));
  objc_msgSend(v5, "isPrivateListeningEnabled");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v10, "setObject:forKey:", v31, CFSTR("private-enabled"));

  if (v123 && v10 != v9)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("player"));
  v32 = objc_msgSend(v5, "containerType");
  v33 = v30;
  v125 = v10;
  v112 = v32;
  if ((unint64_t)(v32 - 1) > 3)
    v34 = 0;
  else
    v34 = qword_1A27A0E10[v32 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v36, CFSTR("container-type"));

  if (v30 != 1)
  {
    objc_msgSend(v5, "itemEndTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(v37 * 1000.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v38, CFSTR("end-position-in-milliseconds"));

    if (v30 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "displayType"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v41, CFSTR("display-type"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "lyricsDisplayedCharacterCount"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v42, CFSTR("character-displayed-count"));

      objc_msgSend(v5, "lyricsLanguage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v43, "length"))
      {
LABEL_45:

        goto LABEL_46;
      }
      v44 = CFSTR("lyric-language");
    }
    else
    {
      if (v30)
        goto LABEL_46;
      v39 = objc_msgSend(v5, "endReasonType") - 1;
      if (v39 > 0xD)
        v40 = 0;
      else
        v40 = qword_1A27A0E30[v39];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("end-reason-type");
    }
    objc_msgSend(v9, "setObject:forKey:", v43, v44);
    goto LABEL_45;
  }
LABEL_46:
  objc_msgSend(v5, "featureName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "length"))
    objc_msgSend(v9, "setObject:forKey:", v45, CFSTR("feature-name"));
  objc_msgSend(v5, "itemDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(v46 * 1000.0));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v47, CFSTR("media-duration-in-milliseconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "mediaType") == 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v48, CFSTR("media-type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isOffline"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v49, CFSTR("offline"));

  v50 = objc_msgSend(v5, "persistentID");
  if (v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v51, CFSTR("persistent-id"));

  }
  objc_msgSend(v5, "eventDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v52)
  {
    objc_msgSend(v52, "timeIntervalSinceNow");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(v54 * -1000.0) & ~((uint64_t)(v54 * -1000.0) >> 63));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v55, CFSTR("milliseconds-since-play"));

  }
  objc_msgSend(v5, "recommendationData");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
    objc_msgSend(v9, "setObject:forKey:", v56, CFSTR("reco-data"));
  v57 = objc_msgSend(v5, "sourceType");
  if (v57 == 2)
    v58 = 7;
  else
    v58 = v57 == 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v59, CFSTR("source-type"));

  objc_msgSend(v5, "itemStartTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(v60 * 1000.0));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v61, CFSTR("start-position-in-milliseconds"));

  objc_msgSend(v5, "timedMetadata");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v62, "length"))
    objc_msgSend(v9, "setObject:forKey:", v62, CFSTR("timed-metadata"));
  objc_msgSend(v5, "trackInfo");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v122, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v122, 0, 0, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      objc_msgSend(v9, "setObject:forKey:", v63, CFSTR("track-info"));

  }
  v118 = v62;
  v64 = objc_msgSend(v5, "itemType");
  v65 = v33;
  if ((unint64_t)(v64 - 1) > 8)
    v66 = 0;
  else
    v66 = qword_1A27A0EA0[v64 - 1];
  v67 = v45;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v68, CFSTR("type"));

  objc_msgSend(v5, "requestingBundleIdentifier");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
    objc_msgSend(v9, "setObject:forKey:", v69, CFSTR("bundle-id"));
  objc_msgSend(v5, "requestingBundleVersion");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
    objc_msgSend(v9, "setObject:forKey:", v70, CFSTR("bundle-version"));
  v115 = (void *)v70;
  objc_msgSend(v5, "householdID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v71, "length"))
    objc_msgSend(v9, "setObject:forKey:", v71, CFSTR("household-id"));
  v114 = v71;
  objc_msgSend(v5, "isSiriInitiated");
  v72 = v67;
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
    objc_msgSend(v9, "setObject:forKey:", v73, CFSTR("siri-initiated"));
  v120 = (void *)v56;
  v116 = (void *)v69;
  v113 = (void *)v73;
  if (objc_msgSend(v5, "version") > 1)
  {
    v110 = v53;
    v111 = v72;
    v79 = v65;
    v80 = v65 == 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "reasonHintType") == 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v81, CFSTR("event-reason-hint-type"));

    if (v79 == 2)
      v82 = 2;
    else
      v82 = v80;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v83, CFSTR("event-type"));

    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(v5, "itemIDs");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v84;
    if (v112 == 1)
    {
      v85 = objc_msgSend(v84, "radioAdamID");
      if (v85)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = CFSTR("radio-adam-id");
LABEL_100:
        objc_msgSend(v74, "setObject:forKey:", v86, v87);

      }
    }
    else
    {
      v88 = objc_msgSend(v84, "subscriptionAdamID");
      v89 = v88;
      if (v64 != 6)
      {
        if (v88)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v90, CFSTR("subscription-adam-id"));

        }
        v91 = objc_msgSend(v75, "equivalencySourceAdamID", v89);
        if (v91)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v92, CFSTR("orig-sf-adam-id"));

        }
        v93 = objc_msgSend(v75, "purchasedAdamID");
        if (v93)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v94, CFSTR("purchased-adam-id"));

        }
        v95 = objc_msgSend(v75, "cloudID");
        if (!v95)
          goto LABEL_101;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v95);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = CFSTR("cloud-id");
        goto LABEL_100;
      }
      if (v88)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v88);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = CFSTR("auc-adam-id");
        goto LABEL_100;
      }
    }
LABEL_101:
    objc_msgSend(v75, "lyricsID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "length"))
      objc_msgSend(v74, "setObject:forKey:", v77, CFSTR("lyric-id"));
    if (objc_msgSend(v74, "count"))
      objc_msgSend(v9, "setObject:forKey:", v74, CFSTR("ids"));
    objc_msgSend(v5, "containerIDs");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v72 = v111;
    switch(v112)
    {
      case 1:
        objc_msgSend(v78, "stationHash");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v97, "length"))
          objc_msgSend(v96, "setObject:forKey:", v97, CFSTR("station-hash"));
        objc_msgSend(v78, "stationStringID");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v98, "length"))
          objc_msgSend(v96, "setObject:forKey:", v98, CFSTR("station-id"));
        v99 = objc_msgSend(v78, "stationID");
        if (v99)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKey:", v100, CFSTR("station-personalized-id"));

          v72 = v111;
        }

        goto LABEL_127;
      case 2:
        objc_msgSend(v78, "globalPlaylistID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v97, "length"))
          objc_msgSend(v96, "setObject:forKey:", v97, CFSTR("global-playlist-id"));
        objc_msgSend(v78, "playlistVersionHash");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v101, "length"))
          objc_msgSend(v96, "setObject:forKey:", v101, CFSTR("playlist-version-hash"));
        v102 = objc_msgSend(v78, "cloudPlaylistID");
        if (v102)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKey:", v103, CFSTR("cloud-playlist-id"));

        }
        v72 = v111;
        goto LABEL_127;
      case 3:
        v104 = objc_msgSend(v78, "adamID");
        if (!v104)
          goto LABEL_128;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v104);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = CFSTR("artist-adam-id");
        break;
      case 4:
        v106 = objc_msgSend(v78, "adamID");
        if (v106)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKey:", v107, CFSTR("album-adam-id"));

        }
        objc_msgSend(v78, "cloudAlbumID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v97, "length"))
          goto LABEL_127;
        v105 = CFSTR("cloud-album-id");
        break;
      default:
        goto LABEL_128;
    }
    objc_msgSend(v96, "setObject:forKey:", v97, v105);
LABEL_127:

LABEL_128:
    if (objc_msgSend(v96, "count"))
      objc_msgSend(v9, "setObject:forKey:", v96, CFSTR("container-ids"));

    v76 = v125;
    v53 = v110;
    goto LABEL_131;
  }
  objc_msgSend(v5, "containerID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    objc_msgSend(v9, "setObject:forKey:", v74, CFSTR("container-id"));
  objc_msgSend(v5, "externalID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v125;
  if (v75)
    objc_msgSend(v9, "setObject:forKey:", v75, CFSTR("external-identifier"));
  objc_msgSend(v5, "personalizedContainerID");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v77, "length"))
    objc_msgSend(v9, "setObject:forKey:", v77, CFSTR("personalized-container-id"));
  objc_msgSend(v5, "storeID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v78, "length"))
    objc_msgSend(v9, "setObject:forKey:", v78, CFSTR("id"));
LABEL_131:

  if (objc_msgSend(v9, "count"))
    v108 = v9;
  else
    v108 = 0;
  v35 = v108;

LABEL_135:
  return v35;
}

- (NSString)currentStoreFrontID
{
  return self->_currentStoreFrontID;
}

- (void)setCurrentStoreFrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStoreFrontID, 0);
}

@end
