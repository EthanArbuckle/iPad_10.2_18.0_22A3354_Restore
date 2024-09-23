@implementation WFWorkflowRunRequest

- (WFWorkflowRunRequest)initWithInput:(id)a3 presentationMode:(unint64_t)a4
{
  id v7;
  WFWorkflowRunRequest *v8;
  WFWorkflowRunRequest *v9;
  uint64_t v10;
  NSData *archivedInput;
  WFWorkflowRunRequest *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowRunRequest;
  v8 = -[WFWorkflowRunRequest init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
      v10 = objc_claimAutoreleasedReturnValue();
      archivedInput = v9->_archivedInput;
      v9->_archivedInput = (NSData *)v10;
    }
    else
    {
      archivedInput = v8->_archivedInput;
      v8->_archivedInput = 0;
    }

    objc_storeStrong((id *)&v9->_cachedInput, a3);
    v9->_presentationMode = a4;
    objc_storeStrong((id *)&v9->_runSource, CFSTR("unknown"));
    v9->_outputBehavior = 1;
    *(_WORD *)&v9->_allowsDialogNotifications = 1;
    *(_WORD *)&v9->_donateInteraction = 257;
    v12 = v9;
  }

  return v9;
}

- (WFWorkflowRunRequest)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowRunRequest *v5;
  uint64_t v6;
  NSData *archivedInput;
  uint64_t v8;
  NSString *runSource;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *listenerEndpoints;
  uint64_t v16;
  NSString *automationType;
  uint64_t v18;
  NSString *trialID;
  uint64_t v20;
  NSString *parentRunningContextIdentifier;
  uint64_t v22;
  NSXPCListenerEndpoint *remoteDialogPresenterEndpoint;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSSet *extensionResourceClasses;
  uint64_t v29;
  WFWorkflowRunViewSource *runViewSource;
  WFWorkflowRunRequest *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WFWorkflowRunRequest;
  v5 = -[WFWorkflowRunRequest init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedInput = v5->_archivedInput;
    v5->_archivedInput = (NSData *)v6;

    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runSource"));
    v8 = objc_claimAutoreleasedReturnValue();
    runSource = v5->_runSource;
    v5->_runSource = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("listenerEndpoints"));
    v14 = objc_claimAutoreleasedReturnValue();
    listenerEndpoints = v5->_listenerEndpoints;
    v5->_listenerEndpoints = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automationType"));
    v16 = objc_claimAutoreleasedReturnValue();
    automationType = v5->_automationType;
    v5->_automationType = (NSString *)v16;

    v5->_isAutomationSuggestion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutomationSuggestion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialID"));
    v18 = objc_claimAutoreleasedReturnValue();
    trialID = v5->_trialID;
    v5->_trialID = (NSString *)v18;

    v5->_outputBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputBehavior"));
    v5->_allowsDialogNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsDialogNotifications"));
    v5->_allowsHandoff = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsHandoff"));
    v5->_donateInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("donateInteraction"));
    v5->_logRunEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("logRunEvent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentRunningContextIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    parentRunningContextIdentifier = v5->_parentRunningContextIdentifier;
    v5->_parentRunningContextIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDialogPresenterEndpoint"));
    v22 = objc_claimAutoreleasedReturnValue();
    remoteDialogPresenterEndpoint = v5->_remoteDialogPresenterEndpoint;
    v5->_remoteDialogPresenterEndpoint = (NSXPCListenerEndpoint *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("extensionResourceClasses"));
    v27 = objc_claimAutoreleasedReturnValue();
    extensionResourceClasses = v5->_extensionResourceClasses;
    v5->_extensionResourceClasses = (NSSet *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runViewSource"));
    v29 = objc_claimAutoreleasedReturnValue();
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v29;

    v31 = v5;
  }

  return v5;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v18;
  void *v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest runSource](self, "runSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest archivedInput](self, "archivedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFWorkflowRunRequest presentationMode](self, "presentationMode") - 1;
  if (v6 > 3)
    v7 = CFSTR("Transient");
  else
    v7 = off_1E5FC6630[v6];
  v8 = -[WFWorkflowRunRequest outputBehavior](self, "outputBehavior");
  if (v8 > 3)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E5FC8160[v8];
  if (v5)
    v10 = CFSTR("yes");
  else
    v10 = CFSTR("no");
  v11 = v9;
  -[WFWorkflowRunRequest automationType](self, "automationType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFWorkflowRunRequest allowsHandoff](self, "allowsHandoff"))
    v13 = CFSTR("yes");
  else
    v13 = CFSTR("no");
  v14 = v13;
  if (-[WFWorkflowRunRequest allowsDialogNotifications](self, "allowsDialogNotifications"))
    v15 = CFSTR("yes");
  else
    v15 = CFSTR("no");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p, runSource: %@, input: %@, presentationMode: %@, output behavior: %@, automationType: %@, allowsHandoff: %@, allowsDialogNotifications: %@>"), v19, self, v4, v10, v7, v11, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  id v12;

  v12 = a3;
  objc_msgSend(v12, "encodeInteger:forKey:", -[WFWorkflowRunRequest presentationMode](self, "presentationMode"), CFSTR("presentationMode"));
  -[WFWorkflowRunRequest runSource](self, "runSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("runSource"));

  -[WFWorkflowRunRequest archivedInput](self, "archivedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("archivedInput"));

  -[WFWorkflowRunRequest listenerEndpoints](self, "listenerEndpoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("listenerEndpoints"));

  -[WFWorkflowRunRequest automationType](self, "automationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("automationType"));

  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest isAutomationSuggestion](self, "isAutomationSuggestion"), CFSTR("isAutomationSuggestion"));
  -[WFWorkflowRunRequest trialID](self, "trialID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("trialID"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[WFWorkflowRunRequest outputBehavior](self, "outputBehavior"), CFSTR("outputBehavior"));
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest allowsDialogNotifications](self, "allowsDialogNotifications"), CFSTR("allowsDialogNotifications"));
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest allowsHandoff](self, "allowsHandoff"), CFSTR("allowsHandoff"));
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest donateInteraction](self, "donateInteraction"), CFSTR("donateInteraction"));
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest logRunEvent](self, "logRunEvent"), CFSTR("logRunEvent"));
  -[WFWorkflowRunRequest parentRunningContextIdentifier](self, "parentRunningContextIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("parentRunningContextIdentifier"));

  -[WFWorkflowRunRequest remoteDialogPresenterEndpoint](self, "remoteDialogPresenterEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("remoteDialogPresenterEndpoint"));

  -[WFWorkflowRunRequest extensionResourceClasses](self, "extensionResourceClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("extensionResourceClasses"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_runViewSource, CFSTR("runViewSource"));
}

- (void)getInputWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  Class v8;
  Class v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFWorkflowRunRequest cachedInput](self, "cachedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFWorkflowRunRequest cachedInput](self, "cachedInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    -[WFWorkflowRunRequest archivedInput](self, "archivedInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = NSClassFromString((NSString *)CFSTR("WFContentCollection"));
      if (v8)
      {
        v9 = v8;
        v10 = (void *)MEMORY[0x1E0CB3710];
        -[WFWorkflowRunRequest archivedInput](self, "archivedInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __54__WFWorkflowRunRequest_getInputWithCompletionHandler___block_invoke;
        v16[3] = &unk_1E5FC6610;
        v16[4] = self;
        v17 = v4;
        v13 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v12, v16);

      }
      else
      {
        getWFVoiceShortcutClientLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[WFWorkflowRunRequest getInputWithCompletionHandler:]";
          _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_FAULT, "%s Unable to get input from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
        }

        -[WFWorkflowRunRequest unableToDecodeInputError](self, "unableToDecodeInputError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);

      }
    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }

}

- (id)unableToDecodeInputError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v9[0] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("Unable to run"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("The input of the shortcut could not be processed."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0x7FFFFFFFFFFFFFFFLL, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)queueIdentifier
{
  return 0;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)parentBundleIdentifier
{
  return self->_parentBundleIdentifier;
}

- (void)setParentBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isAutomationSuggestion
{
  return self->_isAutomationSuggestion;
}

- (void)setIsAutomationSuggestion:(BOOL)a3
{
  self->_isAutomationSuggestion = a3;
}

- (BOOL)isStepwise
{
  return self->_stepwise;
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)listenerEndpoints
{
  return self->_listenerEndpoints;
}

- (void)setListenerEndpoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (BOOL)allowsDialogNotifications
{
  return self->_allowsDialogNotifications;
}

- (void)setAllowsDialogNotifications:(BOOL)a3
{
  self->_allowsDialogNotifications = a3;
}

- (BOOL)allowsHandoff
{
  return self->_allowsHandoff;
}

- (void)setAllowsHandoff:(BOOL)a3
{
  self->_allowsHandoff = a3;
}

- (BOOL)handlesDialogRequests
{
  return self->_handlesDialogRequests;
}

- (void)setHandlesDialogRequests:(BOOL)a3
{
  self->_handlesDialogRequests = a3;
}

- (BOOL)handlesSiriActionRequests
{
  return self->_handlesSiriActionRequests;
}

- (void)setHandlesSiriActionRequests:(BOOL)a3
{
  self->_handlesSiriActionRequests = a3;
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

- (void)setDonateInteraction:(BOOL)a3
{
  self->_donateInteraction = a3;
}

- (BOOL)logRunEvent
{
  return self->_logRunEvent;
}

- (void)setLogRunEvent:(BOOL)a3
{
  self->_logRunEvent = a3;
}

- (NSString)parentRunningContextIdentifier
{
  return self->_parentRunningContextIdentifier;
}

- (void)setParentRunningContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentRunningContextIdentifier, a3);
}

- (NSXPCListenerEndpoint)remoteDialogPresenterEndpoint
{
  return self->_remoteDialogPresenterEndpoint;
}

- (void)setRemoteDialogPresenterEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDialogPresenterEndpoint, a3);
}

- (NSSet)extensionResourceClasses
{
  return self->_extensionResourceClasses;
}

- (void)setExtensionResourceClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)archivedInput
{
  return self->_archivedInput;
}

- (WFContentCollection)cachedInput
{
  return self->_cachedInput;
}

- (void)setCachedInput:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInput, 0);
  objc_storeStrong((id *)&self->_archivedInput, 0);
  objc_storeStrong((id *)&self->_extensionResourceClasses, 0);
  objc_storeStrong((id *)&self->_remoteDialogPresenterEndpoint, 0);
  objc_storeStrong((id *)&self->_parentRunningContextIdentifier, 0);
  objc_storeStrong((id *)&self->_listenerEndpoints, 0);
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_parentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
}

void __54__WFWorkflowRunRequest_getInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setCachedInput:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
