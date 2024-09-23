@implementation MTSiriPlistDumper

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
}

void __30__MTSiriPlistDumper_dumpPlist__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  _QWORD v50[2];
  _QWORD v51[4];
  _QWORD v52[4];
  _BYTE v53[128];
  _QWORD v54[7];

  v54[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("MTPodcast"));
  +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v54[0] = CFSTR("title");
  v54[1] = CFSTR("storeCollectionId");
  v54[2] = CFSTR("uuid");
  v54[3] = CFSTR("feedURL");
  v54[4] = CFSTR("updatedFeedURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v4);

  v37 = v2;
  objc_msgSend(a1[4], "executeFetchRequest:error:", v2, 0);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v51[0] = CFSTR("title");
        objc_msgSend(v9, "title");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (const __CFString *)v10;
        else
          v12 = &stru_1E5500770;
        v52[0] = v12;
        v51[1] = CFSTR("storeId");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v9, "storeCollectionId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v13;
        v51[2] = CFSTR("feedUrl");
        objc_msgSend(v9, "feedURL");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (const __CFString *)v14;
        else
          v16 = &stru_1E5500770;
        v52[2] = v16;
        v51[3] = CFSTR("uuid");
        objc_msgSend(v9, "uuid");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (const __CFString *)v17;
        else
          v19 = &stru_1E5500770;
        v52[3] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[5], "addObject:", v20);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v6);
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("MTPlaylist"));
  +[MTPlaylist topLevelPlaylistsPredicate](MTPlaylist, "topLevelPlaylistsPredicate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v22);

  v50[0] = CFSTR("title");
  v50[1] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPropertiesToFetch:", v23);

  objc_msgSend(a1[4], "executeFetchRequest:error:", v21, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        v47[0] = CFSTR("title");
        objc_msgSend(v29, "title");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (const __CFString *)v30;
        else
          v32 = &stru_1E5500770;
        v47[1] = CFSTR("uuid");
        v48[0] = v32;
        objc_msgSend(v29, "uuid");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v33)
          v35 = (const __CFString *)v33;
        else
          v35 = &stru_1E5500770;
        v48[1] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[6], "addObject:", v36);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v26);
  }

}

- (id)subtractDictionary:(id)a3 fromDictionary:(id)a4 uniqueKey:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke;
  v27[3] = &unk_1E54D39F8;
  v9 = v7;
  v28 = v9;
  v10 = a4;
  objc_msgSend(a3, "mt_compactMap:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_2;
  v25[3] = &unk_1E54D39F8;
  v13 = v9;
  v26 = v13;
  objc_msgSend(v10, "mt_compactMap:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v14);
  objc_msgSend(v15, "minusSet:", v12);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_3;
  v22[3] = &unk_1E54D3A20;
  v23 = v13;
  v24 = v15;
  v16 = v15;
  v17 = v13;
  objc_msgSend(v10, "mt_filter:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  v20 = v19;

  return v20;
}

uint64_t __65__MTSiriPlistDumper_subtractDictionary_fromDictionary_uniqueKey___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);

  return v4;
}

- (void)dumpPlist
{
  _TtC18PodcastsFoundation11SiriDonator *siriDonator;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];

  v35[3] = *MEMORY[0x1E0C80C00];
  if (!+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod")
    || os_feature_enabled_siri_donation_homepod())
  {
    siriDonator = self->_siriDonator;
    if (siriDonator)
      -[SiriDonator startDonation](siriDonator, "startDonation");
  }
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainOrPrivateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __30__MTSiriPlistDumper_dumpPlist__block_invoke;
  v24[3] = &unk_1E54D2000;
  v25 = v7;
  v8 = v4;
  v26 = v8;
  v9 = v5;
  v27 = v9;
  v21 = v25;
  objc_msgSend(v25, "performBlockAndWait:", v24);
  v34[0] = CFSTR("title");
  v34[1] = CFSTR("children");
  v35[0] = CFSTR("Library");
  v35[1] = v8;
  v34[2] = CFSTR("uuid");
  v35[2] = CFSTR("Podcasts");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("title");
  v32[1] = CFSTR("children");
  v33[0] = CFSTR("Stations");
  v33[1] = v9;
  v32[2] = CFSTR("uuid");
  v33[2] = CFSTR("Stations");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("children");
  v31[0] = CFSTR("Root");
  v29[0] = v23;
  v29[1] = v22;
  v30[0] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTConstants documentsDirectory](MTConstants, "documentsDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("PodcastsDB.plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v15, "fileExistsAtPath:", v14))
  {
    objc_msgSend(v15, "contentsAtPath:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSiriPlistDumper _childFromPlistAtIndex:plistArray:](self, "_childFromPlistAtIndex:plistArray:", 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSiriPlistDumper _childFromPlistAtIndex:plistArray:](self, "_childFromPlistAtIndex:plistArray:", 1, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
      v18 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[MTSiriPlistDumper writeDiffs:stationItems:existingPodcastItems:existingStationItems:](self, "writeDiffs:stationItems:existingPodcastItems:existingStationItems:", v8, v9, v18, v19);
  objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);
  v28 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "writeToFile:atomically:", v14, 1);

}

