@implementation PLAdditionalAssetAttributes

+ (id)newExtraDurationDataFromStillDisplayTime:(id *)a3 videoDuration:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5[2];

  v5[0] = *a3;
  v5[1] = *a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 48);
}

+ (void)fromExtraDurationData:(id)a3 getStillDisplayTime:(id *)a4 videoDuration:(id *)a5
{
  id v7;
  __int128 v8;
  int64_t v9;
  __int128 v10;
  int64_t v11;

  v7 = a3;
  v8 = *MEMORY[0x1E0CA2E18];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v10 = v8;
  v11 = v9;
  if ((unint64_t)objc_msgSend(v7, "length") >= 0x30)
    objc_msgSend(v7, "getBytes:length:", &v8, 48);
  if (a4)
  {
    *(_OWORD *)&a4->var0 = v8;
    a4->var3 = v9;
  }
  if (a5)
  {
    *(_OWORD *)&a5->var0 = v10;
    a5->var3 = v11;
  }

}

- (id)duplicateSortPropertyNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("keywords");
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("timeZoneOffset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)duplicateSortPropertyNamesSkip
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLAdditionalAssetAttributes asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  PLAssetJournalEntryPayload *v6;

  v4 = a3;
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isValidForJournalPersistence"))
    v6 = -[PLAssetJournalEntryPayload initWithAdditionalAssetAttributes:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithAdditionalAssetAttributes:changedKeys:", self, v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)supportsCloudUpload
{
  void *v2;
  char v3;

  -[PLAdditionalAssetAttributes asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCloudUpload");

  return v3;
}

- (BOOL)isSyncableChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "savedAssetTypeIsSupportedForUpload");

  if (!v4)
    return 0;
  -[PLAdditionalAssetAttributes changedValues](self, "changedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[PLAdditionalAssetAttributes listOfSyncedProperties](PLAdditionalAssetAttributes, "listOfSyncedProperties", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          goto LABEL_4;
        goto LABEL_10;
      }
    }

    -[PLAdditionalAssetAttributes asset](self, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isPlaceholderAsset");

    if (v14)
    {
      -[PLAdditionalAssetAttributes asset](self, "asset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[PLManagedAsset validMomentShareForPlaceholderAsset:](PLManagedAsset, "validMomentShareForPlaceholderAsset:", v5);
      goto LABEL_14;
    }
    return 1;
  }
  else
  {
LABEL_10:

    v12 = 0;
LABEL_14:

  }
  return v12;
}

- (BOOL)isUserInterfaceChange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v8;

  -[PLAdditionalAssetAttributes changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("variationSuggestionStates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reverseLocationData")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4)
    || (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reverseLocationDataIsValid")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("destinationAssetCopyState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 != 0;

  }
  return v6;
}

- (void)truncatedOriginalCheckChangedValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  PLAdditionalAssetAttributes *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalFilesize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    if (v7 <= 0x10000 && (v7 & 0xFFF) == 0)
    {
      -[PLAdditionalAssetAttributes asset](self, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unsigned __int16)(objc_msgSend(v9, "importedBy") - 1) <= 1u && objc_msgSend(v10, "compare:", v11) == 1)
      {
        objc_msgSend(v9, "pathForOriginalFile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v18 = v6;
          v19 = 2112;
          v20 = v12;
          v21 = 2112;
          v22 = self;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "rdar://39848396: truncated original originalFilesize=%@ path=%@ %@", buf, 0x20u);
        }

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalFilename"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Captured truncated original with originalFilesize=%@ originalFilename=%@ path=%@. See rdar://39848396."), v6, v15, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Photos Data Loss Issue Detected!"), CFSTR("Please file a Radar for critical truncated original issue."), CFSTR("TTR Photos Framework: captured truncated original"), v16);
      }

    }
  }

}

