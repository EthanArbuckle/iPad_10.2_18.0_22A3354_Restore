@implementation PFVideoAVObjectBuilder

- (PFVideoAVObjectBuilder)initWithVideoAsset:(id)a3 videoAdjustments:(id)a4
{
  id v7;
  id v8;
  PFVideoAVObjectBuilder *v9;
  PFVideoAVObjectBuilder *v10;
  uint64_t v11;
  PFVideoAdjustments *videoAdjustments;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFVideoAVObjectBuilder;
  v9 = -[PFVideoAVObjectBuilder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoAsset, a3);
    v11 = objc_msgSend(v8, "copy");
    videoAdjustments = v10->_videoAdjustments;
    v10->_videoAdjustments = (PFVideoAdjustments *)v11;

  }
  return v10;
}

- (PFVideoAVObjectBuilder)initWithAsset:(id)a3 audioMix:(id)a4 videoComposition:(id)a5
{
  id v9;
  id v10;
  id v11;
  PFVideoAVObjectBuilder *v12;
  PFVideoAVObjectBuilder *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PFVideoAVObjectBuilder;
  v12 = -[PFVideoAVObjectBuilder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__finalAsset, a3);
    objc_storeStrong((id *)&v13->__finalAudioMix, a4);
    objc_storeStrong((id *)&v13->__finalVideoComposition, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v6;
  objc_super v7;
  objc_super v8;

  if (self->__finalAsset)
  {
    v8.receiver = self;
    v8.super_class = (Class)PFVideoAVObjectBuilder;
    -[PFVideoAVObjectBuilder description](&v8, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(%@, %@, %@)"), self->__finalAsset, self->__finalAudioMix, self->__finalVideoComposition);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PFVideoAVObjectBuilder;
    -[PFVideoAVObjectBuilder description](&v7, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(%@, %@)"), self->_videoAsset, self->_videoAdjustments, v6);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)requestPlayerItemWithResultHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  AVAsset *videoAsset;
  int v8;
  int v9;
  PFVideoAdjustments *videoAdjustments;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _OWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, id))a3;
  if (self->__finalAsset)
  {
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAudioMix:", self->__finalAudioMix);
    objc_msgSend(v5, "setVideoComposition:", self->__finalVideoComposition);
    v6 = 0;
    if (v4)
LABEL_3:
      v4[2](v4, v5, v6);
  }
  else
  {
    -[PFVideoAVObjectBuilder _synchronouslyLoadSlowMotionPropertiesFromAsset:](self, "_synchronouslyLoadSlowMotionPropertiesFromAsset:", self->_videoAsset);
    videoAsset = self->_videoAsset;
    -[PFVideoAdjustments slowMotionRate](self->_videoAdjustments, "slowMotionRate");
    v9 = v8;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      -[PFVideoAdjustments slowMotionTimeRange](videoAdjustments, "slowMotionTimeRange");
    }
    else
    {
      HIDWORD(v11) = 0;
      memset(v36, 0, sizeof(v36));
    }
    v35 = 0;
    LODWORD(v11) = v9;
    +[PFSlowMotionUtilities assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:](PFSlowMotionUtilities, "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", videoAsset, v36, 0, &v35, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v35;
    v34 = 0;
    -[PFVideoAVObjectBuilder _trimAssetIfNecessary:error:](self, "_trimAssetIfNecessary:error:", v12, &v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v34;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAudioMix:", v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AVAsset URL](self->_videoAsset, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && (objc_msgSend(v15, "isFileURL") & 1) == 0)
        {
          v27 = v16;
          v28 = v13;
          objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v16, 0);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "queryItems");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(obj);
                v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                objc_msgSend(v21, "name");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("pbl"));

                if (v23)
                {
                  objc_msgSend(v21, "value");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "intValue");

                  if (v25 >= 1)
                    objc_msgSend(v5, "setPreferredForwardBufferDuration:", (double)v25);
                  goto LABEL_24;
                }
              }
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
              if (v18)
                continue;
              break;
            }
          }
