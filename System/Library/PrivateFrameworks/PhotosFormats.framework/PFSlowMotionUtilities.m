@implementation PFSlowMotionUtilities

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_7171);
  return (id)sharedConfiguration_configuration;
}

+ (int)preferredTimeScale
{
  return 600;
}

+ (NSArray)slowMotionSourceAssetPropertyKeys
{
  return (NSArray *)&unk_1E45CB300;
}

+ (id)assetFromVideoAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outAudioMix:(id *)a7 outTimeRangeMapper:(id *)a8
{
  _BOOL8 v10;
  id v14;
  double v15;
  int v16;
  __int128 v17;
  int v18;
  void *v19;
  __int128 v20;
  id v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v10 = a6;
  v14 = a3;
  *(float *)&v15 = a4;
  v16 = objc_msgSend(a1, "_isValidSlowMotionRate:", v15);
  v17 = *(_OWORD *)&a5->var0.var3;
  v25 = *(_OWORD *)&a5->var0.var0;
  v26 = v17;
  v27 = *(_OWORD *)&a5->var1.var1;
  v18 = objc_msgSend(a1, "_isValidSlowMotionTimeRange:", &v25);
  v19 = 0;
  if (v16 && v18)
  {
    v24 = 0;
    v20 = *(_OWORD *)&a5->var0.var3;
    v25 = *(_OWORD *)&a5->var0.var0;
    v26 = v20;
    v27 = *(_OWORD *)&a5->var1.var1;
    objc_msgSend(a1, "_scaledCompositionForAsset:slowMotionRate:slowMotionTimeRange:forExport:outTimeRangeMapper:", v14, &v25, v10, &v24, COERCE_DOUBLE(__PAIR64__(DWORD1(v27), LODWORD(a4))));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v24;
    if (v21)
    {
      objc_msgSend(a1, "audioMixForScaledComposition:timeRangeMapper:", v21, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a8)
        goto LABEL_6;
    }
    else
    {
      v19 = 0;
      if (!a8)
      {
LABEL_6:

        if (v21)
          goto LABEL_8;
        goto LABEL_7;
      }
    }
    *a8 = objc_retainAutorelease(v22);
    goto LABEL_6;
  }
LABEL_7:
  v21 = v14;
LABEL_8:
  if (a7)
    *a7 = objc_retainAutorelease(v19);

  return v21;
}

+ (BOOL)_isValidSlowMotionRate:(float)a3
{
  return a3 != 1.0 && a3 > 0.0;
}

+ (BOOL)_isValidSlowMotionTimeRange:(id *)a3
{
  CMTime v4;
  CMTime time1;

  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
    return 0;
  time1 = (CMTime)a3->var1;
  v4 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return CMTimeCompare(&time1, &v4) != 0;
}

+ (id)_scaledCompositionForAsset:(id)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6 outTimeRangeMapper:(id *)a7
{
  double v11;
  __int128 v12;
  void *v13;
  CMTimeEpoch epoch;
  double Seconds;
  __int128 v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v34;
  int v35;
  id v36;
  void *v37;
  __int128 v38;
  id *v39;
  id v40;
  _OWORD v41[3];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTimeRange start;
  id v47;
  CMTime end;
  CMTime v49;
  CMTimeRange v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  if (!v40
    || (*(float *)&v11 = a4, !objc_msgSend(a1, "_isValidSlowMotionRate:", v11))
    || (v12 = *(_OWORD *)&a5->var0.var3,
        *(_OWORD *)&v50.start.value = *(_OWORD *)&a5->var0.var0,
        *(_OWORD *)&v50.start.epoch = v12,
        *(_OWORD *)&v50.duration.timescale = *(_OWORD *)&a5->var1.var1,
        !objc_msgSend(a1, "_isValidSlowMotionTimeRange:", &v50)))
  {
    v31 = 0;
    v30 = 0;
    if (!a7)
      goto LABEL_21;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v49, 0, sizeof(v49));
  objc_msgSend(v40, "duration");
  memset(&v50, 0, sizeof(v50));
  *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
  v38 = *(_OWORD *)&start.start.value;
  start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  epoch = start.start.epoch;
  end = v49;
  CMTimeRangeFromTimeToTime(&v50, &start.start, &end);
  v47 = 0;
  start = v50;
  *(_OWORD *)&end.value = v38;
  end.epoch = epoch;
  +[PFMediaUtilities insertTimeRange:ofAsset:atTime:intoMutableComposition:error:](PFMediaUtilities, "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", &start, v40, &end, v13, &v47);
  v36 = v47;
  start.start = v49;
  Seconds = CMTimeGetSeconds(&start.start);
  v16 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&start.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&start.start.epoch = v16;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(a1, "_slowMotionRegionsFromSlowMotionTimeRange:", &start);
  v17 = objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a4;
  v34 = (void *)v17;
  v39 = a7;
  v35 = objc_msgSend(a1, "_scaleComposition:baseDuration:slowMotionRate:slowMotionRegions:forExport:outTimeRangeMapper:", v13, Seconds, v18);
  +[PFMediaUtilities mainVideoTrackForAsset:](PFMediaUtilities, "mainVideoTrackForAsset:", v40);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = v13;
  objc_msgSend(v13, "tracks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v43;
    v24 = *MEMORY[0x1E0C8A808];
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v26, "mediaType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v24);

        if (v28)
        {
          if (v19)
            objc_msgSend(v19, "preferredTransform");
          else
            memset(v41, 0, sizeof(v41));
          objc_msgSend(v26, "setPreferredTransform:", v41);
        }
        +[PFMediaUtilities trackWithTrackID:forAsset:](PFMediaUtilities, "trackWithTrackID:forAsset:", objc_msgSend(v26, "trackID"), v40);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setEnabled:", objc_msgSend(v29, "isEnabled"));

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v22);
  }

  v30 = v37;
  a7 = v39;
  v31 = v35;
  if (v39)
  {
LABEL_19:
    if ((v31 & 1) == 0)
      *a7 = 0;
  }
