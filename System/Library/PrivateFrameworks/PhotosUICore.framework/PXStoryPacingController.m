@implementation PXStoryPacingController

- (PXStoryPacingController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPacingController.m"), 58, CFSTR("%s is not available as initializer"), "-[PXStoryPacingController initWithObservableModel:]");

  abort();
}

- (PXStoryPacingController)initWithModel:(id)a3 timeSource:(id)a4 cueSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryPacingController *v11;
  PXStoryPacingController *v12;
  PXStoryPacingController *v13;
  _PXStoryPacingControllerChangeOrigin *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _PXStoryPacingControllerChangeOrigin *modelChangeOrigin;
  _PXStoryPacingControllerDecisionHistory *v21;
  _PXStoryPacingControllerDecisionHistory *pacingDecisionHistory;
  _QWORD v24[4];
  PXStoryPacingController *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryPacingController;
  v11 = -[PXStoryController initWithObservableModel:](&v26, sel_initWithObservableModel_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_model, v8);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__PXStoryPacingController_initWithModel_timeSource_cueSource___block_invoke;
    v24[3] = &unk_1E5142E50;
    v13 = v12;
    v25 = v13;
    objc_msgSend(v8, "performChanges:", v24);
    objc_storeStrong((id *)&v13->_timeSource, a4);
    objc_storeWeak((id *)&v13->_cueSource, v10);
    -[PXStoryPacingTimeSource setDelegate:](v13->_timeSource, "setDelegate:", v13);
    v14 = [_PXStoryPacingControllerChangeOrigin alloc];
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("changeOrigin-%@-%p"), v17, v13);
    v19 = -[_PXStoryPacingControllerChangeOrigin initWithDescription:](v14, "initWithDescription:", v18);
    modelChangeOrigin = v13->_modelChangeOrigin;
    v13->_modelChangeOrigin = (_PXStoryPacingControllerChangeOrigin *)v19;

    v21 = objc_alloc_init(_PXStoryPacingControllerDecisionHistory);
    pacingDecisionHistory = v13->_pacingDecisionHistory;
    v13->_pacingDecisionHistory = v21;

  }
  return v12;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryPacingController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCanChangePlaybackTime, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateTargetEndTime);

}