- (void)_updateInferredTimeZoneOffsetWithChangedValues:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = -[PLAdditionalAssetAttributes isUpdated](self, "isUpdated");
  v5 = v20;
  if (v4)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("inferredTimeZoneOffset"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

      }
      else
      {
        -[PLAdditionalAssetAttributes timeZoneOffset](self, "timeZoneOffset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v20;
        if (!v9)
          goto LABEL_6;
        -[PLAdditionalAssetAttributes asset](self, "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "metadataFromMediaPropertiesOrOriginalResource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "timeZoneOffset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");
        -[PLAdditionalAssetAttributes timeZoneOffset](self, "timeZoneOffset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        -[PLAdditionalAssetAttributes inferredTimeZoneOffset](self, "inferredTimeZoneOffset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v12 == v14)
        {

          if (v16)
            -[PLAdditionalAssetAttributes setInferredTimeZoneOffset:](self, "setInferredTimeZoneOffset:", 0);
        }
        else
        {
          -[PLAdditionalAssetAttributes timeZoneOffset](self, "timeZoneOffset");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

          if ((v18 & 1) == 0)
          {
            -[PLAdditionalAssetAttributes timeZoneOffset](self, "timeZoneOffset");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLAdditionalAssetAttributes setInferredTimeZoneOffset:](self, "setInferredTimeZoneOffset:", v19);

          }
        }
      }

      v5 = v20;
    }
  }
LABEL_6:

}

- (void)correctOriginalOrientationIfRequired
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  -[PLAdditionalAssetAttributes asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  LODWORD(v4) = +[PLManagedAsset correctedOrientation:](PLManagedAsset, "correctedOrientation:", v6);
  -[PLAdditionalAssetAttributes originalOrientation](self, "originalOrientation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shortValue");

  v9 = +[PLManagedAsset correctedOrientation:](PLManagedAsset, "correctedOrientation:", v8);
  if ((_DWORD)v4 == (_DWORD)v6)
  {
    v10 = v6;
    if ((_DWORD)v8 == (_DWORD)v6)
      return;
    goto LABEL_3;
  }
  v10 = v9;
  if ((_DWORD)v9 != (_DWORD)v8)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes setOriginalOrientation:](self, "setOriginalOrientation:", v11);

  }
}

