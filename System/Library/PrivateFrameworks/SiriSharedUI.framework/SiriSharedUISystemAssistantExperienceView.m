@implementation SiriSharedUISystemAssistantExperienceView

- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 additionalContentViews:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SiriSharedUISystemAssistantExperienceView *v25;
  NSObject *v26;
  id *p_textRequestView;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *textRequestViewBottomConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  SiriSharedUIViewStackContainer *v50;
  SiriSharedUIViewStackContainerHosting *viewStackContainer;
  SiriSharedUIViewStackContainer *v52;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _QWORD v67[3];
  uint8_t buf[4];
  const char *v69;
  uint64_t v70;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v70 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v20 = a5;
  v21 = a6;
  obj = a7;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v65.receiver = self;
  v65.super_class = (Class)SiriSharedUISystemAssistantExperienceView;
  v25 = -[SiriSharedUISystemAssistantExperienceView initWithFrame:](&v65, sel_initWithFrame_, x, y, width, height);
  if (v25)
  {
    v54 = v24;
    v55 = v23;
    v56 = v22;
    v57 = v21;
    v26 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "-[SiriSharedUISystemAssistantExperienceView initWithFrame:backgroundBlurView:navigationView:smartDialogView:"
            "additionalContentViews:textRequestView:viewStackContainer:]";
      _os_log_impl(&dword_1DE0BF000, v26, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    v25->_hidesTextRequestView = 1;
    v25->_reducedOrbOpacity = 0;
    -[SiriSharedUISystemAssistantExperienceView bounds](v25, "bounds");
    objc_msgSend(v19, "setFrame:");
    objc_msgSend(v19, "setAutoresizingMask:", 18);
    v59 = v19;
    -[SiriSharedUISystemAssistantExperienceView addSubview:](v25, "addSubview:", v19);
    -[SiriSharedUISystemAssistantExperienceView bounds](v25, "bounds");
    objc_msgSend(v20, "setFrame:");
    objc_msgSend(v20, "setAutoresizingMask:", 18);
    v58 = v20;
    -[SiriSharedUISystemAssistantExperienceView addSubview:](v25, "addSubview:", v20);
    p_textRequestView = (id *)&v25->_textRequestView;
    objc_storeStrong((id *)&v25->_textRequestView, a8);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25->_textRequestView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v25->_textRequestView)
    {
      -[SiriSharedUISystemAssistantExperienceView addSubview:](v25, "addSubview:");
      -[SiriSharedUISystemAssistantExperienceView bottomAnchor](v25, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_textRequestView, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      textRequestViewBottomConstraint = v25->_textRequestViewBottomConstraint;
      v25->_textRequestViewBottomConstraint = (NSLayoutConstraint *)v30;

      v32 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*p_textRequestView, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUISystemAssistantExperienceView leadingAnchor](v25, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v35;
      v67[1] = v25->_textRequestViewBottomConstraint;
      objc_msgSend(*p_textRequestView, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUISystemAssistantExperienceView trailingAnchor](v25, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v39);

    }
    objc_storeStrong((id *)&v25->_smartDialogView, a6);
    -[SiriSharedUICompactConversationViewHosting setDelegate:](v25->_smartDialogView, "setDelegate:", v25);
    -[SiriSharedUICompactConversationViewHosting setAttachmentType:](v25->_smartDialogView, "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](v25, "_smartDialogViewAttachmentType"));
    -[SiriSharedUICompactConversationViewHosting hostingView](v25->_smartDialogView, "hostingView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentHuggingPriority(v40, (const char *)1);

    -[SiriSharedUICompactConversationViewHosting hostingView](v25->_smartDialogView, "hostingView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentCompressionResistancePriority(v41, (const char *)1);

    -[SiriSharedUICompactConversationViewHosting setUseLowerPriorityHeightConstraint:](v25->_smartDialogView, "setUseLowerPriorityHeightConstraint:", 1);
    objc_storeStrong((id *)&v25->_additionalContentViews, obj);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v42 = v25->_additionalContentViews;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v62 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v47, "setDelegate:", v25);
          objc_msgSend(v47, "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](v25, "_smartDialogViewAttachmentType"));
          objc_msgSend(v47, "hostingView");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          SiriSharedUISetContentHuggingPriority(v48, (const char *)1);

          objc_msgSend(v47, "hostingView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          SiriSharedUISetContentCompressionResistancePriority(v49, (const char *)1);

          objc_msgSend(v47, "setAttachmentYOffset:", -8.0);
        }
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v44);
    }

    v24 = v54;
    if (v54)
    {
      v50 = v54;
    }
    else
    {
      v52 = [SiriSharedUIViewStackContainer alloc];
      v50 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v52, "initWithFrame:contentViews:", MEMORY[0x1E0C9AA60], x, y, width, height);
    }
    viewStackContainer = v25->_viewStackContainer;
    v25->_viewStackContainer = (SiriSharedUIViewStackContainerHosting *)v50;
    v20 = v58;
    v19 = v59;
    v22 = v56;
    v21 = v57;
    v23 = v55;

    -[SiriSharedUISystemAssistantExperienceView _addContentViewsToViewStackContainer](v25, "_addContentViewsToViewStackContainer");
    -[SiriSharedUISystemAssistantExperienceView _updateBottomPadding](v25, "_updateBottomPadding");
    -[SiriSharedUISystemAssistantExperienceView _textRequestViewVisibilityDidChange](v25, "_textRequestViewVisibilityDidChange");
    -[SiriSharedUISystemAssistantExperienceView _setUpSuggestionsView](v25, "_setUpSuggestionsView");
  }

  return v25;
}

