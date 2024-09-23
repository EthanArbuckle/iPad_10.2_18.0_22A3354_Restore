@implementation UITextInteractionAssistant

- (int64_t)currentCursorBehavior
{
  UITextInput **p_view;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int64_t v10;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textInputView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      return 0;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "textInputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cursorBehavior");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateDisplayedSelection
{
  -[UITextSelectionView updateSelectionRects](self->_selectionView, "updateSelectionRects");
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self->_selectionViewManager, "setNeedsSelectionUpdate");
  -[UITextSelectionDisplayInteraction layoutManagedSubviews](self->_selectionViewManager, "layoutManagedSubviews");
}

- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant
{
  _UITextChoiceAccelerationAssistant *textChoicesAssistant;
  _UITextChoiceAccelerationAssistant *v4;
  _UITextChoiceAccelerationAssistant *v5;

  textChoicesAssistant = self->_textChoicesAssistant;
  if (!textChoicesAssistant)
  {
    v4 = -[_UITextChoiceAccelerationAssistant initWithInteractionAssistant:]([_UITextChoiceAccelerationAssistant alloc], "initWithInteractionAssistant:", self);
    v5 = self->_textChoicesAssistant;
    self->_textChoicesAssistant = v4;

    textChoicesAssistant = self->_textChoicesAssistant;
  }
  return textChoicesAssistant;
}

- (UIContextMenuInteractionDelegate)externalContextMenuInteractionDelegate
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_externalContextMenuInteractionDelegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[UITextLinkInteraction contextMenuDelegateProxy](self->_linkInteraction, "contextMenuDelegateProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIContextMenuInteractionDelegate *)v6;
}

- (UITextInteractionAssistant)initWithView:(id)a3 textInteractionMode:(int64_t)a4
{
  id v6;
  UITextInteractionAssistant *v7;
  UITextInteractionAssistant *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextInteractionAssistant;
  v7 = -[UITextInteractionAssistant init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_view, v6);
    v8->_textInteractionMode = a4;
    -[UITextInteractionAssistant setGestureRecognizers](v8, "setGestureRecognizers");
    -[UITextInteractionAssistant _updateRenderSpaceConversionConformance](v8, "_updateRenderSpaceConversionConformance");
    -[UITextInteractionAssistant _updateTextFormattingRestorationMethodsConformance](v8, "_updateTextFormattingRestorationMethodsConformance");
  }

  return v8;
}

- (void)setGestureRecognizers
{
  UITextInteraction *externalInteractions;
  UITextInteractionMode v4;
  id WeakRetained;
  _UITextInteractionAssistantGestureState *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UITextInteractionAssistantGestureState *gestureState;
  id v14;

  if (!self->_externalTextInput && !-[UITextInteractionAssistant inGesture](self, "inGesture"))
  {
    if (self->_textInteractionMode > 1uLL
      || !self->_interactions
      || (externalInteractions = self->_externalInteractions) == 0
      || -[UITextInteraction textInteractionMode](externalInteractions, "textInteractionMode") != self->_textInteractionMode
      || (v4 = -[UITextInteraction textInteractionMode](self->_externalInteractions, "textInteractionMode"),
          v4 != -[UITextInteraction textInteractionMode](self->_interactions, "textInteractionMode")))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      -[UITextInteractionAssistant _computeGestureStateForView:](self, "_computeGestureStateForView:", WeakRetained);
      v6 = (_UITextInteractionAssistantGestureState *)objc_claimAutoreleasedReturnValue();

      -[UITextInteraction _transientState](self->_interactions, "_transientState");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[UITextInteractionAssistant clearGestureRecognizers](self, "clearGestureRecognizers");
      v7 = objc_loadWeakRetained((id *)&self->_view);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "_textInputViewForAddingGestureRecognizers");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UITextInteractionAssistant externalInteractions](self, "externalInteractions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[UITextInteractionAssistant externalInteractions](self, "externalInteractions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextInteractionAssistant addGestureRecognizersToView:](self, "addGestureRecognizersToView:", v12);

LABEL_15:
          -[UITextInteraction _applyTransientState:](self->_interactions, "_applyTransientState:", v14);
          gestureState = self->_gestureState;
          self->_gestureState = v6;

          return;
        }
        objc_msgSend(v7, "textInputView");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v8;
      -[UITextInteractionAssistant addGestureRecognizersToView:](self, "addGestureRecognizersToView:", v8);
      goto LABEL_15;
    }
  }
}

- (void)clearGestureRecognizers:(BOOL)a3
{
  _UITextInteractionAssistantGestureState *gestureState;
  UITextInteraction *interactions;
  id v6;

  if (a3 || !-[UITextInteractionAssistant inGesture](self, "inGesture"))
  {
    -[_UITextInteractionEditMenuAssistant cancelDelayedCommandRequests](self->_editMenuAssistant, "cancelDelayedCommandRequests");
    gestureState = self->_gestureState;
    self->_gestureState = 0;

    -[UITextInteraction view](self->_interactions, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeInteraction:", self->_interactions);
    interactions = self->_interactions;
    self->_interactions = 0;

  }
}

- (BOOL)inGesture
{
  return self->_inGesture || -[UITextInteraction inGesture](self->_interactions, "inGesture");
}

- (void)clearGestureRecognizers
{
  -[UITextInteractionAssistant clearGestureRecognizers:](self, "clearGestureRecognizers:", 0);
}

- (void)addGestureRecognizersToView:(id)a3
{
  id WeakRetained;
  id v5;
  BOOL v6;
  int v7;
  _BOOL4 v8;
  int v9;
  char v10;
  UITextLinkInteraction *linkInteraction;
  id v12;
  UITextLinkInteraction *v13;
  UITextLinkInteraction *v14;
  UITextContextMenuInteraction *textContextMenuInteraction;
  id v16;
  UITextContextMenuInteraction *v17;
  UITextContextMenuInteraction *v18;
  void *v19;
  UIPointerInteraction **p_pointerInteraction;
  UIPointerInteraction *v21;
  void *v22;
  UIPointerInteraction *v23;
  UIPointerInteraction *v24;
  UIPointerInteraction *pointerInteraction;
  id v26;
  UITextInteraction *v27;
  UITextInteraction *interactions;
  void *v29;
  UITextSelectionDisplayInteraction *selectionViewManager;
  id v31;
  uint64_t v32;
  void *v33;
  UITextSelectionDisplayInteraction *v34;
  UITextSelectionDisplayInteraction *v35;
  id v36;
  void *v37;
  UITextRangeAdjustmentInteraction *v38;
  UITextRangeAdjustmentInteraction *rangeAdjustmentInteraction;
  int64_t textInteractionMode;
  UITextInteraction *v41;
  UITextRefinementInteraction *v42;
  void *v43;
  UITextRefinementInteraction *v44;
  UITextInteraction *v45;
  UITextNonEditableInteraction *v46;
  UITextInteraction *v47;
  UITextServicesInteraction *v48;
  void *v49;
  UITextInteraction *v50;
  UITextNonEditableInteraction *v51;
  uint64_t v52;
  void *v53;
  UITextInteraction *v54;
  UITextRefinementInteraction_CustomHighlighter *v55;
  UITextInteraction *v56;
  void *v57;
  UITextInteraction *v58;
  UITextRefinementInteraction *v59;
  void *v60;
  UITextRefinementInteraction *v61;
  UITextInteraction *v62;
  void *v63;
  UITextInteraction *v64;
  UITextRefinementInteraction *v65;
  void *v66;
  UITextRefinementInteraction *v67;
  UITextInteraction *v68;
  UITextServicesInteraction *v69;
  UITextInteraction *v70;
  UITextIndirectKeyboardInteraction *v71;
  void *v72;
  int v73;
  void *v74;
  int v75;
  UITextInteraction *v76;
  UITextLiveConversionInteraction *v77;
  void *v78;
  UITextLiveConversionInteraction *v79;
  UITextRefinementInteraction *v80;
  void *v81;
  UITextRefinementInteraction *v82;
  UITextInteraction *v83;
  void *v84;
  UITextInteraction *v85;
  void *v86;
  UITextInteraction *v87;
  UITextRefinementInteraction *v88;
  void *v89;
  UITextRefinementInteraction *v90;
  UITextInteraction *v91;
  UITextIndirectNonEditableInteraction *v92;
  void *v93;
  void *v94;
  void *v95;
  UITextInteraction *v96;
  UITextServicesInteraction *v97;
  UITextInteraction *v98;
  UITextRefinementInteraction *v99;
  void *v100;
  UITextRefinementInteraction *v101;
  UITextInteraction *v102;
  UITextNonEditableInteraction *v103;
  UITextInteraction *v104;
  void *v105;
  UITextInteraction *v106;
  UITextRefinementInteraction *v107;
  void *v108;
  UITextRefinementInteraction *v109;
  UITextInteraction *v110;
  void *v111;
  UITextInteraction *v112;
  UITextIndirectNonEditableInteraction *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  UITextLinkInteraction *v124;
  __CFString *v125;
  UITextInteraction *v126;
  UITextRefinementInteraction *v127;
  void *v128;
  UITextRefinementInteraction *v129;
  UITextInteraction *v130;
  UITextIndirectKeyboardInteraction *v131;
  UITextInteraction *v132;
  UITextRefinementInteraction *v133;
  void *v134;
  UITextRefinementInteraction *v135;
  UITextInteraction *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  UITextIndirectNonEditableInteraction *v143;
  void *v144;
  UITextInteraction *v145;
  UITextNonEditableInteraction *v146;
  UITextInteraction *v147;
  UITextRefinementInteraction *v148;
  void *v149;
  UITextRefinementInteraction *v150;
  UITextInteraction *v151;
  UITextRefinementInteraction *v152;
  void *v153;
  UITextRefinementInteraction *v154;
  UITextInteraction *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  UITextPhraseBoundaryInteraction *v161;
  void *v162;
  UITextPhraseBoundaryInteraction *v163;
  UITextInteraction *v164;
  void *v165;
  UITextIndirectKeyboardInteraction *v166;
  id v167;

  v167 = a3;
  if (!_UIDeviceHasExternalTouchInput() && !self->_interactions)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0
      || (v5 = objc_loadWeakRetained((id *)&self->_view),
          v6 = +[UITextItemInteractionInteraction mightResponderHaveTextItemInteractions:](UITextItemInteractionInteraction, "mightResponderHaveTextItemInteractions:", v5), v5, !v6))
    {
      v8 = -[UITextInteractionAssistant viewCouldBecomeEditable:](self, "viewCouldBecomeEditable:", WeakRetained);
      v7 = 0;
    }
    else
    {
      v7 = 1;
      v8 = 1;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(WeakRetained, "playsNicelyWithGestures");
    else
      v9 = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(WeakRetained, "_isInteractiveTextSelectionDisabled");
    else
      v10 = 0;
    linkInteraction = self->_linkInteraction;
    if (linkInteraction)
      goto LABEL_14;
    if (-[UITextInteractionAssistant wantsLinkInteraction](self, "wantsLinkInteraction"))
    {
      +[UITextLinkInteraction interactionWithShouldProxyContextMenuDelegate:](UITextLinkInteraction, "interactionWithShouldProxyContextMenuDelegate:", 1);
      v13 = (UITextLinkInteraction *)objc_claimAutoreleasedReturnValue();
      v14 = self->_linkInteraction;
      self->_linkInteraction = v13;

      objc_msgSend(v167, "addInteraction:", self->_linkInteraction);
      -[UITextInteraction setAssistantDelegate:](self->_linkInteraction, "setAssistantDelegate:", self);
      goto LABEL_19;
    }
    linkInteraction = self->_linkInteraction;
    if (linkInteraction)
    {
LABEL_14:
      -[UITextInteraction view](linkInteraction, "view");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 != v167)
        objc_msgSend(v167, "addInteraction:", self->_linkInteraction);
    }
LABEL_19:
    textContextMenuInteraction = self->_textContextMenuInteraction;
    if (textContextMenuInteraction)
    {
      -[UITextInteraction view](textContextMenuInteraction, "view");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 == v167)
        goto LABEL_24;
    }
    else
    {
      v17 = objc_alloc_init(UITextContextMenuInteraction);
      v18 = self->_textContextMenuInteraction;
      self->_textContextMenuInteraction = v17;

      -[UITextInteractionAssistant externalContextMenuInteractionDelegate](self, "externalContextMenuInteractionDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextContextMenuInteraction setExternalContextMenuDelegate:](self->_textContextMenuInteraction, "setExternalContextMenuDelegate:", v19);

      -[UITextInteraction setAssistantDelegate:](self->_textContextMenuInteraction, "setAssistantDelegate:", self);
    }
    objc_msgSend(v167, "addInteraction:", self->_textContextMenuInteraction);
LABEL_24:
    if (-[UITextInteractionAssistant currentCursorBehavior](self, "currentCursorBehavior") == 2
      || (p_pointerInteraction = &self->_pointerInteraction, self->_pointerInteraction)
      || !-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
    {
      p_pointerInteraction = &self->_pointerInteraction;
      pointerInteraction = self->_pointerInteraction;
      if (!pointerInteraction
        || (-[UIPointerInteraction view](pointerInteraction, "view"),
            v26 = (id)objc_claimAutoreleasedReturnValue(),
            v26,
            v26 == v167))
      {
LABEL_31:
        +[UITextInteraction textInteractionForMode:](UITextInteraction, "textInteractionForMode:", self->_textInteractionMode);
        v27 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();
        interactions = self->_interactions;
        self->_interactions = v27;

        -[UITextInteraction setTextInput:](self->_interactions, "setTextInput:", WeakRetained);
        -[UITextInteraction setAssistantDelegate:](self->_interactions, "setAssistantDelegate:", self);
        -[UITextInteraction delegate](self->_externalInteractions, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInteraction setDelegate:](self->_interactions, "setDelegate:", v29);

        if (self->_textContextMenuInteraction)
          -[UITextInteraction addIndirectChild:](self->_interactions, "addIndirectChild:");
        if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
        {
          selectionViewManager = self->_selectionViewManager;
          if (selectionViewManager)
          {
            -[UITextSelectionDisplayInteraction view](selectionViewManager, "view");
            v31 = (id)objc_claimAutoreleasedReturnValue();

            if (v31 == v167)
              goto LABEL_38;
            selectionViewManager = self->_selectionViewManager;
          }
          v32 = -[UITextSelectionDisplayInteraction isActivated](selectionViewManager, "isActivated");
          -[UITextSelectionDisplayInteraction view](self->_selectionViewManager, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeInteraction:", self->_selectionViewManager);

          v34 = -[UITextSelectionDisplayInteraction _initWithTextInput:delegate:activated:]([UITextSelectionDisplayInteraction alloc], "_initWithTextInput:delegate:activated:", WeakRetained, self, 0);
          v35 = self->_selectionViewManager;
          self->_selectionViewManager = v34;

          objc_msgSend(v167, "addInteraction:", self->_selectionViewManager);
          -[UITextSelectionDisplayInteraction setActivated:](self->_selectionViewManager, "setActivated:", v32);
        }
LABEL_38:
        v36 = v167;
        v37 = v36;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(WeakRetained, "_rangeAdjustmentGestureView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v38 = -[UITextRangeAdjustmentInteraction initWithAdjustmentDelegate:gestureHostView:]([UITextRangeAdjustmentInteraction alloc], "initWithAdjustmentDelegate:gestureHostView:", self, v37);
        rangeAdjustmentInteraction = self->_rangeAdjustmentInteraction;
        self->_rangeAdjustmentInteraction = v38;

        -[UITextInteraction addChild:](self->_interactions, "addChild:", self->_rangeAdjustmentInteraction);
        textInteractionMode = self->_textInteractionMode;
        if (textInteractionMode > 999)
        {
          if (textInteractionMode != 1000)
          {
            if (textInteractionMode == 1001)
            {
              -[UITextInteraction _setAllowsSelectionCommands:](self->_interactions, "_setAllowsSelectionCommands:", -[UITextInteraction _allowsSelectionCommands](self->_externalInteractions, "_allowsSelectionCommands"));
              v41 = self->_interactions;
              v42 = [UITextRefinementInteraction alloc];
              v43 = (void *)objc_opt_new();
              v44 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v42, "initWithBehaviorDelegate:", v43);
              -[UITextInteraction addChild:](v41, "addChild:", v44);

              v45 = self->_interactions;
              v46 = -[UITextNonEditableInteraction initWithMode:]([UITextNonEditableInteraction alloc], "initWithMode:", 2);
              -[UITextInteraction addChild:](v45, "addChild:", v46);

              v47 = self->_interactions;
              v48 = objc_alloc_init(UITextServicesInteraction);
LABEL_47:
              v49 = v48;
              -[UITextInteraction addChild:](v47, "addChild:", v48);
LABEL_48:

LABEL_66:
              objc_msgSend(v36, "addInteraction:", self->_interactions);
              -[UITextInteraction finishSetup](self->_interactions, "finishSetup");

              goto LABEL_67;
            }
            goto LABEL_55;
          }
        }
        else
        {
          if (!textInteractionMode)
          {
            v56 = self->_interactions;
            v57 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 0);
            -[UITextInteraction addChild:](v56, "addChild:", v57);

            v58 = self->_interactions;
            v59 = [UITextRefinementInteraction alloc];
            v60 = (void *)objc_opt_new();
            v61 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v59, "initWithBehaviorDelegate:", v60);
            -[UITextInteraction addChild:](v58, "addChild:", v61);

            if (-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
            {
              v62 = self->_interactions;
              v63 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
              -[UITextInteraction addChild:](v62, "addChild:", v63);

              v64 = self->_interactions;
              v65 = [UITextRefinementInteraction alloc];
              v66 = (void *)objc_opt_new();
              v67 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v65, "initWithBehaviorDelegate:", v66);
              -[UITextInteraction addChild:](v64, "addChild:", v67);

            }
            v68 = self->_interactions;
            v69 = objc_alloc_init(UITextServicesInteraction);
            -[UITextInteraction addChild:](v68, "addChild:", v69);

            v70 = self->_interactions;
            v71 = -[UITextIndirectKeyboardInteraction initWithView:]([UITextIndirectKeyboardInteraction alloc], "initWithView:", 0);
            -[UITextInteraction addChild:](v70, "addChild:", v71);

            -[UITextInteractionAssistant wantsLinkInteraction](self, "wantsLinkInteraction");
            goto LABEL_66;
          }
          if (textInteractionMode != 1)
          {
LABEL_55:
            if (-[UITextInteractionAssistant useGesturesForEditableContent](self, "useGesturesForEditableContent"))
            {
              if (objc_msgSend(WeakRetained, "_hasMarkedText"))
              {
                +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v72, "hasEditableMarkedText");

                if (v73)
                {
                  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = objc_msgSend(v74, "liveConversionEnabled");

                  v76 = self->_interactions;
                  if (v75)
                  {
                    v77 = [UITextLiveConversionInteraction alloc];
                    -[UITextInteractionAssistant _asText](self, "_asText");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = -[UITextLiveConversionInteraction initWithTextInput:](v77, "initWithTextInput:", v78);
                    -[UITextInteraction addChild:](v76, "addChild:", v79);

                    goto LABEL_66;
                  }
                  v161 = [UITextPhraseBoundaryInteraction alloc];
                  -[UITextInteractionAssistant _asText](self, "_asText");
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  v163 = -[UITextPhraseBoundaryInteraction initWithTextInput:](v161, "initWithTextInput:", v162);
                  -[UITextInteraction addChild:](v76, "addChild:", v163);

                  v164 = self->_interactions;
                  v165 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 2, 0);
                  -[UITextInteraction addChild:](v164, "addChild:", v165);

                  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
                  {
                    v166 = -[UITextIndirectKeyboardInteraction initWithView:]([UITextIndirectKeyboardInteraction alloc], "initWithView:", v36);
                    -[UITextIndirectKeyboardInteraction setDisableTouchesForGestures:](v166, "setDisableTouchesForGestures:", 1);
                    -[UITextInteraction addChild:](self->_interactions, "addChild:", v166);

                  }
                  if (!-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
                    goto LABEL_66;
                  v47 = self->_interactions;
                  v48 = (UITextServicesInteraction *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 2, 1);
                  goto LABEL_47;
                }
              }
              v126 = self->_interactions;
              v127 = [UITextRefinementInteraction alloc];
              v128 = (void *)objc_opt_new();
              v129 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v127, "initWithBehaviorDelegate:", v128);
              -[UITextInteraction addChild:](v126, "addChild:", v129);

              v49 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 0);
              -[UITextInteraction addChild:](self->_interactions, "addChild:", v49);
              v130 = self->_interactions;
              v131 = -[UITextIndirectKeyboardInteraction initWithView:]([UITextIndirectKeyboardInteraction alloc], "initWithView:", v36);
              -[UITextInteraction addChild:](v130, "addChild:", v131);

              if (-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
              {
                v132 = self->_interactions;
                v133 = [UITextRefinementInteraction alloc];
                v134 = (void *)objc_opt_new();
                v135 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v133, "initWithBehaviorDelegate:", v134);
                -[UITextInteraction addChild:](v132, "addChild:", v135);

                v136 = self->_interactions;
                v137 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
                -[UITextInteraction addChild:](v136, "addChild:", v137);

              }
              -[UITextInteractionAssistant wantsLinkInteraction](self, "wantsLinkInteraction");
              if (!v8)
                goto LABEL_48;
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
              v138 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v138)
                goto LABEL_48;
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "requireGestureRecognizerToFail:", v140);

              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778840);
              v141 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v141)
                goto LABEL_48;
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = (UITextLinkInteraction *)self->_interactions;
              v125 = CFSTR("UITextInteractionNameTripleTap");
