@implementation WBSScribbleController

- (WBSScribbleController)initWithWebView:(id)a3
{
  id v4;
  WBSScribbleController *v5;
  WBSScribbleController *v6;
  WBSScribbleController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSScribbleController;
  v5 = -[WBSScribbleController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)getElementAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_lastRequestLocation.x = x;
  self->_lastRequestLocation.y = y;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D8]), "initWithPoint:", x, y);
  -[WBSScribbleController _applyQuirksToRequest:](self, "_applyQuirksToRequest:", v8);
  self->_isGettingElementAtPoint = 1;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__WBSScribbleController_getElementAtPoint_completion___block_invoke;
  v11[3] = &unk_1E5443DC8;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  objc_msgSend(WeakRetained, "_requestTargetedElementInfo:completionHandler:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __54__WBSScribbleController_getElementAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  WBSScribbleElement *v5;
  id v6;
  WBSScribbleElement *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 16) = 0;
    if (objc_msgSend(v8, "count"))
    {
      v5 = [WBSScribbleElement alloc];
      v6 = objc_loadWeakRetained(v4 + 1);
      v7 = -[WBSScribbleElement initWithTargetedElements:webView:](v5, "initWithTargetedElements:webView:", v8, v6);

    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_updateQuirksIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  WBSScribbleQuirks *v9;
  WBSScribbleQuirks *quirksForCurrentSession;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "safari_highLevelDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSScribbleQuirks highLevelDomain](self->_quirksForCurrentSession, "highLevelDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if ((v6 & 1) == 0)
    {
      -[WBSScribbleController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scribbleQuirksManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quirksForHighLevelDomain:", v4);
      v9 = (WBSScribbleQuirks *)objc_claimAutoreleasedReturnValue();
      quirksForCurrentSession = self->_quirksForCurrentSession;
      self->_quirksForCurrentSession = v9;

    }
  }
  else
  {
    v4 = self->_quirksForCurrentSession;
    self->_quirksForCurrentSession = 0;
  }

}

- (void)_applyQuirksToRequest:(id)a3
{
  WBSScribbleQuirks *quirksForCurrentSession;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  quirksForCurrentSession = self->_quirksForCurrentSession;
  if (quirksForCurrentSession)
  {
    -[WBSScribbleQuirks shouldIgnorePointerEventsNone](quirksForCurrentSession, "shouldIgnorePointerEventsNone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WBSScribbleQuirks shouldIgnorePointerEventsNone](self->_quirksForCurrentSession, "shouldIgnorePointerEventsNone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShouldIgnorePointerEventsNone:", objc_msgSend(v6, "BOOLValue"));

    }
  }

}

- (BOOL)hasPendingRequest
{
  return self->_isGettingElementAtPoint;
}

- (void)startValidatingHiddenElements
{
  if (-[WBSScribbleController canHideContentInWebView](self, "canHideContentInWebView")
    && (self->_validatingDelay > 1.0 || !self->_validatingTimer))
  {
    self->_validatingDelay = 1.0;
    -[WBSScribbleController _rescheduleValidation](self, "_rescheduleValidation");
  }
}

- (void)_stopValidationTimer
{
  NSTimer *validatingTimer;
  NSTimer *v4;

  validatingTimer = self->_validatingTimer;
  if (validatingTimer)
  {
    -[NSTimer invalidate](validatingTimer, "invalidate");
    v4 = self->_validatingTimer;
    self->_validatingTimer = 0;

  }
  self->_validatingDelay = 1.0;
}