- (SiriSharedUISystemAssistantExperienceView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 smartDialogView:(id)a6 textRequestView:(id)a7 viewStackContainer:(id)a8
{
  return -[SiriSharedUISystemAssistantExperienceView initWithFrame:backgroundBlurView:navigationView:smartDialogView:additionalContentViews:textRequestView:viewStackContainer:](self, "initWithFrame:backgroundBlurView:navigationView:smartDialogView:additionalContentViews:textRequestView:viewStackContainer:", a4, a5, a6, MEMORY[0x1E0C9AA60], a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  -[SiriSharedUISystemAssistantExperienceView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISystemAssistantExperienceView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saeView:viewDidChangeWindow:", self, v3);

}

- (void)layoutSubviews
{
  NSObject *v3;
  void *v4;
  void *v5;
  UIView *fullScreenEffectContainerView;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SiriSharedUISystemAssistantExperienceView layoutSubviews]";
    _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUISystemAssistantExperienceView;
  -[SiriSharedUISystemAssistantExperienceView layoutSubviews](&v7, sel_layoutSubviews);
  -[SiriSharedUISystemAssistantExperienceView viewStackContainer](self, "viewStackContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUISystemAssistantExperienceView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");

  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  -[SiriSharedUISystemAssistantExperienceView bounds](self, "bounds");
  -[UIView setFrame:](fullScreenEffectContainerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = self->_additionalContentViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    LOBYTE(v10) = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v10 = v10 & (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "attachmentType") == 0);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  if (SiriSharedUIDeviceIsMac())
  {
    v12 = -[SiriSharedUICompactConversationViewHosting attachmentType](self->_smartDialogView, "attachmentType")
        ? 0
        : v10;
    if (v12 == 1)
    {
      -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sizeThatFits:", width, height);
      v15 = v14;

      -[SiriSharedUISuggestionsHostView intrinsicContentSize](self->_suggestionsView, "intrinsicContentSize");
      v17 = v16;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v18 = self->_additionalContentViews;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        v22 = 0.0;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "hostingView", (_QWORD)v33);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sizeThatFits:", width, height);
            v26 = v25;

            v22 = v22 + v26 + 8.0;
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v20);
      }
      else
      {
        v22 = 0.0;
      }

      -[SiriSharedUIViewStackContainerHosting topPadding](self->_viewStackContainer, "topPadding");
      v28 = v15 + v17 + 8.0 + v22 + v27;
      -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
      v30 = v28 + v29;
      if (v30 < height)
        height = v30;
    }
  }
  v31 = width;
  v32 = height;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)_addContentViewsToViewStackContainer
{
  SiriSharedUIViewStackContainerHosting *viewStackContainer;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SiriSharedUIViewStackContainerHosting *v10;
  void *v11;
  SiriSharedUIViewStackContainerHosting *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SiriSharedUIViewStackContainerHosting *v19;
  void *v20;
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
  viewStackContainer = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting addContentView:](viewStackContainer, "addContentView:", v4);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_additionalContentViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "hostingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting addContentView:](v10, "addContentView:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v12 = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting bringSubviewToFront:](v12, "bringSubviewToFront:", v13);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_additionalContentViews;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "hostingView", (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting bringSubviewToFront:](v19, "bringSubviewToFront:", v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  -[SiriSharedUIViewStackContainerHosting relayout](self->_viewStackContainer, "relayout");
}

- (void)_removeContentViewsFromViewStackContainer
{
  SiriSharedUIViewStackContainerHosting *viewStackContainer;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SiriSharedUIViewStackContainerHosting *v10;
  void *v11;
  NSArray *v12;
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
  viewStackContainer = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting removeContentView:](viewStackContainer, "removeContentView:", v4);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_additionalContentViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "hostingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting removeContentView:](v10, "removeContentView:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_additionalContentViews;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "relayout", (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  -[SiriSharedUICompactConversationViewHosting relayout](self->_smartDialogView, "relayout");
}

- (void)setIsInAmbient:(BOOL)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      -[SiriSharedUIViewStackContainerHosting scrollView](self->_viewStackContainer, "scrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDelegate:", self);

    }
    -[SiriSharedUISystemAssistantExperienceView _removeContentViewsFromViewStackContainer](self, "_removeContentViewsFromViewStackContainer");
    -[SiriSharedUIViewStackContainerHosting setIsInAmbient:](self->_viewStackContainer, "setIsInAmbient:", self->_isInAmbient);
    if (self->_isInAmbient)
    {
      -[SiriSharedUICompactConversationViewHosting stackConstraints](self->_smartDialogView, "stackConstraints");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHeightConstraint:", 0);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v6 = self->_additionalContentViews;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v41 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "stackConstraints");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setHeightConstraint:", 0);

          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        }
        while (v8);
      }

      -[SiriSharedUICompactConversationViewHosting setAttachmentType:](self->_smartDialogView, "setAttachmentType:", 3);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = self->_additionalContentViews;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v37 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "setAttachmentType:", 3);
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        }
        while (v14);
      }
    }
    else
    {
      -[SiriSharedUISystemAssistantExperienceView _clearAppIconView](self, "_clearAppIconView");
      -[SiriSharedUICompactConversationViewHosting stackConstraints](self->_smartDialogView, "stackConstraints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHeightConstraint:", 0);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = self->_additionalContentViews;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "stackConstraints");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setHeightConstraint:", 0);

          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        }
        while (v20);
      }

      -[SiriSharedUICompactConversationViewHosting setAttachmentType:](self->_smartDialogView, "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](self, "_smartDialogViewAttachmentType"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = self->_additionalContentViews;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v29;
        do
        {
          for (m = 0; m != v25; ++m)
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * m), "setAttachmentType:", -[SiriSharedUISystemAssistantExperienceView _smartDialogViewAttachmentType](self, "_smartDialogViewAttachmentType", (_QWORD)v28));
          }
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
        }
        while (v25);
      }
    }

    -[SiriSharedUISystemAssistantExperienceView _addContentViewsToViewStackContainer](self, "_addContentViewsToViewStackContainer");
    -[SiriSharedUISystemAssistantExperienceView _updateBottomPadding](self, "_updateBottomPadding");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbient)
  {
    self->_isInAmbientInteractivity = a3;
    -[SiriSharedUICompactConversationViewHosting relayout](self->_smartDialogView, "relayout");
  }
}