- (void)willSave
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned __int16 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  objc_super v93;
  const __CFString *v94;
  uint8_t buf[4];
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v93.receiver = self;
  v93.super_class = (Class)PLAdditionalAssetAttributes;
  -[PLManagedObject willSave](&v93, sel_willSave);
  -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_80;
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeleted");

  if ((v5 & 1) == 0)
  {
    v91 = v3;
    -[PLAdditionalAssetAttributes changedValues](self, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAdditionalAssetAttributes isSyncableChange](self, "isSyncableChange");
    v8 = -[PLAdditionalAssetAttributes isUserInterfaceChange](self, "isUserInterfaceChange");
    -[PLAdditionalAssetAttributes asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || !v7 && !v8)
    {

    }
    else
    {
      -[PLAdditionalAssetAttributes asset](self, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isFinderSyncedAsset");

      if ((v13 & 1) != 0)
      {
LABEL_9:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeAnnotationData"));
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("publicGlobalUUID"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityDescription"));
        v79 = v15;
        v80 = objc_claimAutoreleasedReturnValue();
        v88 = v15 | v80;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeZoneName"));
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("importedBy"));
        v17 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spatialOverCaptureGroupIdentifier"));
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("syndicationIdentifier"));
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("libraryScopeAssetContributorsToUpdate"));
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("syndicationHistory"));
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneAnalysisIsFromPreview"));
        v22 = objc_claimAutoreleasedReturnValue();

        v85 = v14;
        v81 = v16;
        v83 = v18;
        v84 = v19;
        v23 = v17 | v18;
        v24 = v17;
        v25 = v88 | v16 | v14 | v23 | v19;
        v87 = v21;
        v89 = v22;
        v26 = (v25 | v20 | v21 | v22) != 0;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneClassifications"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewPresentation"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if ((-[PLAdditionalAssetAttributes isInserted](self, "isInserted") & 1) != 0 || v27)
        {
          -[PLAdditionalAssetAttributes asset](self, "asset");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "recalculateIsDetectedScreenshot");

          -[PLAdditionalAssetAttributes recalculatehasPeopleSceneMidOrGreaterConfidence](self, "recalculatehasPeopleSceneMidOrGreaterConfidence");
        }
        v3 = v91;
        if (v90)
          v29 = 1;
        else
          v29 = v26;
        if (v29 == 1)
        {
          -[PLAdditionalAssetAttributes asset](self, "asset");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isValidTypeForPersistence");

          if (v31)
          {
            if (v26)
            {
              -[PLAdditionalAssetAttributes asset](self, "asset");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "persistedFileSystemAttributesFileURL");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v79)
                {
                  -[PLAdditionalAssetAttributes title](self, "title");
                  v35 = v34;
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setString:forKey:", v36, *MEMORY[0x1E0D73FF8]);

                  v34 = v35;
                }
                if (v80)
                {
                  -[PLAdditionalAssetAttributes accessibilityDescription](self, "accessibilityDescription");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setString:forKey:", v37, *MEMORY[0x1E0D73EA8]);

                }
                if (v81)
                {
                  -[PLAdditionalAssetAttributes timeZoneName](self, "timeZoneName");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setString:forKey:", v38, *MEMORY[0x1E0D73FE8]);

                }
                if (v82)
                {
                  -[PLAdditionalAssetAttributes timeZoneOffset](self, "timeZoneOffset");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "intValue");
                  objc_msgSend(v34, "setInt32:forKey:", v40, *MEMORY[0x1E0D73FF0]);

                }
                if (v85)
                {
                  -[PLAdditionalAssetAttributes placeAnnotationData](self, "placeAnnotationData");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setData:forKey:", v41, *MEMORY[0x1E0D73FA8]);

                }
                if (v24 && -[PLAdditionalAssetAttributes importedBy](self, "importedBy"))
                {
                  v42 = -[PLAdditionalAssetAttributes importedBy](self, "importedBy");
                  objc_msgSend(v34, "setUInt16:forKey:", v42, *MEMORY[0x1E0D73F48]);
                }
                if (v83)
                {
                  -[PLAdditionalAssetAttributes spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setString:forKey:", v43, *MEMORY[0x1E0D73FD0]);

                }
                if (v84)
                {
                  -[PLAdditionalAssetAttributes syndicationIdentifier](self, "syndicationIdentifier");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setString:forKey:", v44, *MEMORY[0x1E0D73FE0]);

                }
                if (v20)
                {
                  v45 = (void *)MEMORY[0x1E0CB36F8];
                  -[PLAdditionalAssetAttributes libraryScopeAssetContributorsToUpdate](self, "libraryScopeAssetContributorsToUpdate");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v92 = 0;
                  objc_msgSend(v45, "archivedDataWithRootObject:requiringSecureCoding:error:", v46, 1, &v92);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = v92;

                  if (v48)
                  {
                    PLBackendGetLog();
                    v49 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v96 = v48;
                      _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "libraryScopeAssetContributorsToUpdate archiving failed: %@", buf, 0xCu);
                    }

                  }
                  else
                  {
                    objc_msgSend(v34, "setData:forKey:", v47, *MEMORY[0x1E0D73F78]);
                  }

                }
                if (v87)
                {
                  v50 = -[PLAdditionalAssetAttributes syndicationHistory](self, "syndicationHistory");
                  objc_msgSend(v34, "setUInt16:forKey:", v50, *MEMORY[0x1E0D73FD8]);
                }
                if (v89)
                {
                  v51 = -[PLAdditionalAssetAttributes sceneAnalysisIsFromPreview](self, "sceneAnalysisIsFromPreview");
                  objc_msgSend(v34, "setUInt16:forKey:", v51, *MEMORY[0x1E0D73FC8]);
                }
                if (v86)
                {
                  v52 = -[PLAdditionalAssetAttributes viewPresentation](self, "viewPresentation");
                  objc_msgSend(v34, "setUInt16:forKey:", v52, *MEMORY[0x1E0D74020]);
                }
                objc_msgSend(v34, "persist");

              }
            }
            if (v90)
            {
              objc_msgSend(v91, "delayedSaveActions");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLAdditionalAssetAttributes asset](self, "asset");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "recordAssetForFileSystemPersistencyUpdate:", v54);

            }
          }
        }
        if (MEMORY[0x19AEC04BC]()
          && -[PLAdditionalAssetAttributes isInserted](self, "isInserted"))
        {
          -[PLAdditionalAssetAttributes truncatedOriginalCheckChangedValues:](self, "truncatedOriginalCheckChangedValues:", v6);
        }
        if (PLPlatformMomentsSupported())
        {
          -[PLAdditionalAssetAttributes _updateInferredTimeZoneOffsetWithChangedValues:](self, "_updateInferredTimeZoneOffsetWithChangedValues:", v6);
          objc_msgSend(v91, "delayedSaveActions");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "recordAdditionalAssetAttributesForMomentUpdate:", self);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("originalOrientation"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
          -[PLAdditionalAssetAttributes correctOriginalOrientationIfRequired](self, "correctOriginalOrientationIfRequired");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keywords"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          -[PLAdditionalAssetAttributes keywords](self, "keywords");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "count") != 0;

          -[PLAdditionalAssetAttributes asset](self, "asset");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setKeywordBadgeAttribute:", v59);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("originalResourceChoice"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          -[PLAdditionalAssetAttributes asset](self, "asset");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "recalculateRAWBadgeAttribute");

        }
        if (+[PLDuplicateAsset isDuplicateAssetSortChangedObject:](PLDuplicateAsset, "isDuplicateAssetSortChangedObject:", self))
        {
          -[PLAdditionalAssetAttributes asset](self, "asset");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "duplicateAlbum");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "sortAssets");
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
        v65 = objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_74;
        v66 = (void *)v65;
        -[PLAdditionalAssetAttributes asset](self, "asset");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v67, "duplicateAssetVisibilityState"))
        {
          -[PLAdditionalAssetAttributes asset](self, "asset");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "isValidForPerceptualProcessing");

          if (!v69)
          {
LABEL_74:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (v76)
            {
              -[PLManagedObject photoLibrary](self, "photoLibrary");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:](PLDuplicateProcessor, "signalBackgroundJobServiceDuplicateProcessingWithLibrary:", v77);

            }
            goto LABEL_77;
          }
          v94 = CFSTR("sceneAnalysisVersion");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAdditionalAssetAttributes committedValuesForKeys:](self, "committedValuesForKeys:", v70);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "shortValue");

          if (v72)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v73, "shortValue");

            if (v72 != v74)
            {
              -[PLAdditionalAssetAttributes asset](self, "asset");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "removeFromDuplicateAlbum");

            }
          }
          -[PLManagedObject photoLibrary](self, "photoLibrary");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:](PLDuplicateProcessor, "signalBackgroundJobServiceDuplicateProcessingWithLibrary:", v67);
        }

        goto LABEL_74;
      }
      -[PLAdditionalAssetAttributes asset](self, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setModificationDate:", v10);
    }

    goto LABEL_9;
  }
