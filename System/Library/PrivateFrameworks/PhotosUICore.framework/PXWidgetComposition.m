@implementation PXWidgetComposition

- (PXWidgetComposition)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetComposition.m"), 73, CFSTR("invalid initializer"));

  return 0;
}

- (PXWidgetComposition)initWithScrollViewController:(id)a3
{
  id v4;
  PXWidgetComposition *v5;
  PXWidgetComposition *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXWidgetComposition;
  v5 = -[PXWidgetComposition init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_scrollViewController, v4);
    objc_msgSend(v4, "registerObserver:", v6);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToHasContentAbove = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldUseEdgeToEdgeLayoutForWidget = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToLoadingPriorityForWidget = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWidgetTransitionToViewControllerWithTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidUpdateCompositionWithDefaultAnimationOptions = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPresentationEnvironment = objc_opt_respondsToSelector() & 1;
    -[PXTilingControllerComposition invalidateComposition](self, "invalidateComposition");
  }

}

- (void)setWidgets:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *widgets;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_widgets != v4)
  {
    v9 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v9, "copy");
      widgets = self->_widgets;
      self->_widgets = v7;

      -[PXWidgetComposition _invalidateElements](self, "_invalidateElements");
      v5 = v9;
    }
  }

}

- (void)setSpec:(id)a3
{
  PXWidgetCompositionSpec *v5;
  PXWidgetCompositionSpec *v6;

  v5 = (PXWidgetCompositionSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXTilingControllerComposition invalidateComposition](self, "invalidateComposition");
    -[PXWidgetComposition _invalidateElementsSpec](self, "_invalidateElementsSpec");
    v5 = v6;
  }

}

- (void)_updateElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PXWidgetComposition scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetComposition widgets](self, "widgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        +[PXWidgetCompositionElement elementWithWidget:scrollViewController:](PXWidgetCompositionElement, "elementWithWidget:scrollViewController:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10), v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  -[PXWidgetComposition _setElements:](self, "_setElements:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "prepare", (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)_setElements:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *elements;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->__elements != v4 && (-[NSArray isEqual:](v4, "isEqual:") & 1) == 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = self->__elements;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "unregisterObserver:", self);
          objc_msgSend(v11, "setDelegate:", 0);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v12 = (NSArray *)-[NSArray copy](v5, "copy");
    elements = self->__elements;
    self->__elements = v12;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->__elements;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          objc_msgSend(v19, "registerObserver:", self, (_QWORD)v20);
          objc_msgSend(v19, "setDelegate:", self);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    -[PXWidgetComposition _updateElementsSpec](self, "_updateElementsSpec");
    -[PXWidgetComposition invalidateFocusedTilingController](self, "invalidateFocusedTilingController");
    -[PXTilingControllerComposition invalidateComposition](self, "invalidateComposition");
  }

}

- (void)_updateElementsSpec
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXWidgetComposition spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSpec:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)tilingControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "contentTilingController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        objc_msgSend(v9, "headerTilingController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(v9, "footerTilingController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)invalidateFocusedTilingController
{
  -[PXWidgetComposition _setFocusedTilingController:](self, "_setFocusedTilingController:", 0);
}

- (void)_updateFocusedTilingController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PXWidgetComposition _focusedTilingController](self, "_focusedTilingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXWidgetComposition _shouldFocusOnTilingController:](self, "_shouldFocusOnTilingController:", v3))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[PXWidgetComposition _elements](self, "_elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "widget");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_opt_respondsToSelector();

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v9, "widget");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "wantsFocus");

            if ((v13 & 1) != 0)
            {
              objc_msgSend(v9, "contentTilingController");
              v20 = objc_claimAutoreleasedReturnValue();

              -[PXWidgetComposition _setFocusedTilingController:](self, "_setFocusedTilingController:", v20);
              v3 = (void *)v20;
              goto LABEL_23;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v6)
          continue;
        break;
      }
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PXWidgetComposition _elements](self, "_elements", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "contentTilingController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PXWidgetComposition _shouldFocusOnTilingController:](self, "_shouldFocusOnTilingController:", v19))
          {

            goto LABEL_22;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v16)
          continue;
        break;
      }
    }
    v19 = v3;
LABEL_22:

    -[PXWidgetComposition _setFocusedTilingController:](self, "_setFocusedTilingController:", v19);
    v3 = v19;
  }
LABEL_23:

}