- (void)configureAmbientAppIconForBundleIdentifier:(id)a3
{
  id v4;
  UIView *v5;
  UIView *appIconView;
  void *v7;
  double v8;
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
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[SiriSharedUIUtilities applicationBundleIdentifierIsThirdParty:](SiriSharedUIUtilities, "applicationBundleIdentifierIsThirdParty:", v4)&& self->_isInAmbient)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v22, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
    appIconView = self->_appIconView;
    self->_appIconView = v5;

    -[SiriSharedUISystemAssistantExperienceView addSubview:](self, "addSubview:", self->_appIconView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_appIconView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setOpacity:", v8);

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[UIView trailingAnchor](self->_appIconView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUISystemAssistantExperienceView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -49.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    -[UIView bottomAnchor](self->_appIconView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUISystemAssistantExperienceView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -49.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    -[UIView heightAnchor](self->_appIconView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 40.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v14;
    -[UIView widthAnchor](self->_appIconView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 40.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v17);

  }
  else
  {
    -[SiriSharedUISystemAssistantExperienceView _clearAppIconView](self, "_clearAppIconView");
  }

}

- (void)_clearAppIconView
{
  UIView *appIconView;

  -[UIView removeFromSuperview](self->_appIconView, "removeFromSuperview");
  appIconView = self->_appIconView;
  self->_appIconView = 0;

}

- (int64_t)_smartDialogViewAttachmentType
{
  return 0;
}

- (void)setSmartDialogView:(id)a3
{
  objc_storeStrong((id *)&self->_smartDialogView, a3);
}

- (SiriSharedUICompactConversationViewHosting)conversationView
{
  return self->_smartDialogView;
}

- (CGSize)conversationViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SiriSharedUICompactConversationViewHosting portraitContentSize](self->_smartDialogView, "portraitContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)snippetLayoutDidUpdateForView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SiriSharedUICompactConversationViewHosting conversationSnippetViews](self->_smartDialogView, "conversationSnippetViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isHint"))
      -[SiriSharedUICompactConversationViewHosting snippetContentDidUpdateForHint](self->_smartDialogView, "snippetContentDidUpdateForHint");
    else
      -[SiriSharedUICompactConversationViewHosting snippetContentDidUpdate](self->_smartDialogView, "snippetContentDidUpdate");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_additionalContentViews;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "snippetViews", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v4);

          if (v14)
            objc_msgSend(v12, "snippetContentDidUpdate");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)setServerUtterances:(id)a3
{
  NSArray *v4;
  NSArray *serverUtterances;
  id v6;

  if (self->_serverUtterances != a3)
  {
    v6 = a3;
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    serverUtterances = self->_serverUtterances;
    self->_serverUtterances = v4;

    -[SiriSharedUICompactConversationViewHosting setServerUtterances:](self->_smartDialogView, "setServerUtterances:", v6);
  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  -[SiriSharedUICompactConversationViewHosting setSpeechRecognitionHypothesis:](self->_smartDialogView, "setSpeechRecognitionHypothesis:", a3);
}

- (void)setLatencyViewModel:(id)a3
{
  SiriSharedUILatencyViewModel *v4;
  SiriSharedUILatencyViewModel *latencyViewModel;
  id v6;

  v6 = a3;
  if (!-[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_latencyViewModel, "isEqualToViewModel:"))
  {
    v4 = (SiriSharedUILatencyViewModel *)objc_msgSend(v6, "copy");
    latencyViewModel = self->_latencyViewModel;
    self->_latencyViewModel = v4;

    -[SiriSharedUICompactConversationViewHosting setLatencyViewModel:](self->_smartDialogView, "setLatencyViewModel:", v6);
  }

}

- (void)setConversationSnippetViews:(id)a3
{
  NSArray *v4;
  NSArray *conversationSnippetViews;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_conversationSnippetViews, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    conversationSnippetViews = self->_conversationSnippetViews;
    self->_conversationSnippetViews = v4;

    -[SiriSharedUICompactConversationViewHosting setConversationSnippetViews:](self->_smartDialogView, "setConversationSnippetViews:", v6);
    -[SiriSharedUISystemAssistantExperienceView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAdditionalContentSnippetViews:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *additionalContentSnippetViews;
  NSObject *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  +[SiriSharedUITranscriptItem additionalContentViewPlatterCategories](SiriSharedUITranscriptItem, "additionalContentViewPlatterCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7)
  {
    if (!-[NSArray isEqualToArray:](self->_additionalContentSnippetViews, "isEqualToArray:", v4))
    {
      v8 = (NSArray *)objc_msgSend(v4, "copy");
      additionalContentSnippetViews = self->_additionalContentSnippetViews;
      self->_additionalContentSnippetViews = v8;

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __78__SiriSharedUISystemAssistantExperienceView_setAdditionalContentSnippetViews___block_invoke;
      v11[3] = &unk_1EA89CC08;
      v11[4] = self;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
      -[SiriSharedUISystemAssistantExperienceView _removeContentViewsFromViewStackContainer](self, "_removeContentViewsFromViewStackContainer");
      -[SiriSharedUISystemAssistantExperienceView _addContentViewsToViewStackContainer](self, "_addContentViewsToViewStackContainer");
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SiriSharedUISystemAssistantExperienceView setAdditionalContentSnippetViews:].cold.1(v10);
  }

}

void __78__SiriSharedUISystemAssistantExperienceView_setAdditionalContentSnippetViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSnippetViews:", v5);

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  -[SiriSharedUISystemAssistantExperienceView _transitionalContentViewFrames](self, "_transitionalContentViewFrames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsPoint:", x, y);

  if ((v7 & 1) != 0)
    return 1;
  if (!-[UIView isHidden](self->_textRequestView, "isHidden"))
  {
    -[UIView alpha](self->_textRequestView, "alpha");
    if (v9 > 0.0)
    {
      -[UIView frame](self->_textRequestView, "frame");
      v17.x = x;
      v17.y = y;
      if (CGRectContainsPoint(v18, v17))
        return 1;
    }
  }
  -[SiriSharedUISystemAssistantExperienceView viewStackContainer](self, "viewStackContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hostingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  v13 = v12;
  v15 = v14;
  -[SiriSharedUISystemAssistantExperienceView viewStackContainer](self, "viewStackContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v16, "hasContentAtPoint:", v13, v15);

  return (char)v10;
}

- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4
{
  self->_bottomContentInset = a3;
  -[SiriSharedUISystemAssistantExperienceView _updateBottomPaddingAnimatedWithContext:](self, "_updateBottomPaddingAnimatedWithContext:", a4);
}

- (void)setBottomContentInset:(double)a3
{
  SiriSharedUIAnimationContext *v5;

  v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v5, "setAnimationDuration:", 0.0);
  -[SiriSharedUISystemAssistantExperienceView setBottomContentInset:animatedWithContext:](self, "setBottomContentInset:animatedWithContext:", v5, a3);

}

- (BOOL)alwaysShowRecognizedSpeech
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysShowRecognizedSpeech");

  return v3;
}

- (void)prepareForUpdatesWithDiff:(unint64_t)a3 updateBlock:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SiriSharedUICompactConversationViewHosting *smartDialogView;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_additionalContentViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "prepareForUpdatesToSnippetViews:", (a3 >> 5) & 1);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  smartDialogView = self->_smartDialogView;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__SiriSharedUISystemAssistantExperienceView_prepareForUpdatesWithDiff_updateBlock___block_invoke;
  v14[3] = &unk_1EA89CC30;
  v13 = v6;
  v15 = v13;
  -[SiriSharedUICompactConversationViewHosting prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:](smartDialogView, "prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:", (a3 >> 2) & 1, (a3 >> 1) & 1, (a3 >> 3) & 1, (a3 >> 6) & 1, v14);
  if ((a3 & 0x26) != 0)
    -[SiriSharedUISystemAssistantExperienceView _hideStarterSuggestionsViewIfNeeded](self, "_hideStarterSuggestionsViewIfNeeded");

}

