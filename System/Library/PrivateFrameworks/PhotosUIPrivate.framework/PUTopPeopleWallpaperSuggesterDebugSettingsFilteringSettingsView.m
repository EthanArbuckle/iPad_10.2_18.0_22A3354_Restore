@implementation PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView

- (PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView)initWithFilteringContext:(id)a3
{
  id v5;
  PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *v6;
  PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *v7;
  id *p_filteringContext;
  id *v9;
  void (**v10)(void *, _QWORD, const __CFString *);
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD aBlock[4];
  id *v70;
  objc_super v71;

  v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView;
  v6 = -[PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView init](&v71, sel_init);
  v7 = v6;
  if (v6)
  {
    p_filteringContext = (id *)&v6->_filteringContext;
    objc_storeStrong((id *)&v6->_filteringContext, a3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView_initWithFilteringContext___block_invoke;
    aBlock[3] = &unk_1E589A940;
    v9 = v7;
    v70 = v9;
    v10 = (void (**)(void *, _QWORD, const __CFString *))_Block_copy(aBlock);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v12 = v9[262];
    v9[262] = v11;

    objc_msgSend(v9[262], "addTarget:action:forControlEvents:", v9, sel_normalizedDeviationForVeryImportantPersonsChanged_, 0x40000);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "normalizedDeviationForVeryImportantPersons");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%.2f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[262], "setText:", v15);

    objc_msgSend(v9[262], "sizeToFit");
    objc_msgSend(v9[262], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[262]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[262], CFSTR("Norm Dev for VIPs:"));
    v16 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v17 = v9[263];
    v9[263] = v16;

    objc_msgSend(v9[263], "addTarget:action:forControlEvents:", v9, sel_normalizedDeviationForImportantPersonsChanged_, 0x40000);
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "normalizedDeviationForImportantPersons");
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%.2f"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[263], "setText:", v20);

    objc_msgSend(v9[263], "sizeToFit");
    objc_msgSend(v9[263], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[263]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[263], CFSTR("Norm Dev for IPs:"));
    v21 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v22 = v9[264];
    v9[264] = v21;

    objc_msgSend(v9[264], "addTarget:action:forControlEvents:", v9, sel_favoritePersonsAreVIPsChanged_, 64);
    objc_msgSend(v9[264], "setOn:", objc_msgSend(*p_filteringContext, "favoritePersonsAreVIPs"));
    objc_msgSend(v9[264], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[264]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[264], CFSTR("Fav Persons are VIPs:"));
    v23 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v24 = v9[265];
    v9[265] = v23;

    objc_msgSend(v9[265], "addTarget:action:forControlEvents:", v9, sel_minimumNumberOfCandidatesForEligiblePersonChanged_, 0x40000);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*p_filteringContext, "minimumNumberOfCandidatesForEligiblePerson"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[265], "setText:", v25);

    objc_msgSend(v9[265], "sizeToFit");
    objc_msgSend(v9[265], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[265]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[265], CFSTR("Min Num Candidates:"));
    v26 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v27 = v9[266];
    v9[266] = v26;

    objc_msgSend(v9[266], "addTarget:action:forControlEvents:", v9, sel_timeIntervalForCandidateDedupingChanged_, 0x40000);
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "timeIntervalForCandidateDeduping");
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%.2f"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[266], "setText:", v30);

    objc_msgSend(v9[266], "sizeToFit");
    objc_msgSend(v9[266], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[266]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[266], CFSTR("TimeInt for Deduping:"));
    v31 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v32 = v9[267];
    v9[267] = v31;

    objc_msgSend(v9[267], "addTarget:action:forControlEvents:", v9, sel_requiresSmileChanged_, 64);
    objc_msgSend(v9[267], "setOn:", objc_msgSend(*p_filteringContext, "requiresSmile"));
    objc_msgSend(v9[267], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[267]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[267], CFSTR("Requires Smile:"));
    v33 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    v34 = v9[268];
    v9[268] = v33;

    objc_msgSend(v9[268], "addTarget:action:forControlEvents:", v9, sel_requiresNoBlinkChanged_, 64);
    objc_msgSend(v9[268], "setOn:", objc_msgSend(*p_filteringContext, "requiresNoBlink"));
    objc_msgSend(v9[268], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[268]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[268], CFSTR("Requires No Blink:"));
    v35 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v36 = v9[269];
    v9[269] = v35;

    objc_msgSend(v9[269], "addTarget:action:forControlEvents:", v9, sel_minimumFaceQualityChanged_, 0x40000);
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "minimumFaceQuality");
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%.2f"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[269], "setText:", v39);

    objc_msgSend(v9[269], "sizeToFit");
    objc_msgSend(v9[269], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[269]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[269], CFSTR("Min Face Quality:"));
    v40 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v41 = v9[270];
    v9[270] = v40;

    objc_msgSend(v9[270], "addTarget:action:forControlEvents:", v9, sel_minimumFaceSizeChanged_, 0x40000);
    v42 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "minimumFaceSize");
    objc_msgSend(v42, "stringWithFormat:", CFSTR("%.2f"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[270], "setText:", v44);

    objc_msgSend(v9[270], "sizeToFit");
    objc_msgSend(v9[270], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[270]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[270], CFSTR("Min Face Size:"));
    v45 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v46 = v9[271];
    v9[271] = v45;

    objc_msgSend(v9[271], "addTarget:action:forControlEvents:", v9, sel_maximumFaceSizeChanged_, 0x40000);
    v47 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "maximumFaceSize");
    objc_msgSend(v47, "stringWithFormat:", CFSTR("%.2f"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[271], "setText:", v49);

    objc_msgSend(v9[271], "sizeToFit");
    objc_msgSend(v9[271], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[271]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[271], CFSTR("Max Face Size:"));
    v50 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v51 = v9[272];
    v9[272] = v50;

    objc_msgSend(v9[272], "addTarget:action:forControlEvents:", v9, sel_maximumFaceRollChanged_, 0x40000);
    v52 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "maximumFaceRoll");
    objc_msgSend(v52, "stringWithFormat:", CFSTR("%.2f"), v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[272], "setText:", v54);

    objc_msgSend(v9[272], "sizeToFit");
    objc_msgSend(v9[272], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[272]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[272], CFSTR("Max Face Roll:"));
    v55 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v56 = v9[273];
    v9[273] = v55;

    objc_msgSend(v9[273], "addTarget:action:forControlEvents:", v9, sel_minimumWallpaperScoreChanged_, 0x40000);
    v57 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "minimumWallpaperScore");
    objc_msgSend(v57, "stringWithFormat:", CFSTR("%.2f"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[273], "setText:", v59);

    objc_msgSend(v9[273], "sizeToFit");
    objc_msgSend(v9[273], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[273]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[273], CFSTR("Min Wallpaper Score:"));
    v60 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v61 = v9[274];
    v9[274] = v60;

    objc_msgSend(v9[274], "addTarget:action:forControlEvents:", v9, sel_minimumCropScoreChanged_, 0x40000);
    v62 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_filteringContext, "minimumCropScore");
    objc_msgSend(v62, "stringWithFormat:", CFSTR("%.2f"), v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[274], "setText:", v64);

    objc_msgSend(v9[274], "sizeToFit");
    objc_msgSend(v9[274], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v9[274]);
    ((void (**)(void *, id, const __CFString *))v10)[2](v10, v9[274], CFSTR("Min Asset Crop Score:"));
    v65 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_normalizedDeviationForVeryImportantPersonsTextField, _normalizedDeviationForImportantPersonsTextField, _favoritePersonsAreVIPsCheckBox, _minimumNumberOfCandidatesForEligiblePersonTextField, _timeIntervalForCandidateDedupingTextField, _requiresSmileCheckBox, _requiresNoBlinkCheckBox, _minimumFaceQualityTextField, _minimumFaceSizeTextField, _maximumFaceSizeTextField, _maximumFaceRollTextField, _minimumWallpaperScoreTextField, _minimumCropScoreTextField"), v9[262], v9[263], v9[264], v9[265], v9[266], v9[267], v9[268], v9[269], v9[270], v9[271], v9[272], v9[273], v9[274], 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-16-[_normalizedDeviationForVeryImportantPersonsTextField]-10-[_normalizedDeviationForImportantPersonsTextField]-10-[_favoritePersonsAreVIPsCheckBox]-10-[_minimumNumberOfCandidatesForEligiblePersonTextField]-10-[_timeIntervalForCandidateDedupingTextField]-10-[_requiresSmileCheckBox]-10-[_requiresNoBlinkCheckBox]-10-[_minimumFaceQualityTextField]-10-[_minimumFaceSizeTextField]-10-[_maximumFaceSizeTextField]-10-[_maximumFaceRollTextField]-10-[_minimumWallpaperScoreTextField]-10-[_minimumCropScoreTextField]->=0-|"), 0, 0, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v67);

  }
  return v7;
}