LABEL_86:
              -[UITextInteraction recognizerForName:](v124, "recognizerForName:", v125);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "requireGestureRecognizerToFail:", v142);

              goto LABEL_48;
            }
            if ((v10 & 1) != 0)
              goto LABEL_66;
            v98 = self->_interactions;
            if (v9)
            {
              v99 = [UITextRefinementInteraction alloc];
              v100 = (void *)objc_opt_new();
              v101 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v99, "initWithBehaviorDelegate:", v100);
              -[UITextInteraction addChild:](v98, "addChild:", v101);

              v102 = self->_interactions;
              v103 = -[UITextNonEditableInteraction initWithMode:]([UITextNonEditableInteraction alloc], "initWithMode:", 0);
              -[UITextInteraction addChild:](v102, "addChild:", v103);

              v104 = self->_interactions;
              v105 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
              -[UITextInteraction addChild:](v104, "addChild:", v105);

              if (-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
              {
                v106 = self->_interactions;
                v107 = [UITextRefinementInteraction alloc];
                v108 = (void *)objc_opt_new();
                v109 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v107, "initWithBehaviorDelegate:", v108);
                -[UITextInteraction addChild:](v106, "addChild:", v109);

                v110 = self->_interactions;
                v111 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
                -[UITextInteraction addChild:](v110, "addChild:", v111);

              }
              v112 = self->_interactions;
              v113 = -[UITextIndirectNonEditableInteraction initWithView:]([UITextIndirectNonEditableInteraction alloc], "initWithView:", v36);
              -[UITextInteraction addChild:](v112, "addChild:", v113);

              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1753740);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17788A0);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "requireGestureRecognizerToFail:", v49);

              }
              -[UITextInteractionAssistant wantsLinkInteraction](self, "wantsLinkInteraction");
              if (v8)
              {
                -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
                v115 = (void *)objc_claimAutoreleasedReturnValue();

                if (v115)
                {
                  -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v116, "requireGestureRecognizerToFail:", v117);

                  -[UITextInteraction recognizerForName:](self->_linkInteraction, "recognizerForName:", 0x1E17788C0);
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v118, "requireGestureRecognizerToFail:", v119);

                  -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778840);
                  v120 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v120)
                  {
                    -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778840);
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v121, "requireGestureRecognizerToFail:", v122);

                  }
                }
              }
              if (!v7)
                goto LABEL_48;
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = self->_linkInteraction;
              v125 = CFSTR("UITextInteractionNameLinkTap");
              goto LABEL_86;
            }
            v143 = -[UITextIndirectNonEditableInteraction initWithView:]([UITextIndirectNonEditableInteraction alloc], "initWithView:", v36);
            -[UITextInteraction addChild:](v98, "addChild:", v143);

            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1753740);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17788A0);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "requireGestureRecognizerToFail:", v53);

            }
            v145 = self->_interactions;
            v146 = -[UITextNonEditableInteraction initWithMode:]([UITextNonEditableInteraction alloc], "initWithMode:", 1);
            -[UITextInteraction addChild:](v145, "addChild:", v146);

            v147 = self->_interactions;
            v148 = [UITextRefinementInteraction alloc];
            v149 = (void *)objc_opt_new();
            v150 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v148, "initWithBehaviorDelegate:", v149);
            -[UITextInteraction addChild:](v147, "addChild:", v150);

            if (-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
            {
              v151 = self->_interactions;
              v152 = [UITextRefinementInteraction alloc];
              v153 = (void *)objc_opt_new();
              v154 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v152, "initWithBehaviorDelegate:", v153);
              -[UITextInteraction addChild:](v151, "addChild:", v154);

              v155 = self->_interactions;
              v156 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
              -[UITextInteraction addChild:](v155, "addChild:", v156);

            }
            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "setDelaysTouchesEnded:", 0);

            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "setCancelsTouchesInView:", 0);

            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787E0);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "setDelaysTouchesEnded:", 0);

            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778800);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "setDelaysTouchesEnded:", 0);

LABEL_65:
            goto LABEL_66;
          }
        }
        v50 = self->_interactions;
        v51 = -[UITextNonEditableInteraction initWithMode:]([UITextNonEditableInteraction alloc], "initWithMode:", 0);
        -[UITextInteraction addChild:](v50, "addChild:", v51);

        -[UITextInteraction _customHighlighterGesture](self->_externalInteractions, "_customHighlighterGesture");
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v52;
        v54 = self->_interactions;
        if (self->_textInteractionMode == 1000 && v52)
        {
          v55 = -[UITextRefinementInteraction_CustomHighlighter initWithLongPressGesture:]([UITextRefinementInteraction_CustomHighlighter alloc], "initWithLongPressGesture:", v52);
          -[UITextInteraction addChild:](v54, "addChild:", v55);
        }
        else
        {
          v80 = [UITextRefinementInteraction alloc];
          v81 = (void *)objc_opt_new();
          v82 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v80, "initWithBehaviorDelegate:", v81);
          -[UITextInteraction addChild:](v54, "addChild:", v82);

          v83 = self->_interactions;
          v84 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
          -[UITextInteraction addChild:](v83, "addChild:", v84);

          if (-[UITextInteractionAssistant supportsIndirectInteractions](self, "supportsIndirectInteractions"))
          {
            v85 = self->_interactions;
            v86 = (void *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
            -[UITextInteraction addChild:](v85, "addChild:", v86);

            v87 = self->_interactions;
            v88 = [UITextRefinementInteraction alloc];
            v89 = (void *)objc_opt_new();
            v90 = -[UITextRefinementInteraction initWithBehaviorDelegate:](v88, "initWithBehaviorDelegate:", v89);
            -[UITextInteraction addChild:](v87, "addChild:", v90);

          }
          v91 = self->_interactions;
          v92 = -[UITextIndirectNonEditableInteraction initWithView:]([UITextIndirectNonEditableInteraction alloc], "initWithView:", v36);
          -[UITextInteraction addChild:](v91, "addChild:", v92);

          -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1753740);
          v55 = (UITextRefinementInteraction_CustomHighlighter *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17788A0);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "requireGestureRecognizerToFail:", v55);

          }
        }

        -[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInteraction recognizerForName:](self->_linkInteraction, "recognizerForName:", 0x1E17788C0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "requireGestureRecognizerToFail:", v95);

        v96 = self->_interactions;
        v97 = objc_alloc_init(UITextServicesInteraction);
        -[UITextInteraction addChild:](v96, "addChild:", v97);

        -[UITextInteractionAssistant wantsLinkInteraction](self, "wantsLinkInteraction");
        goto LABEL_65;
      }
    }
    else
    {
      v21 = [UIPointerInteraction alloc];
      -[UITextInteractionAssistant _pointerInteractionDelegate](self, "_pointerInteractionDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[UIPointerInteraction initWithDelegate:](v21, "initWithDelegate:", v22);
      v24 = self->_pointerInteraction;
      self->_pointerInteraction = v23;

      -[UIPointerInteraction _setPausesPointerUpdatesWhilePanning:](self->_pointerInteraction, "_setPausesPointerUpdatesWhilePanning:", 0);
    }
    objc_msgSend(v167, "addInteraction:", *p_pointerInteraction);
    goto LABEL_31;
  }
LABEL_67:

}

- (BOOL)supportsIndirectInteractions
{
  uint64_t v2;

  v2 = _UIDeviceNativeUserInterfaceIdiom();
  return v2 == 6 || (v2 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (id)_legacySelectionView
{
  UITextSelectionView *v3;
  UITextSelectionView *v4;
  UITextSelectionView *selectionView;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    v3 = 0;
  }
  else
  {
    if (!self->_selectionView)
    {
      v4 = -[UITextSelectionView initWithInteractionAssistant:]([UITextSelectionView alloc], "initWithInteractionAssistant:", self);
      selectionView = self->_selectionView;
      self->_selectionView = v4;

    }
    if (!self->_externalTextInput && !self->_detaching)
      -[UITextSelectionView installIfNecessary](self->_selectionView, "installIfNecessary");
    v3 = self->_selectionView;
  }
  return v3;
}

- (BOOL)wantsLinkInteraction
{
  return 1;
}

- (void)setNeedsSelectionDisplayUpdate
{
  -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate:](self, "setNeedsSelectionDisplayUpdate:", 0);
}

- (BOOL)useGesturesForEditableContent
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0)
    {
LABEL_4:
      v4 = 1;
      goto LABEL_10;
    }
    if (-[UITextInteractionAssistant containerIsBrowserView](self, "containerIsBrowserView"))
    {
      objc_msgSend(WeakRetained, "_proxyTextInput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_4;
        }
      }

    }
    v4 = 0;
    goto LABEL_10;
  }
  v4 = objc_msgSend(WeakRetained, "_useGesturesForEditableContent");
LABEL_10:

  return v4;
}

