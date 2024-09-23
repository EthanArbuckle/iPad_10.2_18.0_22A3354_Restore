@implementation _UIPanelInternalState

- (UIViewController)mainViewController
{
  return self->_mainViewController;
}

- (UIViewController)collapsedViewController
{
  return self->_collapsedViewController;
}

- (int64_t)collapsedState
{
  return self->_collapsedState;
}

- (UIViewController)leadingViewController
{
  return self->_leadingViewController;
}

- (UIPanelControllerDelegate)delegate
{
  return (UIPanelControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UIPanelAnimationState)animationState
{
  return self->_animationState;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[_UIPanelInternalState mainViewController](self, "mainViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainViewController:", v5);

  -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingViewController:", v6);

  -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingViewController:", v7);

  -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryViewController:", v8);

  -[_UIPanelInternalState collapsedViewController](self, "collapsedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollapsedViewController:", v9);

  -[_UIPanelInternalState preservedDetailController](self, "preservedDetailController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservedDetailController:", v10);

  -[_UIPanelInternalState delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v11);

  -[_UIPanelInternalState configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v12);

  -[_UIPanelInternalState stateRequest](self, "stateRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStateRequest:", v13);

  -[_UIPanelInternalState externallyAnimatingStateRequest](self, "externallyAnimatingStateRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExternallyAnimatingStateRequest:", v14);

  objc_msgSend(v4, "setExternallyAnimatingAffectedSides:", -[_UIPanelInternalState externallyAnimatingAffectedSides](self, "externallyAnimatingAffectedSides"));
  -[_UIPanelInternalState animationState](self, "animationState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationState:", v15);

  -[_UIPanelInternalState interactiveStateRequest](self, "interactiveStateRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractiveStateRequest:", v16);

  objc_msgSend(v4, "setCollapsedState:", -[_UIPanelInternalState collapsedState](self, "collapsedState"));
  -[_UIPanelInternalState keyboardAdjustment](self, "keyboardAdjustment");
  objc_msgSend(v4, "setKeyboardAdjustment:");
  return v4;
}

- (void)setMainViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *mainViewController;

  v4 = (UIViewController *)a3;
  if (v4)
  {
    -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[_UIPanelInternalState setLeadingViewController:](self, "setLeadingViewController:", 0);
    }
    else
    {
      -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        -[_UIPanelInternalState setTrailingViewController:](self, "setTrailingViewController:", 0);
      }
      else
      {
        -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
        v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
          -[_UIPanelInternalState setSupplementaryViewController:](self, "setSupplementaryViewController:", 0);
      }
    }
  }
  mainViewController = self->_mainViewController;
  self->_mainViewController = v4;

}

- (void)setCollapsedState:(int64_t)a3
{
  self->_collapsedState = a3;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCollapsedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedViewController, a3);
}

- (void)setPreservedDetailController:(id)a3
{
  objc_storeStrong((id *)&self->_preservedDetailController, a3);
}

- (void)setSupplementaryViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *supplementaryViewController;

  v4 = (UIViewController *)a3;
  if (v4)
  {
    -[_UIPanelInternalState mainViewController](self, "mainViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[_UIPanelInternalState setMainViewController:](self, "setMainViewController:", 0);
    }
    else
    {
      -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        -[_UIPanelInternalState setLeadingViewController:](self, "setLeadingViewController:", 0);
      }
      else
      {
        -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
        v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
          -[_UIPanelInternalState setTrailingViewController:](self, "setTrailingViewController:", 0);
      }
    }
  }
  supplementaryViewController = self->_supplementaryViewController;
  self->_supplementaryViewController = v4;

}

- (void)setLeadingViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *leadingViewController;

  v4 = (UIViewController *)a3;
  if (v4)
  {
    -[_UIPanelInternalState mainViewController](self, "mainViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[_UIPanelInternalState setMainViewController:](self, "setMainViewController:", 0);
    }
    else
    {
      -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        -[_UIPanelInternalState setTrailingViewController:](self, "setTrailingViewController:", 0);
      }
      else
      {
        -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
        v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
          -[_UIPanelInternalState setSupplementaryViewController:](self, "setSupplementaryViewController:", 0);
      }
    }
  }
  leadingViewController = self->_leadingViewController;
  self->_leadingViewController = v4;

}

- (UIViewController)trailingViewController
{
  return self->_trailingViewController;
}