- (int64_t)indexOfRowWithPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v8 = 1;
      goto LABEL_17;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("*")) & 1) != 0)
    {
      v8 = 2;
LABEL_17:

      goto LABEL_18;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_persons;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = 3;
      while (2)
      {
        v14 = 0;
        v15 = v13 + v11;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "localIdentifier", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if ((v17 & 1) != 0)
          {
            v8 = v13 + v14;

            goto LABEL_17;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v13 = v15;
        if (v11)
          continue;
        break;
      }
    }

    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (id)aspectRatios
{
  return &unk_1E59B9C70;
}

- (id)highlights
{
  void *v2;
  NSArray *highlights;
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  void *v21;
  PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  highlights = self->_highlights;
  if (!highlights)
  {
    v22 = self;
    v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", &unk_1E59BAB88, 0);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSortDescriptors:", v9);

    v21 = v7;
    objc_msgSend(MEMORY[0x1E0CD1708], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v7);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v28[0] = CFSTR("localIdentifier");
          objc_msgSend(v14, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28[1] = CFSTR("name");
          v29[0] = v15;
          objc_msgSend(v14, "localizedTitle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16)
          {
            objc_msgSend(v14, "localizedSubtitle");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v2;
          }
          v29[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v5, "addObject:", v18);

          if (!v16)
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v11);
    }
    v19 = v22->_highlights;
    v22->_highlights = v5;

    highlights = v22->_highlights;
  }
  return highlights;
}