- (id)_computeGestureStateForView:(id)a3
{
  id v4;
  void *v5;
  UITextInteraction *externalInteractions;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setViewIsEditable:", objc_msgSend(v4, "isEditable"));
  objc_msgSend(v5, "setViewCanBecomeEditable:", -[UITextInteractionAssistant viewCouldBecomeEditable:](self, "viewCouldBecomeEditable:", v4));
  externalInteractions = self->_externalInteractions;
  if (externalInteractions)
  {
    -[UITextInteraction children](externalInteractions, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasExternalInteractions:", objc_msgSend(v7, "count") != 0);

  }
  else
  {
    objc_msgSend(v5, "setHasExternalInteractions:", 0);
  }
  objc_msgSend(v5, "setMode:", self->_textInteractionMode);
  objc_msgSend(v5, "setIsFirstResponder:", objc_msgSend(v4, "isFirstResponder"));

  return v5;
}

- (BOOL)viewCouldBecomeEditable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "isEditable") & 1) == 0)
  {
    v4 = objc_msgSend(v3, "becomesEditableWithGestures");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Class)selectionInteractionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)containerIsBrowserView
{
  id WeakRetained;
  void *v3;
  char isKindOfClass;

  if (WebKitFramework)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_proxyTextInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)selectionContainerView
{
  UITextInput **p_view;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  void *v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained((id *)p_view);
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "selectionContainerView");
  else
    objc_msgSend(v5, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UITextSelection)activeSelection
{
  void *v2;
  void *v3;

  -[UITextInteractionAssistant activeSelectionController](self, "activeSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextSelection *)v3;
}

- (_UIKeyboardTextSelectionController)activeSelectionController
{
  -[UITextInteractionAssistant _setTextSelectionControllerFromDelegate](self, "_setTextSelectionControllerFromDelegate");
  return self->_textSelectionController;
}

- (void)_setTextSelectionControllerFromDelegate
{
  id v3;
  id WeakRetained;
  __objc2_class *v5;
  _UIKeyboardTextSelectionController *v6;
  id v7;
  id v8;
  _UIKeyboardTextSelectionController *textSelectionController;

  -[_UIKeyboardTextSelectionController inputDelegate](self->_textSelectionController, "inputDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (v3 != WeakRetained)
  {
    if (-[UITextInteractionAssistant usesAsynchronousSelectionController](self, "usesAsynchronousSelectionController"))
    {
      v5 = _UIKeyboardAsyncTextSelectionController;
    }
    else
    {
      v6 = (_UIKeyboardTextSelectionController *)objc_loadWeakRetained((id *)&self->_view);

      if (!v6)
      {
LABEL_8:
        textSelectionController = self->_textSelectionController;
        self->_textSelectionController = v6;

        return;
      }
      v5 = _UIKeyboardTextSelectionController;
    }
    v7 = [v5 alloc];
    v8 = objc_loadWeakRetained((id *)&self->_view);
    v6 = (_UIKeyboardTextSelectionController *)objc_msgSend(v7, "initWithInputDelegate:", v8);

    goto LABEL_8;
  }
}

- (BOOL)usesAsynchronousSelectionController
{
  return 0;
}

- (UITextInteractionAssistant)initWithView:(id)a3
{
  return -[UITextInteractionAssistant initWithView:textInteractionMode:](self, "initWithView:textInteractionMode:", a3, -1);
}

- (void)activateSelection
{
  void *v3;
  void *v4;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction setActivated:](self->_selectionViewManager, "setActivated:", 1);
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "validateWithInteractionAssistant:", self);

    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activate");

  }
  if (-[UITextInteractionAssistant containerAllowsSelectionTintOnly](self, "containerAllowsSelectionTintOnly"))
    -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 1);
}

- (BOOL)containerAllowsSelectionTintOnly
{
  UITextInput **p_view;
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  BOOL result;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  result = 0;
  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    v6 = objc_msgSend(v5, "clearingBehavior");

    if (v6 == 3)
      return 1;
  }
  return result;
}

- (void)dealloc
{
  UITextSelectionView *selectionView;
  objc_super v4;

  -[UITextInteractionAssistant detach:](self, "detach:", 1);
  -[UITextSelectionView invalidate](self->_selectionView, "invalidate");
  selectionView = self->_selectionView;
  self->_selectionView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITextInteractionAssistant;
  -[UITextInteractionAssistant dealloc](&v4, sel_dealloc);
}

- (void)detach:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UITextLinkInteraction *linkInteraction;
  void *v7;
  UITextContextMenuInteraction *textContextMenuInteraction;
  void *v9;
  UIPointerInteraction *pointerInteraction;
  void *v11;
  UITextSelectionDisplayInteraction *selectionViewManager;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id WeakRetained;

  v3 = a3;
  self->_detaching = 1;
  -[UITextSelectionView detach](self->_selectionView, "detach");
  -[UITextInteraction view](self->_linkInteraction, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteraction:", self->_linkInteraction);

  linkInteraction = self->_linkInteraction;
  self->_linkInteraction = 0;

  -[UITextInteraction view](self->_textContextMenuInteraction, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeInteraction:", self->_textContextMenuInteraction);

  textContextMenuInteraction = self->_textContextMenuInteraction;
  self->_textContextMenuInteraction = 0;

  -[UIPointerInteraction view](self->_pointerInteraction, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeInteraction:", self->_pointerInteraction);

  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = 0;

  if (self->_selectionViewManager)
  {
    -[UITextInteraction view](self->_interactions, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeInteraction:", self->_selectionViewManager);

    selectionViewManager = self->_selectionViewManager;
    self->_selectionViewManager = 0;

  }
  -[UITextInteractionAssistant clearGestureRecognizers:](self, "clearGestureRecognizers:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  +[UITextMagnifierCaret activeCaretMagnifier](UITextMagnifierCaret, "activeCaretMagnifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "target");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v14)
    objc_msgSend(v13, "stopMagnifying:", 0);
  +[UITextMagnifierRanged activeRangedMagnifier](UITextMagnifierRanged, "activeRangedMagnifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "target");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v16)
    objc_msgSend(v15, "stopMagnifying:", 0);
  self->_detaching = 0;

}

- (id)_selectionView
{
  return self->_selectionView;
}

- (void)dismissMenuForInputUI
{
  -[UITextContextMenuInteraction dismissMenuForInputUI](self->_textContextMenuInteraction, "dismissMenuForInputUI");
}

- (void)setSelectionDisplayVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))-[UITextSelectionView setVisible:](self->_selectionView, "setVisible:", v3);
}

- (_UITextInteractionEditMenuAssistant)_editMenuAssistant
{
  _UITextInteractionEditMenuAssistant *editMenuAssistant;
  _UITextInteractionEditMenuAssistant *v4;
  _UITextInteractionEditMenuAssistant *v5;

  editMenuAssistant = self->_editMenuAssistant;
  if (!editMenuAssistant)
  {
    v4 = -[_UITextInteractionEditMenuAssistant initWithInteractionAssistant:]([_UITextInteractionEditMenuAssistant alloc], "initWithInteractionAssistant:", self);
    v5 = self->_editMenuAssistant;
    self->_editMenuAssistant = v4;

    editMenuAssistant = self->_editMenuAssistant;
  }
  return editMenuAssistant;
}

- (void)deactivateSelection
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction setActivated:](self->_selectionViewManager, "setActivated:", 0);
  }
  else
  {
    -[UITextSelectionView deactivate](self->_selectionView, "deactivate");
  }
  -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdate](self->_textChoicesAssistant, "setNeedsUnderlineUpdate");
  -[_UITextInteractionEditMenuAssistant hideSelectionCommands](self->_editMenuAssistant, "hideSelectionCommands");
}

- (UITextInput)view
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_view);
}

- (UITextInteraction)externalInteractions
{
  return self->_externalInteractions;
}

- (void)setExternalContextMenuInteractionDelegate:(id)a3
{
  UIContextMenuInteractionDelegate **p_externalContextMenuInteractionDelegate;
  id v5;

  p_externalContextMenuInteractionDelegate = &self->_externalContextMenuInteractionDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_externalContextMenuInteractionDelegate, v5);
  -[UITextContextMenuInteraction setExternalContextMenuDelegate:](self->_textContextMenuInteraction, "setExternalContextMenuDelegate:", v5);

}

- (UITextSelectionDisplayInteraction)_selectionViewManager
{
  return self->_selectionViewManager;
}

- (UIGestureRecognizer)forcePressGesture
{
  return (UIGestureRecognizer *)-[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1753740);
}

- (void)setGrabberSuppressionAssertion:(id)a3
{
  objc_storeStrong(&self->_grabberSuppressionAssertion, a3);
}

- (UITextCursorAssertionController)_assertionController
{
  UITextCursorAssertionController *v3;
  UITextCursorAssertionController *assertionController;
  UITextCursorAssertionController *v5;
  UITextCursorAssertionController *v6;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    if (-[UITextSelectionDisplayInteraction isActivated](self->_selectionViewManager, "isActivated"))
    {
      -[UITextSelectionDisplayInteraction _cursorAssertionController](self->_selectionViewManager, "_cursorAssertionController");
      v3 = (UITextCursorAssertionController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    assertionController = self->_assertionController;
    if (!assertionController)
    {
      v5 = objc_alloc_init(UITextCursorAssertionController);
      v6 = self->_assertionController;
      self->_assertionController = v5;

      -[UITextCursorAssertionController setSubject:](self->_assertionController, "setSubject:", self);
      assertionController = self->_assertionController;
    }
    v3 = assertionController;
  }
  return v3;
}

- (void)setCursorBlinkAnimationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction cursorView](self->_selectionViewManager, "cursorView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBlinking:", v3);

  }
  else
  {
    -[UITextSelectionView setCaretBlinks:](self->_selectionView, "setCaretBlinks:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConformsToAsynchronousInteractionViewProtocol, 0);
  objc_storeStrong((id *)&self->_viewRespondsToInteractiveTextSelectionDisabled, 0);
  objc_storeStrong((id *)&self->_viewConformsToTextItemInteracting, 0);
  objc_storeStrong((id *)&self->_rangeAdjustmentInteraction, 0);
  objc_storeStrong((id *)&self->_floatingCursorSession, 0);
  objc_storeStrong((id *)&self->_showDeleteButtonCursorAssertion, 0);
  objc_storeStrong((id *)&self->_showInputModesCursorAssertion, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_textSelectionController, 0);
  objc_storeStrong((id *)&self->_textChoicesAssistant, 0);
  objc_storeStrong((id *)&self->_editMenuAssistant, 0);
  objc_storeStrong((id *)&self->_selectionViewManager, 0);
  objc_storeStrong((id *)&self->_gestureState, 0);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong(&self->_grabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_externalInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_destroyWeak((id *)&self->_externalContextMenuInteractionDelegate);
  objc_storeStrong((id *)&self->_textContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_linkInteraction, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_stashedTextRange, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)setCursorVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[UITextSelectionView setCaretVisible:](self->_selectionView, "setCaretVisible:");
  -[UITextSelectionDisplayInteraction setCursorHidden:](self->_selectionViewManager, "setCursorHidden:", !v3);
}

- (UITextInteractionAssistant)initWithResponder:(id)a3
{
  id v4;
  UITextInteractionAssistant *v5;
  UITextInteractionAssistant *v6;
  UITextInteractionAssistant *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInteractionAssistant;
  v5 = -[UITextInteractionAssistant init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_externalTextInput = 1;
    objc_storeWeak((id *)&v5->_view, v4);
    -[UITextInteractionAssistant _updateRenderSpaceConversionConformance](v6, "_updateRenderSpaceConversionConformance");
    v7 = v6;
  }

  return v6;
}

- (void)_updateRenderSpaceConversionConformance
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  self->_respondsToConvertPointToRenderSpace = objc_opt_respondsToSelector() & 1;

}

- (void)_updateTextFormattingRestorationMethodsConformance
{
  UITextInput **p_view;
  id v4;
  id WeakRetained;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_view);
    self->_respondsToTextFormattingRestorationMethods = objc_opt_respondsToSelector() & 1;

  }
  else
  {
    self->_respondsToTextFormattingRestorationMethods = 0;
  }

}

- (id)textSelectionView
{
  void *selectionView;
  void *v4;
  id v5;

  -[UITextSelectionDisplayInteraction highlightView](self->_selectionViewManager, "highlightView");
  selectionView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = selectionView;
  if (!selectionView)
    selectionView = self->_selectionView;
  v5 = selectionView;

  return v5;
}

- (BOOL)isInteractiveSelectionDisabled
{
  id WeakRetained;
  NSNumber *viewRespondsToInteractiveTextSelectionDisabled;
  NSNumber *v5;
  NSNumber *v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  viewRespondsToInteractiveTextSelectionDisabled = self->_viewRespondsToInteractiveTextSelectionDisabled;
  if (!viewRespondsToInteractiveTextSelectionDisabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_opt_respondsToSelector() & 1);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_viewRespondsToInteractiveTextSelectionDisabled;
    self->_viewRespondsToInteractiveTextSelectionDisabled = v5;

    viewRespondsToInteractiveTextSelectionDisabled = self->_viewRespondsToInteractiveTextSelectionDisabled;
  }
  if (-[NSNumber BOOLValue](viewRespondsToInteractiveTextSelectionDisabled, "BOOLValue"))
    v7 = objc_msgSend(WeakRetained, "_isInteractiveTextSelectionDisabled");
  else
    v7 = 0;

  return v7;
}

- (id)_pointerInteractionDelegate
{
  UITextInput **p_view;
  id WeakRetained;
  char v5;
  id v6;
  UITextInteractionAssistant *v7;
  UITextInteractionAssistant *v8;
  UITextInteractionAssistant *v9;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "_pointerInteractionDelegate");
    v7 = (UITextInteractionAssistant *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = self;
  v9 = v8;

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  NSNumber *viewConformsToTextItemInteracting;
  NSNumber *v38;
  NSNumber *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  double x;
  double v52;
  double v53;
  double v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  CGFloat v67;
  int v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  double MinX;
  double v81;
  double Width;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  CGFloat y;
  CGFloat v89;
  CGFloat height;
  double v91;
  double v92;
  CGFloat v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CGFloat v101;
  CGFloat rect;
  CGFloat recta;
  CGFloat rect_8;
  CGFloat rect_16;
  id rect_24;
  _QWORD v107[6];
  uint64_t v108;
  id *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  __CFString *v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  CGPoint v120;
  CGPoint v121;
  CGPoint v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  rect_24 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "location");
  v11 = v10;
  v13 = v12;
  v114 = 0;
  v115 = &v114;
  v117 = &unk_18685B0AF;
  v116 = 0x4010000000;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v118 = *MEMORY[0x1E0C9D628];
  v119 = v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v108 = 0;
  v109 = (id *)&v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__203;
  v112 = __Block_byref_object_dispose__203;
  v113 = CFSTR("_UITextCursorBoundingRegion");
  objc_msgSend(WeakRetained, "textInputView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v21 = 0;
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "selectionClipRect");
LABEL_7:
    v22 = v115;
    v115[4] = v17;
    v22[5] = v18;
    v22[6] = v19;
    v22[7] = v20;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_selectionClipRect");
    goto LABEL_7;
  }
  v17 = v115[4];
  v18 = v115[5];
  v19 = v115[6];
  v20 = v115[7];
LABEL_9:
  if (CGRectIsNull(*(CGRect *)&v17))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputDelegateManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inputDelegateManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "selectionClipRect");
      v27 = v115;
      v115[4] = v28;
      v27[5] = v29;
      v27[6] = v30;
      v27[7] = v31;

    }
  }
  if (CGRectIsNull(*((CGRect *)v115 + 1)))
  {
    objc_msgSend(v16, "bounds");
    v36 = v115;
    v115[4] = v32;
    v36[5] = v33;
    v36[6] = v34;
    v36[7] = v35;
  }
  else
  {
    v32 = v115[4];
    v33 = v115[5];
    v34 = v115[6];
    v35 = v115[7];
  }
  v120.x = v11;
  v120.y = v13;
  v21 = CGRectContainsPoint(*(CGRect *)&v32, v120);
