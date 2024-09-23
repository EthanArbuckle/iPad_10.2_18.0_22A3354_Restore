@implementation MPMediaQuery(VideosUI)

+ (id)vui_homeVideosQueryWithMediaLibrary:()VideosUI
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "homeVideosQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_vui_configureMediaQueryWithMediaLibrary:", v4);

  return v5;
}

+ (id)vui_episodesQueryWithMediaLibrary:()VideosUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "tvShowsQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_vui_configureMediaQueryWithMediaLibrary:", v4);
  v6 = (void *)MEMORY[0x1E0CC2428];
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_restrictionsPredicateWithMediaEntityType:mediaLibrary:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "addFilterPredicate:", v8);

  return v5;
}

+ (id)_vui_moviesQueryWithMediaLibrary:()VideosUI rentals:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a1, "movieRentalsQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  }
  else
  {
    objc_msgSend(a1, "moviesQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_vui_configureMediaQueryWithMediaLibrary:", v6);
  objc_msgSend(MEMORY[0x1E0CC2428], "vui_restrictionsPredicateWithMediaEntityType:mediaLibrary:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "addFilterPredicate:", v9);
  objc_msgSend(v7, "vui_excludePreorderContent");

  return v7;
}

- (void)vui_excludePreorderContent
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC1EA0], 100);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addFilterPredicate:", v2);

}

- (void)_vui_configureMediaQueryWithMediaLibrary:()VideosUI
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1E68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v7);
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v6, *MEMORY[0x1E0CC1E88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v8);
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v6, *MEMORY[0x1E0CC1E38]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v9);
  objc_msgSend(MEMORY[0x1E0CC23B8], "predicateMatchingPredicates:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addFilterPredicate:", v10);
  objc_msgSend(a1, "setMediaLibrary:", v5);

}

+ (uint64_t)vui_moviesQueryWithMediaLibrary:()VideosUI
{
  return objc_msgSend(a1, "_vui_moviesQueryWithMediaLibrary:rentals:", a3, 0);
}

+ (id)vui_movieRentalsQueryWithMediaLibrary:()VideosUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_vui_moviesQueryWithMediaLibrary:rentals:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CC2430];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CC1F10];
  objc_msgSend(v4, "predicateWithValue:forProperty:comparisonType:", v6, *MEMORY[0x1E0CC1F10], 101);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", &unk_1EA0B9B68, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CC23C0];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addFilterPredicate:", v12);
  return v3;
}

+ (id)vui_GenresQueryWithMediaLibrary:()VideosUI
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CC2438];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setGroupingType:", 5);
  objc_msgSend(MEMORY[0x1E0CC2428], "vui_isLocalPredicate:comparison:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CC1EC0];
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", &unk_1EA0B9B80, *MEMORY[0x1E0CC1EC0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", &unk_1EA0B9B98, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6A60], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowsShowingUndownloadedMovies");

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CC23B8];
    v35[0] = v6;
    v35[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateMatchingPredicates:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC6A60], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "allowsShowingUndownloadedTVShows");

  if (v15)
  {
    if (v11)
    {
      v16 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CC23B8];
    v34[0] = v6;
    v34[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateMatchingPredicates:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v16)
    {
      v19 = (void *)MEMORY[0x1E0CC23C0];
      v33[0] = v11;
      v33[1] = v16;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v33;
LABEL_11:
      objc_msgSend(v20, "arrayWithObjects:count:", v21, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateMatchingPredicates:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v11)
    {
LABEL_10:
      v19 = (void *)MEMORY[0x1E0CC23C0];
      v32[0] = v11;
      v32[1] = v8;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v32;
      goto LABEL_11;
    }
    if (v16)
    {
      v19 = (void *)MEMORY[0x1E0CC23C0];
      v31[0] = v29;
      v31[1] = v16;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v31;
      goto LABEL_11;
    }
  }
  v24 = (void *)MEMORY[0x1E0CC23C0];
  v30[0] = v29;
  v30[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predicateMatchingPredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
LABEL_15:

  if (v23)
    objc_msgSend(v5, "addFilterPredicate:", v23);
  v25 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1EA8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v25, *MEMORY[0x1E0CC1E70]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFilterPredicate:", v26);
  objc_msgSend(v5, "addFilterPredicate:", v27);
  objc_msgSend(v5, "vui_excludePreorderContent");
  objc_msgSend(v5, "setMediaLibrary:", v4);

  return v5;
}

+ (id)vui_tvShowsQueryWithMediaLibrary:()VideosUI
{
  void *v1;

  objc_msgSend(a1, "vui_episodesQueryWithMediaLibrary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGroupingType:", 8);
  return v1;
}

@end