- (void)setIsActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_isActive != a3)
  {
    v3 = a3;
    self->_isActive = a3;
    -[PXStoryPacingController timeSource](self, "timeSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActive:", v3);

    -[PXStoryPacingController _invalidateCanChangePlaybackTime](self, "_invalidateCanChangePlaybackTime");
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v5;
  _BOOL4 v6;
  const __CFString *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = -[PXStoryPacingController canChangePlaybackTime](self, "canChangePlaybackTime");
  v7 = CFSTR("paused advancing time");
  if (v6)
    v7 = CFSTR("advancing time");
  objc_msgSend(v5, "appendFormat:", CFSTR("Pacing Status: %@\n"), v7);
  v8 = -[PXStoryPacingController canChangePlaybackTime](self, "canChangePlaybackTime");
  if (a3 == 14 && !v8)
  {
    -[PXStoryPacingController reasonPreventingPlaybackTimeChange](self, "reasonPreventingPlaybackTimeChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Paused Reason: %@\n"), v9);

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (void)setCanChangePlaybackTime:(BOOL)a3
{
  if (self->_canChangePlaybackTime != a3)
  {
    self->_canChangePlaybackTime = a3;
    -[PXStoryPacingController _invalidateCurrentPacingDecision](self, "_invalidateCurrentPacingDecision");
    -[PXStoryPacingController _invalidateTargetEndTimeWithReason:](self, "_invalidateTargetEndTimeWithReason:", CFSTR("Pacing Started/Stopped"));
  }
}

- (void)setCurrentPacingDecision:(id *)a3
{
  $93F33E278C31B54A307337CB339E4DCB *p_currentPacingDecision;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[15];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  p_currentPacingDecision = &self->_currentPacingDecision;
  v6 = *(_OWORD *)&a3->var10;
  v52 = *(_OWORD *)&a3->var8.var3;
  v53 = v6;
  v54 = *(_OWORD *)&a3->var11.var1;
  v7 = *(_OWORD *)&a3->var6.var0;
  v48 = *(_OWORD *)&a3->var4.var1;
  v49 = v7;
  v8 = *(_OWORD *)&a3->var8.var0;
  v50 = *(_OWORD *)&a3->var6.var3;
  v51 = v8;
  v9 = *(_OWORD *)&a3->var3.var0;
  v44 = *(_OWORD *)&a3->var2.var1;
  v45 = v9;
  v10 = *(_OWORD *)&a3->var4.var0.var1;
  v46 = *(_OWORD *)&a3->var3.var3;
  v47 = v10;
  v11 = *(_OWORD *)&a3->var1.var0.var1;
  v40 = *(_OWORD *)&a3->var0;
  v41 = v11;
  v12 = *(_OWORD *)&a3->var1.var1.var3;
  v42 = *(_OWORD *)&a3->var1.var1.var0;
  v43 = v12;
  v13 = *(_OWORD *)&self->_currentPacingDecision.transitionKind;
  v39[12] = *(_OWORD *)&self->_currentPacingDecision.startTimeIntoSegment.epoch;
  v39[13] = v13;
  v39[14] = *(_OWORD *)&self->_currentPacingDecision.transitionCorrection.timescale;
  v14 = *(_OWORD *)&self->_currentPacingDecision.cueTime.value;
  v39[8] = *(_OWORD *)&self->_currentPacingDecision.cue.rank;
  v39[9] = v14;
  v15 = *(_OWORD *)&self->_currentPacingDecision.startTimeIntoSegment.value;
  v39[10] = *(_OWORD *)&self->_currentPacingDecision.cueTime.epoch;
  v39[11] = v15;
  v16 = *(_OWORD *)&self->_currentPacingDecision.adjustedDuration.value;
  v39[4] = *(_OWORD *)&self->_currentPacingDecision.originalDuration.timescale;
  v39[5] = v16;
  v17 = *(_OWORD *)&self->_currentPacingDecision.cue.time.timescale;
  v39[6] = *(_OWORD *)&self->_currentPacingDecision.adjustedDuration.epoch;
  v39[7] = v17;
  v18 = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.start.timescale;
  v39[0] = *(_OWORD *)&self->_currentPacingDecision.segmentIdentifier;
  v39[1] = v18;
  v19 = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.duration.epoch;
  v39[2] = *(_OWORD *)&self->_currentPacingDecision.allowedTimeRange.duration.value;
  v39[3] = v19;
  if (!PXStoryPacingDecisionEqualToPacingDecision((uint64_t)&v40, (uint64_t)v39))
  {
    v20 = *(_OWORD *)&a3->var0;
    v21 = *(_OWORD *)&a3->var1.var1.var0;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.start.timescale = *(_OWORD *)&a3->var1.var0.var1;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.duration.value = v21;
    *(_OWORD *)&p_currentPacingDecision->segmentIdentifier = v20;
    v22 = *(_OWORD *)&a3->var1.var1.var3;
    v23 = *(_OWORD *)&a3->var2.var1;
    v24 = *(_OWORD *)&a3->var3.var3;
    *(_OWORD *)&p_currentPacingDecision->adjustedDuration.value = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)&p_currentPacingDecision->adjustedDuration.epoch = v24;
    *(_OWORD *)&p_currentPacingDecision->allowedTimeRange.duration.epoch = v22;
    *(_OWORD *)&p_currentPacingDecision->originalDuration.timescale = v23;
    v25 = *(_OWORD *)&a3->var4.var0.var1;
    v26 = *(_OWORD *)&a3->var4.var1;
    v27 = *(_OWORD *)&a3->var6.var3;
    *(_OWORD *)&p_currentPacingDecision->cueTime.value = *(_OWORD *)&a3->var6.var0;
    *(_OWORD *)&p_currentPacingDecision->cueTime.epoch = v27;
    *(_OWORD *)&p_currentPacingDecision->cue.time.timescale = v25;
    *(_OWORD *)&p_currentPacingDecision->cue.rank = v26;
    v28 = *(_OWORD *)&a3->var8.var0;
    v29 = *(_OWORD *)&a3->var8.var3;
    v30 = *(_OWORD *)&a3->var11.var1;
    *(_OWORD *)&p_currentPacingDecision->transitionKind = *(_OWORD *)&a3->var10;
    *(_OWORD *)&p_currentPacingDecision->transitionCorrection.timescale = v30;
    *(_OWORD *)&p_currentPacingDecision->startTimeIntoSegment.value = v28;
    *(_OWORD *)&p_currentPacingDecision->startTimeIntoSegment.epoch = v29;
    -[PXStoryPacingController pacingDecisionHistory](self, "pacingDecisionHistory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_OWORD *)&a3->var10;
    v52 = *(_OWORD *)&a3->var8.var3;
    v53 = v32;
    v54 = *(_OWORD *)&a3->var11.var1;
    v33 = *(_OWORD *)&a3->var6.var0;
    v48 = *(_OWORD *)&a3->var4.var1;
    v49 = v33;
    v34 = *(_OWORD *)&a3->var8.var0;
    v50 = *(_OWORD *)&a3->var6.var3;
    v51 = v34;
    v35 = *(_OWORD *)&a3->var3.var0;
    v44 = *(_OWORD *)&a3->var2.var1;
    v45 = v35;
    v36 = *(_OWORD *)&a3->var4.var0.var1;
    v46 = *(_OWORD *)&a3->var3.var3;
    v47 = v36;
    v37 = *(_OWORD *)&a3->var1.var0.var1;
    v40 = *(_OWORD *)&a3->var0;
    v41 = v37;
    v38 = *(_OWORD *)&a3->var1.var1.var3;
    v42 = *(_OWORD *)&a3->var1.var1.var0;
    v43 = v38;
    objc_msgSend(v31, "recordDecision:", &v40);

  }
}

- (void)setTargetEndTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_targetEndTime;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CMTime v11;
  CMTime v12;
  CMTime time2;
  CMTime time1;

  p_targetEndTime = &self->_targetEndTime;
  time1 = *(CMTime *)a3;
  time2 = (CMTime)self->_targetEndTime;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_targetEndTime->epoch = a3->var3;
    *(_OWORD *)&p_targetEndTime->value = v6;
    memset(&v12, 0, sizeof(v12));
    -[PXStoryPacingController cueSource](self, "cueSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "currentTime");
    else
      memset(&v12, 0, sizeof(v12));

    -[PXStoryPacingController pacingDecisionHistory](self, "pacingDecisionHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    time1 = (CMTime)*a3;
    time2 = v12;
    CMTimeSubtract(&v11, &time1, &time2);
    -[PXStoryPacingController targetEndUpdateReason](self, "targetEndUpdateReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetWithTargetDuration:reason:", &v11, v10);

  }
}

- (void)timeSource:(id)a3 didIncrementByTime:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CFAbsoluteTime Current;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  CFAbsoluteTime v17;
  int64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  Float64 v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  uint64_t v36;
  CMTime v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[15];
  CMTime v41;
  _BYTE v42[32];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTime v48;
  __int128 v49;
  uint64_t v50;
  _BYTE v51[32];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE time2[32];
  __int128 v58;
  _BYTE v59[152];
  _QWORD v60[7];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CMTime v74;
  _BYTE v75[19];
  uint64_t v76;
  CMTime v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  _OWORD v83[2];
  _BYTE rhs[80];
  __int128 v85;
  _OWORD v86[5];
  __int128 v87;
  __int128 v88;
  _OWORD v89[2];
  __int128 v90;
  uint64_t v91;
  CMTime v92[2];
  CMTime v93;
  _BYTE lhs[32];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  -[PXStoryPacingController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentSegmentIdentifier");
  memset(&v92[1], 0, sizeof(CMTime));
  if (v6)
    objc_msgSend(v6, "timeIntoCurrentSegment");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v92[1];
  v90 = 0uLL;
  v91 = 0;
  if (v6)
    objc_msgSend(v6, "timeLeftInCurrentSegment");
  if (-[PXStoryPacingController canChangePlaybackTime](self, "canChangePlaybackTime"))
  {
    objc_msgSend(v6, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PXStoryPacingController timelineVersion](self, "timelineVersion");
    *(CMTime *)lhs = v92[0];
    *(_OWORD *)rhs = *(_OWORD *)&a4->var0;
    *(_QWORD *)&rhs[16] = a4->var3;
    CMTimeAdd((CMTime *)time2, (CMTime *)lhs, (CMTime *)rhs);
    v92[0] = *(CMTime *)time2;
    -[PXStoryPacingController cueSource](self, "cueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v89, 0, sizeof(v89));
    v88 = 0u;
    v87 = 0u;
    memset(v86, 0, sizeof(v86));
    v85 = 0u;
    memset(rhs, 0, sizeof(rhs));
    -[PXStoryPacingController currentPacingDecision](self, "currentPacingDecision");
    if (*(_QWORD *)rhs == v7)
    {
      if (v9)
      {
        v105 = v88;
        v106 = v89[0];
        v107 = v89[1];
        v101 = v86[2];
        v102 = v86[3];
        v104 = v87;
        v103 = v86[4];
        v97 = *(_OWORD *)&rhs[64];
        v98 = v85;
        v100 = v86[1];
        v99 = v86[0];
        *(_OWORD *)lhs = *(_OWORD *)rhs;
        *(_OWORD *)&lhs[16] = *(_OWORD *)&rhs[16];
        v96 = *(_OWORD *)&rhs[48];
        v95 = *(_OWORD *)&rhs[32];
        if (!PXStoryPacingDecisionEqualToPacingDecision((uint64_t)lhs, (uint64_t)&PXStoryPacingDecisionNull))
        {
          if (objc_msgSend(v32, "isRealTime"))
          {
            if (objc_msgSend(v33, "adjustToWallClockTime"))
            {
              Current = CFAbsoluteTimeGetCurrent();
              memset(v51, 0, 24);
              CMTimeMakeWithSeconds(&v74, Current - *((double *)&v86[4] + 1), 600);
              *(_OWORD *)lhs = v87;
              *(_QWORD *)&lhs[16] = v88;
              *(CMTime *)time2 = v74;
              CMTimeAdd((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
              *(_OWORD *)lhs = *(_OWORD *)v51;
              *(_QWORD *)&lhs[16] = *(_QWORD *)&v51[16];
              *(CMTime *)time2 = v92[0];
              if (!PXStoryTimeApproximatelyEqualToTime((uint64_t)lhs, (uint64_t)time2))
              {
                memset(v42, 0, 24);
                *(_OWORD *)lhs = *(_OWORD *)v51;
                *(_QWORD *)&lhs[16] = *(_QWORD *)&v51[16];
                *(CMTime *)time2 = v92[0];
                CMTimeSubtract((CMTime *)v42, (CMTime *)lhs, (CMTime *)time2);
                -[PXStoryPacingController log](self, "log");
                v11 = (id)objc_claimAutoreleasedReturnValue();
                v12 = os_signpost_id_make_with_pointer(v11, self);
                if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  v13 = v12;
                  if (os_signpost_enabled(v11))
                  {
                    v28 = -[PXStoryPacingController logContext](self, "logContext");
                    *(_OWORD *)lhs = *(_OWORD *)v42;
                    *(_QWORD *)&lhs[16] = *(_QWORD *)&v42[16];
                    PXStoryTimeDescription((CMTime *)lhs);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    *(CMTime *)lhs = v92[0];
                    PXStoryTimeDescription((CMTime *)lhs);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_OWORD *)lhs = *(_OWORD *)v51;
                    *(_QWORD *)&lhs[16] = *(_QWORD *)&v51[16];
                    PXStoryTimeDescription((CMTime *)lhs);
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)lhs = 134218754;
                    *(_QWORD *)&lhs[4] = v28;
                    *(_WORD *)&lhs[12] = 2114;
                    *(_QWORD *)&lhs[14] = v30;
                    *(_WORD *)&lhs[22] = 2114;
                    *(_QWORD *)&lhs[24] = v29;
                    LOWORD(v95) = 2114;
                    *(_QWORD *)((char *)&v95 + 2) = v14;
                    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_EVENT, v13, "PXStoryPacingController.adjustTimeIntoSegment", "Context=%{signpost.telemetry:string2}lu Adjustment=%{signpost.description:attribute,public}@ NewTime=%{signpost.description:attribute,public}@ WallClockTime=%{signpost.description:attribute,public}@ ", lhs, 0x2Au);

                  }
                }

                PLStoryGetLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_OWORD *)lhs = *(_OWORD *)v42;
                  *(_QWORD *)&lhs[16] = *(_QWORD *)&v42[16];
                  PXStoryTimeDescription((CMTime *)lhs);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)lhs = 138412290;
                  *(_QWORD *)&lhs[4] = v16;
                  _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEBUG, "[Pacing] Compensating for apparent main queue lag. Adjusting current time into segment by %@", lhs, 0xCu);

                }
                v92[0] = *(CMTime *)v51;
              }
            }
          }
        }
      }
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v8, "timeRangeForSegmentWithIdentifier:", v7);
      }
      else
      {
        memset(v83, 0, sizeof(v83));
        v82 = 0u;
      }
      v80 = *(_OWORD *)((char *)v83 + 8);
      v81 = *((_QWORD *)&v83[1] + 1);
      v78 = *(_OWORD *)((char *)v83 + 8);
      v79 = *((_QWORD *)&v83[1] + 1);
      v17 = CFAbsoluteTimeGetCurrent();
      v77 = v92[0];
      v18 = -[PXStoryPacingController timelineVersion](self, "timelineVersion");
      v76 = 0;
      *(_OWORD *)&v75[3] = PXStoryTimeZero;
      memset(&rhs[8], 0, 48);
      *(_OWORD *)&rhs[56] = v80;
      *(_QWORD *)rhs = v7;
      *(_QWORD *)&rhs[72] = v81;
      v85 = v78;
      *(_QWORD *)&v86[0] = v79;
      memset((char *)v86 + 8, 0, 64);
      *((CFAbsoluteTime *)&v86[4] + 1) = v17;
      v87 = *(_OWORD *)&v77.value;
      *(_QWORD *)&v88 = v77.epoch;
      *((_QWORD *)&v88 + 1) = v18;
      LOBYTE(v89[0]) = 0;
      *(_OWORD *)((char *)v89 + 1) = *(_OWORD *)v75;
      *(_OWORD *)((char *)v89 + 12) = *((unint64_t *)&PXStoryTimeZero + 1);
    }
    *(CMTime *)lhs = v92[0];
    *(_OWORD *)time2 = v85;
    *(_QWORD *)&time2[16] = *(_QWORD *)&v86[0];
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)time2) >= 1 && (objc_msgSend(v6, "shouldPauseTransitions") & 1) == 0)
    {
      memset(v51, 0, 24);
      *(CMTime *)lhs = v92[0];
      *(_OWORD *)time2 = v85;
      *(_QWORD *)&time2[16] = *(_QWORD *)&v86[0];
      CMTimeSubtract((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
      *(_OWORD *)lhs = *(_OWORD *)v51;
      *(_QWORD *)&lhs[16] = *(_QWORD *)&v51[16];
      v7 = objc_msgSend(v8, "identifierForSegmentWithOffset:fromEndOfSegmentWithIdentifier:timeIntoSegment:", lhs, v7, v92);
    }
    v19 = objc_msgSend(v9, "cuesVersion", v28);
    if (*(_QWORD *)rhs == v7 && *((_QWORD *)&v86[2] + 1) == v19 && *((_QWORD *)&v88 + 1) == v31)
    {
      *(_QWORD *)((char *)&v89[1] + 4) = 0;
      *(_OWORD *)((char *)v89 + 4) = PXStoryTimeZero;
    }
    else
    {
      v73 = 0u;
      v72 = 0u;
      v71 = 0u;
      if (v8)
        objc_msgSend(v8, "timeRangeForSegmentWithIdentifier:", v7);
      v67 = 0;
      v68 = &v67;
      v69 = 0x2020000000;
      v70 = 0;
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      v66 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v64 = 0;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke;
      v60[3] = &unk_1E5142E78;
      v60[4] = &v67;
      v60[5] = &v61;
      v60[6] = v65;
      *(_OWORD *)lhs = v71;
      *(_OWORD *)&lhs[16] = v72;
      v95 = v73;
      objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", lhs, v60, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v58 = 0u;
      memset(v59, 0, sizeof(v59));
      memset(time2, 0, sizeof(time2));
      if (v8)
      {
        objc_msgSend(v8, "infoForSegmentWithIdentifier:", v7);
        v20 = v59[0];
      }
      else
      {
        v20 = 0;
      }
      v54 = *(_OWORD *)&v59[104];
      v55 = *(_OWORD *)&v59[120];
      v56 = *(_OWORD *)&v59[136];
      *(_OWORD *)v51 = *(_OWORD *)&v59[40];
      *(_OWORD *)&v51[16] = *(_OWORD *)&v59[56];
      v52 = *(_OWORD *)&v59[72];
      v53 = *(_OWORD *)&v59[88];
      v49 = *(_OWORD *)&v59[4];
      v50 = *(_QWORD *)&v59[20];
      if (*((_BYTE *)v68 + 24))
      {
        objc_msgSend(v8, "clipWithIdentifier:", v62[3]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        memset(lhs, 0, sizeof(lhs));
        *(_OWORD *)v42 = v71;
        *(_OWORD *)&v42[16] = v72;
        v43 = v73;
        PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v21, (__int128 *)v42, 0, lhs);
        *(_OWORD *)v42 = v53;
        *(_QWORD *)&v42[16] = v54;
        v93 = *(CMTime *)lhs;
        CMTimeSubtract(&v48, (CMTime *)v42, &v93);
        v53 = *(_OWORD *)&v48.value;
        *(_QWORD *)&v54 = v48.epoch;

      }
      memset(&v93, 0, sizeof(v93));
      +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cueAlignmentForTransitionKind:", v20);
      *(_OWORD *)lhs = v49;
      *(_QWORD *)&lhs[16] = v50;
      CMTimeMultiplyByFloat64(&v93, (CMTime *)lhs, v23);

      if (objc_msgSend(v33, "useMusicCuesForPacing"))
        v24 = v9;
      else
        v24 = 0;
      -[PXStoryPacingController timeSource](self, "timeSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isRealTime");
      v45 = v54;
      v46 = v55;
      *(_OWORD *)v42 = *(_OWORD *)v51;
      *(_OWORD *)&v42[16] = *(_OWORD *)&v51[16];
      v43 = v52;
      v44 = v53;
      v47 = v56;
      v48 = v92[0];
      v41 = v93;
      PXStoryPacingControllerGeneratePacingDecision(v7, (uint64_t)v42, &v48, &v41, v24, v31, v26, (uint64_t)lhs);
      v88 = v105;
      v89[0] = v106;
      v89[1] = v107;
      v86[2] = v101;
      v86[3] = v102;
      v87 = v104;
      v86[4] = v103;
      *(_OWORD *)&rhs[64] = v97;
      v85 = v98;
      v86[1] = v100;
      v86[0] = v99;
      *(_OWORD *)rhs = *(_OWORD *)lhs;
      *(_OWORD *)&rhs[16] = *(_OWORD *)&lhs[16];
      *(_OWORD *)&rhs[48] = v96;
      *(_OWORD *)&rhs[32] = v95;

      LOBYTE(v89[0]) = v20;
      *(_QWORD *)((char *)&v89[1] + 4) = 0;
      *(_OWORD *)((char *)v89 + 4) = PXStoryTimeZero;
      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(v65, 8);
      _Block_object_dispose(&v67, 8);
    }
    *(_OWORD *)lhs = v85;
    *(_QWORD *)&lhs[16] = *(_QWORD *)&v86[0];
    *(CMTime *)time2 = v92[0];
    CMTimeSubtract((CMTime *)v51, (CMTime *)lhs, (CMTime *)time2);
    v90 = *(_OWORD *)v51;
    v91 = *(_QWORD *)&v51[16];
    v40[12] = v88;
    v40[13] = v89[0];
    v40[14] = v89[1];
    v40[8] = v86[2];
    v40[9] = v86[3];
    v40[10] = v86[4];
    v40[11] = v87;
    v40[4] = *(_OWORD *)&rhs[64];
    v40[5] = v85;
    v40[6] = v86[0];
    v40[7] = v86[1];
    v40[0] = *(_OWORD *)rhs;
    v40[1] = *(_OWORD *)&rhs[16];
    v40[2] = *(_OWORD *)&rhs[32];
    v40[3] = *(_OWORD *)&rhs[48];
    -[PXStoryPacingController setCurrentPacingDecision:](self, "setCurrentPacingDecision:", v40);

  }
  memset(time2, 0, 24);
  if (v6)
    objc_msgSend(v6, "elapsedTime");
  *(_OWORD *)lhs = *(_OWORD *)time2;
  *(_QWORD *)&lhs[16] = *(_QWORD *)&time2[16];
  *(_OWORD *)rhs = *(_OWORD *)&a4->var0;
  *(_QWORD *)&rhs[16] = a4->var3;
  CMTimeAdd((CMTime *)v51, (CMTime *)lhs, (CMTime *)rhs);
  *(_OWORD *)time2 = *(_OWORD *)v51;
  *(_QWORD *)&time2[16] = *(_QWORD *)&v51[16];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke_2;
  v34[3] = &__block_descriptor_112_e31_v16__0___PXStoryMutableModel__8l;
  v35 = *(_OWORD *)v51;
  v36 = *(_QWORD *)&v51[16];
  v34[4] = v7;
  v37 = v92[0];
  v39 = v91;
  v38 = v90;
  -[PXStoryPacingController modelChangeOrigin](self, "modelChangeOrigin");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performChanges:origin:", v34, v27);

}