uint64_t __83__SiriSharedUISystemAssistantExperienceView_prepareForUpdatesWithDiff_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contentDidUpdate:(BOOL)a3
{
  if (!a3)
  {
    -[SiriSharedUICompactConversationViewHosting transitionToExpandablePlatterStyle:](self->_smartDialogView, "transitionToExpandablePlatterStyle:", 4);
    -[SiriSharedUICompactConversationViewHosting animateAppearanceIfNeeded](self->_smartDialogView, "animateAppearanceIfNeeded");
  }
}

- (void)contentDidUpdateForAdditionalContentView:(BOOL)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_additionalContentViews;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "animateAppearanceIfNeeded", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_updateExpansionConstraints:(BOOL)a3
{
  NSLayoutConstraint *conversationExpansionConstraint;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;
  void *v9;
  NSLayoutConstraint *v10;
  CGRect v11;

  conversationExpansionConstraint = self->_conversationExpansionConstraint;
  if (a3)
  {
    if (!conversationExpansionConstraint)
    {
      -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "heightAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
      v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v8 = self->_conversationExpansionConstraint;
      self->_conversationExpansionConstraint = v7;

      conversationExpansionConstraint = self->_conversationExpansionConstraint;
    }
    -[SiriSharedUICompactConversationViewHosting hostingView](self->_smartDialogView, "hostingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    -[NSLayoutConstraint setConstant:](conversationExpansionConstraint, "setConstant:", CGRectGetHeight(v11));

    v10 = self->_conversationExpansionConstraint;
    *(_QWORD *)&a3 = 1;
  }
  else
  {
    v10 = self->_conversationExpansionConstraint;
  }
  -[NSLayoutConstraint setActive:](v10, "setActive:", a3);
}

- (void)showFullScreenEffect:(id)a3
{
  id v4;
  UIView *fullScreenEffectContainerView;
  SiriSharedUIStandardView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  double MidX;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  if (!fullScreenEffectContainerView)
  {
    v6 = [SiriSharedUIStandardView alloc];
    -[SiriSharedUISystemAssistantExperienceView bounds](self, "bounds");
    v7 = -[SiriSharedUIStandardView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_fullScreenEffectContainerView;
    self->_fullScreenEffectContainerView = v7;

    -[SiriSharedUISystemAssistantExperienceView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_fullScreenEffectContainerView, 0);
    fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIView subviews](fullScreenEffectContainerView, "subviews", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "removeFromSuperview");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(v4, "prepareSoundEffect");
  v14 = objc_alloc((Class)objc_msgSend(v4, "effectViewClass"));
  -[UIView bounds](self->_fullScreenEffectContainerView, "bounds");
  v15 = (void *)objc_msgSend(v14, "initWithFrame:");
  -[UIView addSubview:](self->_fullScreenEffectContainerView, "addSubview:", v15);
  objc_msgSend(v15, "bounds");
  MidX = CGRectGetMidX(v24);
  objc_msgSend(v15, "bounds");
  v17 = CGRectGetMidY(v25) - 10.0 * 0.5;
  objc_msgSend(v15, "setFocusPoint:", MidX);
  objc_msgSend(v15, "setMessageRect:", MidX - 10.0 * 0.5, v17, 10.0, 10.0);
  objc_msgSend(v15, "startAnimation");
  objc_msgSend(v4, "playSoundEffect");

}

- (void)tapToEditRequestedFromView:(id)a3
{
  id v4;

  -[SiriSharedUISystemAssistantExperienceView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tapToEditRequestedFromView:", self);

}

- (void)conversationViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4
{
  double y;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a4.y;
  -[SiriSharedUISystemAssistantExperienceView _instrumentationManager](self, "_instrumentationManager", a3, a4.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emitUserViewRegionInteractionEventWithViewRegion:userViewInteraction:", 1, 3);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v11, "setValue:forKey:", CFSTR("ConversationView"), CFSTR("viewClass"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("contentOffset"));

  -[SiriSharedUISystemAssistantExperienceView _analytics](self, "_analytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 1456, v11);

}

- (void)conversationViewDidBeginExpandTransition:(id)a3
{
  -[SiriSharedUISystemAssistantExperienceView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 1);
}

- (void)conversationViewDidResetExpandedState:(id)a3
{
  -[SiriSharedUISystemAssistantExperienceView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 0);
}

- (void)conversationViewDidTransitionToCollapsedState:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriSharedUISystemAssistantExperienceView conversationViewDidTransitionToCollapsedState:]";
    _os_log_impl(&dword_1DE0BF000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now collapsed", (uint8_t *)&v10, 0xCu);
  }
  -[SiriSharedUISystemAssistantExperienceView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 0);
  -[SiriSharedUISystemAssistantExperienceView _instrumentationManager](self, "_instrumentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitUserViewRegionInteractionEventWithViewRegion:userViewInteraction:", 1, 2);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "setValue:forKey:", CFSTR("ConversationView"), CFSTR("viewClass"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("Collapsed"), CFSTR("expansionState"));
  -[SiriSharedUISystemAssistantExperienceView _analytics](self, "_analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1455, v6);

}

- (void)conversationViewDidTransitionToExpandedState:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriSharedUISystemAssistantExperienceView conversationViewDidTransitionToExpandedState:]";
    _os_log_impl(&dword_1DE0BF000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now expanded", (uint8_t *)&v10, 0xCu);
  }
  -[SiriSharedUISystemAssistantExperienceView _instrumentationManager](self, "_instrumentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitUserViewRegionInteractionEventWithViewRegion:userViewInteraction:", 1, 1);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "setValue:forKey:", CFSTR("ConversationView"), CFSTR("viewClass"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("Expanded"), CFSTR("expansionState"));
  -[SiriSharedUISystemAssistantExperienceView _analytics](self, "_analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1455, v6);

}

- (void)conversationView:(id)a3 didUpdateHeightDuringExpansionTransition:(double)a4 didCompleteGesture:(BOOL)a5
{
  -[NSLayoutConstraint setConstant:](self->_conversationExpansionConstraint, "setConstant:", a3, a5, a4);
}

- (double)expectedExpandedHeightForConversationView:(id)a3
{
  CGRect v4;

  -[SiriSharedUISystemAssistantExperienceView frame](self, "frame", a3);
  return CGRectGetHeight(v4) - 80.0;
}

- (void)conversationView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  SiriSharedUISystemAssistantExperienceViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "saeView:viewDidAppearForAceObject:", self, v6);

}

- (void)conversationView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  SiriSharedUISystemAssistantExperienceViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "saeView:viewDidDisappearForAceObject:", self, v6);

}

