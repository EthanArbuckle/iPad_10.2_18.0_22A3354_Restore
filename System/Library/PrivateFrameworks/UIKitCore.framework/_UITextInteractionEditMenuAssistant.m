@implementation _UITextInteractionEditMenuAssistant

- (void)hideSelectionCommands
{
  -[_UITextInteractionEditMenuAssistant _hideSelectionCommandsWithReason:](self, "_hideSelectionCommandsWithReason:", 0);
}

- (void)_hideSelectionCommandsWithReason:(int64_t)a3
{
  id v5;

  -[_UITextInteractionEditMenuAssistant cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
  -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSelectionCommandsWithReason:", a3);

}

- (void)cancelDelayedCommandRequests
{
  NSTimer *delayedEditMenuTimer;

  -[NSTimer invalidate](self->_delayedEditMenuTimer, "invalidate");
  delayedEditMenuTimer = self->_delayedEditMenuTimer;
  self->_delayedEditMenuTimer = 0;

}

- (UITextContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)setMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_menuInteraction, a3);
}

- (_UITextInteractionEditMenuAssistant)initWithInteractionAssistant:(id)a3
{
  id v4;
  _UITextInteractionEditMenuAssistant *v5;
  _UITextInteractionEditMenuAssistant *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextInteractionEditMenuAssistant;
  v5 = -[_UITextInteractionEditMenuAssistant init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactionAssistant, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__didReceiveSelectionWillScrollNotification_, CFSTR("UITextSelectionWillScroll"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__didReceiveSelectionDidScrollNotification_, CFSTR("UITextSelectionDidScroll"), 0);

  }
  return v6;
}

- (void)_didReceiveSelectionWillScrollNotification:(id)a3
{
  BOOL v4;

  if (-[_UITextInteractionEditMenuAssistant _isAffectedByScrollNotification:](self, "_isAffectedByScrollNotification:", a3))
  {
    v4 = self->_wasShowingEditMenuBeforeScroll
      || -[_UITextInteractionEditMenuAssistant _editMenuIsVisible](self, "_editMenuIsVisible");
    self->_wasShowingEditMenuBeforeScroll = v4;
    -[_UITextInteractionEditMenuAssistant hideSelectionCommands](self, "hideSelectionCommands");
  }
}

- (void)_didReceiveSelectionDidScrollNotification:(id)a3
{
  void *v4;

  if (-[_UITextInteractionEditMenuAssistant _isAffectedByScrollNotification:](self, "_isAffectedByScrollNotification:", a3))
  {
    -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateVisibleMenuPosition");

    if (self->_wasShowingEditMenuBeforeScroll)
    {
      -[_UITextInteractionEditMenuAssistant showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", 0.1);
      self->_wasShowingEditMenuBeforeScroll = 0;
    }
  }
}

- (BOOL)_isAffectedByScrollNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textInputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "containsView:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return (UITextInteractionAssistant *)objc_loadWeakRetained((id *)&self->_interactionAssistant);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMenu, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
  objc_destroyWeak((id *)&self->_interactionAssistant);
  objc_storeStrong((id *)&self->_interactionAssistantViewRespondsShouldShowEditMenu, 0);
  objc_storeStrong((id *)&self->_delayedEditMenuTimer, 0);
}

- (UIView)_selectionView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled");
  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_selectionViewManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highlightView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "_legacySelectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIView *)v7;
}

