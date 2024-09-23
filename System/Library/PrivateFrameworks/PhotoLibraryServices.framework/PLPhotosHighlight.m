@implementation PLPhotosHighlight

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLPhotosHighlight;
  -[PLPhotosHighlight description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromHighlightKind:", -[PLPhotosHighlight kind](self, "kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@) - %@ (%@) (%@ - %@)"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  PLDescriptionBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const __CFString *v20;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  const __CFString *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  const __CFString *v30;
  unsigned int v31;
  const __CFString *v32;
  unsigned int v33;
  const __CFString *v34;
  unsigned int v35;
  const __CFString *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
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
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, 1);
  -[PLPhotosHighlight uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("uuid"), v4);

  -[PLPhotosHighlight title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLPhotosHighlight title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      -[PLPhotosHighlight title](self, "title");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("No title");
    }

  }
  else
  {
    v7 = CFSTR("No title");
  }

  -[PLPhotosHighlight subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PLPhotosHighlight subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      -[PLPhotosHighlight subtitle](self, "subtitle");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("No subtitle");
    }

  }
  else
  {
    v10 = CFSTR("No subtitle");
  }

  -[PLPhotosHighlight verboseSmartDescription](self, "verboseSmartDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PLPhotosHighlight verboseSmartDescription](self, "verboseSmartDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      -[PLPhotosHighlight verboseSmartDescription](self, "verboseSmartDescription");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("No verboseSmartDescription");
    }

  }
  else
  {
    v13 = CFSTR("No verboseSmartDescription");
  }

  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("title"), v7);
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("subtitle"), v10);
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("verboseSmartDescription"), v13);
  objc_msgSend((id)objc_opt_class(), "stringFromHighlightKind:", -[PLPhotosHighlight kind](self, "kind"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("kind"), v14);

  -[PLPhotosHighlight startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight endDate](self, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("start date (gmt)"), v15);
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("end date (gmt)"), v16);
  -[PLPhotosHighlight localStartDate](self, "localStartDate");
  v17 = objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight localEndDate](self, "localEndDate");
  v18 = objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("start date (local)"), v17);
  v77 = (void *)v18;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("end date (local)"), v18);
  v19 = -[PLPhotosHighlight type](self, "type");
  v20 = CFSTR("unknown");
  v21 = CFSTR("unknown");
  if (v19 <= 7)
    v21 = off_1E36611A8[v19];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("type"), v21);
  v22 = -[PLPhotosHighlight category](self, "category");
  v23 = CFSTR("PLPhotosHighlightCategoryRecent");
  if (v22 != 1)
    v23 = CFSTR("unknown");
  if (v22)
    v24 = v23;
  else
    v24 = CFSTR("PLPhotosHighlightCategoryDefault");
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("category"), v24);
  v25 = -[PLPhotosHighlight sharingComposition](self, "sharingComposition");
  if (v25 <= 2)
    v20 = off_1E36611E8[(unsigned __int16)v25];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("sharingComposition"), v20);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPhotosHighlight assetsCount](self, "assetsCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("assets count"), v26);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPhotosHighlight assetsCountShared](self, "assetsCountShared"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("assets count (shared)"), v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLPhotosHighlight assetsCountPrivate](self, "assetsCountPrivate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("assets count (private)"), v28);

  v29 = -[PLPhotosHighlight visibilityState](self, "visibilityState");
  if (v29 > 4)
    v30 = CFSTR("unknown");
  else
    v30 = off_1E3661200[v29];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("visibility private"), v30);
  v31 = -[PLPhotosHighlight visibilityStateShared](self, "visibilityStateShared");
  if (v31 > 4)
    v32 = CFSTR("unknown");
  else
    v32 = off_1E3661200[v31];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("visibility shared"), v32);
  v33 = -[PLPhotosHighlight visibilityStateMixed](self, "visibilityStateMixed");
  if (v33 > 4)
    v34 = CFSTR("unknown");
  else
    v34 = off_1E3661200[v33];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("visibility mixed"), v34);
  v35 = -[PLPhotosHighlight enrichmentState](self, "enrichmentState");
  if (v35 > 4)
    v36 = CFSTR("unknown");
  else
    v36 = off_1E3661228[v35];
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("enrichment state"), v36);
  v78 = (void *)v17;
  v37 = -[PLPhotosHighlight kind](self, "kind");
  switch(v37)
  {
    case 0:
      -[PLPhotosHighlight keyAssetPrivate](self, "keyAssetPrivate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset private id"), v38);

      -[PLPhotosHighlight keyAssetShared](self, "keyAssetShared");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset shared id"), v40);

      -[PLPhotosHighlight assets](self, "assets");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("assets count"), objc_msgSend(v41, "count"));

      if (-[PLPhotosHighlight assetsCountShared](self, "assetsCountShared") > 0)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("assets count (shared)"), -[PLPhotosHighlight assetsCountShared](self, "assetsCountShared"));
      -[PLPhotosHighlight summaryAssets](self, "summaryAssets");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("summary count"), objc_msgSend(v42, "count"));

      if (-[PLPhotosHighlight summaryCountShared](self, "summaryCountShared") >= 1)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("summary count (shared)"), -[PLPhotosHighlight summaryCountShared](self, "summaryCountShared"));
      -[PLPhotosHighlight extendedAssets](self, "extendedAssets");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("extended count"), objc_msgSend(v43, "count"));

      if (-[PLPhotosHighlight extendedCountShared](self, "extendedCountShared") >= 1)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("extended count (shared)"), -[PLPhotosHighlight extendedCountShared](self, "extendedCountShared"));
      -[PLPhotosHighlight moments](self, "moments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("moments count"), objc_msgSend(v44, "count"));
      goto LABEL_60;
    case 1:
      v72 = v16;
      v74 = v15;
      v71 = v13;
      v46 = v10;
      v47 = v7;
      -[PLPhotosHighlight monthKeyAssetPrivate](self, "monthKeyAssetPrivate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset private id"), v48);

      -[PLPhotosHighlight monthKeyAssetShared](self, "monthKeyAssetShared");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    case 2:
      v72 = v16;
      v74 = v15;
      v71 = v13;
      v46 = v10;
      v47 = v7;
      -[PLPhotosHighlight yearKeyAssetPrivate](self, "yearKeyAssetPrivate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset private id"), v50);

      -[PLPhotosHighlight yearKeyAssetShared](self, "yearKeyAssetShared");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:
      v39 = v49;
      objc_msgSend(v49, "localID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset shared id"), v51);

      -[PLPhotosHighlight childPhotosHighlights](self, "childPhotosHighlights");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "valueForKey:", CFSTR("uuid"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "allObjects");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n\t\t\t"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("child uuids"), v55);

      v7 = v47;
      v10 = v46;
      v13 = v71;
      v16 = v72;
      v15 = v74;
      if (v37 == 2)
        goto LABEL_62;
      goto LABEL_61;
    case 3:
      -[PLPhotosHighlight dayGroupKeyAssetPrivate](self, "dayGroupKeyAssetPrivate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset private id"), v56);

      -[PLPhotosHighlight dayGroupKeyAssetShared](self, "dayGroupKeyAssetShared");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset shared id"), v57);

      -[PLPhotosHighlight dayGroupAssets](self, "dayGroupAssets");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("assets count"), objc_msgSend(v58, "count"));

      if (-[PLPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared") > 0)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("assets count (shared)"), -[PLPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared"));
      -[PLPhotosHighlight dayGroupSummaryAssets](self, "dayGroupSummaryAssets");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("summary count"), objc_msgSend(v59, "count"));

      if (-[PLPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared") >= 1)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("summary count (shared)"), -[PLPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared"));
      v73 = v16;
      v75 = v15;
      -[PLPhotosHighlight dayGroupExtendedAssets](self, "dayGroupExtendedAssets");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("extended count"), objc_msgSend(v60, "count"));

      if (-[PLPhotosHighlight dayGroupExtendedAssetsCountShared](self, "dayGroupExtendedAssetsCountShared") >= 1)
        -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", CFSTR("extended count (shared)"), -[PLPhotosHighlight dayGroupExtendedAssetsCountShared](self, "dayGroupExtendedAssetsCountShared"));
      -[PLPhotosHighlight childDayGroupPhotosHighlights](self, "childDayGroupPhotosHighlights");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "valueForKey:", CFSTR("uuid"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "allObjects");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n\t\t\t"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("child day uuids"), v63);

      v16 = v73;
      v15 = v75;
      goto LABEL_60;
    default:
      objc_msgSend(0, "localID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset private id"), v45);

      objc_msgSend(0, "localID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("key asset shared id"), v44);
      v39 = 0;
      v76 = 0;
LABEL_60:

LABEL_61:
      -[PLPhotosHighlight parentPhotosHighlight](self, "parentPhotosHighlight");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "uuid");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("parent uuid"), v65);