- (void)conversationViewDidUpdatePresentedContentHeight:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;

  -[SiriSharedUISystemAssistantExperienceView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "saeViewDidUpdatePresentedContentHeight:", self);

  }
}

- (id)parserSpeakableObjectProviderForConversationView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parserSpeakableObjectProviderForSAEView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)maximumHeightForConversationView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SiriSharedUISystemAssistantExperienceView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumHeightForSAEView:", self);
  v6 = v5;

  -[SiriSharedUIViewStackContainerHosting topPadding](self->_viewStackContainer, "topPadding");
  v8 = v7;
  -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
  return v6 - (v8 + v9) + -8.0;
}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
}

- (void)animateForDrillIn
{
  -[SiriSharedUICompactConversationViewHosting animateForDrillIn](self->_smartDialogView, "animateForDrillIn");
}

- (void)_setUpSuggestionsView
{
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v3;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *suggestionsViewProvider;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v5;
  UIViewController *v6;
  UIViewController *suggestionsViewController;
  SiriSharedUISuggestionsHostView *v8;
  void *v9;
  SiriSharedUISuggestionsHostView *v10;
  SiriSharedUISuggestionsHostView *suggestionsView;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (!self->_suggestionsViewProvider)
  {
    v3 = objc_alloc_init(_TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider);
    suggestionsViewProvider = self->_suggestionsViewProvider;
    self->_suggestionsViewProvider = v3;

  }
  objc_initWeak(&location, self);
  v5 = self->_suggestionsViewProvider;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __66__SiriSharedUISystemAssistantExperienceView__setUpSuggestionsView__block_invoke;
  v15 = &unk_1EA89CE68;
  objc_copyWeak(&v16, &location);
  -[SiriSharedUISuggestionsViewProvider makeSuggestionsViewWithSuggestionsResizeHandler:](v5, "makeSuggestionsViewWithSuggestionsResizeHandler:", &v12);
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v6;

  v8 = [SiriSharedUISuggestionsHostView alloc];
  -[UIViewController view](self->_suggestionsViewController, "view", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SiriSharedUISuggestionsHostView initWithSuggestionsView:](v8, "initWithSuggestionsView:", v9);
  suggestionsView = self->_suggestionsView;
  self->_suggestionsView = v10;

  -[SiriSharedUISuggestionsHostView setAttachmentType:](self->_suggestionsView, "setAttachmentType:", 1);
  -[SiriSharedUIViewStackContainerHosting addContentView:fromViewController:](self->_viewStackContainer, "addContentView:fromViewController:", self->_suggestionsView, self->_suggestionsViewController);
  -[SiriSharedUIViewStackContainerHosting relayout](self->_viewStackContainer, "relayout");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__SiriSharedUISystemAssistantExperienceView__setUpSuggestionsView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleSuggestionContentSizeUpdate");
    WeakRetained = v2;
  }

}