- (BOOL)_shouldFocusOnTilingController:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;

  objc_msgSend(a3, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "visibleRect");
    PXRectGetCenter();
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "contentBounds");
    v11.x = v6;
    v11.y = v8;
    v9 = CGRectContainsPoint(v12, v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateComposition
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  _PXWidgetCompositionElementScanner *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  double MaxY;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double MinY;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  CGRect *v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  PXWidgetComposition *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  double v98;
  double v99;
  uint64_t v100;
  double *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char v107;
  id v108;
  uint64_t v109;
  CGFloat *v110;
  uint64_t v111;
  void *v112;
  CGFloat MinX;
  uint64_t v114;
  _QWORD v115[4];
  _QWORD v116[3];
  char v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  double *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  char v129;
  _QWORD v130[4];
  id v131;
  id location;
  uint64_t v133;
  CGRect *v134;
  uint64_t v135;
  void *v136;
  __int128 v137;
  double v138;
  uint64_t v139;
  _BYTE v140[128];
  uint64_t v141;
  CGRect v142;
  CGRect v143;

  v141 = *MEMORY[0x1E0C80C00];
  -[PXWidgetComposition spec](self, "spec");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetComposition.m"), 236, CFSTR("missing spec"));

  }
  -[PXTilingControllerComposition input](self, "input");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingControllerComposition output](self, "output");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetComposition _elements](self, "_elements");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "widgetSpec");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v74, "maximumNumberOfColumns");
  objc_msgSend(v2, "referenceSize");
  v6 = v5;
  objc_msgSend(v2, "contentInset");
  v8 = v7;
  objc_msgSend(v74, "widgetSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interWidgetSpacing");
  v11 = v10;
  v13 = v12;

  v133 = 0;
  v134 = (CGRect *)&v133;
  v135 = 0x4010000000;
  v136 = &unk_1A7E74EE7;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v137 = *MEMORY[0x1E0C9D648];
  v139 = *((_QWORD *)&v14 + 1);
  *((_QWORD *)&v137 + 1) = v8;
  v138 = v6;
  v15 = objc_alloc_init(_PXWidgetCompositionElementScanner);
  -[_PXWidgetCompositionElementScanner setElements:](v15, "setElements:", v72);
  -[_PXWidgetCompositionElementScanner setReferenceWidth:](v15, "setReferenceWidth:", v6);
  -[_PXWidgetCompositionElementScanner setInterColumnSpacing:](v15, "setInterColumnSpacing:", v11);
  -[_PXWidgetCompositionElementScanner setMaximumNumberOfColumns:](v15, "setMaximumNumberOfColumns:", v4);
  objc_initWeak(&location, self);
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __40__PXWidgetComposition_updateComposition__block_invoke;
  v130[3] = &unk_1E5129980;
  v71 = &v131;
  objc_copyWeak(&v131, &location);
  -[_PXWidgetCompositionElementScanner setWantsEdgeToEdgeLayoutBlock:](v15, "setWantsEdgeToEdgeLayoutBlock:", v130);
  v126 = 0;
  v127 = &v126;
  v128 = 0x2020000000;
  v129 = 1;
  v122 = 0;
  v123 = (double *)&v122;
  v124 = 0x2020000000;
  v125 = 0x7FF8000000000000;
  v118 = 0;
  v119 = &v118;
  v120 = 0x2020000000;
  v121 = 0;
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x2020000000;
  v117 = 0;
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x2020000000;
  v115[3] = 1;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetComposition _focusedTilingController](self, "_focusedTilingController");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "invalidateLayoutPreferredVisibleOrigin");
  while (!-[_PXWidgetCompositionElementScanner isAtEnd](v15, "isAtEnd", v71))
  {
    v109 = 0;
    v110 = (CGFloat *)&v109;
    v111 = 0x3010000000;
    v112 = &unk_1A7E74EE7;
    MinX = 0.0;
    v114 = 0;
    MinX = CGRectGetMinX(v134[1]);
    v110[5] = CGRectGetMaxY(v134[1]);
    if (CGRectGetHeight(v134[1]) > 0.0)
      v110[5] = v13 + v110[5];
    v108 = 0;
    v16 = -[_PXWidgetCompositionElementScanner scanRow:](v15, "scanRow:", &v108);
    v17 = v108;
    if (v16)
    {
      v104 = 0;
      v105 = &v104;
      v106 = 0x2020000000;
      v107 = 1;
      v100 = 0;
      v101 = (double *)&v100;
      v102 = 0x2020000000;
      v103 = 0xFFEFFFFFFFFFFFFFLL;
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __40__PXWidgetComposition_updateComposition__block_invoke_2;
      v83[3] = &unk_1E51299A8;
      v84 = v3;
      v85 = v77;
      v86 = v2;
      v18 = v76;
      v89 = &v109;
      v90 = &v126;
      v87 = v18;
      v88 = self;
      v91 = &v118;
      v92 = &v122;
      v93 = v116;
      v94 = v115;
      v95 = &v100;
      v96 = &v133;
      v97 = &v104;
      v98 = v11;
      v99 = v13;
      objc_msgSend(v17, "enumerateElementsUsingBlock:", v83);
      if (!*((_BYTE *)v105 + 24))
      {
        *((_BYTE *)v127 + 24) = 0;
        MaxY = v101[3];
        if (MaxY == -1.79769313e308)
        {
          MaxY = CGRectGetMaxY(v134[1]);
          v101[3] = MaxY;
        }
        v123[3] = MaxY;
      }

      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(&v104, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetComposition.m"), 403, CFSTR("couldn't scan all widgets"));

    }
    _Block_object_dispose(&v109, 8);
  }
  if (*((_BYTE *)v119 + 24))
  {
    objc_msgSend(v77, "distanceBetweenFooterBaselineAndBottom");
  }
  else
  {
    objc_msgSend(v77, "distanceBetweenFooterlessWidgetContentBottomAndBottom");
    v23 = v22;
    objc_msgSend(v77, "contentGuideInsets");
    v21 = v23 - v24;
  }
  v134[1].size.height = v21 + v134[1].size.height;
  objc_msgSend(v2, "tilingControllersRequestingFocus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWidgetComposition _setFocusedTilingController:](self, "_setFocusedTilingController:", v26);

  }
  -[PXWidgetComposition _focusedTilingController](self, "_focusedTilingController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = *((double *)off_1E50B8580 + 1);
  if (v27)
  {
    objc_msgSend(v76, "objectForKey:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      v30 = v27;
    else
      v30 = 0;
    v31 = v30;

    if (v29)
    {
      objc_msgSend(v76, "objectForKey:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "CGPointValue");

      objc_msgSend(v2, "originForTilingController:", v27);
      PXPointSubtract();
      v28 = v33;
    }

  }
  if (PXPointIsNull())
  {
    -[PXWidgetComposition _lastContentAdjustmentOffset](self, "_lastContentAdjustmentOffset");
    v28 = v34;
  }
  -[PXWidgetComposition scrollViewController](self, "scrollViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constrainedVisibleRect");
  PXEdgeInsetsInsetRect();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v142.origin.x = v37;
  v142.origin.y = v39;
  v142.size.width = v41;
  v142.size.height = v43;
  v44 = CGRectGetMaxY(v142);
  v45 = v44 - CGRectGetMaxY(v134[1]);
  if (v28 >= v45)
    v46 = v28;
  else
    v46 = v45;
  v143.origin.x = v37;
  v143.origin.y = v39;
  v143.size.width = v41;
  v143.size.height = v43;
  MinY = CGRectGetMinY(v143);
  v48 = MinY - CGRectGetMinY(v134[1]);
  if (v46 >= v48)
    v49 = v48;
  else
    v49 = v46;
  if (*MEMORY[0x1E0C9D538] != 0.0 || v49 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    -[PXWidgetComposition tilingControllers](self, "tilingControllers");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v140, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v80 != v52)
            objc_enumerationMutation(v50);
          v54 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
          objc_msgSend(v2, "originForTilingController:", v54);
          PXPointAdd();
          objc_msgSend(v3, "setOrigin:forTilingController:", v54);
        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v140, 16);
      }
      while (v51);
    }

    PXPointAdd();
    v55 = v134;
    v134[1].origin.x = v56;
    v55[1].origin.y = v57;
  }
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = objc_alloc_init((Class)off_1E50B4788);
  objc_msgSend(v66, "setAxis:", 4);
  objc_msgSend(v3, "setContentBounds:scrollBounds:scrollInfo:", v66, v134[1].origin.x, v134[1].origin.y, v134[1].size.width, v134[1].size.height, v59, v61, v63, v65);
  -[PXWidgetComposition _setDidLayoutWidgets:](self, "_setDidLayoutWidgets:", 1);
  -[PXWidgetComposition _setLastContentAdjustmentOffset:](self, "_setLastContentAdjustmentOffset:", 0.0, v49);
  if (self->_delegateFlags.respondsToDidUpdateCompositionWithDefaultAnimationOptions)
  {
    objc_msgSend(v2, "invalidationContexts");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXTilingControllerCompositionInvalidationContext defaultAnimationOptionsForTilingController:withInvalidationContexts:](PXTilingControllerCompositionInvalidationContext, "defaultAnimationOptionsForTilingController:withInvalidationContexts:", 0, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWidgetComposition delegate](self, "delegate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "widgetComposition:didUpdateCompositionWithDefaultAnimationOptions:", self, v68);

  }
  _Block_object_dispose(v115, 8);
  _Block_object_dispose(v116, 8);
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v126, 8);
  objc_destroyWeak(v71);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v133, 8);
}

