@implementation SiriSharedUICompactView

- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 additionalContentViews:(id)a8 textRequestView:(id)a9 viewStackContainer:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SiriSharedUICompactView *v27;
  NSObject *v28;
  id *p_textRequestView;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *textRequestViewBottomConstraint;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  id *p_resultView;
  void *v54;
  void *v55;
  void *v56;
  SiriSharedUIViewStackContainerHosting *v57;
  SiriSharedUIViewStackContainerHosting *viewStackContainer;
  SiriSharedUIViewStackContainer *v59;
  uint64_t v60;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id obj;
  id v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  _QWORD v77[3];
  uint8_t buf[4];
  const char *v79;
  uint64_t v80;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v80 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  v21 = a5;
  v69 = a6;
  v22 = a6;
  obj = a7;
  v23 = a7;
  v68 = a8;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v75.receiver = self;
  v75.super_class = (Class)SiriSharedUICompactView;
  v27 = -[SiriSharedUICompactView initWithFrame:](&v75, sel_initWithFrame_, x, y, width, height);
  if (v27)
  {
    v70 = v26;
    v62 = v25;
    v63 = v24;
    v64 = v23;
    v65 = v22;
    v28 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[SiriSharedUICompactView initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additi"
            "onalContentViews:textRequestView:viewStackContainer:]";
      _os_log_impl(&dword_1DE0BF000, v28, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    v27->_hidesTextRequestView = 1;
    v27->_reducedOrbOpacity = 0;
    -[SiriSharedUICompactView bounds](v27, "bounds");
    objc_msgSend(v20, "setFrame:");
    objc_msgSend(v20, "setAutoresizingMask:", 18);
    -[SiriSharedUICompactView addSubview:](v27, "addSubview:", v20);
    -[SiriSharedUICompactView bounds](v27, "bounds");
    objc_msgSend(v21, "setFrame:");
    objc_msgSend(v21, "setAutoresizingMask:", 18);
    v66 = v21;
    -[SiriSharedUICompactView addSubview:](v27, "addSubview:", v21);
    p_textRequestView = (id *)&v27->_textRequestView;
    objc_storeStrong((id *)&v27->_textRequestView, a9);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v27->_textRequestView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v27->_textRequestView)
    {
      -[SiriSharedUICompactView addSubview:](v27, "addSubview:");
      -[SiriSharedUICompactView bottomAnchor](v27, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_textRequestView, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = objc_claimAutoreleasedReturnValue();
      textRequestViewBottomConstraint = v27->_textRequestViewBottomConstraint;
      v27->_textRequestViewBottomConstraint = (NSLayoutConstraint *)v32;

      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*p_textRequestView, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUICompactView leadingAnchor](v27, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v37;
      v77[1] = v27->_textRequestViewBottomConstraint;
      objc_msgSend(*p_textRequestView, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriSharedUICompactView trailingAnchor](v27, "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
      v41 = v20;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activateConstraints:", v42);

      v20 = v41;
    }
    objc_storeStrong((id *)&v27->_conversationView, obj);
    -[SiriSharedUICompactConversationViewHosting setDelegate:](v27->_conversationView, "setDelegate:", v27);
    -[SiriSharedUICompactConversationViewHosting setAttachmentType:](v27->_conversationView, "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](v27, "_conversationViewAttachmentType"));
    -[SiriSharedUICompactConversationViewHosting hostingView](v27->_conversationView, "hostingView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentHuggingPriority(v43, (const char *)1);

    -[SiriSharedUICompactConversationViewHosting hostingView](v27->_conversationView, "hostingView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentCompressionResistancePriority(v44, (const char *)1);

    -[SiriSharedUICompactConversationViewHosting setUseLowerPriorityHeightConstraint:](v27->_conversationView, "setUseLowerPriorityHeightConstraint:", 1);
    objc_storeStrong((id *)&v27->_additionalContentViews, v68);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v45 = v27->_additionalContentViews;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v72 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v50, "setDelegate:", v27);
          objc_msgSend(v50, "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](v27, "_conversationViewAttachmentType"));
          objc_msgSend(v50, "hostingView");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          SiriSharedUISetContentHuggingPriority(v51, (const char *)1);

          objc_msgSend(v50, "hostingView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          SiriSharedUISetContentCompressionResistancePriority(v52, (const char *)1);

          objc_msgSend(v50, "setAttachmentYOffset:", -8.0);
        }
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v47);
    }

    p_resultView = (id *)&v27->_resultView;
    objc_storeStrong((id *)&v27->_resultView, v69);
    -[SiriSharedUICompactResultViewHosting hostingView](v27->_resultView, "hostingView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    if (SiriSharedUIDeviceIsMac())
      objc_msgSend(*p_resultView, "setAttachmentYOffset:", 8.0);
    objc_msgSend(*p_resultView, "setDelegate:", v27);
    objc_msgSend(*p_resultView, "hostingView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentHuggingPriority(v55, (const char *)1);

    objc_msgSend(*p_resultView, "hostingView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    SiriSharedUISetContentCompressionResistancePriority(v56, (const char *)1);

    objc_msgSend(*p_resultView, "setAttachmentType:", -[SiriSharedUICompactView _resultViewAttachmentType](v27, "_resultViewAttachmentType"));
    -[SiriSharedUICompactView _configureResultViewCustomConstraints](v27, "_configureResultViewCustomConstraints");
    v21 = v66;
    v24 = v63;
    v23 = v64;
    v25 = v62;
    v26 = v70;
    if (v70)
    {
      v57 = v70;
      viewStackContainer = v27->_viewStackContainer;
      v27->_viewStackContainer = v57;
      v26 = v70;
    }
    else
    {
      v59 = [SiriSharedUIViewStackContainer alloc];
      v60 = -[SiriSharedUIViewStackContainer initWithFrame:contentViews:](v59, "initWithFrame:contentViews:", MEMORY[0x1E0C9AA60], x, y, width, height);
      viewStackContainer = v27->_viewStackContainer;
      v27->_viewStackContainer = (SiriSharedUIViewStackContainerHosting *)v60;
    }
    v22 = v65;

    -[SiriSharedUICompactView _addContentViewsToViewStackContainer](v27, "_addContentViewsToViewStackContainer");
    -[SiriSharedUICompactView _updateBottomPadding](v27, "_updateBottomPadding");
    -[SiriSharedUICompactView _textRequestViewVisibilityDidChange](v27, "_textRequestViewVisibilityDidChange");
  }

  return v27;
}

- (SiriSharedUICompactView)initWithFrame:(CGRect)a3 backgroundBlurView:(id)a4 navigationView:(id)a5 resultView:(id)a6 conversationView:(id)a7 textRequestView:(id)a8 viewStackContainer:(id)a9
{
  return -[SiriSharedUICompactView initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additionalContentViews:textRequestView:viewStackContainer:](self, "initWithFrame:backgroundBlurView:navigationView:resultView:conversationView:additionalContentViews:textRequestView:viewStackContainer:", a4, a5, a6, a7, MEMORY[0x1E0C9AA60], a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a9);
}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  -[SiriSharedUICompactView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactView:viewDidChangeWindow:", self, v3);

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
    v9 = "-[SiriSharedUICompactView layoutSubviews]";
    _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUICompactView;
  -[SiriSharedUICompactView layoutSubviews](&v7, sel_layoutSubviews);
  -[SiriSharedUICompactView viewStackContainer](self, "viewStackContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");

  fullScreenEffectContainerView = self->_fullScreenEffectContainerView;
  -[SiriSharedUICompactView bounds](self, "bounds");
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
  void *v16;
  double v17;
  double v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t j;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v44 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = self->_additionalContentViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    LOBYTE(v10) = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v10 = v10 & (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "attachmentType") == 0);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  if (SiriSharedUIDeviceIsMac()
    && !-[SiriSharedUICompactResultViewHosting attachmentType](self->_resultView, "attachmentType"))
  {
    v12 = -[SiriSharedUICompactConversationViewHosting attachmentType](self->_conversationView, "attachmentType")
        ? 0
        : v10;
    if (v12 == 1)
    {
      -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sizeThatFits:", width, height);
      v15 = v14;

      -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sizeThatFits:", width, height);
      v18 = v17;

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = self->_additionalContentViews;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v35;
        v23 = 0.0;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "hostingView", (_QWORD)v34);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sizeThatFits:", width, height);
            v27 = v26;

            v23 = v23 + v27 + 8.0;
          }
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v21);
      }
      else
      {
        v23 = 0.0;
      }

      -[SiriSharedUIViewStackContainerHosting topPadding](self->_viewStackContainer, "topPadding");
      v29 = v15 + v18 + 8.0 + v23 + v28;
      -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
      v31 = v29 + v30;
      if (v31 < height)
        height = v31;
    }
  }
  v32 = width;
  v33 = height;
  result.height = v33;
  result.width = v32;
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
  SiriSharedUIViewStackContainerHosting *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SiriSharedUIViewStackContainerHosting *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  viewStackContainer = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting addContentView:](viewStackContainer, "addContentView:", v4);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_additionalContentViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "hostingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting addContentView:](v10, "addContentView:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v12 = self->_viewStackContainer;
  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting addContentView:](v12, "addContentView:", v13);

  v14 = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting bringSubviewToFront:](v14, "bringSubviewToFront:", v15);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_additionalContentViews;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "hostingView", (_QWORD)v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting bringSubviewToFront:](v21, "bringSubviewToFront:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
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
  SiriSharedUIViewStackContainerHosting *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  viewStackContainer = self->_viewStackContainer;
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting removeContentView:](viewStackContainer, "removeContentView:", v4);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_additionalContentViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = self->_viewStackContainer;
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "hostingView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriSharedUIViewStackContainerHosting removeContentView:](v10, "removeContentView:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v12 = self->_viewStackContainer;
  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUIViewStackContainerHosting removeContentView:](v12, "removeContentView:", v13);

  -[SiriSharedUICompactResultViewHosting relayout](self->_resultView, "relayout");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_additionalContentViews;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "relayout", (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  -[SiriSharedUICompactConversationViewHosting relayout](self->_conversationView, "relayout");
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
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  SiriSharedUICompactResultViewHosting *resultView;
  int64_t v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  SiriSharedUICompactResultViewHosting *v32;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    if (a3)
    {
      -[SiriSharedUIViewStackContainerHosting scrollView](self->_viewStackContainer, "scrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDelegate:", self);

    }
    -[SiriSharedUICompactView _removeContentViewsFromViewStackContainer](self, "_removeContentViewsFromViewStackContainer");
    -[SiriSharedUIViewStackContainerHosting setIsInAmbient:](self->_viewStackContainer, "setIsInAmbient:", self->_isInAmbient);
    if (self->_isInAmbient)
    {
      -[SiriSharedUICompactConversationViewHosting stackConstraints](self->_conversationView, "stackConstraints");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHeightConstraint:", 0);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v6 = self->_additionalContentViews;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v46 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "stackConstraints");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setHeightConstraint:", 0);

          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        }
        while (v8);
      }

      -[SiriSharedUICompactResultViewHosting stackConstraints](self->_resultView, "stackConstraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHeightConstraint:", 0);

      -[SiriSharedUICompactResultViewHosting setCustomAttachmentConstraints:](self->_resultView, "setCustomAttachmentConstraints:", MEMORY[0x1E0C9AA60]);
      -[SiriSharedUICompactConversationViewHosting setAttachmentType:](self->_conversationView, "setAttachmentType:", 3);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v13 = self->_additionalContentViews;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v42 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "setAttachmentType:", 3);
          }
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        }
        while (v15);
      }

      resultView = self->_resultView;
      v19 = 3;
    }
    else
    {
      -[SiriSharedUICompactView _clearAppIconView](self, "_clearAppIconView");
      -[SiriSharedUICompactView _configureResultViewCustomConstraints](self, "_configureResultViewCustomConstraints");
      -[SiriSharedUICompactConversationViewHosting stackConstraints](self->_conversationView, "stackConstraints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHeightConstraint:", 0);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = self->_additionalContentViews;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "stackConstraints");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setHeightConstraint:", 0);

          }
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        }
        while (v23);
      }

      -[SiriSharedUICompactConversationViewHosting setAttachmentType:](self->_conversationView, "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](self, "_conversationViewAttachmentType"));
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = self->_additionalContentViews;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v34;
        do
        {
          for (m = 0; m != v29; ++m)
          {
            if (*(_QWORD *)v34 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "setAttachmentType:", -[SiriSharedUICompactView _conversationViewAttachmentType](self, "_conversationViewAttachmentType", (_QWORD)v33));
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        }
        while (v29);
      }

      v32 = self->_resultView;
      v19 = -[SiriSharedUICompactView _resultViewAttachmentType](self, "_resultViewAttachmentType");
      resultView = v32;
    }
    -[SiriSharedUICompactResultViewHosting setAttachmentType:](resultView, "setAttachmentType:", v19, (_QWORD)v33);
    -[SiriSharedUICompactView _addContentViewsToViewStackContainer](self, "_addContentViewsToViewStackContainer");
    -[SiriSharedUICompactView _updateBottomPadding](self, "_updateBottomPadding");
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbient)
  {
    self->_isInAmbientInteractivity = a3;
    -[SiriSharedUICompactConversationViewHosting relayout](self->_conversationView, "relayout");
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

    -[SiriSharedUICompactView addSubview:](self, "addSubview:", self->_appIconView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_appIconView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setOpacity:", v8);

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[UIView trailingAnchor](self->_appIconView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -49.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    -[UIView bottomAnchor](self->_appIconView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactView bottomAnchor](self, "bottomAnchor");
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
    -[SiriSharedUICompactView _clearAppIconView](self, "_clearAppIconView");
  }

}

- (void)_clearAppIconView
{
  UIView *appIconView;

  -[UIView removeFromSuperview](self->_appIconView, "removeFromSuperview");
  appIconView = self->_appIconView;
  self->_appIconView = 0;

}

- (void)_configureResultViewCustomConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  SiriSharedUICompactResultViewHosting *resultView;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_additionalContentViews, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[NSArray firstObject](self->_additionalContentViews, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snippetViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[NSArray firstObject](self->_additionalContentViews, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hostingView");
      v10 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v10;
    }
  }
  if (SiriSharedUIDeviceIsPad() || SiriSharedUIDeviceIsMac())
  {
    -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -8.0);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:constant:", v13, -8.0);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  LODWORD(v16) = 1144750080;
  objc_msgSend(v15, "setPriority:", v16);
  resultView = self->_resultView;
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactResultViewHosting setCustomAttachmentConstraints:](resultView, "setCustomAttachmentConstraints:", v18);

}