LABEL_16:
  viewConformsToTextItemInteracting = self->_viewConformsToTextItemInteracting;
  if (!viewConformsToTextItemInteracting)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EDFC7CA0));
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v39 = self->_viewConformsToTextItemInteracting;
    self->_viewConformsToTextItemInteracting = v38;

    viewConformsToTextItemInteracting = self->_viewConformsToTextItemInteracting;
  }
  if (-[NSNumber BOOLValue](viewConformsToTextItemInteracting, "BOOLValue"))
  {
    v40 = WeakRetained;
    objc_msgSend(v40, "_anyTextItemConstrainedToLineAtPoint:", v11, v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "rects");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "CGRectValue");
      v45 = v115;
      v115[4] = v46;
      v45[5] = v47;
      v45[6] = v48;
      v45[7] = v49;

      objc_storeStrong(v109 + 5, CFSTR("_UITextCursorLinkRegion"));
    }

  }
  else
  {
    -[UITextInteraction view](self->_linkInteraction, "view");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __80__UITextInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
      v107[3] = &unk_1E16E5C10;
      v107[4] = &v114;
      v107[5] = &v108;
      objc_msgSend(v40, "_requestTextItemConstrainedToLineAtPoint:resultHandler:", v107, v11, v13);
    }
  }

  v50 = -[UITextInteractionAssistant currentCursorBehavior](self, "currentCursorBehavior");
  x = *MEMORY[0x1E0C9D648];
  v52 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v53 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v54 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  switch(v50)
  {
    case 0:
      if (!v21)
      {
        v57 = v9;
        goto LABEL_74;
      }
      if (-[UITextInteractionAssistant isInteractiveSelectionDisabled](self, "isInteractiveSelectionDisabled"))
        v56 = v109[5] == CFSTR("_UITextCursorLinkRegion");
      else
        v56 = 1;
      objc_msgSend(WeakRetained, "closestPositionToPoint:", v11, v13);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
        v59 = v56;
      else
        v59 = 0;
      if (!v59)
      {
        LOBYTE(v68) = 1;
        goto LABEL_69;
      }
      objc_msgSend(WeakRetained, "caretRectForPosition:", v58);
      v101 = v60;
      rect = v61;
      rect_8 = v62;
      rect_16 = v63;
      v64 = *((double *)v115 + 7);
      +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "textSettings");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (vabdd_f64(rect_16, v64) >= 50.0)
      {
        objc_msgSend(v66, "regionCaptureMultiplier");
        v70 = v69;
        UIDistanceBetweenPointAndRect(v11, v13, v101, rect_8, rect, rect_16);
        if (v71 >= rect_16 * v70)
          goto LABEL_43;
      }
      else
      {
        v67 = -CGRectGetWidth(*((CGRect *)v115 + 1));
        v123.origin.x = v101;
        v123.size.width = rect;
        v123.origin.y = rect_8;
        v123.size.height = rect_16;
        v124 = CGRectInset(v123, v67, 0.0);
        v121.x = v11;
        v121.y = v13;
        if (!CGRectContainsPoint(v124, v121))
        {
LABEL_43:
          if (-[UITextInteractionAssistant hasActiveSelectionInteraction](self, "hasActiveSelectionInteraction"))
            goto LABEL_52;
          v68 = 0;
LABEL_48:
          if ((objc_msgSend(v109[5], "isEqualToString:", CFSTR("_UITextCursorLinkRegion")) & 1) != 0)
          {
            if (!v68)
              goto LABEL_68;
          }
          else
          {
            objc_storeStrong(v109 + 5, CFSTR("_UITextLineCursorRegion"));
            if ((v68 & 1) == 0)
            {
              LOBYTE(v68) = 0;
LABEL_68:

LABEL_69:
              objc_msgSend(rect_24, "view");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = v94;
              if (v16 != v94)
              {
                objc_msgSend(v94, "convertRect:fromView:", v16, x, v52, v53, v54);
                x = v96;
                v52 = v97;
                v53 = v98;
                v54 = v99;
              }

              v57 = v9;
              if ((v68 & 1) == 0)
                goto LABEL_74;
              break;
            }
          }
LABEL_52:
          objc_msgSend(v16, "bounds");
          v73 = v72;
          v75 = v74;
          v77 = v76;
          v79 = v78;
          MinX = CGRectGetMinX(*((CGRect *)v115 + 1));
          v125.origin.x = v73;
          v125.origin.y = v75;
          v125.size.width = v77;
          v125.size.height = v79;
          v81 = CGRectGetMinX(v125);
          if (MinX < v81)
            MinX = v81;
          Width = CGRectGetWidth(*((CGRect *)v115 + 1));
          v126.origin.x = v73;
          v126.origin.y = v75;
          v126.size.width = v77;
          v126.size.height = v79;
          v83 = CGRectGetMaxX(v126) - MinX;
          if (Width >= v83)
            v84 = v83;
          else
            v84 = Width;
          if (v84 == v77)
          {
            objc_msgSend(WeakRetained, "tokenizer");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = v85;
            if (v85)
            {
              objc_msgSend(v85, "rangeEnclosingPosition:withGranularity:inDirection:", v58, 4, 0);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87
                || (objc_msgSend(v86, "rangeEnclosingPosition:withGranularity:inDirection:", v58, 2, 0),
                    (v87 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                if ((objc_msgSend(v87, "isEmpty") & 1) == 0)
                {
                  objc_msgSend(WeakRetained, "firstRectForRange:", v87);
                  y = v127.origin.y;
                  v89 = v127.size.width;
                  height = v127.size.height;
                  recta = v127.origin.x;
                  v91 = CGRectGetWidth(v127);
                  if (v91 > 0.0)
                  {
                    v128.origin.x = recta;
                    v128.origin.y = y;
                    v128.size.width = v89;
                    v128.size.height = height;
                    MinX = CGRectGetMinX(v128);
                    v84 = v91;
                  }
                }
              }

            }
          }
          objc_msgSend(v66, "textLineRegionPadding");
          v93 = -v92;
          v129.origin.x = MinX;
          v129.origin.y = rect_8;
          v129.size.height = rect_16;
          v129.size.width = v84;
          v130 = CGRectInset(v129, v93, v93);
          x = v130.origin.x;
          v52 = v130.origin.y;
          v53 = v130.size.width;
          v54 = v130.size.height;
          LOBYTE(v68) = 1;
          goto LABEL_68;
        }
      }
      v68 = 1;
      goto LABEL_48;
    case 1:
      x = *((double *)v115 + 4);
      v52 = *((double *)v115 + 5);
      v53 = *((double *)v115 + 6);
      v54 = *((double *)v115 + 7);
      v57 = v9;
      if (!v21)
        goto LABEL_74;
      break;
    case 2:
      v55 = 0;
      goto LABEL_75;
    default:
      v57 = v9;
      if (!v21)
      {
LABEL_74:
        v55 = v57;
        goto LABEL_75;
      }
      break;
  }
  v131.origin.x = x;
  v131.origin.y = v52;
  v131.size.width = v53;
  v131.size.height = v54;
  v122.x = v11;
  v122.y = v13;
  v55 = v9;
  if (CGRectContainsPoint(v131, v122))
  {
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v109[5], x, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_75:

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  return v55;
}

void __80__UITextInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double *v12;

  if (!CGRectIsEmpty(*(CGRect *)&a3))
  {
    v12 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    v12[4] = a3;
    v12[5] = a4;
    v12[6] = a5;
    v12[7] = a6;
    if (a2)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("_UITextCursorLinkRegion"));
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v19;
  double v20;
  double Width;
  uint64_t v22;
  double v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("_UITextCursorLinkRegion"));

  if (!v8)
  {
    if (!-[UITextInteractionAssistant isInteractiveSelectionDisabled](self, "isInteractiveSelectionDisabled"))
    {
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("_UITextLineCursorRegion")))
      {

        goto LABEL_8;
      }
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("_UITextCursorBoundingRegion"));

      if (v12)
      {
LABEL_8:
        objc_msgSend(v5, "rect");
        objc_msgSend(WeakRetained, "closestPositionToPoint:", v14 + v13 * 0.5, v16 + v15 * 0.5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(WeakRetained, "caretRectForPosition:", v9);
          if (v19 > v20)
          {
            Width = CGRectGetWidth(*(CGRect *)&v17);
            v22 = 1;
            goto LABEL_16;
          }
          Width = CGRectGetHeight(*(CGRect *)&v17);
        }
        else
        {
          Width = 0.0;
        }
        v22 = 2;
LABEL_16:
        +[UITextInteraction _maximumBeamSnappingLength](UITextInteraction, "_maximumBeamSnappingLength");
        v25 = 2 * (Width <= v24);
        +[UIPointerShape beamWithPreferredLength:axis:](UIPointerShape, "beamWithPreferredLength:axis:", v22, Width);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v26, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "identifier");
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v27 != CFSTR("_UITextLineCursorRegion"))
          objc_msgSend(v10, "setConstrainedAxes:", 0);
        goto LABEL_3;
      }
    }
    +[UIPointerStyle systemPointerStyle](UIPointerStyle, "systemPointerStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  +[UIPointerShape _linkPointerShape](UIPointerShape, "_linkPointerShape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:

LABEL_12:
  return v10;
}

- (BOOL)canShowSelectionCommands
{
  return self->_canShowSelectionCommands;
}

- (BOOL)needsGestureUpdate
{
  return self->_needsGestureUpdate;
}

- (void)setNeedsGestureUpdate:(BOOL)a3
{
  self->_needsGestureUpdate = a3;
}

- (id)grabberSuppressionAssertion
{
  return self->_grabberSuppressionAssertion;
}

- (id)obtainSelectionGrabberSuppressionAssertion
{
  UITextSelectionView *selectionView;

  selectionView = self->_selectionView;
  if (selectionView)
    -[UITextSelectionView obtainGrabberSuppressionAssertion](selectionView, "obtainGrabberSuppressionAssertion");
  else
    -[UITextSelectionDisplayInteraction _obtainGrabberSuppressionAssertion](self->_selectionViewManager, "_obtainGrabberSuppressionAssertion");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
  objc_storeStrong(&self->_keyboardSuppressionAssertion, a3);
}

- (id)_asText
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_proxyTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canAutoscroll
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[UITextInteractionAssistant _asTextAutoscrolling](self, "_asTextAutoscrolling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[UITextInteractionAssistant _asAsyncTextInputClient](self, "_asAsyncTextInputClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (id)_asTextAutoscrolling
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_proxyTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EDE6F718))
  {
    objc_msgSend(WeakRetained, "_proxyTextInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_asAsyncTextInputClient
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;

  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_proxyTextInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocolCached:", &unk_1EE0CE228);

    if (v5)
    {
      objc_msgSend(WeakRetained, "_proxyTextInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_asBETextInput
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;

  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_proxyTextInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocolCached:", &unk_1EE0CE288);

    if (v5)
    {
      objc_msgSend(WeakRetained, "_proxyTextInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setSuppressSystemUI:(BOOL)a3
{
  _BOOL4 suppressSystemUI;

  suppressSystemUI = self->_suppressSystemUI;
  self->_suppressSystemUI = a3;
  if (suppressSystemUI != a3)
  {
    if (a3)
      -[UITextInteractionAssistant activateSelection](self, "activateSelection");
    else
      -[UITextInteractionAssistant deactivateSelection](self, "deactivateSelection");
  }
}

- (UITextRangeAdjustmentInteraction)rangeAdjustmentInteraction
{
  return self->_rangeAdjustmentInteraction;
}

- (int)selectionHighlightMode
{
  void *v4;
  int v5;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    return -[UITextSelectionDisplayInteraction rangeViewMode](self->_selectionViewManager, "rangeViewMode");
  }
  -[UITextSelectionView rangeView](self->_selectionView, "rangeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");

  return v5;
}

- (void)setSelectionHighlightMode:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[UITextSelectionView rangeView](self->_selectionView, "rangeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMode:", v3);

  -[UITextSelectionDisplayInteraction setRangeViewMode:](self->_selectionViewManager, "setRangeViewMode:", v3);
}

- (void)selectionChanged
{
  void *v3;
  int v4;
  _UITextChoiceAccelerationAssistant *textChoicesAssistant;
  void *v6;
  void *v7;
  id v8;

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionChanged");
  -[UITextInteractionAssistant view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[UITextInteractionAssistant viewConformsToAsynchronousInteractionProtocol](self, "viewConformsToAsynchronousInteractionProtocol"))
  {
    v4 = objc_msgSend(v3, "shouldAllowHidingSelectionCommands") ^ 1;
  }
  else
  {
    v4 = 0;
  }
  if ((objc_msgSend(v8, "isCommitting") & 1) == 0
    && ((v4 | -[UITextInteractionAssistant expectingCommit](self, "expectingCommit")) & 1) == 0)
  {
    -[_UITextInteractionEditMenuAssistant _hideSelectionCommandsWithReason:](self->_editMenuAssistant, "_hideSelectionCommandsWithReason:", 2);
    -[UITextLinkInteraction dismissEditMenuOnSelectionChangeIfNecessary](self->_linkInteraction, "dismissEditMenuOnSelectionChangeIfNecessary");
    textChoicesAssistant = self->_textChoicesAssistant;
    objc_msgSend(v8, "selectedRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationAssistant updateUnderlinesIfNeededAfterPosition:](textChoicesAssistant, "updateUnderlinesIfNeededAfterPosition:", v7);

  }
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    if ((objc_msgSend(v8, "isCommitting") & 1) != 0
      || -[UITextInteractionAssistant expectingCommit](self, "expectingCommit")
      || -[UITextInteractionAssistant requiresImmediateUpdate](self, "requiresImmediateUpdate"))
    {
      -[UITextSelectionDisplayInteraction layoutManagedSubviews](self->_selectionViewManager, "layoutManagedSubviews");
    }
    else
    {
      -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self->_selectionViewManager, "setNeedsSelectionUpdate");
    }
  }
  else
  {
    -[UITextSelectionView selectionChanged](self->_selectionView, "selectionChanged");
  }
  if (!-[UITextInteractionAssistant usesAsynchronousSelectionController](self, "usesAsynchronousSelectionController"))
    -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (BOOL)_selectionIsActivated
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    return -[UITextSelectionDisplayInteraction isActivated](self->_selectionViewManager, "isActivated");
  }
  else
  {
    return -[UITextSelectionView isValid](self->_selectionView, "isValid");
  }
}

- (void)setNeedsSelectionDisplayUpdate:(int64_t)a3
{
  id v5;

  -[UITextSelectionView deferredUpdateSelectionRects](self->_selectionView, "deferredUpdateSelectionRects");
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdateWithReason:](self->_selectionViewManager, "setNeedsSelectionUpdateWithReason:", a3);
  -[_UITextChoiceAccelerationAssistant setNeedsUnderlineUpdateWithReason:](self->_textChoicesAssistant, "setNeedsUnderlineUpdateWithReason:", a3);
  if (a3 == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsAutocorrectionRectsUpdate");

  }
}

- (BOOL)isSelectionDisplayVisible
{
  return +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled")|| -[UITextSelectionView visible](self->_selectionView, "visible");
}

- (BOOL)isCursorBlinkAnimationEnabled
{
  void *v3;
  char v4;

  if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))return -[UITextSelectionView caretBlinks](self->_selectionView, "caretBlinks");
  -[UITextSelectionDisplayInteraction cursorView](self->_selectionViewManager, "cursorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlinking");

  return v4;
}

- (void)setGlowViewMode:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction _setGlowViewMode:](self->_selectionViewManager, "_setGlowViewMode:", v3);
  }
}

- (int)glowViewMode
{
  int result;

  result = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled");
  if (result)
    return -[UITextSelectionDisplayInteraction _glowViewMode](self->_selectionViewManager, "_glowViewMode");
  return result;
}

- (id)selectionView
{
  void *v3;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    NSLog(CFSTR("Warning: -[UITextInteractionAssistant selectionView] now returns nil with redesigned_text_cursor=on."));
    v3 = 0;
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (_UITextSelectionWidgetAnimating)_caretView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction _cursorView](self->_selectionViewManager, "_cursorView");
  }
  else
  {
    -[UITextSelectionView caretView](self->_selectionView, "caretView");
  }
  return (_UITextSelectionWidgetAnimating *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIView)dynamicCaretView
{
  return (UIView *)-[UITextSelectionView dynamicCaret](self->_selectionView, "dynamicCaret");
}

- (BOOL)requiresImmediateUpdate
{
  return 0;
}

- (BOOL)shouldDisplayLoupeSessionForTouchType:(int64_t)a3
{
  return a3 == 0;
}

- (unint64_t)loupeOrientation
{
  if (-[UITextInteractionAssistant isDisplayingVerticalSelection](self, "isDisplayingVerticalSelection"))
    return 2;
  else
    return 1;
}

- (UITextInput)textDocument
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (-[UITextInteractionAssistant containerIsBrowserView](self, "containerIsBrowserView"))
  {
    objc_msgSend(WeakRetained, "_proxyTextInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formElement");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = WeakRetained;
    v8 = v7;

    WeakRetained = v8;
  }
  return (UITextInput *)WeakRetained;
}

- (UITextInteraction)interactions
{
  return self->_interactions;
}

