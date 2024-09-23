@implementation _UISheetDropInteraction

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)willMoveToView:(id)a3
{
  -[_UISheetDropInteraction view](self, "view", a3);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UISheetDropInteraction)initWithDelegate:(id)a3
{
  id v4;
  _UISheetDropInteraction *v5;
  _UISheetDropInteraction *v6;
  UIDropInteraction *v7;
  UIDropInteraction *dropInteraction;
  uint64_t v9;
  NSMapTable *activityTypesOrActivities;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UISheetDropInteraction;
  v5 = -[_UISheetDropInteraction init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", v6);
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    activityTypesOrActivities = v6->_activityTypesOrActivities;
    v6->_activityTypesOrActivities = (NSMapTable *)v9;

  }
  return v6;
}

- (id)_activityTypeForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UISheetDropInteraction activityTypesOrActivities](self, "activityTypesOrActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[_UISheetDropInteraction activityTypesOrActivities](self, "activityTypesOrActivities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v4);

    objc_msgSend(v4, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.uikit.scene")) & 1) != 0)
    {
      objc_msgSend(v12, "teamData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "teamData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          objc_msgSend(v15, "activityType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "activityType");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
            {
LABEL_9:
              -[_UISheetDropInteraction activityTypesOrActivities](self, "activityTypesOrActivities");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKey:", v6, v4);

            }
          }
          else
          {
            objc_msgSend(v16, "sceneIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {

              v6 = 0;
              goto LABEL_2;
            }
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend((id)UIApp, "_openSessionsIncludingInternal:", 1);
            obj = (id)objc_claimAutoreleasedReturnValue();
            v6 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v6)
            {
              v30 = v13;
              v32 = *(_QWORD *)v34;
              while (2)
              {
                for (i = 0; i != v6; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v34 != v32)
                    objc_enumerationMutation(obj);
                  v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v23, "persistentIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v16;
                  objc_msgSend(v16, "sceneIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v24, "isEqualToString:", v26);

                  if (v27)
                  {
                    objc_msgSend(v23, "scene");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v28)
                    {
                      objc_msgSend(v23, "scene");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      +[_UICanvasUserActivityManager _saveRestorationStateForScene:](_UICanvasUserActivityManager, "_saveRestorationStateForScene:", v29);

                    }
                    objc_msgSend(v23, "stateRestorationActivity");
                    v6 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = v30;
                    v16 = v25;
                    goto LABEL_31;
                  }
                  v16 = v25;
                }
                v6 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
                if (v6)
                  continue;
                break;
              }
              v13 = v30;
            }
LABEL_31:

            if (v6)
              goto LABEL_9;
          }

          goto LABEL_2;
        }
      }

    }
    v6 = 0;
    goto LABEL_16;
  }
LABEL_2:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "activityType");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v6 = v7;
LABEL_13:
  v19 = v7;
LABEL_17:

  return v19;
}

- (void)_activityForSession:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, void *);

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  -[_UISheetDropInteraction activityTypesOrActivities](self, "activityTypesOrActivities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[2](v8, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_opt_class();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58___UISheetDropInteraction__activityForSession_completion___block_invoke;
      v14[3] = &unk_1E16BB9F0;
      v15 = v8;
      v12 = (id)objc_msgSend(v7, "loadObjectsOfClass:completion:", v11, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetDropInteraction.m"), 160, CFSTR("Called _activityForSession: for a session that does not have an activity or activity type."));

    }
  }

}

- (void)_removeActivityTypeOrActivityForSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UISheetDropInteraction activityTypesOrActivities](self, "activityTypesOrActivities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[_UISheetDropInteraction _activityTypeForSession:](self, "_activityTypeForSession:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UISheetDropInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0
      || (-[_UISheetDropInteraction delegate](self, "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "_sheetDropInteraction:canHandleUserActivityOfType:", self, v5),
          v8,
          v9))
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a4;
  -[_UISheetDropInteraction _activityTypeForSession:](self, "_activityTypeForSession:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UISheetDropInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[_UISheetDropInteraction delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_sheetDropInteraction:presentingViewControllerForDroppingUserActivityOfType:", self, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    -[_UISheetDropInteraction delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_sheetDropInteraction:viewControllerForDroppingUserActivityOfType:", self, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISheetDropInteraction.m"), 207, CFSTR("_sheetDropInteraction:viewControllerForDroppingUserActivityOfType: must return a non-nil view controller."));

    }
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke;
    v22[3] = &unk_1E16B1B50;
    v23 = v11;
    v15 = v13;
    v24 = v15;
    v16 = v11;
    +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v22);
    objc_msgSend(v15, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetDropInteraction setPresentationController:](self, "setPresentationController:", v17);

    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __55___UISheetDropInteraction_dropInteraction_performDrop___block_invoke_2;
    v20[3] = &unk_1E16D9728;
    v20[4] = self;
    v21 = v15;
    v18 = v15;
    -[_UISheetDropInteraction _activityForSession:completion:](self, "_activityForSession:completion:", v6, v20);

  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIDragPreviewTarget *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIDragPreviewTarget *v16;
  UITargetedDragPreview *v17;
  UITargetedDragPreview *v19;
  void *v20;

  v6 = a5;
  -[_UISheetDropInteraction presentationController](self, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "_setPreviewMode:", 2);
    v19 = [UITargetedDragPreview alloc];
    -[_UISheetDropInteraction presentationController](self, "presentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [UIDragPreviewTarget alloc];
    -[_UISheetDropInteraction presentationController](self, "presentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISheetDropInteraction presentationController](self, "presentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentedView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "center");
    v16 = -[UIPreviewTarget initWithContainer:center:](v10, "initWithContainer:center:", v13);
    v17 = -[UITargetedDragPreview initWithView:parameters:target:](v19, "initWithView:parameters:target:", v9, v8, v16);

  }
  else
  {
    v17 = (UITargetedDragPreview *)v6;
  }

  return v17;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a5;
  -[_UISheetDropInteraction presentationController](self, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76___UISheetDropInteraction_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v9[3] = &unk_1E16B42D0;
  v9[4] = self;
  objc_msgSend(v6, "addCompletion:", v9);

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[_UISheetDropInteraction _removeActivityTypeOrActivityForSession:](self, "_removeActivityTypeOrActivityForSession:", a4);
}

- (_UISheetDropInteractionDelegate)delegate
{
  return (_UISheetDropInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (NSMapTable)activityTypesOrActivities
{
  return self->_activityTypesOrActivities;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_activityTypesOrActivities, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