- (BOOL)_shouldUseEdgeToEdgeLayoutForWidget:(id)a3
{
  PXWidgetComposition *v3;
  id v4;
  void *v5;

  if (!self->_delegateFlags.respondsToShouldUseEdgeToEdgeLayoutForWidget)
    return 0;
  v3 = self;
  v4 = a3;
  -[PXWidgetComposition delegate](v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "widgetComposition:shouldUseEdgeToEdgeLayoutForWidget:", v3, v4);

  return (char)v3;
}

- (int64_t)_loadingPriorityForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (!self->_delegateFlags.respondsToLoadingPriorityForWidget)
    return 0;
  v4 = a3;
  -[PXWidgetComposition delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "widgetComposition:loadingPriorityForWidget:", self, v6);
  return v7;
}

- (void)setMinimumWidgetLoadingPriority:(int64_t)a3
{
  _QWORD v3[6];

  if (self->_minimumWidgetLoadingPriority != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PXWidgetComposition_setMinimumWidgetLoadingPriority___block_invoke;
    v3[3] = &unk_1E5144EB8;
    v3[4] = self;
    v3[5] = a3;
    -[PXWidgetComposition performWidgetLoadingChange:](self, "performWidgetLoadingChange:", v3);
  }
}

- (void)setShouldLoadVisibleWidgets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_shouldLoadVisibleWidgets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__PXWidgetComposition_setShouldLoadVisibleWidgets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXWidgetComposition performWidgetLoadingChange:](self, "performWidgetLoadingChange:", v3);
  }
}

