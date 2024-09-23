@implementation WFWorkflowRunningContext

- (WFWorkflowRunningContext)initWithWorkflowIdentifier:(id)a3
{
  id v4;
  WFWorkflowRunningContext *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *workflowIdentifier;
  uint64_t v11;
  NSString *progressCategory;
  uint64_t v13;
  NSDate *creationDate;
  WFWorkflowRunningContext *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFWorkflowRunningContext;
  v5 = -[WFWorkflowRunningContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "copy");
    workflowIdentifier = v5->_workflowIdentifier;
    v5->_workflowIdentifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.shortcuts.%@"), v5->_identifier);
    v11 = objc_claimAutoreleasedReturnValue();
    progressCategory = v5->_progressCategory;
    v5->_progressCategory = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    v5->_outputBehavior = 0;
    *(_DWORD *)&v5->_stepwise = 0x1000000;
    v15 = v5;
  }

  return v5;
}

- (BOOL)allowsDialogNotifications
{
  return !-[WFWorkflowRunningContext isShortcutsApp](self, "isShortcutsApp") && self->_allowsDialogNotifications;
}

- (BOOL)isShortcutsApp
{
  void *v2;
  char v3;

  -[WFWorkflowRunningContext originatingBundleIdentifier](self, "originatingBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = VCIsShortcutsAppBundleIdentifier(v2);

  return v3;
}

- (id)addProgressSubscriberUsingPublishingHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB38A8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__WFWorkflowRunningContext_addProgressSubscriberUsingPublishingHandler___block_invoke;
  v9[3] = &unk_1E5FC7D68;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_addSubscriberForCategory:usingPublishingHandler:", CFSTR("com.apple.shortcuts.progress"), v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeProgressSubscriber:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:", a3);
}

