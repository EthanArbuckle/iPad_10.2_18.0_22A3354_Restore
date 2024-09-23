@implementation PTAssetReader

+ (void)initialize
{
  +[PTSerialization registerSerializationClass:](PTSerialization, "registerSerializationClass:", objc_opt_class());
}

- (BOOL)isReadyForReading
{
  return self->assetReader != 0;
}

- (void)pushComposedFrame:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->composedFrames;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](self->composedFrames, "addObject:", v5);
  objc_sync_exit(v4);

}

- (id)popComposedFrame
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->composedFrames;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->composedFrames, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->composedFrames, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->composedFrames, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)updateFormatPropertiesFromAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  opaqueCMFormatDescription *v11;
  void *v12;
  NSString *v13;
  NSString *YCbCrMatrix;
  NSString *v15;
  NSString *colorPrimaries;
  NSString *v17;
  NSString *transferFunction;
  NSString *v19;
  NSString *v20;
  BOOL v21;
  CMTime v23;

  loadTracksWithMediaType(a3, (void *)*MEMORY[0x1E0C8A808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v5, "estimatedDataRate");
  self->_estimatedDataRate = (unint64_t)v7;
  objc_msgSend(v6, "nominalFrameRate");
  if (v8 == 0.0)
  {
    CMTimeMake(&v23, 1, 30);
  }
  else
  {
    objc_msgSend(v6, "nominalFrameRate");
    CMTimeMakeWithSeconds(&v23, 1.0 / v9, 90000);
  }
  self->_frameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v23;
  objc_msgSend(v6, "formatDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (opaqueCMFormatDescription *)objc_msgSend(v10, "firstObject");

  if (v11)
  {
    self->_formatDescription = v11;
    CMFormatDescriptionGetExtensions(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    YCbCrMatrix = self->_YCbCrMatrix;
    self->_YCbCrMatrix = v13;

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    colorPrimaries = self->_colorPrimaries;
    self->_colorPrimaries = v15;

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    transferFunction = self->_transferFunction;
    self->_transferFunction = v17;

    if (!self->_transferFunction)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E48]);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_transferFunction;
      self->_transferFunction = v19;

    }
    v21 = 1;
  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  return v21;
}