- (id)_selectionViewCoordinateSpace
{
  void *v2;
  void *v3;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_textViewCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_screenCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_windowCoordinateSpace
{
  void *v2;
  void *v3;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[_UITextInteractionEditMenuAssistant menuElementsForReplacements:](self, "menuElementsForReplacements:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITextInteractionEditMenuAssistant _presentEditMenuWithPreferredDirection:replacements:overrideMenu:](self, "_presentEditMenuWithPreferredDirection:replacements:overrideMenu:", a3, v6, v8);
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 overrideMenu:(id)a4
{
  -[_UITextInteractionEditMenuAssistant _presentEditMenuWithPreferredDirection:replacements:overrideMenu:](self, "_presentEditMenuWithPreferredDirection:replacements:overrideMenu:", a3, 0, a4);
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4 overrideMenu:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSNumber *interactionAssistantViewRespondsShouldShowEditMenu;
  NSNumber *v15;
  NSNumber *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a4;
  v9 = a5;
  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    interactionAssistantViewRespondsShouldShowEditMenu = self->_interactionAssistantViewRespondsShouldShowEditMenu;
    if (!interactionAssistantViewRespondsShouldShowEditMenu && v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_opt_respondsToSelector() & 1);
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v16 = self->_interactionAssistantViewRespondsShouldShowEditMenu;
      self->_interactionAssistantViewRespondsShouldShowEditMenu = v15;

      interactionAssistantViewRespondsShouldShowEditMenu = self->_interactionAssistantViewRespondsShouldShowEditMenu;
    }
    if (!interactionAssistantViewRespondsShouldShowEditMenu
      || !-[NSNumber BOOLValue](interactionAssistantViewRespondsShouldShowEditMenu, "BOOLValue")
      || !v13
      || objc_msgSend(v13, "_shouldShowEditMenu"))
    {
      -[_UITextInteractionEditMenuAssistant _editMenuRawTargetRect](self, "_editMenuRawTargetRect");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[_UITextInteractionEditMenuAssistant _clippedTargetRect:](self, "_clippedTargetRect:");
      v33.origin.x = v25;
      v33.origin.y = v26;
      v33.size.width = v27;
      v33.size.height = v28;
      v32.origin.x = v18;
      v32.origin.y = v20;
      v32.size.width = v22;
      v32.size.height = v24;
      if (CGRectIntersectsRect(v32, v33))
      {
        objc_storeStrong((id *)&self->_replacements, a4);
        objc_storeStrong((id *)&self->_overrideMenu, a5);
        -[_UITextInteractionEditMenuAssistant _editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:](self, "_editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:", a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "presentSelectionCommandsWithConfiguration:", v29);

      }
    }

  }
}

- (id)_editMenuConfigurationForCurrentSelectionWithPreferredArrowDirection:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int64_t v19;
  void *v20;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextInteractionEditMenuAssistant _editMenuTargetRect](self, "_editMenuTargetRect");
  v8 = v7 + v6 * 0.5;
  v11 = v10 + v9 * 0.5;
  -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v13, v8, v11);
  v15 = v14;
  v17 = v16;

  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0x1E1778720, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set_ignoresPassthroughInView:", 1);
  objc_msgSend(v18, "set_prefersMenuPresentationInView:", -[_UITextInteractionEditMenuAssistant _editMenuPrefersPresentationInView](self, "_editMenuPrefersPresentationInView"));
  if ((unint64_t)(a3 - 1) >= 4)
    v19 = 0;
  else
    v19 = a3;
  objc_msgSend(v18, "setPreferredArrowDirection:", v19);
  -[_UITextInteractionEditMenuAssistant _editMenuSourceWindow](self, "_editMenuSourceWindow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set_overrideSourceWindow:", v20);

  return v18;
}

