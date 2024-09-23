@implementation SOSVoiceLoopAnalyticsReporter

- (SOSVoiceLoopAnalyticsReporter)initWithReason:(int64_t)a3 language:(id)a4 dtmfAvailable:(BOOL)a5
{
  __CFString *v8;
  SOSVoiceLoopAnalyticsReporter *v9;
  SOSVoiceLoopAnalyticsReporter *v10;
  __CFString *v11;
  uint64_t v12;
  NSDate *loopStartDate;
  VLAR_DTMFEventsAccumulator *v14;
  VLAR_DTMFEventsAccumulator *dtmfEventAccumulator;
  VLAR_DTMFCommandsAccumulator *v16;
  VLAR_DTMFCommandsAccumulator *dtmfCommandsAccumulator;
  VLAR_DTMFActionsAccumulator *v18;
  VLAR_DTMFActionsAccumulator *dtmfActionsAccumulator;
  NSString *capture_FirstDTMFDigit;
  objc_super v22;

  v8 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)SOSVoiceLoopAnalyticsReporter;
  v9 = -[SOSVoiceLoopAnalyticsReporter init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_voiceLoopReason = a3;
    if (v8)
      v11 = v8;
    else
      v11 = CFSTR("Unknown");
    objc_storeStrong((id *)&v9->_language, v11);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = objc_claimAutoreleasedReturnValue();
    loopStartDate = v10->_loopStartDate;
    v10->_loopStartDate = (NSDate *)v12;

    v10->_state.dtmfAvailable = a5;
    v14 = objc_alloc_init(VLAR_DTMFEventsAccumulator);
    dtmfEventAccumulator = v10->_dtmfEventAccumulator;
    v10->_dtmfEventAccumulator = v14;

    v16 = objc_alloc_init(VLAR_DTMFCommandsAccumulator);
    dtmfCommandsAccumulator = v10->_dtmfCommandsAccumulator;
    v10->_dtmfCommandsAccumulator = v16;

    v18 = objc_alloc_init(VLAR_DTMFActionsAccumulator);
    dtmfActionsAccumulator = v10->_dtmfActionsAccumulator;
    v10->_dtmfActionsAccumulator = v18;

    capture_FirstDTMFDigit = v10->_capture_FirstDTMFDigit;
    v10->_capture_FirstDTMFDigit = (NSString *)&stru_1E5F76FF8;

    v10->_capture_Loop_StoppedBy = 0;
  }

  return v10;
}

- (double)_elapsedSeconds
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_loopStartDate);
  v5 = v4;

  return v5;
}

- (void)reportVoiceLoopWillStopLocally
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  sos_vlar_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillStopLocally", v5, 2u);
  }

  v4 = -[SOSVoiceLoopAnalyticsReporter _newEventReportWithTrigger:](self, "_newEventReportWithTrigger:", CFSTR("LoopStoppedLocally"));
  -[SOSVoiceLoopAnalyticsReporter _noteLoopStoppedBy:eventReport:](self, "_noteLoopStoppedBy:eventReport:", 1, v4);
  -[SOSVoiceLoopAnalyticsReporter _submitReport:](self, "_submitReport:", v4);

}

- (void)reportVoiceLoopWillTerminate
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  sos_vlar_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillTerminate", v5, 2u);
  }

  v4 = -[SOSVoiceLoopAnalyticsReporter _newEventReportWithTrigger:](self, "_newEventReportWithTrigger:", CFSTR("SessionEnded"));
  -[SOSVoiceLoopAnalyticsReporter _submitReport:](self, "_submitReport:", v4);

}

- (void)_noteLoopStoppedBy:(unint64_t)a3 eventReport:(id)a4
{
  id v6;
  NSObject *v7;
  unint64_t *p_capture_Loop_StoppedBy;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  NSObject *v18;
  unint64_t capture_Loop_CompletedIterations;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  sos_vlar_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a3;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_INFO, "_noteLoopStoppedBy:%tu", buf, 0xCu);
  }

  p_capture_Loop_StoppedBy = &self->_capture_Loop_StoppedBy;
  if (self->_capture_Loop_StoppedBy)
  {
    sos_vlar_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOSVoiceLoopAnalyticsReporter _noteLoopStoppedBy:eventReport:].cold.1((uint64_t)p_capture_Loop_StoppedBy, v9, v10, v11, v12, v13, v14, v15);