- (id)_childFromPlistAtIndex:(int64_t)a3 plistArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("children"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count") > (unint64_t)a3)
      {
        objc_msgSend(v7, "objectAtIndex:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("children"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = (void *)MEMORY[0x1E0C9AA60];
        }

      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void)writeDiffs:(id)a3 stationItems:(id)a4 existingPodcastItems:(id)a5 existingStationItems:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v25 = a5;
  v27 = a6;
  +[MTConstants documentsDirectory](MTConstants, "documentsDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("PodcastsDiff.plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v16 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v16, "fileExistsAtPath:", v14))
  {
    objc_msgSend(v16, "contentsAtPath:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v17, 0, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v19;
      }

    }
  }
  if (objc_msgSend(v15, "count", v25) && (unint64_t)objc_msgSend(v15, "count") < 0x65)
  {
    -[MTSiriPlistDumper subtractDictionary:fromDictionary:uniqueKey:](self, "subtractDictionary:fromDictionary:uniqueKey:", v26, v10, CFSTR("uuid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSiriPlistDumper subtractDictionary:fromDictionary:uniqueKey:](self, "subtractDictionary:fromDictionary:uniqueKey:", v27, v11, CFSTR("uuid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSiriPlistDumper subtractDictionary:fromDictionary:uniqueKey:](self, "subtractDictionary:fromDictionary:uniqueKey:", v10, v26, CFSTR("uuid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSiriPlistDumper subtractDictionary:fromDictionary:uniqueKey:](self, "subtractDictionary:fromDictionary:uniqueKey:", v11, v27, CFSTR("uuid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "count")
      && !objc_msgSend(v21, "count")
      && !objc_msgSend(v22, "count")
      && !objc_msgSend(v23, "count"))
    {

      goto LABEL_16;
    }
    -[MTSiriPlistDumper createDiffWithAddedPodcasts:addedStations:removedPodcasts:removedStations:](self, "createDiffWithAddedPodcasts:addedStations:removedPodcasts:removedStations:", v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v24);

  }
  else
  {
    -[MTSiriPlistDumper createDiffWithAddedPodcasts:addedStations:removedPodcasts:removedStations:](self, "createDiffWithAddedPodcasts:addedStations:removedPodcasts:removedStations:", v10, v11, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");
    objc_msgSend(v15, "addObject:", v20);
  }

  objc_msgSend(v16, "removeItemAtPath:error:", v14, 0);
  objc_msgSend(v15, "writeToFile:atomically:", v14, 1);
LABEL_16:

}

- (MTSiriPlistDumper)initWithBackgroundTaskManager:(id)a3
{
  id v4;
  MTSiriPlistDumper *v5;
  _TtC18PodcastsFoundation11SiriDonator *v6;
  _TtC18PodcastsFoundation11SiriDonator *siriDonator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSiriPlistDumper;
  v5 = -[MTSiriPlistDumper init](&v9, sel_init);
  if (v5
    && (!+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod")
     || os_feature_enabled_siri_donation_homepod()))
  {
    v6 = -[SiriDonator initWithBackgroundTaskManager:]([_TtC18PodcastsFoundation11SiriDonator alloc], "initWithBackgroundTaskManager:", v4);
    siriDonator = v5->_siriDonator;
    v5->_siriDonator = v6;

  }
  return v5;
}

- (id)createDiffWithAddedPodcasts:(id)a3 addedStations:(id)a4 removedPodcasts:(id)a5 removedStations:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("uuid");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = CFSTR("podcasts");
  v21[0] = CFSTR("inserted");
  v21[1] = CFSTR("deleted");
  v22[0] = v13;
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  v23[2] = CFSTR("stations");
  v19[0] = CFSTR("inserted");
  v19[1] = CFSTR("deleted");
  v20[0] = v12;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_TtC18PodcastsFoundation11SiriDonator)siriDonator
{
  return self->_siriDonator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDonator, 0);
}

@end