LABEL_21:
  if (v31)
    v32 = (void *)objc_msgSend(v30, "copy");
  else
    v32 = 0;

  return v32;
}

+ (id)_slowMotionRegionsFromSlowMotionTimeRange:(id *)a3
{
  const __CFAllocator *v3;
  __int128 v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  CMTimeRange v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v9.start.epoch = v4;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v5 = CMTimeRangeCopyAsDictionary(&v9, v3);
  if (!v5)
    return 0;
  v6 = v5;
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v6);
  return v7;
}

+ (id)timeRangeMapperForSourceDuration:(double)a3 slowMotionRate:(float)a4 slowMotionTimeRange:(id *)a5 forExport:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  __int128 v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  id v16;
  _OWORD v17[3];

  v6 = a6;
  v9 = a1;
  v10 = *(_OWORD *)&a5->var0.var3;
  v17[0] = *(_OWORD *)&a5->var0.var0;
  v17[1] = v10;
  v17[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(a1, "_slowMotionRegionsFromSlowMotionTimeRange:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  *(float *)&v12 = a4;
  LOBYTE(v9) = objc_msgSend(v9, "_scaleComposition:baseDuration:slowMotionRate:slowMotionRegions:forExport:outTimeRangeMapper:", 0, v11, v6, &v16, a3, v12);
  v13 = v16;
  v14 = v13;
  if ((v9 & 1) == 0)
  {

    v14 = 0;
  }

  return v14;
}

+ (BOOL)_scaleComposition:(id)a3 baseDuration:(double)a4 slowMotionRate:(float)a5 slowMotionRegions:(id)a6 forExport:(BOOL)a7 outTimeRangeMapper:(id *)a8
{
  _BOOL8 v9;
  id v12;
  id v13;
  PFSlowMotionTimeRangeMapper *v14;
  double v15;
  id v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  float v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t j;
  float v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t k;
  const __CFDictionary *v34;
  double Seconds;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id obj;
  double v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  PFSlowMotionTimeRangeMapper *v67;
  uint64_t *v68;
  id v69;
  CMTime v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  PFSlowMotionTimeRangeMapper *v75;
  uint64_t *v76;
  id v77;
  CMTimeRange time;
  CMTime v79;
  uint64_t v80;
  double *v81;
  uint64_t v82;
  double v83;
  CMTimeRange v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id v98;
  id v99;
  id v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v9 = a7;
  v104 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (a8)
  {
    v14 = objc_retainAutorelease(objc_alloc_init(PFSlowMotionTimeRangeMapper));
    *a8 = v14;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(a1, "sharedConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rampDown");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rampUp");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  v99 = 0;
  *(float *)&v15 = a5;
  objc_msgSend(v57, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", v9, &v100, &v99, v15);
  v16 = v100;
  v55 = v99;
  v98 = 0;
  v97 = 0;
  *(float *)&v17 = a5;
  objc_msgSend(v56, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", v9, &v98, &v97, v17);
  v18 = v98;
  v54 = v97;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v94;
    v21 = 0.0;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v94 != v20)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "floatValue");
        v21 = v21 + v23;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v19);
  }
  else
  {
    v21 = 0.0;
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v24 = v18;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v90;
    v27 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v90 != v26)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "floatValue");
        v27 = v27 + v29;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    }
    while (v25);
  }
  else
  {
    v27 = 0.0;
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v58 = v13;
  v30 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v86;
    v62 = 0.0;
    v32 = 0.0;
    while (1)
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v86 != v31)
          objc_enumerationMutation(v58);
        v34 = *(const __CFDictionary **)(*((_QWORD *)&v85 + 1) + 8 * k);
        memset(&v84, 0, sizeof(v84));
        CMTimeRangeMakeFromDictionary(&v84, v34);
        time.start = v84.duration;
        Seconds = CMTimeGetSeconds(&time.start);
        if (Seconds - v21 - v27 > 0.0)
        {
          *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
          time.start.epoch = v84.start.epoch;
          v36 = v62 + CMTimeGetSeconds(&time.start);
          v80 = 0;
          v81 = (double *)&v80;
          HIDWORD(v37) = 1065646817;
          v82 = 0x2020000000;
          v83 = v36;
          v38 = v36 - v32;
          if (v36 - v32 > 0.01)
          {
            *(float *)&v38 = v38;
            LODWORD(v37) = LODWORD(v38);
            -[PFSlowMotionTimeRangeMapper addNextRange:scaledLength:](v14, "addNextRange:scaledLength:", v38, v37);
          }
          *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
          time.start.epoch = v84.start.epoch;
          v39 = CMTimeGetSeconds(&time.start);
          time = v84;
          CMTimeRangeGetEnd(&v79, &time);
          v40 = a4 - CMTimeGetSeconds(&v79);
          if (v39 >= 0.1)
          {
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke;
            v71[3] = &unk_1E45A3690;
            v42 = obj;
            v72 = v42;
            v73 = v55;
            v76 = &v80;
            v77 = a1;
            v74 = v12;
            v75 = v14;
            objc_msgSend(v42, "enumerateObjectsUsingBlock:", v71);

            if (v40 < 0.1)
              goto LABEL_34;
          }
          else
          {
            if (v40 >= 0.1)
            {
              v41 = v81[3];
LABEL_42:
              objc_msgSend(a1, "_scaleWithinComposition:fromCursor:timeStep:rate:timeRangeMapper:", v12, v14);
              v50 = v45;
              v81[3] = v45;
              if (v40 >= 0.1)
              {
                v63[0] = MEMORY[0x1E0C809B0];
                v63[1] = 3221225472;
                v63[2] = __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke_2;
                v63[3] = &unk_1E45A3690;
                v51 = v24;
                v64 = v51;
                v65 = v54;
                v68 = &v80;
                v69 = a1;
                v66 = v12;
                v67 = v14;
                objc_msgSend(v51, "enumerateObjectsWithOptions:usingBlock:", 2, v63);

                v45 = v81[3];
              }
              *(float *)&v46 = v36;
              *(float *)&v47 = v41;
              *(float *)&v48 = v50;
              *(float *)&v49 = v45;
              *(float *)&v45 = a5;
              -[PFSlowMotionTimeRangeMapper markScaledRegionWithRate:rampInStartTime:rampInEndTime:rampOutStartTime:rampOutEndTime:](v14, "markScaledRegionWithRate:rampInStartTime:rampInEndTime:rampOutStartTime:rampOutEndTime:", v45, v46, v47, v48, v49);
              v32 = v81[3];
              if (v40 >= 0.1)
                objc_msgSend(v56, "rampTime");
              v62 = v62 + v32 - v36 - Seconds;
              _Block_object_dispose(&v80, 8);
              continue;
            }
LABEL_34:
            if (v12)
            {
              objc_msgSend(v12, "duration");
              CMTimeGetSeconds(&v70);
              v41 = v81[3];
              v43 = v41;
              if (v39 < 0.1)
                goto LABEL_42;
              goto LABEL_41;
            }
            *(_OWORD *)&time.start.value = *(_OWORD *)&v84.start.value;
            time.start.epoch = v84.start.epoch;
            v44 = a4 - CMTimeGetSeconds(&time.start);
            if (v39 < 0.1)
            {
              v41 = v81[3];
              goto LABEL_42;
            }
            v43 = v44 - v21;
          }
          v41 = v81[3];
LABEL_41:
          objc_msgSend(v57, "rampTime", v43);
          goto LABEL_42;
        }
      }
      v30 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      if (!v30)
        goto LABEL_51;
    }
  }
  v62 = 0.0;