LABEL_14:

    goto LABEL_15;
  }
  if (!v6 || (objc_msgSend(v6, "state"), v24 != 100))
  {
    sos_vlar_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v6)
      {
        objc_msgSend(v6, "state");
        v20 = v21;
      }
      else
      {
        v20 = 0;
      }
      *(_DWORD *)buf = 134217984;
      v26 = v20;
      _os_log_error_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_ERROR, "_noteLoopStoppedBy but unexpected playbackState:%tu", buf, 0xCu);
    }
    goto LABEL_14;
  }
  sos_vlar_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a3;
    _os_log_impl(&dword_1AF4DC000, v16, OS_LOG_TYPE_DEFAULT, "_noteLoopStoppedBy:%tu, capturing", buf, 0xCu);
  }

  self->_capture_Loop_StoppedBy = a3;
  objc_msgSend(v6, "state");
  self->_capture_Loop_StoppedAt_Iteration = v23;
  objc_msgSend(v6, "state");
  self->_capture_Loop_StoppedAt_Phase = v22;
  objc_msgSend(v6, "elapsedSeconds");
  self->_capture_Loop_StoppedAt_Seconds = v17;
  self->_capture_Loop_CompletedIterations = self->_capture_Loop_StoppedAt_Iteration - 1;
  sos_vlar_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    capture_Loop_CompletedIterations = self->_capture_Loop_CompletedIterations;
    *(_DWORD *)buf = 134217984;
    v26 = capture_Loop_CompletedIterations;
    _os_log_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_DEFAULT, "Reporting SOS loop played %lu times", buf, 0xCu);
  }

  +[SOSCoreAnalyticsReporter reportSOSNumberOfVoiceLoops:](SOSCoreAnalyticsReporter, "reportSOSNumberOfVoiceLoops:", self->_capture_Loop_CompletedIterations);
LABEL_15:

}

- (void)_noteLoopInternalResumed
{
  NSObject *v3;
  uint8_t v4[16];

  sos_vlar_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "_noteLoopInternalResumed", v4, 2u);
  }

  self->_capture_Loop_StoppedBy = 0;
}

- (void)reportVoiceLoopPlaybackStateChanged:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopPlaybackStateChanged:%zd", (uint8_t *)&v6, 0xCu);
  }

  self->_state.playbackState = a3;
}

- (void)reportVoiceLoopIndexChanged:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopIndexChanged:%tu", (uint8_t *)&v6, 0xCu);
  }

  self->_state.loopIteration = a3;
}

- (void)reportVoiceLoopLoopPhaseChanged:(unint64_t)a3
{
  NSObject *v5;
  double v6;
  double v7;
  NSObject *v8;
  double capture_FirstLoopSilence_Seconds;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopLoopPhaseChanged:%zd", (uint8_t *)&v10, 0xCu);
  }

  self->_state.loopPhase = a3;
  -[SOSVoiceLoopAnalyticsReporter capture_FirstLoopSilence_Seconds](self, "capture_FirstLoopSilence_Seconds");
  if (a3 == 10000 && v6 <= 0.0 && self->_state.playbackState == 100)
  {
    -[SOSVoiceLoopAnalyticsReporter _elapsedSeconds](self, "_elapsedSeconds");
    self->_capture_FirstLoopSilence_Seconds = v7;
    sos_vlar_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      capture_FirstLoopSilence_Seconds = self->_capture_FirstLoopSilence_Seconds;
      v10 = 134217984;
      v11 = *(_QWORD *)&capture_FirstLoopSilence_Seconds;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "_capture_FirstLoopSilence_Seconds:%0.3f", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)reportVoiceLoopDidStartHandlingDTMFDigitReceived:(char)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  double v10;
  void *v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67240192;
    v16 = v3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c", (uint8_t *)&v15, 8u);
  }

  -[VLAR_DTMFEventsAccumulator noteDidReceiveDTMFDigit:](self->_dtmfEventAccumulator, "noteDidReceiveDTMFDigit:", v3);
  _NSStringFromDTMFDigitChar(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DTMF-"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SOSVoiceLoopAnalyticsReporter _newEventReportWithTrigger:](self, "_newEventReportWithTrigger:", v7);
  -[SOSVoiceLoopAnalyticsReporter setActiveDTMFEventReport:](self, "setActiveDTMFEventReport:", v8);

  if (!-[NSString length](self->_capture_FirstDTMFDigit, "length"))
  {
    objc_storeStrong((id *)&self->_capture_FirstDTMFDigit, v6);
    sos_vlar_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67240192;
      v16 = v3;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c => _capture_FirstDTMFDigit", (uint8_t *)&v15, 8u);
    }

  }
  -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFDigit_Seconds](self, "capture_FirstDTMFDigit_Seconds");
  if (v10 <= 0.0)
  {
    -[SOSVoiceLoopAnalyticsReporter activeDTMFEventReport](self, "activeDTMFEventReport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elapsedSeconds");
    self->_capture_FirstDTMFDigit_Seconds = v12;

    sos_vlar_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFDigit_Seconds](self, "capture_FirstDTMFDigit_Seconds");
      v15 = 67240448;
      v16 = v3;
      v17 = 2048;
      v18 = v14;
      _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c => capture_FirstDTMFDigit_Seconds:%0.3f", (uint8_t *)&v15, 0x12u);
    }

  }
}