- (void)setShouldLoadAllWidgets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_shouldLoadAllWidgets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__PXWidgetComposition_setShouldLoadAllWidgets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXWidgetComposition performWidgetLoadingChange:](self, "performWidgetLoadingChange:", v3);
  }
}

- (void)setShouldUnloadAllWidgets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_shouldUnloadAllWidgets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__PXWidgetComposition_setShouldUnloadAllWidgets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXWidgetComposition performWidgetLoadingChange:](self, "performWidgetLoadingChange:", v3);
  }
}

- (void)_setDidLayoutWidgets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->__didLayoutWidgets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __44__PXWidgetComposition__setDidLayoutWidgets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXWidgetComposition performWidgetLoadingChange:](self, "performWidgetLoadingChange:", v3);
  }
}

- (void)performWidgetLoadingChange:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingWidgetLoadingChange;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingWidgetLoadingChange = self->_isPerformingWidgetLoadingChange;
  self->_isPerformingWidgetLoadingChange = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingWidgetLoadingChange = isPerformingWidgetLoadingChange;
  if (!isPerformingWidgetLoadingChange)
  {
    -[PXWidgetComposition _updateWidgetLoadingIfNeeded](self, "_updateWidgetLoadingIfNeeded");
    v4 = v6;
  }

}

- (void)_setNeedsUpdateWidgetLoading
{
  id v4;

  if (!self->_isPerformingWidgetLoadingChange)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetComposition.m"), 553, CFSTR("not inside performWidgetLoadingChange:"));

  }
}

- (void)_invalidateElementsToLoad
{
  self->_needsUpdateFlags.elementsToLoad = 1;
  -[PXWidgetComposition _setNeedsUpdateWidgetLoading](self, "_setNeedsUpdateWidgetLoading");
}

