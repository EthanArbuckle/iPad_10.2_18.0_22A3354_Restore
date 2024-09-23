@implementation PLIngestJobCameraMetadata

- (PLIngestJobCameraMetadata)initWithCameraMetadataPath:(id)a3
{
  id v5;
  PLIngestJobCameraMetadata *v6;
  PLIngestJobCameraMetadata *v7;
  CGPoint v8;
  CGSize v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLIngestJobCameraMetadata;
  v6 = -[PLIngestJobCameraMetadata init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraMetadataPath, a3);
    v8 = (CGPoint)*MEMORY[0x1E0C9D648];
    v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v7->_preferredCropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v7->_preferredCropRect.size = v9;
    v7->_acceptableCropRect.origin = v8;
    v7->_acceptableCropRect.size = v9;
  }

  return v7;
}

- (void)setCameraMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cameraMetadata, a3);
  -[PLIngestJobCameraMetadata _ingestCameraMetadata](self, "_ingestCameraMetadata");
}

- (void)deserializeCameraMetadata
{
  NSString *cameraMetadataPath;
  void *v4;
  NSObject *v5;
  PFCameraMetadata *v6;
  NSObject *v7;
  PFCameraMetadata *cameraMetadata;
  NSString *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_hasDeserializedMetadata)
  {
    cameraMetadataPath = self->_cameraMetadataPath;
    if (cameraMetadataPath)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", cameraMetadataPath, 2, &v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      if (v4)
      {
        v12 = 0;
        objc_msgSend(MEMORY[0x1E0D750D8], "deserializedMetadataFromData:error:", v4, &v12);
        v6 = (PFCameraMetadata *)objc_claimAutoreleasedReturnValue();
        v7 = v12;
        cameraMetadata = self->_cameraMetadata;
        self->_cameraMetadata = v6;

        if (self->_cameraMetadata)
        {
          -[PLIngestJobCameraMetadata _ingestCameraMetadata](self, "_ingestCameraMetadata");
        }
        else
        {
          PLAssetImportGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = objc_msgSend(v4, "length");
            *(_DWORD *)buf = 134218242;
            v15 = v11;
            v16 = 2112;
            v17 = v7;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Error deserializing camera metadata (length=%lu): %@", buf, 0x16u);
          }

        }
      }
      else
      {
        PLAssetImportGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_cameraMetadataPath;
          *(_DWORD *)buf = 138412546;
          v15 = (uint64_t)v9;
          v16 = 2112;
          v17 = v5;
          _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Error reading camera metadata at path: %@ error: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v5 = 0;
    }
    self->_hasDeserializedMetadata = 1;

  }
}