- (UIViewController)supplementaryViewController
{
  return self->_supplementaryViewController;
}

- (UIViewController)preservedDetailController
{
  return self->_preservedDetailController;
}

- (void)setTrailingViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *trailingViewController;

  v4 = (UIViewController *)a3;
  if (v4)
  {
    -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[_UIPanelInternalState setLeadingViewController:](self, "setLeadingViewController:", 0);
    }
    else
    {
      -[_UIPanelInternalState mainViewController](self, "mainViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
      {
        -[_UIPanelInternalState setMainViewController:](self, "setMainViewController:", 0);
      }
      else
      {
        -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
        v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
          -[_UIPanelInternalState setSupplementaryViewController:](self, "setSupplementaryViewController:", 0);
      }
    }
  }
  trailingViewController = self->_trailingViewController;
  self->_trailingViewController = v4;

}

- (void)setStateRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setKeyboardAdjustment:(double)a3
{
  self->_keyboardAdjustment = a3;
}

- (void)setInteractiveStateRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setExternallyAnimatingStateRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setExternallyAnimatingAffectedSides:(int64_t)a3
{
  self->_externallyAnimatingAffectedSides = a3;
}

- (void)setAnimationState:(id)a3
{
  objc_storeStrong((id *)&self->_animationState, a3);
}

- (double)keyboardAdjustment
{
  return self->_keyboardAdjustment;
}

- (int64_t)externallyAnimatingAffectedSides
{
  return self->_externallyAnimatingAffectedSides;
}

- (UISlidingBarStateRequest)externallyAnimatingStateRequest
{
  return self->_externallyAnimatingStateRequest;
}

- (UISlidingBarStateRequest)interactiveStateRequest
{
  return self->_interactiveStateRequest;
}

- (UISlidingBarStateRequest)stateRequest
{
  return self->_stateRequest;
}

- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4 forceOverlay:(BOOL)a5
{
  _BOOL4 v5;
  double width;
  id v8;
  void *v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  BOOL v49;
  BOOL v50;
  double v51;
  BOOL v52;
  uint64_t v53;
  double v54;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  double v62;
  BOOL v63;
  char v64;
  double v65;
  uint64_t v66;
  int v67;
  void *v68;
  double v69;
  double v70;
  unint64_t v71;
  NSObject *v72;
  double v73;
  double v74;
  unint64_t v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  id v80;
  void *v82;
  id v83;
  id obj;
  BOOL v85;
  double v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  BOOL v92;
  double v93;
  BOOL v94;
  BOOL v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  void *v101;
  double v102;
  double v103;
  uint64_t v104;
  _UIPanelInternalState *v105;
  void (**v106)(void *, void *);
  char v107;
  int v108;
  double v109;
  double v110;
  double v111;
  double v112;
  int v113;
  void *v114;
  _QWORD v115[11];
  char v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[2];
  void (*v130)(uint64_t, double, double);
  void *v131;
  id v132;
  id v133;
  double v134;
  _QWORD v135[2];
  void (*v136)(uint64_t, uint64_t, void *, int);
  void *v137;
  id v138;
  _QWORD aBlock[5];
  id v140;
  uint8_t buf[4];
  void *v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v5 = a5;
  width = a4.width;
  v146 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke;
  aBlock[3] = &unk_1E16C14F8;
  aBlock[4] = self;
  v10 = v9;
  v140 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (-[_UIPanelInternalState collapsedState](self, "collapsedState") != 1
    && -[_UIPanelInternalState collapsedState](self, "collapsedState") != 2)
  {
    v106 = v11;
    v82 = v10;
    -[_UIPanelInternalState configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v136 = (void (*)(uint64_t, uint64_t, void *, int))__84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_3;
    v137 = &unk_1E16C1540;
    v83 = v8;
    v138 = v8;
    v129[0] = v13;
    v129[1] = 3221225472;
    v130 = (void (*)(uint64_t, double, double))__84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_198;
    v131 = &unk_1E16C1568;
    v134 = width;
    v14 = v12;
    v132 = v14;
    v15 = v138;
    v133 = v15;
    LODWORD(v12) = objc_msgSend(v14, "leadingMayBeHidden");
    v16 = objc_msgSend(v14, "trailingMayBeHidden");
    v113 = objc_msgSend(v14, "supplementaryMayBeHidden");
    v17 = objc_msgSend(v14, "supplementaryEdge");
    -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPanelInternalState _allowedLeadingWidthsForParentWidth:](self, "_allowedLeadingWidthsForParentWidth:", width);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_3((uint64_t)v135, (uint64_t)v18, v19, (int)v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPanelInternalState _allowedTrailingWidthsForParentWidth:](self, "_allowedTrailingWidthsForParentWidth:", width);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v136((uint64_t)v135, (uint64_t)v21, v22, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = self;
    -[_UIPanelInternalState _allowedSupplementaryWidthsForParentWidth:](self, "_allowedSupplementaryWidthsForParentWidth:", width);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v136((uint64_t)v135, (uint64_t)v24, v25, v113);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_200(v20);
    v88 = v23;
    v28 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_200(v23);
    v96 = v26;
    v29 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_200(v26);
    v30 = v29 > 0.0;
    v86 = v27;
    v31 = v27 > 0.0 && v29 > 0.0;
    v85 = v31;
    v93 = v28;
    if (v28 <= 0.0)
      v30 = 0;
    v92 = v30;
    objc_msgSend(v14, "minimumMainWidthFraction");
    UICeilToViewScale(v15);
    v110 = v32;
    objc_msgSend(v14, "minimumMainWidthFractionForSecondColumn");
    UICeilToViewScale(v15);
    v102 = v33;
    v114 = v14;
    objc_msgSend(v14, "maximumMainWidth");
    v101 = v15;
    UICeilToViewScale(v15);
    v109 = v34;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = v20;
    v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
    if (!v89)
    {
      v107 = 0;
      v104 = 0;
      goto LABEL_118;
    }
    v104 = 0;
    v100 = v17 != 0;
    v87 = *(_QWORD *)v126;
    v107 = 0;
    v108 = !v5;
    v111 = 0.0;
    v112 = 0.0;
    v35 = 0.0;
    while (1)
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v126 != v87)
          objc_enumerationMutation(obj);
        v90 = v36;
        objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * v36), "doubleValue");
        v38 = v37;
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v91 = v88;
        v98 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v121, v144, 16);
        if (v98)
        {
          v39 = v86 > 0.0;
          v97 = *(_QWORD *)v122;
          v40 = v85;
          if (v38 <= 0.0)
            v40 = 0;
          if (v38 > v86)
            v39 = 0;
          v94 = v39;
          v95 = v40;
          do
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v122 != v97)
                objc_enumerationMutation(v91);
              v99 = v41;
              objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * v41), "doubleValue");
              v43 = v42;
              v117 = 0u;
              v118 = 0u;
              v119 = 0u;
              v120 = 0u;
              v44 = v96;
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
              if (v45)
              {
                v46 = v45;
                v47 = v93 > 0.0;
                v48 = *(_QWORD *)v118;
                v49 = v92;
                if (v43 <= 0.0)
                  v49 = 0;
                if (v43 > v93)
                  v47 = 0;
                v50 = v94 || v47;
                if (v17)
                  v51 = v43;
                else
                  v51 = v38;
                v103 = v51;
                v52 = v95 || v49;
                do
                {
                  v53 = 0;
                  do
                  {
                    if (*(_QWORD *)v118 != v48)
                      objc_enumerationMutation(v44);
                    objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * v53), "doubleValue");
                    if (v54 != 0.0 || !v52)
                    {
                      v56 = v54;
                      v57 = -0.0;
                      if (v17)
                        v58 = -0.0;
                      else
                        v58 = v56;
                      v59 = v38 + v58;
                      if (v17)
                        v57 = v56;
                      v60 = v43 + v57;
                      v61 = objc_msgSend(v114, "allowTotalWidthGreaterThanParent");
                      if ((v61 & 1) == 0 && v59 != 0.0 && v60 != 0.0)
                      {
                        if (os_variant_has_internal_diagnostics())
                        {
                          __UIFaultDebugAssertLog();
                          v77 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v142 = v114;
                            _os_log_fault_impl(&dword_185066000, v77, OS_LOG_TYPE_FAULT, "Simultaneous nonzero leading and trailing widths not supported for allowTotalWidthGreaterThanParent. Configuration = %@", buf, 0xCu);
                          }

                        }
                        else
                        {
                          v75 = _MergedGlobals_22;
                          if (!_MergedGlobals_22)
                          {
                            v75 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                            atomic_store(v75, (unint64_t *)&_MergedGlobals_22);
                          }
                          v76 = *(NSObject **)(v75 + 8);
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v142 = v114;
                            _os_log_impl(&dword_185066000, v76, OS_LOG_TYPE_ERROR, "Simultaneous nonzero leading and trailing widths not supported for allowTotalWidthGreaterThanParent. Configuration = %@", buf, 0xCu);
                          }
                        }
                      }
                      v62 = width;
                      if ((v61 & 1) == 0)
                        v130((uint64_t)v129, v59, v60);
                      if (!v50 && (v56 <= v29 ? (v63 = v29 <= 0.0) : (v63 = 1), v63))
                      {
                        v64 = 0;
                        v65 = v102;
                      }
                      else
                      {
                        v64 = 1;
                        v65 = v110;
                      }
                      if (v62 >= 0.0 && v62 <= v109)
                      {
                        v66 = v17;
                        if (v62 >= v65)
                          v67 = v108;
                        else
                          v67 = 0;
                        if ((v67 & 1) != 0)
                        {
                          v107 = 0;
                          v104 = 0;
                          v111 = v43;
                          v112 = v38;
                          v35 = v56;
                          goto LABEL_63;
                        }
                        if (v56 <= 0.0)
                        {
                          if (v38 <= 0.0)
                          {
                            if (v43 <= 0.0)
                              goto LABEL_63;
                            if ((v64 & 1) != 0)
                            {
                              BYTE4(v104) = 1;
                              v111 = 0.0;
                              goto LABEL_63;
                            }
                            if (objc_msgSend(v114, "allowMixedSideBySideAndOverlay") && v111 > 0.0)
                            {
                              BYTE4(v104) = 0;
                              goto LABEL_63;
                            }
                          }
                          else
                          {
                            if ((v64 & 1) != 0)
                            {
                              v112 = 0.0;
                              v107 = 1;
                              goto LABEL_63;
                            }
                            if (objc_msgSend(v114, "allowMixedSideBySideAndOverlay") && v112 > 0.0)
                            {
                              v107 = 0;
                              goto LABEL_63;
                            }
                          }
                          goto LABEL_82;
                        }
                        if (v56 <= v29)
                        {
                          v35 = 0.0;
                          if (v66)
                            v73 = 0.0;
                          else
                            v73 = v111;
                          v107 |= v66 == 0;
                          BYTE4(v104) |= v100;
                          v74 = v112;
                          if (!v66)
                            v74 = 0.0;
                          v111 = v73;
                          v112 = v74;
                          LOBYTE(v104) = 1;
LABEL_63:
                          -[_UIPanelInternalState stateRequest](v105, "stateRequest");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v68, "supplementaryWidth");

                          v69 = 0.0;
                          if ((v61 & v67) == 1 && v56 > 0.0 && v103 > 0.0)
                          {
                            objc_msgSend(v101, "_currentScreenScale", 0.0, v103);
                            if (v66)
                              objc_msgSend(v114, "trailingBorderWidthForScale:");
                            else
                              objc_msgSend(v114, "leadingBorderWidthForScale:");
                            v69 = width - v56 - v70;
                          }
                          v115[0] = MEMORY[0x1E0C809B0];
                          v115[1] = 3221225472;
                          v115[2] = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_204;
                          v115[3] = &__block_descriptor_89_e27_v16__0__UISlidingBarState_8l;
                          *(double *)&v115[4] = v38;
                          *(double *)&v115[5] = v43;
                          *(double *)&v115[6] = v56;
                          *(double *)&v115[7] = v69;
                          v116 = v67;
                          *(double *)&v115[8] = v112;
                          *(double *)&v115[9] = v111;
                          *(double *)&v115[10] = v35;
                          v106[2](v106, v115);
LABEL_82:
                          v17 = v66;
                          goto LABEL_83;
                        }
                        if (!objc_msgSend(v114, "allowMixedSideBySideAndOverlay"))
                          goto LABEL_82;
                        v17 = v66;
                        if (os_variant_has_internal_diagnostics())
                        {
                          __UIFaultDebugAssertLog();
                          v78 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v142 = v114;
                            _os_log_fault_impl(&dword_185066000, v78, OS_LOG_TYPE_FAULT, "allowMixedSideBySideAndOverlay not supported for nonzero supplementary width. Configuration = %@", buf, 0xCu);
                          }

                        }
                        else
                        {
                          v71 = qword_1ECD76CF0;
                          if (!qword_1ECD76CF0)
                          {
                            v71 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                            atomic_store(v71, (unint64_t *)&qword_1ECD76CF0);
                          }
                          v72 = *(NSObject **)(v71 + 8);
                          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v142 = v114;
                            _os_log_impl(&dword_185066000, v72, OS_LOG_TYPE_ERROR, "allowMixedSideBySideAndOverlay not supported for nonzero supplementary width. Configuration = %@", buf, 0xCu);
                          }
                        }
                      }
                    }
