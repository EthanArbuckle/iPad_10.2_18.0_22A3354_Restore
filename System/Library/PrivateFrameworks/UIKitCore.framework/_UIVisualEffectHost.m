@implementation _UIVisualEffectHost

- (_UIVisualEffectViewParticipating)contentView
{
  return self->_contentView;
}

- (void)setContentViewRequired:(BOOL)a3
{
  void *v5;
  _UIVisualEffectViewParticipating *contentView;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableArray *views;
  _UIVisualEffectViewParticipating *v12;

  if (a3 && !self->_contentViewRequired)
  {
    -[_UIVisualEffectDescriptor _requestedContainerView](self->_currentEffectDescriptor, "_requestedContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      contentView = self->_contentView;
      -[_UIVisualEffectDescriptor _requestedContainerView](self->_currentEffectDescriptor, "_requestedContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContainedView:", contentView);

    }
    else if ((-[NSMutableArray containsObject:](self->_views, "containsObject:", self->_contentView) & 1) == 0)
    {
      -[_UIVisualEffectDescriptor underlays](self->_currentEffectDescriptor, "underlays");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      v10 = -[NSMutableArray count](self->_views, "count");
      views = self->_views;
      v12 = self->_contentView;
      if (v9 <= v10)
        -[NSMutableArray insertObject:atIndex:](views, "insertObject:atIndex:", v12, v9);
      else
        -[NSMutableArray addObject:](views, "addObject:", v12);
    }
  }
  self->_contentViewRequired = a3;
}

- (NSArray)views
{
  return &self->_views->super;
}

- (_UIVisualEffectHost)initWithContentView:(id)a3
{
  id v6;
  _UIVisualEffectHost *v7;
  _UIVisualEffectHost *v8;
  uint64_t v9;
  NSMutableArray *views;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectHost.m"), 27, CFSTR("Cannot construct a content host with a nil content view"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIVisualEffectHost;
  v7 = -[_UIVisualEffectHost init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentView, a3);
    v9 = objc_opt_new();
    views = v8->_views;
    v8->_views = (NSMutableArray *)v9;

  }
  return v8;
}

- (void)setPrimaryCaptureGroup:(id)a3
{
  _UIVisualEffectViewBackdropCaptureGroup *v5;
  _UIVisualEffectViewBackdropCaptureGroup *primaryCaptureGroup;
  id WeakRetained;
  _UIVisualEffectViewBackdropCaptureGroup *v8;
  _QWORD v9[5];

  v5 = (_UIVisualEffectViewBackdropCaptureGroup *)a3;
  if (self->_primaryCaptureGroup != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_primaryCaptureGroup, a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46___UIVisualEffectHost_setPrimaryCaptureGroup___block_invoke;
    v9[3] = &unk_1E16B5490;
    v9[4] = self;
    -[_UIVisualEffectHost _iterateViews:](self, "_iterateViews:", v9);
    primaryCaptureGroup = self->_primaryCaptureGroup;
    WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
    objc_msgSend(WeakRetained, "setCaptureGroup:", primaryCaptureGroup);

    v5 = v8;
  }

}