- (PTAssetReader)initWithAsset:(id)a3
{
  id v5;
  PTAssetReader *v6;
  PTAssetReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAssetReader;
  v6 = -[PTAssetReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    if (-[PTAssetReader updateFormatPropertiesFromAsset:](v7, "updateFormatPropertiesFromAsset:", v5))
    {
      -[PTAssetReader stopReadingFrames](v7, "stopReadingFrames");
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)startReadingFrames:(unint64_t)a3
{
  uint64_t v3;

  v3 = 0;
  -[PTAssetReader startReadingFrames:error:](self, "startReadingFrames:error:", a3, &v3);
}

- (BOOL)startReadingFrames:(unint64_t)a3 error:(id *)a4
{
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[PTAssetReader startReadingFrames:atTime:error:](self, "startReadingFrames:atTime:error:", a3, &v5, a4);
}

- (BOOL)startReadingFrames:(unint64_t)a3 atTime:(id *)a4 error:(id *)a5
{
  char v7;
  PTAssetReader *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AVAssetReader *assetReader;
  AVAssetReader *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  const opaqueCMFormatDescription *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  BOOL v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const __CFAllocator *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  AVAssetReaderOutputMetadataAdaptor *metadataAdaptor;
  uint64_t v47;
  NSMutableArray *composedFrames;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  id v56;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v57;
  uint64_t v58;
  uint64_t v59;
  PTAssetReaderCompositionInstruction *v60;
  NSObject *v61;
  const __CFAllocator *v62;
  __CFString *v63;
  __CFString *v64;
  uint64_t v65;
  AVMutableVideoComposition *videoComposition;
  void *v67;
  void *v68;
  uint64_t v69;
  AVAssetReaderVideoCompositionOutput *videoCompositionOutput;
  AVAssetReader *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v80;
  PTAssetReader *v81;
  void *v82;
  CMTimeRange v83;
  CMTimeRange v84;
  __int128 v85;
  int64_t epoch;
  CMTimeRange v87;
  CMTimeRange v88;
  CMTimeRange v89;
  CMTimeRange v90;
  CMTimeRange v91;
  CMTimeRange v92;
  CMTimeRange v93;
  CMTimeRange v94;
  CMTimeRange range2;
  CMTimeRange range1;
  _BYTE duration[32];
  __int128 v98;
  __int128 v99;
  _QWORD v100[2];
  PTAssetReaderCompositionInstruction *v101;
  CMTimeRange range;
  uint64_t v103;

  v7 = a3;
  v8 = self;
  v103 = *MEMORY[0x1E0C80C00];
  -[PTAssetReader stopReadingFrames](self, "stopReadingFrames");
  v9 = (void *)MEMORY[0x1E0C8AFD0];
  -[PTAssetReader asset](v8, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetReaderWithAsset:error:", v10, a5);
  v11 = objc_claimAutoreleasedReturnValue();
  assetReader = v8->assetReader;
  v8->assetReader = (AVAssetReader *)v11;

  v13 = v8->assetReader;
  if (v13)
  {
    -[AVAssetReader asset](v13, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    loadTracksWithMediaType(v14, (void *)*MEMORY[0x1E0C8A808]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    memset(duration, 0, sizeof(duration));
    v98 = 0u;
    v99 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
    if (v16)
    {
      v17 = v16;
      v18 = a5;
      v19 = v7;
      v20 = **(_QWORD **)&duration[16];
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (**(_QWORD **)&duration[16] != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*(_QWORD *)&duration[8] + 8 * i);
          if ((objc_msgSend(v22, "isEnabled") & 1) != 0)
          {
            v7 = v19;
            a5 = v18;
            v23 = v22;
            goto LABEL_13;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
        if (v17)
          continue;
        break;
      }
      v7 = v19;
      a5 = v18;
    }
    v23 = 0;
LABEL_13:

    if (v23)
    {
      if ((v7 & 1) != 0)
      {
        v80 = a4;
        v81 = v8;
        v82 = v23;
        -[AVAssetReader asset](v8->assetReader, "asset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        loadTracksWithMediaType(v24, (void *)*MEMORY[0x1E0C8A7D0]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        memset(duration, 0, sizeof(duration));
        v98 = 0u;
        v99 = 0u;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
        if (v26)
        {
          v27 = v26;
          v78 = v24;
          v79 = v7;
          v28 = **(_QWORD **)&duration[16];
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (**(_QWORD **)&duration[16] != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*(_QWORD *)&duration[8] + 8 * j);
              if (objc_msgSend(v30, "isEnabled"))
              {
                objc_msgSend(v30, "formatDescriptions");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (const opaqueCMFormatDescription *)objc_msgSend(v31, "firstObject");

                if (v32)
                {
                  CMMetadataFormatDescriptionGetIdentifiers(v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(CFSTR("mdta/"), "stringByAppendingString:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(CFSTR("mdta/"), "stringByAppendingString:", CFSTR("com.apple.quicktime.cinematography-dictionary"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v33, "containsObject:", v34) & 1) != 0
                    || (objc_msgSend(v33, "containsObject:", v35) & 1) != 0)
                  {
                    v36 = v30;

                    goto LABEL_31;
                  }

                }
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
            if (v27)
              continue;
            break;
          }
          v36 = 0;
LABEL_31:
          v7 = v79;
          v24 = v78;
        }
        else
        {
          v36 = 0;
        }

        v8 = v81;
        if (!v36)
        {
          v75 = (void *)MEMORY[0x1E0CB3940];
          -[AVAssetReader asset](v81->assetReader, "asset");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringWithFormat:", CFSTR("Couldn't find metadata track in asset: %@"), v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          AssetReaderError(v77);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v37 = 0;
          v23 = v82;
          goto LABEL_65;
        }
        v23 = v82;
        objc_msgSend(v82, "timeRange");
        objc_msgSend(v36, "timeRange");
        if (!CMTimeRangeEqual(&range1, &range2))
        {
          _PTLogSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v36, "timeRange");
            v41 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            range = v94;
            v42 = (__CFString *)CMTimeRangeCopyDescription(v41, &range);
            objc_msgSend(v82, "timeRange");
            range = v93;
            v43 = (__CFString *)CMTimeRangeCopyDescription(v41, &range);
            LODWORD(range.start.value) = 138412546;
            *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v42;
            LOWORD(range.start.flags) = 2112;
            *(_QWORD *)((char *)&range.start.flags + 2) = v43;
            _os_log_impl(&dword_1C9281000, v40, OS_LOG_TYPE_INFO, "WARNING: meta timeRange (%@) not equal to vide timeRange (%@)", (uint8_t *)&range, 0x16u);

          }
        }
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v36, 0);
        v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v44);
        metadataAdaptor = v81->metadataAdaptor;
        v81->metadataAdaptor = (AVAssetReaderOutputMetadataAdaptor *)v45;

        -[AVAssetReader addOutput:](v81->assetReader, "addOutput:", v44);
        a4 = v80;
      }
      if ((v7 & 6) == 0)
      {
LABEL_57:
        if ((a4->var2 & 1) != 0)
        {
          *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
          range.start.epoch = a4->var3;
          *(_OWORD *)duration = *MEMORY[0x1E0CA2E30];
          *(_QWORD *)&duration[16] = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
          CMTimeRangeMake(&v84, &range.start, (CMTime *)duration);
          v71 = v8->assetReader;
          v83 = v84;
          -[AVAssetReader setTimeRange:](v71, "setTimeRange:", &v83);
        }
        if (-[AVAssetReader startReading](v8->assetReader, "startReading"))
        {
          v37 = 1;
        }
        else
        {
          -[AVAssetReader error](v8->assetReader, "error");
          v37 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_65;
      }
      v47 = objc_opt_new();
      composedFrames = v8->composedFrames;
      v8->composedFrames = (NSMutableArray *)v47;

      -[AVAssetReader asset](v8->assetReader, "asset");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      loadTracksWithMediaType(v49, (void *)*MEMORY[0x1E0C8A7A8]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      memset(duration, 0, sizeof(duration));
      v98 = 0u;
      v99 = 0u;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
      if (v51)
      {
        v52 = v51;
        v53 = **(_QWORD **)&duration[16];
        while (2)
        {
          for (k = 0; k != v52; ++k)
          {
            if (**(_QWORD **)&duration[16] != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*(_QWORD *)&duration[8] + 8 * k);
            if ((objc_msgSend(v55, "isEnabled") & 1) != 0)
            {
              v56 = v55;
              goto LABEL_50;
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", duration, &range, 16);
          if (v52)
            continue;
          break;
        }
      }
      v56 = 0;
LABEL_50:

      if (v56)
      {
        v57 = a4;
        v58 = objc_msgSend(v23, "trackID");
        v59 = objc_msgSend(v56, "trackID");
        v60 = objc_alloc_init(PTAssetReaderCompositionInstruction);
        *(_OWORD *)&range.start.value = *MEMORY[0x1E0CA2E68];
        range.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        *(_OWORD *)duration = *MEMORY[0x1E0CA2E30];
        *(_QWORD *)&duration[16] = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
        CMTimeRangeMake(&v92, &range.start, (CMTime *)duration);
        v91 = v92;
        -[PTAssetReaderCompositionInstruction setTimeRange:](v60, "setTimeRange:", &v91);
        -[PTAssetReaderCompositionInstruction setVideTrackID:](v60, "setVideTrackID:", v58);
        -[PTAssetReaderCompositionInstruction setAuxvTrackID:](v60, "setAuxvTrackID:", v59);
        -[PTAssetReaderCompositionInstruction setAssetReader:](v60, "setAssetReader:", v8);
        objc_msgSend(v23, "timeRange");
        objc_msgSend(v56, "timeRange");
        if (!CMTimeRangeEqual(&v90, &v89))
        {
          _PTLogSystem();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v56, "timeRange");
            v62 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            range = v88;
            v63 = (__CFString *)CMTimeRangeCopyDescription(v62, &range);
            objc_msgSend(v23, "timeRange");
            range = v87;
            v64 = (__CFString *)CMTimeRangeCopyDescription(v62, &range);
            LODWORD(range.start.value) = 138412546;
            *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v63;
            LOWORD(range.start.flags) = 2112;
            *(_QWORD *)((char *)&range.start.flags + 2) = v64;
            _os_log_impl(&dword_1C9281000, v61, OS_LOG_TYPE_INFO, "WARNING: auxv timeRange (%@) not equal to vide timeRange (%@)", (uint8_t *)&range, 0x16u);

          }
        }
        objc_msgSend(MEMORY[0x1E0C8B288], "videoComposition");
        v65 = objc_claimAutoreleasedReturnValue();
        videoComposition = v8->videoComposition;
        v8->videoComposition = (AVMutableVideoComposition *)v65;

        -[AVMutableVideoComposition setCustomVideoCompositorClass:](v8->videoComposition, "setCustomVideoCompositorClass:", objc_opt_class());
        -[AVMutableVideoComposition setSourceTrackIDForFrameTiming:](v8->videoComposition, "setSourceTrackIDForFrameTiming:", v58);
        objc_msgSend(v23, "naturalSize");
        -[AVMutableVideoComposition setRenderSize:](v8->videoComposition, "setRenderSize:");
        v85 = *(_OWORD *)&v8->_frameDuration.value;
        epoch = v8->_frameDuration.epoch;
        -[AVMutableVideoComposition setFrameDuration:](v8->videoComposition, "setFrameDuration:", &v85);
        v101 = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVMutableVideoComposition setInstructions:](v8->videoComposition, "setInstructions:", v67);

        v100[0] = v23;
        v100[1] = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B008]), "initWithVideoTracks:videoSettings:", v68, 0);
        videoCompositionOutput = v8->videoCompositionOutput;
        v8->videoCompositionOutput = (AVAssetReaderVideoCompositionOutput *)v69;

        -[AVAssetReaderVideoCompositionOutput setVideoComposition:](v8->videoCompositionOutput, "setVideoComposition:", v8->videoComposition);
        -[AVAssetReaderVideoCompositionOutput setAlwaysCopiesSampleData:](v8->videoCompositionOutput, "setAlwaysCopiesSampleData:", 0);
        if (-[AVAssetReader canAddOutput:](v8->assetReader, "canAddOutput:", v8->videoCompositionOutput))
        {
          -[AVAssetReader addOutput:](v8->assetReader, "addOutput:", v8->videoCompositionOutput);

          a4 = v57;
          goto LABEL_57;
        }
        AssetReaderError(CFSTR("Cannot add videoCompositionOutput to assetReader"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_64;
      }
      v72 = (void *)MEMORY[0x1E0CB3940];
      -[AVAssetReader asset](v8->assetReader, "asset");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringWithFormat:", CFSTR("Couldn't find disparity track in asset: %@"), v39);
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      -[AVAssetReader asset](v8->assetReader, "asset");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("Couldn't find video track in asset: %@"), v39);
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    AssetReaderError(v73);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_64:
    v37 = 0;
LABEL_65:

    return v37;
  }
  return 0;
}

- (void)stopReadingFrames
{
  AVAssetReader *assetReader;
  AVAssetReader *v4;
  AVAssetReaderOutputMetadataAdaptor *metadataAdaptor;
  AVMutableVideoComposition *videoComposition;
  AVAssetReaderVideoCompositionOutput *videoCompositionOutput;
  NSMutableArray *composedFrames;

  assetReader = self->assetReader;
  if (assetReader)
  {
    -[AVAssetReader cancelReading](assetReader, "cancelReading");
    v4 = self->assetReader;
    self->assetReader = 0;

  }
  metadataAdaptor = self->metadataAdaptor;
  self->metadataAdaptor = 0;

  videoComposition = self->videoComposition;
  self->videoComposition = 0;

  videoCompositionOutput = self->videoCompositionOutput;
  self->videoCompositionOutput = 0;

  composedFrames = self->composedFrames;
  self->composedFrames = 0;

  self->lastDecodedFrameIndex = -1;
}

- (unint64_t)estimatedFrameCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double Seconds;
  float v9;
  double v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CMTime time;

  -[PTAssetReader asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  loadTracksWithMediaType(v3, (void *)*MEMORY[0x1E0C8A808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  -[PTAssetReader asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v5, "nominalFrameRate");
  v10 = Seconds * v9;

  v11 = vcvtad_u64_f64(v10);
  if (!v11)
  {
LABEL_6:
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTAssetReader estimatedFrameCount].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (unint64_t)frameCount
{
  unint64_t result;
  id v4;

  result = self->_cachedAccurateFrameCount;
  if (!result)
  {
    -[PTAssetReader startReadingFrames:](self, "startReadingFrames:", 4);
    while (1)
    {
      v4 = -[PTAssetReader nextFrame](self, "nextFrame");

      if (!v4)
        break;
      ++self->_cachedAccurateFrameCount;
    }
    -[PTAssetReader stopReadingFrames](self, "stopReadingFrames");
    return self->_cachedAccurateFrameCount;
  }
  return result;
}

- (PTGlobalCinematographyMetadata)globalCinematographyMetadata
{
  PTGlobalCinematographyMetadata *globalCinematographyMetadata;

  globalCinematographyMetadata = self->_globalCinematographyMetadata;
  if (!globalCinematographyMetadata)
  {
    -[PTAssetReader _decodeGlobalMetadata](self, "_decodeGlobalMetadata");
    globalCinematographyMetadata = self->_globalCinematographyMetadata;
  }
  return globalCinematographyMetadata;
}

- (PTGlobalRenderingMetadata)globalRenderingMetadata
{
  PTGlobalRenderingMetadata *globalRenderingMetadata;

  globalRenderingMetadata = self->_globalRenderingMetadata;
  if (!globalRenderingMetadata)
  {
    -[PTAssetReader _decodeGlobalMetadata](self, "_decodeGlobalMetadata");
    globalRenderingMetadata = self->_globalRenderingMetadata;
  }
  return globalRenderingMetadata;
}

- (PTGlobalStabilizationMetadata)globalStabilizationMetadata
{
  PTGlobalStabilizationMetadata *globalStabilizationMetadata;

  globalStabilizationMetadata = self->_globalStabilizationMetadata;
  if (!globalStabilizationMetadata)
  {
    -[PTAssetReader _decodeGlobalMetadata](self, "_decodeGlobalMetadata");
    globalStabilizationMetadata = self->_globalStabilizationMetadata;
  }
  return globalStabilizationMetadata;
}

- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata
{
  PTGlobalVideoHeaderMetadata *globalVideoHeaderMetadata;

  globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  if (!globalVideoHeaderMetadata)
  {
    -[PTAssetReader _decodeGlobalMetadata](self, "_decodeGlobalMetadata");
    globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  }
  return globalVideoHeaderMetadata;
}

- (void)_decodeGlobalMetadata
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, v0, v1, "Failed to deserialize global rendering metadata: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_decodeMetadata:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  NSObject *v51;
  _QWORD v52[5];
  _BYTE v53[128];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v54[0] = CFSTR("com.apple.quicktime.camera-dictionary");
  v54[1] = CFSTR("com.apple.quicktime.cinematography-dictionary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v45;
    v42 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v15 = objc_opt_isKindOfClass();

            if ((v15 & 1) != 0)
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", v9);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = objc_opt_class();
              v52[1] = objc_opt_class();
              v52[2] = objc_opt_class();
              v52[3] = objc_opt_class();
              v52[4] = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)MEMORY[0x1E0CB3710];
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 0;
              objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v19, v16, &v43);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v43;

              if (v21)
              {
                _PTLogSystem();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v49 = v9;
                  v50 = 2112;
                  v51 = v21;
                  _os_log_error_impl(&dword_1C9281000, v22, OS_LOG_TYPE_ERROR, "ERROR: Failed to decode metadata dictionary for %@. Decoder failed: %@", buf, 0x16u);
                }

              }
              else
              {
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v9);
              }

              v4 = v42;
            }
            else
            {
              _PTLogSystem();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v9;
                _os_log_error_impl(&dword_1C9281000, v21, OS_LOG_TYPE_ERROR, "ERROR: Failed to decode metadata dictionary for %@. Value is not NSData.", buf, 0xCu);
              }
            }

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.rendering"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.rendering"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetReader globalRenderingMetadata](self, "globalRenderingMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "majorVersion");
    -[PTAssetReader globalRenderingMetadata](self, "globalRenderingMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTimedRenderingMetadata objectFromData:withMajorVersion:minorVersion:](PTTimedRenderingMetadata, "objectFromData:withMajorVersion:minorVersion:", v24, v26, objc_msgSend(v27, "minorVersion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("com.apple.quicktime.cinematic-video.rendering"));
    }
    else
    {
      _PTLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[PTAssetReader _decodeMetadata:].cold.3(v3, (uint64_t)CFSTR("com.apple.quicktime.cinematic-video.rendering"), v29);

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.stabilization"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.stabilization"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetReader globalStabilizationMetadata](self, "globalStabilizationMetadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "majorVersion");
    -[PTAssetReader globalStabilizationMetadata](self, "globalStabilizationMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTimedStabilizationMetadata objectFromData:withMajorVersion:minorVersion:](PTTimedStabilizationMetadata, "objectFromData:withMajorVersion:minorVersion:", v31, v33, objc_msgSend(v34, "minorVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("com.apple.quicktime.cinematic-video.stabilization"));
    }
    else
    {
      _PTLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[PTAssetReader _decodeMetadata:].cold.2(v3, (uint64_t)CFSTR("com.apple.quicktime.cinematic-video.stabilization"), v36);

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTSerialization objectFromData:error:](PTSerialization, "objectFromData:error:", v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
    }
    else
    {
      _PTLogSystem();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[PTAssetReader _decodeMetadata:].cold.1(v3, (uint64_t)CFSTR("com.apple.quicktime.cinematic-video.cinematography"), v40);

    }
  }

}