LABEL_83:
                    ++v53;
                  }
                  while (v46 != v53);
                  v79 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
                  v46 = v79;
                }
                while (v79);
              }

              v41 = v99 + 1;
            }
            while (v99 + 1 != v98);
            v98 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v121, v144, 16);
          }
          while (v98);
        }

        v36 = v90 + 1;
      }
      while (v90 + 1 != v89);
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
      if (!v89)
      {
LABEL_118:

        v10 = v82;
        _updateTreatsHiddenAsOverlapsInStates(v82, v107 & 1, BYTE4(v104) & 1, v104 & 1);

        v8 = v83;
        v11 = v106;
        goto LABEL_119;
      }
    }
  }
  v11[2](v11, &__block_literal_global_137);
LABEL_119:
  v80 = v10;

  return v80;
}

- (UISlidingBarConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveStateRequest, 0);
  objc_storeStrong((id *)&self->_animationState, 0);
  objc_storeStrong((id *)&self->_externallyAnimatingStateRequest, 0);
  objc_storeStrong((id *)&self->_stateRequest, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preservedDetailController, 0);
  objc_storeStrong((id *)&self->_collapsedViewController, 0);
  objc_storeStrong((id *)&self->_trailingViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryViewController, 0);
  objc_storeStrong((id *)&self->_leadingViewController, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
}