- (void)_applyRequestedDescriptorEffectInvertingView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (dyld_program_sdk_at_least())
    -[_UIVisualEffectViewParticipating setClipsToBounds:](self->_contentView, "setClipsToBounds:", -[_UIVisualEffectDescriptor contentViewRequiresClipping](self->_currentEffectDescriptor, "contentViewRequiresClipping"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  objc_msgSend(WeakRetained, "applyRequestedFilterEffects");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___UIVisualEffectHost__applyRequestedDescriptorEffectInvertingView___block_invoke;
  v7[3] = &unk_1E16B5490;
  v8 = v4;
  v6 = v4;
  -[_UIVisualEffectHost _iterateViews:](self, "_iterateViews:", v7);
  -[_UIVisualEffectHost _evaluateInPlaceFiltering](self, "_evaluateInPlaceFiltering");

}

- (void)_iterateViews:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)-[NSMutableArray copy](self->_views, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        do
        {
          v4[2](v4, v10);
          objc_msgSend(v10, "containedView");
          v11 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v11;
        }
        while (v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_evaluateInPlaceFiltering
{
  void *v3;
  void *v4;
  void *v5;
  _UIVisualEffectViewBackdropCaptureGroup *primaryCaptureGroup;
  unsigned int v7;
  _UIVisualEffectDescriptor *transitionEffectDescriptor;
  uint64_t v9;
  id v10;

  -[_UIVisualEffectViewParticipating layer](self->_contentView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v10 = v4;

  v5 = v10;
  if (v10)
  {
    primaryCaptureGroup = self->_primaryCaptureGroup;
    if (primaryCaptureGroup)
      v7 = -[_UIVisualEffectViewBackdropCaptureGroup allowInPlaceFiltering](primaryCaptureGroup, "allowInPlaceFiltering");
    else
      v7 = 1;
    transitionEffectDescriptor = self->_transitionEffectDescriptor;
    if (!transitionEffectDescriptor)
      transitionEffectDescriptor = self->_currentEffectDescriptor;
    if (transitionEffectDescriptor)
      v9 = 0;
    else
      v9 = v7;
    if (transitionEffectDescriptor && ((v7 ^ 1) & 1) == 0)
      v9 = -[_UIVisualEffectDescriptor disableInPlaceFiltering](transitionEffectDescriptor, "disableInPlaceFiltering", v9) ^ 1;
    objc_msgSend(v10, "setAllowsInPlaceFiltering:", v9);
    v5 = v10;
  }

}

- (void)setCurrentEffectDescriptor:(id)a3
{
  _UIVisualEffectDescriptor *v5;
  _UIVisualEffectDescriptor *transitionEffectDescriptor;
  void *v7;
  _UIVisualEffectDescriptor *v8;

  v5 = (_UIVisualEffectDescriptor *)a3;
  if (self->_currentEffectDescriptor != v5)
  {
    v8 = v5;
    -[_UIVisualEffectDescriptor uniqueFilterNames](v5, "uniqueFilterNames");
    transitionEffectDescriptor = self->_transitionEffectDescriptor;
    self->_transitionEffectDescriptor = 0;

    objc_storeStrong((id *)&self->_currentEffectDescriptor, a3);
    -[_UIVisualEffectHost _updateAdjustTintColors](self, "_updateAdjustTintColors");
    -[_UIVisualEffectHost _configureEffectDescriptor:](self, "_configureEffectDescriptor:", self->_currentEffectDescriptor);
    -[_UIVisualEffectDescriptor _identityContainerView](self->_currentEffectDescriptor, "_identityContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectHost _applyRequestedDescriptorEffectInvertingView:](self, "_applyRequestedDescriptorEffectInvertingView:", v7);

    v5 = v8;
  }

}

- (void)_updateAdjustTintColors
{
  _BOOL8 v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = -[_UIVisualEffectDescriptor textShouldRenderWithTintColor](self->_currentEffectDescriptor, "textShouldRenderWithTintColor");
  v4 = v3;
  if (v3 == !self->_autosetSubviewLabelTintColor)
  {
    v5 = !self->_autosetSubviewLabelTintColor || v3;
    -[_UIVisualEffectHost _updateView:shouldDrawWithTintColor:](self, "_updateView:shouldDrawWithTintColor:", self->_contentView, v5);
  }
  self->_autosetSubviewLabelTintColor = v4;
  -[_UIVisualEffectViewParticipating _setMonitorsSubtree:](self->_contentView, "_setMonitorsSubtree:", v4);
}

- (_UIVisualEffectDescriptor)currentEffectDescriptor
{
  return self->_currentEffectDescriptor;
}

- (void)_configureEffectDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _UIVisualEffectViewParticipating *v14;
  char isKindOfClass;
  void *v18;
  char v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIVisualEffectViewParticipating *v31;
  _UIVisualEffectViewParticipating *v32;
  _UIVisualEffectViewParticipating *v33;
  uint64_t v34;
  id WeakRetained;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _UIVisualEffectViewParticipating *v47;
  void *v48;
  void *v49;
  void *v50;
  _UIVisualEffectViewParticipating *v51;
  _UIVisualEffectViewParticipating *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_identityContainerView");
  v52 = (_UIVisualEffectViewParticipating *)objc_claimAutoreleasedReturnValue();
  v50 = v4;
  objc_msgSend(v4, "_requestedContainerView");
  v51 = (_UIVisualEffectViewParticipating *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = self->_views;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v62;
    v12 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_UIVisualEffectViewParticipating **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (v14 != self->_contentView && v14 != v52 && v14 != v51)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "setFilters:", v12);
          -[_UIVisualEffectViewParticipating setViewEffects:](v14, "setViewEffects:", v12);
          -[_UIVisualEffectViewParticipating setContainedView:](v14, "setContainedView:", 0);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v18 = v5;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), v19 = objc_opt_isKindOfClass(), v18 = v6, (v19 & 1) != 0)
            || (v20 = -[_UIVisualEffectViewParticipating isMemberOfClass:](v14, "isMemberOfClass:", objc_opt_class()),
                v18 = v7,
                v20))
          {
            objc_msgSend(v18, "addObject:", v14);
          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v10);
  }

  -[NSMutableArray removeAllObjects](self->_views, "removeAllObjects");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v50, "underlays");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        -[_UIVisualEffectHost _viewForEntry:fromCapturePool:imagePool:otherPool:](self, "_viewForEntry:fromCapturePool:imagePool:otherPool:", v26, v5, v6, v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setPrimaryCaptureGroup:", self->_primaryCaptureGroup);
        v67 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setViewEffects:", v28);

        -[NSMutableArray addObject:](self->_views, "addObject:", v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v23);
  }

  objc_msgSend(v50, "filterEntries");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "viewEffects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v30;
  if (objc_msgSend(v29, "count") || objc_msgSend(v30, "count") || v51 || v52)
  {
    -[_UIVisualEffectViewParticipating setFilters:](self->_contentView, "setFilters:", v29);
    -[_UIVisualEffectViewParticipating setViewEffects:](self->_contentView, "setViewEffects:", v30);
    v31 = self->_contentView;
    if (v51)
    {
      -[_UIVisualEffectViewParticipating setContainedView:](v51, "setContainedView:", v31);
      v32 = v51;

      v31 = v32;
    }
    if (v52 && v52 != v51)
    {
      -[_UIVisualEffectViewParticipating setContainedView:](v52, "setContainedView:", v31);
      v33 = v52;

      v31 = v33;
LABEL_38:
      -[NSMutableArray addObject:](self->_views, "addObject:", v31);
      goto LABEL_39;
    }
LABEL_37:
    if (!v31)
      goto LABEL_39;
    goto LABEL_38;
  }
  if (self->_contentViewRequired)
  {
    v34 = MEMORY[0x1E0C9AA60];
    -[_UIVisualEffectViewParticipating setFilters:](self->_contentView, "setFilters:", MEMORY[0x1E0C9AA60]);
    -[_UIVisualEffectViewParticipating setViewEffects:](self->_contentView, "setViewEffects:", v34);
    v31 = self->_contentView;
    goto LABEL_37;
  }
  v31 = 0;
