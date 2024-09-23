@implementation TIFeedbackController

- (TIFeedbackController)init
{
  TIFeedbackController *v2;
  uint64_t v3;
  NSString *studyID;
  uint64_t v5;
  NSString *preferenceName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIFeedbackController;
  v2 = -[TIFeedbackController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DBDB80], "getStudyID");
    v3 = objc_claimAutoreleasedReturnValue();
    studyID = v2->_studyID;
    v2->_studyID = (NSString *)v3;

    objc_msgSend(MEMORY[0x1E0DBDB80], "getPreferenceKey");
    v5 = objc_claimAutoreleasedReturnValue();
    preferenceName = v2->_preferenceName;
    v2->_preferenceName = (NSString *)v5;

  }
  return v2;
}

- (void)handleFeedbackStateNoneWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: action: initiate"), "-[TIFeedbackController handleFeedbackStateNoneWithDelegate:isEligibleDevice:]", self->_studyID);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(v6, "resetWordCounts");
    -[TIFeedbackController setInitiationState](self, "setInitiationState");
    -[TIFeedbackController scheduleInitiationEvent](self, "scheduleInitiationEvent");
    objc_msgSend(MEMORY[0x1E0DBDB80], "setStudyEnrollment");
  }

}

- (void)handleFeedbackStateInitiatedWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4 isPreferenceEnabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  TIFeedbackController *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: action: terminateIneligible"), "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v11 = self;
    v12 = 6;
    goto LABEL_18;
  }
  if (!v5)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: action: terminateInvalid"), "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v11 = self;
    v12 = 5;
LABEL_18:
    -[TIFeedbackController setTerminationStateWithValue:](v11, "setTerminationStateWithValue:", v12);
    -[TIFeedbackController dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:](self, "dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:", v8);
    goto LABEL_19;
  }
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: action: accumulateWordCounts"), "-[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:]", self->_studyID);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(v8, "accumulateWordCounts");
LABEL_19:

}

- (void)assessAndScheduleRetry
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DBDB80], "getFormIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__TIFeedbackController_assessAndScheduleRetry__block_invoke;
  v4[3] = &unk_1EA106FB8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D21188], "fetchCountsForFormWithIdentifier:completion:", v3, v4);

}

- (void)scheduleRetry
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: scheduling a retry"), "-[TIFeedbackController scheduleRetry]", self->_studyID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DBDB80], "shouldPublishCAEventsImmediately"))
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", 10.0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0DBDB80], "setRetryTimestamp:", v5);
  objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:", 8);

}

- (void)handleFeedbackStateCompletionPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  TIFeedbackController *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIFeedbackController scheduleSurveyRequestEvent](self, "scheduleSurveyRequestEvent");
  v7 = objc_msgSend(MEMORY[0x1E0DBDB80], "getSurveyOutcome");
  if (a4)
  {
    switch(v7)
    {
      case 4:
        if (IXACanLogMessageAtLevel())
        {
          IXAFeedbackLogFacility();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is submitted, device is eligible, will evaluate for plan retry if necessary"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v17;
            _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        -[TIFeedbackController assessAndScheduleRetry](self, "assessAndScheduleRetry");
        goto LABEL_30;
      case 5:
        if (!IXACanLogMessageAtLevel())
          goto LABEL_29;
        IXAFeedbackLogFacility();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is connection error, will plan retry"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        goto LABEL_32;
      case 6:
        if (IXACanLogMessageAtLevel())
        {
          IXAFeedbackLogFacility();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is state error, device is ineligble action: terminateInvalid"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v19;
            _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        goto LABEL_24;
      case 7:
        if (IXACanLogMessageAtLevel())
        {
          IXAFeedbackLogFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is launch error, will plan retry"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v14;
LABEL_32:
            _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
LABEL_28:

        }
LABEL_29:
        -[TIFeedbackController scheduleRetry](self, "scheduleRetry");
        goto LABEL_30;
      default:
        if (IXACanLogMessageAtLevel())
        {
          IXAFeedbackLogFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is unexpected as %ld: terminateInvalid"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID, v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v18;
            _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
LABEL_24:
        v10 = self;
        v11 = 5;
        break;
    }
  }
  else
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey outcome is %ld, device is ineligble action: terminateIneligible"), "-[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:]", self->_studyID, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v10 = self;
    v11 = 6;
  }
  -[TIFeedbackController setTerminationStateWithValue:](v10, "setTerminationStateWithValue:", v11);
  -[TIFeedbackController dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:](self, "dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:", v6);
LABEL_30:

}

- (void)retrySurvey
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB80], "getFormIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: retrying survey: %@"), "-[TIFeedbackController retrySurvey]", self->_studyID, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v5 = (void *)MEMORY[0x1E0D21188];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__TIFeedbackController_retrySurvey__block_invoke;
  v8[3] = &unk_1EA107008;
  v8[4] = self;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "fetchCountsForFormWithIdentifier:completion:", v6, v8);

}

- (void)handleFeedbackStateRetryPendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB80], "getRetryTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v5) != -1)
    -[TIFeedbackController retrySurvey](self, "retrySurvey");

}

- (void)handleFeedbackStateResponsePendingWithDelegate:(id)a3 isEligibleDevice:(BOOL)a4
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DBDB80], "getFormIdentifier", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__TIFeedbackController_handleFeedbackStateResponsePendingWithDelegate_isEligibleDevice___block_invoke;
  v6[3] = &unk_1EA106FB8;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D21188], "fetchCountsForFormWithIdentifier:completion:", v5, v6);

}

- (BOOL)isFCSBuild
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  return !TI_IS_INTERNAL_INSTALL::is_internal_install
      || (objc_msgSend(MEMORY[0x1E0DBDB80], "isFeatureEnabledForInternalBuilds") & 1) == 0;
}

- (void)handleFeedbackActionsWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[16];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TIFeedbackController isFCSBuild](self, "isFCSBuild"))
  {
    if (objc_msgSend(MEMORY[0x1E0DBDB80], "getFeedbackState"))
    {
      v5 = (void *)MEMORY[0x1E0DBDB80];
      -[TIFeedbackController currentInputModes](self, "currentInputModes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFinalInputModes:", v6);

      v7 = (void *)MEMORY[0x1E0DBDB80];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFinalTimestamp:", v8);

      objc_msgSend(MEMORY[0x1E0DBDB80], "setFinalPreferenceValue:", -[TIFeedbackController currentPreferenceValue](self, "currentPreferenceValue"));
      -[TIFeedbackController dispatchAllEventsWithDelegate:](self, "dispatchAllEventsWithDelegate:", v4);
      objc_msgSend(MEMORY[0x1E0DBDB80], "clearStudyState");
    }
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0DBDB80], "isEligibleDevice");
    v10 = objc_msgSend(MEMORY[0x1E0DBDB80], "getFeedbackState");
    v11 = -[TIFeedbackController currentPreferenceValue](self, "currentPreferenceValue");
    if (-[TIFeedbackController feedbackFeatureEnabled](self, "feedbackFeatureEnabled"))
    {
      if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_1EA107078;
        v18 = 0;
        KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      v12 = KeyboardSettingsFeedbackLibraryCore_frameworkLibrary != 0;
    }
    else
    {
      v12 = 0;
    }
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: enabled: %ld, eligible: %ld, state: %ld, preferenceEnabled: %ld"), "-[TIFeedbackController handleFeedbackActionsWithDelegate:]", self->_studyID, v12, v9, v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    if (v12)
    {
      -[TIFeedbackController dispatchScheduledEventsWithDelegate:overrideSchedule:](self, "dispatchScheduledEventsWithDelegate:overrideSchedule:", v4, 0);
      switch(v10)
      {
        case 0:
          -[TIFeedbackController handleFeedbackStateNoneWithDelegate:isEligibleDevice:](self, "handleFeedbackStateNoneWithDelegate:isEligibleDevice:", v4, v9);
          break;
        case 2:
          -[TIFeedbackController handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:](self, "handleFeedbackStateInitiatedWithDelegate:isEligibleDevice:isPreferenceEnabled:", v4, v9, v11);
          break;
        case 3:
          -[TIFeedbackController handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:](self, "handleFeedbackStateCompletionPendingWithDelegate:isEligibleDevice:", v4, v9);
          break;
        case 8:
          -[TIFeedbackController handleFeedbackStateRetryPendingWithDelegate:isEligibleDevice:](self, "handleFeedbackStateRetryPendingWithDelegate:isEligibleDevice:", v4, v9);
          break;
        case 9:
          -[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:](self, "handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:", v4, v9);
          break;
        default:
          if (IXACanLogMessageAtLevel())
          {
            IXASessionDetailsLogFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: action: none"), "-[TIFeedbackController handleFeedbackActionsWithDelegate:]", self->_studyID);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v16;
              _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
          }
          break;
      }
    }
  }

}