- (void)reportVoiceLoopDidReceiveCommand:(unint64_t)a3
{
  NSObject *v5;
  VLAR_DTMFCommandsAccumulator *dtmfCommandsAccumulator;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  double v24;
  uint64_t v25;
  uint32_t v26;
  double v27;
  double capture_FirstDTMFCommand_Seconds;
  double v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  double v35;
  double capture_FirstRepeatCommand_Seconds;
  uint64_t v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v39 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidReceiveCommand:%zd", buf, 0xCu);
  }

  dtmfCommandsAccumulator = self->_dtmfCommandsAccumulator;
  -[SOSVoiceLoopAnalyticsReporter state](self, "state");
  -[VLAR_DTMFCommandsAccumulator noteDidReceiveDTMFCommand:withPlaybackState:](dtmfCommandsAccumulator, "noteDidReceiveDTMFCommand:withPlaybackState:", a3, v37);
  -[SOSVoiceLoopAnalyticsReporter activeDTMFEventReport](self, "activeDTMFEventReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    sos_vlar_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopDidReceiveCommand:].cold.1(a3, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_28;
  }
  if (objc_msgSend(v7, "command"))
  {
    sos_vlar_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopDidReceiveCommand:].cold.2(v8);

  }
  else
  {
    objc_msgSend(v8, "setCommand:", a3);
  }
  -[VLAR_DTMFCommandsAccumulator reportedCommands](self->_dtmfCommandsAccumulator, "reportedCommands");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "indexOfObject:", v18);

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sos_vlar_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    *(_DWORD *)buf = 134217984;
    v39 = a3;
    v21 = "reportVoiceLoopDidReceiveCommand:%tu command not reportable, ignoring for capture";
    v22 = v20;
    v23 = OS_LOG_TYPE_INFO;
  }
  else
  {
    -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFCommand_Seconds](self, "capture_FirstDTMFCommand_Seconds");
    if (v24 > 0.0)
    {
      sos_vlar_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFCommand_Seconds](self, "capture_FirstDTMFCommand_Seconds");
      *(_DWORD *)buf = 134218240;
      v39 = a3;
      v40 = 2048;
      v41 = v25;
      v21 = "reportVoiceLoopDidReceiveCommand:%tu but already have capture_FirstDTMFCommand_Seconds:%0.3f, ignoring";
      v22 = v20;
      v23 = OS_LOG_TYPE_INFO;
      v26 = 22;
      goto LABEL_20;
    }
    objc_msgSend(v8, "elapsedSeconds");
    self->_capture_FirstDTMFCommand_Seconds = v27;
    sos_vlar_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    capture_FirstDTMFCommand_Seconds = self->_capture_FirstDTMFCommand_Seconds;
    *(_DWORD *)buf = 134217984;
    v39 = *(_QWORD *)&capture_FirstDTMFCommand_Seconds;
    v21 = "_capture_FirstDTMFCommand_Seconds:%0.3f";
    v22 = v20;
    v23 = OS_LOG_TYPE_DEFAULT;
  }
  v26 = 12;