- (id)linkInteraction
{
  void *v3;
  UITextLinkInteraction *v4;

  -[UITextInteraction view](self->_linkInteraction, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = self->_linkInteraction;
  else
    v4 = 0;
  return v4;
}

- (void)setExternalInteractions:(id)a3
{
  UITextInteraction *v4;
  int64_t textInteractionMode;
  uint64_t v6;
  UITextInteraction *externalInteractions;
  UITextInteraction *v8;
  void *v9;

  v4 = (UITextInteraction *)a3;
  textInteractionMode = self->_textInteractionMode;
  v6 = -[UITextInteraction textInteractionMode](v4, "textInteractionMode");
  externalInteractions = self->_externalInteractions;
  self->_externalInteractions = v4;
  v8 = v4;

  self->_textInteractionMode = -[UITextInteraction textInteractionMode](v8, "textInteractionMode");
  -[UITextInteraction delegate](v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction setDelegate:](self->_interactions, "setDelegate:", v9);

  if (textInteractionMode != v6)
    -[UITextInteractionAssistant setGestureRecognizers](self, "setGestureRecognizers");
}

- (UITapGestureRecognizer)singleTapGesture
{
  return (UITapGestureRecognizer *)-[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17787A0);
}

- (UIGestureRecognizer)doubleTapGesture
{
  return (UIGestureRecognizer *)-[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E1778820);
}

- (UILongPressGestureRecognizer)loupeGesture
{
  return (UILongPressGestureRecognizer *)-[UITextInteraction recognizerForName:](self->_interactions, "recognizerForName:", 0x1E17788A0);
}

- (void)setLoupeGestureEndPoint:(CGPoint)a3
{
  self->_loupeGestureEndPoint = a3;
}

- (CGPoint)loupeGestureEndPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_loupeGestureEndPoint.x;
  y = self->_loupeGestureEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInGesture:(BOOL)a3
{
  self->_inGesture = a3;
}

- (BOOL)autoscrolled
{
  return self->_autoscrolled;
}

- (void)setAutoscrolled:(BOOL)a3
{
  self->_autoscrolled = a3;
}

- (CGPoint)autoscrollUntransformedExtentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_autoscrollUntransformedExtentPoint.x;
  y = self->_autoscrollUntransformedExtentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAutoscrollUntransformedExtentPoint:(CGPoint)a3
{
  self->_autoscrollUntransformedExtentPoint = a3;
}

- (BOOL)externalTextInput
{
  return self->_externalTextInput;
}

- (BOOL)expectingCommit
{
  return self->_expectingCommit;
}

- (void)setExpectingCommit:(BOOL)a3
{
  self->_expectingCommit = a3;
}

- (void)invalidate
{
  -[UITextInteractionAssistant detach:](self, "detach:", 1);
  -[UITextSelectionView invalidate](self->_selectionView, "invalidate");
}

- (BOOL)isValid
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UITextInteractionAssistant _selectionIsActivated](self, "_selectionIsActivated");
  if (v3)
  {
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValid");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)detach
{
  -[UITextInteractionAssistant detach:](self, "detach:", 0);
}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[UITextInteractionAssistant view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_enclosingScrollerIncludingSelf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v4;
}

- (UIFieldEditor)fieldEditor
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;

  -[UITextInteractionAssistant view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_proxyTextInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[UITextInteractionAssistant view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_proxyTextInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    -[UITextInteractionAssistant view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "_proxyTextInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_fieldEditor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();

      -[UITextInteractionAssistant view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if ((v11 & 1) != 0)
      {
        objc_msgSend(v12, "_fieldEditor");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v14 = objc_opt_isKindOfClass();

        if ((v14 & 1) == 0)
        {
          v7 = 0;
          return (UIFieldEditor *)v7;
        }
        -[UITextInteractionAssistant view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_firstTextView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v6;
        else
          v16 = 0;
        v13 = v16;
      }
      v7 = v13;
    }
  }

  return (UIFieldEditor *)v7;
}

- (BOOL)containerIsTextField
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[UITextInteractionAssistant view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UITextInteractionAssistant view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_proxyTextInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UITextInteractionAssistant fieldEditor](self, "fieldEditor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 != 0;

    }
  }

  return v4;
}

- (BOOL)containerAllowsSelection
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  -[UITextInteractionAssistant view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[UITextInteractionAssistant view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "clearingBehavior");

  return v6 != 2;
}

- (void)canBeginDragCursor:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  -[UITextInteractionAssistant scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;

  -[UITextInteractionAssistant scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  if (v6 > v9)
    objc_msgSend(v10, "setCanBeginDrag:", 0);

}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return -[UITextContextMenuInteraction contextMenuInteraction](self->_textContextMenuInteraction, "contextMenuInteraction");
}

- (void)setFirstResponderIfNecessary
{
  -[UITextInteractionAssistant setFirstResponderIfNecessaryActivatingSelection:](self, "setFirstResponderIfNecessaryActivatingSelection:", 1);
}

- (void)setFirstResponderIfNecessaryActivatingSelection:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_msgSend(WeakRetained, "isFirstResponder");
  if ((objc_msgSend(WeakRetained, "isFirstResponder") & 1) == 0)
  {
    if (!-[UITextInteractionAssistant containerIsBrowserView](self, "containerIsBrowserView")
      || (objc_msgSend(WeakRetained, "_proxyTextInput"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "formElement"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      objc_msgSend(WeakRetained, "becomeFirstResponder");
    }
  }
  if (objc_msgSend(WeakRetained, "isFirstResponder"))
  {
    -[UITextInteractionAssistant view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_responderWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeKeyWindow");

    if (v5)
    {
      objc_msgSend(WeakRetained, "_responderWindow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_isApplicationKeyWindow");

      if ((v11 & 1) == 0)
        objc_msgSend(WeakRetained, "reloadInputViews");
    }
    -[UITextCursorAssertionController _updateSubjectWithAssertionState](self->_assertionController, "_updateSubjectWithAssertionState");
  }
  if (v3)
  {
    if (objc_msgSend(WeakRetained, "isFirstResponder"))
    {
      if (!-[UITextInteractionAssistant _selectionIsActivated](self, "_selectionIsActivated"))
      {
        +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", WeakRetained);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "deferBecomingResponder");

        if ((v13 & 1) == 0)
          -[UITextInteractionAssistant activateSelection](self, "activateSelection");
      }
    }
  }

}

- (void)scrollSelectionToVisible
{
  -[UITextInteractionAssistant scrollSelectionToVisible:](self, "scrollSelectionToVisible:", 1);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id WeakRetained;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  -[UITextInteractionAssistant scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UITextInteractionAssistant activeSelection](self, "activeSelection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectionChanged");

    }
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[UITextInteractionAssistant activeSelection](self, "activeSelection", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectionRects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v42;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v20), "rect");
            v50.origin.x = v21;
            v50.origin.y = v22;
            v50.size.width = v23;
            v50.size.height = v24;
            v47.origin.x = x;
            v47.origin.y = y;
            v47.size.width = width;
            v47.size.height = height;
            v48 = CGRectUnion(v47, v50);
            x = v48.origin.x;
            y = v48.origin.y;
            width = v48.size.width;
            height = v48.size.height;
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v18);
      }

    }
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    if (CGRectIsNull(v49))
    {
      -[UITextInteractionAssistant activeSelection](self, "activeSelection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "caretRect");
      x = v26;
      y = v27;
      width = v28;
      height = v29;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textInputView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromView:", v31, x, y, width, height);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    if (v37 == 0.0)
      v40 = 1.0;
    else
      v40 = v37;
    objc_msgSend(v5, "scrollRectToVisible:animated:", v3, v33, v35, v40, v39);
  }

}

- (void)setWillHandoffLoupeMagnifier
{
  self->_willHandoffLoupeMagnifier = 1;
}

- (void)resetWillHandoffLoupeMagnifier
{
  self->_willHandoffLoupeMagnifier = 0;
}

- (BOOL)willHandoffLoupeMagnifier
{
  return self->_willHandoffLoupeMagnifier;
}

- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8
{
  UITextInteraction *interactions;
  id v14;
  id v15;
  id v16;
  id v17;

  interactions = self->_interactions;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  -[UITextInteraction interactionWithGestureForName:](interactions, "interactionWithGestureForName:", 0x1E17788A0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "willBeginExternalGesture");
  objc_msgSend(v17, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", a3, v16, v15, v14, a7, a8);

}

- (void)loupeMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (self->_willHandoffLoupeMagnifier)
    {
      self->_willHandoffLoupeMagnifier = 0;
      goto LABEL_11;
    }
    v11 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v10, WeakRetained, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

LABEL_10:
    v8 = v11;
    goto LABEL_11;
  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    v8 = v11;
    if (!self->_willHandoffLoupeMagnifier)
    {
      objc_msgSend(v11, "stopMagnifying:", 1);
      -[UITextInteractionAssistant didEndSelectionInteraction](self, "didEndSelectionInteraction");
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)rangedMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v11 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v10, WeakRetained, 1, x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

LABEL_7:
    v8 = v11;
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    objc_msgSend(v11, "stopMagnifying:", 1);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)lollipopGestureWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "manuallyUpdateInteractionWithGestureState:location:locationOfFirstTouch:forTouchType:", a3, a6, v10, v9, x, y);

}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0)
  {

LABEL_4:
    objc_msgSend(v8, "setSelectionWithPoint:", x, y);
    objc_msgSend(v8, "setGranularity:", 0);
    goto LABEL_5;
  }
  v7 = objc_msgSend(v8, "hasEditableSelection");

  if ((v7 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (void)commitSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0)
  {

LABEL_4:
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatingCursorPositionForPoint:", x, y);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v14, "setSelectionWithPoint:", v10, v12);
    objc_msgSend(v14, "setGranularity:", 0);
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commit");

    -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
    goto LABEL_5;
  }
  v7 = objc_msgSend(v14, "hasEditableSelection");

  if ((v7 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (void)extendSelectionToPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0)
  {

LABEL_4:
    objc_msgSend(v8, "extendSelectionToPoint:", x, y);
    objc_msgSend(v8, "setGranularity:", 0);
    goto LABEL_5;
  }
  v7 = objc_msgSend(v8, "hasEditableSelection");

  if ((v7 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (void)extendSelectionToLoupeOrSetToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  if (!self->_stashedTextRange)
    goto LABEL_8;
  -[UITextInteractionAssistant loupeGesture](self, "loupeGesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "numberOfTouches"))
    goto LABEL_7;
  -[UITextInteractionAssistant loupeGesture](self, "loupeGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") <= 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[UITextInteractionAssistant loupeGesture](self, "loupeGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  if (v9 <= 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "setSelectedTextRange:", self->_stashedTextRange);

    self->_didUseStashedRange = 1;
    -[UITextInteractionAssistant loupeGesture](self, "loupeGesture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteractionAssistant loupeGesture](self, "loupeGesture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", v13);
    v15 = v14;
    v17 = v16;

    -[UITextInteractionAssistant extendSelectionToPoint:](self, "extendSelectionToPoint:", v15, v17);
    return;
  }
LABEL_8:
  -[UITextInteractionAssistant setSelectionWithPoint:](self, "setSelectionWithPoint:", x, y);
}

+ (int64_t)_nextGranularityInCycle:(int64_t)a3 forTouchType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  v4 = 2;
  if (a4 == 3)
    v4 = 3;
  if (((1 << a3) & 0x14) != 0)
    v5 = 3;
  else
    v5 = v4;
  if (((1 << a3) & 0x29) != 0)
    v6 = 1;
  else
    v6 = v5;
  if ((unint64_t)a3 <= 5)
    return v6;
  else
    return a3;
}

- (void)checkEditabilityAndSetFirstResponderIfNecessary
{
  UITextInput **p_view;
  id WeakRetained;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  id v12;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  self->_needsGestureUpdate = objc_msgSend(WeakRetained, "isFirstResponder") ^ 1;

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)p_view);
  if (-[UITextInteractionAssistant viewCouldBecomeEditable:](self, "viewCouldBecomeEditable:", v5))
  {
    objc_msgSend(v12, "selectedRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isRanged");

    if ((v7 & 1) == 0)
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateChangeTimeAndIncrementCount");

      v9 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v9, "setEditable:", 1);

      -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
LABEL_7:
      -[UITextInteractionAssistant setGestureRecognizers](self, "setGestureRecognizers");
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  if (self->_needsGestureUpdate)
  {
    v10 = objc_loadWeakRetained((id *)p_view);
    v11 = objc_msgSend(v10, "isFirstResponder");

    if (v11)
      goto LABEL_7;
  }
LABEL_8:

}

- (void)selectWord
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  id WeakRetained;
  CGRect v15;

  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  -[UITextInteractionAssistant configureForSelectionMode](self, "configureForSelectionMode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caretRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0
    || (v15.origin.x = v5, v15.origin.y = v7, v15.size.width = v9, v15.size.height = v11, !CGRectIsEmpty(v15)))
  {
    x = v5 + v9 * 0.5;
    y = v7 + v11 * 0.5;
  }
  else
  {
    x = self->_loupeGestureEndPoint.x;
    y = self->_loupeGestureEndPoint.y;
  }
  objc_msgSend(v3, "alterSelection:granularity:", 1, x, y);
  objc_msgSend(v3, "commit");
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
  {
    -[_UITextInteractionEditMenuAssistant showSelectionCommandsAfterDelay:](self->_editMenuAssistant, "showSelectionCommandsAfterDelay:", 0.2);
  }
  -[UITextInteractionAssistant scrollSelectionToVisible](self, "scrollSelectionToVisible");
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (void)selectWordWithoutShowingCommands
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  id WeakRetained;
  CGRect v15;

  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  -[UITextInteractionAssistant configureForSelectionMode](self, "configureForSelectionMode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caretRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((objc_msgSend(WeakRetained, "isEditable") & 1) != 0
    || (v15.origin.x = v5, v15.origin.y = v7, v15.size.width = v9, v15.size.height = v11, !CGRectIsEmpty(v15)))
  {
    x = v5 + v9 * 0.5;
    y = v7 + v11 * 0.5;
  }
  else
  {
    x = self->_loupeGestureEndPoint.x;
    y = self->_loupeGestureEndPoint.y;
  }
  objc_msgSend(v3, "alterSelection:granularity:", 1, x, y);
  objc_msgSend(v3, "commit");
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (BOOL)shouldSuppressSelectionCommands
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  int v7;
  void *v9;
  void *v10;
  id WeakRetained;

  if (self->_automaticSelectionCommandsSuppressed)
    goto LABEL_4;
  -[UITextInteractionAssistant textDocument](self, "textDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UIDictationController shouldHideSelectionUIForTextView:](UIDictationController, "shouldHideSelectionUIForTextView:", v3);

  if (v4
    || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "shouldSuppressSelectionCommands"),
        v5,
        (v6 & 1) != 0))
  {
LABEL_4:
    LOBYTE(v7) = 1;
  }
  else
  {
    -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v9, "automaticallyPresentEditMenu") ^ 1;
    }
    else
    {
      -[UITextInteractionAssistant _asAsyncTextInputClient](self, "_asAsyncTextInputClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v7) = objc_msgSend(v10, "shouldSuppressEditMenu");
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          LOBYTE(v7) = objc_msgSend(WeakRetained, "_shouldSuppressSelectionCommands");
        else
          LOBYTE(v7) = 0;

      }
    }

  }
  return v7;
}

- (void)showSelectionCommands
{
  -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
}

- (void)hideSelectionCommands
{
  -[_UITextInteractionEditMenuAssistant hideSelectionCommands](self->_editMenuAssistant, "hideSelectionCommands");
}

- (void)setAutomaticSelectionCommandsSuppressedForPointerTouchType:(BOOL)a3
{
  self->_automaticSelectionCommandsSuppressed = a3;
}