- (BOOL)_hasAnyHiddenElements
{
  void *v3;
  BOOL v4;

  -[WBSUserDefinedContentBlocker actions](self->_contentBlockerForCurrentHost, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[NSMutableArray count](self->_scribbleElementsFromCurrentSession, "count") != 0;

  return v4;
}

- (id)_elementsToValidate
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *scribbleElementsFromCurrentSession;
  void *v7;

  -[WBSUserDefinedContentBlocker actions](self->_contentBlockerForCurrentHost, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  if (self->_scribbleElementsFromCurrentSession)
    scribbleElementsFromCurrentSession = self->_scribbleElementsFromCurrentSession;
  else
    scribbleElementsFromCurrentSession = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", scribbleElementsFromCurrentSession);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

WBSScribbleElement *__44__WBSScribbleController__elementsToValidate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSScribbleElement *v3;

  v2 = a2;
  v3 = -[WBSScribbleElement initWithContentBlockerAction:]([WBSScribbleElement alloc], "initWithContentBlockerAction:", v2);

  return v3;
}

- (BOOL)_shouldValidateOrUpdateScrollability
{
  id WeakRetained;
  void *v4;
  BOOL v5;

  if (!-[WBSScribbleController _hasAnyHiddenElements](self, "_hasAnyHiddenElements"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if ((objc_msgSend(WeakRetained, "_isSuspended") & 1) != 0
    || !objc_msgSend(WeakRetained, "_webProcessIsResponsive"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  return v5;
}

- (void)_rescheduleValidation
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Attempted to reschedule without starting element validation.", a5, a6, a7, a8, 0);
}

void __46__WBSScribbleController__rescheduleValidation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  double *WeakRetained;
  double *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((_QWORD *)WeakRetained + 3);
    WeakRetained[3] = 0.0;

    v6[4] = v6[4] + v6[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__WBSScribbleController__rescheduleValidation__block_invoke_2;
    v8[3] = &unk_1E5441F48;
    objc_copyWeak(&v9, v4);
    objc_msgSend(v6, "_validateHiddenElements:", v8);
    objc_destroyWeak(&v9);
  }

}

void __46__WBSScribbleController__rescheduleValidation__block_invoke_2(uint64_t a1)
{
  double *WeakRetained;
  double *v2;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[4] <= 8.0)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_rescheduleValidation");
    WeakRetained = v2;
  }

}

- (void)_validateHiddenElements:(id)a3
{
  id v4;
  void *v5;
  WBSScribbleValidator *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  WBSScribbleValidator *v10;
  WBSScribbleValidator *validator;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_validator)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = [WBSScribbleValidator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    -[WBSScribbleController _elementsToValidate](self, "_elementsToValidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSScribbleController _targetsHiddenByUserOrValidation](self, "_targetsHiddenByUserOrValidation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke;
    v12[3] = &unk_1E54443E8;
    objc_copyWeak(&v14, &location);
    v13 = v5;
    v10 = -[WBSScribbleValidator initWithWebView:elements:excludedTargets:completion:](v6, "initWithWebView:elements:excludedTargets:completion:", WeakRetained, v8, v9, v12);
    validator = self->_validator;
    self->_validator = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __49__WBSScribbleController__validateHiddenElements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v3)
  {
    v5 = dispatch_group_create();
    objc_msgSend(v3, "targetsToReveal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "targetsToHide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      dispatch_group_enter(v5);
      objc_msgSend(v3, "targetsToReveal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke_2;
      v21[3] = &unk_1E5441CB8;
      v22 = v5;
      objc_msgSend(WeakRetained, "_resetPaintAvoidanceForElements:completion:", v10, v21);

    }
    if (objc_msgSend(v7, "count"))
    {
      dispatch_group_enter(v5);
      objc_msgSend(v3, "targetsToHide");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v17 = 3221225472;
      v18 = __49__WBSScribbleController__validateHiddenElements___block_invoke_3;
      v19 = &unk_1E5441CB8;
      v20 = v5;
      objc_msgSend(WeakRetained, "_hideElementUsingPaintAvoidance:forGlobalRule:completion:", v11, 0, &v16);

      v12 = (void *)WeakRetained[11];
      if (!v12)
      {
        v13 = objc_opt_new();
        v14 = (void *)WeakRetained[11];
        WeakRetained[11] = v13;

        v12 = (void *)WeakRetained[11];
      }
      objc_msgSend(v12, "addObjectsFromArray:", v7, v16, v17, v18, v19);
      objc_msgSend(WeakRetained, "_updateUserStyleSheet");

    }
    v15 = (void *)WeakRetained[13];
    WeakRetained[13] = 0;

    dispatch_group_notify(v5, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_targetsHiddenByUserOrValidation
{
  NSMutableArray *targetedElementsHiddenByValidation;
  NSMutableArray *targetedElementsHiddenByUser;
  NSMutableArray *v4;

  targetedElementsHiddenByValidation = self->_targetedElementsHiddenByValidation;
  if (self->_targetedElementsHiddenByUser)
    targetedElementsHiddenByUser = self->_targetedElementsHiddenByUser;
  else
    targetedElementsHiddenByUser = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  if (targetedElementsHiddenByValidation)
    v4 = targetedElementsHiddenByValidation;
  else
    v4 = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  return (id)-[NSMutableArray arrayByAddingObjectsFromArray:](targetedElementsHiddenByUser, "arrayByAddingObjectsFromArray:", v4);
}

- (void)_resetPaintAvoidanceForElements:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  _QWORD v9[5];
  void (**v10)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke;
    v9[3] = &unk_1E5441DA8;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(WeakRetained, "_resetVisibilityAdjustmentsForTargetedElements:completionHandler:", v6, v9);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

uint64_t __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "updateCountForElementsHiddenByPaintingAvoidance");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_hideElementUsingPaintAvoidance:(id)a3 forGlobalRule:(BOOL)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__WBSScribbleController__hideElementUsingPaintAvoidance_forGlobalRule_completion___block_invoke;
    v10[3] = &unk_1E5441DA8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(WeakRetained, "_adjustVisibilityForTargetedElements:completionHandler:", v7, v10);

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

uint64_t __82__WBSScribbleController__hideElementUsingPaintAvoidance_forGlobalRule_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "updateCountForElementsHiddenByPaintingAvoidance");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateCountForElementsHiddenByPaintingAvoidance
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__WBSScribbleController_updateCountForElementsHiddenByPaintingAvoidance__block_invoke;
  v4[3] = &unk_1E5444410;
  v4[4] = self;
  objc_msgSend(WeakRetained, "_numberOfVisibilityAdjustmentRectsWithCompletionHandler:", v4);

}

void __72__WBSScribbleController_updateCountForElementsHiddenByPaintingAvoidance__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scribbleControllerDidUpdateHiddenElementCount:", *(_QWORD *)(a1 + 32));

}

- (void)setDelegate:(id)a3
{
  WBSScribbleControllerDelegate **p_delegate;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "userDefinedContentBlockerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeUserDefinedContentBlockerObserver:", self);

  }
  objc_storeWeak((id *)p_delegate, v5);
  objc_msgSend(v5, "userDefinedContentBlockerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addUserDefinedContentBlockerObserver:", self);
}