- (void)_updateElementsToLoadIfNeeded
{
  BOOL v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _BOOL4 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t i;
  int64_t v36;
  NSObject *v37;
  __int128 v38;
  void *v39;
  BOOL v40;
  int v41;
  char v42;
  int64_t v43;
  id obj;
  unsigned int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  PXWidgetComposition *v55;
  __int16 v56;
  int v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;

  v60 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.elementsToLoad)
  {
    self->_needsUpdateFlags.elementsToLoad = 0;
    v3 = -[PXWidgetComposition shouldLoadAllWidgets](self, "shouldLoadAllWidgets");
    v4 = -[PXWidgetComposition shouldLoadVisibleWidgets](self, "shouldLoadVisibleWidgets");
    LODWORD(v5) = -[PXWidgetComposition shouldUnloadAllWidgets](self, "shouldUnloadAllWidgets");
    -[PXWidgetComposition scrollViewController](self, "scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = -[PXWidgetComposition _didLayoutWidgets](self, "_didLayoutWidgets");
    +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[PXWidgetComposition minimumWidgetLoadingPriority](self, "minimumWidgetLoadingPriority");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[PXWidgetComposition _elements](self, "_elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v51;
      v41 = v4 && v15;
      v45 = v5 ^ 1;
      *(_QWORD *)&v17 = 134218240;
      v38 = v17;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      v42 = v5;
      v40 = v3;
      do
      {
        v21 = 0;
        v22 = v43;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v21);
          if ((v5 & 1) != 0)
            goto LABEL_31;
          if (v3)
            goto LABEL_30;
          if (v41)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v21), "contentTilingController");
            v5 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v5, "targetLayout");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "contentBounds");
            objc_msgSend(v39, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v24, "coordinateSpaceIdentifier"), objc_msgSend((id)v5, "contentCoordinateSpaceIdentifier"), v25, v26, v27, v28);
            v62.origin.x = v8;
            v62.origin.y = v10;
            v62.size.width = v12;
            v62.size.height = v14;
            v29 = CGRectIntersectsRect(v61, v62);

            v22 = v43;
            LOBYTE(v5) = v42;
            if (v29)
            {
LABEL_30:
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v20 = v22;
                if (v22 >= 1)
                {
                  v48 = 0u;
                  v49 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  -[PXWidgetComposition _elements](self, "_elements");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                  if (v31)
                  {
                    v32 = v31;
                    v33 = 0;
                    v34 = *(_QWORD *)v47;
                    do
                    {
                      for (i = 0; i != v32; ++i)
                      {
                        if (*(_QWORD *)v47 != v34)
                          objc_enumerationMutation(v30);
                        v36 = -[PXWidgetComposition _loadingPriorityForElement:](self, "_loadingPriorityForElement:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), v38);
                        if (v33 <= v36)
                          v33 = v36;
                      }
                      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                    }
                    while (v32);
                  }
                  else
                  {
                    v33 = 0;
                  }

                  PLRelatedGetLog();
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v38;
                    v55 = self;
                    v56 = 1024;
                    v57 = v33;
                    _os_log_impl(&dword_1A6789000, v37, OS_LOG_TYPE_DEBUG, "[PXWidgetComposition: %p] maximumAvailablePriority=%i", buf, 0x12u);
                  }

                  v22 = v43;
                  if (v43 >= v33)
                    v20 = v33;
                  else
                    v20 = v43;
                  v3 = v40;
                  LOBYTE(v5) = v42;
                }
              }
              if (-[PXWidgetComposition _loadingPriorityForElement:](self, "_loadingPriorityForElement:", v23, v38) >= v20)
LABEL_31:
                objc_msgSend(v23, "setShouldLoadWidgetContent:", v45, v38);
            }
          }
          ++v21;
        }
        while (v21 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v18);
    }

  }
}