- (void)selectAll:(id)a3
{
  void *v5;
  id WeakRetained;

  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAll");
  objc_msgSend(v5, "commit");
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  if (a3
    && -[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
  {
    -[_UITextInteractionEditMenuAssistant showSelectionCommandsAfterDelay:](self->_editMenuAssistant, "showSelectionCommandsAfterDelay:", 0.2);
  }
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (void)clearSelection
{
  void *v3;
  id v4;

  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSelection");
  objc_msgSend(v4, "commit");
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (void)notifyKeyboardSelectionChanged
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UITextInteractionAssistant view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITextInteractionAssistant view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyboardInputChangedSelection:", v7);

  }
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  -[UITextInteractionAssistant _updateSelectionWithPoint:granularity:forceGranularity:](self, "_updateSelectionWithPoint:granularity:forceGranularity:", 0, 1, a3.x, a3.y);
}

- (void)_updateSelectionWithPoint:(CGPoint)a3 granularity:(int64_t)a4 forceGranularity:(BOOL)a5
{
  double y;
  double x;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "baseIsStart");

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction highlightView](self->_selectionViewManager, "highlightView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rangeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textInputView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:toView:", v15, x, y);

  objc_msgSend(v16, "setRangedSelectionExtentPoint:baseIsStart:", v11, x, y);
  if (a5 || objc_msgSend(v16, "willSelectionChange"))
    objc_msgSend(v16, "setGranularity:", a4);
  objc_msgSend(v16, "commit");
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (void)updateWithMagnifierTerminalPoint:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  UITextInteractionAssistant *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(id *);
  void *v28;
  id v29;
  UITextInteractionAssistant *v30;
  id v31;
  id v32;

  v3 = a3;
  if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rangeView");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v6, "stopMagnifying:", 0);

      return;
    }
    if ((!objc_msgSend(v6, "terminalPointPlacedCarefully")
       || -[UITextInteractionAssistant autoscrolled](self, "autoscrolled"))
      && (-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView", v18),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
      objc_msgSend(v18, "setAnimateUpdate:", 1);
      objc_msgSend(v18, "startGrabber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAnimating:", 1);

      objc_msgSend(v18, "endGrabber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAnimating:", 1);

      v12 = MEMORY[0x1E0C809B0];
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke;
      v28 = &unk_1E16B51E8;
      v29 = v6;
      v30 = self;
      v13 = v18;
      v31 = v13;
      v32 = WeakRetained;
      v20 = v12;
      v21 = 3221225472;
      v22 = __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke_2;
      v23 = &unk_1E16B3FD8;
      v24 = self;
      v14 = WeakRetained;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, &v25, &v20, 0.2, 0.0);
      objc_msgSend(v13, "setAnimateUpdate:", 0);
      -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");

    }
    else if (v3)
    {
      objc_msgSend(v6, "terminalPoint");
      objc_msgSend(v6, "setMagnificationPoint:");
      objc_msgSend(v18, "activeTouchPoint");
      -[UITextInteractionAssistant updateSelectionWithPoint:](self, "updateSelectionWithPoint:");
    }
    objc_msgSend(v6, "stopMagnifying:", 1, v18, v20, v21, v22, v23, v24, v25, v26, v27, v28);

  }
  -[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_editMenuIsVisible");

  if ((v16 & 1) == 0)
  {
    -[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showSelectionCommandsAfterDelay:", 0.0);

  }
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
}

void __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke(id *a1)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v2 = objc_msgSend(a1[4], "horizontalMovement");
  if (v2 >= 0)
    v3 = -1;
  else
    v3 = 3;
  if (v2 <= 0)
    v4 = v3;
  else
    v4 = 2;
  objc_msgSend(a1[5], "activeSelection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "smartExtendRangedSelection:downstream:", v4, objc_msgSend(a1[6], "baseIsStart"));
  objc_msgSend(v11, "commit");
  objc_msgSend(a1[6], "updateBaseAndExtentPointsFromEdges");
  v5 = a1[6];
  objc_msgSend(v5, "extentPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[7], "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v10, v7, v9);
  objc_msgSend(a1[4], "setAnimationPoint:");

}

uint64_t __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectionAnimationDidStop");
}

- (void)selectionAnimationDidStop
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimating:", 0);

  objc_msgSend(v5, "endGrabber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", 0);

}

- (void)rangeSelectionStarted:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant interactions](self, "interactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_callDelegateWillMoveTextRangeExtentAtPoint:", x, y);

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInteractionAssistant willBeginSelectionInteraction](self, "willBeginSelectionInteraction");
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  if (objc_msgSend(v8, "baseIsStart"))
  {
    objc_msgSend(v10, "setRangedSelectionBaseToCurrentSelectionStart");
    objc_msgSend(v10, "setRangedSelectionInitialExtentToCurrentSelectionEnd");
  }
  else
  {
    objc_msgSend(v10, "setRangedSelectionBaseToCurrentSelectionEnd");
    objc_msgSend(v10, "setRangedSelectionInitialExtentToCurrentSelectionStart");
  }
  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForceRangeView:", 1);

  -[UITextInteractionAssistant _updateSelectionWithPoint:granularity:forceGranularity:](self, "_updateSelectionWithPoint:granularity:forceGranularity:", objc_msgSend(v10, "granularity"), 0, x, y);
  objc_msgSend(v8, "performSelector:withObject:afterDelay:", sel_beginMagnifying, 0, 0.4);
  objc_msgSend(v8, "setWillBeginMagnifying:", 1);

}

- (void)rangeSelectionEnded:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  y = a3.y;
  x = a3.x;
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setForceRangeView:", 0);

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferencesActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if (v11)
  {
    if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
    {
      -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
    }
    -[UITextInteractionAssistant setExpectingCommit:](self, "setExpectingCommit:", 1);
  }
  else
  {
    objc_msgSend(v16, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UITextInteractionAssistant updateWithMagnifierTerminalPoint:](self, "updateWithMagnifierTerminalPoint:", -[UITextInteractionAssistant autoscrolled](self, "autoscrolled") ^ 1);
    }
    else if (objc_msgSend(v7, "commandsWereShowing"))
    {
      -[_UITextInteractionEditMenuAssistant hideSelectionCommands](self->_editMenuAssistant, "hideSelectionCommands");
      if ((objc_msgSend(v7, "autoscrolled") & 1) == 0)
      {
        -[UITextInteractionAssistant setSelectionWithPoint:](self, "setSelectionWithPoint:", x, y);
        -[UITextInteractionAssistant activeSelection](self, "activeSelection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "commit");

        -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
        objc_msgSend(v7, "setWillBeginMagnifying:", 0);
        -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
        goto LABEL_8;
      }
    }
    else if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
    {
      -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
    }
  }
  objc_msgSend(v7, "setWillBeginMagnifying:", 0);
  -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
  objc_msgSend(v7, "startGrabber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateDot");

  objc_msgSend(v7, "endGrabber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateDot");

LABEL_8:
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  -[UITextInteractionAssistant didEndSelectionInteraction](self, "didEndSelectionInteraction");
  -[UITextInteractionAssistant setExpectingCommit:](self, "setExpectingCommit:", 0);

}

- (void)rangeSelectionCanceled
{
  void *v3;
  void *v4;
  void *v5;

  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceRangeView:", 0);

  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rangeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWillBeginMagnifying:", 0);

  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  -[UITextInteractionAssistant didEndSelectionInteraction](self, "didEndSelectionInteraction");
}

- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  CGPoint v39;
  CGRect v40;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeView");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInteractionAssistant _updateSelectionWithPoint:granularity:forceGranularity:](self, "_updateSelectionWithPoint:granularity:forceGranularity:", 0, 0, v7, v6);
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "magnifierPoint");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v38, "_window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textInputView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = v19;
  else
    v20 = v38;
  objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v20, v12, v14);
  v22 = v21;
  v24 = v23;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v39.x = v22;
  v39.y = v24;
  v26 = CGRectContainsPoint(v40, v39);

  objc_msgSend(v10, "target");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

    goto LABEL_10;
  }
  objc_msgSend(v38, "initialExtentPoint");
  if (sqrt((v28 - v7) * (v28 - v7) + (v29 - v6) * (v29 - v6)) <= 8.0)
  {
LABEL_10:
    objc_msgSend(v10, "target");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      if (v26)
        objc_msgSend(v10, "setMagnificationPoint:", v12, v14);
      else
        objc_msgSend(v10, "stopMagnifying:", 1);
    }
    goto LABEL_14;
  }
  if (v26 && objc_msgSend(v38, "willBeginMagnifying"))
    objc_msgSend(v38, "beginMagnifying");
LABEL_14:
  -[UITextInteractionAssistant view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_proxyTextInput");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "textInputView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "convertPoint:toView:", v33, x, y);
  v35 = v34;
  v37 = v36;

  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", v35, v37);
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");

}

- (void)configureForSelectionMode
{
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 0);
}

- (void)configureForHighlightMode
{
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 1);
}

- (void)configureForReplacementMode
{
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 2);
}

- (void)configureForPencilHighlightMode
{
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 4);
}

- (void)configureForPencilDeletionPreviewMode
{
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 5);
}

- (void)beginSelectionChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "beginSelectionChange");

}

- (void)endSelectionChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "endSelectionChange");

}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "constrainedPoint:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)resignedFirstResponder
{
  -[UITextSelectionView hideSelectionCommands](self->_selectionView, "hideSelectionCommands");
  -[UITextSelectionView setVisible:](self->_selectionView, "setVisible:", 0);
  -[UITextSelectionView setCaretBlinks:](self->_selectionView, "setCaretBlinks:", 0);
  -[UITextSelectionView deactivate](self->_selectionView, "deactivate");
}

- (void)stashCurrentSelection
{
  void *v3;
  UITextRange *v4;
  UITextRange *stashedTextRange;

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v4 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  stashedTextRange = self->_stashedTextRange;
  self->_stashedTextRange = v4;

  self->_didUseStashedRange = 0;
}

- (void)clearStashedSelection
{
  UITextRange *stashedTextRange;

  stashedTextRange = self->_stashedTextRange;
  self->_stashedTextRange = 0;

  self->_didUseStashedRange = 0;
}

- (BOOL)didUseStashedSelection
{
  return self->_didUseStashedRange;
}

- (BOOL)viewConformsToAsynchronousInteractionProtocol
{
  NSNumber *viewConformsToAsynchronousInteractionViewProtocol;
  id WeakRetained;
  NSNumber *v5;
  NSNumber *v6;

  viewConformsToAsynchronousInteractionViewProtocol = self->_viewConformsToAsynchronousInteractionViewProtocol;
  if (!viewConformsToAsynchronousInteractionViewProtocol)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "_usesAsynchronousProtocol"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_viewConformsToAsynchronousInteractionViewProtocol;
    self->_viewConformsToAsynchronousInteractionViewProtocol = v5;

    viewConformsToAsynchronousInteractionViewProtocol = self->_viewConformsToAsynchronousInteractionViewProtocol;
  }
  return -[NSNumber BOOLValue](viewConformsToAsynchronousInteractionViewProtocol, "BOOLValue");
}

- (void)willBeginSelectionInteraction
{
  id WeakRetained;
  id v3;

  ++self->_activeSelectionInteractions;
  if (self->_respondsToTextFormattingRestorationMethods)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_prepareForTextFormattingRestoration");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextSelectionInteractionWillBegin"), 0);

}

- (void)didEndSelectionInteraction
{
  id WeakRetained;
  id v3;

  --self->_activeSelectionInteractions;
  if (self->_respondsToTextFormattingRestorationMethods)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_performTextFormattingRestoration");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UITextSelectionInteractionDidEnd"), 0);

}

- (BOOL)hasActiveSelectionInteraction
{
  return self->_activeSelectionInteractions != 0;
}

- (BOOL)cursorVisible
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    return !-[UITextSelectionDisplayInteraction isCursorHidden](self->_selectionViewManager, "isCursorHidden");
  }
  else
  {
    return -[UITextSelectionView caretVisible](self->_selectionView, "caretVisible");
  }
}

- (BOOL)ghostAppearance
{
  void *v3;
  char v4;

  if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))return -[UITextSelectionView ghostAppearance](self->_selectionView, "ghostAppearance");
  -[UITextSelectionDisplayInteraction _cursorView](self->_selectionViewManager, "_cursorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGhostEffectEnabled");

  return v4;
}

- (void)setGhostAppearance:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UITextSelectionView setGhostAppearance:](self->_selectionView, "setGhostAppearance:");
  -[UITextSelectionDisplayInteraction _cursorView](self->_selectionViewManager, "_cursorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGhostEffectEnabled:", v3);

}

- (unint64_t)currentDraggedHandle
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[UITextInteractionAssistant hasActiveSelectionInteraction](self, "hasActiveSelectionInteraction"))
    return 0;
  -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "baseIsStart"))
      v5 = 8;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)willBeginFloatingCursor:(BOOL)a3
{
  -[UITextSelectionView willBeginFloatingCursor:](self->_selectionView, "willBeginFloatingCursor:", a3);
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextSelectionDisplayInteraction *selectionViewManager;
  void *v7;
  void *v8;
  _UITextFloatingCursorSession *v9;
  _UITextFloatingCursorSession *floatingCursorSession;
  UITextSelectionView *selectionView;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant setInGesture:](self, "setInGesture:", 1);
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UITextFloatingCursorSession _invalidate](self->_floatingCursorSession, "_invalidate");
    selectionViewManager = self->_selectionViewManager;
    -[UITextInteractionAssistant view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction _beginFloatingCursorSessionAtPoint:inContainer:](selectionViewManager, "_beginFloatingCursorSessionAtPoint:inContainer:", v8, x, y);
    v9 = (_UITextFloatingCursorSession *)objc_claimAutoreleasedReturnValue();
    floatingCursorSession = self->_floatingCursorSession;
    self->_floatingCursorSession = v9;

  }
  else
  {
    selectionView = self->_selectionView;
    -[UITextInteractionAssistant view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[UITextSelectionView beginFloatingCursorAtPoint:](self->_selectionView, "beginFloatingCursorAtPoint:", v15, v17);
  }
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  -[UITextInteractionAssistant updateFloatingCursorAtPoint:animated:](self, "updateFloatingCursorAtPoint:animated:", 0, a3.x, a3.y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  _UITextFloatingCursorSession *floatingCursorSession;
  void *v9;
  void *v10;
  UITextSelectionView *selectionView;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  floatingCursorSession = self->_floatingCursorSession;
  if (floatingCursorSession)
  {
    -[UITextInteractionAssistant view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](floatingCursorSession, "updateWithPoint:inContainer:animated:", v10, v4, x, y);

  }
  else
  {
    selectionView = self->_selectionView;
    -[UITextInteractionAssistant view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[UITextSelectionView updateFloatingCursorAtPoint:animated:](self->_selectionView, "updateFloatingCursorAtPoint:animated:", v4, v15, v17);
  }
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
}

- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4
{
  double v5;
  double v6;
  void *floatingCursorSession;
  UITextSelectionView *selectionView;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v5 = a3.x + a4.x;
  v6 = a3.y + a4.y;
  floatingCursorSession = self->_floatingCursorSession;
  if (!floatingCursorSession)
  {
    selectionView = self->_selectionView;
    -[UITextInteractionAssistant view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v10, v5, v6);
    v5 = v11;
    v6 = v12;

    floatingCursorSession = self->_selectionView;
  }
  objc_msgSend(floatingCursorSession, "floatingCursorPositionForPoint:lineSnapping:", 0, v5, v6);
  v14 = v13 - v5;
  v16 = v15 - v6;
  result.y = v16;
  result.x = v14;
  return result;
}

- (void)endFloatingCursor
{
  _UITextFloatingCursorSession *floatingCursorSession;
  _UITextFloatingCursorSession *v4;

  -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
  floatingCursorSession = self->_floatingCursorSession;
  if (floatingCursorSession)
  {
    -[_UITextFloatingCursorSession _invalidate](floatingCursorSession, "_invalidate");
    v4 = self->_floatingCursorSession;
    self->_floatingCursorSession = 0;

  }
  else
  {
    -[UITextSelectionView endFloatingCursor](self->_selectionView, "endFloatingCursor");
  }
  -[UITextInteractionAssistant setInGesture:](self, "setInGesture:", 0);
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  if (-[UITextInteractionAssistant _canAutoscroll](self, "_canAutoscroll"))
  {
    -[UITextInteractionAssistant scrollView](self, "scrollView");
    v14 = objc_claimAutoreleasedReturnValue();
    -[UITextInteractionAssistant fieldEditor](self, "fieldEditor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v14 | v6)
    {
      if (v14)
        objc_msgSend((id)v14, "_setAutoscrolling:", 1);
      -[UITextInteractionAssistant setAutoscrolled:](self, "setAutoscrolled:", 0);
      -[UITextInteractionAssistant view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_proxyTextInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textInputView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
      -[UITextInteractionAssistant setAutoscrollUntransformedExtentPoint:](self, "setAutoscrollUntransformedExtentPoint:");

      -[UITextInteractionAssistant _asTextAutoscrolling](self, "_asTextAutoscrolling");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "startAutoscroll:", x, y);
      }
      else
      {
        -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
        else
          -[UITextInteractionAssistant _asAsyncTextInputClient](self, "_asAsyncTextInputClient");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "autoscrollToPoint:", x, y);

      }
    }

  }
}

- (void)cancelAutoscroll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[UITextInteractionAssistant _canAutoscroll](self, "_canAutoscroll"))
  {
    -[UITextInteractionAssistant scrollView](self, "scrollView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v7, "_setAutoscrolling:", 0);
    -[UITextInteractionAssistant _asTextAutoscrolling](self, "_asTextAutoscrolling");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "cancelAutoscroll");
    }
    else
    {
      -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        -[UITextInteractionAssistant _asBETextInput](self, "_asBETextInput");
      else
        -[UITextInteractionAssistant _asAsyncTextInputClient](self, "_asAsyncTextInputClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelAutoscroll");

    }
  }
}

