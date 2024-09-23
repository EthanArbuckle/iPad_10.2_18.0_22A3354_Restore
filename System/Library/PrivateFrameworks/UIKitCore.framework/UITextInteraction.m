@implementation UITextInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)addGestureRecognizer:(id)a3 withName:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "setName:", v6);
  objc_msgSend(v10, "_setAnalyticsGestureHandled:", 1);
  if (-[UITextInteraction doesControlDelegate](self, "doesControlDelegate"))
    objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "_pairedGestureIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[NSMutableArray addObject:](self->_gestures, "addObject:", v10);
  -[NSMutableDictionary setObject:forKey:](self->_gestureMap, "setObject:forKey:", v10, v6);

  -[UITextInteraction gestureRecognizerHostView](self, "gestureRecognizerHostView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    -[UIView _addGestureRecognizer:atEnd:](v8, v10, 0);

}

- (void)didMoveToView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id WeakRetained;
  id v20;
  id v21;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  UITextInteractionInputDelegate *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
  v5 = objc_storeWeak((id *)&self->_view, v4);

  v6 = v5;
  if (!v4)
    goto LABEL_24;
  -[UITextInteraction gestureRecognizerHostView](self, "gestureRecognizerHostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = self->_gestures;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        -[UIView _addGestureRecognizer:atEnd:]((uint64_t)v7, *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12++), 0);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v10);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = self->_children;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v17);
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(WeakRetained, "addInteraction:", v18, (_QWORD)v42);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v15);
  }

  v20 = objc_loadWeakRetained((id *)&self->_assistantDelegate);
  if (!v20)
  {
    v20 = objc_loadWeakRetained((id *)&self->_parent);
    if (!v20)
    {
      v28 = objc_loadWeakRetained((id *)&self->_textInput);
      if (!v28)
        goto LABEL_19;
      v29 = v28;
      v30 = objc_loadWeakRetained((id *)&self->_view);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "markedTextOverlay");
      v32 = (id)objc_claimAutoreleasedReturnValue();

      if (v30 == v32)
        goto LABEL_19;
      v33 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_msgSend(v33, "interactionAssistant");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v35 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v35, "__createInteractionAssistantIfNecessaryWithMode:", self->_textInteractionMode);

      }
      v36 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_msgSend(v36, "__prepareInteractionAssistantIfNecessary");

      v37 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_msgSend(v37, "interactionAssistant");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setExternalInteractions:", self);

      v39 = objc_alloc_init(UITextInteractionInputDelegate);
      -[UITextInteraction setInteractionInputDelegate:](self, "setInteractionInputDelegate:", v39);

      -[UITextInteraction interactionInputDelegate](self, "interactionInputDelegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setRootInteraction:", self);

      v20 = objc_loadWeakRetained((id *)&self->_textInput);
      -[UITextInteraction interactionInputDelegate](self, "interactionInputDelegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInputDelegate:", v41);

    }
  }

LABEL_19:
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_msgSend(v23, "interactionShouldSuppressSystemUI:", self);

    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSuppressSystemUI:", v24);

  }
  v26 = objc_loadWeakRetained((id *)&self->_view);
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
    self->_viewOverridesInteractivityState = 1;

LABEL_24:
}

- (UIView)gestureRecognizerHostView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)willMoveToView:(id)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  UITextInteraction *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[UITextInteraction cancelLinkInteractionSession](self, "cancelLinkInteractionSession");
  if (!a3)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = self->_gestures;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v9);
          WeakRetained = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(WeakRetained, "removeGestureRecognizer:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = self->_children;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16);
          v18 = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(v18, "removeInteraction:", v17, (_QWORD)v29);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }

    v19 = objc_loadWeakRetained((id *)&self->_assistantDelegate);
    if (v19)
      goto LABEL_18;
    v19 = objc_loadWeakRetained((id *)&self->_parent);
    if (v19)
      goto LABEL_18;
    v20 = objc_loadWeakRetained((id *)&self->_textInput);

    if (v20)
    {
      v21 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_msgSend(v21, "interactionAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "externalInteractions");
      v23 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();

      if (v23 == self)
      {
        v24 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v24, "inputDelegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextInteraction interactionInputDelegate](self, "interactionInputDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 == v26)
        {
          -[UITextInteraction interactionInputDelegate](self, "interactionInputDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setRootInteraction:", 0);

          v28 = objc_loadWeakRetained((id *)&self->_textInput);
          objc_msgSend(v28, "setInputDelegate:", 0);

          -[UITextInteraction setInteractionInputDelegate:](self, "setInteractionInputDelegate:", 0);
        }
        v19 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v19, "__tearDownInteractionAssistantIfNecessary");
LABEL_18:

      }
    }
  }
}