LABEL_77:
  if (PLPlatformSearchSupported())
  {
    objc_msgSend(v3, "delayedSaveActions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "recordAdditionalAssetAttributesForSearchIndexUpdate:", self);

    if ((-[PLAdditionalAssetAttributes isDeleted](self, "isDeleted") & 1) == 0)
      +[PLDelayedSearchIndexUpdates recordAdditionalAssetAttributesIfNeeded:](PLDelayedSearchIndexUpdates, "recordAdditionalAssetAttributesIfNeeded:", self);
  }
LABEL_80:

}

- (void)recalculatehasPeopleSceneMidOrGreaterConfidence
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PLAdditionalAssetAttributes sceneClassifications](self, "sceneClassifications", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "sceneIdentifier") == 881)
        {
          objc_msgSend(v7, "confidence");
          if (v8 >= 0.5)
          {
            v4 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v9, CFSTR("hasPeopleSceneMidOrGreaterConfidence"), 0);

}

- (void)setShiftedLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PLAdditionalAssetAttributes willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("shiftedLocation"));
  -[PLAdditionalAssetAttributes _setCachedShiftedLocation:](self, "_setCachedShiftedLocation:", v15);
  -[PLAdditionalAssetAttributes didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("shiftedLocation"));
  v4 = +[PLManagedAsset newLocationDataFromLocation:](PLManagedAsset, "newLocationDataFromLocation:", v15);
  -[PLAdditionalAssetAttributes setShiftedLocationData:](self, "setShiftedLocationData:", v4);
  if (v4)
  {
    objc_msgSend(v15, "coordinate");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[PLAdditionalAssetAttributes asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "coordinate");
      v6 = v11;
      v8 = v12;
    }
    else
    {
      v6 = *MEMORY[0x1E0C9E500];
      v8 = *(double *)(MEMORY[0x1E0C9E500] + 8);
    }

  }
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLatitude:", v6);

  -[PLAdditionalAssetAttributes asset](self, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLongitude:", v8);

}