- (CGRect)selectionBoundingBox
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_isRanged");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "selectionRects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant selectionBoundingBoxForRects:](self, "selectionBoundingBoxForRects:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)selectionBoundingBoxForRects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BYTE v42[32];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;
  CGRect v53;
  CGRect v54;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)v42 = *MEMORY[0x1E0C9D648];
  *(_QWORD *)&v42[8] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  *(_QWORD *)&v42[16] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_QWORD *)&v42[24] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v44;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v21), "rect", *(_QWORD *)v42, *(_QWORD *)&v42[8], *(_QWORD *)&v42[16], *(_QWORD *)&v42[24], (_QWORD)v43);
        x = v49.origin.x;
        y = v49.origin.y;
        width = v49.size.width;
        height = v49.size.height;
        v53.origin.x = v9;
        v53.origin.y = v11;
        v53.size.width = v13;
        v53.size.height = v15;
        v50 = CGRectIntersection(v49, v53);
        if (!CGRectIsNull(v50))
        {
          -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "textInputView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "convertRect:toCoordinateSpace:", v29, x, y, width, height);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;

          if (v19)
          {
            v54.origin.x = v31;
            v54.origin.y = v33;
            v54.size.width = v35;
            v54.size.height = v37;
            v51 = CGRectUnion(*(CGRect *)v42, v54);
            v31 = v51.origin.x;
            v33 = v51.origin.y;
            v35 = v51.size.width;
            v37 = v51.size.height;
          }
          ++v19;
          *(CGFloat *)&v42[16] = v35;
          *(CGFloat *)&v42[24] = v37;
          *(CGFloat *)v42 = v31;
          *(CGFloat *)&v42[8] = v33;
        }
        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v18);
  }

  v38 = *(double *)v42;
  v39 = *(double *)&v42[8];
  v40 = *(double *)&v42[16];
  v41 = *(double *)&v42[24];
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)_clippedTargetRect:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect result;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    goto LABEL_29;
  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textInputView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v22, v12, v14, v16, v18);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v130.origin.x = v24;
  v130.origin.y = v26;
  v130.size.width = v28;
  v130.size.height = v30;
  v141.origin.x = x;
  v141.origin.y = y;
  v141.size.width = width;
  v141.size.height = height;
  v131 = CGRectIntersection(v130, v141);
  v31 = v131.origin.x;
  v32 = v131.origin.y;
  v33 = v131.size.width;
  v34 = v131.size.height;
  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_scroller");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36
    && (objc_msgSend(v36, "traitCollection"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = objc_msgSend(v37, "userInterfaceIdiom"),
        v37,
        v38 == 6))
  {
    -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(v36, "coordinateSpace");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "convertRect:fromCoordinateSpace:", v48, v41, v43, v45, v47);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;

    -[_UITextInteractionEditMenuAssistant _expandClippingArea:forIdiom:](self, "_expandClippingArea:forIdiom:", 6, v50, v52, v54, v56);
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;
  }
  else
  {
    -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "_screen");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bounds");
    v68 = v67;
    v70 = v69;
    v72 = v71;
    v74 = v73;

    -[_UITextInteractionEditMenuAssistant _windowCoordinateSpace](self, "_windowCoordinateSpace");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant _screenCoordinateSpace](self, "_screenCoordinateSpace");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "convertRect:fromCoordinateSpace:", v76, v68, v70, v72, v74);
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;

    -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant _windowCoordinateSpace](self, "_windowCoordinateSpace");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "convertRect:fromCoordinateSpace:", v86, v78, v80, v82, v84);
    v58 = v87;
    v60 = v88;
    v62 = v89;
    v64 = v90;

  }
  v132.origin.x = v58;
  v132.origin.y = v60;
  v132.size.width = v62;
  v132.size.height = v64;
  v142.origin.x = v31;
  v142.origin.y = v32;
  v142.size.width = v33;
  v142.size.height = v34;
  if (CGRectIntersectsRect(v132, v142))
    goto LABEL_17;
  v91 = v58 + v62;
  if (v58 + v62 < v31 + 10.0)
  {
    v92 = -10.0;
LABEL_11:
    v31 = v91 + v92;
    goto LABEL_12;
  }
  if (v31 + v33 < v58 + 10.0)
  {
    v91 = v58 - v33;
    v92 = 10.0;
    goto LABEL_11;
  }
LABEL_12:
  v93 = v60 + v64;
  if (v60 + v64 < v32 + 10.0)
  {
    v94 = -10.0;
LABEL_16:
    v32 = v93 + v94;
    goto LABEL_17;
  }
  if (v32 + v34 < v60 + 10.0)
  {
    v93 = v60 - v34;
    v94 = 10.0;
    goto LABEL_16;
  }