LABEL_62:
      -[PLPhotosHighlight promotionScore](self, "promotionScore");
      -[PLDescriptionBuilder appendName:doubleValue:](v3, "appendName:doubleValue:", CFSTR("promotion score"));
      -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("start time zone offset"), (int)-[PLPhotosHighlight startTimeZoneOffset](self, "startTimeZoneOffset"));
      -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("end time zone offset"), (int)-[PLPhotosHighlight endTimeZoneOffset](self, "endTimeZoneOffset"));
      PLDescriptionForMemoryMood(-[PLPhotosHighlight mood](self, "mood"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("mood"), v66);

      -[PLPhotosHighlight moments](self, "moments");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      PLDebugDescriptionForAggregateProcessedLocationType(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("processed location type"), v68);

      -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("highlight version"), (int)-[PLPhotosHighlight highlightVersion](self, "highlightVersion"));
      -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("enrichment version"), (int)-[PLPhotosHighlight enrichmentVersion](self, "enrichmentVersion"));
      -[PLDescriptionBuilder build](v3, "build");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v69;
  }
}

- (void)_notifyChildSharingCompositionDidChangeFrom:(signed __int16)a3 to:(signed __int16)a4
{
  int v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = -[PLPhotosHighlight sharingComposition](self, "sharingComposition", a3);
  if (-[PLPhotosHighlight sharingComposition](self, "sharingComposition") != v4)
  {
    if (v4 == 2)
    {
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", &unk_1E375D680, CFSTR("sharingComposition"), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend((id)objc_opt_class(), "calculateSharingCompositionForPhotosHighlight:", self));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v7, CFSTR("sharingComposition"), 0);

    }
  }
  if (-[PLPhotosHighlight kind](self, "kind") != 2
    && -[PLPhotosHighlight sharingComposition](self, "sharingComposition") != (_DWORD)v6)
  {
    -[PLPhotosHighlight parentPhotosHighlight](self, "parentPhotosHighlight");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_notifyChildSharingCompositionDidChangeFrom:to:", v6, -[PLPhotosHighlight sharingComposition](self, "sharingComposition"));

  }
}

- (void)_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:(int)a3 to:(int)a4 forKeyPath:(id)a5
{
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotosHighlight.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestedAssetsCountKey"));

  }
  if (-[PLPhotosHighlight kind](self, "kind") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotosHighlight.m"), 495, CFSTR("only supported for month"));

  }
  v9 = a4 - a3;
  -[PLPhotosHighlight valueForKey:](self, "valueForKey:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v9 + v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v12, v15, 0);

}

- (int)assetsCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight assetsCount](self, "assetsCount");
  return v3 - -[PLPhotosHighlight assetsCountShared](self, "assetsCountShared");
}