- (int64_t)_resultViewAttachmentType
{
  if (SiriSharedUIDeviceIsPad())
    return 2;
  else
    return 0;
}

- (int64_t)_conversationViewAttachmentType
{
  return SiriSharedUIDeviceIsMac() ^ 1;
}

- (CGSize)resultViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SiriSharedUICompactResultViewHosting portraitContentSize](self->_resultView, "portraitContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setConversationView:(id)a3
{
  objc_storeStrong((id *)&self->_conversationView, a3);
}

- (SiriSharedUICompactConversationViewHosting)conversationView
{
  return self->_conversationView;
}

- (void)setResultView:(id)a3
{
  objc_storeStrong((id *)&self->_resultView, a3);
}

- (SiriSharedUICompactResultViewHosting)resultView
{
  return self->_resultView;
}

- (CGSize)conversationViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SiriSharedUICompactConversationViewHosting portraitContentSize](self->_conversationView, "portraitContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setResultViewAlpha:(double)a3
{
  id v4;

  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (SiriSharedUIContentPlatterView)snippetView
{
  return (SiriSharedUIContentPlatterView *)-[SiriSharedUICompactResultViewHosting snippetView](self->_resultView, "snippetView");
}

- (void)setSnippetView:(id)a3 completion:(id)a4
{
  -[SiriSharedUICompactResultViewHosting setSnippetView:completion:](self->_resultView, "setSnippetView:completion:", a3, a4);
}

- (void)setShowSnippetView:(BOOL)a3 animated:(BOOL)a4
{
  -[SiriSharedUICompactResultViewHosting setShowSnippetView:animated:](self->_resultView, "setShowSnippetView:animated:", a3, a4);
}

- (void)setConversationViewHidden:(BOOL)a3
{
  SiriSharedUIAnimationContext *v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;

  v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v5, "setAnimationDuration:", 0.3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke;
  v8[3] = &unk_1EA89CBB8;
  v8[4] = self;
  v9 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke_2;
  v6[3] = &unk_1EA89CBE0;
  v6[4] = self;
  v7 = a3;
  +[SiriSharedUIAnimationUtilities perfomAnimationBlockWithAnimationBlock:context:completion:](SiriSharedUIAnimationUtilities, "perfomAnimationBlockWithAnimationBlock:context:completion:", v8, v5, v6);

}

void __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

void __53__SiriSharedUICompactView_setConversationViewHidden___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "hostingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", *(_BYTE *)(a1 + 40) == 0);

}

- (void)snippetLayoutDidUpdateForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SiriSharedUICompactResultViewHosting snippetView](self->_resultView, "snippetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    -[SiriSharedUICompactResultViewHosting snippetContentDidUpdate](self->_resultView, "snippetContentDidUpdate");
    objc_msgSend(v4, "frame");
    if (v9 == 0.0 || v8 == 0.0)
      -[SiriSharedUICompactView resultViewContentDidLoad:](self, "resultViewContentDidLoad:", self->_resultView);
  }
  else
  {
    -[SiriSharedUICompactConversationViewHosting conversationSnippetViews](self->_conversationView, "conversationSnippetViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v4);

    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isHint"))
        -[SiriSharedUICompactConversationViewHosting snippetContentDidUpdateForHint](self->_conversationView, "snippetContentDidUpdateForHint");
      else
        -[SiriSharedUICompactConversationViewHosting snippetContentDidUpdate](self->_conversationView, "snippetContentDidUpdate");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = self->_additionalContentViews;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v17, "snippetViews", (_QWORD)v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v4);

            if (v19)
              objc_msgSend(v17, "snippetContentDidUpdate");
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

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

    -[SiriSharedUICompactConversationViewHosting setServerUtterances:](self->_conversationView, "setServerUtterances:", v6);
  }
}

