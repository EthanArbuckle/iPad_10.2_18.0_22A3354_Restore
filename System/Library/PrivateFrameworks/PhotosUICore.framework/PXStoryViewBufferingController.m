@implementation PXStoryViewBufferingController

- (PXStoryViewBufferingController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewBufferingController.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryViewBufferingController initWithObservableModel:]");

  abort();
}

- (PXStoryViewBufferingController)initWithViewModel:(id)a3
{
  id v4;
  PXStoryViewBufferingController *v5;
  PXStoryViewBufferingController *v6;
  id v7;
  uint64_t v8;
  PXStoryViewBufferingController *v9;
  _QWORD v11[4];
  PXStoryViewBufferingController *v12;
  _QWORD v13[4];
  PXStoryViewBufferingController *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryViewBufferingController;
  v5 = -[PXStoryController initWithObservableModel:](&v15, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_viewModel, v4);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PXStoryViewBufferingController_initWithViewModel___block_invoke;
    v13[3] = &unk_1E5146E78;
    v9 = v6;
    v14 = v9;
    objc_msgSend(v4, "performChanges:", v13);

    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __52__PXStoryViewBufferingController_initWithViewModel___block_invoke_2;
    v11[3] = &unk_1E5128648;
    v12 = v9;
    -[PXStoryController performChanges:](v12, "performChanges:", v11);

  }
  return v6;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewBufferingController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateBufferingController);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateBufferingControllerProperties);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateWantsBufferingHUDVisible);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateViewModelProperties);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryViewBufferingController _invalidateBufferingControllerProperties](self, "_invalidateBufferingControllerProperties");
  }
}

- (double)lastNoncriticalBufferingDuration
{
  void *v2;
  double v3;
  double v4;

  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastNoncriticalBufferingDuration");
  v4 = v3;

  return v4;
}

- (double)lastCriticalBufferingDuration
{
  void *v2;
  double v3;
  double v4;

  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastCriticalBufferingDuration");
  v4 = v3;

  return v4;
}

- (double)totalBufferingTimeInterval
{
  void *v2;
  double v3;
  double v4;

  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalBufferingTimeInterval");
  v4 = v3;

  return v4;
}

- (NSDictionary)totalBufferingTimeIntervalsPerReason
{
  void *v2;
  void *v3;

  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalBufferingTimeIntervalsPerReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewBufferingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryViewBufferingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5128670;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  objc_super v5;
  _QWORD v6[6];

  if ((void *)BufferingControllerObservationContext == a5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__PXStoryViewBufferingController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E5128670;
    v6[4] = self;
    v6[5] = a4;
    -[PXStoryController performChanges:](self, "performChanges:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryViewBufferingController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryViewBufferingController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewBufferingController setModel:](self, "setModel:", v3);

}

- (void)_invalidateBufferingController
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateBufferingController);

}

- (void)_updateBufferingController
{
  PXStoryBufferingController *v3;
  PXStoryBufferingController *v4;
  id v5;

  v3 = [PXStoryBufferingController alloc];
  -[PXStoryViewBufferingController model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXStoryBufferingController initWithModel:](v3, "initWithModel:", v5);
  -[PXStoryViewBufferingController setBufferingController:](self, "setBufferingController:", v4);

}

- (void)_invalidateBufferingControllerProperties
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateBufferingControllerProperties);

}

- (void)_updateBufferingControllerProperties
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PXStoryViewBufferingController__updateBufferingControllerProperties__block_invoke;
  v4[3] = &unk_1E5135D50;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateWantsBufferingHUDVisible
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWantsBufferingHUDVisible);

}

- (void)_updateWantsBufferingHUDVisible
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if ((PFOSVariantHasInternalUI() & 1) != 0)
  {
    -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastCriticalBufferingDuration");
    v4 = v3;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bufferingHUDAutoPresentationTimeout");
    -[PXStoryViewBufferingController setWantsBufferingHUDVisible:](self, "setWantsBufferingHUDVisible:", v4 >= v6);

  }
  else
  {
    -[PXStoryViewBufferingController setWantsBufferingHUDVisible:](self, "setWantsBufferingHUDVisible:", 0);
  }
}

- (void)_updateViewModelProperties
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryViewBufferingController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXStoryViewBufferingController__updateViewModelProperties__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)setModel:(id)a3
{
  PXStoryModel *v5;
  char v6;
  PXStoryModel *v7;

  v7 = (PXStoryModel *)a3;
  v5 = self->_model;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryModel isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_model, a3);
      -[PXStoryViewBufferingController _invalidateBufferingController](self, "_invalidateBufferingController");
    }
  }

}

- (void)setBufferingController:(id)a3
{
  PXStoryBufferingController **p_bufferingController;
  PXStoryBufferingController *v6;
  char v7;
  PXStoryBufferingController *v8;

  v8 = (PXStoryBufferingController *)a3;
  p_bufferingController = &self->_bufferingController;
  v6 = self->_bufferingController;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryBufferingController isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryBufferingController unregisterChangeObserver:context:](*p_bufferingController, "unregisterChangeObserver:context:", self, BufferingControllerObservationContext);
      objc_storeStrong((id *)&self->_bufferingController, a3);
      -[PXStoryBufferingController registerChangeObserver:context:](*p_bufferingController, "registerChangeObserver:context:", self, BufferingControllerObservationContext);
      -[PXStoryViewBufferingController _invalidateBufferingControllerProperties](self, "_invalidateBufferingControllerProperties");
      -[PXStoryViewBufferingController _invalidateWantsBufferingHUDVisible](self, "_invalidateWantsBufferingHUDVisible");
    }
  }

}