LABEL_20:
  _os_log_impl(&dword_1AF4DC000, v22, v23, v21, buf, v26);
LABEL_21:

  if (a3 == 200)
  {
    -[SOSVoiceLoopAnalyticsReporter capture_FirstRepeatCommand_Seconds](self, "capture_FirstRepeatCommand_Seconds");
    if (v29 <= 0.0)
    {
      objc_msgSend(v8, "elapsedSeconds");
      self->_capture_FirstRepeatCommand_Seconds = v35;
      sos_vlar_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        capture_FirstRepeatCommand_Seconds = self->_capture_FirstRepeatCommand_Seconds;
        *(_DWORD *)buf = 134217984;
        v39 = *(_QWORD *)&capture_FirstRepeatCommand_Seconds;
        v31 = "_capture_FirstRepeatCommand_Seconds:%0.3f";
        v32 = v10;
        v33 = OS_LOG_TYPE_DEFAULT;
        v34 = 12;
        goto LABEL_27;
      }
    }
    else
    {
      sos_vlar_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[SOSVoiceLoopAnalyticsReporter capture_FirstRepeatCommand_Seconds](self, "capture_FirstRepeatCommand_Seconds");
        *(_DWORD *)buf = 134218240;
        v39 = 200;
        v40 = 2048;
        v41 = v30;
        v31 = "reportVoiceLoopDidReceiveCommand:%tu but already have capture_FirstRepeatCommand_Seconds:%0.3f, ignoring";
        v32 = v10;
        v33 = OS_LOG_TYPE_INFO;
        v34 = 22;
LABEL_27:
        _os_log_impl(&dword_1AF4DC000, v32, v33, v31, buf, v34);
      }
    }
LABEL_28:

  }
}

- (void)reportVoiceLoopWillPerformAction:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillPerformAction:%zd", (uint8_t *)&v16, 0xCu);
  }

  -[VLAR_DTMFActionsAccumulator noteDTMFAction:](self->_dtmfActionsAccumulator, "noteDTMFAction:", a3);
  -[SOSVoiceLoopAnalyticsReporter activeDTMFEventReport](self, "activeDTMFEventReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    sos_vlar_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopWillPerformAction:].cold.1(a3, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "action"))
  {
    sos_vlar_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopWillPerformAction:].cold.2(v7);
LABEL_9:

    goto LABEL_11;
  }
  objc_msgSend(v7, "setAction:", a3);
LABEL_11:
  if (a3 == 5000)
  {
    -[SOSVoiceLoopAnalyticsReporter _noteLoopInternalResumed](self, "_noteLoopInternalResumed");
  }
  else if (a3 == 100)
  {
    -[SOSVoiceLoopAnalyticsReporter activeDTMFEventReport](self, "activeDTMFEventReport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSVoiceLoopAnalyticsReporter _noteLoopStoppedBy:eventReport:](self, "_noteLoopStoppedBy:eventReport:", 2, v15);

  }
}

- (void)reportVoiceLoopDidFinishHandlingDTMFDigitReceived:(char)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidFinishHandlingDTMFDigitReceived:%{public}c", (uint8_t *)v7, 8u);
  }

  -[SOSVoiceLoopAnalyticsReporter activeDTMFEventReport](self, "activeDTMFEventReport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceLoopAnalyticsReporter _submitReport:](self, "_submitReport:", v6);

  -[SOSVoiceLoopAnalyticsReporter setActiveDTMFEventReport:](self, "setActiveDTMFEventReport:", 0);
}

