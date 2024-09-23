@implementation SBWindowDragGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 8;
}

- (void)_beginWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  double v49;
  double v50;
  NSObject *v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  SBWindowDragGestureWorkspaceTransaction *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;
  _QWORD v65[4];
  id v66;
  CGPoint v67;
  CGRect v68;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "floatingConfiguration");
  v9 = objc_msgSend(v7, "centerConfiguration");
  v57 = objc_msgSend(v7, "interfaceOrientation");
  objc_msgSend(v5, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v10);
  v13 = v12;
  v15 = v14;
  objc_opt_class();
  v63 = v4;
  v55 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "initialTouchLocation");
    v13 = v16;
    v15 = v17;
  }
  v58 = v11;
  objc_msgSend(v11, "bounds");
  if (v15 > v18 + -1.0)
    v15 = v18 + -1.0;
  v19 = objc_opt_class();
  SBSafeCast(v19, v4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "initialTouchLeafAppLayout");
  v20 = objc_claimAutoreleasedReturnValue();
  v56 = v8;
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v5, "adjustedAppLayoutForLeafAppLayout:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if ((objc_msgSend(v62, "isChamoisWindowingUIEnabled") & 1) != 0)
        goto LABEL_17;
      v60 = self;
      v23 = v10;
      objc_msgSend(v22, "itemForLayoutRole:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "itemForLayoutRole:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v22, "layoutRoleForItem:", v25);

      if (!v24)
      {
        v10 = v23;
        self = v60;
        goto LABEL_17;
      }
      v27 = v26 == 4;
      v10 = v23;
      self = v60;
      v8 = v56;
      if (v27)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

  }
  if (objc_msgSend(v7, "layoutContainsRole:", 3))
  {
    if (!SBFloatingConfigurationIsStashed(v8))
    {
      +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "narrowEdgeSwipeHitTestWidth");
      v30 = v29;

      objc_msgSend(v62, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v57, v8);
      v68.origin.x = v32 + (v31 - v30) * 0.5;
      v68.origin.y = 0.0;
      v68.size.width = v30;
      v67.x = v13;
      v67.y = v15;
      if (CGRectContainsPoint(v68, v67))
      {
        objc_msgSend(v7, "floatingAppLayout");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          goto LABEL_18;
      }
    }
  }
  objc_msgSend(v5, "_adjustedAppLayoutForItemContainerAtLocation:environment:", 0, v13, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leafAppLayoutForRole:", 4);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v21 = (void *)v33;
    goto LABEL_17;
  }
  objc_msgSend(v5, "_leafAppLayoutForItemContainerAtLocation:environment:", 0, v13, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
LABEL_18:
    -[SBFluidSwitcherGestureWorkspaceTransaction setSelectedAppLayout:](self, "setSelectedAppLayout:", v21);
    objc_msgSend(v5, "visibleItemContainers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __61__SBWindowDragGestureWorkspaceTransaction__beginWithGesture___block_invoke;
    v65[3] = &unk_1E8E9E388;
    v36 = v21;
    v66 = v36;
    objc_msgSend(v35, "bs_firstObjectPassingTest:", v65);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "adjustedAppLayoutForLeafAppLayout:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "itemForLayoutRole:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "layoutRoleForItem:", v39);
    v41 = v62;
    v61 = v37;
    if (objc_msgSend(v62, "windowManagementStyle") == 2)
    {
      objc_msgSend(v7, "appLayout");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      self->_draggingFromContinuousExposeStrips = objc_msgSend(v42, "containsItem:", v39) ^ 1;

      objc_msgSend(v37, "convertPoint:fromView:", v10, v13, v15);
      self->_locationInSelectedDisplayItem.x = v43;
      self->_locationInSelectedDisplayItem.y = v44;
      objc_msgSend(v62, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v40, v38, v57);
      v46 = v45;
      self->_sizeOfSelectedDisplayItem.width = v47;
      v48 = v58;
LABEL_33:
      self->_sizeOfSelectedDisplayItem.height = v46;
      v41 = v62;
      goto LABEL_34;
    }
    v48 = v58;
    if (objc_msgSend(v62, "windowManagementStyle") != 1)
    {
LABEL_34:
      v64.receiver = self;
      v64.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
      -[SBFluidSwitcherGestureWorkspaceTransaction _beginWithGesture:](&v64, sel__beginWithGesture_, v63);

      goto LABEL_35;
    }
    if (objc_msgSend(v38, "environment") == 1)
    {
      objc_msgSend(v62, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v40, v38, v57);
    }
    else if (objc_msgSend(v38, "environment") == 2)
    {
      objc_msgSend(v62, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v57, v56);
    }
    else
    {
      if (objc_msgSend(v38, "environment") != 3)
      {
        v52 = *MEMORY[0x1E0C9D820];
        v46 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        goto LABEL_32;
      }
      objc_msgSend(v62, "frameForCenterItemWithConfiguration:interfaceOrientation:", v55, v57);
    }
    v52 = v49;
    v46 = v50;
LABEL_32:
    self->_draggingFromContinuousExposeStrips = 0;
    objc_msgSend(v61, "convertPoint:fromView:", v10, v13, v15);
    self->_locationInSelectedDisplayItem.x = v53;
    self->_locationInSelectedDisplayItem.y = v54;
    self->_sizeOfSelectedDisplayItem.width = v52;
    goto LABEL_33;
  }
  SBLogSystemGestureAppSwitcher();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    -[SBWindowDragGestureWorkspaceTransaction _beginWithGesture:].cold.1((uint64_t)self, v51, v13, v15);

  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v4, "setEnabled:", 1);
  -[SBSystemGestureWorkspaceTransaction finishWithCompletionType:](self, "finishWithCompletionType:", -1);
  v41 = v62;
  v48 = v58;