LABEL_51:

  return v62 > 0.0;
}

+ (double)_scaleWithinComposition:(id)a3 fromCursor:(double)a4 timeStep:(double)a5 rate:(float)a6 timeRangeMapper:(id)a7
{
  Float64 v10;
  Float64 v11;
  id v12;
  id v13;
  Float64 Seconds;
  double v15;
  double v16;
  CMTime v18;
  CMTimeRange time;
  CMTime v20;
  CMTime end;
  CMTime start;
  CMTimeRange v23;

  v10 = a4 + a5;
  memset(&v23, 0, sizeof(v23));
  v11 = a5 / a6;
  v12 = a7;
  v13 = a3;
  CMTimeMakeWithSeconds(&start, a4, 600);
  CMTimeMakeWithSeconds(&end, v10, 600);
  CMTimeRangeFromTimeToTime(&v23, &start, &end);
  memset(&v20, 0, sizeof(v20));
  CMTimeMakeWithSeconds(&v20, v11, 600);
  time = v23;
  v18 = v20;
  objc_msgSend(v13, "scaleTimeRange:toDuration:", &time, &v18);

  time.start = v20;
  Seconds = CMTimeGetSeconds(&time.start);
  v15 = Seconds + a4;
  *(float *)&Seconds = a5;
  *(float *)&v16 = v11;
  objc_msgSend(v12, "addNextRange:scaledLength:", Seconds, v16);

  return v15;
}