- (void)recalculateSharedAssetContainerCachedValues
{
  PLPhotosHighlight *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  int v41;
  uint64_t v42;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t jj;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  PLPhotosHighlight *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  __int16 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t, void *);
  void *v126;
  id v127;
  __CFString *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(uint64_t, void *);
  void *v133;
  id v134;
  __CFString *v135;
  int v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v2 = self;
  v148 = *MEMORY[0x1E0C80C00];
  self->_waitingForSharedAssetContainerRecalc = 0;
  -[PLPhotosHighlight parentPhotosHighlight](self, "parentPhotosHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight parentDayGroupPhotosHighlight](v2, "parentDayGroupPhotosHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("assets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v7, CFSTR("assetsCount"), 0);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("dayGroupAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v10, CFSTR("dayGroupAssetsCount"), 0);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("dayGroupExtendedAssets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v13, CFSTR("dayGroupExtendedAssetsCount"), 0);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("dayGroupSummaryAssets"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v16, CFSTR("dayGroupSummaryAssetsCount"), 0);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("extendedAssets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v19, CFSTR("extendedCount"), 0);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPhotosHighlight objectIDsForRelationshipNamed:](v2, "objectIDsForRelationshipNamed:", CFSTR("summaryAssets"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v22, CFSTR("summaryCount"), 0);

  if (!-[PLPhotosHighlight kind](v2, "kind"))
  {
    v92 = v4;
    v93 = v3;
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v94 = v2;
    -[PLPhotosHighlight assets](v2, "assets");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
    if (!v33)
    {
      v35 = 0;
      v36 = 0;
      v37 = 0;
      goto LABEL_47;
    }
    v34 = v33;
    v35 = 0;
    v36 = 0;
    LODWORD(v37) = 0;
    v38 = *(_QWORD *)v138;
    while (1)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v138 != v38)
          objc_enumerationMutation(v32);
        v40 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        v41 = objc_msgSend(v40, "hasLibraryScope");
        v42 = objc_msgSend(v40, "libraryScopeShareState");
        if (v42 > 65537)
        {
          if (v42 == 65552 || v42 == 65538)
          {
LABEL_29:
            if (objc_msgSend(v40, "kind"))
            {
              if (objc_msgSend(v40, "kind") == 1)
                v35 = (v35 + 1);
              else
                v35 = v35;
            }
            else
            {
              v36 = (v36 + 1);
            }
          }
        }
        else if (v42 == 2 || v42 == 16)
        {
          goto LABEL_29;
        }
        v37 = (v37 + v41);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
      if (!v34)
      {
LABEL_47:

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v37);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v94;
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v94, "pl_safeSetValue:forKey:valueDidChangeHandler:", v51, CFSTR("assetsCountShared"), 0);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = MEMORY[0x1E0C809B0];
        v130 = MEMORY[0x1E0C809B0];
        v131 = 3221225472;
        v132 = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke;
        v133 = &unk_1E3661060;
        v3 = v93;
        v54 = v93;
        v136 = v36;
        v134 = v54;
        v135 = CFSTR("photoAssetsSuggestedByPhotosCount");
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v94, "pl_safeSetValue:forKey:valueDidChangeHandler:", v52);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v53;
        v124 = 3221225472;
        v125 = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_2;
        v126 = &unk_1E3661060;
        v129 = v35;
        v127 = v54;
        v128 = CFSTR("videoAssetsSuggestedByPhotosCount");
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v94, "pl_safeSetValue:forKey:valueDidChangeHandler:", v55);

        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        -[PLPhotosHighlight extendedAssets](v94, "extendedAssets");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v146, 16);
        if (v57)
        {
          v58 = v57;
          LODWORD(v59) = 0;
          v60 = *(_QWORD *)v120;
          v4 = v92;
          do
          {
            for (j = 0; j != v58; ++j)
            {
              if (*(_QWORD *)v120 != v60)
                objc_enumerationMutation(v56);
              v59 = v59
                  + objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "hasLibraryScope");
            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v146, 16);
          }
          while (v58);
        }
        else
        {
          v59 = 0;
          v4 = v92;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v94, "pl_safeSetValue:forKey:valueDidChangeHandler:", v62, CFSTR("extendedCountShared"), 0);

        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        -[PLPhotosHighlight summaryAssets](v94, "summaryAssets");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
        if (v64)
        {
          v65 = v64;
          LODWORD(v66) = 0;
          v67 = *(_QWORD *)v116;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v116 != v67)
                objc_enumerationMutation(v63);
              v66 = v66
                  + objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * k), "hasLibraryScope");
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, v145, 16);
          }
          while (v65);
        }
        else
        {
          v66 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = CFSTR("summaryCountShared");
LABEL_88:
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v69, v70, 0);
LABEL_89:

        goto LABEL_90;
      }
    }
  }
  if (-[PLPhotosHighlight kind](v2, "kind") == 1)
  {
    v23 = v4;
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    -[PLPhotosHighlight childPhotosHighlights](v2, "childPhotosHighlights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v112;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v112 != v29)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * m);
          if (!objc_msgSend(v31, "kind"))
          {
            v28 = objc_msgSend(v31, "photoAssetsSuggestedByPhotosCount") + v28;
            v27 = objc_msgSend(v31, "videoAssetsSuggestedByPhotosCount") + v27;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v71, CFSTR("photoAssetsSuggestedByPhotosCount"), 0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v69, CFSTR("videoAssetsSuggestedByPhotosCount"), 0);
    v4 = v23;
    goto LABEL_89;
  }
  if (-[PLPhotosHighlight kind](v2, "kind") == 3)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    -[PLPhotosHighlight dayGroupAssets](v2, "dayGroupAssets");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v107, v143, 16);
    if (v46)
    {
      v47 = v46;
      LODWORD(v48) = 0;
      v49 = *(_QWORD *)v108;
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v108 != v49)
            objc_enumerationMutation(v45);
          v48 = v48
              + objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * n), "hasLibraryScope");
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v107, v143, 16);
      }
      while (v47);
    }
    else
    {
      v48 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v72, CFSTR("dayGroupAssetsCountShared"), 0);

    v105 = 0u;
    v106 = 0u;
    v104 = 0u;
    v103 = 0u;
    -[PLPhotosHighlight dayGroupExtendedAssets](v2, "dayGroupExtendedAssets");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v103, v142, 16);
    if (v74)
    {
      v75 = v74;
      LODWORD(v76) = 0;
      v77 = *(_QWORD *)v104;
      do
      {
        for (ii = 0; ii != v75; ++ii)
        {
          if (*(_QWORD *)v104 != v77)
            objc_enumerationMutation(v73);
          v76 = v76
              + objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * ii), "hasLibraryScope");
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v103, v142, 16);
      }
      while (v75);
    }
    else
    {
      v76 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v79, CFSTR("dayGroupExtendedAssetsCountShared"), 0);

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[PLPhotosHighlight dayGroupSummaryAssets](v2, "dayGroupSummaryAssets");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v99, v141, 16);
    if (v81)
    {
      v82 = v81;
      LODWORD(v83) = 0;
      v84 = *(_QWORD *)v100;
      do
      {
        for (jj = 0; jj != v82; ++jj)
        {
          if (*(_QWORD *)v100 != v84)
            objc_enumerationMutation(v80);
          v83 = v83
              + objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * jj), "hasLibraryScope");
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v99, v141, 16);
      }
      while (v82);
    }
    else
    {
      v83 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v83);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = CFSTR("dayGroupSummaryAssetsCountShared");
    goto LABEL_88;
  }
LABEL_90:
  v86 = objc_msgSend((id)objc_opt_class(), "calculateSharingCompositionForPhotosHighlight:", v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_3;
  v95[3] = &unk_1E3661088;
  v98 = v86;
  v96 = v3;
  v97 = v4;
  v88 = v4;
  v89 = v3;
  v90 = v88;
  v91 = v89;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v2, "pl_safeSetValue:forKey:valueDidChangeHandler:", v87, CFSTR("sharingComposition"), v95);

}

- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  id v31;
  id *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  void *v37;
  int v38;
  id v39;
  int v40;
  int v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  const __CFString *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, void *);
  void *v56;
  id v57;
  const __CFString *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, void *);
  void *v63;
  id v64;
  const __CFString *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, void *);
  void *v70;
  id v71;
  const __CFString *v72;
  int v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "highlightContainerChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotosHighlight.m"), 650, CFSTR("unexpected change type."));

  }
  if (!self->_waitingForSharedAssetContainerRecalc)
  {
    if (-[PLPhotosHighlight isInserted](self, "isInserted"))
    {
      PLMomentsGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[PLPhotosHighlight objectID](self, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Marking highlight: %@ as waiting for recalc...", buf, 0xCu);

      }
      self->_waitingForSharedAssetContainerRecalc = 1;
      goto LABEL_44;
    }
    if ((-[PLPhotosHighlight isDeleted](self, "isDeleted") & 1) != 0)
      goto LABEL_44;
    PLMomentsGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotosHighlight objectID](self, "objectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = v14;
      v76 = 2112;
      v77 = v15;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Processing incremental change: %@ for highlight: %@...", buf, 0x16u);

    }
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("Shared"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "mediaType"))
      v17 = CFSTR("videoAssetsSuggestedByPhotosCount");
    else
      v17 = CFSTR("photoAssetsSuggestedByPhotosCount");
    -[PLPhotosHighlight primitiveValueForKey:](self, "primitiveValueForKey:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    -[PLPhotosHighlight primitiveValueForKey:](self, "primitiveValueForKey:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    v47 = v17;
    -[PLPhotosHighlight primitiveValueForKey:](self, "primitiveValueForKey:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v22, "intValue");

    -[PLPhotosHighlight parentPhotosHighlight](self, "parentPhotosHighlight");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlight parentDayGroupPhotosHighlight](self, "parentDayGroupPhotosHighlight");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v8, "isEqual:", CFSTR("assetsCount"));
    v25 = objc_msgSend(v7, "collectionChangeType");
    if ((unint64_t)(v25 - 1) < 2)
    {
      if (objc_msgSend(v7, "collectionChangeType") == 1)
        v26 = 1;
      else
        v26 = -1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v26 + v19));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v27, v8, 0);

      if (objc_msgSend(v7, "sharingChange") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v26 + v21));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v28, v16, 0);

      }
      if (!objc_msgSend(v8, "isEqual:", CFSTR("assetsCount"))
        || objc_msgSend(v7, "suggestionStateChange") != 1)
      {
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v26 + v46));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = MEMORY[0x1E0C809B0];
      v54 = 3221225472;
      v55 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_3;
      v56 = &unk_1E3661060;
      v30 = &v57;
      v31 = v23;
      v59 = v26 + v46;
      v32 = (id *)&v58;
      v57 = v31;
      v58 = v47;
      goto LABEL_39;
    }
    if (v25)
      goto LABEL_40;
    v33 = objc_msgSend(v7, "sharingChange");
    if (v33 == 2)
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      if (v21 <= 1)
        v36 = 1;
      else
        v36 = v21;
      v35 = (v36 - 1);
    }
    else
    {
      if (v33 != 1)
        goto LABEL_32;
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = (v21 + 1);
    }
    objc_msgSend(v34, "numberWithInt:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v37, v16, 0);

LABEL_32:
    if (!v24)
      goto LABEL_40;
    v38 = objc_msgSend(v7, "suggestionStateChange");
    if (v38 == 2)
    {
      v40 = v46;
      if (v46 <= 1)
        v40 = 1;
      v41 = v40 - 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v40 - 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_2;
      v63 = &unk_1E3661060;
      v30 = &v64;
      v42 = v23;
      v66 = v41;
      v32 = (id *)&v65;
      v64 = v42;
      v65 = v47;
    }
    else
    {
      if (v38 != 1)
        goto LABEL_40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v46 + 1));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = MEMORY[0x1E0C809B0];
      v68 = 3221225472;
      v69 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke;
      v70 = &unk_1E3661060;
      v30 = &v71;
      v39 = v23;
      v73 = v46 + 1;
      v32 = (id *)&v72;
      v71 = v39;
      v72 = v47;
    }
LABEL_39:
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v29);

LABEL_40:
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("assetsCount")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("dayGroupAssetsCount")))
    {
      v43 = objc_msgSend((id)objc_opt_class(), "calculateSharingCompositionForPhotosHighlight:", self);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_4;
      v49[3] = &unk_1E3661088;
      v50 = v23;
      v52 = v43;
      v51 = v48;
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v44, CFSTR("sharingComposition"), v49);

    }
  }
LABEL_44:

}

- (int)_cachedAssetCountForCountKey:(id)a3 collectionKey:(id)a4 isShared:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  PLPhotosHighlight *v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((-[PLPhotosHighlight hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", v9) & 1) != 0)
  {
    if (self->_waitingForSharedAssetContainerRecalc)
      -[PLPhotosHighlight recalculateSharedAssetContainerCachedValues](self, "recalculateSharedAssetContainerCachedValues");
    -[PLPhotosHighlight willAccessValueForKey:](self, "willAccessValueForKey:", v8);
    -[PLPhotosHighlight primitiveValueForKey:](self, "primitiveValueForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v10, "intValue");

    -[PLPhotosHighlight didAccessValueForKey:](self, "didAccessValueForKey:", v8);
  }
  else
  {
    if (v5)
    {
      -[PLPhotosHighlight valueForKey:](self, "valueForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = v13;
        LODWORD(v11) = 0;
        v15 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            v11 = v11
                + objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "hasLibraryScope");
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v14);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      -[PLPhotosHighlight objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "count");
    }

    if (PLIsAssetsd())
    {
      -[PLPhotosHighlight objectID](self, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__PLPhotosHighlight__cachedAssetCountForCountKey_collectionKey_isShared___block_invoke;
      v21[3] = &unk_1E36610B0;
      v22 = v17;
      v25 = v11;
      v23 = v8;
      v24 = self;
      v19 = v17;
      -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v18, v23, v21);

    }
  }

  return v11;
}

- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotosHighlight.m"), 820, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (self->_waitingForSharedAssetContainerRecalc)
    -[PLPhotosHighlight recalculateSharedAssetContainerCachedValues](self, "recalculateSharedAssetContainerCachedValues");
  -[PLPhotosHighlight willAccessValueForKey:](self, "willAccessValueForKey:", v5);
  -[PLPhotosHighlight primitiveValueForKey:](self, "primitiveValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  -[PLPhotosHighlight didAccessValueForKey:](self, "didAccessValueForKey:", v5);
  return v7;
}

- (int)assetsCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("assetsCount"), CFSTR("assets"), 0);
}

- (int)extendedCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("extendedCount"), CFSTR("extendedAssets"), 0);
}

- (int)summaryCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("summaryCount"), CFSTR("summaryAssets"), 0);
}

- (int)dayGroupAssetsCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupAssetsCount"), CFSTR("dayGroupAssets"), 0);
}

- (int)dayGroupExtendedAssetsCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupExtendedAssetsCount"), CFSTR("dayGroupExtendedAssets"), 0);
}

- (int)dayGroupSummaryAssetsCount
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupSummaryAssetsCount"), CFSTR("dayGroupSummaryAssets"), 0);
}

- (int)assetsCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("assetsCountShared"), CFSTR("assets"), 1);
}

- (int)extendedCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("extendedCountShared"), CFSTR("extendedAssets"), 1);
}

- (int)summaryCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("summaryCountShared"), CFSTR("summaryAssets"), 1);
}

- (int)dayGroupAssetsCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupAssetsCountShared"), CFSTR("dayGroupAssets"), 1);
}

- (int)dayGroupExtendedAssetsCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupExtendedAssetsCountShared"), CFSTR("dayGroupExtendedAssets"), 1);
}

