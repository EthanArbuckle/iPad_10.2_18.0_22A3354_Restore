@implementation PLCPLFacePullSupport

+ (void)applyFacesChangesFromAssetChange:(id)a3 toAsset:(id)a4 inSyncContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  PLCPLFacePullSupport *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x19AEC1554]();
  v10 = -[PLCPLFacePullSupport initWithSyncContext:asset:]([PLCPLFacePullSupport alloc], "initWithSyncContext:asset:", v8, v7);
  -[PLCPLFacePullSupport applyFacesChangesFromAssetChange:](v10, "applyFacesChangesFromAssetChange:", v11);

  objc_autoreleasePoolPop(v9);
}

- (PLCPLFacePullSupport)initWithSyncContext:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PLCPLFacePullSupport *v9;
  PLCPLFacePullSupport *v10;
  PLCPLFacePullSupport *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCPLFacePullSupport;
  v9 = -[PLCPLFacePullSupport init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncContext, a3);
    objc_storeStrong((id *)&v10->_currentAsset, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  PLSyncContext *syncContext;
  PLSyncableAsset *currentAsset;
  objc_super v5;

  syncContext = self->_syncContext;
  self->_syncContext = 0;

  currentAsset = self->_currentAsset;
  self->_currentAsset = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLCPLFacePullSupport;
  -[PLCPLFacePullSupport dealloc](&v5, sel_dealloc);
}

- (void)applyFacesChangesFromAssetChange:(id)a3
{
  id v4;
  int64_t v5;
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
  _BYTE *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLSyncContext serverSupportsVision](self->_syncContext, "serverSupportsVision"))
  {
    v5 = -[PLCPLFacePullSupport _policyForApplyingFaceChangesFromAssetChange:](self, "_policyForApplyingFaceChangesFromAssetChange:", v4);
    -[PLSyncableAsset detectedFaces](self->_currentAsset, "detectedFaces");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isTrainingFace == YES"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredSetUsingPredicate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isTrainingFace == NO"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v6, "filteredSetUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "faces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "faces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = objc_msgSend(v10, "count");
    v15 = v14;
    v16 = (_BYTE *)MEMORY[0x1E0D115D0];
    if ((v13 || v14 && v5 == 1) && !*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = CFSTR("KeepLocal-MergeCloud");
        if (v5 == 1)
          v18 = CFSTR("DropLocal-KeepCloud");
        v19 = v18;
        *(_DWORD *)buf = 138413058;
        v32 = v19;
        v33 = 2048;
        v34 = v13;
        v35 = 2048;
        v36 = v15;
        v37 = 2112;
        v38 = v4;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Applying face changes with policy %@ on %lu cloud faces, %lu local faces for asset change %@", buf, 0x2Au);

        v16 = (_BYTE *)MEMORY[0x1E0D115D0];
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v8);
    -[PLCPLFacePullSupport _applyAssetChange:toExistingFaces:withPolicy:](self, "_applyAssetChange:toExistingFaces:withPolicy:", v4, v10, v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v21);
    if (objc_msgSend(v21, "count") && !*v16)
    {
      __CPLAssetsdOSLogDomain();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134217984;
        v32 = (__CFString *)v23;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Keeping %ld faces after sync", buf, 0xCu);
      }

    }
    v24 = (void *)v8;
    v25 = v16;
    -[PLSyncableAsset detectedFaces](self->_currentAsset, "detectedFaces");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v27, "minusSet:", v20);
    if (objc_msgSend(v27, "count"))
    {
      if (!*v25)
      {
        __CPLAssetsdOSLogDomain();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(v27, "count");
          *(_DWORD *)buf = 134217984;
          v32 = (__CFString *)v29;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Deleting %lu faces", buf, 0xCu);
        }

      }
      -[PLSyncContext deleteFaces:](self->_syncContext, "deleteFaces:", v27);
    }
    -[PLSyncableAsset setDetectedFaces:](self->_currentAsset, "setDetectedFaces:", v20);
    if (v5 == 1 && -[PLSyncableAsset faceDetectionComplete](self->_currentAsset, "faceDetectionComplete"))
      -[PLSyncableAsset markForNeedingFaceDetection](self->_currentAsset, "markForNeedingFaceDetection");

  }
}