- (void)_ingestCameraMetadata
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  VNImageAestheticsObservation *v14;
  VNImageAestheticsObservation *imageAestheticsObservation;
  void *v16;
  void *v17;
  void *v18;
  NSData *v19;
  id v20;
  NSData *sceneprintData;
  NSObject *v22;
  uint64_t v23;
  NSArray *v24;
  NSArray *junkImageClassificationObservations;
  NSDictionary *v26;
  NSDictionary *smartCamInfo;
  NSArray *v28;
  NSArray *contactIDsInProximity;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PFCameraMetadata saliencyObservation](self->_cameraMetadata, "saliencyObservation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PFCameraMetadata saliencyObservation](self->_cameraMetadata, "saliencyObservation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "narrowedBoundingBox");
    self->_acceptableCropRect.origin.x = v5;
    self->_acceptableCropRect.origin.y = v6;
    self->_acceptableCropRect.size.width = v7;
    self->_acceptableCropRect.size.height = v8;

    -[PFCameraMetadata saliencyObservation](self->_cameraMetadata, "saliencyObservation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingBox");
    self->_preferredCropRect.origin.x = v10;
    self->_preferredCropRect.origin.y = v11;
    self->_preferredCropRect.size.width = v12;
    self->_preferredCropRect.size.height = v13;

  }
  -[PFCameraMetadata imageAestheticsObservation](self->_cameraMetadata, "imageAestheticsObservation");
  v14 = (VNImageAestheticsObservation *)objc_claimAutoreleasedReturnValue();
  imageAestheticsObservation = self->_imageAestheticsObservation;
  self->_imageAestheticsObservation = v14;

  -[PFCameraMetadata scenePrintObservation](self->_cameraMetadata, "scenePrintObservation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sceneprints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v30);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  v20 = v30;
  sceneprintData = self->_sceneprintData;
  self->_sceneprintData = v19;

  if (!self->_sceneprintData)
  {
    PLAssetImportGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v18, "lengthInBytes");
      *(_DWORD *)buf = 134218242;
      v32 = v23;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Error serializing sceneprintData (length=%lu): %@", buf, 0x16u);
    }

  }
  -[PFCameraMetadata junkImageClassificationObservations](self->_cameraMetadata, "junkImageClassificationObservations");
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  junkImageClassificationObservations = self->_junkImageClassificationObservations;
  self->_junkImageClassificationObservations = v24;

  -[PFCameraMetadata smartCamInfo](self->_cameraMetadata, "smartCamInfo");
  v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  smartCamInfo = self->_smartCamInfo;
  self->_smartCamInfo = v26;

  -[PFCameraMetadata contactIDsInProximity](self->_cameraMetadata, "contactIDsInProximity");
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contactIDsInProximity = self->_contactIDsInProximity;
  self->_contactIDsInProximity = v28;

  self->_sharedLibraryMode = -[PFCameraMetadata sharedLibraryMode](self->_cameraMetadata, "sharedLibraryMode");
}

- (void)applyCameraMetadataToAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *junkImageClassificationObservations;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  float v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *smartCamInfo;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  int v44;
  void *v45;
  int64_t v46;
  PLIngestJobCameraMetadata *v47;
  PLIngestJobCameraMetadata *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  PLIngestJobCameraMetadata *v56;
  char v57;
  char v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  char v67;
  char v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLIngestJobCameraMetadata deserializeCameraMetadata](self, "deserializeCameraMetadata");
  -[PFCameraMetadata saliencyObservation](self->_cameraMetadata, "saliencyObservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!CGRectIsEmpty(self->_acceptableCropRect))
      objc_msgSend(v4, "setPackedAcceptableCropRect:", PLCombineToInt64());
    if (!CGRectIsEmpty(self->_preferredCropRect))
      objc_msgSend(v4, "setPackedPreferredCropRect:", PLCombineToInt64());
  }
  objc_msgSend(v4, "managedObjectContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_imageAestheticsObservation)
  {
    objc_msgSend(v4, "computedAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[PLComputedAssetAttributes entityName](PLComputedAssetAttributes, "entityName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v62, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setComputedAttributes:", v6);
      objc_msgSend(v6, "setPropertiesFromImageAestheticsObservation:", self->_imageAestheticsObservation);
    }
    -[VNImageAestheticsObservation aestheticScore](self->_imageAestheticsObservation, "aestheticScore");
    objc_msgSend(v4, "setOverallAestheticScore:");

  }
  if (self->_sceneprintData)
  {
    objc_msgSend(v4, "additionalAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSceneprintWithData:", self->_sceneprintData);

  }
  junkImageClassificationObservations = self->_junkImageClassificationObservations;
  if (junkImageClassificationObservations)
  {
    v61 = v4;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v10 = junkImageClassificationObservations;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v15, "confidence");
          if (v16 >= 0.01)
          {
            objc_msgSend(v15, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLSceneClassification PLJunkSceneClassificationIDForLabel:](PLSceneClassification, "PLJunkSceneClassificationIDForLabel:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v62, "photoLibrary");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (int)objc_msgSend(v18, "intValue");
              objc_msgSend(v15, "confidence");
              v22 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v19, v61, v20, 0, 0, v21, 0.0, 0.0);

            }
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v12);
    }

    v4 = v61;
    objc_msgSend(v61, "additionalAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSceneAnalysisVersion:", (__int16)*MEMORY[0x1E0D75708]);

    objc_msgSend(v61, "additionalAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "adjustmentTimestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v24, "setSceneAnalysisTimestamp:", v25);
    }
    else
    {
      objc_msgSend(v61, "dateCreated");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setSceneAnalysisTimestamp:", v26);

    }
    v68 = 1;
    objc_msgSend(v61, "additionalAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v68, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDistanceIdentity:", v28);

  }
  smartCamInfo = self->_smartCamInfo;
  if (smartCamInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](smartCamInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A010]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05118]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v62, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v32, v4, 2147482063, 0, 0);

    }
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05128]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v62, "photoLibrary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v35, v4, 2147482079, 0, 0);

    }
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05120]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v62, "photoLibrary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v38, v4, 2147482095, 0, 0);

    }
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05110]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v62, "photoLibrary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v42 = +[PLSceneClassification insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:](PLSceneClassification, "insertIntoPhotoLibrary:asset:sceneIdentifier:confidence:packedBoundingBoxRect:startTime:duration:classificationType:", v41, v4, 2147482111, 0, 0);

    }
    -[NSDictionary objectForKeyedSubscript:](self->_smartCamInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A018]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "BOOLValue");

    if (v44)
    {
      objc_msgSend(v4, "additionalAttributes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setSceneAnalysisIsFromPreview:", 1);

    }
  }
  v46 = self->_sharedLibraryMode - 1;
  v47 = self;
  v48 = 0;
  v49 = 2;
  switch(v46)
  {
    case 0:
    case 1:
      goto LABEL_43;
    case 2:
      PLLibraryScopeAssetSetUserManuallyRejectedState(1, v4);
      goto LABEL_50;
    case 3:
      v49 = 3;
      LODWORD(v48) = 1;
LABEL_43:
      +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v62);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v50)
      {
        if ((_DWORD)v48
          && !MEMORY[0x19AEC04BC](objc_msgSend(v50, "setCountOfAssetsAddedByCameraSmartSharing:", objc_msgSend(v50, "countOfAssetsAddedByCameraSmartSharing") + 1)))
        {
          v49 = 2;
        }
        PLLibraryScopeAssetSetSuggestedByClientType(v49, v4);
        PLLibraryScopeAssetSetAddToSharedZoneState(1, v4);
        objc_msgSend(v4, "setLibraryScopeWithCurrentUserAsContributor:", v51);
      }

      goto LABEL_50;
    case 4:
      PLLibraryScopeAssetSetCameraRejectedState(1, v4);