- (void)loadContentBlockerForHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  id v10;
  NSMutableArray *targetedElementsHiddenByUser;
  NSMutableArray *targetedElementsHiddenByValidation;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(MEMORY[0x1E0D8A120], "isScribbleEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "userDefinedContentBlockerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "normalBrowsingUserDefinedContentBlockerManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __51__WBSScribbleController_loadContentBlockerForHost___block_invoke;
      v16[3] = &unk_1E5444438;
      objc_copyWeak(&v18, &location);
      v17 = WeakRetained;
      objc_msgSend(v9, "contentBlockerForHost:createIfNeeded:completionHandler:", v4, 0, v16);

      objc_destroyWeak(&v18);
    }
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __51__WBSScribbleController_loadContentBlockerForHost___block_invoke_2;
    v13[3] = &unk_1E5444438;
    objc_copyWeak(&v15, &location);
    v10 = WeakRetained;
    v14 = v10;
    objc_msgSend(v6, "contentBlockerForHost:createIfNeeded:completionHandler:", v4, 0, v13);
    self->_numberOfElementsHiddenByPaintingAvoidance = 0;
    -[WBSScribbleController updateCountForElementsHiddenByPaintingAvoidance](self, "updateCountForElementsHiddenByPaintingAvoidance");
    targetedElementsHiddenByUser = self->_targetedElementsHiddenByUser;
    self->_targetedElementsHiddenByUser = 0;

    targetedElementsHiddenByValidation = self->_targetedElementsHiddenByValidation;
    self->_targetedElementsHiddenByValidation = 0;

    *(_WORD *)&self->_isUpdatingShouldMakePageScrollableAndInteractable = 0;
    -[WBSScribbleController _updateUserStyleSheet](self, "_updateUserStyleSheet");

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __51__WBSScribbleController_loadContentBlockerForHost___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[7];
    objc_msgSend(v9, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 != v7)
    {
      objc_msgSend(v9, "actions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[7] = objc_msgSend(v8, "count");

      objc_msgSend(*(id *)(a1 + 32), "scribbleControllerDidUpdateHiddenElementCount:", v4);
    }
  }

}