LABEL_17:
  v133.origin.x = v58;
  v133.origin.y = v60;
  v133.size.width = v62;
  v133.size.height = v64;
  v143.origin.x = v31;
  v143.origin.y = v32;
  v143.size.width = v33;
  v143.size.height = v34;
  v134 = CGRectIntersection(v133, v143);
  x = v134.origin.x;
  y = v134.origin.y;
  width = v134.size.width;
  height = v134.size.height;
  if (v36)
  {
    -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    objc_msgSend(v95, "convertRect:fromCoordinateSpace:", v36);
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v103 = v102;

    objc_msgSend(v36, "traitCollection");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant _expandClippingArea:forIdiom:](self, "_expandClippingArea:forIdiom:", objc_msgSend(v104, "userInterfaceIdiom"), v97, v99, v101, v103);
    v106 = v105;
    v108 = v107;
    v110 = v109;
    v112 = v111;

    v135.origin.x = v106;
    v135.origin.y = v108;
    v135.size.width = v110;
    v135.size.height = v112;
    v144.origin.x = x;
    v144.origin.y = y;
    v144.size.width = width;
    v144.size.height = height;
    v136 = CGRectIntersection(v135, v144);
    v113 = v136.origin.x;
    v114 = v136.origin.y;
    v115 = v136.size.width;
    v116 = v136.size.height;
    if (CGRectIsEmpty(v136))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else if (v116 >= height)
    {
      x = v113;
      y = v114;
      width = v115;
      height = v116;
    }
    else
    {
      if (height >= 40.0)
      {
        -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "view");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v118, "isEditing");

        if (v119)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "subtractKeyboardFrameFromRect:inView:", v121, v113, v114, v115, v116);
          v113 = v122;
          v114 = v123;
          v115 = v124;
          v116 = v125;

        }
        v139.origin.x = v113;
        v139.origin.y = v114;
        v139.size.width = v115;
        v139.size.height = v116;
        v138 = CGRectInset(v139, 0.0, -10.0);
      }
      else
      {
        v137.origin.x = v113;
        v137.origin.y = v114;
        v137.size.width = v115;
        v137.size.height = v116;
        v145.origin.x = x;
        v145.origin.y = y;
        v145.size.width = width;
        v145.size.height = height;
        v138 = CGRectUnion(v137, v145);
      }
      x = v138.origin.x;
      y = v138.origin.y;
      width = v138.size.width;
      height = v138.size.height;
    }
  }

LABEL_29:
  v126 = x;
  v127 = y;
  v128 = width;
  v129 = height;
  result.size.height = v129;
  result.size.width = v128;
  result.origin.y = v127;
  result.origin.x = v126;
  return result;
}

- (UIWindow)_editMenuSourceWindow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isRemoteKeyboardWindow");

  if (v6)
  {
    objc_msgSend(v2, "window");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return (UIWindow *)v4;
}

- (CGRect)_editMenuRawTargetRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEmpty");

  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "caretRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textInputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant _selectionViewCoordinateSpace](self, "_selectionViewCoordinateSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, v8, v10, v12, v14);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    -[_UITextInteractionEditMenuAssistant selectionBoundingBox](self, "selectionBoundingBox");
    v20 = v27;
    v22 = v28;
    v24 = v29;
    v26 = v30;
  }

  v31 = v20;
  v32 = v22;
  v33 = v24;
  v34 = v26;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (NSArray)_preferredLayoutRectsForEditMenu
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_selectionViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preferredLayoutRectsForEditMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (CGRect)_editMenuTargetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UITextInteractionEditMenuAssistant _editMenuRawTargetRect](self, "_editMenuRawTargetRect");
  -[_UITextInteractionEditMenuAssistant _clippedTargetRect:](self, "_clippedTargetRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_editMenuIsVisibleOrDismissedRecently
{
  return -[_UITextInteractionEditMenuAssistant _editMenuIsVisible](self, "_editMenuIsVisible")
      || -[_UITextInteractionEditMenuAssistant _editMenuDismissedRecently](self, "_editMenuDismissedRecently");
}

- (BOOL)_editMenuIsVisible
{
  void *v2;
  char v3;

  -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisplayingMenuForSelectionCommands");

  return v3;
}

- (BOOL)_editMenuDismissedRecently
{
  void *v2;
  char v3;

  -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissedRecently");

  return v3;
}

- (BOOL)_editMenuDismissedByActionSelection
{
  void *v2;
  char v3;

  -[_UITextInteractionEditMenuAssistant menuInteraction](self, "menuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dismissedByActionSelection");

  return v3;
}

- (BOOL)_editMenuPrefersPresentationInView
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITextInteractionEditMenuAssistant _selectionView](self, "_selectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 6;

  return v4;
}