- (void)_invalidateTargetEndTimeWithReason:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[PXStoryPacingController setTargetEndUpdateReason:](self, "setTargetEndUpdateReason:", v4);

  -[PXStoryController updater](self, "updater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateOf:", sel__updateTargetEndTime);

}

- (void)_updateTargetEndTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime *v9;
  __int128 v10;
  uint64_t v11;
  CMTime v12;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  __int128 v16;
  _OWORD v17[2];
  CMTime v18;
  CMTime v19;
  CMTime rhs;
  CMTime lhs;

  -[PXStoryPacingController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  memset(&v19, 0, sizeof(v19));
  if (v3)
    objc_msgSend(v3, "nominalPlaybackTime");
  objc_msgSend(v4, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v16 = 0u;
  }
  v18 = *(CMTime *)((char *)v17 + 8);

  memset(&v15, 0, sizeof(v15));
  lhs = v18;
  rhs = v19;
  CMTimeSubtract(&v15, &lhs, &rhs);
  memset(&v14, 0, sizeof(v14));
  -[PXStoryPacingController cueSource](self, "cueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "currentTime");
  else
    memset(&v14, 0, sizeof(v14));

  if ((v14.flags & 0x1D) == 1)
  {
    lhs = v14;
    rhs = v15;
    CMTimeAdd(&v13, &lhs, &rhs);
    v12 = v13;
    v9 = &v12;
  }
  else
  {
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v9 = (CMTime *)&v10;
  }
  -[PXStoryPacingController setTargetEndTime:](self, "setTargetEndTime:", v9, v10, v11);

}

- (void)_invalidateCanChangePlaybackTime
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanChangePlaybackTime);

}

