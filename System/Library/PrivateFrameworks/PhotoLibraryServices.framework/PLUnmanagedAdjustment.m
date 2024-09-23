@implementation PLUnmanagedAdjustment

- (BOOL)updateRenderTypeFlagsForAssetAdjustments:(id)a3 checkFlag:(unsigned __int16)a4 settingPayload:(id)a5
{
  int v6;
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  int v18;
  id v20;
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = 0;
  if (v8 && v6)
  {
    v11 = -[PLUnmanagedAdjustment adjustmentRenderTypes](self, "adjustmentRenderTypes");
    v12 = v11;
    v13 = 0;
    if ((v6 & 1) != 0 && (v11 & 0x4000) == 0)
    {
      v14 = v11 & 0xFFFF9FFF;
      v21 = 0;
      v15 = -[PLUnmanagedAdjustment _cameraAutoRenderTypeFromAssetAdjustments:adjustmentEnvelope:](self, "_cameraAutoRenderTypeFromAssetAdjustments:adjustmentEnvelope:", v8, &v21);
      v13 = v21;
      v12 = v14 | v15 | 0x4000;
    }
    if ((v6 & 2) != 0)
    {
      v20 = v13;
      v16 = -[PLUnmanagedAdjustment _styleCastRenderTypeFromAssetAdjustments:settingPayload:adjustmentEnvelope:](self, "_styleCastRenderTypeFromAssetAdjustments:settingPayload:adjustmentEnvelope:", v8, v9, &v20);
      v17 = v20;

      v12 = v16 | v12 & 0xFFFF7FFF;
      v13 = v17;
    }
    v18 = -[PLUnmanagedAdjustment adjustmentRenderTypes](self, "adjustmentRenderTypes");
    v10 = v18 != (_DWORD)v12;
    if (v18 != (_DWORD)v12)
      -[PLUnmanagedAdjustment setAdjustmentRenderTypes:](self, "setAdjustmentRenderTypes:", v12);

  }
  return v10;
}

- (unsigned)_cameraAutoRenderTypeFromAssetAdjustments:(id)a3 adjustmentEnvelope:(id *)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLUnmanagedAdjustment.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustments"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLUnmanagedAdjustment.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("envelope"));

LABEL_3:
  objc_msgSend(v7, "adjustmentFormatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D753A0]);

  if (v9)
  {
    objc_msgSend(v7, "editorBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.camera"));

    if (v11)
    {
      v12 = *a4;
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        goto LABEL_7;
      }
      if ((objc_msgSend((id)objc_opt_class(), "_assetAdjustmentsHasValidDataType:", v7) & 1) != 0)
      {
        v24 = (void *)MEMORY[0x1E0D76620];
        objc_msgSend(v7, "adjustmentData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "editorBundleID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "adjustmentFormatIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "adjustmentFormatVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(v24, "deserialize:originator:format:formatVersion:error:", v25, v26, v27, v28, &v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v37;

        v13 = objc_retainAutorelease(v29);
        *a4 = v13;
        if (v13)
        {
LABEL_7:
          -[NSObject adjustmentStack](v13, "adjustmentStack");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "versionInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appVersion");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17
            && (v18 = (void *)v17,
                objc_msgSend(v16, "appVersion"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "isEqualToString:", &stru_1E36789C0),
                v19,
                v18,
                !v20))
          {
            v21 = 0;
          }
          else
          {
            v21 = 0x2000;
          }

LABEL_25:
          goto LABEL_26;
        }
      }
      else
      {
        PLBackendGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          -[PLUnmanagedAdjustment uuid](self, "uuid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "adjustmentData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v31;
          v40 = 2114;
          v41 = objc_opt_class();
          _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope (adjustmentData is not an NSData subclass). Adjustment uuid: %{public}@, class: %{public}@", buf, 0x16u);

        }
        v14 = 0;
        *a4 = 0;
      }
      PLBackendGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PLUnmanagedAdjustment uuid](self, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v33;
        v40 = 2112;
        v41 = (uint64_t)v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope. Adjustment uuid: %{public}@, error: %@", buf, 0x16u);

      }
      v21 = 0;
      goto LABEL_25;
    }
    v21 = 0;
  }
  else
  {
    objc_msgSend(v7, "adjustmentFormatIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D765F8]);

    if (v23)
      v21 = 0x2000;
    else
      v21 = 0;
  }
LABEL_26:

  return v21;
}

- (unsigned)_styleCastRenderTypeFromAssetAdjustments:(id)a3 settingPayload:(id)a4 adjustmentEnvelope:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v63;
  id v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLUnmanagedAdjustment.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustments"));

    if (a5)
      goto LABEL_3;
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLUnmanagedAdjustment.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("envelope"));

    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_41;