- (id)progressForPublishingWithTotalUnitCount:(int64_t)a3 cancellationHandler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB38A8];
  v7 = a4;
  objc_msgSend(v6, "progressWithTotalUnitCount:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCancellationHandler:", v7);

  objc_msgSend(v8, "setUserInfoObject:forKey:", CFSTR("com.apple.shortcuts.progress"), *MEMORY[0x1E0CB3068]);
  -[WFWorkflowRunningContext identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfoObject:forKey:", v9, CFSTR("contextIdentifier"));

  -[WFWorkflowRunningContext workflowIdentifier](self, "workflowIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfoObject:forKey:", v10, CFSTR("workflowIdentifier"));

  objc_msgSend(v8, "setUserInfoObject:forKey:", &unk_1E60028F8, CFSTR("runningState"));
  objc_msgSend(v8, "publish");
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFWorkflowRunningContext identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowRunningContext *v4;
  WFWorkflowRunningContext *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WFWorkflowRunningContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFWorkflowRunningContext identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRunningContext identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext workflowIdentifier](self, "workflowIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id: %@, workflow id: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFWorkflowRunningContext identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[WFWorkflowRunningContext workflowIdentifier](self, "workflowIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setWorkflowIdentifier:", v8);

  -[WFWorkflowRunningContext creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreationDate:", v9);

  -[WFWorkflowRunningContext automationType](self, "automationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomationType:", v10);

  -[WFWorkflowRunningContext rootWorkflowIdentifier](self, "rootWorkflowIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRootWorkflowIdentifier:", v11);

  -[WFWorkflowRunningContext runSource](self, "runSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRunSource:", v12);

  -[WFWorkflowRunningContext runKind](self, "runKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRunKind:", v13);

  objc_msgSend(v4, "setOutputBehavior:", -[WFWorkflowRunningContext outputBehavior](self, "outputBehavior"));
  -[WFWorkflowRunningContext originatingBundleIdentifier](self, "originatingBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginatingBundleIdentifier:", v14);

  -[WFWorkflowRunningContext runViewSource](self, "runViewSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRunViewSource:", v15);

  objc_msgSend(v4, "setStepwise:", -[WFWorkflowRunningContext isStepwise](self, "isStepwise"));
  objc_msgSend(v4, "setShouldForwardDialogRequests:", -[WFWorkflowRunningContext shouldForwardDialogRequests](self, "shouldForwardDialogRequests"));
  objc_msgSend(v4, "setShouldForwardSiriActionRequests:", -[WFWorkflowRunningContext shouldForwardSiriActionRequests](self, "shouldForwardSiriActionRequests"));
  return v4;
}

- (id)copyWithNewIdentity
{
  WFWorkflowRunningContext *v2;
  void *v3;
  WFWorkflowRunningContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = self;
  -[WFWorkflowRunningContext workflowIdentifier](v2, "workflowIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFWorkflowRunningContext initWithWorkflowIdentifier:](v2, "initWithWorkflowIdentifier:", v3);

  -[WFWorkflowRunningContext automationType](v2, "automationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setAutomationType:](v4, "setAutomationType:", v5);

  -[WFWorkflowRunningContext rootWorkflowIdentifier](v2, "rootWorkflowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setRootWorkflowIdentifier:](v4, "setRootWorkflowIdentifier:", v6);

  -[WFWorkflowRunningContext runSource](v2, "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setRunSource:](v4, "setRunSource:", v7);

  -[WFWorkflowRunningContext runKind](v2, "runKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setRunKind:](v4, "setRunKind:", v8);

  -[WFWorkflowRunningContext setOutputBehavior:](v4, "setOutputBehavior:", -[WFWorkflowRunningContext outputBehavior](v2, "outputBehavior"));
  -[WFWorkflowRunningContext originatingBundleIdentifier](v2, "originatingBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setOriginatingBundleIdentifier:](v4, "setOriginatingBundleIdentifier:", v9);

  -[WFWorkflowRunningContext setAllowsDialogNotifications:](v4, "setAllowsDialogNotifications:", -[WFWorkflowRunningContext allowsDialogNotifications](v2, "allowsDialogNotifications"));
  -[WFWorkflowRunningContext contextualAction](v2, "contextualAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setContextualAction:](v4, "setContextualAction:", v10);

  -[WFWorkflowRunningContext contextualActionContext](v2, "contextualActionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setContextualActionContext:](v4, "setContextualActionContext:", v11);

  -[WFWorkflowRunningContext runViewSource](v2, "runViewSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunningContext setRunViewSource:](v4, "setRunViewSource:", v12);

  -[WFWorkflowRunningContext setStepwise:](v4, "setStepwise:", -[WFWorkflowRunningContext isStepwise](v2, "isStepwise"));
  -[WFWorkflowRunningContext setShouldForwardDialogRequests:](v4, "setShouldForwardDialogRequests:", -[WFWorkflowRunningContext shouldForwardDialogRequests](v2, "shouldForwardDialogRequests"));
  -[WFWorkflowRunningContext setShouldForwardSiriActionRequests:](v4, "setShouldForwardSiriActionRequests:", -[WFWorkflowRunningContext shouldForwardSiriActionRequests](v2, "shouldForwardSiriActionRequests"));
  return v4;
}

- (id)copyWithCustomIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)-[WFWorkflowRunningContext copy](self, "copy");
  v6 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setIdentifier:", v6);
  return v5;
}

- (WFWorkflowRunningContext)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowRunningContext *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *workflowIdentifier;
  uint64_t v10;
  NSString *progressCategory;
  uint64_t v12;
  NSDate *creationDate;
  uint64_t v14;
  NSString *automationType;
  uint64_t v16;
  NSString *rootWorkflowIdentifier;
  uint64_t v18;
  NSString *originatingBundleIdentifier;
  uint64_t v20;
  NSString *runSource;
  uint64_t v22;
  NSString *runKind;
  uint64_t v24;
  WFWorkflowRunViewSource *runViewSource;
  WFWorkflowRunningContext *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WFWorkflowRunningContext;
  v5 = -[WFWorkflowRunningContext init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    workflowIdentifier = v5->_workflowIdentifier;
    v5->_workflowIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progressCategory"));
    v10 = objc_claimAutoreleasedReturnValue();
    progressCategory = v5->_progressCategory;
    v5->_progressCategory = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automationType"));
    v14 = objc_claimAutoreleasedReturnValue();
    automationType = v5->_automationType;
    v5->_automationType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rootWorkflowIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    rootWorkflowIdentifier = v5->_rootWorkflowIdentifier;
    v5->_rootWorkflowIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingBundleIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    originatingBundleIdentifier = v5->_originatingBundleIdentifier;
    v5->_originatingBundleIdentifier = (NSString *)v18;

    v5->_allowsDialogNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDialogNotifications"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runSource"));
    v20 = objc_claimAutoreleasedReturnValue();
    runSource = v5->_runSource;
    v5->_runSource = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runKind"));
    v22 = objc_claimAutoreleasedReturnValue();
    runKind = v5->_runKind;
    v5->_runKind = (NSString *)v22;

    v5->_outputBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputBehavior"));
    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runViewSource"));
    v24 = objc_claimAutoreleasedReturnValue();
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v24;

    v5->_stepwise = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stepwise"));
    v5->_shouldForwardDialogRequests = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldForwardDialogRequests"));
    v5->_shouldForwardSiriActionRequests = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldForwardSiriActionRequests"));
    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[WFWorkflowRunningContext identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[WFWorkflowRunningContext workflowIdentifier](self, "workflowIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("workflowIdentifier"));

  -[WFWorkflowRunningContext progressCategory](self, "progressCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("progressCategory"));

  -[WFWorkflowRunningContext creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("creationDate"));

  -[WFWorkflowRunningContext originatingBundleIdentifier](self, "originatingBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("originatingBundleIdentifier"));

  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext allowsDialogNotifications](self, "allowsDialogNotifications"), CFSTR("allowsDialogNotifications"));
  -[WFWorkflowRunningContext automationType](self, "automationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("automationType"));

  -[WFWorkflowRunningContext rootWorkflowIdentifier](self, "rootWorkflowIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("rootWorkflowIdentifier"));

  -[WFWorkflowRunningContext runSource](self, "runSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("runSource"));

  -[WFWorkflowRunningContext runKind](self, "runKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("runKind"));

  objc_msgSend(v14, "encodeInteger:forKey:", -[WFWorkflowRunningContext outputBehavior](self, "outputBehavior"), CFSTR("outputBehavior"));
  objc_msgSend(v14, "encodeInteger:forKey:", -[WFWorkflowRunningContext presentationMode](self, "presentationMode"), CFSTR("presentationMode"));
  -[WFWorkflowRunningContext runViewSource](self, "runViewSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("runViewSource"));

  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext isStepwise](self, "isStepwise"), CFSTR("stepwise"));
  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext shouldForwardDialogRequests](self, "shouldForwardDialogRequests"), CFSTR("shouldForwardDialogRequests"));
  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext shouldForwardSiriActionRequests](self, "shouldForwardSiriActionRequests"), CFSTR("shouldForwardSiriActionRequests"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (void)setWorkflowIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)rootWorkflowIdentifier
{
  return self->_rootWorkflowIdentifier;
}

- (void)setRootWorkflowIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)runKind
{
  return self->_runKind;
}

- (void)setRunKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isStepwise
{
  return self->_stepwise;
}

- (void)setStepwise:(BOOL)a3
{
  self->_stepwise = a3;
}

- (BOOL)shouldForwardSiriActionRequests
{
  return self->_shouldForwardSiriActionRequests;
}

- (void)setShouldForwardSiriActionRequests:(BOOL)a3
{
  self->_shouldForwardSiriActionRequests = a3;
}

- (BOOL)shouldForwardDialogRequests
{
  return self->_shouldForwardDialogRequests;
}

- (void)setShouldForwardDialogRequests:(BOOL)a3
{
  self->_shouldForwardDialogRequests = a3;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)progressCategory
{
  return self->_progressCategory;
}

- (void)setAllowsDialogNotifications:(BOOL)a3
{
  self->_allowsDialogNotifications = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (NSURL)outputRootIfRunningInFinder
{
  return self->_outputRootIfRunningInFinder;
}

- (void)setOutputRootIfRunningInFinder:(id)a3
{
  objc_storeStrong((id *)&self->_outputRootIfRunningInFinder, a3);
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (void)setContextualAction:(id)a3
{
  objc_storeStrong((id *)&self->_contextualAction, a3);
}

- (WFContextualActionContext)contextualActionContext
{
  return self->_contextualActionContext;
}

- (void)setContextualActionContext:(id)a3
{
  objc_storeStrong((id *)&self->_contextualActionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionContext, 0);
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_outputRootIfRunningInFinder, 0);
  objc_storeStrong((id *)&self->_progressCategory, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runKind, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_rootWorkflowIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __72__WFWorkflowRunningContext_addProgressSubscriberUsingPublishingHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