- (id)_allowedWidthsForViewController:(id)a3 parentWidth:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_preferredContentSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "CGSizeValue", (_QWORD)v22);
          if (v14 > 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
  }
  else
  {
    if (objc_msgSend(v6, "_isNavigationController"))
      objc_msgSend(v6, "_preferredContentSizeForcingLoad:", 0);
    else
      objc_msgSend(v6, "preferredContentSize");
    if (v16 <= 0.0)
    {
      -[_UIPanelInternalState _defaultWidthForViewController:parentWidth:](self, "_defaultWidthForViewController:parentWidth:", v6, a4);
      if (v17 <= 0.0)
        goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);
  }

LABEL_19:
  if ((unint64_t)objc_msgSend(v7, "count", (_QWORD)v22) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");

    v7 = (void *)v20;
  }
  objc_msgSend(v7, "sortUsingSelector:", sel_compare_);

  return v7;
}

- (double)_defaultWidthForViewController:(id)a3 parentWidth:(double)a4
{
  id v6;
  UIPanelControllerDelegate **p_delegate;
  id WeakRetained;
  char v9;
  double v10;
  id v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  double Height;
  CGRect v19;

  v6 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  v10 = 0.0;
  if ((v9 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "panelController:expectedWidthForColumnForViewController:", 0, v6);
    v10 = v12;

  }
  objc_msgSend(v6, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  switch(v14)
  {
    case 0:
      if (v10 == 0.0)
      {
        v15 = 0.4;
        goto LABEL_7;
      }
      break;
    case 1:
      if (v10 == 0.0)
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_referenceBounds");
        Height = CGRectGetHeight(v19);

        if (Height <= 1210.0)
          v10 = 320.0;
        else
          v10 = 375.0;
      }
      break;
    case 2:
    case 8:
      v15 = 0.33;
LABEL_7:
      v10 = ceil(a4 * v15);
      break;
    default:
      break;
  }

  return v10;
}

