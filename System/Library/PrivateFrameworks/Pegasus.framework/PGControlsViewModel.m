@implementation PGControlsViewModel

- (PGControlsViewModel)init
{
  PGControlsViewModel *v2;
  PGPlaybackState *v3;
  PGPlaybackState *playbackState;
  PGControlsViewModelValues *v5;
  PGControlsViewModelValues *values;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGControlsViewModel;
  v2 = -[PGControlsViewModel init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PGPlaybackState initWithDictionary:]([PGPlaybackState alloc], "initWithDictionary:", 0);
    playbackState = v2->_playbackState;
    v2->_playbackState = v3;

    v5 = objc_alloc_init(PGControlsViewModelValues);
    values = v2->_values;
    v2->_values = v5;

    -[PGControlsViewModel _updateViewModelValues](v2, "_updateViewModelValues");
  }
  return v2;
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGControlsViewModel updatePlaybackStateWithDiff:].cold.2((uint64_t)v4, v5, v6);

  -[PGControlsViewModel playbackState](self, "playbackState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePlaybackStateWithDiff:", v4);

  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGControlsViewModel updatePlaybackStateWithDiff:].cold.1(self, v8);

  -[PGControlsViewModel _updateViewModelValues](self, "_updateViewModelValues");
}

- (void)setInterrupted:(BOOL)a3
{
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    -[PGControlsViewModel _updateViewModelValues](self, "_updateViewModelValues");
  }
}

- (void)setInActivitySession:(BOOL)a3
{
  if (self->_inActivitySession != a3)
  {
    self->_inActivitySession = a3;
    -[PGControlsViewModel _updateViewModelValues](self, "_updateViewModelValues");
  }
}

- (unint64_t)recommendedUpdateCadenceForProgressBarWithWidthInPixels:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;

  -[PGControlsViewModel values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "progressBarShouldUpdate");

  if (!v6)
    return 0;
  -[PGControlsViewModel playbackState](self, "playbackState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentDuration");
  v9 = a3 / v8;

  return vcvtpd_u64_f64(v9);
}

- (void)handleActionButtonTapped
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "contentType");
  if ((unint64_t)(v3 - 1) < 2)
  {
    -[PGControlsViewModel playbackState](self, "playbackState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForSetPlaying:](PGCommand, "commandForSetPlaying:", objc_msgSend(v5, "timeControlStatus") == 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v3 == 3)
  {
    -[PGControlsViewModel playbackState](self, "playbackState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForSetMuted:](PGCommand, "commandForSetMuted:", objc_msgSend(v5, "isMuted") ^ 1);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v4 = (void *)v6;

    if (!v4)
      goto LABEL_10;
LABEL_9:
    -[PGControlsViewModel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlsViewModel:didIssueCommand:", self, v4);

    goto LABEL_10;
  }
  if (v3 == 4)
  {
    +[PGCommand commandForSendActionButtonTapped](PGCommand, "commandForSendActionButtonTapped");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_9;
  }
LABEL_10:

}

- (void)handleCancelButtonTapped
{
  void *v3;
  id v4;

  if (-[PGControlsViewModel isInActivitySession](self, "isInActivitySession"))
    +[PGCommand commandForEndOrLeaveActivityRequested](PGCommand, "commandForEndOrLeaveActivityRequested");
  else
    +[PGCommand commandForCancelPIP](PGCommand, "commandForCancelPIP");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PGControlsViewModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlsViewModel:didIssueCommand:", self, v4);

}

- (void)handleDoubleTap
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PGControlsViewModel values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "includesDoubleTapGestureRecognizer");

  if (v4)
  {
    -[PGControlsViewModel delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForToggleZoom](PGCommand, "commandForToggleZoom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlsViewModel:didIssueCommand:", self, v5);

  }
}

- (void)handleSingleTap
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "contentType");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0xE) != 0)
    {
      if (-[PGControlsViewModel isInterrupted](self, "isInterrupted"))
        goto LABEL_11;
      +[PGCommand commandForToggleControlsVisibility](PGCommand, "commandForToggleControlsVisibility");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << v3) & 0x31) != 0)
        +[PGCommand commandForRestoreFromPIP](PGCommand, "commandForRestoreFromPIP");
      else
        +[PGCommand commandForSendActionButtonTapped](PGCommand, "commandForSendActionButtonTapped");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
    if (v4)
    {
      -[PGControlsViewModel delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "controlsViewModel:didIssueCommand:", self, v5);

    }
  }