LABEL_35:

}

uint64_t __61__SBWindowDragGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_finishWithGesture:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
    -[SBFluidSwitcherGestureWorkspaceTransaction _finishWithGesture:](&v6, sel__finishWithGesture_, v4);
  }

}

- (BOOL)shouldInterceptTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "source");
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v6 - 6) > 0x3E || ((1 << (v6 - 6)) & 0x40000000000C0001) == 0)
  {
    objc_msgSend(v5, "isChamoisWindowingUIEnabled");
    v9 = 0;
  }
  else
  {
    v9 = 0;
    if (objc_msgSend(v5, "isChamoisWindowingUIEnabled") && v7)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "applicationContext", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "applicationSceneEntity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "application");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "alwaysMaximizedInChamois");

            if ((v18 & 1) != 0)
            {
              v9 = 0;
              goto LABEL_17;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v13)
            continue;
          break;
        }
      }
      v9 = 1;
LABEL_17:

    }
  }

  return v9;
}

- (void)interceptTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  SBWorkspaceApplicationSceneTransitionContext *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction _copiedTransitionRequestFromTransitionRequest:](self, "_copiedTransitionRequestFromTransitionRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSource:", 68);
  if (objc_msgSend(v4, "source") != 24 && objc_msgSend(v4, "source") != 25)
    goto LABEL_6;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v6, "switcherCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemForLayoutRole:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_entityForDisplayItem:switcherController:", v21, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "addObject:", v14);
    objc_msgSend(v9, "appLayout");
    v20 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__SBWindowDragGestureWorkspaceTransaction_interceptTransitionRequest___block_invoke;
    v24[3] = &unk_1E8E9E3B0;
    v17 = v5;
    v25 = v17;
    v26 = v15;
    v18 = v15;
    objc_msgSend(v16, "enumerate:", v24);

    v19 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v19, "setEntities:withPolicy:centerEntity:floatingEntity:", v18, 0, 0, 0);
    objc_msgSend(v17, "setApplicationContext:", v19);

LABEL_6:
    v23.receiver = self;
    v23.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
    -[SBFluidSwitcherGestureWorkspaceTransaction interceptTransitionRequest:](&v23, sel_interceptTransitionRequest_, v5);
    goto LABEL_7;
  }

LABEL_7:
}

void __70__SBWindowDragGestureWorkspaceTransaction_interceptTransitionRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntityForLayoutRole:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

- (BOOL)isDraggingFromContinuousExposeStrips
{
  return self->_draggingFromContinuousExposeStrips;
}

- (CGPoint)locationInSelectedDisplayItem
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInSelectedDisplayItem.x;
  y = self->_locationInSelectedDisplayItem.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)sizeOfSelectedDisplayItem
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeOfSelectedDisplayItem.width;
  height = self->_sizeOfSelectedDisplayItem.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_beginWithGesture:(CGFloat)a3 .cold.1(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  CGPoint v18;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.x = a3;
  v18.y = a4;
  NSStringFromCGPoint(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543874;
  v12 = v9;
  v13 = 2050;
  v14 = a1;
  v15 = 2114;
  v16 = v10;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}p> Window drag began at %{public}@ but did not hit-test to an app layout. Bailing.", (uint8_t *)&v11, 0x20u);

}

@end