- (void)setInitiationState
{
  _BOOL8 v3;
  id v4;

  v3 = -[TIFeedbackController currentPreferenceValue](self, "currentPreferenceValue");
  if (!v3)
    -[TIFeedbackController setPreferenceValue:](self, "setPreferenceValue:", 1);
  -[TIFeedbackController currentInputModes](self, "currentInputModes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIFeedbackController initiateStudyWithInputModes:initialPreferenceValue:](self, "initiateStudyWithInputModes:initialPreferenceValue:", v4, v3);

}

- (void)initiateStudyWithInputModes:(id)a3 initialPreferenceValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DBDB80];
  v7 = a3;
  objc_msgSend(v6, "setFeedbackState:", 2);
  objc_msgSend(MEMORY[0x1E0DBDB80], "setInitialInputModes:", v7);

  v8 = (void *)MEMORY[0x1E0DBDB80];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInitialTimestamp:", v9);

  objc_msgSend(MEMORY[0x1E0DBDB80], "setInitialPreferenceValue:", v4);
  v10 = (void *)MEMORY[0x1E0DBDB80];
  objc_msgSend(MEMORY[0x1E0DBDB80], "getSupportedLangRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStudyLanguageAndRegion:", v11);

  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: set initiation state"), "-[TIFeedbackController initiateStudyWithInputModes:initialPreferenceValue:]", self->_studyID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

- (void)setTerminationStateWithValue:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:");
  v5 = (void *)MEMORY[0x1E0DBDB80];
  -[TIFeedbackController currentInputModes](self, "currentInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFinalInputModes:", v6);

  v7 = (void *)MEMORY[0x1E0DBDB80];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFinalTimestamp:", v8);

  objc_msgSend(MEMORY[0x1E0DBDB80], "setFinalPreferenceValue:", -[TIFeedbackController currentPreferenceValue](self, "currentPreferenceValue"));
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: set termination state with value:%ld"), "-[TIFeedbackController setTerminationStateWithValue:]", self->_studyID, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

- (BOOL)wasSurveySubmitted
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0DBDB80], "getSurveyOutcome");
  return v2 == 4 || v2 == 7;
}

- (void)scheduleInitiationEvent
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIFeedbackController computeRandomizedTimeIntervalFromTimestamp:](self, "computeRandomizedTimeIntervalFromTimestamp:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB80], "setInitiationEventTimestamp:", v4);
}

- (void)scheduleSurveyRequestEvent
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIFeedbackController computeRandomizedTimeIntervalFromTimestamp:](self, "computeRandomizedTimeIntervalFromTimestamp:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB80], "setRequestSurveyEventTimestamp:", v4);
}