+ (void)configureExportSession:(id)a3 forcePreciseConversion:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PFMediaUtilities mainVideoTrackForAsset:](PFMediaUtilities, "mainVideoTrackForAsset:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0uLL;
    v12 = 0;
    objc_msgSend(v7, "nominalFrameRate");
    +[PFVideoAdjustments minFrameDurationForNominalFrameRate:](PFVideoAdjustments, "minFrameDurationForNominalFrameRate:");
    v9 = v11;
    v10 = v12;
    objc_msgSend(v5, "setMinVideoFrameDuration:", &v9);
    v8 = (_QWORD *)MEMORY[0x1E0C8AED8];
    if (!v4)
      v8 = (_QWORD *)MEMORY[0x1E0C8AED0];
    objc_msgSend(v5, "setVideoFrameRateConversionAlgorithm:", *v8);

  }
}

+ (id)exportPresetForAsset:(id)a3 preferredPreset:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C89E98]))
  {
    v8 = (id)*MEMORY[0x1E0C89E28];

    v5 = v8;
  }
  return v5;
}

+ (id)_setVolume:(float)a3 forSlowMotionRegionsInTrack:(id)a4 timeRangeMapper:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  void *v26;
  id v27;
  float v28;
  int v29;

  v8 = (void *)MEMORY[0x1E0C8B260];
  v9 = a5;
  objc_msgSend(v8, "audioMixInputParametersWithTrack:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rampDown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rampUp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "volumeDuringRampToSlowMotion");
  v16 = v15;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__PFSlowMotionUtilities__setVolume_forSlowMotionRegionsInTrack_timeRangeMapper___block_invoke;
  v23[3] = &unk_1E45A36B8;
  v17 = v10;
  v28 = a3;
  v29 = v16;
  v24 = v17;
  v25 = v12;
  v26 = v13;
  v27 = a1;
  v18 = v13;
  v19 = v12;
  objc_msgSend(v9, "enumerateScaledRegionsUsingBlock:", v23);

  objc_msgSend(v17, "setAudioTimePitchAlgorithm:", *MEMORY[0x1E0C89F10]);
  v20 = v26;
  v21 = v17;

  return v21;
}

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)_timeRangeFromTime:(SEL)a3 toTime:(float)a4
{
  CMTime v8;
  CMTime start;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  CMTimeMakeWithSeconds(&start, a4, 600);
  CMTimeMakeWithSeconds(&v8, a5, 600);
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v8);
}