- (int64_t)_policyForApplyingFaceChangesFromAssetChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  PLSyncContext *syncContext;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  int64_t v14;

  objc_msgSend(a3, "facesAdjustmentsFingerprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D11218]);
    syncContext = self->_syncContext;
    -[PLSyncableAsset cloudIdentifier](self->_currentAsset, "cloudIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSyncContext assetAdjustmentStateForCloudIdentifier:](syncContext, "assetAdjustmentStateForCloudIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("PLCPLAssetHasAdjustmentsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v9, "objectForKey:", CFSTR("PLCPLAssetAdjustmentFingerprintKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v13 = v11 == 0;
    else
      v13 = 0;
    v14 = !v13 && (v6 == v11 || (objc_msgSend(v5, "isEqualToString:", v12) & 1) == 0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_applyAssetChange:(id)a3 toExistingFaces:(id)a4 withPolicy:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  PLFaceDimension *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  PLFaceDimension *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  PLCPLFacePullSupport *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  int64_t v57;
  id v58;
  id obj;
  id v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  NSObject *v67;
  __int16 v68;
  NSObject *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v60 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("manual == NO"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "filteredSetUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "unionSet:", v10);
  }
  objc_msgSend(v8, "faces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "faces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v13)
  {
    v14 = v13;
    v61 = *(_QWORD *)v63;
    v57 = a5;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v63 != v61)
          objc_enumerationMutation(obj);
        v16 = *(NSObject **)(*((_QWORD *)&v62 + 1) + 8 * v15);
        v17 = [PLFaceDimension alloc];
        v18 = -[PLSyncableAsset width](self->_currentAsset, "width");
        v19 = -[PLSyncableAsset height](self->_currentAsset, "height");
        -[NSObject centerX](v16, "centerX");
        v21 = v20;
        -[NSObject centerY](v16, "centerY");
        v23 = v22;
        -[NSObject size](v16, "size");
        v25 = v24;
        -[NSObject bodyCenterX](v16, "bodyCenterX");
        v27 = v26;
        -[NSObject bodyCenterY](v16, "bodyCenterY");
        v29 = v28;
        -[NSObject bodyWidth](v16, "bodyWidth");
        v31 = v30;
        -[NSObject bodyHeight](v16, "bodyHeight");
        v33 = -[PLFaceDimension initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:](v17, "initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:", v18, v19, v21, v23, v25, v27, v29, v31, v32);
        if (-[NSObject isManual](v16, "isManual"))
        {
          +[PLDetectedFace findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:](PLDetectedFace, "findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:", v33, v60, 1);
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v16, 0);
            v43 = objc_claimAutoreleasedReturnValue();
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject syncDescription](v43, "syncDescription");
                v46 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = v46;
                v68 = 2112;
                v69 = v16;
                v47 = v45;
                v48 = "Made a new manual face %@ with %@";
                goto LABEL_27;
              }
              goto LABEL_28;
            }
            goto LABEL_29;
          }
          v35 = v34;
          if (-[NSObject manual](v34, "manual"))
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject syncDescription](v35, "syncDescription");
                v37 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = v37;
                v68 = 2112;
                v69 = v16;
                _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Updating manual face %@ with %@", buf, 0x16u);

              }
            }
            v38 = self;
            v39 = v35;
            v40 = v16;
            v41 = 1;
            goto LABEL_48;
          }
          if (!a5)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                goto LABEL_45;
              goto LABEL_46;
            }
            goto LABEL_47;
          }
          if (a5 != 1)
            goto LABEL_55;
          -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v16, 0);
          v43 = objc_claimAutoreleasedReturnValue();
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject syncDescription](v43, "syncDescription");
              v49 = v8;
              v50 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v67 = v50;
              v68 = 2112;
              v69 = v16;
              _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Made a new manual face %@ with %@", buf, 0x16u);

              v8 = v49;
              a5 = v57;
            }
            goto LABEL_38;
          }
        }
        else
        {
          if (!-[NSObject hasCenterX](v16, "hasCenterX")
            || (-[NSObject centerX](v16, "centerX"), v42 == 0.0))
          {
            if (!-[NSObject isTorsoOnly](v16, "isTorsoOnly"))
            {
              if (*MEMORY[0x1E0D115D0])
                goto LABEL_60;
              __CPLAssetsdOSLogDomain();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v67 = v16;
                _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "Dropping unexpected faceRef %@", buf, 0xCu);
              }
              goto LABEL_59;
            }
          }
          if (!a5)
          {
            +[PLDetectedFace findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:](PLDetectedFace, "findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:", v33, v60, 1);
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              v35 = v51;
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
LABEL_45:
                  -[NSObject syncDescription](v35, "syncDescription");
                  v53 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v67 = v53;
                  v68 = 2112;
                  v69 = v16;
                  _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "Found existing face %@ matching %@", buf, 0x16u);

                }