- (id)widgetAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x1E0C80C00];
  +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "contentTilingController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "targetLayout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentBounds");
        objc_msgSend(v6, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v13, "coordinateSpaceIdentifier"), objc_msgSend(v12, "contentCoordinateSpaceIdentifier"), v14, v15, v16, v17);
        v25.x = x;
        v25.y = y;
        if (CGRectContainsPoint(v26, v25))
        {
          objc_msgSend(v11, "widget");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (CGRect)frameForWidget:(id)a3
{
  id v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[PXWidgetComposition _elements](self, "_elements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v14, "widget");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          objc_msgSend(v14, "contentTilingController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = __38__PXWidgetComposition_frameForWidget___block_invoke(v16);
          v44 = v18;
          v45 = v17;
          v42 = v20;
          v43 = v19;

          objc_msgSend(v14, "headerTilingController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = __38__PXWidgetComposition_frameForWidget___block_invoke(v21);
          v40 = v23;
          v41 = v22;
          v38 = v25;
          v39 = v24;

          objc_msgSend(v14, "footerTilingController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = __38__PXWidgetComposition_frameForWidget___block_invoke(v26);
          v29 = v28;
          v31 = v30;
          v33 = v32;

          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          v57.origin.y = v44;
          v57.origin.x = v45;
          v57.size.height = v42;
          v57.size.width = v43;
          v53 = CGRectUnion(v52, v57);
          v58.origin.y = v40;
          v58.origin.x = v41;
          v58.size.height = v38;
          v58.size.width = v39;
          v54 = CGRectUnion(v53, v58);
          v59.origin.x = v27;
          v59.origin.y = v29;
          v59.size.width = v31;
          v59.size.height = v33;
          v55 = CGRectUnion(v54, v59);
          x = v55.origin.x;
          y = v55.origin.y;
          width = v55.size.width;
          height = v55.size.height;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (id)headerTilingControllerForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "widget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          objc_msgSend(v9, "headerTilingController");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)footerTilingControllerForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "widget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          objc_msgSend(v9, "footerTilingController");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)invalidatePreferredContentHeightForAllWidgets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXWidgetComposition _elements](self, "_elements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "widget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetPreferredContentHeightForWidthDidChange:", v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)elementNeedsLayout:(id)a3 preferredAnimationOptions:(id)a4 originatingTilingController:(id)a5
{
  id v7;
  id v8;
  PXTilingControllerCompositionInvalidationContext *v9;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(PXTilingControllerCompositionInvalidationContext);
  -[PXTilingControllerCompositionInvalidationContext setAnimationOptions:](v9, "setAnimationOptions:", v8);

  -[PXTilingControllerCompositionInvalidationContext setOriginatingTilingController:](v9, "setOriginatingTilingController:", v7);
  -[PXTilingControllerComposition invalidateCompositionWithContext:](self, "invalidateCompositionWithContext:", v9);

}

- (void)elementHasLoadedContentDataDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PXWidgetComposition delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "widget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetComposition:widgetHasLoadedContentDataDidChange:", self, v5);

  }
}

- (id)elementViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXWidgetComposition delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "widgetComposition:viewControllerHostingWidget:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)element:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  if (!self->_delegateFlags.respondsToWidgetTransitionToViewControllerWithTransitionType)
    return 0;
  v8 = a4;
  v9 = a3;
  -[PXWidgetComposition delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v10, "widgetComposition:widget:transitionToViewController:withTransitionType:", self, v11, v8, a5);
  return a5;
}

- (BOOL)element:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  uint64_t v4;
  void *v6;

  if (!self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated)
    return 0;
  v4 = a4;
  -[PXWidgetComposition delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "widgetComposition:requestViewControllerDismissalAnimated:", self, v4);

  return v4;
}

- (id)presentationEnvironmentForElement:(id)a3
{
  void *v4;
  void *v5;

  if (self->_delegateFlags.respondsToPresentationEnvironment)
  {
    -[PXWidgetComposition delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationEnvironmentForWidgetComposition:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)elementUndoManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXWidgetComposition delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "widgetComposition:undoManagerForWidget:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)_elements
{
  return self->__elements;
}

- (PXScrollViewController)scrollViewController
{
  return (PXScrollViewController *)objc_loadWeakRetained((id *)&self->_scrollViewController);
}

- (PXWidgetCompositionDelegate)delegate
{
  return (PXWidgetCompositionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (PXWidgetCompositionSpec)spec
{
  return self->_spec;
}

- (int64_t)minimumWidgetLoadingPriority
{
  return self->_minimumWidgetLoadingPriority;
}

- (BOOL)shouldLoadVisibleWidgets
{
  return self->_shouldLoadVisibleWidgets;
}

- (BOOL)shouldLoadAllWidgets
{
  return self->_shouldLoadAllWidgets;
}

- (BOOL)shouldUnloadAllWidgets
{
  return self->_shouldUnloadAllWidgets;
}

- (PXTilingController)_focusedTilingController
{
  return self->__focusedTilingController;
}

- (void)_setFocusedTilingController:(id)a3
{
  objc_storeStrong((id *)&self->__focusedTilingController, a3);
}

- (BOOL)_didLayoutWidgets
{
  return self->__didLayoutWidgets;
}

- (CGPoint)_lastContentAdjustmentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__lastContentAdjustmentOffset.x;
  y = self->__lastContentAdjustmentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setLastContentAdjustmentOffset:(CGPoint)a3
{
  self->__lastContentAdjustmentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__focusedTilingController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_storeStrong((id *)&self->__elements, 0);
}

double __38__PXWidgetComposition_frameForWidget___block_invoke(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGRect v23;

  if (!a1)
    return *MEMORY[0x1E0C9D628];
  v1 = a1;
  objc_msgSend(v1, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[PXTilingCoordinateSpaceConverter defaultConverter](PXTilingCoordinateSpaceConverter, "defaultConverter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v2, "coordinateSpaceIdentifier");
  v13 = objc_msgSend(v1, "contentCoordinateSpaceIdentifier");

  objc_msgSend(v11, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v12, v13, v4, v6, v8, v10);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v23.origin.x = v15;
  v23.origin.y = v17;
  v23.size.width = v19;
  v23.size.height = v21;
  if (CGRectIsEmpty(v23))
    v15 = *MEMORY[0x1E0C9D628];

  return v15;
}

uint64_t __44__PXWidgetComposition__setDidLayoutWidgets___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElementsToLoad");
}

uint64_t __49__PXWidgetComposition_setShouldUnloadAllWidgets___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 67) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElementsToLoad");
}

uint64_t __47__PXWidgetComposition_setShouldLoadAllWidgets___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 66) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElementsToLoad");
}

uint64_t __51__PXWidgetComposition_setShouldLoadVisibleWidgets___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElementsToLoad");
}