- (void)setSpeechRecognitionHypothesis:(id)a3
{
  -[SiriSharedUICompactConversationViewHosting setSpeechRecognitionHypothesis:](self->_conversationView, "setSpeechRecognitionHypothesis:", a3);
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

    -[SiriSharedUICompactConversationViewHosting setConversationSnippetViews:](self->_conversationView, "setConversationSnippetViews:", v6);
    -[SiriSharedUICompactView setNeedsLayout](self, "setNeedsLayout");
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
      v11[2] = __60__SiriSharedUICompactView_setAdditionalContentSnippetViews___block_invoke;
      v11[3] = &unk_1EA89CC08;
      v11[4] = self;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
      -[SiriSharedUICompactView _removeContentViewsFromViewStackContainer](self, "_removeContentViewsFromViewStackContainer");
      -[SiriSharedUICompactView _configureResultViewCustomConstraints](self, "_configureResultViewCustomConstraints");
      -[SiriSharedUICompactView _addContentViewsToViewStackContainer](self, "_addContentViewsToViewStackContainer");
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SiriSharedUICompactView setAdditionalContentSnippetViews:].cold.1(v10);
  }

}

void __60__SiriSharedUICompactView_setAdditionalContentSnippetViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  -[SiriSharedUICompactView _transitionalContentViewFrames](self, "_transitionalContentViewFrames");
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
  -[SiriSharedUICompactView viewStackContainer](self, "viewStackContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hostingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  v13 = v12;
  v15 = v14;
  -[SiriSharedUICompactView viewStackContainer](self, "viewStackContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v16, "hasContentAtPoint:", v13, v15);

  return (char)v10;
}

- (void)setBottomContentInset:(double)a3 animatedWithContext:(id)a4
{
  self->_bottomContentInset = a3;
  -[SiriSharedUICompactView _updateBottomPaddingAnimatedWithContext:](self, "_updateBottomPaddingAnimatedWithContext:", a4);
}

- (void)setBottomContentInset:(double)a3
{
  SiriSharedUIAnimationContext *v5;

  v5 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v5, "setAnimationDuration:", 0.0);
  -[SiriSharedUICompactView setBottomContentInset:animatedWithContext:](self, "setBottomContentInset:animatedWithContext:", v5, a3);

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
  uint64_t v11;
  SiriSharedUICompactConversationViewHosting *conversationView;
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
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "prepareForUpdatesToSnippetViews:", (a3 >> 5) & 1);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  conversationView = self->_conversationView;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SiriSharedUICompactView_prepareForUpdatesWithDiff_updateBlock___block_invoke;
  v14[3] = &unk_1EA89CC30;
  v15 = v6;
  v13 = v6;
  -[SiriSharedUICompactConversationViewHosting prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:](conversationView, "prepareForUpdatesToServerUtterance:conversationSnippetViews:speechRecognitionHypothesis:latencyViewModel:updateBlock:", (a3 >> 2) & 1, (a3 >> 1) & 1, (a3 >> 3) & 1, 0, v14);

}