- (int)dayGroupSummaryAssetsCountShared
{
  return -[PLPhotosHighlight _cachedAssetCountForCountKey:collectionKey:isShared:](self, "_cachedAssetCountForCountKey:collectionKey:isShared:", CFSTR("dayGroupSummaryAssetsCountShared"), CFSTR("dayGroupSummaryAssets"), 1);
}

- (signed)sharingComposition
{
  return -[PLPhotosHighlight _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("sharingComposition"));
}

- (int)photoAssetsSuggestedByPhotosCount
{
  return -[PLPhotosHighlight _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("photoAssetsSuggestedByPhotosCount"));
}

- (int)videoAssetsSuggestedByPhotosCount
{
  return -[PLPhotosHighlight _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:](self, "_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:", CFSTR("videoAssetsSuggestedByPhotosCount"));
}

- (int)summaryCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight summaryCount](self, "summaryCount");
  return v3 - -[PLPhotosHighlight summaryCountShared](self, "summaryCountShared");
}

- (int)extendedCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight extendedCount](self, "extendedCount");
  return v3 - -[PLPhotosHighlight extendedCountShared](self, "extendedCountShared");
}

- (int)dayGroupAssetsCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight dayGroupAssetsCount](self, "dayGroupAssetsCount");
  return v3 - -[PLPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared");
}

- (int)dayGroupExtendedAssetsCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight dayGroupExtendedAssetsCount](self, "dayGroupExtendedAssetsCount");
  return v3 - -[PLPhotosHighlight dayGroupExtendedAssetsCountShared](self, "dayGroupExtendedAssetsCountShared");
}

- (int)dayGroupSummaryAssetsCountPrivate
{
  int v3;

  v3 = -[PLPhotosHighlight dayGroupSummaryAssetsCount](self, "dayGroupSummaryAssetsCount");
  return v3 - -[PLPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared");
}

- (void)setParentPhotosHighlight:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self))
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_FAULT, "Attempt to set parentPhotosHighlight to self for highlight: %{public}@", buf, 0xCu);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLPhotosHighlight_setParentPhotosHighlight___block_invoke;
  v7[3] = &unk_1E3670DE8;
  v8 = v4;
  v6 = v4;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v6, CFSTR("parentPhotosHighlight"), v7);

}

- (void)setAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("assets"), 0);
}

- (void)setSummaryAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("summaryAssets"), 0);
}

- (void)setExtendedAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("extendedAssets"), 0);
}

- (void)setDayGroupAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("dayGroupAssets"), 0);
}

- (void)setDayGroupSummaryAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("dayGroupSummaryAssets"), 0);
}

- (void)setDayGroupExtendedAssets:(id)a3
{
  self->_waitingForSharedAssetContainerRecalc = 1;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("dayGroupExtendedAssets"), 0);
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLPhotosHighlight;
  -[PLPhotosHighlight awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlight setUuid:](self, "setUuid:", v3);

}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotosHighlight;
  -[PLManagedObject prepareForDeletion](&v5, sel_prepareForDeletion);
  objc_opt_class();
  -[PLPhotosHighlight managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    +[PLDelayedSearchIndexUpdates recordHighlightIfNeeded:](PLDelayedSearchIndexUpdates, "recordHighlightIfNeeded:", self);
}

- (void)willSave
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotosHighlight;
  -[PLManagedObject willSave](&v5, sel_willSave);
  -[PLPhotosHighlight managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_waitingForSharedAssetContainerRecalc && (-[PLPhotosHighlight isDeleted](self, "isDeleted") & 1) == 0)
      -[PLPhotosHighlight recalculateSharedAssetContainerCachedValues](self, "recalculateSharedAssetContainerCachedValues");
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v3, "delayedSaveActions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordHighlightForSearchIndexUpdate:", self);

    }
    if ((-[PLPhotosHighlight isDeleted](self, "isDeleted") & 1) == 0)
      +[PLDelayedSearchIndexUpdates recordHighlightIfNeeded:](PLDelayedSearchIndexUpdates, "recordHighlightIfNeeded:", self);
    if (_os_feature_enabled_impl()
      && !-[PLPhotosHighlight kind](self, "kind")
      && -[PLPhotosHighlight _needsRecalculateCollageAssets](self, "_needsRecalculateCollageAssets"))
    {
      -[PLPhotosHighlight recalculateCollageAssets](self, "recalculateCollageAssets");
    }
  }

}

- (BOOL)_needsRecalculateCollageAssets
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLPhotosHighlight changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PLPhotosHighlight isDeleted](self, "isDeleted") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("extendedAssets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("keyAssetPrivate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("keyAssetShared"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return v4;
}

- (void)recalculateCollageAssets
{
  -[PLPhotosHighlight _recalculateCollageAssetsForSharingConsideration:](self, "_recalculateCollageAssetsForSharingConsideration:", 0);
  -[PLPhotosHighlight _recalculateCollageAssetsForSharingConsideration:](self, "_recalculateCollageAssetsForSharingConsideration:", 1);
  -[PLPhotosHighlight _recalculateCollageAssetsForSharingConsideration:](self, "_recalculateCollageAssetsForSharingConsideration:", 2);
}

- (void)_recalculateCollageAssetsForSharingConsideration:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  PLPhotosHighlight *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[PLPhotosHighlight _extendedAssetsForSharingConsideration:](self, "_extendedAssetsForSharingConsideration:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 4)
  {
    -[PLPhotosHighlight _keyAssetForSharingConsideration:](self, "_keyAssetForSharingConsideration:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "addObject:", v7);
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "removeObject:", v7);

      v6 = v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    if (v13)
    {
      v14 = v13;
      v15 = 3;
      if (!v7)
        v15 = 4;
      if (v13 <= v15)
      {
        objc_msgSend(v5, "addObjectsFromArray:", v12);
      }
      else
      {
        v21 = self;
        v16 = 0;
        v17 = vcvtmd_u64_f64((double)v13 / ((double)v15 + -1.0));
        v18 = v15 - 1;
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v16, v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

          v16 += v17;
          --v18;
        }
        while (v18);
        objc_msgSend(v12, "objectAtIndexedSubscript:", v14 - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

        self = v21;
      }
    }

  }
  if ((unint64_t)a3 <= 2)
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, off_1E3661270[a3], 0);

}