- (void)setMontage:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PLAdditionalAssetAttributes_setMontage___block_invoke;
  v3[3] = &unk_1E3670DE8;
  v3[4] = self;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("montage"), v3);
}

- (void)updateAllowedForAnalysis
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PLAdditionalAssetAttributes asset](self, "asset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "calculateAllowedForAnalysis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v4, CFSTR("allowedForAnalysis"), 0);

}

- (CLLocation)shiftedLocation
{
  id v3;
  void *v4;

  -[PLAdditionalAssetAttributes willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("shiftedLocation"));
  -[PLAdditionalAssetAttributes _cachedShiftedLocation](self, "_cachedShiftedLocation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAdditionalAssetAttributes didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("shiftedLocation"));
  if (!v3)
  {
    -[PLAdditionalAssetAttributes shiftedLocationData](self, "shiftedLocationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[PLManagedAsset newLocationFromLocationData:timestampIfMissing:](PLManagedAsset, "newLocationFromLocationData:timestampIfMissing:", v4, 0);
    if (v3)
    {
      -[PLAdditionalAssetAttributes willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("shiftedLocation"));
      -[PLAdditionalAssetAttributes _setCachedShiftedLocation:](self, "_setCachedShiftedLocation:", v3);
      -[PLAdditionalAssetAttributes didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("shiftedLocation"));
    }

  }
  return (CLLocation *)v3;
}

- (void)setShiftedLocationIsValid:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[PLAdditionalAssetAttributes willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("shiftedLocationIsValid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAdditionalAssetAttributes setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("shiftedLocationIsValid"));

  -[PLAdditionalAssetAttributes didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("shiftedLocationIsValid"));
  if (!v3)
  {
    -[PLAdditionalAssetAttributes asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "coordinate");
      v8 = v7;
      v10 = v9;
    }
    else
    {
      v8 = *MEMORY[0x1E0C9E500];
      v10 = *(double *)(MEMORY[0x1E0C9E500] + 8);
    }
    -[PLAdditionalAssetAttributes asset](self, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLatitude:", v8);

    -[PLAdditionalAssetAttributes asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLongitude:", v10);

  }
}

- (void)appendLibraryScopeAssetContributorsToUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[PLAdditionalAssetAttributes libraryScopeAssetContributorsToUpdate](self, "libraryScopeAssetContributorsToUpdate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v7, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    -[PLAdditionalAssetAttributes setLibraryScopeAssetContributorsToUpdate:](self, "setLibraryScopeAssetContributorsToUpdate:", v5);
  }

}

- (void)addDuplicateDetectorPerceptualProcessingStates:(unsigned __int16)a3 removeProcessingStates:(unsigned __int16)a4
{
  uint64_t v5;

  v5 = (-[PLAdditionalAssetAttributes duplicateDetectorPerceptualProcessingState](self, "duplicateDetectorPerceptualProcessingState") | a3) & ~a4;
  if ((_DWORD)v5 != -[PLAdditionalAssetAttributes duplicateDetectorPerceptualProcessingState](self, "duplicateDetectorPerceptualProcessingState"))-[PLAdditionalAssetAttributes setDuplicateDetectorPerceptualProcessingState:](self, "setDuplicateDetectorPerceptualProcessingState:", v5);
}

- (BOOL)containsDuplicateDetectorPerceptualProcessingState:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  v4 = -[PLAdditionalAssetAttributes duplicateDetectorPerceptualProcessingState](self, "duplicateDetectorPerceptualProcessingState");
  if (v3)
    return (v3 & ~v4) == 0;
  else
    return v4 == 0;
}

- (id)allSceneClassifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLAdditionalAssetAttributes sceneClassifications](self, "sceneClassifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAdditionalAssetAttributes temporalSceneClassifications](self, "temporalSceneClassifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (signed)viewPresentation
{
  void *v3;
  signed __int16 v4;

  -[PLAdditionalAssetAttributes willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("viewPresentation"));
  -[PLAdditionalAssetAttributes primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("viewPresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedShortValue");

  -[PLAdditionalAssetAttributes didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("viewPresentation"));
  if (v4 <= 1)
    return v4;
  else
    return 0;
}

- (CLLocation)_cachedShiftedLocation
{
  return self->__cachedShiftedLocation;
}

- (void)_setCachedShiftedLocation:(id)a3
{
  objc_storeStrong((id *)&self->__cachedShiftedLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedShiftedLocation, 0);
}

uint64_t __42__PLAdditionalAssetAttributes_setMontage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAllowedForAnalysis");
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result_75221;
}

+ (id)entityName
{
  return CFSTR("AdditionalAssetAttributes");
}

+ (BOOL)shouldPersistImportedByDisplayName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisWithNoindex:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("noindex:(%K) == YES");
  else
    v3 = CFSTR("%K == YES");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("allowedForAnalysis"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestSceneVersionWithNoindex:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion](PLMediaAnalysisServiceRequestAdapter, "currentSceneVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToSceneVersion:noindex:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToSceneVersion:(id)a3 noindex:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
    v8 = (__int16)objc_msgSend(v6, "intValue");
  else
    v8 = 1;
  if (v4)
    v9 = CFSTR("noindex:(%K) >= %d");
  else
    v9 = CFSTR("%K >= %d");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9, CFSTR("sceneAnalysisVersion"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateToIncludeOnlyAllowedForAnalysisWithNoindex:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToLatestFaceVersionWithNoindex:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion](PLMediaAnalysisServiceRequestAdapter, "currentFaceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:noindex:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateToIncludeOnlyAllowedForAnalysisAndProcessedToFaceVersion:(id)a3 noindex:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
    v8 = (__int16)objc_msgSend(v6, "intValue");
  else
    v8 = 1;
  if (v4)
    v9 = CFSTR("noindex:(%K) >= %d");
  else
    v9 = CFSTR("%K >= %d");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9, CFSTR("faceAnalysisVersion"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateToIncludeOnlyAllowedForAnalysisWithNoindex:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __53__PLAdditionalAssetAttributes_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("title"), CFSTR("accessibilityDescription"), CFSTR("keywords"), CFSTR("longDescription"), CFSTR("personReferences"), 0x1E3687000, CFSTR("videoCpDisplayValue"), CFSTR("videoCpDisplayTimescale"), CFSTR("playCount"), CFSTR("shareCount"), CFSTR("viewCount"), CFSTR("originatingAssetIdentifier"), CFSTR("originalResourceChoice"), CFSTR("assetDescription"), CFSTR("syndicationIdentifier"), CFSTR("syndicationHistory"), CFSTR("timeZoneName"),
         CFSTR("timeZoneOffset"),
         CFSTR("viewPresentation"),
         0);
  v1 = (void *)listOfSyncedProperties_result_75221;
  listOfSyncedProperties_result_75221 = v0;

}

- (PLSpatialOverCaptureInformation)spatialOverCaptureInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForSpatialOverCaptureContentFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isVideo");

    v9 = objc_alloc(MEMORY[0x1E0D75140]);
    if (v8)
    {
      v10 = objc_msgSend(v9, "initWithAVURL:timeZoneLookup:", v6, 0);
      if (v10)
      {
        v11 = v10;
        -[NSObject spatialOverCaptureIdentifier](v10, "spatialOverCaptureIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSpatialOverCaptureGroupIdentifier:", v12);

LABEL_7:
        v13 = v5;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v11 = objc_msgSend(v9, "initWithImageURL:contentType:timeZoneLookup:", v6, 0, 0);
      -[NSObject spatialOverCaptureIdentifier](v11, "spatialOverCaptureIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSpatialOverCaptureGroupIdentifier:", v14);

      -[NSObject livePhotoPairingIdentifier](v11, "livePhotoPairingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSpatialOverCaptureLivePhotoPairingIdentifier:", v15);

      if (v11)
        goto LABEL_7;
    }
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to read metadata for %@", (uint8_t *)&v17, 0xCu);
    }
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return (PLSpatialOverCaptureInformation *)v13;
}

- (void)setSceneprintWithData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLAdditionalAssetAttributes sceneprint](self, "sceneprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSceneprint insertInCurrentManagedObjectContext:withAdditionalAssetAttributes:](PLSceneprint, "insertInCurrentManagedObjectContext:withAdditionalAssetAttributes:", v5, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "setData:", v6);

}

- (void)setDuplicateMatchingData:(id)a3 duplicateMatchingAlternateData:(id)a4 processingSucceeded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[PLAdditionalAssetAttributes sceneprint](self, "sceneprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSceneprint insertInCurrentManagedObjectContext:withAdditionalAssetAttributes:](PLSceneprint, "insertInCurrentManagedObjectContext:withAdditionalAssetAttributes:", v10, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setDuplicateMatchingData:duplicateMatchingAlternateData:", v11, v8);
  -[PLAdditionalAssetAttributes addDuplicateDetectorPerceptualProcessingStates:removeProcessingStates:](self, "addDuplicateDetectorPerceptualProcessingStates:removeProcessingStates:", v5 ^ 1, v5);

}