uint64_t __65__SiriSharedUICompactView_prepareForUpdatesWithDiff_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contentDidUpdate:(BOOL)a3
{
  if (!a3)
  {
    -[SiriSharedUICompactConversationViewHosting transitionToExpandablePlatterStyle:](self->_conversationView, "transitionToExpandablePlatterStyle:", 4);
    -[SiriSharedUICompactConversationViewHosting animateAppearanceIfNeeded](self->_conversationView, "animateAppearanceIfNeeded");
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
      -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "heightAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
      v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v8 = self->_conversationExpansionConstraint;
      self->_conversationExpansionConstraint = v7;

      conversationExpansionConstraint = self->_conversationExpansionConstraint;
    }
    -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView");
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
    -[SiriSharedUICompactView bounds](self, "bounds");
    v7 = -[SiriSharedUIStandardView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_fullScreenEffectContainerView;
    self->_fullScreenEffectContainerView = v7;

    -[SiriSharedUICompactView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_fullScreenEffectContainerView, 0);
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

  -[SiriSharedUICompactView delegate](self, "delegate", a3);
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
  -[SiriSharedUICompactView _instrumentationManager](self, "_instrumentationManager", a3, a4.x);
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

  -[SiriSharedUICompactView _analytics](self, "_analytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 1456, v11);

}

- (void)conversationViewDidBeginExpandTransition:(id)a3
{
  -[SiriSharedUICompactView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 1);
}

- (void)conversationViewDidResetExpandedState:(id)a3
{
  -[SiriSharedUICompactView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 0);
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
    v11 = "-[SiriSharedUICompactView conversationViewDidTransitionToCollapsedState:]";
    _os_log_impl(&dword_1DE0BF000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now collapsed", (uint8_t *)&v10, 0xCu);
  }
  -[SiriSharedUICompactResultViewHosting setShowDimmingView:animated:](self->_resultView, "setShowDimmingView:animated:", 0, 1);
  -[SiriSharedUICompactView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 0);
  -[SiriSharedUICompactView _instrumentationManager](self, "_instrumentationManager");
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
  -[SiriSharedUICompactView _analytics](self, "_analytics");
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
    v11 = "-[SiriSharedUICompactView conversationViewDidTransitionToExpandedState:]";
    _os_log_impl(&dword_1DE0BF000, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: conversationView now expanded", (uint8_t *)&v10, 0xCu);
  }
  -[SiriSharedUICompactResultViewHosting setShowDimmingView:animated:](self->_resultView, "setShowDimmingView:animated:", 1, 1);
  -[SiriSharedUICompactView _instrumentationManager](self, "_instrumentationManager");
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
  -[SiriSharedUICompactView _analytics](self, "_analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1455, v6);

}

- (void)conversationView:(id)a3 didUpdateHeightDuringExpansionTransition:(double)a4 didCompleteGesture:(BOOL)a5
{
  double v7;
  double v8;

  if (!a5)
  {
    -[SiriSharedUICompactView expectedExpandedHeightForConversationView:](self, "expectedExpandedHeightForConversationView:", a3);
    v8 = a4 - (v7 - 100.0);
    if (v8 < 0.0)
      v8 = 0.0;
    -[SiriSharedUICompactResultViewHosting setDarkenIntensity:animated:](self->_resultView, "setDarkenIntensity:animated:", 0, 1.0 * (v8 / 100.0));
  }
  -[NSLayoutConstraint setConstant:](self->_conversationExpansionConstraint, "setConstant:", a3, a4);
}

- (double)expectedExpandedHeightForConversationView:(id)a3
{
  void *v4;
  void *v5;
  double Height;
  double v7;
  void *v8;
  CGRect v10;
  CGRect v11;

  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v10);

  if (SiriSharedUIDeviceIsPad())
    return Height - 80.0;
  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v7 = Height - CGRectGetMinY(v11) - 80.0;

  return v7;
}

- (void)conversationView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  SiriSharedUICompactViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "compactView:viewDidAppearForAceObject:", self, v6);

}

