@implementation WFTriggerEventRunner

- (WFTriggerEventRunner)initWithDatabaseProvider:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  WFTriggerEventRunner *v10;
  WFTriggerEventRunner *v11;
  WFTriggerEventRunner *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEventRunner.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFTriggerEventRunner;
  v10 = -[WFTriggerEventRunner init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v11->_delegate, a4);
    v12 = v11;
  }

  return v11;
}

- (BOOL)startRunningWorkflow:(id)a3 forTrigger:(id)a4 eventInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEventRunner.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = -[WFTriggerEventRunner isRunningWorkflowWithIdentifier:](self, "isRunningWorkflowWithIdentifier:", v12);

  getWFTriggersLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[WFTriggerEventRunner inProgressTrigger](self, "inProgressTrigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "trigger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trigger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v49 = "-[WFTriggerEventRunner startRunningWorkflow:forTrigger:eventInfo:]";
      v50 = 2112;
      v51 = v19;
      v52 = 2112;
      v53 = v22;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_FAULT, "%s An automation is already running (%@), so we can't run this newly-triggered one (%@).", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "trigger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v49 = "-[WFTriggerEventRunner startRunningWorkflow:forTrigger:eventInfo:]";
      v50 = 2112;
      v51 = v10;
      v52 = 2114;
      v53 = v25;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s 🤖 Launching extension to run trigger: %@ of type: %{public}@", buf, 0x20u);

    }
    -[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:](self, "logPowerLogEventForConfiguredTrigger:workflowReference:", v10, v9);
    objc_msgSend(v10, "trigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "trigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contentCollectionWithEventInfo:", v11);
    v30 = objc_claimAutoreleasedReturnValue();

    v47 = v11;
    if ((objc_msgSend(v10, "shouldPrompt") & 1) != 0)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(v10, "trigger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically"))
        v31 = 2;
      else
        v31 = 0;

    }
    v33 = objc_alloc(MEMORY[0x1E0DC7E28]);
    objc_msgSend(v9, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v33, "initWithIdentifier:", v34);

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", v30, v31);
    objc_msgSend(v35, "setAutomationType:", v28);
    v36 = *MEMORY[0x1E0DC8480];
    objc_msgSend(v35, "setRunSource:", *MEMORY[0x1E0DC8480]);
    objc_msgSend(v35, "setLogRunEvent:", 0);
    objc_msgSend(v35, "setDonateInteraction:", 0);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E78]), "initWithDescriptor:runRequest:", v45, v35);
    objc_msgSend(v37, "setDelegate:", self);
    objc_msgSend(v37, "start");
    -[WFTriggerEventRunner setInProgressRunnerClient:](self, "setInProgressRunnerClient:", v37);
    -[WFTriggerEventRunner databaseProvider](self, "databaseProvider");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "databaseWithError:", 0);
    v46 = v28;
    v38 = (void *)v30;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v40 = v9;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "logRunOfWorkflow:withSource:triggerID:", v40, v36, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerEventRunner setInProgressRunEvent:](self, "setInProgressRunEvent:", v42);

    v9 = v40;
    -[WFTriggerEventRunner setInProgressTrigger:](self, "setInProgressTrigger:", v10);

    v15 = v46;
    v11 = v47;
    LOBYTE(v13) = 0;
  }

  return v13 ^ 1;
}

- (BOOL)isRunningWorkflowWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[WFTriggerEventRunner inProgressRunnerClient](self, "inProgressRunnerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a5;
  v9 = a3;
  -[WFTriggerEventRunner inProgressRunnerClient](self, "inProgressRunnerClient");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[WFTriggerEventRunner delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerEventRunner inProgressTrigger](self, "inProgressTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerEventRunner inProgressRunEvent](self, "inProgressRunEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didFinishRunningWithError:cancelled:trigger:runEvent:", v14, v6, v12, v13);

    -[WFTriggerEventRunner setInProgressTrigger:](self, "setInProgressTrigger:", 0);
    -[WFTriggerEventRunner setInProgressRunEvent:](self, "setInProgressRunEvent:", 0);
    -[WFTriggerEventRunner setInProgressRunnerClient:](self, "setInProgressRunnerClient:", 0);
  }

}