void __51__WBSScribbleController_loadContentBlockerForHost___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 8, a2);
    objc_msgSend(*(id *)(a1 + 32), "scribbleControllerDidUpdateHiddenElementCount:", v5);
    if (objc_msgSend(v5, "_hasAnyHiddenElements"))
    {
      objc_msgSend(v5, "_makePageScrollableAndInteractableIfNeeded");
      objc_msgSend(v5, "startValidatingHiddenElements");
    }
  }

}

- (void)reloadWithoutScribbleElements
{
  id WeakRetained;

  -[WBSScribbleController _stopValidationTimer](self, "_stopValidationTimer");
  self->_numberOfElementsHiddenByPaintingAvoidance = 0;
  self->_numberOfHiddenElementsInheritedFromNormalBrowsing = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "scribbleControllerDidUpdateHiddenElementCount:", self);

}

- (void)clearAllEdits
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WBSScribbleValidator *validator;
  NSMutableArray *targetedElementsHiddenByUser;
  NSMutableArray *targetedElementsHiddenByValidation;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  WBSScribbleController *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_isScribbling)
    -[WBSScribbleController endScribblingAndSaveChanges:](self, "endScribblingAndSaveChanges:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (self->_contentBlockerForCurrentHost)
  {
    objc_msgSend(WeakRetained, "userDefinedContentBlockerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteActionsForContentBlocker:", self->_contentBlockerForCurrentHost);

  }
  if (-[WBSScribbleController numberOfAllHiddenElements](self, "numberOfAllHiddenElements"))
  {
    objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didClearScribbleSBA");

    self->_numberOfElementsHiddenByPaintingAvoidance = 0;
    self->_numberOfHiddenElementsInheritedFromNormalBrowsing = 0;
    v7 = objc_loadWeakRetained((id *)&self->_webView);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__WBSScribbleController_clearAllEdits__block_invoke;
    v21[3] = &unk_1E5444460;
    v22 = v4;
    v23 = self;
    objc_msgSend(v7, "_resetVisibilityAdjustmentsForTargetedElements:completionHandler:", 0, v21);
    -[WBSScribbleController _stopValidationTimer](self, "_stopValidationTimer");
    validator = self->_validator;
    self->_validator = 0;

    targetedElementsHiddenByUser = self->_targetedElementsHiddenByUser;
    self->_targetedElementsHiddenByUser = 0;

    targetedElementsHiddenByValidation = self->_targetedElementsHiddenByValidation;
    self->_targetedElementsHiddenByValidation = 0;

    *(_WORD *)&self->_isUpdatingShouldMakePageScrollableAndInteractable = 0;
    -[WBSUserDefinedContentBlocker setActions:](self->_contentBlockerForCurrentHost, "setActions:", MEMORY[0x1E0C9AA60]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[WBSScribbleController _currentUserContentControllers](self, "_currentUserContentControllers", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      v15 = MEMORY[0x1E0C9AA60];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "safari_updateScribbleStyleSheetForWebView:targets:forceScrollable:", v7, v15, 0);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v13);
    }

  }
}

uint64_t __38__WBSScribbleController_clearAllEdits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scribbleControllerDidUpdateHiddenElementCount:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)numberOfAllHiddenElements
{
  return self->_numberOfHiddenElementsInheritedFromNormalBrowsing + self->_numberOfElementsHiddenByPaintingAvoidance;
}

- (void)userDefinedContentBlockerManagerDidUpdateAllRules:(id)a3
{
  WBSScribbleControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  id v10;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "userDefinedContentBlockerManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v10 = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v10, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSScribbleController loadContentBlockerForHost:](self, "loadContentBlockerForHost:", v9);

  }
}