LABEL_46:

              }
LABEL_47:
              v38 = self;
              v39 = v35;
              v40 = v16;
              v41 = 0;
LABEL_48:
              -[PLCPLFacePullSupport _finalizeFace:withFaceRef:applyDimensionAndState:](v38, "_finalizeFace:withFaceRef:applyDimensionAndState:", v39, v40, v41);
              v35 = v35;
              v43 = v35;
              goto LABEL_56;
            }
            if (-[PLSyncableAsset faceDetectionComplete](self->_currentAsset, "faceDetectionComplete"))
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v67 = v16;
                  _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEFAULT, "Face detection complete and a matching face for downloaded face is not found, dropping the face %@", buf, 0xCu);
                }

              }
              v35 = 0;
LABEL_55:
              v43 = 0;
              goto LABEL_56;
            }
            -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v16, objc_msgSend(v8, "facesVersion"));
            v43 = objc_claimAutoreleasedReturnValue();
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject syncDescription](v43, "syncDescription");
                v46 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = v46;
                v68 = 2112;
                v69 = v16;
                v47 = v45;
                v48 = "Made a new detected face %@ with %@";
LABEL_27:
                _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0x16u);

              }
LABEL_28:

            }
LABEL_29:
            v35 = 0;
            goto LABEL_56;
          }
          if (a5 != 1)
            goto LABEL_60;
          -[PLCPLFacePullSupport _createFaceFromFaceRef:algorithmVersion:](self, "_createFaceFromFaceRef:algorithmVersion:", v16, objc_msgSend(v8, "facesVersion"));
          v43 = objc_claimAutoreleasedReturnValue();
          if (*MEMORY[0x1E0D115D0])
            goto LABEL_57;
          __CPLAssetsdOSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject syncDescription](v43, "syncDescription");
            v44 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v44;
            v68 = 2112;
            v69 = v16;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Made a new detected face %@ with %@", buf, 0x16u);
LABEL_38:

          }
        }
LABEL_56:

LABEL_57:
        if (!v43)
          goto LABEL_60;
        objc_msgSend(v58, "addObject:", v43);
LABEL_59:

LABEL_60:
        ++v15;
      }
      while (v14 != v15);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      v14 = v55;
    }
    while (v55);
  }

  return v58;
}