- (void)_updateCanChangePlaybackTime
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t (**v6)(void *, _QWORD);
  unint64_t v7;
  _BOOL8 v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  char v13;
  _QWORD aBlock[5];
  id v15;

  -[PXStoryPacingController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke;
  aBlock[3] = &unk_1E5142EC0;
  aBlock[4] = self;
  v5 = v3;
  v15 = v5;
  v6 = (uint64_t (**)(void *, _QWORD))_Block_copy(aBlock);
  v7 = objc_msgSend(v5, "readinessStatus");
  v8 = v7 < 3;
  v9 = v6[2](v6, v8 & (3u >> (v7 & 7)));
  -[PXStoryPacingController setCanChangePlaybackTime:](self, "setCanChangePlaybackTime:", v6[2](v6, v8));
  -[PXStoryPacingController model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke_2;
  v12[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  v13 = v9;
  -[PXStoryPacingController modelChangeOrigin](self, "modelChangeOrigin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performChanges:origin:", v12, v11);

}

- (void)_invalidateCurrentPacingDecision
{
  _OWORD v2[15];

  memset(v2, 0, sizeof(v2));
  -[PXStoryPacingController setCurrentPacingDecision:](self, "setCurrentPacingDecision:", v2);
}

- (void)_handleTimelineDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__PXStoryPacingController__handleTimelineDidChange__block_invoke;
  v2[3] = &unk_1E5142F08;
  v2[4] = self;
  -[PXStoryController performChanges:](self, "performChanges:", v2);
}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryPacingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXStoryPacingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5142F30;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMTime v25;
  _OWORD v26[3];
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  height = a4.height;
  width = a4.width;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryPacingController cueSource](self, "cueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (objc_msgSend(v8, "audioCueSource"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEmpty"),
        v10,
        (v11 & 1) != 0))
  {
    objc_msgSend(v7, "appendString:", CFSTR("\n No Cues Found"));
    goto LABEL_16;
  }
  v39 = 0uLL;
  v40 = 0;
  objc_msgSend(v9, "currentTime");
  -[PXStoryPacingController pacingDecisionHistory](self, "pacingDecisionHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  memset(v31, 0, sizeof(v31));
  if (!v12)
  {
    v14 = 0;
    goto LABEL_8;
  }
  v29 = v39;
  v30 = v40;
  objc_msgSend(v12, "firstPacingDecisionAfterTime:", &v29);
  v14 = v37;
  if (v37 <= 0xAu)
  {
LABEL_8:
    v15 = off_1E5136018[v14];
    goto LABEL_9;
  }
  v15 = CFSTR("??");
LABEL_9:
  v16 = v15;
  objc_msgSend(v7, "appendFormat:", CFSTR("Transition: %@"), v16);

  if ((unint64_t)v32 > 4)
    v17 = CFSTR("Unspecified");
  else
    v17 = off_1E5117580[(_QWORD)v32];
  v18 = v17;
  objc_msgSend(v7, "appendFormat:", CFSTR("\n       Cue: %@"), v18);

  v28 = v34;
  v26[0] = *(_OWORD *)((char *)v31 + 8);
  v26[1] = *(_OWORD *)((char *)&v31[1] + 8);
  v26[2] = *(_OWORD *)((char *)&v31[2] + 8);
  v27 = v33;
  objc_msgSend(v9, "diagnosticCueStringForSize:withIndicatorTime:rangeIndicatorTimeRange:", &v27, v26, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@\n"), v19);

  if (v13)
    objc_msgSend(v13, "currentError");
  else
    memset(&v25, 0, sizeof(v25));
  PXStoryTimeDescription(&v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n Overall Time Error: %@\n"), v20);

  v21 = objc_msgSend(v13, "onBarCount");
  v22 = objc_msgSend(v13, "decisionCount");
  objc_msgSend(v13, "onBarPercentage");
  objc_msgSend(v7, "appendFormat:", CFSTR("Transitions on bars: %ld / %ld (%.0f%%)\n\n"), v21, v22, v23);

LABEL_16:
  return v7;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXStoryPacingController pacingDecisionHistory](self, "pacingDecisionHistory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionWithShortStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithText:name:", v5, CFSTR("PacingDecisions"));

}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXStoryPacingCueSource)cueSource
{
  return (PXStoryPacingCueSource *)objc_loadWeakRetained((id *)&self->_cueSource);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)canChangePlaybackTime
{
  return self->_canChangePlaybackTime;
}