- (void)scheduleCompletionEvent
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBDB80], "getFinalTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIFeedbackController computeRandomizedTimeIntervalFromTimestamp:](self, "computeRandomizedTimeIntervalFromTimestamp:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB80], "setCompletionEventTimestamp:", v4);
}

- (void)dispatchScheduledEventsWithDelegate:(id)a3 overrideSchedule:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  id v16;

  v4 = a4;
  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitiationEventTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "compare:", v6) == -1 || v4)
    {
      objc_msgSend(v16, "sendInitiationEventUsingStudyDataFromFeedbackController:", self);
      objc_msgSend(MEMORY[0x1E0DBDB80], "removeInitiationEventTimestamp");
    }
  }
  objc_msgSend(MEMORY[0x1E0DBDB80], "getRequestSurveyEventTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "compare:", v6) == -1 || v4)
    {
      objc_msgSend(v16, "sendRequestSurveyEventUsingStudyDataFromFeedbackController:", self);
      objc_msgSend(MEMORY[0x1E0DBDB80], "removeRequestSurveyEventTimestamp");
    }
  }
  objc_msgSend(MEMORY[0x1E0DBDB80], "getCompletionEventTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "compare:", v6) == -1 || v4)
    {
      objc_msgSend(v16, "sendCompletionEventUsingStudyDataFromFeedbackController:", self);
      objc_msgSend(MEMORY[0x1E0DBDB80], "removeCompletionEventTimestamp");
    }
  }

}

- (void)dispatchScheduledInitiationAndCompletionEventsImmediatelyWithDelegate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitiationEventTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "sendInitiationEventUsingStudyDataFromFeedbackController:", self);
    objc_msgSend(MEMORY[0x1E0DBDB80], "removeInitiationEventTimestamp");
  }
  objc_msgSend(v5, "sendCompletionEventUsingStudyDataFromFeedbackController:", self);
  objc_msgSend(MEMORY[0x1E0DBDB80], "removeCompletionEventTimestamp");

}

- (void)dispatchScheduledInitiationAndTerminationEventsImmediatelyWithDelegate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitiationEventTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "sendInitiationEventUsingStudyDataFromFeedbackController:", self);
    objc_msgSend(MEMORY[0x1E0DBDB80], "removeInitiationEventTimestamp");
  }
  objc_msgSend(v5, "sendTerminationEventUsingStudyDataFromFeedbackController:", self);

}

- (void)dispatchAllEventsWithDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[TIFeedbackController dispatchScheduledEventsWithDelegate:overrideSchedule:](self, "dispatchScheduledEventsWithDelegate:overrideSchedule:", v4, 1);
  objc_msgSend(v4, "sendUpgradeEventUsingStudyDataFromFeedbackController:", self);

}

- (id)computeRandomizedTimeIntervalFromTimestamp:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0DBDB80], "shouldPublishCAEventsImmediately"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", (double)arc4random() / 4294967300.0 * 432000.0 + 0.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)feedbackFeatureEnabled
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    return objc_msgSend(MEMORY[0x1E0DBDB80], "isFeatureEnabledForInternalBuilds");
  else
    return 0;
}

- (BOOL)currentPreferenceValue
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "BOOLForPreferenceKey:", self->_preferenceName);

  return (char)self;
}

- (void)setPreferenceValue:(BOOL)a3
{
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v4, "setValue:forPreferenceKey:", MEMORY[0x1E0C9AAB0], self->_preferenceName);
  }
  else
  {
    v5 = v4;
    TIDispatchSync();

  }
}

- (id)currentInputModes
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20834;
  v11 = __Block_byref_object_dispose__20835;
  v12 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enabledInputModeIdentifiers");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v8[5];
    v8[5] = v3;

  }
  else
  {
    TIDispatchSync();
  }
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceName, 0);
  objc_storeStrong((id *)&self->_studyID, 0);
}

void __41__TIFeedbackController_currentInputModes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledInputModeIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__TIFeedbackController_setPreferenceValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forPreferenceKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