LABEL_39:
  v47 = v31;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  v36 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCaptureGroup:", self->_primaryCaptureGroup);
    -[_UIVisualEffectHost _cloneFilters:](self, "_cloneFilters:", v29);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFilters:", v37);

  }
  v46 = v36;
  v49 = v29;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v50, "overlays");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
        -[_UIVisualEffectHost _viewForEntry:fromCapturePool:imagePool:otherPool:](self, "_viewForEntry:fromCapturePool:imagePool:otherPool:", v43, v5, v6, v7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setPrimaryCaptureGroup:", self->_primaryCaptureGroup);
        v65 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setViewEffects:", v45);

        -[NSMutableArray addObject:](self->_views, "addObject:", v44);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v40);
  }

}

- (void)monitorSubviewsOf:(id)a3
{
  objc_msgSend(a3, "setSubviewMonitor:", self);
}

- (void)_view:(id)a3 willMoveToWindow:(id)a4
{
  _BOOL8 v6;
  id v7;

  v7 = a3;
  if (a4)
    v6 = -[_UIVisualEffectDescriptor textShouldRenderWithTintColor](self->_currentEffectDescriptor, "textShouldRenderWithTintColor");
  else
    v6 = 0;
  -[_UIVisualEffectHost _updateView:shouldDrawWithTintColor:](self, "_updateView:shouldDrawWithTintColor:", v7, v6);

}

