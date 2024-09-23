@implementation PLMediaAnalysisAssetAttributes

+ (id)entityName
{
  return CFSTR("MediaAnalysisAssetAttributes");
}

- (void)setBestVideoTimeRange:(id *)a3
{
  uint64_t var1;
  int64_t var0;
  uint64_t v7;

  var1 = a3->var0.var1;
  -[PLMediaAnalysisAssetAttributes setBestVideoRangeStartValue:](self, "setBestVideoRangeStartValue:", a3->var0.var0);
  -[PLMediaAnalysisAssetAttributes setBestVideoRangeStartTimeScale:](self, "setBestVideoRangeStartTimeScale:", var1);
  var0 = a3->var1.var0;
  v7 = a3->var1.var1;
  -[PLMediaAnalysisAssetAttributes setBestVideoRangeDurationValue:](self, "setBestVideoRangeDurationValue:", var0);
  -[PLMediaAnalysisAssetAttributes setBestVideoRangeDurationTimeScale:](self, "setBestVideoRangeDurationTimeScale:", v7);
}

- ($70930193D4F448A53BB9343C0237EB5F)bestVideoTimeRange
{
  CMTime v6;
  CMTime start;
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, -[PLMediaAnalysisAssetAttributes bestVideoRangeStartValue](self, "bestVideoRangeStartValue"), -[PLMediaAnalysisAssetAttributes bestVideoRangeStartTimeScale](self, "bestVideoRangeStartTimeScale"));
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, -[PLMediaAnalysisAssetAttributes bestVideoRangeDurationValue](self, "bestVideoRangeDurationValue"), -[PLMediaAnalysisAssetAttributes bestVideoRangeDurationTimeScale](self, "bestVideoRangeDurationTimeScale"));
  start = v9;
  v6 = v8;
  return ($70930193D4F448A53BB9343C0237EB5F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  uint64_t var1;
  int64_t var0;
  uint64_t v7;

  var1 = a3->var0.var1;
  -[PLMediaAnalysisAssetAttributes setAnimatedStickerRangeStartValue:](self, "setAnimatedStickerRangeStartValue:", a3->var0.var0);
  -[PLMediaAnalysisAssetAttributes setAnimatedStickerRangeStartTimeScale:](self, "setAnimatedStickerRangeStartTimeScale:", var1);
  var0 = a3->var1.var0;
  v7 = a3->var1.var1;
  -[PLMediaAnalysisAssetAttributes setAnimatedStickerRangeDurationValue:](self, "setAnimatedStickerRangeDurationValue:", var0);
  -[PLMediaAnalysisAssetAttributes setAnimatedStickerRangeDurationTimeScale:](self, "setAnimatedStickerRangeDurationTimeScale:", v7);
}

- ($70930193D4F448A53BB9343C0237EB5F)animatedStickerTimeRange
{
  CMTime v6;
  CMTime start;
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, -[PLMediaAnalysisAssetAttributes animatedStickerRangeStartValue](self, "animatedStickerRangeStartValue"), -[PLMediaAnalysisAssetAttributes animatedStickerRangeStartTimeScale](self, "animatedStickerRangeStartTimeScale"));
  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, -[PLMediaAnalysisAssetAttributes animatedStickerRangeDurationValue](self, "animatedStickerRangeDurationValue"), -[PLMediaAnalysisAssetAttributes animatedStickerRangeDurationTimeScale](self, "animatedStickerRangeDurationTimeScale"));
  start = v9;
  v6 = v8;
  return ($70930193D4F448A53BB9343C0237EB5F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (void)setCharacterRecognitionData:(id)a3 machineReadableCodeData:(id)a4 algorithmVersion:(signed __int16)a5 adjustmentVersion:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = a3;
  v10 = a6;
  v11 = a4;
  -[PLMediaAnalysisAssetAttributes characterRecognitionAttributes](self, "characterRecognitionAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCharacterRecognitionAttributes entityName](PLCharacterRecognitionAttributes, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v14, (uint64_t)v13, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[PLMediaAnalysisAssetAttributes setCharacterRecognitionAttributes:](self, "setCharacterRecognitionAttributes:", v12);

  }
  objc_msgSend(v12, "setCharacterRecognitionData:", v15);
  objc_msgSend(v12, "setMachineReadableCodeData:", v11);

  objc_msgSend(v12, "setAlgorithmVersion:", v7);
  objc_msgSend(v12, "setAdjustmentVersion:", v10);

}

- (void)resetCharacterRecognitionAttributes
{
  void *v3;
  id v4;

  -[PLMediaAnalysisAssetAttributes characterRecognitionAttributes](self, "characterRecognitionAttributes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteObject:", v4);

    -[PLMediaAnalysisAssetAttributes setCharacterRecognitionAttributes:](self, "setCharacterRecognitionAttributes:", 0);
  }

}

