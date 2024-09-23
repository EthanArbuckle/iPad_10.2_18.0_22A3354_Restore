@implementation MPMediaPredicate(VideosUI)

+ (id)vui_restrictionsPredicateWithMediaEntityType:()VideosUI mediaLibrary:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(a4, "vui_isDeviceMediaLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0DC6A60], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "mediaCategoryType");
    if (v8 == 1)
    {
      if ((objc_msgSend(v7, "allowsShowingUndownloadedTVShows") & 1) != 0)
      {
LABEL_5:
        v9 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (v8 || (objc_msgSend(v7, "allowsShowingUndownloadedMovies") & 1) != 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(a1, "vui_isLocalPredicate:comparison:", 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)vui_isLocalPredicate:()VideosUI comparison:
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id obj;
  id v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a4 && a4 != 100)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported comparison (%lu)"), a4);
  v6 = (void *)MEMORY[0x1E0CC2430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithValue:forProperty:comparisonType:", v7, *MEMORY[0x1E0CC1E80], a4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 100;
  if ((_DWORD)a3)
    v8 = 0;
  if (v8 == a4)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sidebandMediaLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA0BB808);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videosWithDownloadState:entitlementTypes:useMainThreadContext:", 2, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v40;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
          v33 = 0;
          v34 = &v33;
          v35 = 0x3032000000;
          v36 = __Block_byref_object_copy_;
          v37 = __Block_byref_object_dispose_;
          v38 = 0;
          objc_msgSend(v17, "managedObjectContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v15;
          v32[1] = 3221225472;
          v32[2] = __62__MPMediaPredicate_VideosUI__vui_isLocalPredicate_comparison___block_invoke;
          v32[3] = &unk_1E9F99348;
          v32[4] = v17;
          v32[5] = &v33;
          objc_msgSend(v18, "performBlockAndWait:", v32);

          if (v34[5])
            objc_msgSend(v31, "addObject:");
          _Block_object_dispose(&v33, 8);

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1EB0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CC23B8];
    v44[0] = v29;
    v44[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateMatchingPredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CC23C8], "predicateWithProperty:values:", *MEMORY[0x1E0CC1FA0], v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CC23C0];
      v43[0] = v22;
      v43[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateMatchingPredicates:", v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = v22;
    }

    v27 = v29;
  }
  else
  {
    v27 = v29;
    v26 = v29;
  }

  return v26;
}

+ (id)vui_mediaEntityTypePredicate:()VideosUI comparison:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  _QWORD v29[2];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 && a4 != 100)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported comparison (%lu)"), a4);
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if ((id)v6 == v5)
    goto LABEL_12;
  v8 = (void *)v6;
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v5)
  {

    v7 = v8;
LABEL_12:

    goto LABEL_13;
  }
  v10 = (void *)v9;
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v5)
  {
LABEL_13:
    v16 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 512);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithValue:forProperty:comparisonType:", v17, *MEMORY[0x1E0CC1EC0], a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8DE8, *MEMORY[0x1E0CC1EC0], a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    v20 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1EA8], a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v21;
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", v20, *MEMORY[0x1E0CC1E70], a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (id *)0x1E0CC23B8;
    if (a4)
      v24 = (id *)0x1E0CC23C0;
    objc_msgSend(*v24, "predicateMatchingPredicates:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v5)
    {
      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8DE8, *MEMORY[0x1E0CC1EC0], a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v25;
      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC1EA8], a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (id *)0x1E0CC23B8;
      if (a4)
        v28 = (id *)0x1E0CC23C0;
      objc_msgSend(*v28, "predicateMatchingPredicates:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v5)
      {
        objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8E00, *MEMORY[0x1E0CC1EC0], a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported media entity type (%@)"), v5);
        v15 = 0;
      }
    }
  }
LABEL_14:

  return v15;
}

+ (id)vui_seasonIdentifierPredicate:()VideosUI comparison:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (a4 && a4 != 100)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported comparison (%lu)"), a4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "persistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vui_showPersistentIDPredicate:comparison:", objc_msgSend(v8, "unsignedIntegerValue"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(v6, "seasonNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vui_seasonNumberPredicate:comparison:", objc_msgSend(v10, "unsignedIntegerValue"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v12;
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    if (a4)
      v13 = (void *)MEMORY[0x1E0CC23C0];
    else
      v13 = (void *)MEMORY[0x1E0CC23B8];
    objc_msgSend(v13, "predicateMatchingPredicates:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid season Identifier (%@)"), v6);
  v14 = 0;
LABEL_13:

  return v14;
}

+ (id)vui_showPersistentIDPredicate:()VideosUI comparison:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CC2430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithValue:forProperty:comparisonType:", v6, *MEMORY[0x1E0CC1DA0], a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vui_seasonNumberPredicate:()VideosUI comparison:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CC2430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithValue:forProperty:comparisonType:", v6, *MEMORY[0x1E0CC1F40], a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)vui_isPlayablePredicate:()VideosUI comparison:
{
  uint64_t v7;

  if (a4 && a4 != 100)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported comparison (%lu)"), a4);
  v7 = 100;
  if (a3)
    v7 = 0;
  objc_msgSend(a1, "_vui_isPlayablePredicate:", v7 == a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_vui_isNetworkPlayablePredicate:()VideosUI
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CC1FA0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8E48, v3, 100);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8E48, *MEMORY[0x1E0CC1E58], 100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CC23C0];
    v13[0] = v4;
    v13[1] = v5;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8E48, v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B8E48, *MEMORY[0x1E0CC1E58], 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CC23B8];
    v12[0] = v4;
    v12[1] = v5;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = v12;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_vui_isPlayablePredicate:()VideosUI
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "vui_isLocalPredicate:comparison:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_vui_isNetworkPlayablePredicate:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((_DWORD)a3)
  {
    v8 = (void *)MEMORY[0x1E0CC23C0];
    v15[0] = v5;
    v15[1] = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v15;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CC23B8];
    v14[0] = v5;
    v14[1] = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = v14;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateMatchingPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
