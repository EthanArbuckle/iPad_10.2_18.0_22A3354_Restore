@implementation WFSequentialParameterInputProvider

- (WFSequentialParameterInputProvider)initWithDelegate:(id)a3
{
  id v4;
  WFSequentialParameterInputProvider *v5;
  WFSequentialParameterInputProvider *v6;
  WFSequentialParameterInputProvider *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFSequentialParameterInputProvider;
  v5 = -[WFSequentialParameterInputProvider init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)startWithAction:(id)a3 parameters:(id)a4 defaultStates:(id)a5 prompts:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = a6;
  v13 = (void *)objc_msgSend(v10, "copyForProcessing");
  -[WFSequentialParameterInputProvider setFakeAction:](self, "setFakeAction:", v13);

  v14 = (void *)MEMORY[0x1E0C99E10];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __87__WFSequentialParameterInputProvider_startWithAction_parameters_defaultStates_prompts___block_invoke;
  v39[3] = &unk_1E7AECEB0;
  v39[4] = self;
  objc_msgSend(v11, "if_compactMap:", v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "orderedSetWithOrderedSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSequentialParameterInputProvider setQueuedParameters:](self, "setQueuedParameters:", v16);

  -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workflow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "willBeAddedToWorkflow:", v18);

  -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workflow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "wasAddedToWorkflow:", v20);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v26, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "key");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setParameterState:forKey:", v28, v30);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v23);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFSequentialParameterInputProvider setInputtedStates:](self, "setInputtedStates:", v31);

  v32 = (void *)objc_msgSend(v12, "copy");
  -[WFSequentialParameterInputProvider setDefaultStates:](self, "setDefaultStates:", v32);

  v33 = (void *)objc_msgSend(v34, "copy");
  -[WFSequentialParameterInputProvider setPrompts:](self, "setPrompts:", v33);

  -[WFSequentialParameterInputProvider askForParameterIfAvailable](self, "askForParameterIfAvailable");
}

- (void)askForParameterIfAvailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFBooleanSubstitutableState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  -[WFSequentialParameterInputProvider queuedParameters](self, "queuedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSequentialParameterInputProvider queuedParameters](self, "queuedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

    -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleParametersWithProcessing:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("key"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = -[WFBooleanSubstitutableState initWithBoolValue:]([WFBooleanSubstitutableState alloc], "initWithBoolValue:", 1);
        -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParameterState:forKey:", v10, v12);

        -[WFSequentialParameterInputProvider askForParameterIfAvailable](self, "askForParameterIfAvailable");
      }
      else
      {
        -[WFSequentialParameterInputProvider defaultStates](self, "defaultStates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v10 = (WFBooleanSubstitutableState *)objc_claimAutoreleasedReturnValue();

        -[WFSequentialParameterInputProvider prompts](self, "prompts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFSequentialParameterInputProvider delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSequentialParameterInputProvider fakeAction](self, "fakeAction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke;
        v20[3] = &unk_1E7AECED8;
        v20[4] = self;
        v21 = v4;
        objc_msgSend(v18, "sequentialParameterInputProvider:didAdvanceToParameter:action:defaultState:prompt:completion:", self, v21, v19, v10, v17, v20);

      }
    }
    else
    {
      -[WFSequentialParameterInputProvider askForParameterIfAvailable](self, "askForParameterIfAvailable");
    }
  }
  else
  {
    -[WFSequentialParameterInputProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSequentialParameterInputProvider inputtedStates](self, "inputtedStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sequentialParameterInputProvider:didFinishWithInputtedStates:", self, v9);
  }

}

- (void)persistInFlightParameters
{
  void *v3;
  id v4;

  -[WFSequentialParameterInputProvider delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSequentialParameterInputProvider inputtedStates](self, "inputtedStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sequentialParameterInputProvider:didFinishWithInputtedStates:", self, v3);

}

- (WFSequentialParameterInputProviderDelegate)delegate
{
  return (WFSequentialParameterInputProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFAction)fakeAction
{
  return self->_fakeAction;
}

- (void)setFakeAction:(id)a3
{
  objc_storeStrong((id *)&self->_fakeAction, a3);
}

- (NSMutableOrderedSet)queuedParameters
{
  return self->_queuedParameters;
}

- (void)setQueuedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_queuedParameters, a3);
}

- (NSDictionary)defaultStates
{
  return self->_defaultStates;
}

- (void)setDefaultStates:(id)a3
{
  objc_storeStrong((id *)&self->_defaultStates, a3);
}

- (NSDictionary)prompts
{
  return self->_prompts;
}

- (void)setPrompts:(id)a3
{
  objc_storeStrong((id *)&self->_prompts, a3);
}

- (NSMutableDictionary)inputtedStates
{
  return self->_inputtedStates;
}

- (void)setInputtedStates:(id)a3
{
  objc_storeStrong((id *)&self->_inputtedStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedStates, 0);
  objc_storeStrong((id *)&self->_prompts, 0);
  objc_storeStrong((id *)&self->_defaultStates, 0);
  objc_storeStrong((id *)&self->_queuedParameters, 0);
  objc_storeStrong((id *)&self->_fakeAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sequentialParameterInputProviderDidCancel:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    objc_msgSend(v6, "fakeAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "setParameterState:forKey:", v5, v11);

    if ((v12 & 1) == 0)
    {
      getWFGeneralLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v19 = "-[WFSequentialParameterInputProvider askForParameterIfAvailable]_block_invoke";
        v20 = 2112;
        v21 = v5;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Unable to set parameter state: %@ for key: %@ in sequential parameter input provider", buf, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "inputtedStates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v5, v16);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke_117;
    block[3] = &unk_1E7AF94B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __64__WFSequentialParameterInputProvider_askForParameterIfAvailable__block_invoke_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "askForParameterIfAvailable");
}

id __87__WFSequentialParameterInputProvider_startWithAction_parameters_defaultStates_prompts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fakeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "localizedPrompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setLocalizedPrompt:", v9);

  }
  return v6;
}

@end