uint64_t __55__PXWidgetComposition_setMinimumWidgetLoadingPriority___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElementsToLoad");
}

uint64_t __40__PXWidgetComposition_updateComposition__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(WeakRetained, "_shouldUseEdgeToEdgeLayoutForWidget:", v5);
  return v6;
}

void __40__PXWidgetComposition_updateComposition__block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  void *v7;
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
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  _BYTE *v35;
  void *v36;
  int v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double MaxY;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  double v116;
  id v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v117 = a2;
  objc_msgSend(v117, "headerTilingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(double *)off_1E50B8020;
  v9 = *((double *)off_1E50B8020 + 1);
  v10 = *((double *)off_1E50B8020 + 2);
  v11 = *((double *)off_1E50B8020 + 3);
  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:contentInset:forTilingController:", v7, a3, 0.0, *(double *)off_1E50B8020, v9, v10, v11);
  objc_msgSend(v117, "contentTilingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentGuideInsets");
  objc_msgSend(v13, "setReferenceSize:contentInset:forTilingController:", v12, a3, a4, v14, v15, v16, v17);
  objc_msgSend(v117, "footerTilingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:contentInset:forTilingController:", v18, a3, 0.0, v8, v9, v10, v11);
  objc_msgSend(v117, "widget");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(v19, "contentLayoutStyle");
  else
    v20 = 0;
  objc_msgSend(*(id *)(a1 + 48), "preferredOriginForTilingController:", v12);
  v22 = v21;
  v24 = v23;
  if ((PXPointIsNull() & 1) == 0)
  {
    v25 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, v12);

  }
  objc_msgSend(*(id *)(a1 + 48), "contentBoundsForTilingController:", v7);
  x = v118.origin.x;
  y = v118.origin.y;
  width = v118.size.width;
  height = v118.size.height;
  v31 = CGRectGetHeight(v118);
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v34 = *(double *)(v32 + 32);
  v33 = *(double *)(v32 + 40);
  if (v31 > 0.0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v35 = *(_BYTE **)(a1 + 64);
      if (v35[56])
      {
        objc_msgSend(v35, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "widgetCompositionHasContentAbove:", *(_QWORD *)(a1 + 64));

        if (v37)
        {
          v38 = *(void **)(a1 + 40);
LABEL_14:
          objc_msgSend(v38, "distanceBetweenFooterlessWidgetContentBottomAndNextHeaderBaseline");
          goto LABEL_15;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "distanceBetweenTopAndFirstHeaderBaseline");
    }
    else
    {
      v33 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      v38 = *(void **)(a1 + 40);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        goto LABEL_14;
      objc_msgSend(v38, "distanceBetweenFooteredWidgetContentBottomAndNextHeaderBaseline");
    }
LABEL_15:
    v40 = v33 + v39;
    objc_msgSend(*(id *)(a1 + 40), "distanceBetweenHeaderTopAndHeaderBaseline");
    v33 = v40 - v41;
  }
  objc_msgSend(*(id *)(a1 + 32), "setOrigin:forTilingController:", v7, v34, v33);
  objc_msgSend(*(id *)(a1 + 48), "convertRect:fromTilingController:", v7, x, y, width, height);
  v104 = v43;
  v106 = v42;
  v100 = v45;
  v102 = v44;
  if (v31 > 0.0)
  {
    CGRectGetMaxY(*(CGRect *)&v42);
    objc_msgSend(*(id *)(a1 + 40), "distanceBetweenHeaderBaselineAndHeaderBottom");
    objc_msgSend(*(id *)(a1 + 40), "distanceBetweenHeaderBaselineAndWidgetContentTop");
    goto LABEL_20;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_19;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "distanceBetweenFooteredWidgetContentBottomAndNextHeaderlessWidgetContentTop");
    }
    else if (v20 != 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop");
      if (v20 == 1 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) != 1)
