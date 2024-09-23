@implementation SBContinuitySessionStateMachine

id __106___SBContinuitySessionStateMachine_initWithSystemEventMonitor_continuityDisplayAuthenticationCoordinator___block_invoke(uint64_t a1, Class a2)
{
  return (id)objc_msgSend([a2 alloc], "initWithSystemEventMonitor:continuityDisplayAuthenticationCoordinator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  id v12[3];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_2;
  v11[3] = &unk_1E8EC0A20;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)MEMORY[0x1D17E5550](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 13) != *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_SBContinuitySessionStateMachine.m"), 243, CFSTR("invalid state handler called from state %ld that isn't the current state %ld"), *(_QWORD *)(a1 + 48), objc_msgSend(v4, "state"));

    }
    objc_msgSend(v4, "_moveToInvalidStateForReasons:postToDelegate:", v6, 1);
  }

}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  id v12[3];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_4;
  v11[3] = &unk_1E8EC0A70;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)MEMORY[0x1D17E5550](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (WeakRetained[13] != *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_SBContinuitySessionStateMachine.m"), 255, CFSTR("state transition handler called from state %ld that isn't the current state %ld"), *(_QWORD *)(a1 + 48), objc_msgSend(v6, "state"));

    }
    objc_msgSend(v6, "_moveToState:", a2);
    WeakRetained = v6;
  }

}

id __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  id v12[3];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_6;
  v11[3] = &unk_1E8EC0A20;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v12[1] = a2;
  v12[2] = v4;
  v11[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1D17E5550](v11);
  v9 = (void *)MEMORY[0x1D17E5550](v5, v6, v7, v8);

  objc_destroyWeak(v12);
  return v9;
}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 13) != *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_SBContinuitySessionStateMachine.m"), 267, CFSTR("state transition handler called from state %ld that isn't the current state %ld"), *(_QWORD *)(a1 + 48), objc_msgSend(v4, "state"));

    }
    objc_msgSend(v4, "_updateCurrentStateReasons:", v6);
  }

}

void __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_7(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a1[5];
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v10 = a2;
  v6(v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStateTransitionHandler:", v7);

  (*(void (**)(void))(a1[6] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidStateHandler:", v8);

  (*(void (**)(void))(a1[7] + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStateUpdateHandler:", v9);

  objc_msgSend(v10, "setClientExternallyBlockedReasonsProvider:", a1[4]);
}

void __63___SBContinuitySessionStateMachine__updateCurrentStateReasons___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] == (id)11)
    {
      SBLogContinuityDisplay();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State Machine] already posted .invalid to client - ignoring updated reasons: %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      objc_storeStrong(WeakRetained + 16, *(id *)(a1 + 32));
      objc_msgSend(v3, "delegate");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject continuitySessionStateMachineDidUpdateState:oldState:](v4, "continuitySessionStateMachineDidUpdateState:oldState:", v3, *(_QWORD *)(a1 + 48));
    }

  }
}

void __49___SBContinuitySessionStateMachine__moveToState___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] == (id)11)
    {
      SBLogContinuityDisplay();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSBContinuitySessionState(*(_QWORD *)(a1 + 48));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State Machine] internal state is .invalid so ignoring async move to state %{public}@", (uint8_t *)&v6, 0xCu);

      }
    }
    else
    {
      WeakRetained[15] = *(id *)(a1 + 48);
      objc_storeStrong(WeakRetained + 16, *(id *)(a1 + 32));
      objc_msgSend(v3, "delegate");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject continuitySessionStateMachineDidUpdateState:oldState:](v4, "continuitySessionStateMachineDidUpdateState:oldState:", v3, *(_QWORD *)(a1 + 56));
    }

  }
}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 137), CFSTR("invalidated"), 1);
}

void __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)a1[4];
  NSStringFromSBContinuitySessionState(*(_QWORD *)(a1[5] + 120));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = (void *)a1[4];
  v5 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_3;
  v8[3] = &unk_1E8E9E820;
  v6 = v4;
  v7 = a1[5];
  v9 = v6;
  v10 = v7;
  objc_msgSend(v6, "overlayStyle:block:", v5, v8);

}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), 0);
}

void __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)a1[4];
  NSStringFromSBContinuitySessionState(*(_QWORD *)(a1[5] + 104));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = (void *)a1[4];
  v5 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_5;
  v8[3] = &unk_1E8E9E820;
  v6 = v4;
  v7 = a1[5];
  v9 = v6;
  v10 = v7;
  objc_msgSend(v6, "overlayStyle:block:", v5, v8);

}

id __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_5(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), 0);
}

@end