- (void)_updateView:(id)a3 shouldDrawWithTintColor:(BOOL)a4
{
  id v5;
  _UIViewBlockVisitor *v6;
  _UIViewBlockVisitor *v7;
  _QWORD v8[4];
  BOOL v9;

  v5 = a3;
  v6 = [_UIViewBlockVisitor alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___UIVisualEffectHost__updateView_shouldDrawWithTintColor___block_invoke;
  v8[3] = &__block_descriptor_33_e16_B16__0__UIView_8l;
  v9 = a4;
  v7 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v6, "initWithTraversalDirection:visitorBlock:", 2, v8);
  objc_msgSend(v5, "_receiveVisitor:", v7);

}

- (void)setCaptureView:(id)a3
{
  _UIVisualEffectBackdropView **p_captureView;
  id WeakRetained;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  p_captureView = &self->_captureView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "removeFromCurrentCaptureGroup");
      objc_msgSend(WeakRetained, "setFilters:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(WeakRetained, "setRenderMode:", 2);
    }
    objc_msgSend(obj, "setRenderMode:", 1);
    objc_msgSend(obj, "setCaptureGroup:", self->_primaryCaptureGroup);
    -[_UIVisualEffectDescriptor filterEntries](self->_currentEffectDescriptor, "filterEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectHost _cloneFilters:](self, "_cloneFilters:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setFilters:", v7);

    objc_msgSend(obj, "applyRequestedFilterEffects");
    objc_storeWeak((id *)p_captureView, obj);
  }

}

- (id)_cloneFilters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "copy", (_QWORD)v12);
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_viewForEntry:(id)a3 fromCapturePool:(id)a4 imagePool:(id)a5 otherPool:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_class *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v11, "requirements");
  switch(v15)
  {
    case 0:
      v16 = v14;
      goto LABEL_7;
    case 1:
      v16 = v13;
      goto LABEL_7;
    case 2:
      v16 = v12;
LABEL_7:
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      goto LABEL_9;
  }
  v17 = 0;
  v18 = 0;
LABEL_9:
  objc_msgSend(v17, "firstObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (id)v19;
    objc_msgSend(v17, "removeObjectAtIndex:", 0);
  }
  else if (!v18 || (v20 = objc_alloc_init(v18)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectHost.m"), 216, CFSTR("Unable to allocate a view necessary for implementing the requested effect (viewClass=%@, entry=%@)"), v22, v11);

    v20 = 0;
  }

  return v20;
}

- (_UIVisualEffectBackdropView)captureView
{
  return (_UIVisualEffectBackdropView *)objc_loadWeakRetained((id *)&self->_captureView);
}

- (_UIVisualEffectDescriptor)transitionEffectDescriptor
{
  return self->_transitionEffectDescriptor;
}