LABEL_19:
        objc_msgSend(*(id *)(a1 + 40), "distanceBetweenTopAndHeaderlessWidgetContentTop", v100, v102, v104, v106);
    }
  }
LABEL_20:
  v116 = v31;
  objc_msgSend(*(id *)(a1 + 40), "contentGuideInsets", v100, v102, v104, v106);
  objc_msgSend(*(id *)(a1 + 48), "contentBoundsForTilingController:", v12);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v54 = *(void **)(a1 + 32);
  PXPointSubtract();
  objc_msgSend(v54, "setOrigin:forTilingController:", v12);
  objc_msgSend(v117, "setWidgetContentSize:", v51, v53);
  objc_msgSend(*(id *)(a1 + 48), "convertRect:fromTilingController:", v12, v47, v49, v51, v53);
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;
  objc_msgSend(*(id *)(a1 + 40), "contentGuideInsets");
  PXEdgeInsetsInsetRect();
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v111 = v58;
  v112 = v56;
  v119.origin.x = v56;
  v119.origin.y = v58;
  v119.size.width = v60;
  v119.size.height = v62;
  v109 = v62;
  v110 = v60;
  v114 = v68;
  v115 = CGRectGetHeight(v119);
  v113 = v64;
  if (v115 <= 0.0)
  {
    v72 = v66;
    v74 = v70;
  }
  else
  {
    v71 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
    v120.origin.x = v64;
    v120.size.width = v68;
    v72 = v66;
    v120.origin.y = v66;
    v120.size.height = v70;
    MaxY = CGRectGetMaxY(v120);
    if (v71 >= MaxY)
      MaxY = v71;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = MaxY;
    v74 = v70;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "extraSpaceNeededAtContentBottom");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = v75
                                                                   + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8)
                                                                               + 24);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "contentBoundsForTilingController:", v18);
  v76 = v121.origin.x;
  v77 = v121.origin.y;
  v78 = v121.size.width;
  v79 = v121.size.height;
  v80 = CGRectGetHeight(v121);
  v81 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
  v122.origin.x = v113;
  v122.size.width = v114;
  v122.origin.y = v72;
  v122.size.height = v74;
  v82 = CGRectGetMaxY(v122);
  if (v80 <= 0.0)
  {
    v89 = v111;
    v88 = v112;
    v123.origin.x = v112;
    v123.origin.y = v111;
    v123.size.height = v109;
    v123.size.width = v110;
    v87 = CGRectGetMaxY(v123);
  }
  else
  {
    v83 = v82;
    objc_msgSend(*(id *)(a1 + 40), "distanceBetweenWidgetContentBottomAndFooterBaseline");
    v85 = v84;
    objc_msgSend(*(id *)(a1 + 40), "distanceBetweenFooterTopAndFooterBaseline");
    v87 = v83 + v85 - v86;
    v89 = v111;
    v88 = v112;
  }
  objc_msgSend(*(id *)(a1 + 32), "setOrigin:forTilingController:", v18, v81, v87);
  objc_msgSend(*(id *)(a1 + 48), "convertRect:fromTilingController:", v18, v76, v77, v78, v79);
  if (v116 > 0.0 || v115 > 0.0 || v80 > 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v80 > 0.0;
    if (v80 <= 0.0)
    {
      v94 = v108;
      v93 = v109;
      v92 = v110;
      if (v115 <= 0.0)
      {
        v89 = v105;
        v88 = v107;
        v93 = v101;
        v92 = v103;
      }
    }
    else
    {
      v88 = v90;
      v89 = v91;
      v94 = v108;
    }
    v95 = v88;
    v96 = v89;
    v97 = CGRectGetMaxY(*(CGRect *)(&v92 - 2));
    v98 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v99 = v97 - *(double *)(v98 + 40);
    if (*(double *)(v98 + 56) >= v99)
      v99 = *(double *)(v98 + 56);
    *(double *)(v98 + 56) = v99;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v94
                                                                + *(double *)(a1 + 144)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 32);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v20;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = objc_msgSend(v19, "wantsNoSpaceAfterContentBottom");

}

@end