LABEL_3:
  objc_msgSend(v8, "adjustmentFormatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D753A0]);

  if (v11)
  {
    objc_msgSend(v8, "editorBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", CFSTR("com.apple.camera"));

    if ((v13 & 1) == 0)
    {
      v15 = *a5;
      if (v15)
      {
        v16 = v15;
        v17 = 0;
LABEL_8:
        -[NSObject adjustmentStack](v16, "adjustmentStack");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        objc_msgSend(v18, "adjustments");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        if (v19)
        {
          v20 = v19;
          v56 = v18;
          v57 = v16;
          v58 = v17;
          v59 = v9;
          v60 = v8;
          v21 = *(_QWORD *)v67;
          v22 = *MEMORY[0x1E0D75358];
          v23 = *MEMORY[0x1E0D75918];
          v61 = *MEMORY[0x1E0D75358];
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v67 != v21)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", v22);

              if (v27 && objc_msgSend(v25, "enabled"))
              {
                objc_msgSend(v25, "settings");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                objc_msgSend(v28, "objectForKeyedSubscript:", v23);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v30 = v29;
                else
                  v30 = 0;
                v31 = v30;

                if (v31)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", PFAdjustmentStyleCastFromString());
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v9 = v59;
                  objc_msgSend(v59, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D75368]);

                  v14 = 0x8000;
                  v8 = v60;
                  goto LABEL_26;
                }
                PLBackendGetLog();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v28, "objectForKeyedSubscript:", v23);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "objectForKeyedSubscript:", v23);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v21;
                  v35 = (void *)objc_opt_class();
                  v64 = v35;
                  objc_msgSend(v25, "identifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLUnmanagedAdjustment uuid](self, "uuid");
                  v37 = v20;
                  v38 = v23;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v72 = v33;
                  v73 = 2114;
                  v74 = (uint64_t)v35;
                  v21 = v34;
                  v75 = 2114;
                  v76 = v36;
                  v77 = 2114;
                  v78 = v39;
                  _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to determine name of cast due to invalid cast type: %{public}@ (%{public}@). Expected NSString. IPAPhotoAdjustment identifier: %{public}@ Adjustment uuid: %{public}@", buf, 0x2Au);

                  v23 = v38;
                  v20 = v37;

                  v22 = v61;
                }

              }
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
            if (v20)
              continue;
            break;
          }
          v14 = 0;
          v9 = v59;
          v8 = v60;
LABEL_26:
          v16 = v57;
          v17 = v58;
          v18 = v56;
        }
        else
        {
          v14 = 0;
        }

        goto LABEL_38;
      }
      if ((objc_msgSend((id)objc_opt_class(), "_assetAdjustmentsHasValidDataType:", v8) & 1) != 0)
      {
        v41 = (void *)MEMORY[0x1E0D76620];
        objc_msgSend(v8, "adjustmentData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "editorBundleID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "adjustmentFormatIdentifier");
        v44 = v9;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "adjustmentFormatVersion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        objc_msgSend(v41, "deserialize:originator:format:formatVersion:error:", v42, v43, v45, v46, &v70);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v70;

        v9 = v44;
        v17 = v48;
        v16 = objc_retainAutorelease(v47);
        *a5 = v16;
        if (v16)
          goto LABEL_8;
      }
      else
      {
        PLBackendGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          -[PLUnmanagedAdjustment uuid](self, "uuid");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "adjustmentData");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v72 = v50;
          v73 = 2114;
          v74 = objc_opt_class();
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope (adjustmentData is not an NSData subclass). Adjustment uuid: %{public}@, class: %{public}@", buf, 0x16u);

        }
        v17 = 0;
        *a5 = 0;
      }
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[PLUnmanagedAdjustment uuid](self, "uuid");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v52;
        v73 = 2112;
        v74 = (uint64_t)v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data envelope. Adjustment uuid: %{public}@, error: %@", buf, 0x16u);

      }
      v14 = 0;
LABEL_38:

      goto LABEL_39;
    }
  }
  v14 = 0;
LABEL_39:

  return v14;
}

- (BOOL)supportsCloudUpload
{
  void *v2;
  char v3;

  -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCloudUpload");

  return v3;
}

- (BOOL)isSyncableChange
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaceholderAsset");

  if (!v5)
    return 1;
  -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLManagedAsset validMomentShareForPlaceholderAsset:](PLManagedAsset, "validMomentShareForPlaceholderAsset:", v7);

  return v8;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLUnmanagedAdjustment;
  -[PLUnmanagedAdjustment awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUnmanagedAdjustment setUuid:](self, "setUuid:", v3);

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLUnmanagedAdjustment;
  -[PLManagedObject willSave](&v11, sel_willSave);
  -[PLUnmanagedAdjustment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (-[PLUnmanagedAdjustment isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLUnmanagedAdjustment changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentTimestamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && (objc_msgSend(v7, "isDeleted") & 1) == 0)
      {
        -[PLUnmanagedAdjustment adjustmentTimestamp](self, "adjustmentTimestamp");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "adjustmentTimestamp");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", v8);
        if (!v9 || fabs(v10) > 2.22044605e-16)
          objc_msgSend(v7, "setAdjustmentTimestamp:", v8);

      }
    }

  }
}

