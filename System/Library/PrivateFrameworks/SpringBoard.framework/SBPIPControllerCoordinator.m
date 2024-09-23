@implementation SBPIPControllerCoordinator

- (BOOL)hasIdleTimerBehaviors
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBPIPControllerCoordinator_hasIdleTimerBehaviors__block_invoke;
  v4[3] = &unk_1E8EB5380;
  v4[4] = &v5;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHostingAnApp
{
  void *v2;
  BOOL v3;

  -[SBPIPControllerCoordinator hostedAppSceneHandles](self, "hostedAppSceneHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)hostedAppSceneHandles
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBPIPControllerCoordinator_hostedAppSceneHandles__block_invoke;
  v6[3] = &unk_1E8E9E3D8;
  v4 = v3;
  v7 = v4;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v6);

  return v4;
}

- (void)_enumerateControllersByDescendingPriority:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (_enumerateControllersByDescendingPriority__onceToken != -1)
    dispatch_once(&_enumerateControllersByDescendingPriority__onceToken, &__block_literal_global_234);
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)_enumerateControllersByDescendingPriority____typesByPriority;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKey:](self->_controllersByType, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v4[2](v4, v10, &v15);
          if (v15)
          {

            goto LABEL_14;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

}

void __51__SBPIPControllerCoordinator_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hostedAppSceneHandles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __51__SBPIPControllerCoordinator_hasIdleTimerBehaviors__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasIdleTimerBehaviors");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __81__SBPIPControllerCoordinator_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPresentingPictureInPictureRequiringMedusaKeyboard");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __64__SBPIPControllerCoordinator_isAnyPictureInPictureWindowVisible__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPictureInPictureWindowVisibleOnWindowScene:", 0);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 pipContentType:(int64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[SBPIPControllerCoordinator controllerForType:](self, "controllerForType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", v6, v8);

  return v6;
}

- (id)controllerForType:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;

  if (SBPIPContentTypeIsValid(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_controllersByType, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSBPIPContentType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 83, CFSTR("invalid contentType received: %@"), v8);

    v7 = 0;
  }

  return v7;
}

- (BOOL)isAnyPictureInPictureWindowVisible
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SBPIPControllerCoordinator_isAnyPictureInPictureWindowVisible__block_invoke;
  v4[3] = &unk_1E8EB5380;
  v4[4] = &v5;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__SBPIPControllerCoordinator_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke;
  v4[3] = &unk_1E8EB5380;
  v4[4] = &v5;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (SBPIPControllerCoordinator)init
{
  SBPIPControllerCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *controllersByType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBPIPControllerCoordinator;
  v2 = -[SBPIPControllerCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    controllersByType = v2->_controllersByType;
    v2->_controllersByType = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setWindowSceneManager:(id)a3
{
  SBWindowSceneManager *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (SBWindowSceneManager *)a3;
  if (self->_windowSceneManager != v5)
  {
    objc_storeStrong((id *)&self->_windowSceneManager, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_controllersByType, "objectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setWindowSceneManager:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)registerController:(id)a3 forType:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!SBPIPContentTypeIsValid(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSBPIPContentType(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 61, CFSTR("Attempt to register pipController %@ for invalid contentType: %@"), v7, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_controllersByType, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSBPIPContentType(a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 66, CFSTR("Attempt to register pipController %@ for type %@ when one is already registered: %@"), v7, v19, v11);

  }
  v12 = objc_msgSend(v7, "contentType");
  if (v12 != a4)
  {
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSBPIPContentType(a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSBPIPContentType(v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 69, CFSTR("Attempt to register pipController %@ for contentType %@ when the pipController itself reports contentType %@"), v7, v22, v23);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = self->_pictureInPictureWindowsHiddenReasons;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v7, "setPictureInPictureWindowsHidden:forReason:", 1, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  objc_msgSend(v7, "setWindowSceneManager:", self->_windowSceneManager);
  -[NSMutableDictionary setObject:forKey:](self->_controllersByType, "setObject:forKey:", v7, v10);

}

void __72__SBPIPControllerCoordinator__enumerateControllersByDescendingPriority___block_invoke()
{
  void *v0;

  v0 = (void *)_enumerateControllersByDescendingPriority____typesByPriority;
  _enumerateControllersByDescendingPriority____typesByPriority = (uint64_t)&unk_1E91CEB90;

}

- (void)setPictureInPictureWindowsHidden:(BOOL)a3 withReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  v7 = -[NSMutableSet containsObject:](self->_pictureInPictureWindowsHiddenReasons, "containsObject:", v6);
  if (v4)
  {
    if ((v7 & 1) == 0)
      -[NSMutableSet addObject:](self->_pictureInPictureWindowsHiddenReasons, "addObject:", v6);
  }
  else if (v7)
  {
    -[NSMutableSet removeObject:](self->_pictureInPictureWindowsHiddenReasons, "removeObject:", v6);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__SBPIPControllerCoordinator_setPictureInPictureWindowsHidden_withReason___block_invoke;
  v9[3] = &unk_1E8E9E508;
  v11 = v4;
  v10 = v6;
  v8 = v6;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v9);

}

uint64_t __74__SBPIPControllerCoordinator_setPictureInPictureWindowsHidden_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPictureInPictureWindowsHidden:forReason:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3 pipContentType:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[SBPIPControllerCoordinator controllerForType:](self, "controllerForType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tetheringModeForScenePersistenceIdentifier:", v6);

  return v8;
}

- (void)handleDestructionRequestForSceneHandles:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SBPIPControllerCoordinator_handleDestructionRequestForSceneHandles___block_invoke;
  v6[3] = &unk_1E8E9E3D8;
  v7 = v4;
  v5 = v4;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v6);

}

uint64_t __70__SBPIPControllerCoordinator_handleDestructionRequestForSceneHandles___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDestructionRequestForSceneHandles:", *(_QWORD *)(a1 + 32));
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__81;
  v15 = __Block_byref_object_dispose__81;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SBPIPControllerCoordinator_coordinatorRequestedIdleTimerBehavior___block_invoke;
  v8[3] = &unk_1E8EB53A8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBPIPControllerCoordinator _enumerateControllersByDescendingPriority:](self, "_enumerateControllersByDescendingPriority:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__SBPIPControllerCoordinator_coordinatorRequestedIdleTimerBehavior___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "coordinatorRequestedIdleTimerBehavior:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }

}

- (BOOL)canHostAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 211, CFSTR("%@ should never be called"), v5);

  return 0;
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerCoordinator.m"), 224, CFSTR("%@ should never be called"), v5);

}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPictureWindowsHiddenReasons, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_controllersByType, 0);
}

@end