- (void)_handleSuggestionContentSizeUpdate
{
  -[SiriSharedUISuggestionsHostView invalidateIntrinsicContentSize](self->_suggestionsView, "invalidateIntrinsicContentSize");
}

- (void)setUpConversationStarterSuggestionsView
{
  -[SiriSharedUISystemAssistantExperienceView setUpConversationStarterSuggestionsView:](self, "setUpConversationStarterSuggestionsView:", 0);
}

- (void)setUpConversationStarterSuggestionsView:(BOOL)a3
{
  -[SiriSharedUISystemAssistantExperienceView setUpConversationStarterSuggestionsView:invocationSource:](self, "setUpConversationStarterSuggestionsView:invocationSource:", a3, 0);
}

- (void)setUpConversationStarterSuggestionsView:(BOOL)a3 invocationSource:(int64_t)a4
{
  _BOOL8 v6;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *suggestionsViewProvider;
  _BOOL8 deviceStateLocked;
  _BOOL8 isKeyboardShowing;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (self->_suggestionsViewProvider)
  {
    if (!self->_conversationStarterSuggestionsViewCreated && !self->_shouldCancelConversationStarters)
    {
      v6 = a3;
      objc_initWeak(location, self);
      suggestionsViewProvider = self->_suggestionsViewProvider;
      deviceStateLocked = self->_deviceStateLocked;
      isKeyboardShowing = self->_isKeyboardShowing;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __102__SiriSharedUISystemAssistantExperienceView_setUpConversationStarterSuggestionsView_invocationSource___block_invoke;
      v11[3] = &unk_1EA89CE90;
      objc_copyWeak(&v12, location);
      -[SiriSharedUISuggestionsViewProvider makeConversationStarterSuggestionsViewWithDeviceLocked:keyboardShowing:isVoiceTrigger:invocationSource:suggestionTapHandler:](suggestionsViewProvider, "makeConversationStarterSuggestionsViewWithDeviceLocked:keyboardShowing:isVoiceTrigger:invocationSource:suggestionTapHandler:", deviceStateLocked, isKeyboardShowing, v6, a4, v11);
      self->_conversationStarterSuggestionsViewCreated = 1;
      self->_shouldCancelConversationStarters = 0;
      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SiriSharedUISystemAssistantExperienceView setUpConversationStarterSuggestionsVie"
                                      "w:invocationSource:]";
      _os_log_impl(&dword_1DE0BF000, v10, OS_LOG_TYPE_DEFAULT, "%s #suggestions: suggestions provider is nil, can not set up starter suggestions", (uint8_t *)location, 0xCu);
    }
  }
}

void __102__SiriSharedUISystemAssistantExperienceView_setUpConversationStarterSuggestionsView_invocationSource___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 65);
    objc_msgSend(v5, "siriRequestCommittedFromSuggestion:", v6);

  }
}