+ (id)entityName
{
  return CFSTR("UnmanagedAdjustment");
}

+ (id)addUnmanagedAdjustmentFromXMPDataIfNeededForAsset:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "orientation");
  if ((_DWORD)v4 != objc_msgSend(v3, "originalOrientation"))
    objc_msgSend(v3, "setOriginalOrientation:", v4);

  return 0;
}

+ (BOOL)_assetAdjustmentsHasValidDataType:(id)a3
{
  void *v3;
  char isKindOfClass;

  objc_msgSend(a3, "adjustmentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_convertRedEyeCorrections:(id)a3 withOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_convertRedEyeCorrection:withOrientation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), a4, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

+ (id)_convertRedEyeCorrection:(id)a3 withOrientation:(int64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("pointX"), CFSTR("pointY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("snappedX"), CFSTR("snappedY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("bitmaskX"), CFSTR("bitmaskY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("cornealReflectionX"), CFSTR("cornealReflectionY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("repairRectangleMaximumX"), CFSTR("repairRectangleMaximumY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("repairRectangleMinimumX"), CFSTR("repairRectangleMinimumY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("searchRectangleMaximumX"), CFSTR("searchRectangleMaximumY"));
  objc_msgSend(v5, "pl_applyOrientation:toNormalizedPointWithXKey:yKey:", a4, CFSTR("searchRectangleMinimumX"), CFSTR("searchRectangleMinimumY"));
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", CFSTR("repairRectangleMinimumX"), CFSTR("repairRectangleMaximumX"));
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", CFSTR("searchRectangleMinimumX"), CFSTR("searchRectangleMaximumX"));
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", CFSTR("repairRectangleMaximumY"), CFSTR("repairRectangleMinimumY"));
  objc_msgSend(v5, "pl_enforceCorrectValuesForMinKey:maxKey:", CFSTR("searchRectangleMaximumY"), CFSTR("searchRectangleMinimumY"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

+ (id)copyUnmanagedAdjustmentFromSourceAsset:(id)a3 forPlaceholderAsset:(id)a4 inLibrary:(id)a5 error:(id *)a6
{
  id v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  NSObject *v39;
  id v42;
  id v43;
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "additionalAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unmanagedAdjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedObject insertInManagedObjectContext:](PLUnmanagedAdjustment, "insertInManagedObjectContext:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "adjustmentBaseImageFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustmentBaseImageFormat:", v15);

  objc_msgSend(v12, "adjustmentFormatIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustmentFormatIdentifier:", v16);

  objc_msgSend(v12, "adjustmentFormatVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustmentFormatVersion:", v17);

  objc_msgSend(v12, "adjustmentTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustmentTimestamp:", v18);

  objc_msgSend(v12, "editorLocalizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEditorLocalizedName:", v19);

  objc_msgSend(v12, "otherAdjustmentsFingerprint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOtherAdjustmentsFingerprint:", v20);

  objc_msgSend(v12, "similarToOriginalAdjustmentsFingerprint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSimilarToOriginalAdjustmentsFingerprint:", v21);

  objc_msgSend(v14, "setAdjustmentRenderTypes:", objc_msgSend(v12, "adjustmentRenderTypes"));
  objc_msgSend(v12, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUuid:", v23);

  }
  v24 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "pathForAdjustmentFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fileURLWithPath:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "pathForAdjustmentFile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fileURLWithPath:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v29, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByDeletingLastPathComponent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v30, "createDirectoryAtPath:error:", v32, &v43);
  v33 = v43;

  if (!v33)
  {
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v26, v29, &v42);
    v39 = v42;
    v34 = v39;
    if (!v39)
      goto LABEL_17;
    if (a6)
      *a6 = objc_retainAutorelease(v39);
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_17;
    __CPLAssetsdOSLogDomain();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v45 = v34;
    v36 = "Failed to copy adjustment file for adjusted source asset: %@";
    v37 = v35;
    v38 = 12;
LABEL_15:
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
LABEL_16:

    goto LABEL_17;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v33);
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v9, "uuid");
    v35 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v35;
    v46 = 2112;
    v47 = v33;
    v36 = "Failed to create adjustment directory for placeholder asset %@: %@";
    v37 = v34;
    v38 = 22;
    goto LABEL_15;
  }
LABEL_18:

  return v14;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLAssetJournalEntryPayload *v7;

  v4 = a3;
  -[PLUnmanagedAdjustment assetAttributes](self, "assetAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValidForJournalPersistence"))
    v7 = -[PLAssetJournalEntryPayload initWithUnmanagedAdjustment:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithUnmanagedAdjustment:changedKeys:", self, v4);
  else
    v7 = 0;

  return v7;
}

@end