LABEL_24:

          v16 = v27;
          v13 = v28;
        }

      }
    }
    else
    {
      v5 = 0;
    }

    if (v4)
      goto LABEL_3;
  }

}

- (void)requestAsynchronousPlayerItemWithResultHandler:(id)a3
{
  id v4;
  AVAsset *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self->_videoAsset;
  +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys](PFSlowMotionUtilities, "slowMotionSourceAssetPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PFVideoAVObjectBuilder_requestAsynchronousPlayerItemWithResultHandler___block_invoke;
  v8[3] = &unk_1E45A4590;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v5, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v8);

}

- (void)requestExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  AVAsset *finalAsset;
  void *v9;
  AVAsset *videoAsset;
  int v11;
  int v12;
  PFVideoAdjustments *videoAdjustments;
  double v14;
  void *v15;
  id v16;
  char isKindOfClass;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _OWORD v24[3];

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  finalAsset = self->__finalAsset;
  if (finalAsset)
  {
    objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:", finalAsset, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAudioMix:", self->__finalAudioMix);
    objc_msgSend(v9, "setVideoComposition:", self->__finalVideoComposition);
    if (v7)
LABEL_3:
      v7[2](v7, v9, 0);
  }
  else
  {
    -[PFVideoAVObjectBuilder _synchronouslyLoadSlowMotionPropertiesFromAsset:](self, "_synchronouslyLoadSlowMotionPropertiesFromAsset:", self->_videoAsset);
    videoAsset = self->_videoAsset;
    -[PFVideoAdjustments slowMotionRate](self->_videoAdjustments, "slowMotionRate");
    v12 = v11;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      -[PFVideoAdjustments slowMotionTimeRange](videoAdjustments, "slowMotionTimeRange");
    }
    else
    {
      HIDWORD(v14) = 0;
      memset(v24, 0, sizeof(v24));
    }
    v23 = 0;
    LODWORD(v14) = v12;
    +[PFSlowMotionUtilities assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:](PFSlowMotionUtilities, "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", videoAsset, v24, 1, &v23, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v22 = 0;
    -[PFVideoAVObjectBuilder _trimAssetIfNecessary:error:](self, "_trimAssetIfNecessary:error:", v15, &v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;

    if (v18)
    {
      +[PFSlowMotionUtilities exportPresetForAsset:preferredPreset:](PFSlowMotionUtilities, "exportPresetForAsset:preferredPreset:", v18, v6);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:", v18, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAudioMix:", v16);
      if ((isKindOfClass & 1) != 0)
      {
        -[AVAsset metadata](self->_videoAsset, "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMetadata:", v21);

        +[PFSlowMotionUtilities configureExportSession:forcePreciseConversion:](PFSlowMotionUtilities, "configureExportSession:forcePreciseConversion:", v9, 0);
      }
      v6 = (id)v20;
    }
    else
    {
      v9 = 0;
    }

    if (v7)
      goto LABEL_3;
  }

}

- (void)requestAsynchronousExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  AVAsset *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = self->_videoAsset;
  +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys](PFSlowMotionUtilities, "slowMotionSourceAssetPropertyKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PFVideoAVObjectBuilder_requestAsynchronousExportSessionWithExportPreset_resultHandler___block_invoke;
  v12[3] = &unk_1E45A3E58;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v8, "loadValuesAsynchronouslyForKeys:completionHandler:", v9, v12);

}

- (void)requestAVAssetWithResultHandler:(id)a3
{
  -[PFVideoAVObjectBuilder requestAVAssetForExport:withResultHandler:](self, "requestAVAssetForExport:withResultHandler:", 1, a3);
}

- (void)requestAsynchronousAVAssetWithResultHandler:(id)a3
{
  id v4;
  AVAsset *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self->_videoAsset;
  +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys](PFSlowMotionUtilities, "slowMotionSourceAssetPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PFVideoAVObjectBuilder_requestAsynchronousAVAssetWithResultHandler___block_invoke;
  v8[3] = &unk_1E45A4590;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](v5, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v8);

}