LABEL_50:
      v48 = v47;
      break;
    default:
      break;
  }
  -[PFCameraMetadata faceObservations](v48->_cameraMetadata, "faceObservations");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "count") && (objc_msgSend((id)objc_opt_class(), "faceObservationIngestDisabled") & 1) == 0)
  {
    -[PFCameraMetadata torsoprints](v48->_cameraMetadata, "torsoprints");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");
    v55 = v4;
    if (v54 >= objc_msgSend(v52, "count"))
    {
      v58 = objc_msgSend((id)objc_opt_class(), "facePrintIngestDisabled");
      v56 = v48;
      v57 = v58 ^ 1;
    }
    else
    {
      v56 = v48;
      v57 = 0;
    }
    -[PFCameraMetadata faceObservations](v56->_cameraMetadata, "faceObservations");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __56__PLIngestJobCameraMetadata_applyCameraMetadataToAsset___block_invoke;
    v63[3] = &unk_1E36601A8;
    v64 = v62;
    v67 = v57;
    v65 = v55;
    v66 = v53;
    v60 = v53;
    objc_msgSend(v59, "enumerateObjectsUsingBlock:", v63);

    v4 = v55;
  }

}

- (PFCameraMetadata)cameraMetadata
{
  return self->_cameraMetadata;
}

- (PFCameraMetadata)overCaptureCameraMetadata
{
  return self->_overCaptureCameraMetadata;
}

- (void)setOverCaptureCameraMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_overCaptureCameraMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overCaptureCameraMetadata, 0);
  objc_storeStrong((id *)&self->_cameraMetadata, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
  objc_storeStrong((id *)&self->_smartCamInfo, 0);
  objc_storeStrong((id *)&self->_imageAestheticsObservation, 0);
  objc_storeStrong((id *)&self->_junkImageClassificationObservations, 0);
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_cameraMetadataPath, 0);
}