- (void)_setLinkInteractionSession:(id)a3
{
  id v4;
  UITextInteraction *v5;
  UITextInteraction *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  -[UITextInteraction root](self, "root");
  v5 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5 == self;
  else
    v7 = 1;
  v8 = !v7;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8)
      goto LABEL_9;
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Setting link interaction session on a non root interaction!", buf, 2u);
    }

LABEL_19:
    -[UITextInteraction _setLinkInteractionSession:](v6, "_setLinkInteractionSession:", v4);
    goto LABEL_10;
  }
  if (v8)
  {
    v10 = qword_1ECD81BA8;
    if (!qword_1ECD81BA8)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD81BA8);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Setting link interaction session on a non root interaction!", v12, 2u);
    }
    goto LABEL_19;
  }
LABEL_9:
  objc_setAssociatedObject(self, &_MergedGlobals_1257, v4, (void *)1);
LABEL_10:

}

- (void)cancelLinkInteractionSession
{
  UITextInteraction *v3;
  UITextInteraction *v4;

  -[UITextInteraction root](self, "root");
  v3 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || v3 == self)
    -[UITextInteraction _setLinkInteractionSession:](self, "_setLinkInteractionSession:", 0);
  else
    -[UITextInteraction cancelLinkInteractionSession](v3, "cancelLinkInteractionSession");

}

- (UITextInteraction)root
{
  UITextInteraction *v2;
  id *p_parent;
  id WeakRetained;
  id *p_isa;
  id v6;

  v2 = self;
  p_parent = (id *)&v2->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&v2->_parent);

  if (WeakRetained)
  {
    do
    {
      p_isa = (id *)objc_loadWeakRetained(p_parent);

      p_parent = p_isa + 1;
      v6 = objc_loadWeakRetained(p_isa + 1);

      v2 = (UITextInteraction *)p_isa;
    }
    while (v6);
  }
  else
  {
    p_isa = (id *)&v2->super.isa;
  }
  return (UITextInteraction *)p_isa;
}

- (BOOL)doesControlDelegate
{
  return 1;
}

- (id)recognizerForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UITextInteraction interactionWithGestureForName:](self, "interactionWithGestureForName:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(*(id *)(v5 + 32), "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UITextInteraction)interactionWithGestureForName:(id)a3
{
  id v4;
  void *v5;
  UITextInteraction *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_gestureMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_children;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "interactionWithGestureForName:", v4, (_QWORD)v14);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v6 = (UITextInteraction *)v12;

            goto LABEL_13;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)_textInput
{
  void *v3;
  void *v4;
  id WeakRetained;
  char v6;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  Class v12;
  objc_class *v13;
  id v14;
  Class Class;
  int v16;
  Class v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UITextInteraction root](self, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
      goto LABEL_4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v6 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EDE22B80);

    if ((v6 & 1) != 0)
      goto LABEL_4;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
      v11 = objc_loadWeakRetained((id *)&self->_view);
      Class = object_getClass(v11);
      v13 = Class;
      v14 = objc_loadWeakRetained((id *)&self->_view);
      v16 = 138412546;
      v17 = Class;
      v18 = 2048;
      v19 = v14;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "View <%@:%p> does not conform to UITextInput protocol", (uint8_t *)&v16, 0x16u);
    }
    else
    {
      v8 = _textInput___s_category;
      if (!_textInput___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_textInput___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      v10 = v9;
      v11 = objc_loadWeakRetained((id *)&self->_view);
      v12 = object_getClass(v11);
      v13 = v12;
      v14 = objc_loadWeakRetained((id *)&self->_view);
      v16 = 138412546;
      v17 = v12;
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "View <%@:%p> does not conform to UITextInput protocol", (uint8_t *)&v16, 0x16u);
    }

LABEL_12:
LABEL_4:
    v4 = objc_loadWeakRetained((id *)&self->_view);
  }
  return v4;
}

- (UIResponder)textInput
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_textInput);
}