- (BOOL)hasDuplicateMatchingData
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PLAdditionalAssetAttributes sceneprint](self, "sceneprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplicateMatchingData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PLAdditionalAssetAttributes sceneprint](self, "sceneprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duplicateMatchingAlternateData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (CPLScopedIdentifier)sourceAssetForDuplicationCPLScopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PLAdditionalAssetAttributes sourceAssetForDuplicationIdentifier](self, "sourceAssetForDuplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAdditionalAssetAttributes sourceAssetForDuplicationScopeIdentifier](self, "sourceAssetForDuplicationScopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v4, v3);
  else
    v5 = 0;

  return (CPLScopedIdentifier *)v5;
}

- (void)setSourceAssetForDuplicationCPLScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes setSourceAssetForDuplicationIdentifier:](self, "setSourceAssetForDuplicationIdentifier:", v5);

    objc_msgSend(v7, "scopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes setSourceAssetForDuplicationScopeIdentifier:](self, "setSourceAssetForDuplicationScopeIdentifier:", v6);

  }
  else
  {
    -[PLAdditionalAssetAttributes setSourceAssetForDuplicationIdentifier:](self, "setSourceAssetForDuplicationIdentifier:", 0);
    -[PLAdditionalAssetAttributes setSourceAssetForDuplicationScopeIdentifier:](self, "setSourceAssetForDuplicationScopeIdentifier:", 0);
  }

}

