@implementation _ISPlayerItemChefOperation

- (_ISPlayerItemChefOperation)initWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeAudio:(BOOL)a6 includeVideo:(BOOL)a7 resultHandler:(id)a8
{
  id v15;
  id v16;
  _ISPlayerItemChefOperation *v17;
  _ISPlayerItemChefOperation *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  id resultHandler;
  dispatch_queue_t v24;
  OS_dispatch_queue *workQueue;
  objc_super v27;

  v15 = a3;
  v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)_ISPlayerItemChefOperation;
  v17 = -[_ISPlayerItemChefOperation init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    v20 = *(_OWORD *)&a4->var0.var3;
    v19 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v18->_trimmedTimeRange.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v18->_trimmedTimeRange.start.epoch = v20;
    *(_OWORD *)&v18->_trimmedTimeRange.duration.timescale = v19;
    v21 = *(_OWORD *)&a5->var0;
    v18->_photoTime.epoch = a5->var3;
    *(_OWORD *)&v18->_photoTime.value = v21;
    v18->_includeAudio = a6;
    v18->_includeVideo = a7;
    v22 = objc_msgSend(v16, "copy");
    resultHandler = v18->_resultHandler;
    v18->_resultHandler = (id)v22;

    v24 = dispatch_queue_create("com.apple.playeritemchef", 0);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v24;

  }
  return v18;
}