- (id)_createFaceFromFaceRef:(id)a3 algorithmVersion:(int)a4
{
  uint64_t v4;
  PLSyncContext *syncContext;
  id v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  syncContext = self->_syncContext;
  v7 = a3;
  -[PLSyncContext makeFace](syncContext, "makeFace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCPLFacePullSupport _finalizeFace:withFaceRef:applyDimensionAndState:](self, "_finalizeFace:withFaceRef:applyDimensionAndState:", v8, v7, 1);

  objc_msgSend(v8, "setFaceAlgorithmVersion:", v4);
  return v8;
}

- (void)_finalizeFace:(id)a3 withFaceRef:(id)a4 applyDimensionAndState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = a4;
  if (v5)
    -[PLCPLFacePullSupport _applyDimensionAndStateFromFaceReference:toDetectedFace:](self, "_applyDimensionAndStateFromFaceReference:toDetectedFace:", v8, v9);
  -[PLCPLFacePullSupport _applyPersonFromFaceReference:toDetectedFace:](self, "_applyPersonFromFaceReference:toDetectedFace:", v8, v9);
  objc_msgSend(v9, "setCloudLocalState:", 1);
  objc_msgSend(v9, "setSourceWidth:", -[PLSyncableAsset width](self->_currentAsset, "width"));
  objc_msgSend(v9, "setSourceHeight:", -[PLSyncableAsset height](self->_currentAsset, "height"));

}

- (void)_applyDimensionAndStateFromFaceReference:(id)a3 toDetectedFace:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;

  v8 = a4;
  v5 = a3;
  objc_msgSend(v5, "centerX");
  objc_msgSend(v8, "setCenterX:");
  objc_msgSend(v5, "centerY");
  objc_msgSend(v8, "setCenterY:");
  objc_msgSend(v5, "size");
  objc_msgSend(v8, "setSize:");
  objc_msgSend(v8, "setManual:", objc_msgSend(v5, "isManual"));
  objc_msgSend(v5, "bodyCenterX");
  objc_msgSend(v8, "setBodyCenterX:");
  objc_msgSend(v5, "bodyCenterY");
  objc_msgSend(v8, "setBodyCenterY:");
  objc_msgSend(v5, "bodyWidth");
  objc_msgSend(v8, "setBodyWidth:");
  objc_msgSend(v5, "bodyHeight");
  v7 = v6;

  objc_msgSend(v8, "setBodyHeight:", v7);
}

- (void)_unlinkPersonIfVerifiedFromFace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "personForFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && ((objc_msgSend(v4, "userVerified") & 1) != 0 || objc_msgSend(v5, "graphVerified")))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "pointerDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "personForFace");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "syncDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Unlinking face %@ from person %@", (uint8_t *)&v10, 0x16u);

      }
    }
    objc_msgSend(v3, "setPersonBeingKeyFace:", 0);
    objc_msgSend(v3, "setAssociatedPerson:", 0);
  }

}

- (BOOL)_canAssignFaceFromPerson:(id)a3 toPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  PLSyncContext *syncContext;
  void *v12;
  _BOOL4 v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "personUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
    goto LABEL_8;
  if (!objc_msgSend(v7, "graphVerified"))
    goto LABEL_8;
  syncContext = self->_syncContext;
  objc_msgSend(v6, "personUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(syncContext) = -[PLSyncContext personUUIDIsDeleted:](syncContext, "personUUIDIsDeleted:", v12);

  if ((syncContext & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(v6, "userVerified") & 1) == 0)
  {
    if (objc_msgSend(v6, "graphVerified"))
    {
      v13 = !+[PLPerson person:isBetterMergeTargetThanPerson:](PLPerson, "person:isBetterMergeTargetThanPerson:", v6, v7);
      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v13) = 1;
    goto LABEL_9;
  }
  LOBYTE(v13) = 0;
LABEL_9:

  return v13;
}