- (void)_applyTransientState:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "_applyTransientState:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)_transientState
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_children, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](self->_children, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_transientState", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (objc_class *)objc_opt_class();
            NSStringFromClass(v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v9, v11);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)inGesture
{
  uint64_t v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_inGesture)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = self->_children;
    v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "inGesture", (_QWORD)v7) & 1) != 0)
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v2;
}

- (void)addChild:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  id *v7;

  v4 = (id *)a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cluster may not be nil"), self);
    v4 = 0;
  }
  objc_msgSend(v4, "parent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeChild:", v7);

  }
  objc_storeWeak(v7 + 1, self);
  -[NSMutableArray addObject:](self->_children, "addObject:", v7);

}

- (UITextInteraction)parent
{
  return (UITextInteraction *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)finishSetup
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_children;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "finishSetup", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setAssistantDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_assistantDelegate, a3);
}

- (void)setTextInput:(UIResponder *)textInput
{
  objc_storeWeak((id *)&self->_textInput, textInput);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)addIndirectChild:(id)a3
{
  id *v4;
  id *v5;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cluster may not be nil"), self);
    v4 = 0;
  }
  objc_storeWeak(v4 + 1, self);

}

+ (UITextInteraction)textInteractionForMode:(UITextInteractionMode)mode
{
  UITextInteraction *v4;

  v4 = objc_alloc_init(UITextInteraction);
  v4->_textInteractionMode = mode;
  return v4;
}

- (UITextInteraction)init
{
  UITextInteraction *v2;
  UITextInteraction *v3;
  uint64_t v4;
  NSMutableArray *children;
  uint64_t v6;
  NSMutableArray *gestures;
  uint64_t v8;
  NSMutableDictionary *gestureMap;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITextInteraction;
  v2 = -[UITextInteraction init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_textInteractionMode = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    children = v3->_children;
    v3->_children = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    gestures = v3->_gestures;
    v3->_gestures = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    gestureMap = v3->_gestureMap;
    v3->_gestureMap = (NSMutableDictionary *)v8;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assistantDelegate);
  objc_storeStrong((id *)&self->_interactionInputDelegate, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_textInput);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackBehaviour, 0);
  objc_storeStrong((id *)&self->_customHighlighterGesture, 0);
  objc_storeStrong((id *)&self->_gestureMap, 0);
  objc_storeStrong((id *)&self->_gestures, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (UITextInteraction_AssistantDelegate)assistantDelegate
{
  UITextInteraction_AssistantDelegate **p_assistantDelegate;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  UITextInput **p_textInput;
  id v10;

  p_assistantDelegate = &self->_assistantDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assistantDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_assistantDelegate);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_parent);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_parent);
      objc_msgSend(v7, "assistantDelegate");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      p_textInput = &self->_textInput;
      v10 = objc_loadWeakRetained((id *)p_textInput);

      if (!v10)
      {
        v5 = 0;
        return (UITextInteraction_AssistantDelegate *)v5;
      }
      v7 = objc_loadWeakRetained((id *)p_textInput);
      objc_msgSend(v7, "interactionAssistant");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v8;

  }
  return (UITextInteraction_AssistantDelegate *)v5;
}

- (id)defaultTapRecognizerWithAction:(SEL)a3
{
  UITextTapRecognizer *v3;

  v3 = -[UITextTapRecognizer initWithTarget:action:]([UITextTapRecognizer alloc], "initWithTarget:action:", self, a3);
  -[UITapGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 10.0);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
  return v3;
}

- (id)defaultDoubleTapRecognizerWithAction:(SEL)a3
{
  UITextTapRecognizer *v3;

  v3 = -[UITextTapRecognizer initWithTarget:action:]([UITextTapRecognizer alloc], "initWithTarget:action:", self, a3);
  -[UITapGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 60.0);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
  -[UITapGestureRecognizer _setDelaysRecognitionForGreaterTapCounts:](v3, "_setDelaysRecognitionForGreaterTapCounts:", 1);
  return v3;
}

- (id)delegate
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(v6, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)removeChild:(id)a3
{
  id *v4;
  uint64_t *v5;
  UITextInteraction *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id *v10;

  v4 = (id *)a3;
  v5 = (uint64_t *)MEMORY[0x1E0C99778];
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: cluster may not be nil"), self);
    v4 = 0;
  }
  objc_msgSend(v4, "parent");
  v6 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *v5;
    objc_msgSend(v10, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: cluster has a different parent (%@)"), self, v9);

  }
  objc_storeWeak(v10 + 1, 0);
  -[NSMutableArray removeObject:](self->_children, "removeObject:", v10);

}