- (void)updateSelectionToPoint:(CGPoint)a3
{
  double y;
  double x;
  _QWORD v6[4];
  id v7[3];
  id location;

  if (self->_elementSelectionEnabled)
  {
    y = a3.y;
    x = a3.x;
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__WBSScribbleController_updateSelectionToPoint___block_invoke;
    v6[3] = &unk_1E5444488;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&x;
    v7[2] = *(id *)&y;
    -[WBSScribbleController getElementAtPoint:completion:](self, "getElementAtPoint:completion:", v6, x, y);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __48__WBSScribbleController_updateSelectionToPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  NSObject *v9;
  id v10;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXScribble();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __48__WBSScribbleController_updateSelectionToPoint___block_invoke_cold_1(a1, v9, v7);
    }
    objc_storeStrong(WeakRetained + 16, a2);
    v10 = objc_loadWeakRetained(WeakRetained + 15);
    objc_msgSend(v10, "scribbleController:didUpdateSelectedElement:withError:", WeakRetained, v6, v7);

  }
}

- (void)_makePageScrollableAndInteractableIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_shouldMakePageScrollableAndInteractable && !self->_isUpdatingShouldMakePageScrollableAndInteractable)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[WBSScribbleController _shouldValidateOrUpdateScrollability](self, "_shouldValidateOrUpdateScrollability"))
      {
        objc_msgSend(MEMORY[0x1E0CEF5E0], "safari_worldForScribbleScript");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isUpdatingShouldMakePageScrollableAndInteractable = 1;
        objc_initWeak(&location, self);
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke;
        v7[3] = &unk_1E54444B0;
        objc_copyWeak(&v8, &location);
        objc_msgSend(WeakRetained, "evaluateJavaScript:inFrame:inContentWorld:completionHandler:", CFSTR("(() => {    if (document?.body) {        const bodyStyle = getComputedStyle(document.body);        if (bodyStyle.overflow === 'hidden' || bodyStyle.pointerEvents === 'none')            return true;    }    if (document?.documentElement) {        const documentElementStyle = getComputedStyle(document.documentElement);        if (documentElementStyle.overflow === 'hidden' || documentElementStyle.pointerEvents === 'none')            return true;    }    return false;})();"),
          0,
          v6,
          v7);
        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);

      }
    }

  }
}

void __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  id v8;
  NSObject *v9;
  _QWORD v10[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_2;
    v10[3] = &unk_1E5441CB8;
    v10[4] = WeakRetained;
    objc_msgSend(v8, "setHandler:", v10);
    if (v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXScribble();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_cold_1((uint64_t)v6, v9);
    }
    else if (objc_msgSend(v5, "BOOLValue"))
    {
      WeakRetained[42] = 1;
      objc_msgSend(WeakRetained, "_updateUserStyleSheet");
    }

  }
}

uint64_t __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = 0;
  return result;
}

- (void)hideSelectedElement
{
  WBSScribbleElement *selectedScribbleElement;
  WBSScribbleElement *v4;
  WBSScribbleElement *v5;
  NSMutableArray *v6;
  NSMutableArray *scribbleElementsFromCurrentSession;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *targetedElementsHiddenByUser;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  _QWORD v15[4];
  WBSScribbleElement *v16;

  selectedScribbleElement = self->_selectedScribbleElement;
  if (selectedScribbleElement)
  {
    v4 = selectedScribbleElement;
    v5 = self->_selectedScribbleElement;
    self->_selectedScribbleElement = 0;

    if (!self->_scribbleElementsFromCurrentSession)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      scribbleElementsFromCurrentSession = self->_scribbleElementsFromCurrentSession;
      self->_scribbleElementsFromCurrentSession = v6;

    }
    if (-[WBSScribbleElement isOutOfFlow](v4, "isOutOfFlow"))
      -[WBSScribbleElement setScribbleStrategy:](v4, "setScribbleStrategy:", 1);
    -[WBSScribbleElement targetedElements](v4, "targetedElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "safari_prefersImageAnalysisTextWhenCheckingSimilarity"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__WBSScribbleController_hideSelectedElement__block_invoke;
      v15[3] = &unk_1E54444D8;
      v16 = v4;
      objc_msgSend(v9, "safari_imageAnalysisTextWithCompletion:", v15);

    }
    -[NSMutableArray addObject:](self->_scribbleElementsFromCurrentSession, "addObject:", v4);
    -[WBSScribbleElement targetedElements](v4, "targetedElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSScribbleController _hideElementUsingPaintAvoidance:forGlobalRule:completion:](self, "_hideElementUsingPaintAvoidance:forGlobalRule:completion:", v10, 0, 0);

    -[WBSScribbleController startValidatingHiddenElements](self, "startValidatingHiddenElements");
    targetedElementsHiddenByUser = self->_targetedElementsHiddenByUser;
    if (!targetedElementsHiddenByUser)
    {
      v12 = (NSMutableArray *)objc_opt_new();
      v13 = self->_targetedElementsHiddenByUser;
      self->_targetedElementsHiddenByUser = v12;

      targetedElementsHiddenByUser = self->_targetedElementsHiddenByUser;
    }
    -[WBSScribbleElement targetedElements](v4, "targetedElements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](targetedElementsHiddenByUser, "addObjectsFromArray:", v14);

    -[WBSScribbleController _makePageScrollableAndInteractableIfNeeded](self, "_makePageScrollableAndInteractableIfNeeded");
    -[WBSScribbleController _updateUserStyleSheet](self, "_updateUserStyleSheet");

  }
}

uint64_t __44__WBSScribbleController_hideSelectedElement__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImageAnalysisText:", a2);
}