- (void)conversationView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  SiriSharedUICompactViewDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "compactView:viewDidDisappearForAceObject:", self, v6);

}

- (void)conversationViewDidUpdatePresentedContentHeight:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;

  -[SiriSharedUICompactResultViewHosting relayout](self->_resultView, "relayout", a3);
  -[SiriSharedUICompactView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "compactViewDidUpdatePresentedContentHeight:", self);

  }
}

- (id)parserSpeakableObjectProviderForConversationView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parserSpeakableObjectProviderForCompactView:", self);
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

  -[SiriSharedUICompactView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumHeightForCompactView:", self);
  v6 = v5;

  -[SiriSharedUIViewStackContainerHosting topPadding](self->_viewStackContainer, "topPadding");
  v8 = v7;
  -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
  return v6 - (v8 + v9) + -8.0;
}

- (void)resultViewContentDidLoad:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIView *appIconView;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SiriSharedUICompactView resultViewContentDidLoad:]";
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1DE0BF000, v6, OS_LOG_TYPE_DEFAULT, "%s #compact: resultViewContentDidLoad: %@", buf, 0x16u);
  }
  -[SiriSharedUICompactConversationViewHosting animateAppearanceIfNeeded](self->_conversationView, "animateAppearanceIfNeeded");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_additionalContentViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "animateAppearanceIfNeeded", (_QWORD)v21);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  appIconView = self->_appIconView;
  if (appIconView)
  {
    -[UIView layer](appIconView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "opacity");
    v15 = v14;

    if (v15 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[UIView layer](self->_appIconView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriSharedUIAnimationUtilities animationForStyle:expectedWidthForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationForStyle:expectedWidthForStyle:presentationType:", 3, &unk_1EA8AD9E0, -[SiriSharedUICompactView _animatedPresentationType](self, "_animatedPresentationType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("conversationAppearance"));

      -[UIView layer](self->_appIconView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 1.0;
      objc_msgSend(v18, "setOpacity:", v19);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  v20 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SiriSharedUICompactView resultViewContentDidLoad:]";
    _os_log_impl(&dword_1DE0BF000, v20, OS_LOG_TYPE_DEFAULT, "%s #compact running fadeIn of conversationView", buf, 0xCu);
  }

}

