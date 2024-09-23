@implementation VUIPlaybackReporterVPAFPlaylist

- (VUIPlaybackReporterVPAFPlaylist)initWithPlayer:(id)a3
{
  id v4;
  VUIPlaybackReporterVPAFPlaylist *v5;
  void *v6;
  NSArray *v7;
  NSObject *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  VUIPlaybackReporterVPAFPlaylistItem *v22;
  uint64_t v23;
  NSArray *items;
  void *v25;
  void *v26;
  NSObject *v27;
  VUIPlaybackReporterVPAFPlaylist *v28;
  double v29;
  unint64_t v30;
  double v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  __CFString *v45;
  VUIPlaybackReporterVPAFPlaylistItem *v46;
  double v47;
  unint64_t v48;
  double v49;
  VUIPlaybackReporterVPAFPlaylistItem *v50;
  VUIPlaybackReporterVPAFPlaylistItem *v51;
  uint64_t v52;
  uint64_t v53;
  NSArray *v54;
  NSObject *v55;
  NSArray *v56;
  NSArray *v57;
  NSArray *v58;
  NSArray *v59;
  uint64_t v60;
  NSArray *eventData;
  NSObject *v62;
  NSArray *v63;
  NSObject *v64;
  void *v66;
  char v67;
  VUIPlaybackReporterVPAFPlaylistItem *v68;
  NSArray *v69;
  void *v70;
  VUIPlaybackReporterVPAFPlaylist *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id obj;
  void *v78;
  NSArray *v79;
  uint64_t v80;
  _QWORD v81[4];
  NSArray *v82;
  NSArray *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  objc_super v88;
  NSArray *v89;
  _BYTE v90[128];
  VUIPlaybackReporterVPAFPlaylistItem *v91;
  uint8_t buf[4];
  NSArray *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)VUIPlaybackReporterVPAFPlaylist;
  v5 = -[VUIPlaybackReporterVPAFPlaylist init](&v88, sel_init);
  if (!v5)
    goto LABEL_45;
  objc_msgSend(v4, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CE8]);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSArray count](v7, "count"))
  {
    VUIDefaultLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Media item lacks valid VPAF dictionary. Will not track.", buf, 2u);
    }

    v28 = 0;
    goto LABEL_46;
  }
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Media item has VPAF dictionary. Will track. %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v5->_player, v4);
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C38]);
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSArray addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v7);
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("featureCanonicalId"));
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v13, CFSTR("featureReferenceId"));

  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v14, CFSTR("featureExternalId"));

  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("brandId"));

  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v73 = objc_claimAutoreleasedReturnValue();
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:");
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v11, CFSTR("canonicalShowId"));
  v76 = (void *)v12;
  -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v12, CFSTR("canonicalSeasonId"));
  +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)v10;
  v74 = (void *)v11;
  if ((objc_msgSend(v16, "isSharedContent:", v10) & 1) == 0)
  {
    +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isSharedContent:", v11))
    {
      +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "isSharedContent:", v76);

      if ((v67 & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }

  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setObject:forKey:](v9, "setObject:forKey:", v18, CFSTR("sharedContent"));

LABEL_11:
  v19 = +[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v4);
  v5->_isLive = v19;
  if (v19)
  {
    -[NSArray setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("live"), CFSTR("programmingType"));
    -[NSArray objectForKey:](v9, "objectForKey:", CFSTR("serviceId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B60]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray vui_setObjectIfNotNil:forKey:](v9, "vui_setObjectIfNotNil:forKey:", v21, CFSTR("serviceId"));

    }
    v22 = -[VUIPlaybackReporterVPAFPlaylistItem initWithPosition:duration:eventData:]([VUIPlaybackReporterVPAFPlaylistItem alloc], "initWithPosition:duration:eventData:", 0, -1, 0);
    v91 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
    v23 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v23;
    v26 = (void *)v73;
    v25 = v74;
    goto LABEL_40;
  }
  v69 = v7;
  v71 = v5;
  v72 = v4;
  objc_msgSend(v4, "duration");
  v30 = vcvtad_u64_f64(v29 * 1000.0);
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD8]);
  v68 = (VUIPlaybackReporterVPAFPlaylistItem *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterVPAFPlaylistItem doubleValue](v68, "doubleValue");
  v32 = vcvtad_u64_f64(v31 * 1000.0);
  -[NSArray setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("videoOnDemand"), CFSTR("programmingType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v33, CFSTR("overallLength"));

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", v32, v30 - v32);
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v6;
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C18]);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (!v34)
    goto LABEL_37;
  v35 = v34;
  v80 = *(_QWORD *)v85;
  do
  {
    for (i = 0; i != v35; ++i)
    {
      if (*(_QWORD *)v85 != v80)
        objc_enumerationMutation(obj);
      v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v37, "adamID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dynamicSlotDataSetId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("assetId"));
      if (v40)
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("data.dynamicSlot.dataSetId"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v37, "isSkippable"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, CFSTR("isSkippable"));

      v42 = CFSTR("unknown");
      v43 = objc_msgSend(v37, "type");
      v44 = CFSTR("preroll");
      if (v43 == 1)
        goto LABEL_32;
      if (v43 == 3)
      {
        v44 = CFSTR("postroll");
LABEL_32:
        v45 = v44;

        v42 = v45;
        goto LABEL_33;
      }
      v44 = CFSTR("midroll");
      if (v43 == 2)
        goto LABEL_32;
LABEL_33:
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, CFSTR("assetPlacement"));
      v46 = [VUIPlaybackReporterVPAFPlaylistItem alloc];
      objc_msgSend(v37, "start");
      v48 = vcvtad_u64_f64(v47 * 1000.0);
      objc_msgSend(v37, "duration");
      v50 = -[VUIPlaybackReporterVPAFPlaylistItem initWithPosition:duration:eventData:](v46, "initWithPosition:duration:eventData:", v48, vcvtad_u64_f64(v49 * 1000.0), v38);
      v51 = v50;
      if (v50)
      {
        v52 = -[VUIPlaybackReporterVPAFPlaylistItem timeRange](v50, "timeRange");
        -[NSArray removeIndexesInRange:](v79, "removeIndexesInRange:", v52, v53);
        objc_msgSend(v78, "addObject:", v51);
      }

    }
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  }
  while (v35);