- (void)setWantsBufferingHUDVisible:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_wantsBufferingHUDVisible != a3)
  {
    self->_wantsBufferingHUDVisible = a3;
    if (a3)
    {
      -[PXStoryViewBufferingController viewModel](self, "viewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewBufferingController setOriginalIsHUDVisible:](self, "setOriginalIsHUDVisible:", objc_msgSend(v4, "isHUDVisible"));

      -[PXStoryViewBufferingController viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewBufferingController setOriginalHUDType:](self, "setOriginalHUDType:", objc_msgSend(v5, "diagnosticHUDType"));

    }
    -[PXStoryViewBufferingController _invalidateViewModelProperties](self, "_invalidateViewModelProperties");
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "simulateSlowResourcesBuffering");

  if (v7)
    objc_msgSend(v5, "appendString:", CFSTR("Simulating slow assets buffering!!!\n"));
  -[PXStoryViewBufferingController bufferingController](self, "bufferingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewBufferingController model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "readinessStatus");
  if (v10 > 3)
    v11 = CFSTR("??");
  else
    v11 = off_1E51361A0[v10];
  v12 = v11;
  objc_msgSend(v5, "appendFormat:", CFSTR("Readiness Status: %@\n"), v12);

  if (!-[PXStoryViewBufferingController isActive](self, "isActive"))
  {
    v13 = CFSTR("Not active\n");
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isBuffering"))
  {
    v13 = CFSTR("Spinner is visible because of: \n");
LABEL_10:
    objc_msgSend(v5, "appendString:", v13);
    goto LABEL_12;
  }
  objc_msgSend(v8, "totalBufferingTimeInterval");
  objc_msgSend(v5, "appendFormat:", CFSTR("Total spinning time: %.2fs\n"), v14);
LABEL_12:
  v34 = v8;
  objc_msgSend(v8, "totalBufferingTimeIntervalsPerReason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        PXStoryBufferingReasonsDescription(objc_msgSend(v21, "unsignedIntegerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(v5, "appendFormat:", CFSTR(" · %@ - %.2fs\n"), v22, v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  -[PXStoryViewBufferingController viewModel](self, "viewModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resourcesPreloadingController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewBufferingController model](self, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resourcesPreloadingControllerForModel:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if ((objc_msgSend(v28, "isCompleted") & 1) == 0)
    {
      objc_msgSend(v34, "bufferingReasons");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "containsIndex:", 2);

      if (v30)
      {
        objc_msgSend(v5, "appendString:", CFSTR("Assets Buffering Details:\n"));
        objc_msgSend(v28, "diagnosticDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v31);

      }
    }
  }
  v32 = (void *)objc_msgSend(v5, "copy");

  return v32;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryBufferingController)bufferingController
{
  return self->_bufferingController;
}

- (BOOL)wantsBufferingHUDVisible
{
  return self->_wantsBufferingHUDVisible;
}

- (BOOL)didShowBufferingHUDAutomatically
{
  return self->_didShowBufferingHUDAutomatically;
}

- (void)setDidShowBufferingHUDAutomatically:(BOOL)a3
{
  self->_didShowBufferingHUDAutomatically = a3;
}

- (BOOL)originalIsHUDVisible
{
  return self->_originalIsHUDVisible;
}

- (void)setOriginalIsHUDVisible:(BOOL)a3
{
  self->_originalIsHUDVisible = a3;
}

- (int64_t)originalHUDType
{
  return self->_originalHUDType;
}

- (void)setOriginalHUDType:(int64_t)a3
{
  self->_originalHUDType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

void __60__PXStoryViewBufferingController__updateViewModelProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "wantsBufferingHUDVisible"))
  {
    if ((objc_msgSend(v3, "isHUDVisible") & 1) == 0)
    {
      objc_msgSend(v3, "setIsHUDVisible:", 1);
      objc_msgSend(v3, "setDiagnosticHUDType:", 4);
      objc_msgSend(*(id *)(a1 + 32), "setDidShowBufferingHUDAutomatically:", 1);
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "didShowBufferingHUDAutomatically"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidShowBufferingHUDAutomatically:", 0);
    if (objc_msgSend(v3, "isHUDVisible"))
    {
      if (objc_msgSend(v3, "diagnosticHUDType") == 4)
      {
        objc_msgSend(v3, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 32), "originalIsHUDVisible"));
        objc_msgSend(v3, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "originalHUDType"));
      }
    }
  }

}

void __70__PXStoryViewBufferingController__updateBufferingControllerProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIsActive:", objc_msgSend(v2, "isActive"));

}

uint64_t __63__PXStoryViewBufferingController_observable_didChange_context___block_invoke(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 1) != 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateWantsBufferingHUDVisible");
  return result;
}

uint64_t __52__PXStoryViewBufferingController_handleModelChange___block_invoke(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 0x40) != 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateMainModel");
  return result;
}

uint64_t __52__PXStoryViewBufferingController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 4);
}

uint64_t __52__PXStoryViewBufferingController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMainModel");
}

@end