- (UITextInteraction)interactionWithClass:(Class)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_children;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
LABEL_13:
          v11 = v10;
          goto LABEL_14;
        }
        objc_msgSend(v9, "interactionWithClass:", a3, (_QWORD)v13);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
          goto LABEL_13;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return (UITextInteraction *)v11;
}

- (UITextCursorAssertionController)_assertionController
{
  void *v2;
  void *v3;

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assertionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextCursorAssertionController *)v3;
}

- (void)removeGestureRecognizerWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_gestureMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_gestures, "containsObject:", v4))
  {
    -[UITextInteraction gestureRecognizerHostView](self, "gestureRecognizerHostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "removeGestureRecognizer:", v4);
    if (-[UITextInteraction doesControlDelegate](self, "doesControlDelegate"))
      objc_msgSend(v4, "setDelegate:", 0);
    -[NSMutableArray removeObject:](self->_gestures, "removeObject:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_gestureMap, "removeObjectForKey:", v7);

  }
}

- (void)_cancelRecognizerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[UITextInteraction root](self, "root");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizerForName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)UIApp, "_gestureEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v7, v8);

    }
  }
}

- (UITextInteractionMode)textInteractionMode
{
  id WeakRetained;
  void *v4;
  UITextInteractionMode v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (!WeakRetained)
    return self->_textInteractionMode;
  -[UITextInteraction root](self, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "textInteractionMode");

  return v5;
}

- (void)setInGesture:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;

  v3 = a3;
  self->_inGesture = a3;
  -[UITextInteraction delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v10 = (void *)v5;
    if (v3)
    {
      v7 = objc_opt_respondsToSelector();
      v6 = v10;
      if ((v7 & 1) != 0)
      {
        -[UITextInteraction root](self, "root", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "interactionWillBegin:", v8);
LABEL_7:

        v6 = v10;
      }
    }
    else
    {
      v9 = objc_opt_respondsToSelector();
      v6 = v10;
      if ((v9 & 1) != 0)
      {
        -[UITextInteraction root](self, "root", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "interactionDidEnd:", v8);
        goto LABEL_7;
      }
    }
  }

}

- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_children;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "shouldAllowWithTouchTypes:atPoint:toBegin:", v9, v5, x, y, (_QWORD)v17))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (void)_callDelegateWillMoveTextRangeExtentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[UITextInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UITextInteraction delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_willMoveTextRangeExtentAtPoint:", x, y);

  }
}

- (NSArray)gesturesForFailureRequirements
{
  UITextInput **p_textInput;
  id WeakRetained;
  void *v5;
  UITextInteraction *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_textInput = &self->_textInput;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalInteractions");
  v6 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v8 = (NSMutableArray *)objc_loadWeakRetained((id *)p_textInput);
    -[NSMutableArray interactionAssistant](v8, "interactionAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gesturesForFailureRequirements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)-[NSMutableArray mutableCopy](self->_gestures, "mutableCopy");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_children;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "gesturesForFailureRequirements", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
  }

  return (NSArray *)v7;
}

+ (id)textInteractionsForSet:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = -1;
  if (a3)
    v4 = v3;
  else
    v4 = 0;
  return (id)objc_msgSend(a1, "textInteractionForMode:", v4);
}