- (id)_keyAssetForSharingConsideration:(int64_t)a3
{
  unsigned int v4;
  void *v5;

  if (a3 != 2)
  {
    if (a3 != 1)
    {
      if (a3)
        goto LABEL_9;
      goto LABEL_6;
    }
LABEL_8:
    -[PLPhotosHighlight keyAssetForKindShared](self, "keyAssetForKindShared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v4 = -[PLPhotosHighlight mixedSharingCompositionKeyAssetRelationship](self, "mixedSharingCompositionKeyAssetRelationship");
  if (v4 >= 2)
  {
    if (v4 != 2)
    {
LABEL_9:
      v5 = 0;
      return v5;
    }
    goto LABEL_8;
  }
LABEL_6:
  -[PLPhotosHighlight keyAssetForKindPrivate](self, "keyAssetForKindPrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)_extendedAssetsForSharingConsideration:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[PLPhotosHighlight extendedAssets](self, "extendedAssets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[PLPhotosHighlight extendedAssetsShared](self, "extendedAssetsShared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    else
      -[PLPhotosHighlight extendedAssetsPrivate](self, "extendedAssetsPrivate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)bumpHighlightVersion
{
  void *v3;
  void *v4;
  int v5;
  __int16 v6;

  if (!-[PLPhotosHighlight hasChanges](self, "hasChanges")
    || (-[PLPhotosHighlight changedValues](self, "changedValues"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("highlightVersion")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v5 = -[PLPhotosHighlight highlightVersion](self, "highlightVersion");
    if (v5 == 0x7FFF)
      v6 = 0;
    else
      v6 = v5 + 1;
    -[PLPhotosHighlight setHighlightVersion:](self, "setHighlightVersion:", v6);
  }
}

- (BOOL)supportsDiagnosticInformation
{
  return 1;
}

- (id)diagnosticInformation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[PLPhotosHighlight description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v20 = v5;
  objc_msgSend(v5, "appendString:", CFSTR("\n\nAsset Information:\n"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PLPhotosHighlight assets](self, "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v19 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "filename");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateCreated");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "width");
        v15 = objc_msgSend(v9, "height");
        objc_msgSend(v9, "modificationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("\nAsset: uuid: %@, filename: %@, dateCreated: %@, location: %@, width: %lld, height: %lld, modificationDate: %@, reverseLocationDataIsValid: %d"), v10, v11, v12, v13, v14, v15, v16, objc_msgSend(v9, "reverseLocationDataIsValid"));

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  return v20;
}

- (void)removeAssetData:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotosHighlight.m"), 1409, CFSTR("Incorrect class given in %s"), "-[PLPhotosHighlight removeAssetData:]");

  }
  -[PLPhotosHighlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assets"));
  -[PLPhotosHighlight primitiveAssets](self, "primitiveAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[PLPhotosHighlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assets"));
}

- (void)delete
{
  id v3;

  -[PLPhotosHighlight managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (NSArray)momentsSortedByTime
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight moments](self, "moments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment sortByTimeSortDescriptors](PLMoment, "sortByTimeSortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (PLManagedAsset)keyAssetForKindPrivate
{
  void *v3;

  switch(-[PLPhotosHighlight kind](self, "kind"))
  {
    case 0u:
      -[PLPhotosHighlight keyAssetPrivate](self, "keyAssetPrivate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1u:
      -[PLPhotosHighlight monthKeyAssetPrivate](self, "monthKeyAssetPrivate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      -[PLPhotosHighlight yearKeyAssetPrivate](self, "yearKeyAssetPrivate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      -[PLPhotosHighlight dayGroupKeyAssetPrivate](self, "dayGroupKeyAssetPrivate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (PLManagedAsset *)v3;
}

- (void)setKeyAssetForKindPrivate:(id)a3
{
  id v4;

  v4 = a3;
  switch(-[PLPhotosHighlight kind](self, "kind"))
  {
    case 0u:
      -[PLPhotosHighlight setKeyAssetPrivate:](self, "setKeyAssetPrivate:", v4);
      break;
    case 1u:
      -[PLPhotosHighlight setMonthKeyAssetPrivate:](self, "setMonthKeyAssetPrivate:", v4);
      break;
    case 2u:
      -[PLPhotosHighlight setYearKeyAssetPrivate:](self, "setYearKeyAssetPrivate:", v4);
      break;
    case 3u:
      -[PLPhotosHighlight setDayGroupKeyAssetPrivate:](self, "setDayGroupKeyAssetPrivate:", v4);
      break;
    default:
      break;
  }

}

- (NSDate)localStartDate
{
  void *v3;
  void *v4;

  -[PLPhotosHighlight startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLPhotosHighlight startTimeZoneOffset](self, "startTimeZoneOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)localEndDate
{
  void *v3;
  void *v4;

  -[PLPhotosHighlight endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLPhotosHighlight endTimeZoneOffset](self, "endTimeZoneOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)missingKeyAssetForKindShared
{
  void *v3;
  BOOL v4;

  if (!-[PLPhotosHighlight sharingComposition](self, "sharingComposition"))
    return 0;
  -[PLPhotosHighlight keyAssetForKindShared](self, "keyAssetForKindShared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)missingKeyAssetForKindPrivate
{
  BOOL v3;
  void *v4;

  if (-[PLPhotosHighlight sharingComposition](self, "sharingComposition") == 1)
    return 0;
  -[PLPhotosHighlight keyAssetForKindPrivate](self, "keyAssetForKindPrivate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (NSSet)assetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)summaryAssetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight summaryAssets](self, "summaryAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)extendedAssetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight extendedAssets](self, "extendedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupAssetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupAssets](self, "dayGroupAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupExtendedAssetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupExtendedAssets](self, "dayGroupExtendedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupSummaryAssetsPrivate
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupSummaryAssets](self, "dayGroupSummaryAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (PLManagedAsset)keyAssetForKindShared
{
  void *v3;

  switch(-[PLPhotosHighlight kind](self, "kind"))
  {
    case 0u:
      -[PLPhotosHighlight keyAssetShared](self, "keyAssetShared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1u:
      -[PLPhotosHighlight monthKeyAssetShared](self, "monthKeyAssetShared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      -[PLPhotosHighlight yearKeyAssetShared](self, "yearKeyAssetShared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      -[PLPhotosHighlight dayGroupKeyAssetShared](self, "dayGroupKeyAssetShared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (PLManagedAsset *)v3;
}

- (void)setKeyAssetForKindShared:(id)a3
{
  id v4;

  v4 = a3;
  switch(-[PLPhotosHighlight kind](self, "kind"))
  {
    case 0u:
      -[PLPhotosHighlight setKeyAssetShared:](self, "setKeyAssetShared:", v4);
      break;
    case 1u:
      -[PLPhotosHighlight setMonthKeyAssetShared:](self, "setMonthKeyAssetShared:", v4);
      break;
    case 2u:
      -[PLPhotosHighlight setYearKeyAssetShared:](self, "setYearKeyAssetShared:", v4);
      break;
    case 3u:
      -[PLPhotosHighlight setDayGroupKeyAssetShared:](self, "setDayGroupKeyAssetShared:", v4);
      break;
    default:
      break;
  }

}

- (NSSet)assetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)summaryAssetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight summaryAssets](self, "summaryAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)extendedAssetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight extendedAssets](self, "extendedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupAssetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupAssets](self, "dayGroupAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupExtendedAssetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupExtendedAssets](self, "dayGroupExtendedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)dayGroupSummaryAssetsShared
{
  void *v2;
  void *v3;
  void *v4;

  -[PLPhotosHighlight dayGroupSummaryAssets](self, "dayGroupSummaryAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_libraryScopePredicateForSharingConsideration:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (unint64_t)numberOfAssetsInExtendedForSharingConsideration:(int64_t)a3
{
  int v5;
  unint64_t result;

  v5 = -[PLPhotosHighlight kind](self, "kind");
  if (v5 == 3)
  {
    switch(a3)
    {
      case 2:
        LODWORD(result) = -[PLPhotosHighlight dayGroupExtendedAssetsCount](self, "dayGroupExtendedAssetsCount");
        return (int)result;
      case 1:
        LODWORD(result) = -[PLPhotosHighlight dayGroupExtendedAssetsCountShared](self, "dayGroupExtendedAssetsCountShared");
        return (int)result;
      case 0:
        LODWORD(result) = -[PLPhotosHighlight dayGroupExtendedAssetsCountPrivate](self, "dayGroupExtendedAssetsCountPrivate");
        return (int)result;
    }
    return 0;
  }
  if (v5)
    return 0;
  if (a3 == 2)
  {
    LODWORD(result) = -[PLPhotosHighlight extendedCount](self, "extendedCount");
    return (int)result;
  }
  if (a3 == 1)
  {
    LODWORD(result) = -[PLPhotosHighlight extendedCountShared](self, "extendedCountShared");
    return (int)result;
  }
  if (a3)
    return 0;
  LODWORD(result) = -[PLPhotosHighlight extendedCountPrivate](self, "extendedCountPrivate");
  return (int)result;
}

- (BOOL)isRecent
{
  return -[PLPhotosHighlight category](self, "category") == 1;
}

uint64_t __46__PLPhotosHighlight_setParentPhotosHighlight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recalculateSharedAssetContainerCachedValues");
}

void __73__PLPhotosHighlight__cachedAssetCountForCountKey_collectionKey_isShared___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLMomentsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Fixing cached count for object: %@ on key: %@ from %@ to %@...", (uint8_t *)&v8, 0x2Au);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 64) = 1;

}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "kind") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "kind") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "kind") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_notifyChildSharingCompositionDidChangeFrom:to:", objc_msgSend(v4, "shortValue"), *(__int16 *)(a1 + 48));
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(v4, "shortValue");

  return objc_msgSend(v5, "_notifyChildSharingCompositionDidChangeFrom:to:", v6, *(__int16 *)(a1 + 48));
}

void __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "kind") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "kind") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_notifyChildSharingCompositionDidChangeFrom:to:", objc_msgSend(v4, "shortValue"), *(__int16 *)(a1 + 48));
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(v4, "shortValue");

  return objc_msgSend(v5, "_notifyChildSharingCompositionDidChangeFrom:to:", v6, *(__int16 *)(a1 + 48));
}

+ (id)stringFromHighlightKind:(unsigned __int16)a3
{
  if (a3 > 3u)
    return CFSTR("Unknown kind");
  else
    return off_1E3661250[a3];
}

+ (signed)calculateSharingCompositionForPhotosHighlight:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  __int16 v14;
  signed __int16 v15;
  int v16;
  int v17;
  __int16 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "kind");
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3 || !v4)
    {
      if (objc_msgSend(v3, "kind") == 3)
        v5 = objc_msgSend(v3, "dayGroupAssetsCountShared");
      else
        v5 = objc_msgSend(v3, "assetsCountShared");
      v16 = v5;
      if (objc_msgSend(v3, "kind") == 3)
        v17 = objc_msgSend(v3, "dayGroupAssetsCountPrivate");
      else
        v17 = objc_msgSend(v3, "assetsCountPrivate");
      if (v17)
        v18 = 2;
      else
        v18 = 1;
      if (v16)
        v15 = v18;
      else
        v15 = 0;
      goto LABEL_41;
    }
LABEL_40:
    v15 = 0;
    goto LABEL_41;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "childPhotosHighlights", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v7)
  {

    goto LABEL_40;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v6);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "sharingComposition");
      if (v13 == 2)
      {
        v9 = 1;
      }
      else if (v13 != 1)
      {
        if (!v13)
          v9 = 1;
        if ((v10 & 1) == 0)
          continue;
        goto LABEL_19;
      }
      v10 = 1;
LABEL_19:
      if ((v9 & 1) != 0)
      {

        v10 = 1;
        goto LABEL_25;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
      continue;
    break;
  }

  if ((v9 & 1) == 0)
  {
    v14 = 1;
    goto LABEL_26;
  }
LABEL_25:
  v14 = 2;
LABEL_26:
  if ((v10 & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
LABEL_41:

  return v15;
}

+ (id)fetchRequest
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  return v5;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setUuid:", v8);
    objc_msgSend(v12, "setTitle:", v9);
  }

  return v12;
}

+ (id)entityName
{
  return CFSTR("PhotosHighlight");
}

+ (id)insertNewPhotosHighlightInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allPhotosHighlightsInManagedObjectContext:(id)a3 predicate:(id)a4 keyPathsForPrefetching:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchBatchSize:", 100);
  if (v11)
    objc_msgSend(v15, "setPredicate:", v11);
  if (v12)
    objc_msgSend(v15, "setRelationshipKeyPathsForPrefetching:", v12);
  objc_msgSend(v10, "executeFetchRequest:error:", v15, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForAllAssetsInPhotosHighlight:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "kind");
  v5 = v4;
  if ((v4 - 1) < 2)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v15 = v5;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error: kind %d not supported for fetching all assets - highlight UUID: %@", buf, 0x12u);

    }
  }
  else
  {
    if (v4 == 3)
    {
      v6 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v3, "objectID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("dayGroupHighlightBeingAssets");
      goto LABEL_10;
    }
    if (!v4)
    {
      v6 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v3, "objectID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("highlightBeingAssets");
LABEL_10:
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), v9, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_predicateForHighlightsOfKind:(unsigned __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), a3);
}

+ (id)predicateForEmptyHighlightsOfKind:(unsigned __int16)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_predicateForHighlightsOfKind:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 > 3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", off_1E3661288[v3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x1E0CB3528];
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForInvalidHighlightsOfAllKinds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForInvalidDayHighlights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForInvalidDayGroupHighlights", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(a1, "predicateForInvalidMonthOrYearHighlights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForInvalidDayHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moments.@count = 0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assets.@count = 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %u"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForInvalidDayGroupHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("childDayGroupPhotosHighlights.@count = 0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dayGroupAssets.@count = 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %u"), 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForInvalidMonthOrYearHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("childPhotosHighlights.@count = 0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %u"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %u"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v2;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForAllTripHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %u OR %K = %u OR %K = %u"), CFSTR("type"), 1, CFSTR("type"), 2, CFSTR("type"), 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)batchFetchPhotosHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlight.m"), 1295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setResultType:", 2);
  v46[0] = CFSTR("uuid");
  v46[1] = CFSTR("highlightBeingAssets.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPropertiesToFetch:", v16);

  if (!a5)
  {
    v42 = 0;
    a5 = (id *)&v42;
  }
  objc_msgSend(v11, "executeFetchRequest:error:", v14, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v20)
    {
      v21 = v20;
      v33 = v15;
      v34 = v14;
      v35 = v11;
      v36 = v10;
      v37 = v9;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("highlightBeingAssets.uuid"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("uuid"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (v28)
          {
            PLPhotoKitGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v27;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_INFO, "Couldn't fetch highlight for asset UUID: %@", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v26);
          }

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v21);
      v10 = v36;
      v9 = v37;
      v14 = v34;
      v11 = v35;
      v15 = v33;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v30 = *a5;
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Highlight fetch using asset UUIDs failed with error: %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)batchFetchTripHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  id v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlight.m"), 1332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v9);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN %@"), CFSTR("dayGroupHighlightBeingAssets"), CFSTR("type"), &unk_1E3763278);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3528];
  v43 = (void *)v16;
  v44 = (void *)v15;
  v56[0] = v15;
  v56[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v19;
  objc_msgSend(v14, "setPredicate:", v19);
  objc_msgSend(v14, "setResultType:", 2);
  v55[0] = CFSTR("uuid");
  v55[1] = CFSTR("dayGroupHighlightBeingAssets.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPropertiesToFetch:", v21);

  if (!a5)
  {
    v49 = 0;
    a5 = (id *)&v49;
  }
  objc_msgSend(v11, "executeFetchRequest:error:", v14, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v42 = v14;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v24 = v22;
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v25)
    {
      v26 = v25;
      v38 = v20;
      v39 = v11;
      v40 = v10;
      v41 = v9;
      v27 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("dayGroupHighlightBeingAssets.uuid"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("uuid"));
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v30)
            v33 = v31 == 0;
          else
            v33 = 1;
          if (v33)
          {
            PLPhotoKitGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v51 = v32;
              v52 = 2114;
              v53 = v30;
              _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Could not fetch trip highlight for asset UUID: %{public}@, trip highlight UUID:%{public}@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v23, "setObject:forKey:", v30, v31);
          }

        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v26);
      v10 = v40;
      v9 = v41;
      v20 = v38;
      v11 = v39;
      v14 = v42;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v35 = *a5;
      *(_DWORD *)buf = 138412290;
      v51 = v35;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Trip Highlight fetch using asset UUIDs failed with error: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)batchFetchPhotosHighlightUUIDsByMomentUUIDsWithMomentUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlight.m"), 1372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLMoment entityName](PLMoment, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);
  objc_msgSend(v14, "setResultType:", 2);
  v48[0] = CFSTR("uuid");
  v48[1] = CFSTR("highlight.uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPropertiesToFetch:", v16);

  if (!a5)
  {
    v42 = 0;
    a5 = (id *)&v42;
  }
  objc_msgSend(v11, "executeFetchRequest:error:", v14, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v20)
    {
      v21 = v20;
      v33 = v15;
      v34 = v14;
      v35 = v11;
      v36 = v10;
      v37 = v9;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("highlight.uuid"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("uuid"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (v28)
          {
            PLPhotoKitGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v44 = v27;
              v45 = 2112;
              v46 = v25;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@, highlight UUID: %@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, v26);
          }

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v21);
      v10 = v36;
      v9 = v37;
      v14 = v34;
      v11 = v35;
      v15 = v33;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v30 = *a5;
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

+ (NSArray)sortByTimeSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)_libraryScopePredicateForSharingConsideration:(int64_t)a3
{
  uint64_t *v4;

  if (_libraryScopePredicateForSharingConsideration__sOnceToken != -1)
    dispatch_once(&_libraryScopePredicateForSharingConsideration__sOnceToken, &__block_literal_global_4376);
  v4 = &_libraryScopePredicateForSharingConsideration__sPredicatePrivate;
  if (a3)
    v4 = &_libraryScopePredicateForSharingConsideration__sPredicateShared;
  return (id)*v4;
}

void __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_340);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_libraryScopePredicateForSharingConsideration__sPredicateShared;
  _libraryScopePredicateForSharingConsideration__sPredicateShared = v0;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_341);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_libraryScopePredicateForSharingConsideration__sPredicatePrivate;
  _libraryScopePredicateForSharingConsideration__sPredicatePrivate = v2;

}

