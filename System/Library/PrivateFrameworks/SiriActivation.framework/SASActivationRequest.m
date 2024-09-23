@implementation SASActivationRequest

- (SASActivationRequest)init
{
  SASActivationRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = -[SASActivationRequest init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");

  }
  return v2;
}

- (SASActivationRequest)initWithButtonIdentifier:(int64_t)a3 context:(id)a4
{
  id v6;
  SASButtonActvationRequest *v7;
  void *v8;

  v6 = a4;
  v7 = objc_alloc_init(SASButtonActvationRequest);

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "buttonDownTimestamp");
      -[SASActivationRequest setButtonDownTime:](v7, "setButtonDownTime:");
    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    -[SASActivationRequest setActivationTime:](v7, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v7, "setActivationType:", 0);
    -[SASButtonActvationRequest setButtonIdentifier:](v7, "setButtonIdentifier:", a3);
    -[SASActivationRequest setRequestSource:](v7, "setRequestSource:", +[SASActivationRequest requestSourceForButtonIdentifier:](SASActivationRequest, "requestSourceForButtonIdentifier:", a3));
    -[SASActivationRequest setContext:](v7, "setContext:", v6);
  }

  return &v7->super;
}

- (SASActivationRequest)initWithDirectActionContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 2);
    -[SASActivationRequest setActivationEvent:](v5, "setActivationEvent:", 2);
    objc_msgSend(v4, "bulletin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

      v8 = 13;
    }
    else
    {
      objc_msgSend(v4, "notification");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v8 = 13;
      else
        v8 = 14;
    }
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", v8);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithContinuityContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  SASActivationRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SASActivationRequest *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 3);
    -[SASActivationRequest setContext:](v6, "setContext:", v4);
    objc_msgSend(v4, "requestInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "speechRequestOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activationEvent");

    objc_msgSend(v4, "requestInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechRequestOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9 == 17)
    {
      objc_msgSend(v11, "activationEventTime");
      -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

      -[SASActivationRequest setRequestSource:](v6, "setRequestSource:", 26);
      -[SASActivationRequest setActivationEvent:](v6, "setActivationEvent:", 3);
    }
    else
    {
      v13 = objc_msgSend(v11, "activationEvent");

      objc_msgSend(v4, "requestInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "speechRequestOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v13 == 16)
      {
        objc_msgSend(v15, "activationEventTime");
        -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

        v17 = v6;
        v18 = 44;
      }
      else
      {
        v19 = objc_msgSend(v15, "activationEvent");

        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "systemUptime");
        -[SASActivationRequest setActivationTime:](v6, "setActivationTime:");

        v17 = v6;
        if (v19 == 5)
          v18 = 9;
        else
          v18 = 18;
      }
      -[SASActivationRequest setRequestSource:](v17, "setRequestSource:", v18);
    }
  }

  return v6;
}

- (SASActivationRequest)initWithVoiceTriggerContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 1);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 8);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 9);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 38);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationHearstContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 9);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 45);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithContinuousConversationJarvisContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 9);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 46);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithRemotePresentationBringUpContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 10);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 39);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithBreadcrumbRequest
{
  SASActivationRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = -[SASActivationRequest init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v2, "setActivationType:", 4);
    -[SASActivationRequest setRequestSource:](v2, "setRequestSource:", 20);
  }
  return v2;
}

- (SASActivationRequest)initWithSimpleActivation:(int64_t)a3
{
  SASActivationRequest *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASActivationRequest;
  v4 = -[SASActivationRequest init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    -[SASActivationRequest setActivationTime:](v4, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v4, "setActivationType:", 5);
    -[SASActivationRequest setRequestSource:](v4, "setRequestSource:", a3);
  }
  return v4;
}

- (SASActivationRequest)initWithBluetoothKeyboardShortcutActivation:(int64_t)a3
{
  SASActivationRequest *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASActivationRequest;
  v4 = -[SASActivationRequest init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    -[SASActivationRequest setActivationTime:](v4, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v4, "setActivationType:", 8);
    -[SASActivationRequest setRequestSource:](v4, "setRequestSource:", a3);
  }
  return v4;
}