- (int64_t)textInteractionSet
{
  UITextInteractionMode v2;
  int64_t v3;

  v2 = -[UITextInteraction textInteractionMode](self, "textInteractionMode");
  if (v2 == UITextInteractionModeNonEditable)
    v3 = 1;
  else
    v3 = -1;
  if (v2)
    return v3;
  else
    return 0;
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5
{
  -[UITextInteraction _performGestureType:state:location:locationOfFirstTouch:forTouchType:](self, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", a3, a4, 0, a5.x, a5.y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6
{
  -[UITextInteraction _performGestureType:state:location:locationOfFirstTouch:forTouchType:](self, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", a3, a4, 0, a5.x, a5.y, a6.x, a6.y);
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  double y;
  double x;
  double v11;
  double v12;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  id WeakRetained;
  void *v20;
  UITextInteraction *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;

  y = a6.y;
  x = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v15 = CFSTR("UITextInteractionNameInteractiveRefinement");
  if (a7 == 3)
    v15 = CFSTR("UITextInteractionNameLoupe");
  v16 = CFSTR("UITextInteractionNameDoubleTap");
  v17 = CFSTR("UITextInteractionNameSingleTap");
  if (a3 != 1)
    v17 = 0;
  if (a3 != 2)
    v16 = v17;
  if ((unint64_t)(a3 - 3) >= 2)
    v18 = v16;
  else
    v18 = v15;
  -[UITextInteraction root](self, "root");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "externalInteractions");
  v21 = (UITextInteraction *)objc_claimAutoreleasedReturnValue();

  if (v21 == self)
  {
    v23 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v23, "interactionAssistant");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "interactions");
    v25 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v25;
  }
  else
  {
    v22 = v27;
  }
  v28 = v22;
  objc_msgSend(v22, "interactionWithGestureForName:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", a3, a4, a7, v12, v11, x, y);

}

- (void)_createFeedbackIfNecessary
{
  _UIStatesFeedbackGenerator *v3;
  _UIStatesFeedbackGenerator *feedbackBehaviour;

  if (!self->_feedbackBehaviour)
  {
    v3 = -[_UIStatesFeedbackGenerator initWithStyle:]([_UIStatesFeedbackGenerator alloc], "initWithStyle:", 0);
    feedbackBehaviour = self->_feedbackBehaviour;
    self->_feedbackBehaviour = v3;

  }
}

- (void)_prepareFeedbackForGesture
{
  void *v3;
  char v4;
  id v5;

  -[UITextInteraction feedbackBehaviour](self, "feedbackBehaviour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if ((v4 & 1) == 0)
  {
    -[UITextInteraction feedbackBehaviour](self, "feedbackBehaviour");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateWithCompletionBlock:", 0);

  }
}

- (void)_cleanUpFeedbackForGesture
{
  void *v3;
  int v4;
  id v5;

  -[UITextInteraction feedbackBehaviour](self, "feedbackBehaviour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    -[UITextInteraction feedbackBehaviour](self, "feedbackBehaviour");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivate");

  }
}

- (void)_playFeedbackForCursorMovement
{
  id v2;

  -[UITextInteraction feedbackBehaviour](self, "feedbackBehaviour");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionToState:ended:", CFSTR("preview"), 1);

}

- (id)linkInteractionSession
{
  return objc_getAssociatedObject(self, &_MergedGlobals_1257);
}

- (BOOL)_shouldObscureTextInput
{
  id WeakRetained;
  int v3;
  id v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "displaySecureTextUsingPlainText") ^ 1;
  else
    v3 = 1;
  v4 = WeakRetained;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "isSecureTextEntry") & v3;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_textInputIsInteractive
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[UITextInteraction _textInput](self, "_textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (self->_viewOverridesInteractivityState)
      v5 = objc_msgSend(v3, "_isInteractiveDespiteResponderStatus");
    else
      v5 = objc_msgSend(v3, "isFirstResponder");
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_textInputLivesInKeyWindow
{
  void *v2;
  void *v3;
  char v4;

  -[UITextInteraction _textInput](self, "_textInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "_isTextEffectsWindow") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "_isApplicationKeyWindow");

  return v4;
}

- (void)_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "closestPositionToPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)containerChangesSelectionOnOneFingerTap
{
  void *v2;
  BOOL v3;

  -[UITextInteraction _textInput](self, "_textInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v2, "isEditing") & 1) != 0
    || !objc_msgSend(v2, "hasText")
    || (unint64_t)(objc_msgSend(v2, "clearingBehavior") - 4) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (void)disableClearsOnInsertion
{
  UIView **p_view;
  id WeakRetained;
  char v4;
  id v5;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v5, "setClearingBehavior:", 0);

  }
}

- (BOOL)selection:(id)a3 containsPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  int v9;
  UIView **p_view;
  id WeakRetained;
  char v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGPoint v42;
  CGPoint v43;
  CGRect v44;
  CGRect v45;

  y = a4.y;
  x = a4.x;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "selectedRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isRanged");

  if (!v9)
  {
LABEL_18:
    v23 = 0;
    goto LABEL_20;
  }
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v7, "selectionRects", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "rect");
          v33 = (44.0 - v31) * 0.5;
          if (v33 < 0.0)
            v33 = 0.0;
          if ((44.0 - v32) * 0.5 >= 0.0)
            v34 = (44.0 - v32) * 0.5;
          else
            v34 = 0.0;
          v45 = CGRectInset(*(CGRect *)&v29, -v33, -v34);
          v43.x = x;
          v43.y = y;
          if (CGRectContainsPoint(v45, v43))
          {

            v23 = 1;
            goto LABEL_20;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v26)
          continue;
        break;
      }
    }

    goto LABEL_18;
  }
  v13 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v7, "selectedRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_boundingRectForRange:", v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v44.origin.x = v16;
  v44.origin.y = v18;
  v44.size.width = v20;
  v44.size.height = v22;
  v42.x = x;
  v42.y = y;
  v23 = CGRectContainsPoint(v44, v42);