- (void)logPowerLogEventForConfiguredTrigger:(id)a3 workflowReference:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  void (*v27)(uint64_t, const __CFString *, NSObject *, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[3];
  _BYTE buf[24];
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = a4;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEventRunner.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  v45[0] = CFSTR("name");
  v45[1] = CFSTR("actions");
  v45[2] = CFSTR("associatedAppBundleIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerEventRunner databaseProvider](self, "databaseProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v9, "databaseWithError:", &v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v38;

  if (v10)
  {
    v37 = v11;
    objc_msgSend(v10, "recordWithDescriptor:properties:error:", v36, v34, &v37);
    v12 = objc_claimAutoreleasedReturnValue();
    v33 = v37;

    if (v12)
    {
      v43[0] = CFSTR("WFTriggerKind");
      v13 = (void *)MEMORY[0x1E0DD9EB8];
      objc_msgSend(v35, "trigger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "powerLogEventKindForTrigger:", v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v31;
      v43[1] = CFSTR("WFActionCount");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject actions](v12, "actions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v16;
      v43[2] = CFSTR("WFTriggerID");
      objc_msgSend(v35, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v17;
      v43[3] = CFSTR("WFWorkflowID");
      objc_msgSend(v36, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v18;
      v43[4] = CFSTR("WFWorkflowName");
      -[NSObject name](v12, "name");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = &stru_1E7AA8740;
      v44[4] = v21;
      v43[5] = CFSTR("WFAssociatedAppIdentifier");
      -[NSObject associatedAppBundleIdentifier](v12, "associatedAppBundleIdentifier");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (const __CFString *)v22;
      else
        v24 = &stru_1E7AA8740;
      v44[5] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 6);
      v25 = objc_claimAutoreleasedReturnValue();

      getWFTriggersLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("ShortcutsTriggerFired");
        *(_WORD *)&buf[22] = 2112;
        v47 = v25;
        _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_DEBUG, "%s Logging PowerLog event: %{public}@ (%@)", buf, 0x20u);
      }

      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v27 = (void (*)(uint64_t, const __CFString *, NSObject *, _QWORD))getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr;
      v42 = getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr;
      if (!getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPLLogTimeSensitiveRegisteredEventSymbolLoc_block_invoke;
        v47 = &unk_1E7AA8030;
        v48 = &v39;
        __getPLLogTimeSensitiveRegisteredEventSymbolLoc_block_invoke(buf);
        v27 = (void (*)(uint64_t, const __CFString *, NSObject *, _QWORD))v40[3];
      }
      _Block_object_dispose(&v39, 8);
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void softPLLogTimeSensitiveRegisteredEvent(PLClientID, CFStringRef, CFDictionaryRef, CFArrayRef)");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("WFTriggerEventRunner.m"), 28, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v27(38, CFSTR("ShortcutsTriggerFired"), v25, 0);
    }
    else
    {
      getWFTriggersLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2114;
        v47 = v33;
        _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Failed to get workflow record for reference (%@): %{public}@", buf, 0x20u);
      }
    }

    v11 = v33;
  }
  else
  {
    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2114;
      v47 = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get workflow record for reference (%@) because database could not be loaded: %{public}@", buf, 0x20u);
    }
  }

}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFTriggerEventRunnerDelegate)delegate
{
  return self->_delegate;
}

- (WFWorkflowRunEvent)inProgressRunEvent
{
  return self->_inProgressRunEvent;
}

- (void)setInProgressRunEvent:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressRunEvent, a3);
}

- (WFConfiguredTrigger)inProgressTrigger
{
  return self->_inProgressTrigger;
}

- (void)setInProgressTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressTrigger, a3);
}

- (WFWorkflowRunnerClient)inProgressRunnerClient
{
  return self->_inProgressRunnerClient;
}

- (void)setInProgressRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressRunnerClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressRunnerClient, 0);
  objc_storeStrong((id *)&self->_inProgressTrigger, 0);
  objc_storeStrong((id *)&self->_inProgressRunEvent, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

@end