+ (id)audioMixForScaledComposition:(id)a3 timeRangeMapper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, double);
  void *v20;
  id v21;
  id v22;
  id v23;
  float v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeDuringSlowMotion");
  v10 = v9;

  v11 = 0;
  if (v7 && v10 != 1.0)
  {
    objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __70__PFSlowMotionUtilities_audioMixForScaledComposition_timeRangeMapper___block_invoke;
    v20 = &unk_1E45A36E0;
    v23 = a1;
    v24 = v10;
    v21 = v7;
    v22 = v12;
    v14 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v17);
    objc_msgSend(v11, "setInputParameters:", v14, v17, v18, v19, v20);

  }
  v15 = (void *)objc_msgSend(v11, "copy");

  return v15;
}

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)adjustTimeRange:(SEL)a3 forNewStartTime:(id *)a4 endTime:(id *)a5
{
  __int128 v10;
  CMTimeRange v12;
  CMTimeRange rhs;
  CMTime v14;
  CMTimeRange lhs;
  CMTime v16;
  CMTime v17;

  memset(&v17, 0, sizeof(v17));
  CMTimeMake(&v17, 0, 600);
  memset(&v16, 0, sizeof(v16));
  lhs.start = (CMTime)*a6;
  rhs.start = (CMTime)*a5;
  CMTimeSubtract(&v16, &lhs.start, &rhs.start);
  memset(&lhs, 0, sizeof(lhs));
  rhs.start = v17;
  v12.start = v16;
  CMTimeRangeFromTimeToTime(&lhs, &rhs.start, &v12.start);
  memset(&v14, 0, sizeof(v14));
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&a4->var0.var0;
  rhs.start.epoch = a4->var0.var3;
  v12.start = (CMTime)*a5;
  CMTimeSubtract(&v14, &rhs.start, &v12.start);
  a4->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v14;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  rhs = lhs;
  v10 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v12.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v12.start.epoch = v10;
  *(_OWORD *)&v12.duration.timescale = *(_OWORD *)&a4->var1.var1;
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeGetIntersection((CMTimeRange *)retstr, &rhs, &v12);
}

void __70__PFSlowMotionUtilities_audioMixForScaledComposition_timeRangeMapper___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  id v4;

  LODWORD(a3) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "_setVolume:forSlowMotionRegionsInTrack:timeRangeMapper:", a2, *(_QWORD *)(a1 + 32), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