- (id)_currentUserContentControllers
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "isPrivateBrowsing"))
  {
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "normalBrowsingUserContentControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_updateUserStyleSheet
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[WBSScribbleController _hasAnyHiddenElements](self, "_hasAnyHiddenElements"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[WBSScribbleController _currentUserContentControllers](self, "_currentUserContentControllers", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
          -[WBSScribbleController _targetsHiddenByUserOrValidation](self, "_targetsHiddenByUserOrValidation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "safari_updateScribbleStyleSheetForWebView:targets:forceScrollable:", WeakRetained, v10, self->_shouldMakePageScrollableAndInteractable);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

- (unint64_t)numberOfChangesFromCurrentSession
{
  return -[NSMutableArray count](self->_scribbleElementsFromCurrentSession, "count");
}

- (BOOL)canHideContentInWebView
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;

  if (objc_msgSend(MEMORY[0x1E0D8A120], "isScribbleEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_committedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
    {
      LOBYTE(v8) = 0;
LABEL_12:

      return v8;
    }
    objc_msgSend(WeakRetained, "_MIMEType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if ((objc_msgSend(v7, "hasPrefix:", CFSTR("text/")) & 1) != 0)
      {
        LOBYTE(v8) = 1;
LABEL_11:

        goto LABEL_12;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("application/pdf")) & 1) == 0
        && (objc_msgSend(v7, "hasPrefix:", CFSTR("image/")) & 1) == 0)
      {
        v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("audio/")) ^ 1;
        goto LABEL_11;
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)startScribblingWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  self->_startedScribblingWithHiddenItems = -[WBSScribbleController numberOfAllHiddenElements](self, "numberOfAllHiddenElements") != 0;
  -[WBSScribbleController _updateQuirksIfNeeded](self, "_updateQuirksIfNeeded");
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "userDefinedContentBlockerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__WBSScribbleController_startScribblingWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5444500;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "contentBlockerForHost:createIfNeeded:completionHandler:", v7, 1, v11);

}

void __62__WBSScribbleController_startScribblingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = WeakRetained;
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 40))
      v7 = 1;
    else
      v7 = WeakRetained == 0;
    if (!v7)
    {
      objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:");
      v6 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v6 + 40) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)endScribblingAndSaveChanges:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = WeakRetained;
  if (self->_isScribbling && WeakRetained != 0)
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), webViewFrameObservationContext);
  self->_isScribbling = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke;
  v39[3] = &unk_1E5441CB8;
  v39[4] = self;
  objc_msgSend(v8, "setHandler:", v39);
  -[NSMutableArray safari_mapObjectsUsingBlock:](self->_scribbleElementsFromCurrentSession, "safari_mapObjectsUsingBlock:", &__block_literal_global_36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v10, "userDefinedContentBlockerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3)
  {
    objc_msgSend(v12, "didFinishScribbleSBA:", -[WBSScribbleController numberOfChangesFromCurrentSession](self, "numberOfChangesFromCurrentSession"));

    if (self->_startedScribblingWithHiddenItems)
    {
      objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didHideMoreItemsSBA");

    }
    objc_msgSend(v11, "addActions:forContentBlocker:", v9, self->_contentBlockerForCurrentHost);
  }
  else
  {
    v29 = v11;
    v30 = v9;
    objc_msgSend(v12, "didCancelScribbleSBA");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_scribbleElementsFromCurrentSession, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = self->_scribbleElementsFromCurrentSession;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "targetedElements");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v6, "_resetVisibilityAdjustmentsForTargetedElements:completionHandler:", v15, &__block_literal_global_37);
      -[WBSScribbleController updateCountForElementsHiddenByPaintingAvoidance](self, "updateCountForElementsHiddenByPaintingAvoidance");
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v22 = v15;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v32 != v25)
              objc_enumerationMutation(v22);
            -[NSMutableArray removeObject:](self->_targetedElementsHiddenByUser, "removeObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v24);
      }

      -[WBSScribbleController _updateUserStyleSheet](self, "_updateUserStyleSheet");
    }
    -[NSMutableArray removeAllObjects](self->_scribbleElementsFromCurrentSession, "removeAllObjects");
    -[WBSUserDefinedContentBlocker actions](self->_contentBlockerForCurrentHost, "actions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safari_filterObjectsUsingBlock:", &__block_literal_global_40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSUserDefinedContentBlocker setActions:](self->_contentBlockerForCurrentHost, "setActions:", v28);

    objc_msgSend(v10, "scribbleControllerDidUpdateHiddenElementCount:", self);
    v11 = v29;
    v9 = v30;
  }

}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

}

