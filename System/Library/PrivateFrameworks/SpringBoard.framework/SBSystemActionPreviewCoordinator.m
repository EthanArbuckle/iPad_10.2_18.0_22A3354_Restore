@implementation SBSystemActionPreviewCoordinator

- (uint64_t)initWithWindowScene:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  uint64_t result;
  void *v8;
  objc_super v9;

  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_5;
  if (v4)
  {
    v9.receiver = a1;
    v9.super_class = (Class)SBSystemActionPreviewCoordinator;
    v6 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v6;
    if (v6)
      objc_storeStrong(v6 + 5, a2);
LABEL_5:

    return (uint64_t)a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowScene != ((void *)0)"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionPreviewCoordinator initWithWindowScene:].cold.1(sel_initWithWindowScene_, (uint64_t)a1, (uint64_t)v8);
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)addPreviewProvider:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)previewContextForAction:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[SBSystemActionSceneElementProvider providesSceneElementForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v3))
  {
    +[SBSystemActionSceneElementProvider previewContextForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)showPreviewForAction:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[SBSystemActionPreviewCoordinator _showPreviewForAction:withContext:]((id *)&self->super.isa, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionPreviewCoordinator _notifyDidBeginPreview:forAction:]((uint64_t)self, v8, v6);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke;
  v16[3] = &unk_1E8EB8D40;
  objc_copyWeak(&v18, &location);
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "addExpansionInvalidationBlock:", v16);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke_2;
  v13[3] = &unk_1E8EB8D40;
  objc_copyWeak(&v15, &location);
  v11 = v10;
  v14 = v11;
  objc_msgSend(v8, "addInvalidationBlock:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_showPreviewForAction:(void *)a3 withContext:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  SBSystemActionCompoundPreviewAssertion *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  id v42;
  id *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  id *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemApertureController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "configuredAction");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SBFEffectiveArtworkSubtype();
    if (v8 > 2795)
    {
      if (v8 != 2868 && v8 != 2796)
        goto LABEL_18;
    }
    else if (v8 != 2556 && v8 != 2622)
    {
      goto LABEL_18;
    }
    if (+[SBSystemActionSceneElementProvider providesSceneElementForSystemAction:]((uint64_t)SBSystemActionSceneElementProvider, v5))
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(a1[3], "objectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v64;
LABEL_11:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v12);
          if ((-[SBSystemActionSceneElementProvider providesElementForSystemAction:withContext:](v13, v5, v6) & 1) != 0)break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
            if (v10)
              goto LABEL_11;
            goto LABEL_17;
          }
        }
        v17 = v13;

        if (v17)
          goto LABEL_24;
      }
      else
      {
LABEL_17:

      }
      v17 = -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:]((id *)[SBSystemActionSceneElementProvider alloc], v5, v46, v6);
      v18 = a1[3];
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v19 = objc_claimAutoreleasedReturnValue();
        v21 = a1[3];
        v20 = (uint64_t *)(a1 + 3);
        *v20 = v19;

        v18 = (id)*v20;
      }
      objc_msgSend(v18, "addObject:", v17);
LABEL_24:
      -[SBSystemActionSceneElementProvider previewForReason:]((uint64_t)v17, CFSTR("Show Preview"));
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
LABEL_18:
    v14 = a1[1];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke;
    v61[3] = &unk_1E8EB8D68;
    v44 = v47;
    v62 = v44;
    objc_msgSend(v14, "bs_firstObjectPassingTest:", v61);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "showPreviewForAction:withContext:", v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      a1 = v15;
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(a1[4], "keyEnumerator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v58;
LABEL_27:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v25);
          -[SBSystemActionSimplePreviewElement systemAction]((uint64_t)v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqual:", v5);

          if ((v28 & 1) != 0)
            break;
          if (v23 == ++v25)
          {
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
            if (v23)
              goto LABEL_27;
            goto LABEL_33;
          }
        }
        v30 = v26;
        objc_msgSend(a1[4], "objectForKey:", v30);
        v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        v31 = v29;
        if (v30)
          goto LABEL_40;
      }
      else
      {
LABEL_33:

        v29 = 0;
      }
      v32 = (void *)objc_msgSend(v5, "newSimplePreviewElement");
      SBLogSystemActionPreviewing();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v44;
        _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "Registering simple preview element for action with identifier: %@", buf, 0xCu);
      }

      objc_msgSend(v46, "registerElement:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, a1);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_38;
      v54[3] = &unk_1E8EA1940;
      objc_copyWeak(&v56, (id *)buf);
      v35 = v32;
      v55 = v35;
      objc_msgSend(v34, "addInvalidationBlock:", v54);
      v36 = [SBSystemActionCompoundPreviewAssertion alloc];
      v37 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_2;
      v51[3] = &unk_1E8EB8D90;
      v52 = v35;
      v38 = v34;
      v53 = v38;
      v49[0] = v37;
      v49[1] = 3221225472;
      v49[2] = __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_3;
      v49[3] = &unk_1E8EB8DB8;
      v30 = v52;
      v50 = v30;
      v31 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v36, v44, v51, v49);

      v39 = a1[4];
      if (!v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v40 = objc_claimAutoreleasedReturnValue();
        v42 = a1[4];
        v41 = (uint64_t *)(a1 + 4);
        *v41 = v40;

        v39 = (id)*v41;
      }
      objc_msgSend(v39, "setObject:forKey:", v31, v30);

      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)buf);