LABEL_11:

}

- (void)handleDoubleDoubleTap
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PGControlsViewModel values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "includesDoubleDoubleTapGestureRecognizer");

  if (v4)
  {
    -[PGControlsViewModel delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForRestoreFromPIP](PGCommand, "commandForRestoreFromPIP");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlsViewModel:didIssueCommand:", self, v5);

  }
}

- (void)handleRestoreButtonTapped
{
  void *v3;
  id v4;

  -[PGControlsViewModel delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForRestoreFromPIP](PGCommand, "commandForRestoreFromPIP");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlsViewModel:didIssueCommand:", self, v3);

}

- (void)handleSkipBackButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentType");

  if (v4 != 4)
  {
    if (v4 == 2)
    {
      -[PGControlsViewModel playbackState](self, "playbackState");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "requiresLinearPlayback") & 1) != 0)
      {
LABEL_13:

        return;
      }
      -[PGControlsViewModel playbackState](self, "playbackState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentDuration");
      v9 = v8;

      if (v9 <= 30.0)
        return;
    }
    else
    {
      if (v4 != 1)
        return;
      -[PGControlsViewModel playbackState](self, "playbackState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "requiresLinearPlayback");

      if ((v6 & 1) != 0)
        return;
    }
    +[PGCommand commandForSkipByInterval:](PGCommand, "commandForSkipByInterval:", -10.0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      return;
LABEL_12:
    v15 = (id)v10;
    -[PGControlsViewModel delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "controlsViewModel:didIssueCommand:", self, v15);

    goto LABEL_13;
  }
  -[PGControlsViewModel playbackState](self, "playbackState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsFaceTimeActions");

  if (v12)
  {
    -[PGControlsViewModel playbackState](self, "playbackState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForSetMicrophoneMuted:](PGCommand, "commandForSetMicrophoneMuted:", objc_msgSend(v13, "isMicrophoneMuted") ^ 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (uint64_t)v16;
    if (v16)
      goto LABEL_12;
  }
}

- (void)handleSkipForwardButtonTapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentType");

  switch(v4)
  {
    case 4:
      -[PGControlsViewModel playbackState](self, "playbackState");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "supportsFaceTimeActions"))
      {
LABEL_17:

        return;
      }
      if (-[PGControlsViewModel isInterrupted](self, "isInterrupted"))
      {
        -[PGControlsViewModel playbackState](self, "playbackState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isCameraActive");

        if (!v9)
          return;
      }
      else
      {

      }
      -[PGControlsViewModel playbackState](self, "playbackState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGCommand commandForSetCameraEnabled:](PGCommand, "commandForSetCameraEnabled:", objc_msgSend(v15, "isCameraActive") ^ 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v13 = (uint64_t)v17;
      if (!v17)
        return;
      goto LABEL_16;
    case 2:
      -[PGControlsViewModel playbackState](self, "playbackState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "requiresLinearPlayback"))
      {

      }
      else
      {
        -[PGControlsViewModel playbackState](self, "playbackState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentDuration");
        v12 = v11;

        if (v12 > 30.0)
          goto LABEL_13;
      }
      +[PGCommand commandForSkipToLive](PGCommand, "commandForSkipToLive");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        return;
LABEL_16:
      v16 = (id)v13;
      -[PGControlsViewModel delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "controlsViewModel:didIssueCommand:", self, v16);

      goto LABEL_17;
    case 1:
      -[PGControlsViewModel playbackState](self, "playbackState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "requiresLinearPlayback");

      if ((v6 & 1) == 0)
      {
LABEL_13:
        +[PGCommand commandForSkipByInterval:](PGCommand, "commandForSkipByInterval:", 10.0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          return;
        goto LABEL_16;
      }
      break;
  }
}

- (void)handleSkipPrerollButtonTapped
{
  void *v3;
  id v4;

  if (-[PGControlsViewModel isPrerollSkippable](self, "isPrerollSkippable"))
  {
    -[PGControlsViewModel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[PGCommand commandForSkipPreroll](PGCommand, "commandForSkipPreroll");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controlsViewModel:didIssueCommand:", self, v3);

  }
}

- (int64_t)secondsUntilPrerollSkippable
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;

  -[PGControlsViewModel values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prerollAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredLinearPlaybackEndTime");
  v6 = v5;

  -[PGControlsViewModel values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "isPrerollActive");

  if (!(_DWORD)v4 || fabs(v6) == INFINITY)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[PGControlsViewModel playbackState](self, "playbackState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elapsedTime");
  v10 = v6 - v9;

  v11 = vcvtpd_s64_f64(v10);
  return v11 & ~(v11 >> 63);
}

- (BOOL)isPrerollSkippable
{
  void *v3;
  BOOL v4;

  -[PGControlsViewModel values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPrerollActive"))
    v4 = -[PGControlsViewModel secondsUntilPrerollSkippable](self, "secondsUntilPrerollSkippable") == 0;
  else
    v4 = 0;

  return v4;
}

- (double)preferredMinimumWidth
{
  void *v2;
  uint64_t v3;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentType");

  if ((unint64_t)(v3 - 1) > 3)
    return 128.0;
  else
    return dbl_1B0D17C20[v3 - 1];
}

- (void)_updateViewModelValues
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _BOOL4 v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  _BOOL4 v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  _BOOL4 v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  void *v45;
  unsigned int v46;
  __CFString *v47;
  __CFString *v48;
  _BOOL4 v49;
  int v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  void *v120;
  int v121;
  void *v122;
  _BOOL4 v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  const __CFString *v130;
  void *v131;
  unsigned int v132;
  unsigned int v133;
  const __CFString *v134;
  __CFString *v135;
  int v136;
  unsigned int v137;
  uint64_t v138;
  void *v139;
  unsigned int v140;
  _BOOL4 v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  unsigned int v148;
  _BOOL4 v149;
  _BOOL4 v150;
  _BOOL4 v151;
  void *v152;
  void *v153;
  void *v154;

  -[PGControlsViewModel playbackState](self, "playbackState");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGControlsViewModel values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v154, "contentDuration");
  v5 = v4;
  objc_msgSend(v154, "elapsedTime");
  v7 = v6;
  v8 = objc_msgSend(v154, "requiresLinearPlayback");
  v9 = objc_msgSend(v154, "isMuted");
  v10 = -[PGControlsViewModel isInterrupted](self, "isInterrupted");
  v11 = objc_msgSend(v154, "contentType");
  v12 = objc_msgSend(v154, "timeControlStatus");
  PGLocalizedString(CFSTR("RESTORE_FULLSCREEN"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  PGLocalizedString(CFSTR("CLOSE_PIP"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 1;
  v16 = v11 - 1;
  v15 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 1;
  v29 = 1;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v148 = 0;
  v140 = 0;
  v36 = 0;
  switch(v16)
  {
    case 0:
      v37 = v5 == 0.0 && !self->_hasBegun;
      v41 = -[PGControlsViewModel isInterrupted](self, "isInterrupted", 0, 1, 0, 0, 0, 0);
      objc_msgSend(v154, "prerollAttributes");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (v5 > 0.0) & ~(v37 | v8);
      if (v42)
        v43 = 0;
      v149 = v37;
      v145 = v42;
      v148 = !v37;
      v143 = v43;
      if (v10)
      {
        objc_msgSend(v154, "hasInvalidTiming");
        v136 = 0;
        v26 = 0;
        v44 = 0;
        v134 = CFSTR("play.slash.fill");
      }
      else
      {
        if (v7 > 0.0)
          v44 = v43;
        else
          v44 = 0;
        if (v7 < v5)
          v26 = v43;
        else
          v26 = 0;
        v136 = !v37;
        objc_msgSend(v154, "hasInvalidTiming");
        v48 = CFSTR("pause.fill");
        if (!v12)
          v48 = CFSTR("play.fill");
        v134 = v48;
      }
      v141 = v44;
      v32 = (v12 == 1) & ~v41;
      PGLocalizedString(CFSTR("SKIP_FORWARD_10_SECONDS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PGLocalizedString(CFSTR("SKIP_BACK_10_SECONDS"));
      v147 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        PGLocalizedString(CFSTR("PAUSE"));
        v138 = objc_claimAutoreleasedReturnValue();
        if (v12 == 2)
          v19 = (v37 | v32) ^ 1u;
        else
          v19 = 0;
      }
      else
      {
        PGLocalizedString(CFSTR("PLAY"));
        v138 = objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }
      v49 = -[PGControlsViewModel isInterrupted](self, "isInterrupted");
      v13 = 0;
      v29 = !v49;
      if (v5 > 0.0)
      {
        v50 = !v49;
        v132 = v32;
        v51 = 0;
        goto LABEL_43;
      }
      v20 = 0;
      v21 = 0;
      v24 = CFSTR("gobackward.10");
      v22 = 1;
      v28 = 1;
      v30 = 0;
      v31 = 0;
      v140 = 1;
      v36 = 0;
      v23 = CFSTR("goforward.10");
      v34 = (void *)v145;
      v17 = (void *)v147;
      v18 = v138;
      v25 = v134;
      v14 = v136;
      v27 = v44;
      v35 = v143;
      v33 = v37;
      break;
    case 1:
      v132 = (v12 == 1) & ~-[PGControlsViewModel isInterrupted](self, "isInterrupted", 0, 1, 0, 0, 0, 0);
      PGLocalizedString(CFSTR("SKIP_FORWARD_10_SECONDS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PGLocalizedString(CFSTR("SKIP_BACK_10_SECONDS"));
      v26 = ((v10 | v8) & 1) == 0;
      v19 = v12 == 2;
      v136 = !v10;
      v147 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v138 = 0;
        v38 = CFSTR("play.slash.fill");
      }
      else if (v12)
      {
        if ((v8 & 1) != 0)
        {
          PGLocalizedString(CFSTR("STOP"));
          v138 = objc_claimAutoreleasedReturnValue();
          v38 = CFSTR("stop.fill");
        }
        else
        {
          PGLocalizedString(CFSTR("PAUSE"));
          v138 = objc_claimAutoreleasedReturnValue();
          v38 = CFSTR("pause.fill");
        }
      }
      else
      {
        PGLocalizedString(CFSTR("PLAY"));
        v138 = objc_claimAutoreleasedReturnValue();
        v38 = CFSTR("play.fill");
      }
      v134 = v38;
      v145 = 0;
      v149 = 0;
      v50 = !-[PGControlsViewModel isInterrupted](self, "isInterrupted");
      v51 = 1;
      v141 = v26;
      v143 = 1;
      v148 = 1;
LABEL_43:
      -[PGControlsViewModel playbackState](self, "playbackState");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "hasInvalidTiming");

      if ((v53 & 1) != 0)
      {
        v13 = 0;
        v20 = 0;
        v21 = 0;
        v36 = 0;
      }
      else
      {
        -[PGControlsViewModel playbackState](self, "playbackState");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "timeControlStatus") == 2;

        v36 = v55;
        v13 = 0;
        v20 = 0;
        v21 = 0;
      }
      v24 = CFSTR("gobackward.10");
      v22 = 1;
      v28 = 1;
      v31 = 1;
      v140 = 1;
      v23 = CFSTR("goforward.10");
      v34 = (void *)v145;
      v17 = (void *)v147;
      v18 = v138;
      v25 = v134;
      v14 = v136;
      v32 = v132;
      v27 = v141;
      v35 = v143;
      v33 = v149;
      v29 = v50;
      v30 = v51;
      break;
    case 2:
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor", 0, 1, 0, 0, 0, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor", 0, 1, 0, 0, 0, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
        v40 = objc_claimAutoreleasedReturnValue();
      }
      -[PGControlsViewModel playbackState](self, "playbackState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "cameraHasMicrophone");

      v148 = v46;
      if ((objc_msgSend(v154, "isMuted") & 1) != 0)
        v47 = CFSTR("UNMUTE");
      else
        v47 = CFSTR("MUTE");
      PGLocalizedString(v47);
      v18 = objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v21 = (void *)v39;
      v15 = 0;
      v17 = 0;
      v19 = 0;
      v23 = 0;
      v24 = 0;
      v26 = 0;
      v27 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v35 = 0;
      v36 = 0;
      v13 = 1;
      v22 = 1;
      v14 = 1;
      v28 = 1;
      v29 = 1;
      v140 = 1;
      v25 = CFSTR("mic.fill");
      v20 = (void *)v40;
      break;
    case 3:
    case 4:
      break;
    case 5:
      v34 = 0;
      v15 = 0;
      v17 = 0;
      v18 = 0;
      v13 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v35 = 0;
      v148 = 0;
      v140 = 0;
      v36 = 0;
      v22 = 1;
      break;
    default:
      v15 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 1;
      v29 = 1;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v148 = 0;
      v140 = 0;
      v36 = 0;
      break;
  }
  v144 = v35;
  v150 = v33;
  v133 = v32;
  v142 = v27;
  v137 = v14;
  v123 = v26;
  v124 = v29;
  v125 = v28;
  v126 = v31;
  v151 = v36;
  v135 = (__CFString *)v25;
  v127 = v21;
  v128 = v20;
  v146 = v34;
  v129 = v23;
  v130 = v24;
  v56 = v17;
  v57 = (void *)v18;
  v58 = v30;
  -[PGControlsViewModel values](self, "values");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setValue:forKey:", v60, CFSTR("controlsShouldAutoHide"));

  -[PGControlsViewModel values](self, "values");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setValue:forKey:", v153, CFSTR("restoreButtonAccessibilityIdentifier"));

  -[PGControlsViewModel values](self, "values");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setValue:forKey:", v152, CFSTR("cancelButtonAccessibilityIdentifier"));

  -[PGControlsViewModel values](self, "values");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v57;
  objc_msgSend(v63, "setValue:forKey:", v57, CFSTR("actionButtonAccessibilityIdentifier"));

  -[PGControlsViewModel values](self, "values");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setValue:forKey:", v56, CFSTR("skipBackButtonAccessibilityIdentifier"));

  -[PGControlsViewModel values](self, "values");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setValue:forKey:", v15, CFSTR("skipForwardButtonAccessibilityIdentifier"));

  -[PGControlsViewModel values](self, "values");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setValue:forKey:", v67, CFSTR("includesLiveIndicatorBadge"));

  -[PGControlsViewModel values](self, "values");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v140);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setValue:forKey:", v69, CFSTR("includesRestoreButton"));

  -[PGControlsViewModel values](self, "values");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setValue:forKey:", v71, CFSTR("includesCancelButton"));

  -[PGControlsViewModel values](self, "values");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v148);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setValue:forKey:", v73, CFSTR("includesActionButton"));

  -[PGControlsViewModel values](self, "values");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v144);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setValue:forKey:", v75, CFSTR("includesSkipBackButton"));

  -[PGControlsViewModel values](self, "values");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v144);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setValue:forKey:", v77, CFSTR("includesSkipForwardButton"));

  -[PGControlsViewModel values](self, "values");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v150);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setValue:forKey:", v79, CFSTR("includesContentLoadingIndicator"));

  -[PGControlsViewModel values](self, "values");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v133);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setValue:forKey:", v81, CFSTR("includesWaitingToPlayIndicator"));

  -[PGControlsViewModel values](self, "values");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v142);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setValue:forKey:", v83, CFSTR("isSkipBackButtonEnabled"));

  -[PGControlsViewModel values](self, "values");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v137);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setValue:forKey:", v85, CFSTR("isActionButtonEnabled"));

  -[PGControlsViewModel values](self, "values");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v123);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setValue:forKey:", v87, CFSTR("isSkipForwardButtonEnabled"));

  -[PGControlsViewModel values](self, "values");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v124);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setValue:forKey:", v89, CFSTR("includesSingleTapGestureRecognizer"));

  -[PGControlsViewModel values](self, "values");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v125);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setValue:forKey:", v91, CFSTR("includesDoubleTapGestureRecognizer"));

  -[PGControlsViewModel values](self, "values");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v125);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setValue:forKey:", v93, CFSTR("includesDoubleDoubleTapGestureRecognizer"));

  -[PGControlsViewModel values](self, "values");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v126);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setValue:forKey:", v95, CFSTR("includesProgressBar"));

  -[PGControlsViewModel values](self, "values");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v151);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setValue:forKey:", v97, CFSTR("progressBarShouldUpdate"));

  -[PGControlsViewModel values](self, "values");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setValue:forKey:", v135, CFSTR("actionButtonSystemImageName"));

  -[PGControlsViewModel values](self, "values");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setValue:forKey:", v127, CFSTR("actionButtonImageTintColor"));

  -[PGControlsViewModel values](self, "values");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setValue:forKey:", v128, CFSTR("actionButtonBackgroundTintColor"));

  -[PGControlsViewModel values](self, "values");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setValue:forKey:", 0, CFSTR("skipBackButtonImageTintColor"));

  -[PGControlsViewModel values](self, "values");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setValue:forKey:", 0, CFSTR("skipBackButtonBackgroundTintColor"));

  -[PGControlsViewModel values](self, "values");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setValue:forKey:", 0, CFSTR("skipForwardButtonImageTintColor"));

  -[PGControlsViewModel values](self, "values");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setValue:forKey:", 0, CFSTR("skipForwardButtonBackgroundTintColor"));

  -[PGControlsViewModel values](self, "values");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setValue:forKey:", 0, CFSTR("cancelButtonImageTintColor"));

  -[PGControlsViewModel values](self, "values");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setValue:forKey:", 0, CFSTR("cancelButtonBackgroundTintColor"));

  -[PGControlsViewModel values](self, "values");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setValue:forKey:", v129, CFSTR("skipForwardButtonSystemImageName"));

  -[PGControlsViewModel values](self, "values");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setValue:forKey:", v130, CFSTR("skipBackButtonSystemImageName"));

  -[PGControlsViewModel values](self, "values");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setValue:forKey:", CFSTR("xmark"), CFSTR("cancelButtonSystemImageName"));

  -[PGControlsViewModel values](self, "values");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setValue:forKey:", v146, CFSTR("prerollAttributes"));

  -[PGControlsViewModel values](self, "values");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setValue:forKey:", v112, CFSTR("cancelButtonWantsBackground"));

  -[PGControlsViewModel values](self, "values");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setValue:forKey:", v114, CFSTR("restoreButtonWantsBackground"));

  -[PGControlsViewModel values](self, "values");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setValue:forKey:", v116, CFSTR("actionButtonsWantBackground"));

  -[PGControlsViewModel values](self, "values");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setValue:forKey:", 0, CFSTR("cancelButtonCustomText"));

  -[PGControlsViewModel values](self, "values");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setValue:forKey:", 0, CFSTR("cancelButtonCustomImage"));

  v119 = 0;
  if (!v151)
    v119 = self->_lastKnownElapsedTime != v7;
  self->_lastKnownElapsedTime = v7;
  -[PGControlsViewModel values](self, "values");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v131, "isEqual:", v120);

  if (!v121 || v119)
  {
    -[PGControlsViewModel delegate](self, "delegate");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "controlsViewModel:valuesChangedFromOldValue:", self, v131);

  }
}

- (PGControlsViewModelDelegate)delegate
{
  return (PGControlsViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PGPlaybackState)playbackState
{
  return self->_playbackState;
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (BOOL)isInActivitySession
{
  return self->_inActivitySession;
}

- (PGControlsViewModelValues)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updatePlaybackStateWithDiff:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "playbackState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1B0CD6000, a2, v4, "playback state after updates: %@", (uint8_t *)&v5);

}

- (void)updatePlaybackStateWithDiff:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B0CD6000, a2, a3, "updatePlaybackStateWithDiff: %@", (uint8_t *)&v3);
}

@end
