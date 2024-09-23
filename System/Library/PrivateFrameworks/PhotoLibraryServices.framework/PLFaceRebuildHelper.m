@implementation PLFaceRebuildHelper

- (PLFaceRebuildHelper)initWithContext:(id)a3
{
  id v5;
  PLFaceRebuildHelper *v6;
  PLFaceRebuildHelper *v7;
  PLFaceRebuildHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFaceRebuildHelper;
  v6 = -[PLFaceRebuildHelper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (void)rebuildDetectedFace:(id)a3 onAsset:(id)a4 person:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Rebuilding detected face", (uint8_t *)&v17, 2u);
    }

    -[PLFaceRebuildHelper findOrInsertDetectedFaceForRebuildFace:onAsset:](self, "findOrInsertDetectedFaceForRebuildFace:onAsset:", v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
    {
      -[NSObject setAssociatedPerson:](v13, "setAssociatedPerson:", v10);
      if (objc_msgSend(v8, "isRepresentative"))
        objc_msgSend(v10, "setKeyFace:pickSource:", v12, objc_msgSend(v10, "keyFacePickSource"));
      if (!PLIsCloudPhotoLibraryEnabledForCurrentUser()
        && (objc_msgSend(v8, "nameSource") == 1 || objc_msgSend(v8, "nameSource") == 5))
      {
        -[NSObject setConfirmedFaceCropGenerationState:](v12, "setConfirmedFaceCropGenerationState:", 1);
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "pl_shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v15;
          v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Face rebuild scheduling confirmed face crop generation for asset %@ person %@", (uint8_t *)&v17, 0x16u);

        }
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Skipping rebuild of detected face because person is nil: %@", (uint8_t *)&v17, 0xCu);
  }

}

- (void)rebuildRejectedFace:(id)a3 onAsset:(id)a4 person:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Rebuilding rejected face", (uint8_t *)&v17, 2u);
    }

    -[PLFaceRebuildHelper findOrInsertDetectedFaceForRebuildFace:onAsset:](self, "findOrInsertDetectedFaceForRebuildFace:onAsset:", v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
    {
      -[NSObject addRejectedPerson:](v13, "addRejectedPerson:", v10);
      if (objc_msgSend(v8, "isClusterRejected"))
      {
        -[NSObject addClusterRejectedPerson:](v12, "addClusterRejectedPerson:", v10);
        -[NSObject addRejectedPersonNeedingFaceCrops:](v12, "addRejectedPersonNeedingFaceCrops:", v10);
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "pl_shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v15;
          v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Face rebuild scheduling rejected face crop generation for asset %@ person %@", (uint8_t *)&v17, 0x16u);

        }
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Skipping rebuild of rejected face because person is nil: %@", (uint8_t *)&v17, 0xCu);
  }

}

- (void)rebuildHiddenFace:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  PLMigrationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Rebuilding hidden face", v10, 2u);
  }

  v9 = -[PLFaceRebuildHelper findOrInsertDetectedFaceForRebuildFace:onAsset:](self, "findOrInsertDetectedFaceForRebuildFace:onAsset:", v6, v7);
}

- (id)findOrInsertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLFaceRebuildHelper findExistingDetectedFaceForRebuildFace:onAsset:](self, "findExistingDetectedFaceForRebuildFace:onAsset:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Found existing face: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    -[PLFaceRebuildHelper insertDetectedFaceForRebuildFace:onAsset:](self, "insertDetectedFaceForRebuildFace:onAsset:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)insertDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  PLMigrationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Inserting new face", v17, 2u);
  }

  +[PLManagedObject insertInManagedObjectContext:](PLDetectedFace, "insertInManagedObjectContext:", self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerX");
  objc_msgSend(v9, "setCenterX:");
  objc_msgSend(v6, "centerY");
  objc_msgSend(v9, "setCenterY:");
  objc_msgSend(v6, "size");
  objc_msgSend(v9, "setSize:");
  objc_msgSend(v6, "additionalDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "bodyCenterX");
    objc_msgSend(v9, "setBodyCenterX:");
    objc_msgSend(v11, "bodyCenterY");
    objc_msgSend(v9, "setBodyCenterY:");
    objc_msgSend(v11, "bodyWidth");
    objc_msgSend(v9, "setBodyWidth:");
    objc_msgSend(v11, "bodyHeight");
    objc_msgSend(v9, "setBodyHeight:");
    objc_msgSend(v11, "detectionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "detectionType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDetectionType:", (__int16)objc_msgSend(v13, "intValue"));

    }
    if (objc_msgSend(v11, "faceAlgorithmVersion"))
      v14 = objc_msgSend(v11, "faceAlgorithmVersion");
    else
      v14 = 1;
    objc_msgSend(v9, "setFaceAlgorithmVersion:", v14);
  }
  objc_msgSend(v9, "setManual:", objc_msgSend(v6, "isManual"));
  objc_msgSend(v9, "setHidden:", objc_msgSend(v6, "isHidden"));
  objc_msgSend(v9, "setNameSource:", objc_msgSend(v6, "nameSource"));
  objc_msgSend(v9, "setCloudNameSource:", objc_msgSend(v6, "cloudNameSource"));
  objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "width"));
  objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "height"));
  objc_msgSend(v7, "mutableDetectedFaces");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObject:", v9);
  return v9;
}

- (id)findExistingDetectedFaceForRebuildFace:(id)a3 onAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PLFaceDimension *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PLFaceDimension *v24;
  void *v25;
  void *v26;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "additionalDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PLFaceDimension alloc];
  v9 = objc_msgSend(v5, "width");
  v10 = objc_msgSend(v5, "height");
  objc_msgSend(v6, "centerX");
  v12 = v11;
  objc_msgSend(v6, "centerY");
  v14 = v13;
  objc_msgSend(v6, "size");
  v16 = v15;

  objc_msgSend(v7, "bodyCenterX");
  v18 = v17;
  objc_msgSend(v7, "bodyCenterY");
  v20 = v19;
  objc_msgSend(v7, "bodyWidth");
  v22 = v21;
  objc_msgSend(v7, "bodyCenterY");
  v24 = -[PLFaceDimension initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:](v8, "initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:", v9, v10, v12, v14, v16, v18, v20, v22, v23);
  objc_msgSend(v5, "mutableDetectedFaces");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDetectedFace findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:](PLDetectedFace, "findExistingFaceMatchingDimension:inFaces:ignoreSourceAssetDimensions:", v24, v25, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