LABEL_20:

  return v23;
}

- (BOOL)currentSelectionContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextInteraction *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[UITextInteraction selection:containsPoint:](v5, "selection:containsPoint:", v7, x, y);

  return (char)v5;
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "rangeWithTextAlternatives:atPosition:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)distanceBetweenPoint:(CGPoint)a3 andRects:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = 3.40282347e38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "rect");
        UIDistanceBetweenPointAndRect(x, y, v12, v13, v14, v15);
        if (v10 > v16)
          v10 = v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 3.40282347e38;
  }

  return v10;
}

- (BOOL)shouldHandleFormGestureAtLocation:(CGPoint)a3
{
  UIView **p_view;
  id WeakRetained;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  char v9;
  CGPoint v11;

  v11 = a3;
  if (!WebKitFramework)
    return 1;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 1;
  v6 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v6, "formElement", *(_QWORD *)&v11.x, *(_QWORD *)&v11.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WebThreadLock();
    objc_msgSend(v6, "approximateNodeAtViewportLocation:", &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isSameNode:", v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)defaultTripleTapRecognizerWithAction:(SEL)a3
{
  UITextTapRecognizer *v3;

  v3 = -[UITextTapRecognizer initWithTarget:action:]([UITextTapRecognizer alloc], "initWithTarget:action:", self, a3);
  -[UITapGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 60.0);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 3);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
  return v3;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  LOBYTE(self) = -[UITextInteraction shouldHandleFormGestureAtLocation:](self, "shouldHandleFormGestureAtLocation:", v7, v9);
  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  -[UITextInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    if ((objc_msgSend(v5, "interactionShouldBegin:atPoint:", self, v9, v11) & 1) == 0)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v5, "interactionShouldBegin:", self))
  {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v6, "overrideGestureRecognizerShouldBegin:", v4)
    || !-[UITextInteraction interaction_gestureRecognizerShouldBegin:](self, "interaction_gestureRecognizerShouldBegin:", v4))
  {
    goto LABEL_10;
  }
  -[UITextInteraction updateTextInputSourceForScribbleGesture:](self, "updateTextInputSourceForScribbleGesture:", v4);
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)updateTextInputSourceForScribbleGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void (*v20)(id);
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = 0uLL;
    v33 = 0uLL;
    v30 = 0uLL;
    v31 = 0uLL;
    objc_msgSend(v4, "touchesForTap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v31;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        if (objc_msgSend(v9, "type") == 2)
          goto LABEL_20;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }
LABEL_19:

    v13 = 0;
LABEL_27:
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateTextInputKeyboardSource");
    goto LABEL_28;
  }
  v28 = 0uLL;
  v29 = 0uLL;
  v26 = 0uLL;
  v27 = 0uLL;
  objc_msgSend(v4, "_allActiveTouches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (!v10)
    goto LABEL_19;
  v11 = *(_QWORD *)v27;
LABEL_13:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v11)
      objc_enumerationMutation(v5);
    v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
    if (objc_msgSend(v9, "type") == 2)
      break;
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      if (v10)
        goto LABEL_13;
      goto LABEL_19;
    }
  }
LABEL_20:
  v13 = v9;

  if (!v13)
    goto LABEL_27;
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationInView:", v14);
  v16 = v15;
  v18 = v17;

  -[UITextInteraction view](self, "view");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v20 = (void (*)(id))off_1ECD81BB0;
  v38 = off_1ECD81BB0;
  if (!off_1ECD81BB0)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __getPKScribbleInteractionInViewSymbolLoc_block_invoke;
    v34[3] = &unk_1E16B14C0;
    v34[4] = &v35;
    __getPKScribbleInteractionInViewSymbolLoc_block_invoke(v34);
    v20 = (void (*)(id))v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PKScribbleInteractionWrapper> getPKScribbleInteractionInView(UIView *__strong)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("UITextInteraction.m"), 64, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v20(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_msgSend(v21, "shouldBeginAtLocation:", v16, v18);

    if (!v22)
      goto LABEL_27;
  }
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_updateTextInputPencilSource");
LABEL_28:

}