- (SASActivationRequest)initWithSpotlightContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 6);
    v7 = objc_msgSend(v4, "source");
    if (v7)
    {
      if (v7 != 1)
      {
LABEL_7:
        -[SASActivationRequest setContext:](v5, "setContext:", v4);
        goto LABEL_8;
      }
      v8 = 25;
    }
    else
    {
      v8 = 24;
    }
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", v8);
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (SASActivationRequest)initWithVocalShortcutContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 11);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 51);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (SASActivationRequest)initWithVoiceTriggerRequest
{
  SASActivationRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASActivationRequest;
  v2 = -[SASActivationRequest init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    -[SASActivationRequest setActivationTime:](v2, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v2, "setActivationType:", 1);
    -[SASActivationRequest setRequestSource:](v2, "setRequestSource:", 8);
  }
  return v2;
}

- (SASActivationRequest)initWithTestingContext:(id)a3
{
  id v4;
  SASActivationRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASActivationRequest;
  v5 = -[SASActivationRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    -[SASActivationRequest setActivationTime:](v5, "setActivationTime:");

    -[SASActivationRequest setActivationType:](v5, "setActivationType:", 7);
    -[SASActivationRequest setRequestSource:](v5, "setRequestSource:", 15);
    -[SASActivationRequest setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (id)eventSource
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  SASRequestSourceGetName(-[SASActivationRequest requestSource](self, "requestSource"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E91FDE50;
  v4 = v2;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SASActivationRequest activationEvent](self, "activationEvent");
  AFActivationEventGetDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASActivationRequest eventSource](self, "eventSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASActivationRequest context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("event = AFActivationEvent%@; source = %@; context: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)computedActivationTime
{
  unint64_t *p_waketimeMIBSize;
  int v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  double v10;
  os_log_t v11;
  double v12;
  double v13;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!-[SASActivationRequest isDeviceButtonRequest](self, "isDeviceButtonRequest")
    || !AFDeviceSupportsZLL())
  {
LABEL_15:
    -[SASActivationRequest activationTime](self, "activationTime");
    return v12;
  }
  self->_waketimeMIBSize = 48;
  p_waketimeMIBSize = &self->_waketimeMIBSize;
  v4 = sysctlnametomib("kern.waketime", self->_waketimeMIB, &self->_waketimeMIBSize);
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  if (v4)
  {
    v6 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASActivationRequest computedActivationTime].cold.2(v6);
    *p_waketimeMIBSize = 0;
  }
  v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SASActivationRequest computedActivationTime]";
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s Device wants Home Button ZLL, checking wake time", buf, 0xCu);
  }
  v31 = 0;
  v32 = 0;
  v30 = 16;
  if (*p_waketimeMIBSize)
    v8 = sysctl(self->_waketimeMIB, *p_waketimeMIBSize, &v31, &v30, 0, 0);
  else
    v8 = sysctlbyname("kern.waketime", &v31, &v30, 0, 0);
  v9 = v8;
  -[SASActivationRequest buttonDownTimestamp](self, "buttonDownTimestamp");
  if (v9)
  {
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[SASActivationRequest computedActivationTime].cold.1(v11);
    goto LABEL_15;
  }
  v13 = v10;
  v15 = (double)v31 + (double)((int)v32 / 0xF4240uLL);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  v18 = v17 - v15;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "systemUptime");
  v21 = v20;

  v22 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SASActivationRequest computedActivationTime]";
    v35 = 2048;
    v36 = v18;
    _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s Wake time was %lf seconds ago", buf, 0x16u);
  }
  v23 = v21 - v13;
  v24 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SASActivationRequest computedActivationTime]";
    v35 = 2048;
    v36 = v23;
    _os_log_impl(&dword_1D132F000, v24, OS_LOG_TYPE_DEFAULT, "%s Button down time was %lf seconds ago", buf, 0x16u);
  }
  v25 = v18 - v23;
  v26 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SASActivationRequest computedActivationTime]";
    v35 = 2048;
    v36 = v25;
    _os_log_impl(&dword_1D132F000, v26, OS_LOG_TYPE_DEFAULT, "%s Wake -> Button down delta is %lf", buf, 0x16u);
  }
  v27 = *v5;
  v28 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
  if (v25 > 0.0 && v25 < 0.75)
  {
    if (v28)
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SASActivationRequest computedActivationTime]";
      _os_log_impl(&dword_1D132F000, v27, OS_LOG_TYPE_DEFAULT, "%s Using Wake Time", buf, 0xCu);
    }
    return v13 - v25;
  }
  else if (v28)
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SASActivationRequest computedActivationTime]";
    _os_log_impl(&dword_1D132F000, v27, OS_LOG_TYPE_DEFAULT, "%s Using Button Down Time", buf, 0xCu);
  }
  return v13;
}