uint64_t __80__PFSlowMotionUtilities__setVolume_forSlowMotionRegionsInTrack_timeRangeMapper___block_invoke(uint64_t a1, double a2, double a3, float a4, float a5, float a6)
{
  float v10;
  void *v11;
  double v12;
  uint64_t result;
  double v14;
  double v15;
  float v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 *v30;
  void *v31;
  float v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  __int128 *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CMTime v64;

  v10 = *(float *)(a1 + 64);
  if (*(float *)&a3 == a4)
  {
    v11 = *(void **)(a1 + 32);
    CMTimeMakeWithSeconds(&v64, a4, 600);
    *(float *)&v12 = v10;
    result = objc_msgSend(v11, "setVolume:atTime:", &v64, v12);
  }
  else
  {
    v16 = *(float *)&a3;
    if (*(float *)(a1 + 68) >= v10)
    {
      v22 = *(void **)(a1 + 32);
      v23 = *(void **)(a1 + 56);
      if (v23)
      {
        LODWORD(a2) = LODWORD(a3);
        *(float *)&a3 = a4;
        objc_msgSend(v23, "_timeRangeFromTime:toTime:", a2, a3);
      }
      else
      {
        HIDWORD(v24) = 0;
        v53 = 0u;
        v54 = 0u;
        v52 = 0u;
      }
      LODWORD(v24) = 1.0;
      v30 = &v52;
      v31 = v22;
      *(float *)&a3 = v10;
    }
    else
    {
      v62 = 0u;
      v63 = 0u;
      v61 = 0u;
      v17 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "volumeSuppressionIntroTime");
      if (v17)
      {
        v20 = v16;
        v21 = v18 + v16;
        *(float *)&v20 = v21;
        *(float *)&v21 = v16;
        objc_msgSend(v17, "_timeRangeFromTime:toTime:", v21, v20);
      }
      else
      {
        v62 = 0u;
        v63 = 0u;
        v61 = 0u;
      }
      v25 = *(void **)(a1 + 32);
      LODWORD(v19) = *(_DWORD *)(a1 + 68);
      v58 = v61;
      v59 = v62;
      v60 = v63;
      objc_msgSend(v25, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v58, COERCE_DOUBLE(__PAIR64__(DWORD1(v63), 1.0)), v19);
      v59 = 0u;
      v60 = 0u;
      v58 = 0u;
      v26 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "volumeSuppressionOutroTime");
      if (v26)
      {
        v28 = a4;
        v29 = a4 - v27;
        *(float *)&v29 = v29;
        *(float *)&v28 = a4;
        objc_msgSend(v26, "_timeRangeFromTime:toTime:", v29, v28);
      }
      else
      {
        HIDWORD(v24) = 0;
        v59 = 0u;
        v60 = 0u;
        v58 = 0u;
      }
      v31 = *(void **)(a1 + 32);
      LODWORD(a3) = *(_DWORD *)(a1 + 64);
      LODWORD(v24) = *(_DWORD *)(a1 + 68);
      v55 = v58;
      v56 = v59;
      v57 = v60;
      v30 = &v55;
    }
    result = objc_msgSend(v31, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", v30, v24, a3);
  }
  if (a5 < a6)
  {
    v32 = *(float *)(a1 + 64);
    if (*(float *)(a1 + 68) >= v32)
    {
      v39 = *(void **)(a1 + 32);
      v40 = *(void **)(a1 + 56);
      if (v40)
      {
        *(float *)&v14 = a5;
        *(float *)&v15 = a6;
        objc_msgSend(v40, "_timeRangeFromTime:toTime:", v14, v15);
      }
      else
      {
        HIDWORD(v41) = 0;
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
      }
      LODWORD(v15) = 1.0;
      v47 = &v49;
      v48 = v39;
      *(float *)&v41 = v32;
    }
    else
    {
      v62 = 0u;
      v63 = 0u;
      v61 = 0u;
      v33 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "volumeSuppressionOutroTime");
      if (v33)
      {
        v36 = a5;
        v37 = v34 + a5;
        *(float *)&v36 = v37;
        *(float *)&v37 = a5;
        objc_msgSend(v33, "_timeRangeFromTime:toTime:", v37, v36);
      }
      else
      {
        HIDWORD(v38) = 0;
        v62 = 0u;
        v63 = 0u;
        v61 = 0u;
      }
      v42 = *(void **)(a1 + 32);
      LODWORD(v38) = *(_DWORD *)(a1 + 64);
      LODWORD(v35) = *(_DWORD *)(a1 + 68);
      v58 = v61;
      v59 = v62;
      v60 = v63;
      objc_msgSend(v42, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v58, v38, v35);
      v59 = 0u;
      v60 = 0u;
      v58 = 0u;
      v43 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "volumeSuppressionIntroTime");
      if (v43)
      {
        v45 = a6;
        v46 = a6 - v44;
        *(float *)&v46 = v46;
        *(float *)&v45 = a6;
        objc_msgSend(v43, "_timeRangeFromTime:toTime:", v46, v45);
      }
      else
      {
        HIDWORD(v41) = 0;
        v59 = 0u;
        v60 = 0u;
        v58 = 0u;
      }
      v48 = *(void **)(a1 + 32);
      LODWORD(v41) = *(_DWORD *)(a1 + 68);
      v55 = v58;
      v56 = v59;
      v57 = v60;
      v15 = COERCE_DOUBLE(__PAIR64__(DWORD1(v60), 1.0));
      v47 = &v55;
    }
    return objc_msgSend(v48, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", v47, v41, v15, v49, v50, v51, v52, v53, v54, v55, v56, v57);
  }
  return result;
}

uint64_t __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  float v6;
  float v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  uint64_t result;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  LODWORD(v11) = v10;
  result = objc_msgSend(*(id *)(a1 + 72), "_scaleWithinComposition:fromCursor:timeStep:rate:timeRangeMapper:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v7, v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
  return result;
}

uint64_t __118__PFSlowMotionUtilities__scaleComposition_baseDuration_slowMotionRate_slowMotionRegions_forExport_outTimeRangeMapper___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  float v6;
  float v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  uint64_t result;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  LODWORD(v11) = v10;
  result = objc_msgSend(*(id *)(a1 + 72), "_scaleWithinComposition:fromCursor:timeStep:rate:timeRangeMapper:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v7, v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
  return result;
}

void __44__PFSlowMotionUtilities_sharedConfiguration__block_invoke()
{
  PFSlowMotionConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(PFSlowMotionConfiguration);
  v1 = (void *)sharedConfiguration_configuration;
  sharedConfiguration_configuration = (uint64_t)v0;

}

@end