- (int64_t)_animatedPresentationType
{
  return self->_isInAmbient;
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

- (void)resultViewContentDidScroll:(id)a3
{
  if ((-[SiriSharedUICompactConversationViewHosting isCurrentlyTrackingGesture](self->_conversationView, "isCurrentlyTrackingGesture", a3) & 1) == 0)
  {
    if (-[SiriSharedUICompactConversationViewHosting willAutomaticallyCollapseWhenResultIsScrolled](self->_conversationView, "willAutomaticallyCollapseWhenResultIsScrolled"))
    {
      -[SiriSharedUICompactConversationViewHosting transitionToExpandablePlatterStyle:](self->_conversationView, "transitionToExpandablePlatterStyle:", 2);
      -[SiriSharedUICompactView _updateExpansionConstraints:](self, "_updateExpansionConstraints:", 0);
    }
  }
}

- (void)resultViewDarkenedContentWasTapped:(id)a3
{
  -[SiriSharedUICompactConversationViewHosting transitionToExpandablePlatterStyle:](self->_conversationView, "transitionToExpandablePlatterStyle:", 2);
}

- (double)maximumHeightForResultView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_isInAmbient)
    return 1.79769313e308;
  -[SiriSharedUICompactView delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumHeightForCompactView:", self);
  v7 = v6;

  -[SiriSharedUIViewStackContainerHosting topPadding](self->_viewStackContainer, "topPadding");
  v9 = v8;
  -[SiriSharedUIViewStackContainerHosting bottomPadding](self->_viewStackContainer, "bottomPadding");
  return v7 - (v9 + v10);
}

- (UIEdgeInsets)contentInsetsForResultView:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  UIEdgeInsets result;
  CGRect v25;

  -[SiriSharedUICompactConversationViewHosting hostingView](self->_conversationView, "hostingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SiriSharedUICompactResultViewHosting hostingView](self->_resultView, "hostingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v25.origin.x = v14;
  v25.origin.y = v15;
  v25.size.width = v16;
  v25.size.height = v17;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v18 = CGRectIntersectsRect(v23, v25);

  v19 = 0.0;
  if (v18)
    v20 = 60.0 + 10.0;
  else
    v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  result.right = v22;
  result.bottom = v20;
  result.left = v19;
  result.top = v21;
  return result;
}

- (void)resultViewContentScrolled:(id)a3 toContentOffset:(CGPoint)a4
{
  double y;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a4.y;
  -[SiriSharedUICompactView _instrumentationManager](self, "_instrumentationManager", a3, a4.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emitUserViewRegionInteractionEventWithViewRegion:userViewInteraction:", 2, 3);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v11, "setValue:forKey:", CFSTR("ResultView"), CFSTR("viewClass"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("contentOffset"));

  -[SiriSharedUICompactView _analytics](self, "_analytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 1456, v11);

}

- (void)resultViewContentScrolling:(id)a3 didBegin:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  id v7;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (v4)
    objc_msgSend(WeakRetained, "scrollDidBeginFromView:", self);
  else
    objc_msgSend(WeakRetained, "scrollDidEndFromView:", self);

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
  v4[2] = __62__SiriSharedUICompactView__textRequestViewVisibilityDidChange__block_invoke;
  v4[3] = &unk_1EA89CC58;
  v4[4] = self;
  -[SiriSharedUICompactView _updateBottomPaddingAnimatedWithContext:alongsideAnimations:](self, "_updateBottomPaddingAnimatedWithContext:alongsideAnimations:", v3, v4);

}

uint64_t __62__SiriSharedUICompactView__textRequestViewVisibilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hidesTextRequestView");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", v2);
  if ((_DWORD)v2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "resignFirstResponder");
  return result;
}