- (void)requestAVAssetForExport:(BOOL)a3 withResultHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, AVAudioMix *, AVVideoComposition *, id);
  AVAsset *finalAsset;
  AVAsset *v8;
  AVAudioMix *v9;
  AVVideoComposition *v10;
  uint64_t v11;
  id v12;
  AVAsset *videoAsset;
  int v14;
  int v15;
  PFVideoAdjustments *videoAdjustments;
  double v17;
  id v18;
  id v19;
  _OWORD v20[3];

  v4 = a3;
  v6 = (void (**)(id, uint64_t, AVAudioMix *, AVVideoComposition *, id))a4;
  finalAsset = self->__finalAsset;
  if (finalAsset)
  {
    v8 = finalAsset;
    v9 = self->__finalAudioMix;
    v10 = self->__finalVideoComposition;
    if (v6)
    {
LABEL_3:
      v18 = 0;
      -[PFVideoAVObjectBuilder _trimAssetIfNecessary:error:](self, "_trimAssetIfNecessary:error:", v8, &v18);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;

      v6[2](v6, v11, v9, v10, v12);
      v8 = (AVAsset *)v11;
    }
  }
  else
  {
    -[PFVideoAVObjectBuilder _synchronouslyLoadSlowMotionPropertiesFromAsset:](self, "_synchronouslyLoadSlowMotionPropertiesFromAsset:", self->_videoAsset);
    videoAsset = self->_videoAsset;
    -[PFVideoAdjustments slowMotionRate](self->_videoAdjustments, "slowMotionRate");
    v15 = v14;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      -[PFVideoAdjustments slowMotionTimeRange](videoAdjustments, "slowMotionTimeRange");
    }
    else
    {
      HIDWORD(v17) = 0;
      memset(v20, 0, sizeof(v20));
    }
    v19 = 0;
    LODWORD(v17) = v15;
    +[PFSlowMotionUtilities assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:](PFSlowMotionUtilities, "assetFromVideoAsset:slowMotionRate:slowMotionTimeRange:forExport:outAudioMix:outTimeRangeMapper:", videoAsset, v20, v4, &v19, 0, v17);
    v8 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    v9 = (AVAudioMix *)v19;
    v10 = 0;
    if (v6)
      goto LABEL_3;
  }

}

- (void)_synchronouslyLoadSlowMotionPropertiesFromAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  PFVideoAVObjectBuilder *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys](PFSlowMotionUtilities, "slowMotionSourceAssetPropertyKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PFVideoAVObjectBuilder__synchronouslyLoadSlowMotionPropertiesFromAsset___block_invoke;
    v8[3] = &unk_1E45A4AC8;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v4, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v8);

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ was asked to load slo-mo properties from a nil AVAsset.", buf, 0xCu);
  }

}