- (void)reportVoiceLoopSupportsDTMF:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  unint64_t capture_DTMFAvail_FirstTrue_LoopIteration;
  const char *v8;
  unint64_t capture_DTMFAvail_FirstFalse_LoopIteration;
  uint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_INFO, "reportVoiceLoopSupportsDTMF:%{BOOL}d", buf, 8u);
  }

  if (v3)
  {
    if (-[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstTrue_LoopIteration](self, "capture_DTMFAvail_FirstTrue_LoopIteration"))
    {
      goto LABEL_12;
    }
    -[SOSVoiceLoopAnalyticsReporter state](self, "state");
    self->_capture_DTMFAvail_FirstTrue_LoopIteration = v13;
    sos_vlar_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    capture_DTMFAvail_FirstTrue_LoopIteration = self->_capture_DTMFAvail_FirstTrue_LoopIteration;
    *(_DWORD *)buf = 134217984;
    v15 = capture_DTMFAvail_FirstTrue_LoopIteration;
    v8 = "_capture_DTMFAvail_FirstTrue_LoopIteration:%tu";
    goto LABEL_10;
  }
  if (-[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstFalse_LoopIteration](self, "capture_DTMFAvail_FirstFalse_LoopIteration"))
  {
    goto LABEL_12;
  }
  -[SOSVoiceLoopAnalyticsReporter state](self, "state");
  self->_capture_DTMFAvail_FirstFalse_LoopIteration = v12;
  sos_vlar_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    capture_DTMFAvail_FirstFalse_LoopIteration = self->_capture_DTMFAvail_FirstFalse_LoopIteration;
    *(_DWORD *)buf = 134217984;
    v15 = capture_DTMFAvail_FirstFalse_LoopIteration;
    v8 = "_capture_DTMFAvail_FirstFalse_LoopIteration:%tu";
LABEL_10:
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
  }
LABEL_11:

LABEL_12:
  if (self->_state.dtmfAvailable != v3)
  {
    self->_state.dtmfAvailable = v3;
    v10 = 168;
    if (v3)
      v10 = 160;
    ++*(Class *)((char *)&self->super.isa + v10);
    v11 = -[SOSVoiceLoopAnalyticsReporter _newEventReportWithTrigger:](self, "_newEventReportWithTrigger:", CFSTR("DTMFEnabledChanged"));
    -[SOSVoiceLoopAnalyticsReporter _submitReport:](self, "_submitReport:", v11);

  }
}

- (id)_newEventReportWithTrigger:(id)a3
{
  id v4;
  VLAR_DTMFEventReport *v5;
  VLAR_DTMFEventReport *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  v5 = [VLAR_DTMFEventReport alloc];
  -[SOSVoiceLoopAnalyticsReporter state](self, "state");
  v6 = -[VLAR_DTMFEventReport initWithTrigger:state:loopStartDate:](v5, "initWithTrigger:state:loopStartDate:", v4, &v9, self->_loopStartDate);

  -[SOSVoiceLoopAnalyticsReporter language](self, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VLAR_DTMFEventReport setLanguage:](v6, "setLanguage:", v7);

  -[VLAR_DTMFEventReport setVoiceLoopReason:](v6, "setVoiceLoopReason:", -[SOSVoiceLoopAnalyticsReporter voiceLoopReason](self, "voiceLoopReason"));
  return v6;
}

