@implementation WFReversibleLinkAction

- (id)reversibleSettingParameterKey
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFReversibleLinkAction reversibleSettingParameterKey] must be overridden"));
  return &stru_1E7AFA810;
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  WFSettingsClientBookmark *v18;
  void *v19;
  NSObject *v20;
  objc_super v21;
  _QWORD v22[5];
  id v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v7 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFReversibleLinkAction reversibleSettingParameterKey](self, "reversibleSettingParameterKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionReversalStateForAction:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = -[WFSettingsClientBookmark initWithActionReversalState:]([WFSettingsClientBookmark alloc], "initWithActionReversalState:", v17);
      if (v18)
      {
        v19 = (void *)objc_msgSend((id)objc_opt_class(), "settingsClientClass");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __117__WFReversibleLinkAction_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler___block_invoke;
        v22[3] = &unk_1E7AF4848;
        v22[4] = self;
        v24 = v12;
        v23 = v10;
        objc_msgSend(v19, "getReversalStateWithBookmark:completionHandler:", v18, v22);

      }
      else
      {
        getWFActionsLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[WFReversibleLinkAction getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:]";
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Couldn't turn action reversal state %@ into a settings client bookmark", buf, 0x16u);
        }

        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
      }

    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)WFReversibleLinkAction;
      -[WFAppIntentExecutionAction getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:](&v21, sel_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler_, v10, v11, v7, v12);
    }

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFReversibleLinkAction;
    -[WFAppIntentExecutionAction getValueForParameterData:ofProcessedParameters:fallingBackToDefaultValue:completionHandler:](&v25, sel_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler_, v10, v11, v7, v12);
  }

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v4 = a3;
  if (v4
    || (-[WFAction runningDelegate](self, "runningDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)WFReversibleLinkAction;
    -[WFAppIntentExecutionAction finishRunningWithError:](&v9, sel_finishRunningWithError_, v4);
  }
  else
  {
    v7 = (void *)objc_msgSend((id)objc_opt_class(), "settingsClientClass");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__WFReversibleLinkAction_finishRunningWithError___block_invoke;
    v8[3] = &unk_1E7AF4870;
    v8[4] = self;
    objc_msgSend(v7, "getBookmarkForCurrentStateWithCompletionHandler:", v8);
  }

}

void __49__WFReversibleLinkAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "actionReversalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action:didGenerateReversalState:", v7, v8);

    objc_msgSendSuper2(&v9, sel_finishRunningWithError_, 0, *(_QWORD *)(a1 + 32), WFReversibleLinkAction, v10.receiver, v10.super_class);
  }
  else
  {
    objc_msgSendSuper2(&v10, sel_finishRunningWithError_, a3, v9.receiver, v9.super_class, *(_QWORD *)(a1 + 32), WFReversibleLinkAction);
  }

}

void __117__WFReversibleLinkAction_getValueForParameterData_ofProcessedParameters_fallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wf_parameterDefinitionWithParameterMetadata:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "linkValueWithValue:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else if (objc_msgSend(v5, "wf_isUserCancelledError"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (Class)settingsClientClass
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFReversibleLinkAction settingsClientClass] must be overridden"));
  return (Class)objc_opt_class();
}

@end