- (NSString)reasonPreventingPlaybackTimeChange
{
  return self->_reasonPreventingPlaybackTimeChange;
}

- (void)setReasonPreventingPlaybackTimeChange:(id)a3
{
  objc_storeStrong((id *)&self->_reasonPreventingPlaybackTimeChange, a3);
}

- (_PXStoryPacingControllerChangeOrigin)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (NSString)targetEndUpdateReason
{
  return self->_targetEndUpdateReason;
}

- (void)setTargetEndUpdateReason:(id)a3
{
  objc_storeStrong((id *)&self->_targetEndUpdateReason, a3);
}

- (_PXStoryPacingControllerDecisionHistory)pacingDecisionHistory
{
  return self->_pacingDecisionHistory;
}

- (void)setPacingDecisionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_pacingDecisionHistory, a3);
}

- (int64_t)timelineVersion
{
  return self->_timelineVersion;
}

- (void)setTimelineVersion:(int64_t)a3
{
  self->_timelineVersion = a3;
}

- ($61187B45F3045697A52F3AF35DA3878B)currentPacingDecision
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *(_OWORD *)&self[1].var8.var1;
  *(_OWORD *)&retstr->var8.var3 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->var10 = v3;
  *(_OWORD *)&retstr->var11.var1 = *(_OWORD *)&self[1].var9;
  v4 = *(_OWORD *)&self[1].var4.var0.var3;
  *(_OWORD *)&retstr->var4.var1 = *(_OWORD *)&self[1].var4.var0.var0;
  *(_OWORD *)&retstr->var6.var0 = v4;
  v5 = *(_OWORD *)&self[1].var6.var1;
  *(_OWORD *)&retstr->var6.var3 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var8.var0 = v5;
  v6 = *(_OWORD *)&self[1].var2.var0;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var3.var0 = v6;
  v7 = *(_OWORD *)&self[1].var3.var1;
  *(_OWORD *)&retstr->var3.var3 = *(_OWORD *)&self[1].var2.var3;
  *(_OWORD *)&retstr->var4.var0.var1 = v7;
  v8 = *(_OWORD *)&self->var11.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var11.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v8;
  v9 = *(_OWORD *)&self[1].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v9;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacingDecisionHistory, 0);
  objc_storeStrong((id *)&self->_targetEndUpdateReason, 0);
  objc_storeStrong((id *)&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_reasonPreventingPlaybackTimeChange, 0);
  objc_destroyWeak((id *)&self->_cueSource);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_destroyWeak((id *)&self->_model);
}