- (void)setUpConversationContinuerSuggestionsView:(id)a3 currentMode:(id)a4
{
  id v6;
  id v7;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *suggestionsViewProvider;
  _BOOL8 deviceStateLocked;
  _BOOL8 isKeyboardShowing;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_suggestionsViewProvider)
  {
    if (!self->_conversationContinuerSuggestionsViewCreated && !self->_shouldCancelConversationContinuers)
    {
      objc_initWeak(location, self);
      suggestionsViewProvider = self->_suggestionsViewProvider;
      deviceStateLocked = self->_deviceStateLocked;
      isKeyboardShowing = self->_isKeyboardShowing;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __99__SiriSharedUISystemAssistantExperienceView_setUpConversationContinuerSuggestionsView_currentMode___block_invoke;
      v12[3] = &unk_1EA89CE90;
      objc_copyWeak(&v13, location);
      -[SiriSharedUISuggestionsViewProvider makeConversationContinuerSuggestionsViewWithRequestId:currentMode:deviceLocked:keyboardShowing:suggestionTapHandler:](suggestionsViewProvider, "makeConversationContinuerSuggestionsViewWithRequestId:currentMode:deviceLocked:keyboardShowing:suggestionTapHandler:", v6, v7, deviceStateLocked, isKeyboardShowing, v12);
      self->_conversationContinuerSuggestionsViewCreated = 1;
      self->_shouldCancelConversationContinuers = 0;
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SiriSharedUISystemAssistantExperienceView setUpConversationContinuerSuggestionsV"
                                      "iew:currentMode:]";
      _os_log_impl(&dword_1DE0BF000, v11, OS_LOG_TYPE_DEFAULT, "%s #suggestions: suggestions provider is nil, can not set up continuer suggestions", (uint8_t *)location, 0xCu);
    }
  }

}

void __99__SiriSharedUISystemAssistantExperienceView_setUpConversationContinuerSuggestionsView_currentMode___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 65);
    objc_msgSend(v5, "siriRequestCommittedFromSuggestion:", v6);

  }
}

- (void)cancelStarterSuggestionsViewIfNeededForUserInput
{
  self->_shouldCancelConversationStarters = 1;
  -[SiriSharedUISuggestionsViewProvider hideConversationStarterSuggestionsIfNecessary](self->_suggestionsViewProvider, "hideConversationStarterSuggestionsIfNecessary");
}

- (void)showStarterSuggestionsViewForTwoShot
{
  -[SiriSharedUISuggestionsViewProvider showConversationStarterSuggestionsForTwoShot](self->_suggestionsViewProvider, "showConversationStarterSuggestionsForTwoShot");
}

- (void)_hideStarterSuggestionsViewIfNeeded
{
  self->_shouldCancelConversationStarters = 1;
  self->_conversationStarterSuggestionsViewCreated = 0;
  -[SiriSharedUISuggestionsViewProvider setShowSuggestions:](self->_suggestionsViewProvider, "setShowSuggestions:", 0);
}

- (void)_hideContinuerSuggestionsViewIfNeeded
{
  -[SiriSharedUISuggestionsViewProvider setShowSuggestions:](self->_suggestionsViewProvider, "setShowSuggestions:", 0);
}

- (void)enableSuggestionsView:(BOOL)a3
{
  -[SiriSharedUISuggestionsViewProvider setShowSuggestions:](self->_suggestionsViewProvider, "setShowSuggestions:", a3);
}

- (void)filterSuggestionsWithText:(id)a3
{
  -[SiriSharedUISuggestionsViewProvider filterSuggestionsWithText:](self->_suggestionsViewProvider, "filterSuggestionsWithText:", a3);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  id WeakRetained;
  id v10;

  v6 = a3;
  v7 = v6;
  if (self->_isInAmbient && !a4 && self->_reducedOrbOpacity)
  {
    v10 = v6;
    v8 = SiriSharedUIIsTextInputEnabled();
    v7 = v10;
    if ((v8 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "scrollDidEndFromView:", self);

      v7 = v10;
      self->_reducedOrbOpacity = 0;
    }
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_isInAmbient && self->_reducedOrbOpacity)
  {
    v8 = v4;
    v6 = SiriSharedUIIsTextInputEnabled();
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "scrollDidEndFromView:", self);

      v5 = v8;
      self->_reducedOrbOpacity = 0;
    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_isInAmbient && !self->_reducedOrbOpacity)
  {
    v8 = v4;
    v6 = SiriSharedUIIsTextInputEnabled();
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "scrollDidBeginFromView:", self);

      v5 = v8;
      self->_reducedOrbOpacity = 1;
    }
  }

}

- (void)_textRequestViewVisibilityDidChange
{
  SiriSharedUIAnimationContext *v3;
  _QWORD v4[5];

  v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationOptions:](v3, "setAnimationOptions:", 0);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v3, "setAnimationDuration:", 0.25);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__SiriSharedUISystemAssistantExperienceView__textRequestViewVisibilityDidChange__block_invoke;
  v4[3] = &unk_1EA89CC58;
  v4[4] = self;
  -[SiriSharedUISystemAssistantExperienceView _updateBottomPaddingAnimatedWithContext:alongsideAnimations:](self, "_updateBottomPaddingAnimatedWithContext:alongsideAnimations:", v3, v4);

}

uint64_t __80__SiriSharedUISystemAssistantExperienceView__textRequestViewVisibilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hidesTextRequestView");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHidden:", v2);
  if ((_DWORD)v2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "resignFirstResponder");
  return result;
}

- (void)setHidesTextRequestView:(BOOL)a3
{
  if (self->_hidesTextRequestView != a3)
  {
    self->_hidesTextRequestView = a3;
    -[SiriSharedUISystemAssistantExperienceView _textRequestViewVisibilityDidChange](self, "_textRequestViewVisibilityDidChange");
  }
}