- (void)_applyPersonFromFaceReference:(id)a3 toDetectedFace:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  PLCPLFacePullSupport *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int16 v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  PLCPLFacePullSupport *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v48 = v6;
  objc_msgSend(v6, "personIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v45 = v8;
  v47 = v7;
  if (v8)
  {
    -[PLSyncContext personForUUID:](self->_syncContext, "personForUUID:", v8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self;
    if (v9)
    {
      objc_msgSend(v7, "personForFace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PLCPLFacePullSupport _canAssignFaceFromPerson:toPerson:](self, "_canAssignFaceFromPerson:toPerson:", v11, v9))
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v48, "pointerDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "syncDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v55 = v13;
            v56 = 2112;
            v57 = v14;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Applying faceRef %@ for %@", buf, 0x16u);

          }
        }
        v15 = objc_msgSend(v48, "nameSource");
        objc_msgSend(v7, "setCloudNameSource:", v15);
        if ((int)v15 >= 7)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v48, "pointerDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v55 = v17;
              v56 = 1024;
              LODWORD(v57) = v15;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "%@ has unsupported name source %d, defaulting to not-set", buf, 0x12u);

            }
          }
          v15 = 0;
        }
        objc_msgSend(v7, "setNameSource:", v15);
        if (objc_msgSend(v48, "isKeyFace"))
        {
          if (objc_msgSend(v7, "nameSource") == 5
            || objc_msgSend(v7, "nameSource") == 1
            || objc_msgSend(v7, "nameSource") == 3)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v7, "pointerDescription");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "pointerDescription");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v55 = v19;
                v56 = 2112;
                v57 = v20;
                _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Setting keyFace %@ to person %@", buf, 0x16u);

              }
            }
            objc_msgSend(v7, "setPersonBeingKeyFace:", v9);
            objc_msgSend(v9, "setKeyFaceToPicked");
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v48;
              _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "Key faceRef %@ has invalid nameSource, keeping face, but dropping being key", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v7, "setAssociatedPerson:", v9);
        if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
        {
          v21 = objc_msgSend(v48, "detectionType");
          if (!v21)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v48;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "FaceRef record has unknown detectionType, defaulting to Human detectionType %@", buf, 0xCu);
              }

            }
            v21 = 1;
          }
          objc_msgSend(v7, "setDetectionType:", v21);
        }
      }
      else if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v48, "pointerDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "syncDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v55 = v27;
          v56 = 2112;
          v57 = v28;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Unable to assign faceRef %@ to person %@", buf, 0x16u);

        }
      }

    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v48;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unable to find person for faceRef %@", buf, 0xCu);
        }

      }
      -[PLCPLFacePullSupport _unlinkPersonIfVerifiedFromFace:](self, "_unlinkPersonIfVerifiedFromFace:", v7);
    }

  }
  else
  {
    v10 = self;
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v48, "pointerDescription", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "faceRef %@ has no person", buf, 0xCu);

      }
    }
    -[PLCPLFacePullSupport _unlinkPersonIfVerifiedFromFace:](v10, "_unlinkPersonIfVerifiedFromFace:", v7, v45);
  }
  v29 = (_BYTE *)MEMORY[0x1E0D115D0];
  objc_msgSend(v48, "rejectedPersonIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v30, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v32 = v30;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        -[PLSyncContext personForUUID:](v10->_syncContext, "personForUUID:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          if (!*v29)
          {
            __CPLAssetsdOSLogDomain();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v38, "syncDescription");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "pointerDescription");
              v41 = v10;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v55 = v40;
              v56 = 2112;
              v57 = v42;
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Adding rejectedPerson %@ for faceRef %@", buf, 0x16u);

              v10 = v41;
              v29 = (_BYTE *)MEMORY[0x1E0D115D0];

            }
          }
          objc_msgSend(v31, "addObject:", v38);
        }
        else if (!*v29)
        {
          __CPLAssetsdOSLogDomain();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v37;
            v56 = 2112;
            v57 = v48;
            _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "Unable to find rejected person with UUID %@ for %@", buf, 0x16u);
          }

        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v34);
  }

  objc_msgSend(v47, "setRejectedPersons:", v31);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

+ (id)_disjointSetsByAddingSet:(id)a3 toSets:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "intersectsSet:", v14, (_QWORD)v16))
          objc_msgSend(v8, "unionSet:", v14);
        else
          objc_msgSend(v7, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "addObject:", v8);
  return v7;
}

@end