LABEL_40:
      -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)v31, CFSTR("Show Preview"));
      a1 = (id *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
    }

    v17 = v62;
LABEL_42:

  }
  return a1;
}

- (void)_notifyDidBeginPreview:(void *)a3 forAction:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "systemActionPreviewCoordinator:didBeginPreview:forAction:", a1, v5, v6);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    -[SBSystemActionPreviewCoordinator _notifyDidInvalidateExpansionOfPreview:forAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), a3);

}

- (void)_notifyDidInvalidateExpansionOfPreview:(void *)a3 forAction:(uint64_t)a4 withResult:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "systemActionPreviewCoordinator:didInvalidateExpansionOfPreview:forAction:withResult:", a1, v7, v8, a4);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

void __69__SBSystemActionPreviewCoordinator_showPreviewForAction_withContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    -[SBSystemActionPreviewCoordinator _notifyDidEndPreview:forAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), a3);

}

- (void)_notifyDidEndPreview:(void *)a3 forAction:(uint64_t)a4 withResult:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "systemActionPreviewCoordinator:didEndPreview:forAction:withResult:", a1, v7, v8, a4);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (id)customSoundForPerformingAction:(id)a3
{
  void *v4;
  void *v5;
  NSMutableSet *previewProviders;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "configuredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  previewProviders = self->_previewProviders;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SBSystemActionPreviewCoordinator_customSoundForPerformingAction___block_invoke;
  v11[3] = &unk_1E8EB8D68;
  v12 = v5;
  v7 = v5;
  -[NSMutableSet bs_firstObjectPassingTest:](previewProviders, "bs_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "soundForPerformingActionWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __67__SBSystemActionPreviewCoordinator_customSoundForPerformingAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "providesPreviewForActionWithIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)provideDiscreteNoActionInteractionFeedback
{
  void *v2;
  id v3;

  -[SBSystemActionPreviewCoordinator windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "animateDiscreteAnimationStyle:toElement:", 2, 0);
}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "providesPreviewForActionWithIdentifier:", *(_QWORD *)(a1 + 32));
}

void __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_38(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[4], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t result;

  v3 = -[SBSystemActionCompoundPreviewAssertion state](a2);
  objc_msgSend(*(id *)(a1 + 32), "setPreviewing:", v3 & 1);
  objc_msgSend(*(id *)(a1 + 32), "setUrgent:", HIBYTE(v3) & 1);
  objc_msgSend(*(id *)(a1 + 32), "setExpanding:", (v3 >> 8) & 1);
  objc_msgSend(*(id *)(a1 + 32), "setProminent:", HIWORD(v3) & 1);
  result = objc_msgSend(*(id *)(a1 + 40), "isValid");
  if ((v3 & 1) == 0)
  {
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 40), "invalidateWithReason:", CFSTR("Compound previewing ended"));
  }
  return result;
}

uint64_t __70__SBSystemActionPreviewCoordinator__showPreviewForAction_withContext___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "pop");
  return result;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_activeSimplePreviewElementsToAssertions, 0);
  objc_storeStrong((id *)&self->_activeSceneElementProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previewProviders, 0);
}

- (void)initWithWindowScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSystemActionPreviewCoordinator.m");
  v16 = 1024;
  v17 = 52;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