- (void)_snapshotContentViewFramesForTransition
{
  void *v3;
  SiriSharedUIRectSet *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_textRequestView)
  {
    v5[0] = self->_textRequestView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  v4 = -[SiriSharedUIRectSet initWithFramesForViews:inCoordinateSpace:]([SiriSharedUIRectSet alloc], "initWithFramesForViews:inCoordinateSpace:", v3, self);
  -[SiriSharedUISystemAssistantExperienceView _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", v4);

}

- (void)_clearTransitionalContentViewFrameSnapshots
{
  -[SiriSharedUISystemAssistantExperienceView _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", 0);
}

- (void)_updateBottomPaddingAnimatedWithContext:(id)a3 alongsideAnimations:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SiriSharedUIViewStackContainerHosting *viewStackContainer;
  double v15;
  void *v16;
  _QWORD v17[5];
  _QWORD aBlock[5];
  id v19;
  CGRect v20;

  v6 = a3;
  v7 = a4;
  if (self->_isInAmbient)
  {
    v8 = -[SiriSharedUISystemAssistantExperienceView hidesTextRequestView](self, "hidesTextRequestView");
    v9 = 14.0;
    if (v8)
      v9 = 0.0;
  }
  else
  {
    v9 = 14.0;
  }
  v10 = v9 + self->_bottomContentInset;
  -[NSLayoutConstraint setConstant:](self->_textRequestViewBottomConstraint, "setConstant:", v10);
  if (-[SiriSharedUISystemAssistantExperienceView hidesTextRequestView](self, "hidesTextRequestView"))
  {
    v11 = _Block_copy(v7);
    v12 = 0;
  }
  else
  {
    -[UIView frame](self->_textRequestView, "frame");
    v10 = v10 + 16.0 + CGRectGetHeight(v20);
    -[SiriSharedUISystemAssistantExperienceView _snapshotContentViewFramesForTransition](self, "_snapshotContentViewFramesForTransition");
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke;
    aBlock[3] = &unk_1EA89CC80;
    aBlock[4] = self;
    v19 = v7;
    v11 = _Block_copy(aBlock);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2;
    v17[3] = &unk_1EA89CC58;
    v17[4] = self;
    v12 = _Block_copy(v17);

  }
  viewStackContainer = self->_viewStackContainer;
  objc_msgSend(v6, "animationDuration");
  -[SiriSharedUIViewStackContainerHosting setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:](viewStackContainer, "setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:", objc_msgSend(v6, "animationOptions"), v11, v12, v10, v15);
  -[SiriSharedUISystemAssistantExperienceView delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "saeView:didChangeEffectiveBottomContentInsetAnimatedWithContext:", self, v6);

}

uint64_t __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __105__SiriSharedUISystemAssistantExperienceView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearTransitionalContentViewFrameSnapshots");
}

- (void)_updateBottomPaddingAnimatedWithContext:(id)a3
{
  -[SiriSharedUISystemAssistantExperienceView _updateBottomPaddingAnimatedWithContext:alongsideAnimations:](self, "_updateBottomPaddingAnimatedWithContext:alongsideAnimations:", a3, 0);
}

- (void)_updateBottomPadding
{
  SiriSharedUIAnimationContext *v3;

  v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v3, "setAnimationDuration:", 0.0);
  -[SiriSharedUISystemAssistantExperienceView _updateBottomPaddingAnimatedWithContext:](self, "_updateBottomPaddingAnimatedWithContext:", v3);

}

- (double)effectiveBottomContentInset
{
  double result;

  -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
  return result;
}

- (id)_instrumentationManager
{
  return (id)objc_msgSend(MEMORY[0x1E0DA7A48], "sharedManager");
}

- (id)_analytics
{
  return (id)objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
}

- (SiriSharedUIViewStackContainerHosting)viewStackContainer
{
  return self->_viewStackContainer;
}

- (SiriSharedUISystemAssistantExperienceViewDelegate)delegate
{
  return (SiriSharedUISystemAssistantExperienceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SiriSharedUIContentPlatterView)snippetView
{
  return self->_snippetView;
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (NSArray)conversationSnippetViews
{
  return self->_conversationSnippetViews;
}

- (NSArray)additionalContentSnippetViews
{
  return self->_additionalContentSnippetViews;
}

- (NSArray)additionalContentViews
{
  return self->_additionalContentViews;
}

- (BOOL)hidesTextRequestView
{
  return self->_hidesTextRequestView;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)deviceStateLocked
{
  return self->_deviceStateLocked;
}

- (void)setDeviceStateLocked:(BOOL)a3
{
  self->_deviceStateLocked = a3;
}

- (BOOL)isKeyboardShowing
{
  return self->_isKeyboardShowing;
}

- (void)setIsKeyboardShowing:(BOOL)a3
{
  self->_isKeyboardShowing = a3;
}

- (SiriSharedUIRectSet)_transitionalContentViewFrames
{
  return self->_transitionalContentViewFrames;
}

- (void)_setTransitionalContentViewFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalContentViewFrames, 0);
  objc_storeStrong((id *)&self->_additionalContentSnippetViews, 0);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewStackContainer, 0);
  objc_storeStrong((id *)&self->_fullScreenEffectContainerView, 0);
  objc_storeStrong((id *)&self->_conversationExpansionConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_suggestionsViewProvider, 0);
  objc_storeStrong((id *)&self->_additionalContentViews, 0);
  objc_storeStrong((id *)&self->_smartDialogView, 0);
}

- (void)setAdditionalContentSnippetViews:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SiriSharedUISystemAssistantExperienceView setAdditionalContentSnippetViews:]";
  _os_log_error_impl(&dword_1DE0BF000, log, OS_LOG_TYPE_ERROR, "%s #compact: attempting to set snippets incorrect number of platters; skipping and returning early.",
    (uint8_t *)&v1,
    0xCu);
}

@end