- (id)_allowedLeadingWidthsForParentWidth:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[_UIPanelInternalState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_UIPanelInternalState configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingWidths");
  }
  else
  {
    -[_UIPanelInternalState leadingViewController](self, "leadingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPanelInternalState _allowedWidthsForViewController:parentWidth:](self, "_allowedWidthsForViewController:parentWidth:", v8, a3);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_allowedTrailingWidthsForParentWidth:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[_UIPanelInternalState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_UIPanelInternalState configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingWidths");
  }
  else
  {
    -[_UIPanelInternalState trailingViewController](self, "trailingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPanelInternalState _allowedWidthsForViewController:parentWidth:](self, "_allowedWidthsForViewController:parentWidth:", v8, a3);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_allowedSupplementaryWidthsForParentWidth:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[_UIPanelInternalState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supplementaryWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_UIPanelInternalState configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supplementaryWidths");
  }
  else
  {
    -[_UIPanelInternalState supplementaryViewController](self, "supplementaryViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPanelInternalState _allowedWidthsForViewController:parentWidth:](self, "_allowedWidthsForViewController:parentWidth:", v8, a3);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4
{
  return -[_UIPanelInternalState computePossibleStatesGivenParentView:withSize:forceOverlay:](self, "computePossibleStatesGivenParentView:withSize:forceOverlay:", a3, 0, a4.width, a4.height);
}

- (id)_stateForInteractiveRequest:(id)a3 withAffectedSides:(int64_t)a4 inPossibleStates:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  int v33;
  double v34;
  double v35;
  double v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t i;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  int v53;
  double v54;
  char v55;
  _BOOL4 v56;
  int v57;
  double v59;
  BOOL v60;
  double v61;
  double v62;
  double v63;
  unint64_t v64;
  double v65;
  double v66;
  unint64_t v67;
  double v68;
  unint64_t v69;
  double v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  uint64_t j;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  int v88;
  _BOOL4 v89;
  int v90;
  double v92;
  double v94;
  double v95;
  double v96;
  uint64_t v98;
  unint64_t v99;
  int v100;
  int v101;
  int64_t v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "_closestEqualOrLargerState:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "_leadingEntirelyOverlapsMain");
  v100 = objc_msgSend(v11, "_trailingEntirelyOverlapsMain");
  v101 = objc_msgSend(v11, "_supplementaryEntirelyOverlapsMain");
  -[_UIPanelInternalState configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfiguration:", v13);

  objc_msgSend(v8, "leadingWidth");
  v15 = v14;
  objc_msgSend(v11, "leadingWidth");
  v17 = v15 - v16;
  objc_msgSend(v11, "_leadingOverlayWidth");
  objc_msgSend(v11, "_setLeadingOverlayWidth:", v18 + v17);
  objc_msgSend(v8, "trailingWidth");
  v20 = v19;
  objc_msgSend(v11, "trailingWidth");
  v22 = v20 - v21;
  objc_msgSend(v11, "_trailingOverlayWidth");
  objc_msgSend(v11, "_setTrailingOverlayWidth:", v23 + v22);
  objc_msgSend(v8, "supplementaryWidth");
  v25 = v24;
  objc_msgSend(v11, "supplementaryWidth");
  v27 = v25 - v26;
  objc_msgSend(v11, "_supplementaryOverlayWidth");
  objc_msgSend(v11, "_setSupplementaryOverlayWidth:", v28 + v27);
  objc_msgSend(v8, "leadingWidth");
  objc_msgSend(v11, "setLeadingWidth:");
  objc_msgSend(v8, "leadingOffscreenWidth");
  objc_msgSend(v11, "setLeadingOffscreenWidth:");
  objc_msgSend(v8, "trailingWidth");
  objc_msgSend(v11, "setTrailingWidth:");
  objc_msgSend(v8, "trailingOffscreenWidth");
  objc_msgSend(v11, "setTrailingOffscreenWidth:");
  objc_msgSend(v8, "supplementaryWidth");
  objc_msgSend(v11, "setSupplementaryWidth:");
  objc_msgSend(v8, "supplementaryOffscreenWidth");
  objc_msgSend(v11, "setSupplementaryOffscreenWidth:");
  objc_msgSend(v8, "rubberBandInset");
  objc_msgSend(v11, "set_rubberBandInset:");
  -[_UIPanelInternalState configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a4 & 1;
  if (objc_msgSend(v29, "leadingMayBeHidden"))
  {
    objc_msgSend(v8, "leadingWidth");
    if (v31 <= 0.0 && (objc_msgSend(v8, "leadingOffscreenWidth"), v32 <= 0.0))
      v33 = a4 & 1;
    else
      v33 = 1;
  }
  else
  {
    v33 = 0;
  }
  v102 = a4;
  v103 = v9;
  if (objc_msgSend(v29, "supplementaryEdge") || !objc_msgSend(v29, "supplementaryMayBeHidden"))
  {
    v30 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v8, "supplementaryWidth");
  if (v34 <= 0.0)
  {
    objc_msgSend(v8, "supplementaryOffscreenWidth");
    if (v35 <= 0.0)
    {
LABEL_13:
      v36 = 0.0;
      if ((v33 | v30) != 1)
        goto LABEL_62;
      goto LABEL_14;
    }
  }
  v30 = 1;
LABEL_14:
  LODWORD(v98) = v12;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v37 = v9;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v109;
    v41 = 0.0;
    v42 = 0.0;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        v44 = v42;
        if (*(_QWORD *)v109 != v40)
          objc_enumerationMutation(v37);
        v45 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        objc_msgSend(v45, "leadingWidth", v98);
        v47 = fmin(v41, v46);
        if (v41 == 0.0)
          v47 = v46;
        if (v46 > 0.0)
          v41 = v47;
        objc_msgSend(v45, "supplementaryWidth");
        if (v48 > 0.0)
        {
          v42 = v48;
          if (v44 != 0.0)
            v42 = fmin(v44, v48);
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    }
    while (v39);
  }
  else
  {
    v41 = 0.0;
    v42 = 0.0;
  }

  objc_msgSend(v8, "leadingWidth");
  v50 = v49;
  objc_msgSend(v8, "supplementaryWidth");
  v52 = v51;
  if (v33)
  {
    objc_msgSend(v8, "leadingOffscreenWidth");
    a4 = v102;
    v53 = v98;
    if (v54 <= 0.0)
    {
      v55 = 0;
      if (v41 > 0.0 && v50 < v41)
        v55 = v102 | (v50 > 0.0);
    }
    else
    {
      v55 = 1;
    }
  }
  else
  {
    v55 = 0;
    a4 = v102;
    v53 = v98;
  }
  v56 = 0;
  if (v42 > 0.0)
    v57 = v30;
  else
    v57 = 0;
  if (v57 == 1 && v52 < v42)
    v56 = v52 > 0.0 || (a4 & 5) == 5;
  v36 = 0.0;
  if ((v55 & 1) != 0)
  {
    objc_msgSend(v11, "setLeadingWidth:", v41);
    objc_msgSend(v11, "supplementaryWidth");
    v60 = v41 <= 0.0 || v59 <= 0.0;
    v36 = v60 ? 0.0 : (v41 - v50) * 0.5;
    objc_msgSend(v11, "setLeadingDragOffset:", v41 - v50 - v36, v98);
    if (v53)
      objc_msgSend(v11, "_setLeadingOverlayWidth:", v41);
  }
  if (v56)
  {
    objc_msgSend(v11, "setSupplementaryWidth:", v42);
    objc_msgSend(v11, "setSupplementaryDragOffset:", v42 - v52);
    if (v101)
      objc_msgSend(v11, "_setSupplementaryOverlayWidth:", v42);
  }
  else
  {
    objc_msgSend(v8, "supplementaryOffscreenWidth");
    if (v61 > 0.0)
    {
      objc_msgSend(v8, "supplementaryWidth");
      if (v62 == 0.0)
      {
        objc_msgSend(v11, "supplementaryOffscreenWidth");
        objc_msgSend(v11, "setSupplementaryDragOffset:");
      }
    }
  }
  v9 = v103;
  if (v36 != 0.0)
  {
    objc_msgSend(v11, "supplementaryDragOffset");
    objc_msgSend(v11, "setSupplementaryDragOffset:", v36 + v63);
  }
LABEL_62:
  v64 = ((unint64_t)a4 >> 1) & 1;
  if (objc_msgSend(v29, "trailingMayBeHidden", v98))
  {
    objc_msgSend(v8, "trailingWidth");
    if (v65 <= 0.0 && (objc_msgSend(v8, "trailingOffscreenWidth"), v66 <= 0.0))
      v67 = ((unint64_t)a4 >> 1) & 1;
    else
      LODWORD(v67) = 1;
  }
  else
  {
    LODWORD(v67) = 0;
  }
  if (objc_msgSend(v29, "supplementaryEdge") != 1 || !objc_msgSend(v29, "supplementaryMayBeHidden"))
  {
    LODWORD(v69) = 0;
    goto LABEL_77;
  }
  objc_msgSend(v8, "supplementaryWidth");
  if (v68 <= 0.0)
  {
    objc_msgSend(v8, "supplementaryOffscreenWidth");
    v69 = ((unint64_t)a4 >> 1) & 1;
    if (v70 <= 0.0)
    {
LABEL_77:
      if ((v67 | v69) != 1)
        goto LABEL_125;
      goto LABEL_78;
    }
  }
  LODWORD(v69) = 1;
LABEL_78:
  v99 = v64;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v71 = v9;
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v105;
    v75 = 0.0;
    v76 = 0.0;
    do
    {
      for (j = 0; j != v73; ++j)
      {
        v78 = v76;
        if (*(_QWORD *)v105 != v74)
          objc_enumerationMutation(v71);
        v79 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
        objc_msgSend(v79, "trailingWidth", v99);
        v81 = fmin(v75, v80);
        if (v75 == 0.0)
          v81 = v80;
        if (v80 > 0.0)
          v75 = v81;
        objc_msgSend(v79, "supplementaryWidth");
        if (v82 > 0.0)
        {
          v76 = v82;
          if (v78 != 0.0)
            v76 = fmin(v78, v82);
        }
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    }
    while (v73);
  }
  else
  {
    v75 = 0.0;
    v76 = 0.0;
  }

  objc_msgSend(v8, "trailingWidth");
  v84 = v83;
  objc_msgSend(v8, "supplementaryWidth");
  v86 = v85;
  if ((_DWORD)v67)
  {
    objc_msgSend(v8, "trailingOffscreenWidth");
    if (v87 <= 0.0)
    {
      v88 = 0;
      if (v75 > 0.0 && v84 < v75)
      {
        if (v84 > 0.0)
          v88 = 1;
        else
          v88 = v99;
      }
    }
    else
    {
      v88 = 1;
    }
  }
  else
  {
    v88 = 0;
  }
  v89 = 0;
  if (v76 > 0.0)
    v90 = v69;
  else
    v90 = 0;
  if (v90 == 1 && v86 < v76)
    v89 = v86 > 0.0 || (v102 & 6) == 6;
  if (v88)
  {
    objc_msgSend(v11, "setTrailingWidth:", v75);
    objc_msgSend(v11, "supplementaryWidth");
    if (v75 > 0.0 && v92 > 0.0)
      v36 = (v75 - v84) * 0.5;
    objc_msgSend(v11, "setTrailingDragOffset:", v75 - v84 - v36, v99);
    if (v100)
      objc_msgSend(v11, "_setTrailingOverlayWidth:", v75);
  }
  if (v89)
  {
    objc_msgSend(v11, "setSupplementaryWidth:", v76);
    objc_msgSend(v11, "setSupplementaryDragOffset:", v76 - v86);
    if (v101)
      objc_msgSend(v11, "_setSupplementaryOverlayWidth:", v76);
  }
  else
  {
    objc_msgSend(v8, "supplementaryOffscreenWidth");
    if (v94 > 0.0)
    {
      objc_msgSend(v8, "supplementaryWidth");
      if (v95 == 0.0)
      {
        objc_msgSend(v11, "supplementaryOffscreenWidth");
        objc_msgSend(v11, "setSupplementaryDragOffset:");
      }
    }
  }
  v9 = v103;
  if (v36 != 0.0)
  {
    objc_msgSend(v11, "supplementaryDragOffset");
    objc_msgSend(v11, "setSupplementaryDragOffset:", v36 + v96);
  }
LABEL_125:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  int64_t collapsedState;
  const __CFString *v8;
  const __CFString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIPanelInternalState;
  -[_UIPanelInternalState description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", CFSTR(" delegate=%p"), WeakRetained);

    if (self->_leadingViewController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" leading=%p"), self->_leadingViewController);
    if (self->_trailingViewController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" trailing=%p"), self->_trailingViewController);
    if (self->_supplementaryViewController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" supplementary=%p"), self->_supplementaryViewController);
    if (self->_mainViewController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" main=%p"), self->_mainViewController);
    if (self->_collapsedViewController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" collapsed=%p"), self->_collapsedViewController);
    if (self->_preservedDetailController)
      objc_msgSend(v4, "appendFormat:", CFSTR(" preserved=%p"), self->_preservedDetailController);
    if (self->_animationState)
      objc_msgSend(v4, "appendFormat:", CFSTR(" animState=%p"), self->_animationState);
    objc_msgSend(v4, "appendFormat:", CFSTR(" stateReq=%p config=%p"), self->_stateRequest, self->_configuration);
    collapsedState = self->_collapsedState;
    if (collapsedState == 1)
    {
      v9 = CFSTR(" collapsing");
    }
    else
    {
      v8 = CFSTR(" expanding");
      if (!collapsedState)
        v8 = CFSTR(" expanded");
      if (collapsedState == 2)
        v9 = CFSTR(" collapsed");
      else
        v9 = v8;
    }
    objc_msgSend(v4, "appendString:", v9);
  }
  return v4;
}

@end