+ (double)_maximumBeamSnappingLength
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beamSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "maxSnapLength");
  v5 = v4;

  return v5;
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_beginSelectionChange
{
  void *v3;
  char v4;
  id v5;

  -[UITextInteraction view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_conformsToProtocolUIAsyncTextInputClient") & 1) == 0)
  {
    -[UITextInteraction view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_conformsToProtocolBETextInput");

    if ((v4 & 1) != 0)
      return;
    -[UITextInteraction view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginSelectionChange");
  }

}

- (void)_endSelectionChange
{
  void *v3;
  char v4;
  id v5;

  -[UITextInteraction view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_conformsToProtocolUIAsyncTextInputClient") & 1) == 0)
  {
    -[UITextInteraction view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_conformsToProtocolBETextInput");

    if ((v4 & 1) != 0)
      return;
    -[UITextInteraction view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endSelectionChange");
  }

}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (WebKitFramework && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v8 == v7)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "_hasSubviewContainingWebContent:", v8);
  }
  else
  {
    v10 = v7;
    -[UITextInteraction root](self, "root");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v10;
    if (v12)
    {
      -[UITextInteraction root](self, "root");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textInputView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v10, "isEqual:", v8) & 1) != 0 || (objc_msgSend(v13, "isDescendantOfView:", v8) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "_legacySelectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rangeView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v8)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v6, "_selectionViewManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "_isManagedSelectionSubview:", v8) & 1) != 0)
        {
          v9 = 1;
        }
        else if (_UITextViewAllowSelectionContainerInTextLayoutCanvas()
               && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v10, "selectionContainerView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v19 == v8;

        }
        else
        {
          v9 = 0;
        }

      }
    }

  }
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "_isPointerTouch");
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutomaticSelectionCommandsSuppressedForPointerTouchType:", v8);

  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "supportsIndirectInteractions");

  if ((_DWORD)v9
    && !-[UITextInteraction _shouldAllowEnforcedTouchTypeForTouch:forGestureRecognizer:](self, "_shouldAllowEnforcedTouchTypeForTouch:forGestureRecognizer:", v7, v6))
  {
    v13 = 0;
  }
  else
  {
    -[UITextInteraction assistantDelegate](self, "assistantDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v11, "overrideGestureRecognizer:shouldReceiveTouch:", v6, v7);
    else
      v12 = -[UITextInteraction interaction_gestureRecognizer:shouldReceiveTouch:](self, "interaction_gestureRecognizer:shouldReceiveTouch:", v6, v7);
    v13 = v12;

  }
  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  objc_msgSend(a4, "_pairedGestureIdentifiersAndCreate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "_pairedGestureIdentifiersAndCreate:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intersectsSet:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3
{
  return 0;
}

- (void)_presentTextEditMenuWithOverrideMenu:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_editMenuAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentEditMenuWithPreferredDirection:overrideMenu:", 0, v4);

}

- (NSArray)children
{
  return &self->_children->super;
}

- (NSArray)gestures
{
  return &self->_gestures->super;
}

- (NSDictionary)gestureMap
{
  return &self->_gestureMap->super;
}

- (UILongPressGestureRecognizer)_customHighlighterGesture
{
  return self->_customHighlighterGesture;
}

- (void)set_customHighlighterGesture:(id)a3
{
  objc_storeStrong((id *)&self->_customHighlighterGesture, a3);
}

- (BOOL)_allowsSelectionCommands
{
  return self->_allowsSelectionCommands;
}

- (void)_setAllowsSelectionCommands:(BOOL)a3
{
  self->_allowsSelectionCommands = a3;
}

- (_UIStatesFeedbackGenerator)feedbackBehaviour
{
  return self->_feedbackBehaviour;
}

- (void)setFeedbackBehaviour:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackBehaviour, a3);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UITextInteractionInputDelegate)interactionInputDelegate
{
  return self->_interactionInputDelegate;
}

- (void)setInteractionInputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_interactionInputDelegate, a3);
}

@end