uint64_t __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasLibraryScope") ^ 1;
}

uint64_t __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasLibraryScope");
}

+ (id)allowedPropertiesForMomentList
{
  pl_dispatch_once();
  return (id)allowedPropertiesForMomentList_pl_once_object_28;
}

+ (id)defaultPropertiesToFetchForMomentList
{
  pl_dispatch_once();
  return (id)defaultPropertiesToFetchForMomentList_pl_once_object_29;
}

void __80__PLPhotosHighlight_PLMomentList_Private__defaultPropertiesToFetchForMomentList__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  +[PLManagedObject objectIDDescription](PLManagedObject, "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("kind");
  v4[3] = CFSTR("endDate");
  v4[4] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)defaultPropertiesToFetchForMomentList_pl_once_object_29;
  defaultPropertiesToFetchForMomentList_pl_once_object_29 = v2;

}

void __73__PLPhotosHighlight_PLMomentList_Private__allowedPropertiesForMomentList__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  +[PLManagedObject objectIDDescription](PLManagedObject, "objectIDDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("objectID");
  v6[2] = CFSTR("uuid");
  v6[3] = CFSTR("kind");
  v6[4] = CFSTR("endDate");
  v6[5] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)allowedPropertiesForMomentList_pl_once_object_28;
  allowedPropertiesForMomentList_pl_once_object_28 = v4;

}

- (BOOL)isEligibleForSearchIndexing
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if ((-[PLPhotosHighlight isDeleted](self, "isDeleted") & 1) != 0)
    return 0;
  -[PLPhotosHighlight uuid](self, "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[PLPhotosHighlight startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PLPhotosHighlight endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PLPhotosHighlight keyAssetForKindPrivate](self, "keyAssetForKindPrivate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateCreated");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

LABEL_9:
        v13 = (void *)objc_opt_class();
        -[PLManagedObject photoLibrary](self, "photoLibrary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v4));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "evaluateWithObject:", self);

        goto LABEL_10;
      }
      -[PLPhotosHighlight keyAssetForKindShared](self, "keyAssetForKindShared");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateCreated");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_9;
    }
    return 0;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotosHighlight predicateForAllTripHighlights](PLPhotosHighlight, "predicateForAllTripHighlights", a3);
}

+ (id)propertiesToFetch
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("keyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  +[PLPhotosHighlight fetchRequest](PLPhotosHighlight, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v9);

  objc_msgSend(v8, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x65)
    objc_msgSend(v8, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v10);

  objc_msgSend(v8, "setFetchLimit:", objc_msgSend(v6, "count"));
  v15 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (v11)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v11);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
