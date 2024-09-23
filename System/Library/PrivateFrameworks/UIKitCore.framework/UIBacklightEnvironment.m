@implementation UIBacklightEnvironment

void __42___UIBacklightEnvironment__traitOverrides__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNSIntegerValue:forTrait:", v3, v4);

  objc_msgSend(v5, "_setNSIntegerValue:forTraitToken:", *(_QWORD *)(a1 + 40), 0x1E1A99708);
}

void __48___UIBacklightEnvironment__postSynchronizeQueue__block_invoke()
{
  _UIAfterCACommitQueue *v0;
  void *v1;

  v0 = objc_alloc_init(_UIAfterCACommitQueue);
  v1 = (void *)qword_1ECD7E2D0;
  qword_1ECD7E2D0 = (uint64_t)v0;

}

void __83___UIBacklightEnvironment__notifyObserversEnvironmentVisualStateWillChangeToState___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_willExitAlwaysOn");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:", sel_puic_willExitAlwaysOn);
  }

}

void __83___UIBacklightEnvironment__notifyObserversEnvironmentVisualStateWillChangeToState___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_willEnterAlwaysOn");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:", sel_puic_willEnterAlwaysOn);
  }

}

void __87___UIBacklightEnvironment__notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_didExitAlwaysOn");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:", sel_puic_didExitAlwaysOn);
  }

}

void __89___UIBacklightEnvironment__notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_didEnterAlwaysOn");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "performSelector:", sel_puic_didEnterAlwaysOn);
  }

}

uint64_t __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    v2 = UIAlwaysOnFallbackTimelineIdentifier_block_invoke___s_category;
    if (!UIAlwaysOnFallbackTimelineIdentifier_block_invoke___s_category)
    {
      v2 = __UILogCategoryGetNode("UIBacklightEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&UIAlwaysOnFallbackTimelineIdentifier_block_invoke___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isAnimated"))
        v7 = CFSTR("Animated");
      else
        v7 = CFSTR("Non-animated");
      objc_msgSend(*(id *)(a1 + 40), "_windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%@ transitionTraitsInUpdate about to call _componentDidUpdateTraitOverrides on %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_componentDidUpdateTraitOverrides:", *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_140(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "windows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "layoutIfNeeded");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __106___UIBacklightEnvironment__performOnChildViewControllersForAlwaysOnTimelines_performBlock_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("_UIBacklightEnvironment.m"), 425, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!result)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

void __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "performSelector:withObject:", sel_puic_updateWithFrameSpecifier_, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "_updateWithFrameSpecifier:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_updateWithFrameSpecifier:completion:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "previousVisualState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "visualState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "isAnimated");
  kdebug_trace();

  return objc_msgSend(*(id *)(a1 + 48), "sceneContentsDidUpdate");
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[6];
  __int16 v14;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("_UIBacklightEnvironment.m"), 511, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_3;
  v13[3] = &unk_1E16C0840;
  v14 = *(_WORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 64);
  v13[4] = v3;
  v13[5] = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_5;
  v8[3] = &unk_1E16BE398;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v3, "transitionTraitsInUpdate:animations:completion:", v5, v13, v8);

}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_3(uint64_t a1)
{
  _QWORD v3[4];
  __int128 v4;
  __int16 v5;

  kdebug_trace();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_4;
  v3[3] = &unk_1E16C0840;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_WORD *)(a1 + 48);
  return objc_msgSend((id)v4, "updateSceneWithFrameSpecifier:layout:completion:", 0, 0, v3);
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_4(uint64_t a1)
{
  void *v3;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIBacklightEnvironment.m"), 519, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  return kdebug_trace();
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_5(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "sceneContentsAnimationDidComplete");
  v2 = objc_msgSend(*(id *)(a1 + 32), "areSceneContentsUpdated");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_6;
    v7[3] = &unk_1E16BB458;
    v4 = *(id *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v9 = v4;
    v7[4] = v5;
    v8 = v6;
    objc_msgSend(v3, "_commit:andPerformPostSynchronizeBlock:", 0, v7);

  }
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:", *(_QWORD *)(a1 + 40));
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_7(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isAnimated"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "isAnimated")
    && *(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_8;
    block[3] = &unk_1E16B1BF8;
    v3 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_9(uint64_t a1)
{
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_commit:andPerformPostSynchronizeBlock:", 1, *(_QWORD *)(a1 + 48));
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sceneContentsAnimationDidComplete");
  return objc_msgSend(*(id *)(a1 + 40), "_notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn:", *(_QWORD *)(a1 + 48));
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UIBacklightEnvironment.m"), 598, CFSTR("Call must be made on main thread"));

  }
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_14;
  v9[3] = &unk_1E16B1B28;
  v10 = v2;
  objc_msgSend(v3, "transitionTraitsInUpdate:animations:completion:", v10, &__block_literal_global_150, v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_15;
  v7[3] = &unk_1E16B1B28;
  v5 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_commit:andPerformPostSynchronizeBlock:", 1, v7);

}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sceneContentsAnimationDidComplete");
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sceneContentsDidUpdate");
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_16(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    return objc_msgSend(*(id *)(a1 + 40), "updateSceneWithFrameSpecifier:layout:completion:", v2, 1, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:withObject:", sel_puic_timelinesForDateInterval_, *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v5, "_timelinesForDateInterval:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
LABEL_7:

}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_3;
  v10[3] = &unk_1E16CB918;
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  v13 = a1[7];
  v10[4] = v6;
  v11 = v8;
  v12 = v5;
  v9 = v5;
  objc_msgSend(a2, "_timelinesForDateInterval:completion:", v7, v10);

}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_UIBacklightEnvironment.m"), 667, CFSTR("Call must be made on main thread"));

  }
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