- (BOOL)_hasTextReplacements
{
  void *v2;
  BOOL v3;

  -[_UITextInteractionEditMenuAssistant replacements](self, "replacements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)menuElementsForReplacements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "menuTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __67___UITextInteractionEditMenuAssistant_menuElementsForReplacements___block_invoke;
        v15[3] = &unk_1E16B2C10;
        v15[4] = v10;
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "_isNoReplacementsFoundItem"))
          objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 1);
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4
{
  id v6;

  v6 = a4;
  if (-[_UITextInteractionEditMenuAssistant _editMenuIsVisible](self, "_editMenuIsVisible"))
    -[_UITextInteractionEditMenuAssistant _presentEditMenuWithPreferredDirection:replacements:](self, "_presentEditMenuWithPreferredDirection:replacements:", a3, v6);

  return 1;
}

- (void)showSelectionCommandsAfterDelay:(double)a3
{
  NSArray *replacements;
  UIMenu *overrideMenu;

  replacements = self->_replacements;
  self->_replacements = 0;

  overrideMenu = self->_overrideMenu;
  self->_overrideMenu = 0;

  -[_UITextInteractionEditMenuAssistant showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", a3);
}

- (void)showCommandsWithReplacements:(id)a3
{
  -[_UITextInteractionEditMenuAssistant _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", a3, 0, 0.0);
}

- (void)showSelectionCommands
{
  -[_UITextInteractionEditMenuAssistant _showSelectionCommandsForContextMenu:](self, "_showSelectionCommandsForContextMenu:", 0);
}

- (void)showCalloutBarAfterDelay:(double)a3
{
  UITextInteractionAssistant **p_interactionAssistant;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  p_interactionAssistant = &self->_interactionAssistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  objc_msgSend(WeakRetained, "_editMenuAssistant");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "_editMenuDismissedRecently")
    || objc_msgSend(v10, "_editMenuDismissedByActionSelection"))
  {
    -[_UITextInteractionEditMenuAssistant cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
    -[_UITextInteractionEditMenuAssistant replacements](self, "replacements");
    v7 = objc_claimAutoreleasedReturnValue();
    -[_UITextInteractionEditMenuAssistant _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", v7, 0, a3);

    -[_UITextInteractionEditMenuAssistant replacements](self, "replacements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "count") != 0;

    v9 = objc_loadWeakRetained((id *)p_interactionAssistant);
    objc_msgSend(v9, "setSelectionHighlightMode:", (2 * v7));

  }
}

- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4
{
  id v6;

  objc_msgSend(a3, "replacements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    -[_UITextInteractionEditMenuAssistant _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", v6, 0, a4);

}

- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL4 v6;
  id v8;
  char v9;
  uint64_t v10;
  int v11;
  id WeakRetained;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  _UITextInteractionEditMenuAssistant *v24;
  id v25;

  v6 = a4;
  v8 = a3;
  -[_UITextInteractionEditMenuAssistant cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
  if (v6)
  {
    v9 = 0;
    v10 = 3;
  }
  else
  {
    v11 = objc_msgSend(v8, "isStringToReplaceMisspelled");
    v9 = v11;
    if (v11)
      v10 = 2;
    else
      v10 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  objc_msgSend(WeakRetained, "setSelectionHighlightMode:", v10);

  if ((v9 & 1) != 0 || v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("UIKeyboardPredictionsAvailable"), 0);

  }
  v14 = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  v15 = objc_msgSend(v14, "viewConformsToAsynchronousInteractionProtocol");

  if (v15)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __93___UITextInteractionEditMenuAssistant_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke;
    v23 = &unk_1E16BB0D8;
    v24 = self;
    v25 = v8;
    v16 = _Block_copy(&v20);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", v20, v21, v22, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "taskQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "scheduleTask:timeInterval:repeats:", v16, 0, a5);

  }
  else
  {
    -[_UITextInteractionEditMenuAssistant calculateReplacementsWithGenerator:andShowAfterDelay:](self, "calculateReplacementsWithGenerator:andShowAfterDelay:", v8, a5);
  }

}

- (void)_showSelectionCommandsForContextMenu:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionAssistant);
  objc_msgSend(WeakRetained, "activeSelectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCommitting");

  if (v8)
  {
    -[_UITextInteractionEditMenuAssistant showCommandsWithReplacements:](self, "showCommandsWithReplacements:", 0);
  }
  else if (v3)
  {
    -[_UITextInteractionEditMenuAssistant _showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:](self, "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", 0, 1, 0, 0);
  }
  else
  {
    -[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateDisplayedSelection");

    -[_UITextInteractionEditMenuAssistant _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", 0, 0, 0.0);
  }
}

- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  id v8;
  id v9;
  void *v10;
  NSTimer *v11;
  NSTimer *delayedEditMenuTimer;
  _QWORD aBlock[5];
  id v14;
  BOOL v15;

  v8 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke;
  aBlock[3] = &unk_1E16C2A30;
  aBlock[4] = self;
  v14 = v8;
  v15 = a4;
  v9 = v8;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, a5);
  v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  delayedEditMenuTimer = self->_delayedEditMenuTimer;
  self->_delayedEditMenuTimer = v11;

}

- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v7 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a4
    || (-[_UITextInteractionEditMenuAssistant interactionAssistant](self, "interactionAssistant"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "shouldSuppressSelectionCommands"),
        v11,
        (v12 & 1) == 0))
  {
    -[_UITextInteractionEditMenuAssistant cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
    if (-[_UITextInteractionEditMenuAssistant _editMenuIsVisible](self, "_editMenuIsVisible"))
    {
      if (!-[_UITextInteractionEditMenuAssistant _updateEditMenuPositionForPreferredArrowDirection:replacements:](self, "_updateEditMenuPositionForPreferredArrowDirection:replacements:", a6, v10))-[_UITextInteractionEditMenuAssistant hideSelectionCommands](self, "hideSelectionCommands");
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasMarkedText");

      if ((v14 & 1) == 0)
      {
        v15 = objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_146);
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isPredictionViewControllerVisible");

        if (v7 && v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "userInterfaceIdiom");

          if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          {
            v20 = objc_msgSend(v10, "count") ? v17 : 0;
            if (v20 == 1)
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "autocorrectionController");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 0u;
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v23 = v10;
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v32;
                do
                {
                  for (i = 0; i != v25; ++i)
                  {
                    if (*(_QWORD *)v32 != v26)
                      objc_enumerationMutation(v23);
                    +[UITextReplacementCandidate textReplacementCandidateForTextReplacement:](UITextReplacementCandidate, "textReplacementCandidateForTextReplacement:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addObject:", v28);

                  }
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
                }
                while (v25);
              }

              objc_msgSend(MEMORY[0x1E0DBDB48], "listWithAutocorrection:predictions:", 0, v22);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setAutocorrectionList:", v29);

            }
          }
        }
        -[_UITextInteractionEditMenuAssistant _presentEditMenuWithPreferredDirection:replacements:](self, "_presentEditMenuWithPreferredDirection:replacements:", a6, v10);
      }
    }
  }

}

- (NSArray)replacements
{
  return self->_replacements;
}

- (UIMenu)overrideMenu
{
  return self->_overrideMenu;
}

@end