- (id)nextFrame
{
  PTAssetReader *v2;
  void *v3;
  id v4;
  AVAssetReaderOutputMetadataAdaptor *metadataAdaptor;
  void *v6;
  void *v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  AVAssetReaderVideoCompositionOutput *videoCompositionOutput;
  const void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v31;
  PTAssetReader *v32;
  void *v33;
  void *v34;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  _OWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  CMTimeValue v55;
  CMTimeScale v56;
  CMTimeFlags v57;
  CMTimeEpoch v58;
  CMTime time1;
  CMTime time2;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v68;

  v2 = self;
  v68 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA3ACDC](self, a2);
  ++v2->lastDecodedFrameIndex;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setIndex:", v2->lastDecodedFrameIndex);
  metadataAdaptor = v2->metadataAdaptor;
  if (metadataAdaptor)
  {
    -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](metadataAdaptor, "nextTimedMetadataGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v32 = v2;
      v33 = v4;
      v34 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      value = *MEMORY[0x1E0CA2E18];
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v31 = v6;
      objc_msgSend(v6, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v62 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            if ((flags & 1) != 0)
            {
              if (v15)
                objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "time");
              else
                memset(&time1, 0, sizeof(time1));
              time2.value = value;
              time2.timescale = timescale;
              time2.flags = flags;
              time2.epoch = epoch;
              if (CMTimeCompare(&time1, &time2))
                NSLog(CFSTR("WARNING: Metadata items did not all have the same timestamp!"));
            }
            else
            {
              if (v15)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "time");
                flags = time2.flags;
                epoch = time2.epoch;
              }
              else
              {
                epoch = 0;
                flags = 0;
                memset(&time2, 0, sizeof(time2));
              }
              value = time2.value;
              timescale = time2.timescale;
            }
            objc_msgSend(v15, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "key");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        }
        while (v12);
      }

      v2 = v32;
      -[PTAssetReader _decodeMetadata:](v32, "_decodeMetadata:", v7);
      v4 = v33;
      objc_msgSend(v33, "setMetadata:", v7);
      v55 = value;
      v56 = timescale;
      v57 = flags;
      v58 = epoch;
      objc_msgSend(v33, "setMetadataTime:", &v55);
      if ((flags & 1) == 0)
        NSLog(CFSTR("WARNING: Metadata sample with invalid time added!"));

      v3 = v34;
      v6 = v31;
    }
    else if (!v2->videoCompositionOutput)
    {

      v4 = 0;
    }

  }
  videoCompositionOutput = v2->videoCompositionOutput;
  if (!videoCompositionOutput)
    goto LABEL_46;
  v19 = (const void *)-[AVAssetReaderVideoCompositionOutput copyNextSampleBuffer](videoCompositionOutput, "copyNextSampleBuffer");
  if (!v19)
  {
    v21 = v4;
    v4 = 0;
LABEL_45:

LABEL_46:
    v4 = v4;
    v26 = v4;
    goto LABEL_47;
  }
  CFRelease(v19);
  -[PTAssetReader popComposedFrame](v2, "popComposedFrame");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v20, "time");
    v51 = v53;
    v52 = v54;
    objc_msgSend(v4, "setTime:", &v51);
    objc_msgSend(v4, "setColorBuffer:", CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v21, "colorBuffer")));
    objc_msgSend(v21, "time");
    v47 = v49;
    v48 = v50;
    objc_msgSend(v4, "setColorBufferTime:", &v47);
    -[AVAssetReaderVideoCompositionOutput videoTracks](v2->videoCompositionOutput, "videoTracks");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "preferredTransform");
    }
    else
    {
      v45 = 0u;
      v46 = 0u;
      v44 = 0u;
    }
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    objc_msgSend(v4, "setColorBufferPreferredTransform:", v43);

    if (objc_msgSend(v21, "auxBuffer"))
    {
      if (CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v21, "auxBuffer")) == 1751411059)
      {
        objc_msgSend(v4, "setDisparityBuffer:", CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v21, "auxBuffer")));
        objc_msgSend(v21, "time");
        v39 = v41;
        v40 = v42;
        objc_msgSend(v4, "setDisparityBufferTime:", &v39);
        -[AVAssetReaderVideoCompositionOutput videoTracks](v2->videoCompositionOutput, "videoTracks");
        v27 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(v28, "preferredTransform");
        }
        else
        {
          v37 = 0u;
          v38 = 0u;
          v36 = 0u;
        }
        v35[0] = v36;
        v35[1] = v37;
        v35[2] = v38;
        objc_msgSend(v4, "setDisparityBufferPreferredTransform:", v35);

      }
      else
      {
        _PTLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[PTAssetReader nextFrame].cold.2(v4, v27);
      }

    }
    goto LABEL_45;
  }
  _PTLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[PTAssetReader nextFrame].cold.1(v4, v25);

  v26 = 0;