- (id)_trimAssetIfNecessary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  $A492CB0B55828308C86558B6DC3A233A *p_timeRange;
  void *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if ((self->_timeRange.start.flags & 1) == 0
    || (self->_timeRange.duration.flags & 1) == 0
    || self->_timeRange.duration.epoch
    || self->_timeRange.duration.value < 0)
  {
    v8 = v6;
  }
  else
  {
    p_timeRange = &self->_timeRange;
    objc_msgSend(MEMORY[0x1E0C8B268], "composition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&p_timeRange->start.epoch;
    v32 = *(_OWORD *)&p_timeRange->start.value;
    v33 = v12;
    v34 = *(_OWORD *)&p_timeRange->duration.timescale;
    v30 = *MEMORY[0x1E0CA2E68];
    v31 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    if (+[PFMediaUtilities insertTimeRange:ofAsset:atTime:intoMutableComposition:error:](PFMediaUtilities, "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", &v32, v7, &v30, v11, a4))
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      v13 = *MEMORY[0x1E0C8A808];
      +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "preferredTransform");
      }
      else
      {
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
      }

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v11, "tracks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v22, "mediaType");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v13);

            if (v24)
            {
              v25[0] = v32;
              v25[1] = v33;
              v25[2] = v34;
              objc_msgSend(v22, "setPreferredTransform:", v25);
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v19);
      }

      v8 = v11;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (PFVideoAdjustments)videoAdjustments
{
  return self->_videoAdjustments;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForPlayback
{
  return self->__timeRangeMapperForPlayback;
}

- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForExport
{
  return self->__timeRangeMapperForExport;
}

- (AVAsset)_finalAsset
{
  return self->__finalAsset;
}

- (AVAudioMix)_finalAudioMix
{
  return self->__finalAudioMix;
}

- (AVVideoComposition)_finalVideoComposition
{
  return self->__finalVideoComposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__finalVideoComposition, 0);
  objc_storeStrong((id *)&self->__finalAudioMix, 0);
  objc_storeStrong((id *)&self->__finalAsset, 0);
  objc_storeStrong((id *)&self->__timeRangeMapperForExport, 0);
  objc_storeStrong((id *)&self->__timeRangeMapperForPlayback, 0);
  objc_storeStrong((id *)&self->_videoAdjustments, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

void __74__PFVideoAVObjectBuilder__synchronouslyLoadSlowMotionPropertiesFromAsset___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __70__PFVideoAVObjectBuilder_requestAsynchronousAVAssetWithResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestAVAssetWithResultHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__PFVideoAVObjectBuilder_requestAsynchronousExportSessionWithExportPreset_resultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestExportSessionWithExportPreset:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __73__PFVideoAVObjectBuilder_requestAsynchronousPlayerItemWithResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestPlayerItemWithResultHandler:", *(_QWORD *)(a1 + 40));
}

- (PFSlowMotionTimeRangeMapper)playbackTimeRangeMapper
{
  return (PFSlowMotionTimeRangeMapper *)-[PFVideoAVObjectBuilder _getOrCreateTimeRangeMapperForExport:](self, "_getOrCreateTimeRangeMapperForExport:", 0);
}

- (id)_getOrCreateTimeRangeMapperForExport:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id *v6;
  id v7;
  AVAsset *videoAsset;
  double Seconds;
  double v10;
  int v11;
  int v12;
  PFVideoAdjustments *videoAdjustments;
  _OWORD v15[3];
  CMTime time;

  v3 = a3;
  v5 = 24;
  if (a3)
    v5 = 32;
  v6 = (id *)((char *)&self->super.isa + v5);
  v7 = *(id *)((char *)&self->super.isa + v5);
  if (!v7)
  {
    videoAsset = self->_videoAsset;
    if (videoAsset)
      -[AVAsset duration](videoAsset, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    -[PFVideoAdjustments slowMotionRate](self->_videoAdjustments, "slowMotionRate");
    v12 = v11;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
      -[PFVideoAdjustments slowMotionTimeRange](videoAdjustments, "slowMotionTimeRange");
    else
      memset(v15, 0, sizeof(v15));
    LODWORD(v10) = v12;
    +[PFSlowMotionUtilities timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:](PFSlowMotionUtilities, "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", v15, v3, Seconds, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v6, v7);
  }
  return v7;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampInRangeForExport:(SEL)a3
{
  __int128 v5;
  void *v6;
  uint64_t *v7;
  __int128 v8;
  $9E16F6706E08E1DCF37CEDFAE5F41851 *result;
  _QWORD v10[6];
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x5010000000;
  v16 = &unk_1A17D2676;
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v17 = *MEMORY[0x1E0CA2E40];
  v18 = v5;
  v19 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  -[PFVideoAVObjectBuilder _getOrCreateTimeRangeMapperForExport:](self, "_getOrCreateTimeRangeMapperForExport:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampInRangeForExport___block_invoke;
  v10[3] = &unk_1E45A3E80;
  v10[4] = v11;
  v10[5] = &v13;
  objc_msgSend(v6, "enumerateScaledRegionsUsingBlock:", v10);
  v7 = v14;
  v8 = *((_OWORD *)v14 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v14 + 2);
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v7 + 4);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return result;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOutRangeForExport:(SEL)a3
{
  __int128 v5;
  void *v6;
  uint64_t *v7;
  __int128 v8;
  $9E16F6706E08E1DCF37CEDFAE5F41851 *result;
  _QWORD v10[6];
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v13 = 0;
  v14 = &v13;
  v15 = 0x5010000000;
  v16 = &unk_1A17D2676;
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v17 = *MEMORY[0x1E0CA2E40];
  v18 = v5;
  v19 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  -[PFVideoAVObjectBuilder _getOrCreateTimeRangeMapperForExport:](self, "_getOrCreateTimeRangeMapperForExport:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampOutRangeForExport___block_invoke;
  v10[3] = &unk_1E45A3E80;
  v10[4] = v11;
  v10[5] = &v13;
  objc_msgSend(v6, "enumerateScaledRegionsUsingBlock:", v10);
  v7 = v14;
  v8 = *((_OWORD *)v14 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v14 + 2);
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v7 + 4);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4
{
  void *v7;
  Float64 Seconds;
  float v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  *retstr = *a4;
  -[PFVideoAVObjectBuilder _getOrCreateTimeRangeMapperForExport:](self, "_getOrCreateTimeRangeMapperForExport:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = *a4;
    Seconds = CMTimeGetSeconds((CMTime *)&v11);
    *(float *)&Seconds = Seconds;
    objc_msgSend(v7, "scaledTimeForOriginalTime:", Seconds);
    CMTimeMakeWithSeconds((CMTime *)&v11, v9, +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *retstr = v11;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4
{
  void *v7;
  Float64 Seconds;
  float v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  *retstr = *a4;
  -[PFVideoAVObjectBuilder _getOrCreateTimeRangeMapperForExport:](self, "_getOrCreateTimeRangeMapperForExport:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = *a4;
    Seconds = CMTimeGetSeconds((CMTime *)&v11);
    *(float *)&Seconds = Seconds;
    objc_msgSend(v7, "originalTimeForScaledTime:", Seconds);
    CMTimeMakeWithSeconds((CMTime *)&v11, v9, +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *retstr = v11;
  }

  return result;
}

CMTime *__70__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampOutRangeForExport___block_invoke(CMTime *result, double a2, double a3, double a4, float a5, float a6)
{
  uint64_t v6;
  CMTime *v9;
  CMTime v10;
  CMTime v11;

  v6 = *(_QWORD *)(*(_QWORD *)&result[1].timescale + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    v9 = result;
    *(_BYTE *)(v6 + 24) = 1;
    CMTimeMakeWithSeconds(&v11, a5, +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *(CMTime *)(*(_QWORD *)(v9[1].epoch + 8) + 32) = v11;
    result = CMTimeMakeWithSeconds(&v10, (float)(a6 - a5), +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *(CMTime *)(*(_QWORD *)(v9[1].epoch + 8) + 56) = v10;
  }
  return result;
}

CMTime *__69__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampInRangeForExport___block_invoke(CMTime *result, double a2, float a3, float a4)
{
  uint64_t v4;
  CMTime *v7;
  CMTime v8;
  CMTime v9;

  v4 = *(_QWORD *)(*(_QWORD *)&result[1].timescale + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    v7 = result;
    *(_BYTE *)(v4 + 24) = 1;
    CMTimeMakeWithSeconds(&v9, a3, +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *(CMTime *)(*(_QWORD *)(v7[1].epoch + 8) + 32) = v9;
    result = CMTimeMakeWithSeconds(&v8, (float)(a4 - a3), +[PFSlowMotionUtilities preferredTimeScale](PFSlowMotionUtilities, "preferredTimeScale"));
    *(CMTime *)(*(_QWORD *)(v7[1].epoch + 8) + 56) = v8;
  }
  return result;
}

@end