- (NSData)mediaMetadataData
{
  void *v2;
  void *v3;

  -[PLAdditionalAssetAttributes mediaMetadata](self, "mediaMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setMediaMetadataData:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PLAdditionalAssetAttributes asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAdjustments");

  -[PLAdditionalAssetAttributes mediaMetadata](self, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5)
  {
    -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedObject insertInManagedObjectContext:](PLCloudMasterMediaMetadata, "insertInManagedObjectContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes setMediaMetadata:](self, "setMediaMetadata:", v8);

  }
  if (v13)
  {
    -[PLAdditionalAssetAttributes mediaMetadata](self, "mediaMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedObject insertInManagedObjectContext:](PLCloudMasterMediaMetadata, "insertInManagedObjectContext:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAdditionalAssetAttributes setMediaMetadata:](self, "setMediaMetadata:", v11);

    }
    -[PLAdditionalAssetAttributes mediaMetadata](self, "mediaMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("data"));
  }
  else
  {
    if (!v5)
    {
      -[PLAdditionalAssetAttributes setMediaMetadata:](self, "setMediaMetadata:", 0);
      goto LABEL_12;
    }
    -[PLAdditionalAssetAttributes mediaMetadata](self, "mediaMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setData:", 0);
  }

LABEL_12:
}