LABEL_37:
  v54 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", CFSTR("feature"), CFSTR("assetPlacement"));
  v26 = (void *)v73;
  -[NSArray vui_setObjectIfNotNil:forKey:](v54, "vui_setObjectIfNotNil:forKey:", v73, CFSTR("assetId"));
  VUIDefaultLogObject();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v54;
    _os_log_impl(&dword_1D96EE000, v55, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Feature metrics: %@", buf, 0xCu);
  }

  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __50__VUIPlaybackReporterVPAFPlaylist_initWithPlayer___block_invoke;
  v81[3] = &unk_1E9FA1C90;
  v82 = v54;
  v56 = v78;
  v83 = v56;
  v57 = v54;
  -[NSArray enumerateRangesUsingBlock:](v79, "enumerateRangesUsingBlock:", v81);
  v5 = v71;
  v58 = v71->_items;
  v71->_items = v56;
  v59 = v56;

  items = v79;
  v4 = v72;
  v7 = v69;
  v6 = v70;
  v22 = v68;
  v25 = v74;
LABEL_40:

  v89 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v60 = objc_claimAutoreleasedReturnValue();
  eventData = v5->_eventData;
  v5->_eventData = (NSArray *)v60;

  VUIDefaultLogObject();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = v5->_items;
    *(_DWORD *)buf = 138412290;
    v93 = v63;
    _os_log_impl(&dword_1D96EE000, v62, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Parsed items: %@", buf, 0xCu);
  }

  VUIDefaultLogObject();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v93 = v9;
    _os_log_impl(&dword_1D96EE000, v64, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Playlist metrics: %@", buf, 0xCu);
  }

LABEL_45:
  v28 = v5;
LABEL_46:

  return v28;
}

void __50__VUIPlaybackReporterVPAFPlaylist_initWithPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  VUIPlaybackReporterVPAFPlaylistItem *v4;
  VUIPlaybackReporterVPAFPlaylistItem *v5;

  v4 = -[VUIPlaybackReporterVPAFPlaylistItem initWithPosition:duration:eventData:]([VUIPlaybackReporterVPAFPlaylistItem alloc], "initWithPosition:duration:eventData:", a2, a3, *(_QWORD *)(a1 + 32));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v4 = v5;
  }

}

- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4
{
  void *v6;
  VUIPlaybackReporterVPAFPlaylistItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;
  NSObject *v23;
  VUIPlaybackReporterVPAFPlaylistItem *v25;
  double v26;
  unint64_t v27;
  void *v28;
  VUIPlaybackReporterVPAFPlaylistItem *v29;
  VUIPlaybackReporterVPAFPlaylistItem *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackReporterVPAFPlaylist items](self, "items", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (VUIPlaybackReporterVPAFPlaylistItem *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackReporterVPAFPlaylist player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VUIPlaybackReporterVPAFPlaylist isLive](self, "isLive")
    || (objc_msgSend(v10, "length") ? (v12 = v11 == 0) : (v12 = 1), v12))
  {
    if (!-[VUIPlaybackReporterVPAFPlaylist isLive](self, "isLive"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[VUIPlaybackReporterVPAFPlaylist items](self, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v14)
      {
        v15 = v14;
        v32 = v10;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "timeRange");
            if (a3 >= v19 && a3 - v19 < v20)
            {
              v30 = v18;

              v7 = v30;
              goto LABEL_24;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v15);
LABEL_24:
        v10 = v32;
      }

    }
    v7 = v7;
    v29 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "vui_setObjectIfNotNil:forKey:", *MEMORY[0x1E0D41780], CFSTR("assetPlacement"));
    objc_msgSend(v22, "vui_setObjectIfNotNil:forKey:", CFSTR("CatchUpToLive"), CFSTR("extraType"));
    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v10;
      v40 = 2112;
      v41 = v22;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAFPlaylist - Clip (%@) metadata %@", buf, 0x16u);
    }

    v25 = [VUIPlaybackReporterVPAFPlaylistItem alloc];
    objc_msgSend(v11, "doubleValue");
    v27 = (unint64_t)(v26 * 1000.0);
    v28 = (void *)objc_msgSend(v22, "copy");
    v29 = -[VUIPlaybackReporterVPAFPlaylistItem initWithPosition:duration:eventData:](v25, "initWithPosition:duration:eventData:", 0, v27, v28);

  }
  return v29;
}

- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4
{
  id v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;
  NSRange v24;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!-[VUIPlaybackReporterVPAFPlaylist isLive](self, "isLive"))
  {
    v19 = 0u;
    v20 = 0u;
    if (a4 >= a3)
      v8 = a4 - a3;
    else
      v8 = a3 - a4;
    if (a4 >= a3)
      a4 = a3;
    *((_QWORD *)&v17 + 1) = 0;
    v18 = 0uLL;
    -[VUIPlaybackReporterVPAFPlaylist items](self, "items", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v24.location = objc_msgSend(v14, "timeRange");
          v24.length = v15;
          v23.location = a4;
          v23.length = v8;
          if (NSIntersectionRange(v23, v24).length)
            objc_msgSend(v7, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  return v7;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (TVPPlayback)player
{
  return (TVPPlayback *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->_isLive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