LABEL_47:

  objc_autoreleasePoolPop(v3);
  return v26;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (unint64_t)estimatedDataRate
{
  return self->_estimatedDataRate;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (void)setColorPrimaries:(id)a3
{
  objc_storeStrong((id *)&self->_colorPrimaries, a3);
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

- (void)setTransferFunction:(id)a3
{
  objc_storeStrong((id *)&self->_transferFunction, a3);
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (void)setYCbCrMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_globalVideoHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_globalStabilizationMetadata, 0);
  objc_storeStrong((id *)&self->_globalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_globalCinematographyMetadata, 0);
  objc_storeStrong((id *)&self->composedFrames, 0);
  objc_storeStrong((id *)&self->videoCompositionOutput, 0);
  objc_storeStrong((id *)&self->videoComposition, 0);
  objc_storeStrong((id *)&self->metadataAdaptor, 0);
  objc_storeStrong((id *)&self->assetReader, 0);
}

- (void)estimatedFrameCount
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "ERROR: couldn't calculate frame count", a5, a6, a7, a8, 0);
}

- (void)_decodeMetadata:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a3, v5, "Failed to deserialize cinematography metadata: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_decodeMetadata:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a3, v5, "Failed to deserialize timed stabilization metadata: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_decodeMetadata:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a3, v5, "Failed to deserialize timed rendering metadata: %@", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)nextFrame
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "index");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v3, "Failed to decode auxv buffer for frame %lu. Format was not 'kCVPixelFormatType_DisparityFloat16'", v4);
  OUTLINED_FUNCTION_1_1();
}

@end
