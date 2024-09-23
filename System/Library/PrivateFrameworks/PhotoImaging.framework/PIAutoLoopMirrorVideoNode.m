@implementation PIAutoLoopMirrorVideoNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIAutoLoopMirrorVideoNode;
  -[PIAutoLoopVideoNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_conformTime:(SEL)a3
{
  CMTimeValue value;
  uint64_t v7;
  int64_t var0;
  int64_t v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v11;
  CMTime v12;
  CMTime time2;
  CMTime lhs;
  CMTime rhs;
  int32_t timescale;
  uint64_t v17;
  int32_t newTimescale;
  CMTime v19;
  CMTime time;
  int32_t v21;
  CMTime v22;

  *retstr = *a4;
  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  time = *(CMTime *)retstr;
  CMTimeConvertScale(&v22, &time, v21, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  *(CMTime *)retstr = v22;
  memset(&v22, 0, sizeof(v22));
  -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  CMTimeConvertScale(&v22, &v19, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  value = v22.value;
  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  v7 = 2 * (value - v17);
  var0 = retstr->var0;
  if (retstr->var0 < 0)
    var0 = var0 % v7 + v7;
  v9 = var0 % v7;
  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  CMTimeMake(&time, v9, timescale);
  *(CMTime *)retstr = time;
  memset(&time, 0, sizeof(time));
  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  lhs = v22;
  CMTimeSubtract(&time, &lhs, &rhs);
  lhs = (CMTime)*retstr;
  time2 = time;
  if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0)
  {
    lhs = (CMTime)*retstr;
    time2 = time;
    CMTimeSubtract(&v12, &lhs, &time2);
    time2 = time;
    CMTimeSubtract(&lhs, &time2, &v12);
    *(CMTime *)retstr = lhs;
  }
  -[PIAutoLoopVideoNode startTime](self, "startTime");
  time2 = (CMTime)*retstr;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&lhs, &v11, &time2);
  *(CMTime *)retstr = lhs;
  return result;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  objc_super v31;
  uint8_t buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_21458();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if ((objc_msgSend(v9, "evaluationMode") & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    memset(buf, 0, sizeof(buf));
    if (v10)
      objc_msgSend(v10, "time");
    else
      memset(v30, 0, sizeof(v30));
    -[PIAutoLoopMirrorVideoNode _conformTime:](self, "_conformTime:", v30);
    v12 = (void *)objc_msgSend(v10, "copy");
    v28 = *(_OWORD *)buf;
    v29 = *(_QWORD *)&buf[16];
    objc_msgSend(v12, "setTime:", &v28);
    -[PIAutoLoopVideoNode input](self, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v12, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PIAutoLoopMirrorVideoNode;
    -[PIAutoLoopVideoNode nodeByReplayingAgainstCache:pipelineState:error:](&v31, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  int v14;
  int32_t v15;
  int32_t v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BYTE v36[24];
  CMTimeRange v37;
  id v38;
  CMTime v39;
  CMTime v40;
  int32_t timescale;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v48;
  CMTimeRange v49;
  id v50;
  CMTime duration;
  CMTime start;
  CMTimeRange v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21458();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v53, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v53.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v29;
        LOWORD(v53.start.flags) = 2114;
        *(_QWORD *)((char *)&v53.start.flags + 2) = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v53, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.start.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v53, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "outputVideo:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C8B268]);
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v53, 0, sizeof(v53));
        -[PIAutoLoopVideoNode startTime](self, "startTime");
        -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
        CMTimeRangeMake(&v53, &start, &duration);
        v50 = 0;
        v49 = v53;
        v48 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        v12 = objc_msgSend(v11, "insertTimeRange:ofTrack:atTime:error:", &v49, v8, &v48, &v50);
        v13 = v50;
        if ((v12 & 1) != 0)
        {
          v34 = v10;
          v35 = v6;
          v14 = -[PIAutoLoopVideoNode loopPeriod](self, "loopPeriod");
          if (v14 < 3)
          {
LABEL_10:
            v10 = v34;
            v19 = v34;
            v6 = v35;
          }
          else
          {
            v15 = v14;
            v16 = v14 - 1;
            while (1)
            {
              v17 = v13;
              --v16;
              memset(&v48, 0, sizeof(v48));
              -[PIAutoLoopVideoNode startTime](self, "startTime");
              -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
              CMTimeMultiply(&rhs, &time, v16);
              CMTimeAdd(&v48, &lhs, &rhs);
              memset(&v44, 0, sizeof(v44));
              -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
              CMTimeMultiply(&v44, &v43, v15);
              memset(&v42, 0, sizeof(v42));
              -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
              CMTimeMake(&v42, 1, timescale);
              v40 = v48;
              v39 = v42;
              CMTimeRangeMake(&v49, &v40, &v39);
              v53 = v49;
              v38 = v13;
              v40 = v44;
              v18 = objc_msgSend(v11, "insertTimeRange:ofTrack:atTime:error:", &v49, v8, &v40, &v38);
              v13 = v38;

              if (!v18)
                break;
              v49.start = v44;
              v40 = v42;
              CMTimeRangeMake(&v37, &v49.start, &v40);
              -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
              objc_msgSend(v11, "scaleTimeRange:toDuration:", &v37, v36);
              ++v15;
              if (v16 < 2)
                goto LABEL_10;
            }
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track"), self, v13);
            v19 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            v10 = v34;
            v6 = v35;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track #1"), self, v13);
          v19 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("[[AVMutableComposition alloc] init] failed."), self);
        v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[NURenderNode outputVideo:](self, "outputVideo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0D52310]);
    if (v7)
    {
      objc_msgSend(v7, "timeRange");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    objc_msgSend(v8, "setTimeRange:", v19);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "trackID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiredSourceTrackIDs:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "trackID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceIdentifier:forTrackID:", CFSTR("video"), v12);

    v9 = objc_alloc_init(MEMORY[0x1E0C8B288]);
    -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
    v15 = v17;
    v16 = v18;
    objc_msgSend(v9, "setFrameDuration:", &v15);
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInstructions:", v13);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  os_log_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  void *specific;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Mirror does not require an AVAudioMix"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v20, 0xCu);

      v9 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v9 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
LABEL_7:
        v10 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)MEMORY[0x1E0CB3978];
          v12 = v10;
          objc_msgSend(v11, "callStackSymbols");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v14;
          _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v20, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v17 = (void *)MEMORY[0x1E0CB3978];
      v3 = specific;
      v12 = v15;
      objc_msgSend(v17, "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = specific;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v20, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
  }
}

+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  return 0;
}

@end