- (void)autoscrollWillNotStart
{
  void *v3;
  void *v4;

  +[UITextMagnifierCaret sharedCaretMagnifier](UITextMagnifierCaret, "sharedCaretMagnifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoscrollWillNotStart");

  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoscrollWillNotStart");

  -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
}

- (void)updateAutoscroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  int v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  unsigned int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double autoscrollFactor;
  int v37;
  double v38;
  unint64_t v39;
  unint64_t autoscrollRamp;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;

  v45 = a3;
  if (-[UITextInteractionAssistant _canAutoscroll](self, "_canAutoscroll"))
  {
    -[UITextInteractionAssistant scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_34:

      goto LABEL_35;
    }
    -[UITextInteractionAssistant setAutoscrolled:](self, "setAutoscrolled:", 1);
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v42 = v5;
    v43 = v7;
    v44 = v7;
    objc_msgSend(v45, "scrollContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteractionAssistant view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_proxyTextInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentFrameForView:", v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    objc_msgSend(v4, "contentInset");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(v45, "directions");
    v27 = v26;
    if ((v26 & 1) != 0)
    {
      if (v6 > v13)
        goto LABEL_12;
      v31 = v26 & 0xFFFFFFFE;
    }
    else
    {
      if ((v26 & 2) == 0)
      {
        v13 = v42;
        if ((v26 & 4) == 0)
        {
          v28 = v45;
          if ((v27 & 8) == 0)
            goto LABEL_21;
          objc_msgSend(v4, "bounds");
          if (v29 + v30 < 64.0)
          {
            v27 &= ~8u;
LABEL_20:
            v28 = v45;
LABEL_21:
            if (v27)
              goto LABEL_22;
            goto LABEL_33;
          }
          objc_msgSend(v4, "bounds");
          v28 = v45;
          if (v44 < v15 + v19 - (v41 - v23))
          {
            v43 = v15 + v19 - (v41 - v23);
            goto LABEL_22;
          }
          if ((v27 & 0xFFFFFFF7) != 0)
            goto LABEL_22;
LABEL_33:
          -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
          goto LABEL_34;
        }
        objc_msgSend(v4, "bounds");
        if (v33 + v34 < 64.0 || v44 <= v15 - v21)
        {
          v27 &= ~4u;
          goto LABEL_20;
        }
        v43 = v15 - v21;
        goto LABEL_12;
      }
      objc_msgSend(v4, "bounds");
      v13 = v13 + v17 - (v32 - v25);
      if (v6 < v13)
      {
LABEL_12:
        v28 = v45;
        goto LABEL_22;
      }
      v31 = v27 & 0xFFFFFFFD;
    }
    v28 = v45;
    v13 = v42;
    if (!v31)
      goto LABEL_33;
LABEL_22:
    v35 = sqrt((v13 - v6) * (v13 - v6) + (v43 - v44) * (v43 - v44));
    if (objc_msgSend(v28, "count") == 1)
    {
      autoscrollFactor = v35 + v35;
      self->_autoscrollFactor = v35 + v35;
      v37 = (int)(sqrt(v35) / 5.0);
      if (v37 <= 5)
        v37 = 5;
      self->_autoscrollRamp = v37;
    }
    else
    {
      autoscrollFactor = self->_autoscrollFactor;
    }
    v38 = v35 / autoscrollFactor;
    v39 = objc_msgSend(v45, "count");
    autoscrollRamp = self->_autoscrollRamp;
    if (v39 < autoscrollRamp)
      v38 = v38 * (double)(autoscrollRamp - objc_msgSend(v45, "count") + 1);
    objc_msgSend(v4, "_setContentOffsetAnimationDuration:", v38);
    objc_msgSend(v4, "setContentOffset:animated:", 1, v13, v43);
    goto LABEL_34;
  }
LABEL_35:

}

- (BOOL)didPerformLoupeSelectionHandoff
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UITextInteraction interactionWithGestureForName:](self->_interactions, "interactionWithGestureForName:", 0x1E1778880);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "inheritedGranularity") != -1;
  else
    v4 = 0;

  return v4;
}

- (void)scheduleReplacements
{
  self->_automaticSelectionCommandsSuppressed = 0;
  -[UITextInteractionAssistant scheduleReplacementsWithOptions:](self, "scheduleReplacementsWithOptions:", 8);
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRange");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInteractionAssistant attributedTextInRange:](self, "attributedTextInRange:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UITextInteractionAssistant handleMultilingualAlternativeWithString:range:](self, "handleMultilingualAlternativeWithString:range:", v6, v7))-[UITextInteractionAssistant scheduleReplacementsForRange:withOptions:](self, "scheduleReplacementsForRange:withOptions:", v7, a3);

}

- (id)_textReplacementsMenuForElement:(id)a3
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

  v4 = a3;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInteractionAssistant generatorForRange:withOptions:](self, "generatorForRange:withOptions:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant _editMenuAssistant](self, "_editMenuAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replacements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuElementsForReplacements:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v11, v12, 0, 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)updatedTextReplacementsMenuWithMenuElements:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke;
  v5[3] = &unk_1E16E5C38;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke_2;
  v4[3] = &unk_1E16E5C60;
  _UIMenuReplacingElementMatchingPredicate(a3, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v5 = (char *)objc_msgSend(v4, "action");
  if (v5 == sel_promptForReplace_)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "canPerformAction:withSender:", objc_msgSend(v4, "action"), v4) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_11;
    }
    if ((char *)objc_msgSend(v4, "fallbackAction") != sel__promptForReplace_)
    {
      v6 = 0;
      goto LABEL_11;
    }
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "canPerformAction:withSender:", objc_msgSend(v4, "fallbackAction"), v4);

    if (v5 != sel_promptForReplace_)
      goto LABEL_12;
LABEL_11:

    goto LABEL_12;
  }
  if ((char *)objc_msgSend(v4, "fallbackAction") == sel__promptForReplace_)
    goto LABEL_10;
LABEL_4:
  v6 = 0;
LABEL_12:

  return v6;
}

id __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_textReplacementsMenuForElement:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateSelectionInViewIfNeeded:(id)a3 toRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "comparePosition:toPosition:", v8, v9))
  {

LABEL_5:
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
    -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
    objc_msgSend(v13, "setSelectedRange:", v6);
    objc_msgSend(v13, "commit");
    -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");

    goto LABEL_6;
  }
  objc_msgSend(v6, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "comparePosition:toPosition:", v10, v11);

  if (v12)
    goto LABEL_5;
LABEL_6:

}

- (void)scheduleChineseTransliteration
{
  void *v3;
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  UITextReplacementGeneratorForChineseTransliteration *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v6 = objc_msgSend(v4, "isEmpty");
    if (v6)
    {
      -[UITextInteractionAssistant rangeForTextReplacement:](self, "rangeForTextReplacement:", v4);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v7, v8);

      if (v9 == -1)
      {
        v11 = v20;
        v21 = v4;
LABEL_16:

        return;
      }

      v10 = v20;
    }
    else
    {
      v10 = v4;
    }
    v21 = v10;
    objc_msgSend(WeakRetained, "textInRange:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      if (v6)
      {
        objc_msgSend(v21, "end");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "end");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v12, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v14;
      }
      else
      {
        v15 = v21;
      }
      v21 = v15;
      -[UITextInteractionAssistant _updateSelectionInViewIfNeeded:toRange:](self, "_updateSelectionInViewIfNeeded:toRange:", WeakRetained, v15);
      v16 = objc_alloc_init(UITextReplacementGeneratorForChineseTransliteration);
      -[UITextReplacementGenerator setReplacementRange:](v16, "setReplacementRange:", v21);
      -[UITextReplacementGenerator setStringToReplace:](v16, "setStringToReplace:", v11);
      -[UITextReplacementGeneratorForChineseTransliteration replacements](v16, "replacements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "replaceText:", v19);

      }
      else
      {
        -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
        -[UITextInteractionAssistant activeSelection](self, "activeSelection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "collapseSelection");
        objc_msgSend(v18, "commit");
        -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
        -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
      }

    }
    goto LABEL_16;
  }
}

- (id)rangeForTextReplacement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  if (objc_msgSend(v4, "isEmpty"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "domRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enclosingWordRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextRangeImpl wrapDOMRange:](UITextRangeImpl, "wrapDOMRange:", v10);
    }
    else
    {
      objc_msgSend(WeakRetained, "tokenizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rangeEnclosingPosition:withGranularity:inDirection:", v10, 1, 1);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v12, v13);

      if (v14 == -1
        || (objc_msgSend(v11, "end"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v12, v15),
            v15,
            v16 == 1))
      {

        v11 = 0;
      }

    }
    v4 = v11;
  }
  return v4;
}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "attributedTextInRange:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)showMultilingualDictationReplacementWithRange:(id)a3
{
  void *v3;
  BOOL v4;

  -[UITextInteractionAssistant attributedTextInRange:](self, "attributedTextInRange:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:](UIDictationMultilingualUtilities, "hasMultilingualAttributesForAttributedString:", v3);

  return v4;
}

- (BOOL)handleMultilingualAlternativeWithString:(id)a3 range:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    +[UIDictationMultilingualUtilities multilingualAttributesForAttributedString:](UIDictationMultilingualUtilities, "multilingualAttributesForAttributedString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bestAlternatives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("multilingualResultsForAlternateRecognitions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __113__UITextInteractionAssistant_UITextInteractionAssistant_Internal__handleMultilingualAlternativeWithString_range___block_invoke;
      v16[3] = &unk_1E16E5C88;
      v17 = v9;
      v18 = v10;
      v12 = v11;
      v19 = v12;
      +[UIDictationUtilities attributedString:withIdentifiersBlock:](UIDictationUtilities, "attributedString:withIdentifiersBlock:", v6, v16);
      v13 = objc_msgSend(v12, "count");
      v14 = v13 != 0;
      if (v13)
        -[UITextInteractionAssistant scheduleDictationReplacementsForMultilingualAlternatives:range:](self, "scheduleDictationReplacementsForMultilingualAlternatives:range:", v12, v7);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __113__UITextInteractionAssistant_UITextInteractionAssistant_Internal__handleMultilingualAlternativeWithString_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIDictationMultilingualString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = -[UIDictationMultilingualString initWithDictionary:]([UIDictationMultilingualString alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        -[UIDictationMultilingualString setCorrectionIdentifier:](v10, "setCorrectionIdentifier:", v19);
        -[UIDictationMultilingualString setInteractionIdentifier:](v10, "setInteractionIdentifier:", v5);
        v11 = *(void **)(a1 + 40);
        -[UIDictationMultilingualString dominantLanguage](v10, "dominantLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "dominantLanguage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationMultilingualString dominantLanguage](v10, "dominantLanguage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(v13, "phrases");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDictationMultilingualString setPhrases:](v10, "setPhrases:", v17);

        }
        if (v10)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

- (void)scheduleDictationReplacementsForAlternatives:(id)a3 range:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  UITextReplacementGeneratorForDictation *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *, void *, void *, void *);
  void *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[3];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "alternativeStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[UITextInteractionAssistant view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textInRange:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "length"))
      {
LABEL_21:

        goto LABEL_22;
      }
      -[UITextInteractionAssistant attributedTextInRange:](self, "attributedTextInRange:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UITextInteractionAssistant handleMultilingualAlternativeWithString:range:](self, "handleMultilingualAlternativeWithString:range:", v12, v7);
      objc_msgSend(v6, "alternativeStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", 0x1E1749860);

      if (v15)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "inputDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSelectedTextRange:", v7);

        if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "showSelectionCommands");
LABEL_9:

        }
      }
      else
      {
        objc_msgSend(v6, "alternativeStrings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", 0x1E1749840);

        if (v20)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "inputDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSelectedTextRange:", v7);

          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "inputDelegateManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "deleteBackward");

          goto LABEL_9;
        }
        objc_msgSend(v6, "alternativeStrings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", 0x1E1749880);

        if (v25)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "inputDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "end");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "end");
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "alternativeStrings");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "containsObject:", 0x1E17498A0);

          if (!v31)
          {
            v52[0] = v11;
            v51[0] = CFSTR("originalText");
            v51[1] = CFSTR("alternatives");
            objc_msgSend(v6, "alternativeStrings");
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v36;
            v51[2] = CFSTR("isMultilingual");
            v38 = MEMORY[0x1E0C9AAA0];
            if (v13)
              v38 = MEMORY[0x1E0C9AAB0];
            v52[1] = v36;
            v52[2] = v38;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = MEMORY[0x1E0C809B0];
            v45 = 3221225472;
            v46 = __118__UITextInteractionAssistant_UITextInteractionAssistant_Internal__scheduleDictationReplacementsForAlternatives_range___block_invoke;
            v47 = &unk_1E16E5C88;
            v40 = v39;
            v48 = v40;
            v49 = v12;
            v41 = v6;
            v50 = v41;
            +[UIDictationUtilities attributedString:withIdentifiersBlock:](UIDictationUtilities, "attributedString:withIdentifiersBlock:", v49, &v44);
            if (!v13)
            {
              -[UITextInteractionAssistant activeSelection](self, "activeSelection", v44, v45, v46, v47, v48, v49);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
              -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
              objc_msgSend(v42, "setSelectedRange:", v7);
              objc_msgSend(v42, "commit");
              -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
              v43 = -[UITextReplacementGeneratorForDictation initWithAlternatives:stringToReplace:replacementRange:]([UITextReplacementGeneratorForDictation alloc], "initWithAlternatives:stringToReplace:replacementRange:", v41, v11, v7);
              -[_UITextInteractionEditMenuAssistant showReplacementsWithGenerator:forDictation:afterDelay:](self->_editMenuAssistant, "showReplacementsWithGenerator:forDictation:afterDelay:", v43, 1, 0.2);

            }
            goto LABEL_20;
          }
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "inputDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "start");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "start");
          v29 = objc_claimAutoreleasedReturnValue();
        }
        v32 = (void *)v29;
        objc_msgSend(v27, "textRangeFromPosition:toPosition:", v28, v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "inputDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setSelectedTextRange:", v33);

      }
LABEL_20:

      goto LABEL_21;
    }
  }
LABEL_22:

}

void __118__UITextInteractionAssistant_UITextInteractionAssistant_Internal__scheduleDictationReplacementsForAlternatives_range___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didShowAlternatives:correctionIdentifier:interactionIdentifier:instrumentationContext:dictationLanguage:", *(_QWORD *)(a1 + 32), v12, v11, v10, v9);

  objc_msgSend(*(id *)(a1 + 40), "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), 0, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 48), "alternativeStrings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("alternativesAvailableCount"));

    }
  }

}