void __45__PXStoryPacingController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if ((*(_QWORD *)(a1 + 40) & 0x9862421400ALL) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCanChangePlaybackTime");
  objc_msgSend(*(id *)(a1 + 32), "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changesOrigins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modelChangeOrigin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if ((v7 & 0x20) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetEndTimeWithReason:", CFSTR("Segment Changed"));
    }
    else if ((v7 & 0x10) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleTimelineDidChange");
    }
  }

}

uint64_t __51__PXStoryPacingController__handleTimelineDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimelineVersion:", objc_msgSend(*(id *)(a1 + 32), "timelineVersion") + 1);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetEndTimeWithReason:", CFSTR("Timeline Changed"));
}

uint64_t __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "!self.isActive";
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "desiredPlayState") != 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "model.desiredPlayState != PXStoryDesiredPlayStatePlaying";
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isScrolling"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "model.isScrolling";
LABEL_7:
    objc_msgSend(v5, "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setReasonPreventingPlaybackTimeChange:", v7);

    v8 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "inLiveResize"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "model.inLiveResize";
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "playbackShouldWaitForBufferingToBeReady") && a2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "isBuffering";
    goto LABEL_7;
  }
  v10 = objc_msgSend(*(id *)(a1 + 40), "viewMode");
  if (objc_msgSend(*(id *)(a1 + 40), "viewMode") == 4)
    v11 = objc_msgSend(v4, "shouldPauseInStyleSwitcher") ^ 1;
  else
    v11 = 0;
  v12 = objc_msgSend(*(id *)(a1 + 40), "viewMode");
  if (v10 != 1 && (v11 & 1) == 0 && v12 != 5)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "!isFullScreen && !isStyleSwitcher && !isMiniPlayer";
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isTouching"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "model.isTouching";
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isPerformingViewControllerTransition"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "model.isPerformingViewControllerTransition";
    goto LABEL_7;
  }
  v13 = *(void **)(a1 + 40);
  v16 = 0;
  v14 = objc_msgSend(v13, "checkIfShouldPreventAdvancingAndReturnReason:", &v16);
  if (v14)
    v15 = v16;
  else
    v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setReasonPreventingPlaybackTimeChange:", v15);
  v8 = v14 ^ 1u;
LABEL_8:

  return v8;
}

uint64_t __55__PXStoryPacingController__updateCanChangePlaybackTime__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActuallyPlaying:", *(unsigned __int8 *)(a1 + 32));
}

_QWORD *__57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v8;

  if (a2 >= 1)
  {
    do
    {
      v5 = a5[19];
      if ((unint64_t)(v5 - 3) <= 1 && !*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24))
      {
        *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *a5;
        *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
      }
      a5 += 96;
      v6 = *(_QWORD *)(result[6] + 8);
      v8 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 || *(_BYTE *)(v6 + 24) != 0;
      *(_BYTE *)(v6 + 24) = v8;
      --a2;
    }
    while (a2);
  }
  return result;
}

void __57__PXStoryPacingController_timeSource_didIncrementByTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v3 = a2;
  objc_msgSend(v3, "setElapsedTime:", &v9);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v3, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", v4, &v7, &v5, 0);

}

uint64_t __62__PXStoryPacingController_initWithModel_timeSource_cueSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 15);
}

@end