- (void)prepareToTransitionToEffectDescriptor:(id)a3
{
  _UIVisualEffectDescriptor *v5;
  _UIVisualEffectDescriptor *v6;
  _UIVisualEffectDescriptor **p_currentEffectDescriptor;
  void *v8;
  _UIVisualEffectDescriptor *v9;
  _UIVisualEffectDescriptor *transitionEffectDescriptor;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (_UIVisualEffectDescriptor *)a3;
  v6 = v5;
  p_currentEffectDescriptor = &self->_currentEffectDescriptor;
  if (self->_currentEffectDescriptor != v5)
  {
    -[_UIVisualEffectDescriptor uniqueFilterNames](v5, "uniqueFilterNames");
    if (*p_currentEffectDescriptor)
    {
      v12[0] = *p_currentEffectDescriptor;
      v12[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[_UIVisualEffectDescriptor newTransitionDescriptorForStops:](_UIVisualEffectDescriptor, "newTransitionDescriptorForStops:", v8);
      transitionEffectDescriptor = self->_transitionEffectDescriptor;
      self->_transitionEffectDescriptor = v9;

    }
    else
    {
      objc_storeStrong((id *)&self->_transitionEffectDescriptor, a3);
    }
    -[_UIVisualEffectDescriptor uniqueFilterNames](self->_transitionEffectDescriptor, "uniqueFilterNames");
    objc_storeStrong((id *)&self->_currentEffectDescriptor, a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61___UIVisualEffectHost_prepareToTransitionToEffectDescriptor___block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  }

}

- (void)beginTransition
{
  _UIVisualEffectDescriptor *transitionEffectDescriptor;
  id v4;

  transitionEffectDescriptor = self->_transitionEffectDescriptor;
  if (transitionEffectDescriptor)
  {
    -[_UIVisualEffectDescriptor _identityContainerView](transitionEffectDescriptor, "_identityContainerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectHost _applyRequestedDescriptorEffectInvertingView:](self, "_applyRequestedDescriptorEffectInvertingView:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionEffectDescriptor, 0);
  objc_storeStrong((id *)&self->_currentEffectDescriptor, 0);
  objc_destroyWeak((id *)&self->_captureView);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_views, 0);
}

- (void)_applyIdentityDescriptorEffectInvertingView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  objc_msgSend(WeakRetained, "applyIdentityFilterEffects");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___UIVisualEffectHost__applyIdentityDescriptorEffectInvertingView___block_invoke;
  v7[3] = &unk_1E16B5490;
  v8 = v4;
  v6 = v4;
  -[_UIVisualEffectHost _iterateViews:](self, "_iterateViews:", v7);
  -[_UIVisualEffectHost _evaluateInPlaceFiltering](self, "_evaluateInPlaceFiltering");

}

- (void)endTransition
{
  _UIVisualEffectDescriptor *transitionEffectDescriptor;
  _QWORD v4[5];

  transitionEffectDescriptor = self->_transitionEffectDescriptor;
  if (transitionEffectDescriptor)
  {
    self->_transitionEffectDescriptor = 0;

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36___UIVisualEffectHost_endTransition__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  }
}

- (void)_applyEffectDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v4, "underlays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        -[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", v8 + i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "applyEffectAsRequested:toView:", 1, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      v8 += i;
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v4, "viewEffects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        -[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "applyEffectAsRequested:toView:", 1, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v15);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = v4;
  objc_msgSend(v4, "filterEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v41)
  {
    v42 = 0;
    v40 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
        v22 = (void *)MEMORY[0x1E0CB3940];
        -[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "filters");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v42 + k);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "filterName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("filters.%@."), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "valueAsRequested:", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _UIVisualEffectSubviewApplyFilterValues(v29, v30, v27);

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      v42 += k;
    }
    while (v41);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v38, "overlays");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * m);
        -[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", v8 + m + 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applyEffectAsRequested:toView:", 1, v37);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      v8 += m;
    }
    while (v33);
  }

}

- (void)_view:(id)a3 willGainDescendent:(id)a4
{
  -[_UIVisualEffectHost willGainDescendent:](self, "willGainDescendent:", a4);
}

- (void)_view:(id)a3 willLoseDescendent:(id)a4
{
  -[_UIVisualEffectHost willLoseDescendent:](self, "willLoseDescendent:", a4);
}

- (void)willGainDescendent:(id)a3
{
  _UIVisualEffectDescriptor *currentEffectDescriptor;
  id v5;

  currentEffectDescriptor = self->_currentEffectDescriptor;
  v5 = a3;
  -[_UIVisualEffectHost _updateView:shouldDrawWithTintColor:](self, "_updateView:shouldDrawWithTintColor:", v5, -[_UIVisualEffectDescriptor textShouldRenderWithTintColor](currentEffectDescriptor, "textShouldRenderWithTintColor"));

}

- (void)willLoseDescendent:(id)a3
{
  -[_UIVisualEffectHost _updateView:shouldDrawWithTintColor:](self, "_updateView:shouldDrawWithTintColor:", a3, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectHost;
  -[_UIVisualEffectHost description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" contentView=%@"), self->_contentView);
  if (self->_contentViewRequired)
    objc_msgSend(v4, "appendString:", CFSTR(" contentViewRequired"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_captureView);
    objc_msgSend(v4, "appendFormat:", CFSTR(" captureView=%@"), v6);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR(" views=%@"), self->_views);
  if (self->_transitionEffectDescriptor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" transitionEffect=%@"), self->_transitionEffectDescriptor);
  objc_msgSend(v4, "appendFormat:", CFSTR(" currentEffectDescriptor=%@"), self->_currentEffectDescriptor);
  return (NSString *)v4;
}

- (BOOL)contentViewRequired
{
  return self->_contentViewRequired;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

@end