- (void)_submitReport:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[14];
  _QWORD v58[14];
  _QWORD v59[10];
  _QWORD v60[10];
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_vlar_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_submitReport:%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = CFSTR("event_Trigger");
  objc_msgSend(v4, "trigger");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v49;
  v59[1] = CFSTR("event_ElapsedSeconds");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "elapsedSeconds");
  objc_msgSend(v6, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v47;
  v59[2] = CFSTR("event_SOSVoiceLanguage");
  objc_msgSend(v4, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v7;
  v59[3] = CFSTR("event_SOSVoiceEventVariant");
  v8 = objc_msgSend(v4, "voiceLoopReason");
  if (v8 > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E5F76B50[v8];
  v60[3] = v9;
  v59[4] = CFSTR("event_PlaybackState");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  if (v4)
  {
    objc_msgSend(v4, "state");
    v11 = v56;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v12;
  v59[5] = CFSTR("event_LoopIteration");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  if (v4)
  {
    objc_msgSend(v4, "state");
    v14 = v55;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v15;
  v59[6] = CFSTR("event_LoopPhase");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (v4)
  {
    objc_msgSend(v4, "state");
    v17 = v54;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v16, "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v18;
  v59[7] = CFSTR("event_DTMFAvailable");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  if (v4)
  {
    objc_msgSend(v4, "state");
    v20 = v53 != 0;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v19, "numberWithBool:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v21;
  v59[8] = CFSTR("event_DTMFCommand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "command"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v22;
  v59[9] = CFSTR("event_DTMFAction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "action"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v57[0] = CFSTR("capture_FirstDTMFDigit");
  -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFDigit](self, "capture_FirstDTMFDigit");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v50;
  v57[1] = CFSTR("capture_FirstDTMFDigit_Seconds");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFDigit_Seconds](self, "capture_FirstDTMFDigit_Seconds");
  objc_msgSend(v24, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v48;
  v57[2] = CFSTR("capture_FirstDTMFCommand_Seconds");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceLoopAnalyticsReporter capture_FirstDTMFCommand_Seconds](self, "capture_FirstDTMFCommand_Seconds");
  objc_msgSend(v25, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v46;
  v57[3] = CFSTR("capture_FirstLoopSilence_Seconds");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceLoopAnalyticsReporter capture_FirstLoopSilence_Seconds](self, "capture_FirstLoopSilence_Seconds");
  objc_msgSend(v26, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v45;
  v57[4] = CFSTR("capture_Loop_StoppedBy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedBy](self, "capture_Loop_StoppedBy"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v44;
  v57[5] = CFSTR("capture_Loop_StoppedAt_Iteration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedAt_Iteration](self, "capture_Loop_StoppedAt_Iteration"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v43;
  v57[6] = CFSTR("capture_Loop_StoppedAt_Phase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedAt_Phase](self, "capture_Loop_StoppedAt_Phase"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v42;
  v57[7] = CFSTR("capture_Loop_StoppedAt_Seconds");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedAt_Seconds](self, "capture_Loop_StoppedAt_Seconds");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v28;
  v57[8] = CFSTR("capture_Loop_CompletedIterations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_CompletedIterations](self, "capture_Loop_CompletedIterations"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v29;
  v57[9] = CFSTR("capture_FirstRepeatCommand_Seconds");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[SOSVoiceLoopAnalyticsReporter capture_FirstRepeatCommand_Seconds](self, "capture_FirstRepeatCommand_Seconds");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v31;
  v57[10] = CFSTR("capture_DTMFAvail_FirstTrue_LoopIteration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstTrue_LoopIteration](self, "capture_DTMFAvail_FirstTrue_LoopIteration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v32;
  v57[11] = CFSTR("capture_DTMFAvail_FirstFalse_LoopIteration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstFalse_LoopIteration](self, "capture_DTMFAvail_FirstFalse_LoopIteration"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v33;
  v57[12] = CFSTR("nDTMFAvailNoToYes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter nDTMFAvailNoToYes](self, "nDTMFAvailNoToYes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[12] = v34;
  v57[13] = CFSTR("nDTMFAvailYesToNo");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter nDTMFAvailYesToNo](self, "nDTMFAvailYesToNo"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58[13] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "addEntriesFromDictionary:", v51);
  objc_msgSend(v52, "addEntriesFromDictionary:", v36);
  -[VLAR_DTMFEventsAccumulator analyticsDataDict](self->_dtmfEventAccumulator, "analyticsDataDict");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addEntriesFromDictionary:", v37);

  -[VLAR_DTMFCommandsAccumulator analyticsDataDict](self->_dtmfCommandsAccumulator, "analyticsDataDict");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addEntriesFromDictionary:", v38);

  -[VLAR_DTMFActionsAccumulator analyticsDataDict](self->_dtmfActionsAccumulator, "analyticsDataDict");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addEntriesFromDictionary:", v39);

  sos_vlar_log();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v52;
    _os_log_impl(&dword_1AF4DC000, v40, OS_LOG_TYPE_DEFAULT, "_submitReport => data:%{public}@", buf, 0xCu);
  }

  v41 = v52;
  AnalyticsSendEventLazy();

}

id __47__SOSVoiceLoopAnalyticsReporter__submitReport___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)voiceLoopReason
{
  return self->_voiceLoopReason;
}

- (NSString)language
{
  return self->_language;
}

- (VLAR_DTMFStateRecord)state
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].playbackState;
  *(_OWORD *)&retstr->playbackState = *(_OWORD *)&self[5].loopPhase;
  *(_OWORD *)&retstr->loopPhase = v3;
  return self;
}

- (void)setState:(VLAR_DTMFStateRecord *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->loopPhase;
  *(_OWORD *)&self->_state.playbackState = *(_OWORD *)&a3->playbackState;
  *(_OWORD *)&self->_state.loopPhase = v3;
}

- (VLAR_DTMFEventReport)activeDTMFEventReport
{
  return self->_activeDTMFEventReport;
}

- (void)setActiveDTMFEventReport:(id)a3
{
  objc_storeStrong((id *)&self->_activeDTMFEventReport, a3);
}

- (NSString)capture_FirstDTMFDigit
{
  return self->_capture_FirstDTMFDigit;
}

- (double)capture_FirstDTMFDigit_Seconds
{
  return self->_capture_FirstDTMFDigit_Seconds;
}

- (double)capture_FirstDTMFCommand_Seconds
{
  return self->_capture_FirstDTMFCommand_Seconds;
}

- (double)capture_FirstLoopSilence_Seconds
{
  return self->_capture_FirstLoopSilence_Seconds;
}

- (unint64_t)capture_Loop_StoppedBy
{
  return self->_capture_Loop_StoppedBy;
}

- (unint64_t)capture_Loop_StoppedAt_Iteration
{
  return self->_capture_Loop_StoppedAt_Iteration;
}

- (unint64_t)capture_Loop_StoppedAt_Phase
{
  return self->_capture_Loop_StoppedAt_Phase;
}

- (double)capture_Loop_StoppedAt_Seconds
{
  return self->_capture_Loop_StoppedAt_Seconds;
}

- (unint64_t)capture_Loop_CompletedIterations
{
  return self->_capture_Loop_CompletedIterations;
}

- (double)capture_FirstRepeatCommand_Seconds
{
  return self->_capture_FirstRepeatCommand_Seconds;
}

- (unint64_t)capture_DTMFAvail_FirstTrue_LoopIteration
{
  return self->_capture_DTMFAvail_FirstTrue_LoopIteration;
}

- (unint64_t)capture_DTMFAvail_FirstFalse_LoopIteration
{
  return self->_capture_DTMFAvail_FirstFalse_LoopIteration;
}

- (unint64_t)nDTMFAvailNoToYes
{
  return self->_nDTMFAvailNoToYes;
}

- (unint64_t)nDTMFAvailYesToNo
{
  return self->_nDTMFAvailYesToNo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capture_FirstDTMFDigit, 0);
  objc_storeStrong((id *)&self->_activeDTMFEventReport, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_dtmfActionsAccumulator, 0);
  objc_storeStrong((id *)&self->_dtmfCommandsAccumulator, 0);
  objc_storeStrong((id *)&self->_dtmfEventAccumulator, 0);
  objc_storeStrong((id *)&self->_loopStartDate, 0);
}

- (void)_noteLoopStoppedBy:(uint64_t)a3 eventReport:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "_noteLoopStoppedBy but already have capture_Loop_StoppedBy:%tu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)reportVoiceLoopDidReceiveCommand:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "reportVoiceLoopDidReceiveCommand:%tu with no activeDTMFEventReport", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)reportVoiceLoopDidReceiveCommand:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "command");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF4DC000, v1, v2, "reportVoiceLoopDidReceiveCommand:%tu but already have activeDTMFEventReport.command:%tu; only 1 command expected per"
    " activeDTMFEventReport",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_4_0();
}

- (void)reportVoiceLoopWillPerformAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "reportVoiceLoopWillPerformAction:%tu with no activeDTMFEventReport", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)reportVoiceLoopWillPerformAction:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "action");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1AF4DC000, v1, v2, "reportVoiceLoopWillPerformAction:%tu but already have activeDTMFEventReport.command:%tu; only 1 action expected per "
    "activeDTMFEventReport",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_4_0();
}

@end