- (void)scheduleDictationReplacementsForMultilingualAlternatives:(id)a3 range:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UITextReplacementGeneratorForMultilingualDictation *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v11, "count"))
  {
    -[UITextInteractionAssistant view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInRange:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      -[UITextInteractionAssistant activeSelection](self, "activeSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
      -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
      objc_msgSend(v9, "setSelectedRange:", v6);
      objc_msgSend(v9, "commit");
      -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
      v10 = -[UITextReplacementGeneratorForMultilingualDictation initWithMultilingualAlternatives:stringToReplace:replacementRange:]([UITextReplacementGeneratorForMultilingualDictation alloc], "initWithMultilingualAlternatives:stringToReplace:replacementRange:", v11, v8, v6);
      -[_UITextInteractionEditMenuAssistant showReplacementsWithGenerator:forDictation:afterDelay:](self->_editMenuAssistant, "showReplacementsWithGenerator:forDictation:afterDelay:", v10, 1, 0.2);

    }
  }

}

- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  UITextChecker *textChecker;
  UITextChecker *v20;
  UITextChecker *v21;
  void *v22;
  uint64_t v23;

  v6 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocorrectSpellingEnabled");

  if (v8 && v6)
  {
    v9 = objc_msgSend(v6, "isEmpty");
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (v9)
    {
      -[UITextInteractionAssistant rangeForTextReplacement:](self, "rangeForTextReplacement:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "end");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v12, v13);

        if (v14 == -1)
        {
          v15 = 0;
          v16 = v11;
          v11 = v6;
LABEL_21:

          v6 = v11;
          goto LABEL_22;
        }
      }

    }
    else
    {
      v11 = v6;
    }
    +[UITextReplacementGeneratorForCorrections generatorForTextInput:range:options:](UITextReplacementGeneratorForCorrections, "generatorForTextInput:range:options:", WeakRetained, v11, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UITextInteractionAssistant view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textInRange:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "length"))
        goto LABEL_17;
      textChecker = self->_textChecker;
      if (!textChecker)
      {
        v20 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
        v21 = self->_textChecker;
        self->_textChecker = v20;

        textChecker = self->_textChecker;
      }
      if (-[UITextChecker _doneLoading](textChecker, "_doneLoading"))
      {
        objc_msgSend(v16, "setTextChecker:", self->_textChecker);
        if ((a4 & 0x27) != 7
          || (+[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self->_textChecker, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v18, 0, objc_msgSend(v18, "length"), 0, 0, v22), v22, v15 = 0, v23 != 0x7FFFFFFFFFFFFFFFLL))
        {
          v15 = v16;
        }
      }
      else
      {
LABEL_17:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    goto LABEL_21;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (BOOL)scheduleReplacementsForRange:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEmpty");
  -[UITextInteractionAssistant generatorForRange:withOptions:](self, "generatorForRange:withOptions:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, "isStringToReplaceMisspelled") & 1) != 0
      || objc_msgSend(v9, "forceAutocorrectionGuesses"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v9, "replacementRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v11, "end");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v12, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
      -[UITextInteractionAssistant _updateSelectionInViewIfNeeded:toRange:](self, "_updateSelectionInViewIfNeeded:toRange:", WeakRetained, v11);

      v15 = 1;
      v6 = v11;
    }
    else
    {
      v15 = 0;
    }
    v16 = dbl_1866847A0[(a4 & 8) == 0];
    if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))goto LABEL_21;
    objc_msgSend(v9, "autocorrectionRecord");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17 && (v18 = (void *)v17, v19 = objc_msgSend(v9, "forceAutocorrectionGuesses"), v18, v19))
    {
      -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "autocorrectionRecord");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "showChoicesForAutocorrectionCandidate:range:delay:", v21, v6, v16);
    }
    else
    {
      v23 = objc_msgSend(v9, "forceAutocorrectionGuesses");
      -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;
      if ((v23 & 1) == 0)
      {
        v26 = objc_msgSend(v24, "showDictationChoicesForTextInRange:", v6);

        if (!v26)
        {
LABEL_20:
          -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "dismissWithoutSelection");

LABEL_21:
          -[_UITextInteractionEditMenuAssistant showReplacementsWithGenerator:forDictation:afterDelay:](self->_editMenuAssistant, "showReplacementsWithGenerator:forDictation:afterDelay:", v9, 0, v16);
          goto LABEL_22;
        }
        -[UITextInteractionAssistant activeSelection](self, "activeSelection");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSelectedRange:", v6);
        objc_msgSend(v27, "commit");

        goto LABEL_19;
      }
      objc_msgSend(v9, "replacements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "showChoicesForTextInRange:withReplacements:delay:", v6, v21, v16);
    }
    v25 = v22;

    if ((v25 & 1) == 0)
      goto LABEL_20;
LABEL_19:
    v15 = 1;
    goto LABEL_22;
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (BOOL)hasReplacements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant attributedTextInRange:](self, "attributedTextInRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:](UIDictationMultilingualUtilities, "hasMultilingualAttributesForAttributedString:", v5))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteractionAssistant generatorForRange:withOptions:](self, "generatorForRange:withOptions:", v8, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v9, "replacements", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "replacementText");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (BOOL)swallowsDoubleTapWithScale:(double)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  float v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  if (a3 != 0.0)
  {
    if (1.0 / a3 <= a3)
      a3 = 1.0 / a3;
    v7 = a3;
    if (v7 < 0.9)
      return 0;
  }
  -[UITextInteractionAssistant setFirstResponderIfNecessary](self, "setFirstResponderIfNecessary");
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alterSelection:granularity:", 1, x, y);
  objc_msgSend(v8, "commit");
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
  if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
  {
    -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
  }

  return 1;
}

- (void)layoutChangedByScrolling:(BOOL)a3
{
  -[UITextSelectionView layoutChangedByScrolling:](self->_selectionView, "layoutChangedByScrolling:", a3);
}

- (void)willStartScrollingOrZooming
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled");
  v4 = 16;
  if (v3)
    v4 = 232;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "hideSelectionCommands");
}

- (void)didEndScrollingOrZooming
{
  void *v3;
  char v4;
  void *editMenuAssistant;
  UITextSelectionView *selectionView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  CGRect v27;
  CGRect v28;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
    {
      -[UITextSelectionDisplayInteraction highlightView](self->_selectionViewManager, "highlightView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isHidden");

      if ((v4 & 1) == 0)
      {
        editMenuAssistant = self->_editMenuAssistant;
LABEL_14:
        objc_msgSend(editMenuAssistant, "showSelectionCommands");
      }
    }
  }
  else
  {
    -[UITextSelectionView deferredUpdateSelectionRects](self->_selectionView, "deferredUpdateSelectionRects");
    selectionView = self->_selectionView;
    if (!selectionView)
    {
      -[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands");
      return;
    }
    -[UITextSelectionView selection](selectionView, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UITextSelectionView selection](self->_selectionView, "selection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEmpty");

    }
    else
    {
      v11 = 1;
    }

    if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
    {
      if ((v11 & 1) == 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "inputDelegateManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "selectionClipRect");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        -[UITextSelectionView selectionBoundingBox](self->_selectionView, "selectionBoundingBox");
        v28.origin.x = v22;
        v28.origin.y = v23;
        v28.size.width = v24;
        v28.size.height = v25;
        v27.origin.x = v15;
        v27.origin.y = v17;
        v27.size.width = v19;
        v27.size.height = v21;
        v26 = CGRectIntersectsRect(v27, v28);

        if (v26)
        {
          editMenuAssistant = self->_selectionView;
          goto LABEL_14;
        }
      }
    }
  }
}

- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4
{
  -[UITextContextMenuInteraction presentMenuForInputUI:preferredArrowDirection:](self->_textContextMenuInteraction, "presentMenuForInputUI:preferredArrowDirection:", a3, a4);
}

- (BOOL)isDisplayingMenuForInputUI
{
  return -[UITextContextMenuInteraction isDisplayingMenuForInputUI](self->_textContextMenuInteraction, "isDisplayingMenuForInputUI");
}

- (BOOL)isDisplayingMenu
{
  return -[UITextContextMenuInteraction isDisplayingMenu](self->_textContextMenuInteraction, "isDisplayingMenu");
}

- (void)underlineCorrectedTextInRange:(id)a3 typedString:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlineTextInRange:revertText:", v7, v6);

}

- (void)removeTextChoiceUnderlines
{
  id v2;

  -[UITextInteractionAssistant _textChoicesAssistant](self, "_textChoicesAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllUnderlines");

}

- (BOOL)isDisplayingVerticalSelection
{
  void *v4;
  void *v5;
  char v6;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    return -[UITextSelectionDisplayInteraction _isDisplayingVerticalSelection](self->_selectionViewManager, "_isDisplayingVerticalSelection");
  }
  -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rangeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayingVerticalSelection");

  return v6;
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction textRangeAdjustmentRectForEdge:](self->_selectionViewManager, "textRangeAdjustmentRectForEdge:", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rangeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textRangeAdjustmentRectForEdge:", a3);
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;

  }
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction paddedTextRangeAdjustmentHitRegionForEdge:precision:](self->_selectionViewManager, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", a3, a4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rangeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", a3, a4);
    v8 = v17;
    v10 = v18;
    v12 = v19;
    v14 = v20;

  }
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction textRangeAdjustmentViewForEdge:](self->_selectionViewManager, "textRangeAdjustmentViewForEdge:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rangeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textRangeAdjustmentViewForEdge:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_rangeAdjustmentViewContainer
{
  void *v3;
  void *v4;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[UITextSelectionDisplayInteraction _rangeAdjustmentViewContainer](self->_selectionViewManager, "_rangeAdjustmentViewContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rangeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CGPoint)_rangeAdjustmentPointInTextInputCoordinateSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UITextInteractionAssistant _rangeAdjustmentViewContainer](self, "_rangeAdjustmentViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_proxyTextInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;

  v5 = -[UITextInteractionAssistant _selectionIsActivated](self, "_selectionIsActivated", a3, a4.x, a4.y);
  if (v5)
  {
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isRanged");

    LOBYTE(v5) = v8;
  }
  return v5;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[UITextInteractionAssistant setSelectionHighlightMode:](self, "setSelectionHighlightMode:", 0);
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", x, y);
  v9 = v8;
  v11 = v10;
  -[UITextInteractionAssistant interactions](self, "interactions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_callDelegateWillMoveTextRangeExtentAtPoint:", v9, v11);

  -[_UITextInteractionEditMenuAssistant hideSelectionCommands](self->_editMenuAssistant, "hideSelectionCommands");
  -[UITextInteractionAssistant willBeginSelectionInteraction](self, "willBeginSelectionInteraction");
  -[UITextInteractionAssistant beginSelectionChange](self, "beginSelectionChange");
  -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "baseIsStart");

  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v16, "setRangedSelectionBaseToCurrentSelectionStart");
    objc_msgSend(v16, "setRangedSelectionInitialExtentToCurrentSelectionEnd");
  }
  else
  {
    objc_msgSend(v16, "setRangedSelectionBaseToCurrentSelectionEnd");
    objc_msgSend(v16, "setRangedSelectionInitialExtentToCurrentSelectionStart");
  }
  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
  -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate](self, "setNeedsSelectionDisplayUpdate");
  -[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_didBeginRangeAdjustmentInteraction:", v7);

}

- (void)synchronizeTextRangeAdjustment
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[UITextRangeAdjustmentInteraction hasActiveTouch](self->_rangeAdjustmentInteraction, "hasActiveTouch"))
  {
    -[UITextRangeAdjustmentInteraction extentPoint](self->_rangeAdjustmentInteraction, "extentPoint");
    -[UITextInteractionAssistant _textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:](self, "_textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:", 1, v3, v4, v3, v4);
  }
  else
  {
    -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate:](self, "setNeedsSelectionDisplayUpdate:", 1);
  }
  -[UITextRangeAdjustmentInteraction extentPoint](self->_rangeAdjustmentInteraction, "extentPoint");
  v6 = v5;
  v8 = v7;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant convertPointToRenderSpace:textRange:](self, "convertPointToRenderSpace:textRange:", v10, v6, v8);
  v12 = v11;
  v14 = v13;

  -[UITextRangeAdjustmentInteraction setModelPosition:](self->_rangeAdjustmentInteraction, "setModelPosition:", v12, v14);
}

- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
  -[UITextInteractionAssistant _textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:](self, "_textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:", 0, a3.x, a3.y, a4.x, a4.y);
}

- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4 selectionChangeReason:(int64_t)a5
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  y = a4.y;
  x = a4.x;
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", a3.x, a3.y);
  v10 = v9;
  v12 = v11;
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", x, y);
  v14 = v13;
  v16 = v15;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteractionAssistant rangeAdjustmentInteraction](self, "rangeAdjustmentInteraction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRangedSelectionExtentPoint:baseIsStart:", objc_msgSend(v18, "baseIsStart"), v10, v12);

  -[UITextInteractionAssistant notifyKeyboardSelectionChanged](self, "notifyKeyboardSelectionChanged");
  -[UITextInteractionAssistant setNeedsSelectionDisplayUpdate:](self, "setNeedsSelectionDisplayUpdate:", a5);
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", v14, v16);
}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v5 = a3;
  -[UITextInteractionAssistant activeSelection](self, "activeSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "willSelectionChange");

  if (v7)
  {
    if (-[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
    {
      -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
    }
    -[UITextInteractionAssistant activeSelection](self, "activeSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commit");

    -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange");
    -[UITextInteractionAssistant didEndSelectionInteraction](self, "didEndSelectionInteraction");
  }
  else if (!-[_UITextInteractionEditMenuAssistant _editMenuIsVisibleOrDismissedRecently](self->_editMenuAssistant, "_editMenuIsVisibleOrDismissedRecently")&& -[UITextInteractionAssistant(UITextInteractionAssistant_Internal) canShowSelectionCommands](self, "canShowSelectionCommands"))
  {
    -[_UITextInteractionEditMenuAssistant showSelectionCommands](self->_editMenuAssistant, "showSelectionCommands");
  }
  -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
  -[UITextInteractionAssistant _selectionViewManager](self, "_selectionViewManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_didEndRangeAdjustmentInteraction:", v5);

}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  -[UITextInteractionAssistant endSelectionChange](self, "endSelectionChange", a3);
  -[UITextInteractionAssistant didEndSelectionInteraction](self, "didEndSelectionInteraction");
  -[UITextInteractionAssistant cancelAutoscroll](self, "cancelAutoscroll");
}

- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3
{
  return !-[UITextInteractionAssistant isDisplayingVerticalSelection](self, "isDisplayingVerticalSelection", a3);
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4
{
  return -[UITextInteractionAssistant shouldDisplayLoupeSessionForTouchType:](self, "shouldDisplayLoupeSessionForTouchType:", a4);
}

- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITextInteractionAssistant _caretView](self, "_caretView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3
{
  void *v4;
  id WeakRetained;

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled", a3))
  {
    -[UITextSelectionDisplayInteraction _rangeAdjustmentViewContainer](self->_selectionViewManager, "_rangeAdjustmentViewContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textInputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)selectionContainerViewAboveText
{
  UITextInput **p_view;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  void *v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained((id *)p_view);
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "_selectionContainerViewAboveText");
  else
    objc_msgSend(v5, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_selectionViewManager:(id)a3 obtainBlinkSuppressionAssertionForReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[UITextInteractionAssistant _assertionController](self, "_assertionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonBlinkingAssertionWithReason:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_selectionViewManager:(id)a3 obtainGhostCursorAssertionForReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[UITextInteractionAssistant _assertionController](self, "_assertionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonBlinkingGhostAssertionWithReason:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGPoint)_selectionViewManager:(id)a3 convertPointToRenderSpace:(CGPoint)a4 textRange:(id)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[UITextInteractionAssistant convertPointToRenderSpace:textRange:](self, "convertPointToRenderSpace:textRange:", a5, a4.x, a4.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4
{
  double y;
  double x;
  UITextInput **p_view;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self->_respondsToConvertPointToRenderSpace)
  {
    p_view = &self->_view;
    v7 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "_convertPointToRenderSpace:textRange:", v7, x, y);
    x = v9;
    y = v10;

  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

@end