uint64_t __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeContentBlockerAction");
}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

BOOL __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "databaseID");
  return v2 != *MEMORY[0x1E0D8A6C8];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  WBSScribbleElement *selectedScribbleElement;
  id v25;
  objc_super v26;

  if ((void *)webViewFrameObservationContext == a6)
  {
    v11 = *MEMORY[0x1E0CB2CB8];
    v12 = a5;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v15 = v14;
    v17 = v16;

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "CGRectValue");
    v20 = v19;
    v22 = v21;

    if (v20 != v15 || v22 != v17)
    {
      selectedScribbleElement = self->_selectedScribbleElement;
      self->_selectedScribbleElement = 0;

      -[WBSScribbleController delegate](self, "delegate");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scribbleController:didUpdateSelectedElement:withError:", self, 0, 0);

    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)WBSScribbleController;
    v10 = a5;
    -[WBSScribbleController observeValueForKeyPath:ofObject:change:context:](&v26, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (WBSScribbleControllerDelegate)delegate
{
  return (WBSScribbleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WBSScribbleElement)selectedScribbleElement
{
  return self->_selectedScribbleElement;
}

- (CGPoint)lastRequestLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastRequestLocation.x;
  y = self->_lastRequestLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isScribbling
{
  return self->_isScribbling;
}

- (BOOL)elementSelectionEnabled
{
  return self->_elementSelectionEnabled;
}

- (void)setElementSelectionEnabled:(BOOL)a3
{
  self->_elementSelectionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedScribbleElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_quirksForCurrentSession, 0);
  objc_storeStrong((id *)&self->_targetedElementsHiddenByValidation, 0);
  objc_storeStrong((id *)&self->_targetedElementsHiddenByUser, 0);
  objc_storeStrong((id *)&self->_scribbleElementsFromCurrentSession, 0);
  objc_storeStrong((id *)&self->_contentBlockerForCurrentHost, 0);
  objc_storeStrong((id *)&self->_validatingTimer, 0);
  objc_destroyWeak((id *)&self->_webView);
}

void __48__WBSScribbleController_updateSelectionToPoint___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  CGFloat v4;
  CGFloat v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  NSPoint v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = a2;
  v14.x = v4;
  v14.y = v5;
  NSStringFromPoint(v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1A840B000, v6, OS_LOG_TYPE_ERROR, "Failed to find element at %{public}@ with error %{public}@", (uint8_t *)&v9, 0x16u);

}

void __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
    (uint8_t *)&v2,
    0xCu);
}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Failed to reset Distraction Control after canceling", a5, a6, a7, a8, 0);
}

@end