- (void)normalizedDeviationForVeryImportantPersonsChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setNormalizedDeviationForVeryImportantPersons:](self->_filteringContext, "setNormalizedDeviationForVeryImportantPersons:");

}

- (void)normalizedDeviationForImportantPersonsChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setNormalizedDeviationForImportantPersons:](self->_filteringContext, "setNormalizedDeviationForImportantPersons:");

}

- (void)favoritePersonsAreVIPsChanged:(id)a3
{
  -[PUTopPeopleWallpaperSuggesterFilteringContext setFavoritePersonsAreVIPs:](self->_filteringContext, "setFavoritePersonsAreVIPs:", objc_msgSend(a3, "isOn"));
}

- (void)minimumNumberOfCandidatesForEligiblePersonChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumNumberOfCandidatesForEligiblePerson:](self->_filteringContext, "setMinimumNumberOfCandidatesForEligiblePerson:", objc_msgSend(v4, "integerValue"));

}

- (void)timeIntervalForCandidateDedupingChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setTimeIntervalForCandidateDeduping:](self->_filteringContext, "setTimeIntervalForCandidateDeduping:");

}

- (void)requiresSmileChanged:(id)a3
{
  -[PUTopPeopleWallpaperSuggesterFilteringContext setRequiresSmile:](self->_filteringContext, "setRequiresSmile:", objc_msgSend(a3, "isOn"));
}

- (void)requiresNoBlinkChanged:(id)a3
{
  -[PUTopPeopleWallpaperSuggesterFilteringContext setRequiresNoBlink:](self->_filteringContext, "setRequiresNoBlink:", objc_msgSend(a3, "isOn"));
}

- (void)minimumFaceQualityChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumFaceQuality:](self->_filteringContext, "setMinimumFaceQuality:");

}

- (void)minimumFaceSizeChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumFaceSize:](self->_filteringContext, "setMinimumFaceSize:");

}

- (void)maximumFaceSizeChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMaximumFaceSize:](self->_filteringContext, "setMaximumFaceSize:");

}

- (void)maximumFaceRollChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMaximumFaceRoll:](self->_filteringContext, "setMaximumFaceRoll:");

}

- (void)minimumWallpaperScoreChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumWallpaperScore:](self->_filteringContext, "setMinimumWallpaperScore:");

}

- (void)minimumCropScoreChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumCropScore:](self->_filteringContext, "setMinimumCropScore:");

}

- (UITextField)normalizedDeviationForVeryImportantPersonsTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2096, 1);
}

- (UITextField)normalizedDeviationForImportantPersonsTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2104, 1);
}

- (UISwitch)favoritePersonsAreVIPsCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2112, 1);
}

- (UITextField)minimumNumberOfCandidatesForEligiblePersonTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2120, 1);
}

- (UITextField)timeIntervalForCandidateDedupingTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2128, 1);
}

- (UISwitch)requiresSmileCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2136, 1);
}

- (UISwitch)requiresNoBlinkCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2144, 1);
}

- (UITextField)minimumFaceQualityTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2152, 1);
}

- (UITextField)minimumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2160, 1);
}

- (UITextField)maximumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2168, 1);
}

- (UITextField)maximumFaceRollTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2176, 1);
}

- (UITextField)minimumWallpaperScoreTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2184, 1);
}

- (UITextField)minimumCropScoreTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumCropScoreTextField, 0);
  objc_storeStrong((id *)&self->_minimumWallpaperScoreTextField, 0);
  objc_storeStrong((id *)&self->_maximumFaceRollTextField, 0);
  objc_storeStrong((id *)&self->_maximumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_minimumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_minimumFaceQualityTextField, 0);
  objc_storeStrong((id *)&self->_requiresNoBlinkCheckBox, 0);
  objc_storeStrong((id *)&self->_requiresSmileCheckBox, 0);
  objc_storeStrong((id *)&self->_timeIntervalForCandidateDedupingTextField, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfCandidatesForEligiblePersonTextField, 0);
  objc_storeStrong((id *)&self->_favoritePersonsAreVIPsCheckBox, 0);
  objc_storeStrong((id *)&self->_normalizedDeviationForImportantPersonsTextField, 0);
  objc_storeStrong((id *)&self->_normalizedDeviationForVeryImportantPersonsTextField, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_filteringContext, 0);
}

void __92__PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView_initWithFilteringContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id firstValue;

  v5 = (objc_class *)MEMORY[0x1E0DC3990];
  v6 = a3;
  v7 = a2;
  firstValue = objc_alloc_init(v5);
  objc_msgSend(firstValue, "setText:", v6);

  objc_msgSend(firstValue, "sizeToFit");
  objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", firstValue);
  objc_msgSend(firstValue, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  v11 = *(void **)(a1 + 32);
  v12 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("label, view"), firstValue, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[label]-10-[view]->=0-|"), 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v14);

}

@end