- (void)setHidesTextRequestView:(BOOL)a3
{
  if (self->_hidesTextRequestView != a3)
  {
    self->_hidesTextRequestView = a3;
    -[SiriSharedUICompactView _textRequestViewVisibilityDidChange](self, "_textRequestViewVisibilityDidChange");
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
  -[SiriSharedUICompactView _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", v4);

}

- (void)_clearTransitionalContentViewFrameSnapshots
{
  -[SiriSharedUICompactView _setTransitionalContentViewFrames:](self, "_setTransitionalContentViewFrames:", 0);
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
    v8 = -[SiriSharedUICompactView hidesTextRequestView](self, "hidesTextRequestView");
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
  if (-[SiriSharedUICompactView hidesTextRequestView](self, "hidesTextRequestView"))
  {
    v11 = _Block_copy(v7);
    v12 = 0;
  }
  else
  {
    -[UIView frame](self->_textRequestView, "frame");
    v10 = v10 + 16.0 + CGRectGetHeight(v20);
    -[SiriSharedUICompactView _snapshotContentViewFramesForTransition](self, "_snapshotContentViewFramesForTransition");
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke;
    aBlock[3] = &unk_1EA89CC80;
    aBlock[4] = self;
    v19 = v7;
    v11 = _Block_copy(aBlock);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2;
    v17[3] = &unk_1EA89CC58;
    v17[4] = self;
    v12 = _Block_copy(v17);

  }
  viewStackContainer = self->_viewStackContainer;
  objc_msgSend(v6, "animationDuration");
  -[SiriSharedUIViewStackContainerHosting setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:](viewStackContainer, "setBottomPadding:animatedWithDuration:animationOptions:alongsideAnimations:completion:", objc_msgSend(v6, "animationOptions"), v11, v12, v10, v15);
  -[SiriSharedUICompactView delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "compactView:didChangeEffectiveBottomContentInsetAnimatedWithContext:", self, v6);

}

uint64_t __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __87__SiriSharedUICompactView__updateBottomPaddingAnimatedWithContext_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearTransitionalContentViewFrameSnapshots");
}

- (void)_updateBottomPaddingAnimatedWithContext:(id)a3
{
  -[SiriSharedUICompactView _updateBottomPaddingAnimatedWithContext:alongsideAnimations:](self, "_updateBottomPaddingAnimatedWithContext:alongsideAnimations:", a3, 0);
}

- (void)_updateBottomPadding
{
  SiriSharedUIAnimationContext *v3;

  v3 = objc_alloc_init(SiriSharedUIAnimationContext);
  -[SiriSharedUIAnimationContext setAnimationDuration:](v3, "setAnimationDuration:", 0.0);
  -[SiriSharedUICompactView _updateBottomPaddingAnimatedWithContext:](self, "_updateBottomPaddingAnimatedWithContext:", v3);

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

- (SiriSharedUICompactViewDelegate)delegate
{
  return (SiriSharedUICompactViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
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

- (SiriSharedUIRectSet)_transitionalContentViewFrames
{
  return self->_transitionalContentViewFrames;
}

- (void)_setTransitionalContentViewFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalContentViewFrames, 0);
  objc_storeStrong((id *)&self->_additionalContentSnippetViews, 0);
  objc_storeStrong((id *)&self->_conversationSnippetViews, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewStackContainer, 0);
  objc_storeStrong((id *)&self->_fullScreenEffectContainerView, 0);
  objc_storeStrong((id *)&self->_conversationExpansionConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textRequestView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_resultView, 0);
  objc_storeStrong((id *)&self->_additionalContentViews, 0);
  objc_storeStrong((id *)&self->_conversationView, 0);
}

- (void)setAdditionalContentSnippetViews:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SiriSharedUICompactView setAdditionalContentSnippetViews:]";
  _os_log_error_impl(&dword_1DE0BF000, log, OS_LOG_TYPE_ERROR, "%s #compact: attempting to set snippets incorrect number of platters; skipping and returning early.",
    (uint8_t *)&v1,
    0xCu);
}

@end