- (void)setVisualSearchData:(id)a3 algorithmVersion:(signed __int16)a4 adjustmentVersion:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  -[PLMediaAnalysisAssetAttributes visualSearchAttributes](self, "visualSearchAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLVisualSearchAttributes entityName](PLVisualSearchAttributes, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[PLMediaAnalysisAssetAttributes setVisualSearchAttributes:](self, "setVisualSearchAttributes:", v9);

  }
  objc_msgSend(v9, "setVisualSearchData:", v12);
  objc_msgSend(v9, "setAlgorithmVersion:", v6);
  objc_msgSend(v9, "setAdjustmentVersion:", v8);

}

- (void)setStickerConfidenceScore:(float)a3 stickerAlgorithmVersion:(signed __int16)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v4 = a4;
  -[PLMediaAnalysisAssetAttributes visualSearchAttributes](self, "visualSearchAttributes");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLVisualSearchAttributes entityName](PLVisualSearchAttributes, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[PLMediaAnalysisAssetAttributes setVisualSearchAttributes:](self, "setVisualSearchAttributes:", v11);

  }
  -[PLMediaAnalysisAssetAttributes asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  objc_msgSend(v9, "setStickerConfidenceScore:", v10);

  objc_msgSend(v11, "setStickerConfidenceAlgorithmVersion:", v4);
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLMediaAnalysisAssetAttributes;
  -[PLManagedObject prepareForDeletion](&v5, sel_prepareForDeletion);
  objc_opt_class();
  -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    +[PLDelayedSearchIndexUpdates recordMediaAnalysisAssetAttributesIfNeeded:](PLDelayedSearchIndexUpdates, "recordMediaAnalysisAssetAttributesIfNeeded:", self);
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PLMediaAnalysisAssetAttributes;
  -[PLManagedObject willSave](&v29, sel_willSave);
  -[PLMediaAnalysisAssetAttributes managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  -[PLMediaAnalysisAssetAttributes changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syndicationProcessingValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLMediaAnalysisAssetAttributes asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSyndicationStateWithSyndicationProcessingValue:", -[PLMediaAnalysisAssetAttributes syndicationProcessingValue](self, "syndicationProcessingValue"));

    if (PLPlatformMomentsSupported())
    {
      if (-[PLMediaAnalysisAssetAttributes isUpdated](self, "isUpdated"))
      {
        -[PLMediaAnalysisAssetAttributes asset](self, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "needsMomentUpdate");

        if ((v8 & 1) == 0)
        {
          PLMomentsGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            -[PLMediaAnalysisAssetAttributes asset](self, "asset");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v31 = v11;
            _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Adding asset %@ to be updated in moments due to relevant MediaAnalysisAttributes change", buf, 0xCu);

          }
          -[PLMediaAnalysisAssetAttributes asset](self, "asset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setNeedsMomentUpdate:", 1);

          objc_msgSend(v3, "delayedSaveActions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMediaAnalysisAssetAttributes asset](self, "asset");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordAssetForMomentUpdate:", v14);

        }
      }
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exposureScore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLMediaAnalysisAssetAttributes exposureScore](self, "exposureScore");
    v17 = v16;
    -[PLMediaAnalysisAssetAttributes asset](self, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "additionalAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17 == 0.0)
    {
      v21 = 32;
      v22 = 0;
    }
    else
    {
      v21 = 0;
      v22 = 32;
    }
    objc_msgSend(v19, "addDuplicateDetectorPerceptualProcessingStates:removeProcessingStates:", v21, v22);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaAnalysisTimeStamp"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
LABEL_17:
    -[PLMediaAnalysisAssetAttributes asset](self, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isReadyForPurgeSyndicationResources");

    if (v26)
    {
      -[PLMediaAnalysisAssetAttributes asset](self, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "purgeSyndicationResourcesAfterMediaAnalysisProcessing");

    }
  }
  if (PLPlatformSearchSupported())
  {
    objc_msgSend(v3, "delayedSaveActions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "recordMediaAnalysisAssetAttributesForSearchIndexUpdate:", self);

  }
  if ((-[PLMediaAnalysisAssetAttributes isDeleted](self, "isDeleted") & 1) == 0)
    +[PLDelayedSearchIndexUpdates recordMediaAnalysisAssetAttributesIfNeeded:](PLDelayedSearchIndexUpdates, "recordMediaAnalysisAssetAttributesIfNeeded:", self);

LABEL_24:
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("MediaAnalysisAssetAttributes"));
}

@end