- (double)buttonDownTimestamp
{
  void *v3;
  char isKindOfClass;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  double v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SASActivationRequest context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = 0.0;
  if ((isKindOfClass & 1) != 0)
  {
    -[SASActivationRequest context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonDownTimestamp");
    v8 = v7;

    v5 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(v8);
    if (v5 < 0.0)
    {
      v9 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[SASActivationRequest buttonDownTimestamp]";
        _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s button down timestamp sent in format where absolute time conversion is invalid", (uint8_t *)&v13, 0xCu);
      }
      -[SASActivationRequest context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "buttonDownTimestamp");
      v5 = v11;

    }
  }
  return v5;
}

- (int64_t)longPressBehavior
{
  void *v3;
  char isKindOfClass;
  void *v5;
  int64_t v6;

  -[SASActivationRequest context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return -1;
  -[SASActivationRequest context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longPressBehavior");

  return v6;
}

- (BOOL)isVoiceRequest
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[SASActivationRequest context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SASActivationRequest context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechRequestOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isVoiceTrigger"))
      v8 = objc_msgSend(v7, "activationEvent") == 8 || objc_msgSend(v7, "activationEvent") == 16;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  return -[SASActivationRequest activationType](self, "activationType") == 1 || v8;
}

- (BOOL)isRemoteDisplayVoiceRequest
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SASActivationRequest context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechRequestOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "activationEvent") == 31;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isHoldToTalkSource
{
  return 0;
}

- (BOOL)isButtonRequest
{
  return 0;
}

- (BOOL)isDeviceButtonRequest
{
  return 0;
}

- (BOOL)isTestingRequest
{
  return -[SASActivationRequest requestSource](self, "requestSource") == 15;
}

- (BOOL)isEyesFreeRequestSource
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[SASActivationRequest context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[SASActivationRequest context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEyesFree");

  return v6;
}

- (BOOL)isUIFreeRequestSource
{
  void *v2;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;

  if (-[SASActivationRequest activationType](self, "activationType") != 3)
    return 0;
  -[SASActivationRequest context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activationEvent");

  if (v6 <= 0xA && ((1 << v6) & 0x640) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "requestInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechRequestOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "activationEvent") == 17;
  }
  if (v6 > 0xA || ((1 << v6) & 0x640) == 0)
  {

  }
  return v7;
}

- (BOOL)isDirectActionRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 2;
}

- (BOOL)isContinuityRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 3;
}

- (BOOL)isContinuousConversationRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 9;
}

- (BOOL)isBluetoothRequest
{
  void *v2;
  char isKindOfClass;

  -[SASActivationRequest context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSpotlightRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 6;
}

- (BOOL)isRemotePresentationBringUpRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 10;
}

- (BOOL)isVocalShortcutRequest
{
  return -[SASActivationRequest activationType](self, "activationType") == 11;
}

+ (int64_t)requestSourceForButtonIdentifier:(int64_t)a3
{
  int64_t result;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  result = a3;
  if (a3 > 99)
  {
    v4 = 15;
    v5 = 22;
    if (a3 != 201)
      v5 = 0;
    if (a3 != 200)
      v4 = v5;
    v6 = 1;
    v7 = 10;
    if (a3 != 101)
      v7 = 0;
    if (a3 != 100)
      v6 = v7;
    if (a3 <= 199)
      return v6;
    else
      return v4;
  }
  else
  {
    switch(a3)
    {
      case 1:
      case 2:
      case 4:
        return result;
      case 3:
        result = 5;
        break;
      case 5:
        result = 10;
        break;
      case 6:
        result = 43;
        break;
      case 7:
        result = 16;
        break;
      case 8:
        result = 36;
        break;
      case 9:
        result = 28;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (int64_t)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(int64_t)a3
{
  self->_activationType = a3;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (SiriContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (double)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(double)a3
{
  self->_activationTime = a3;
}

- (double)buttonDownTime
{
  return self->_buttonDownTime;
}

- (void)setButtonDownTime:(double)a3
{
  self->_buttonDownTime = a3;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(int64_t)a3
{
  self->_requestSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)computedActivationTime
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1D132F000, v3, v4, "%s Failed getting waketime mib %{public}s", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_14();
}

@end