- (NSString)longDescription
{
  void *v2;
  void *v3;

  -[PLAdditionalAssetAttributes assetDescription](self, "assetDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "longDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLongDescription:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "length");
  -[PLAdditionalAssetAttributes assetDescription](self, "assetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAssetDescription entityName](PLAssetDescription, "entityName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[PLAdditionalAssetAttributes setAssetDescription:](self, "setAssetDescription:", v6);

    }
    objc_msgSend(v6, "setLongDescription:", v10);
    goto LABEL_9;
  }

  if (v6)
  {
    -[PLAdditionalAssetAttributes managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAdditionalAssetAttributes assetDescription](self, "assetDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteObject:", v9);

LABEL_9:
  }

}

- (BOOL)hasConsistentCloudState
{
  return -[PLAdditionalAssetAttributes cloudRecoveryState](self, "cloudRecoveryState") == 0;
}

- (void)setCloudRecoveryStateFlag:(unint64_t)a3
{
  -[PLAdditionalAssetAttributes setCloudRecoveryState:](self, "setCloudRecoveryState:", -[PLAdditionalAssetAttributes cloudRecoveryState](self, "cloudRecoveryState") | a3);
}

- (void)removeCloudRecoveryStateFlag:(unint64_t)a3
{
  -[PLAdditionalAssetAttributes setCloudRecoveryState:](self, "setCloudRecoveryState:", -[PLAdditionalAssetAttributes cloudRecoveryState](self, "cloudRecoveryState") & ~a3);
}

- (BOOL)hasCloudRecoveryStateFlagSet:(unint64_t)a3
{
  return (-[PLAdditionalAssetAttributes cloudRecoveryState](self, "cloudRecoveryState") & a3) != 0;
}

- (void)resetCloudRecoveryState
{
  -[PLAdditionalAssetAttributes setCloudRecoveryState:](self, "setCloudRecoveryState:", 0);
}

+ (id)descriptionForDestinationAssetCopyState:(signed __int16)a3
{
  if ((a3 + 1) > 3)
    return &stru_1E36789C0;
  else
    return off_1E3670E08[a3 + 1];
}

@end