void __56__PLIngestJobCameraMetadata_applyCameraMetadataToAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[PLManagedObject insertInManagedObjectContext:](PLDetectedFace, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssetForFace:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "boundingBox");
  objc_msgSend(v6, "setCenterX:", CGRectGetMidX(v28));
  objc_msgSend(v5, "boundingBox");
  objc_msgSend(v6, "setCenterY:", CGRectGetMidY(v29));
  objc_msgSend(v5, "roll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "setRoll:");

  objc_msgSend(v5, "yaw");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v6, "setPoseYaw:");

  v9 = objc_msgSend(*(id *)(a1 + 40), "width");
  v10 = objc_msgSend(*(id *)(a1 + 40), "height");
  if (v9 && (v11 = v10) != 0)
  {
    objc_msgSend(v5, "boundingBox");
    v13 = v12 * (double)v9;
    objc_msgSend(v5, "boundingBox");
    v15 = v14 * (double)v11;
    if (v13 >= v15)
      v15 = v13;
    if (v9 <= v11)
      v16 = v11;
    else
      v16 = v9;
    objc_msgSend(v6, "setSize:", v15 / (double)v16);
    objc_msgSend(v6, "setSourceWidth:", v9);
    objc_msgSend(v6, "setSourceHeight:", v11);
  }
  else
  {
    PLAssetImportGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Facerect ingest failure: cannot compute size due to missing width/height for asset: %@", buf, 0xCu);

    }
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 != v20)
    {
      v24 = 0;
      objc_msgSend(v19, "serializeStateAndReturnError:", &v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v24;
      if (v21)
      {
        +[PLManagedObject insertInManagedObjectContext:](PLDetectedFaceprint, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 32));
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSObject setFace:](v23, "setFace:", v6);
        -[NSObject setData:](v23, "setData:", v21);
        -[NSObject setFaceprintVersion:](v23, "setFaceprintVersion:", objc_msgSend(v19, "requestRevision"));
        objc_msgSend(v6, "setFaceprint:", v23);
        objc_msgSend(v6, "setAssetForFace:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v6, "setFaceAlgorithmVersion:", 0);
      }
      else
      {
        PLAssetImportGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v22;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Faceprint ingest failure: failed to serialize faceprint with error %@", buf, 0xCu);
        }
      }

    }
  }
  objc_msgSend(v6, "fixAssetRelationshipsForFaceTorsoOrTemporal");

}

+ (BOOL)faceObservationIngestDisabled
{
  NSObject *v2;
  uint8_t v4[16];

  if (faceObservationIngestDisabled_onceToken != -1)
    dispatch_once(&faceObservationIngestDisabled_onceToken, &__block_literal_global_1568);
  if (!faceObservationIngestDisabled_faceObservationIngestDisabled)
    return 0;
  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "PLIngestJobCameraMetadata initialized with face observation ingest disabled", v4, 2u);
  }

  return faceObservationIngestDisabled_faceObservationIngestDisabled != 0;
}

+ (BOOL)facePrintIngestDisabled
{
  NSObject *v2;
  uint8_t v4[16];

  if (facePrintIngestDisabled_onceToken != -1)
    dispatch_once(&facePrintIngestDisabled_onceToken, &__block_literal_global_46);
  if (!facePrintIngestDisabled_facePrintIngestDisabled)
    return 0;
  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "PLIngestJobCameraMetadata initialized with face print ingest disabled", v4, 2u);
  }

  return facePrintIngestDisabled_facePrintIngestDisabled != 0;
}

void __52__PLIngestJobCameraMetadata_facePrintIngestDisabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  facePrintIngestDisabled_facePrintIngestDisabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLIngestJobCameraMetadataFacePrintIngestDisabled"));

}

void __58__PLIngestJobCameraMetadata_faceObservationIngestDisabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  faceObservationIngestDisabled_faceObservationIngestDisabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLIngestJobCameraMetadataFaceObservationIngestDisabled"));

}

@end