void __88__TIFeedbackController_handleFeedbackStateResponsePendingWithDelegate_isEligibleDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
LABEL_4:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: error getting response from feedback service: %@"), "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
LABEL_16:
      _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(v5, "feedbackFiled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = IXACanLogMessageAtLevel();
    if (!v9)
    {
      if (!v10)
        goto LABEL_14;
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: retry is is still pending"), "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      goto LABEL_16;
    }
    if (v10)
    {
      IXAFeedbackLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey filed: complete"), "-[TIFeedbackController handleFeedbackStateResponsePendingWithDelegate:isEligibleDevice:]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:", 4);
    objc_msgSend(*(id *)(a1 + 32), "scheduleCompletionEvent");
  }
LABEL_14:

}

void __35__TIFeedbackController_retrySurvey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: error getting response from feedback service: %@"), "-[TIFeedbackController retrySurvey]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v27;
        _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v8 = (void *)MEMORY[0x1E0DBDB80];
    v9 = 5;
LABEL_13:
    objc_msgSend(v8, "setFeedbackState:", v9);
    objc_msgSend(*(id *)(a1 + 32), "scheduleCompletionEvent");
    goto LABEL_14;
  }
  objc_msgSend(v5, "feedbackFiled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey filed: complete"), "-[TIFeedbackController retrySurvey]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v8 = (void *)MEMORY[0x1E0DBDB80];
    v9 = 4;
    goto LABEL_13;
  }
  objc_msgSend(v5, "currentCampaign");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: already running a campaign - maybe they cancelled and we can retry"), "-[TIFeedbackController retrySurvey]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v29;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D21190]), "initWithIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DBDB80], "getFormMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "prefill:answer:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }
  objc_msgSend(v15, "setAuthenticationMethod:", 1);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D21180]), "initWithFeedbackForm:", v15);
  v24 = objc_alloc_init(MEMORY[0x1E0D21198]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Tell us why you turned off autocorrection"), CFSTR("Will you provide more insights on autocorrection"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLocalizedPromptTitle:", v26);

  objc_msgSend(v24, "setPromptStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:", 9);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __35__TIFeedbackController_retrySurvey__block_invoke_47;
  v30[3] = &unk_1EA106FE0;
  v30[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v23, "collectFeedbackWithLaunchConfiguration:completion:", v24, v30);

LABEL_14:
}

void __35__TIFeedbackController_retrySurvey__block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = IXACanLogMessageAtLevel();
  if (v3)
  {
    if (v4)
    {
      IXAFeedbackLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: error launching retry survey: %@"), "-[TIFeedbackController retrySurvey]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:", 5);
    objc_msgSend(*(id *)(a1 + 32), "scheduleCompletionEvent");
  }
  else if (v4)
  {
    IXAFeedbackLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: retry survey sucessfully submitted"), "-[TIFeedbackController retrySurvey]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

void __46__TIFeedbackController_assessAndScheduleRetry__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!IXACanLogMessageAtLevel())
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "scheduleRetry");
      goto LABEL_12;
    }
    IXAFeedbackLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_4:

      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: error getting response from feedback service: %@"), "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v14;
LABEL_21:
    _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    goto LABEL_4;
  }
  objc_msgSend(v5, "feedbackFiled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v5, "declineCount");
  if (v9 < 1)
  {
    v12 = v10;
    v13 = IXACanLogMessageAtLevel();
    if (v12)
    {
      if (!v13)
        goto LABEL_5;
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: feedback declined!"), "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
    }
    else
    {
      if (!v13)
        goto LABEL_5;
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: feedback not filed for some other reason"), "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
    }
    goto LABEL_21;
  }
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: survey filed: complete"), "-[TIFeedbackController assessAndScheduleRetry]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0DBDB80], "setFeedbackState:", 4);
  objc_msgSend(*(id *)(a1 + 32), "scheduleCompletionEvent");
LABEL_12:

}

@end
