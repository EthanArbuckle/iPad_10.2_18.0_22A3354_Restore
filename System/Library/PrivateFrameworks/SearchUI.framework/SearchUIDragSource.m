@implementation SearchUIDragSource

+ (id)dragSourceForView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0DC3750], "isEnabledByDefault"))
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithView:dragObject:feedbackDelegate:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (SearchUIDragSource)initWithView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SearchUIDragSource *v11;
  SearchUIDragSource *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIDragSource;
  v11 = -[SearchUIDragSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SearchUIDragSource setDragSourceView:](v11, "setDragSourceView:", v8);
    -[SearchUIDragSource setDragObject:](v12, "setDragObject:", v9);
    -[SearchUIDragSource setFeedbackDelegate:](v12, "setFeedbackDelegate:", v10);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v12);
    -[SearchUIDragSource dragSourceView](v12, "dragSourceView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addInteraction:", v13);

  }
  return v12;
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void)setDragSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_dragSourceView, a3);
}

- (void)setDragObject:(id)a3
{
  objc_storeStrong((id *)&self->_dragObject, a3);
}

- (UIView)dragSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dragSourceView);
}

- (id)dragParametersForPreviewView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0DC3768];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v4, "bounds");
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v7);

  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v8, "isDark");
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v9);

  }
  return v5;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SearchUIDragSource feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0
    && (-[SearchUIDragSource feedbackDelegate](self, "feedbackDelegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v4, "dragInteractionEnabled") & 1) == 0))
  {

  }
  else
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", v9);

    if ((v8 & 1) != 0)
    {

      if (!v10)
        goto LABEL_11;
LABEL_7:
      -[SearchUIDragSource dragObject](self, "dragObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "itemProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (v13)
        {
LABEL_9:
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v13);
          v26[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {
        -[SearchUIDragSource dragObject](self, "dragObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifyingResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "resultBundleId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        -[SearchUIDragSource dragObject](self, "dragObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v21)
          objc_msgSend(v22, "dragSubtitle");
        else
          objc_msgSend(v22, "dragTitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSuggestedName:", v24);

        if (v13)
          goto LABEL_9;
      }
      v16 = 0;
      goto LABEL_17;
    }

    if (v10)
      goto LABEL_7;
  }
LABEL_11:
  v16 = 0;
LABEL_18:

  return v16;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDragSource dragParametersForPreviewView:](self, "dragParametersForPreviewView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0DC3D88]);
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithView:parameters:", v10, v8);
  return v11;
}

- (void)sendDragFeedback
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchUIDragSource feedbackDelegate](self, "feedbackDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIDragSource dragObject](self, "dragObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v4, 18, 0);
    objc_msgSend(v6, "didEngageResult:", v5);

  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v5 = a4;
  -[SearchUIDragSource sendDragFeedback](self, "sendDragFeedback");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SearchUIWillInitiateDragNotification"), 0, 0);

  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SearchUIDragSource_dragInteraction_sessionWillBegin___block_invoke;
  v9[3] = &unk_1EA1F7298;
  v9[4] = self;
  objc_msgSend(v8, "setPreviewProvider:", v9);

}

id __55__SearchUIDragSource_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dragObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "useSourceViewAsPreviewForDragging"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dragObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dragURL");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(*(id *)(a1 + 32), "dragObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dragURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isFileURL");

      if ((v15 & 1) == 0)
      {
        v16 = (void *)MEMORY[0x1E0DC3EF0];
        objc_msgSend(*(id *)(a1 + 32), "dragObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dragTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dragObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dragURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "viewWithTitle:URL:", v18, v20);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v23 = (void *)v21;

        v24 = objc_alloc(MEMORY[0x1E0DC3768]);
        v25 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v23, "bounds");
        objc_msgSend(v25, "valueWithCGRect:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v24, "initWithTextLineRects:", v27);

        objc_msgSend(v23, "layoutBelowIfNeeded");
        objc_msgSend(v23, "frame");
        v30 = v29;
        v32 = v31;
        objc_msgSend(v23, "systemLayoutSizeFittingSize:", v33, 0.0);
        objc_msgSend(v23, "setFrame:", v30, v32, v34, v35);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", v23, v28);

        goto LABEL_9;
      }
    }
    else
    {

    }
    v22 = (void *)MEMORY[0x1E0DC3EF0];
    objc_msgSend(*(id *)(a1 + 32), "dragObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dragTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dragObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dragSubtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "viewWithTitle:URLText:", v18, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v4 = objc_alloc(MEMORY[0x1E0DC3760]);
  objc_msgSend(*(id *)(a1 + 32), "dragSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "dragSourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragParametersForPreviewView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithView:parameters:", v5, v8);

LABEL_9:
  return v9;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int64_t v13;
  void *v14;
  void *v15;

  -[SearchUIDragSource dragObject](self, "dragObject", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifyingResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."));
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "dragDropSourceManagementStateForBundleID:", v7);
    if (v8)
    {

      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isOpenInRestrictionInEffect");

      v13 = 0;
      if (v10 && v12)
      {
        -[SearchUIDragSource dragObject](self, "dragObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifyingResult");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "dataOwnerType");

      }
    }
    else
    {

      if (v10 == 1)
        v13 = 2;
      else
        v13 = v10 == 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldPerformHitTestingForDragSessionInView:(id)a3
{
  return 1;
}

- (SearchUIRowModel)dragObject
{
  return self->_dragObject;
}

- (SearchUIFeedbackDelegateInternal)feedbackDelegate
{
  return (SearchUIFeedbackDelegateInternal *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_dragSourceView);
  objc_storeStrong((id *)&self->_dragObject, 0);
}

@end