- (void)main
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[_ISPlayerItemChefOperation asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___ISPlayerItemChefOperation_main__block_invoke;
  v4[3] = &unk_1E9453BF8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E945FF90, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)_handleValuesDidLoad
{
  NSObject *workQueue;
  _QWORD block[5];

  if ((-[_ISPlayerItemChefOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___ISPlayerItemChefOperation__handleValuesDidLoad__block_invoke;
    block[3] = &unk_1E9453F48;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)_preparePlayerItem
{
  void *v3;
  _BOOL4 v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  __int128 *v8;
  NSObject *v9;
  void (*v10)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, id);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CMTimeFlags flags;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeEpoch epoch;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CMTimeEpoch v37;
  uint64_t j;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void (*v45)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, _QWORD);
  void *v46;
  NSObject *v47;
  void (*v48)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, id);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void (*v62)(_QWORD *, uint64_t, void *, CMTimeRange *, id);
  void *v63;
  void *v64;
  id v65;
  CMTimeEpoch v66;
  __int128 v67;
  id v68;
  id v69;
  _QWORD *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CMTimeRange v77;
  CMTimeRange v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CMTime rhs;
  CMTime time1;
  CMTime time2;
  _QWORD v86[4];
  id v87;
  id v88;
  CMTimeRange range;
  CMTimeRange otherRange;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  _BYTE v96[128];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  CMTimeRange v100;
  _BYTE v101[128];
  CMTimeRange buf;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  -[_ISPlayerItemChefOperation asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ISPlayerItemChefOperation includeAudio](self, "includeAudio");
  -[_ISPlayerItemChefOperation resultHandler](self, "resultHandler");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v95 = 0;
  v6 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("tracks"), &v95);
  v7 = v95;
  v8 = (__int128 *)MEMORY[0x1E0CA2E18];
  if (v6 == 3)
  {
    ISGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.start.value) = 134218242;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = 3;
      LOWORD(buf.start.flags) = 2112;
      *(_QWORD *)((char *)&buf.start.flags + 2) = v7;
      _os_log_error_impl(&dword_1D2DCA000, v9, OS_LOG_TYPE_ERROR, "Property loading status:%ld error:%@", (uint8_t *)&buf, 0x16u);
    }

    v10 = (void (*)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, id))v5[2];
    *(_OWORD *)&buf.start.value = *v8;
    buf.start.epoch = *((_QWORD *)v8 + 2);
    v10(v5, 0, 0, &buf, v7);
  }
  else
  {
    v11 = *MEMORY[0x1E0C8A808];
    v71 = v3;
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v70 = v5;
    if (v13)
      objc_msgSend(v13, "timeRange");
    else
      memset(&buf, 0, sizeof(buf));

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v92 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (v20)
            objc_msgSend(v20, "timeRange");
          else
            memset(&otherRange, 0, sizeof(otherRange));
          range = buf;
          CMTimeRangeGetUnion(&v100, &range, &otherRange);
          buf = v100;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v17);
    }

    v21 = objc_alloc_init(MEMORY[0x1E0C8B268]);
    v88 = v7;
    v100 = buf;
    v67 = *v8;
    *(_OWORD *)&range.start.value = *v8;
    v66 = *((_QWORD *)v8 + 2);
    range.start.epoch = v66;
    v3 = v71;
    v22 = objc_msgSend(MEMORY[0x1E0D75130], "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", &v100, v71, &range, v21, &v88);
    v69 = v88;

    objc_msgSend(v21, "tracksWithMediaType:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke;
    v86[3] = &unk_1E9453C20;
    v68 = v15;
    v87 = v68;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v86);

    if ((v22 & 1) != 0)
    {
      v24 = (void *)MEMORY[0x1E0C8B300];
      v65 = v21;
      v25 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v24, "playerItemWithAsset:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v27) = 2139095039;
      objc_msgSend(v26, "setSpeedThresholdForIFrameOnlyPlayback:", v27);
      objc_msgSend(v26, "setVideoApertureMode:", *MEMORY[0x1E0C8AE18]);
      if (v4)
      {
        flags = buf.duration.flags;
        if ((buf.duration.flags & 0x1D) == 1)
        {
          value = buf.duration.value;
          if (buf.duration.value >= 1)
          {
            v63 = v26;
            timescale = buf.duration.timescale;
            epoch = buf.duration.epoch;
            v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            memset(&v100, 0, 24);
            CMTimeMakeWithSeconds(&v100.start, 0.3, 600);
            range.start.value = value;
            range.start.timescale = timescale;
            range.start.flags = flags;
            range.start.epoch = epoch;
            CMTimeMultiplyByRatio(&time2, &range.start, 1, 2);
            time1 = v100.start;
            CMTimeMinimum(&range.start, &time1, &time2);
            v100.start.epoch = range.start.epoch;
            *(_OWORD *)&v100.start.value = *(_OWORD *)&range.start.value;
            memset(&range, 0, 24);
            time1.value = value;
            time1.timescale = timescale;
            time1.flags = flags;
            time1.epoch = epoch;
            rhs = v100.start;
            CMTimeSubtract(&range.start, &time1, &rhs);
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v71);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v80;
              v72 = *MEMORY[0x1E0CA2E68];
              v37 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
              do
              {
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v80 != v36)
                    objc_enumerationMutation(v33);
                  objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_OWORD *)&time1.value = v72;
                  time1.epoch = v37;
                  rhs = v100.start;
                  CMTimeRangeMake(&v78, &time1, &rhs);
                  LODWORD(v40) = 0;
                  LODWORD(v41) = 1.0;
                  objc_msgSend(v39, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v78, v40, v41);
                  time1 = range.start;
                  rhs = v100.start;
                  CMTimeRangeMake(&v77, &time1, &rhs);
                  LODWORD(v42) = 1.0;
                  LODWORD(v43) = 0;
                  objc_msgSend(v39, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v77, v42, v43);
                  objc_msgSend(v32, "addObject:", v39);

                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
              }
              while (v35);
            }

            v44 = objc_alloc_init(MEMORY[0x1E0C8B258]);
            objc_msgSend(v44, "setInputParameters:", v32);
            objc_msgSend(v63, "setAudioMix:", v44);

            v26 = v63;
            v3 = v71;
          }
        }
      }
      if (-[_ISPlayerItemChefOperation isCancelled](self, "isCancelled"))
      {
        v5 = v70;
        v45 = (void (*)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, _QWORD))v70[2];
        *(_OWORD *)&v100.start.value = v67;
        v100.start.epoch = v66;
        v45(v70, 0, 0, &v100, 0);
        v21 = v65;
        v46 = v68;
        v7 = v69;
      }
      else
      {
        v49 = *MEMORY[0x1E0C9AE50];
        v50 = *MEMORY[0x1E0CC54E0];
        v97[0] = *MEMORY[0x1E0CC54E8];
        v97[1] = v50;
        v51 = *MEMORY[0x1E0CC54F0];
        v98[0] = v49;
        v98[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v64 = v26;
        objc_msgSend(v26, "tracks");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v74 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
              objc_msgSend(v58, "assetTrack");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "mediaType");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "isEqualToString:", v11);

              if (v61)
                objc_msgSend(v58, "setVideoEnhancementFilterOptions:", v52);
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
          }
          while (v55);
        }

        if (_preparePlayerItem_onceToken != -1)
          dispatch_once(&_preparePlayerItem_onceToken, &__block_literal_global_57);
        v5 = v70;
        v3 = v71;
        v26 = v64;
        v21 = v65;
        v46 = v68;
        v7 = v69;
        objc_msgSend(v64, "setImageQueueInterpolationCurve:", _preparePlayerItem_InterpolationCurveControlPoints);
        memset(&v100, 0, 24);
        if (v71)
          objc_msgSend(v71, "duration");
        if (v70)
        {
          v62 = (void (*)(_QWORD *, uint64_t, void *, CMTimeRange *, id))v70[2];
          *(_OWORD *)&range.start.value = *(_OWORD *)&v100.start.value;
          range.start.epoch = v100.start.epoch;
          v62(v70, 1, v64, &range, v69);
        }

      }
    }
    else
    {
      ISGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      v7 = v69;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v100.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v100.start.value + 4) = (CMTimeValue)v69;
        _os_log_error_impl(&dword_1D2DCA000, v47, OS_LOG_TYPE_ERROR, "Error inserting asset contents into composition: %@", (uint8_t *)&v100, 0xCu);
      }

      v5 = v70;
      v48 = (void (*)(_QWORD *, _QWORD, _QWORD, CMTimeRange *, id))v70[2];
      *(_OWORD *)&v100.start.value = v67;
      v100.start.epoch = v66;
      v48(v70, 0, 0, &v100, v69);
      v46 = v68;
    }

  }
}

- (AVAsset)asset
{
  return self->_asset;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimmedTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var0.var0;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 280);
  return self;
}

- (BOOL)includeVideo
{
  return self->_includeVideo;
}

- (BOOL)includeAudio
{
  return self->_includeAudio;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
