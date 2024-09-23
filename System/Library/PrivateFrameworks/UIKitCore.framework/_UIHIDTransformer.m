@implementation _UIHIDTransformer

- (id)_inputEventsForHIDEvent:(__IOHIDEvent *)a3 contextId:(unsigned int)a4
{
  uint64_t v4;
  int v5;
  int Type;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  _BOOL4 v14;
  int v15;
  id v16;
  const __CFArray *Children;
  const __CFArray *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v33;
  uint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v4 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x1E0C80C00];
  v5 = _UIEventHIDShouldTransformEvent();
  Type = IOHIDEventGetType();
  +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_userInterfaceIdiom");

  kdebug_trace();
  if (qword_1ECD7FA40 != -1)
    dispatch_once(&qword_1ECD7FA40, &__block_literal_global_458);
  if (_MergedGlobals_1198)
  {
    v10 = qword_1ECD7FA38;
    if (!qword_1ECD7FA38)
    {
      v10 = __UILogCategoryGetNode("HIDTransformer", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7FA38);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      v36 = v5;
      v37 = 1024;
      v38 = Type;
      v39 = 1024;
      v40 = v4;
      v41 = 2048;
      v42 = v7;
      v43 = 2048;
      v44 = v9;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Should consider event transformation: %d; backing type: %i; contextId: 0x%X; window: %p; idiom: %li",
        buf,
        0x28u);
    }
  }
  if (v5)
  {
    v12 = objc_msgSend((id)UIApp, "_supportsIndirectInputEvents");
    if (v12)
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v13 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1
        || (v33 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldIncludeTranslationHIDEvent))
      {
        v14 = 1;
      }
      else
      {
        do
        {
          v14 = v13 >= v33;
          if (v13 < v33)
            break;
          _UIInternalPreferenceSync(v13, &_UIInternalPreference_ShouldIncludeTranslationHIDEvent, (uint64_t)CFSTR("ShouldIncludeTranslationHIDEvent"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v33 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent;
        }
        while (v13 != _UIInternalPreference_ShouldIncludeTranslationHIDEvent);
      }
      if (byte_1ECD75E4C)
        v15 = 1;
      else
        v15 = v14;
    }
    else
    {
      v15 = 0;
    }
    if (IOHIDEventGetType() != 17)
    {
      v27 = &unk_1E1A947C0;
LABEL_62:
      v16 = v27;
      goto LABEL_63;
    }
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (v18 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      v20 = Count;
      v21 = 0;
      v22 = 0;
      do
      {
        CFArrayGetValueAtIndex(v18, v21);
        v23 = IOHIDEventGetType() - 4;
        if (v12)
        {
          switch(v23)
          {
            case 0:
              if (!v22)
                v22 = (id)objc_opt_new();
              if (v15)
                goto LABEL_36;
              goto LABEL_44;
            case 1:
            case 3:
              if (!v22)
                v22 = (id)objc_opt_new();
LABEL_36:
              if ((objc_msgSend(v22, "containsObject:", &unk_1E1A99FF0) & 1) != 0)
                goto LABEL_44;
              v24 = v22;
              v25 = &unk_1E1A99FF0;
              break;
            case 2:
              goto LABEL_30;
            default:
              goto LABEL_44;
          }
        }
        else
        {
          switch(v23)
          {
            case 0:
              if (!v22)
                v22 = (id)objc_opt_new();
              if (v15)
                goto LABEL_41;
              goto LABEL_44;
            case 1:
            case 3:
              if (!v22)
                v22 = (id)objc_opt_new();
LABEL_41:
              if ((objc_msgSend(v22, "containsObject:", &unk_1E1A9A008) & 1) != 0)
                goto LABEL_44;
              v24 = v22;
              v25 = &unk_1E1A9A008;
              break;
            case 2:
LABEL_30:
              if (!v22)
                v22 = (id)objc_opt_new();
              v24 = v22;
              v25 = &unk_1E1A99FD8;
              break;
            default:
              goto LABEL_44;
          }
        }
        objc_msgSend(v24, "addObject:", v25);
LABEL_44:
        ++v21;
      }
      while (v20 != v21);
      if (v22)
      {
        if (!objc_msgSend(v22, "isEqualToArray:", &unk_1E1A947D8))
          goto LABEL_60;
        v26 = 0;
LABEL_51:
        if (IOHIDEventGetIntegerValue())
        {
          v28 = 3;
        }
        else
        {
          BKSHIDEventGetPointerAttributes();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "pointerState") == 3)
            v28 = 2;
          else
            v28 = 1;

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if ((v26 & 1) != 0)
        {
          v34 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_61:
          goto LABEL_62;
        }
        objc_msgSend(v22, "addObject:", v30);

LABEL_60:
        v22 = v22;
        v27 = v22;
        goto LABEL_61;
      }
    }
    else
    {
      v22 = 0;
    }
    v26 = 1;
    goto LABEL_51;
  }
  v16 = &unk_1E1A947C0;
LABEL_63:

  return v16;
}

- (id)handleHIDEvent:(__IOHIDEvent *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSMutableDictionary *hidContextByContextId;
  void *v12;
  _UIHIDContext *v13;
  _UIHIDContext *hidContext;
  _UIHIDContext *v15;
  _UIHIDContext *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t j;
  __CFString *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  _UIHIDContext *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _UIHIDContext *v42;
  void *v43;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  __IOHIDEvent *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  BKSHIDEventGetBaseAttributes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contextID");

  -[_UIHIDTransformer _inputEventsForHIDEvent:contextId:](self, "_inputEventsForHIDEvent:contextId:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (!v9)
    {
      v10 = qword_1ECD7FA28;
      if (!qword_1ECD7FA28)
      {
        v10 = __UILogCategoryGetNode("HIDTransformer", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7FA28);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v45 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = a3;
          _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_ERROR, "No input event specified for HIDEvent:\n%@", buf, 0xCu);
        }
      }
    }
  }
  self->_hidEvent = a3;
  hidContextByContextId = self->_hidContextByContextId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hidContextByContextId, "objectForKeyedSubscript:", v12);
  v13 = (_UIHIDContext *)objc_claimAutoreleasedReturnValue();
  hidContext = self->_hidContext;
  self->_hidContext = v13;

  if (!self->_hidContext)
  {
    v15 = (_UIHIDContext *)objc_opt_new();
    v16 = self->_hidContext;
    self->_hidContext = v15;

    v17 = self->_hidContextByContextId;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v15, v18);

    self->_hidContext->state = 1;
  }
  v19 = v7;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(v19);
        v22 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
    }
    while (v21);
  }
  else
  {
    LODWORD(v22) = 0;
  }

  kdebug_trace();
  if (qword_1ECD7FA40 != -1)
    dispatch_once(&qword_1ECD7FA40, &__block_literal_global_458);
  if (_MergedGlobals_1198)
  {
    v25 = (void *)objc_opt_new();
    for (j = 0; j != 9; ++j)
    {
      if ((v22 & (1 << j)) != 0)
      {
        if (objc_msgSend(v25, "length"))
          v27 = CFSTR(", ");
        else
          v27 = &stru_1E16EDF20;
        objc_msgSend(v25, "appendFormat:", CFSTR("%s%s"), -[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String"), -[__CFString UTF8String](objc_retainAutorelease(_UIHIDInputEventString[j]), "UTF8String"));
      }
    }
    v28 = objc_retainAutorelease(v25);
    v29 = objc_msgSend(v28, "UTF8String");
    v30 = qword_1ECD7FA30;
    if (!qword_1ECD7FA30)
    {
      v30 = __UILogCategoryGetNode("HIDTransformer", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&qword_1ECD7FA30);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_hidContext;
      v33 = objc_retainAutorelease(_UIStateString[v32->state]);
      v34 = v31;
      v35 = objc_msgSend(v33, "UTF8String");
      *(_DWORD *)buf = 134218498;
      v56 = (__IOHIDEvent *)v32;
      v57 = 2080;
      v58 = v35;
      v59 = 2080;
      v60 = v29;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_DEFAULT, "State machine: hidContext: %p; state: %s; events for event: %s",
        buf,
        0x20u);

    }
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v36 = v19;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v47;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v40), "unsignedIntegerValue");
        if (qword_1ECD7FA50 != -1)
          dispatch_once(&qword_1ECD7FA50, &__block_literal_global_127_0);
        handleEvent(&xmmword_1ECD7FA60, self->_hidContext->state, v41, (uint64_t)self, (uint64_t *)&self->_hidContext->state);
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v38);
  }

  self->_hidEvent = 0;
  v42 = self->_hidContext;
  self->_hidContext = 0;

  -[_UIHIDTransformer drainOutputHIDEvents](self, "drainOutputHIDEvents");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)drainOutputHIDEvents
{
  void *v3;

  v3 = (void *)-[NSMutableArray copy](self->_hidEvents, "copy");
  -[NSMutableArray removeAllObjects](self->_hidEvents, "removeAllObjects");
  return v3;
}

- (void)addOutputHIDEvent:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_hidEvents, "addObject:");
}

- (_UIHIDTransformer)initWithRunLoop:(__CFRunLoop *)a3
{
  _UIHIDTransformer *v4;
  uint64_t v5;
  NSMutableArray *hidEvents;
  uint64_t v7;
  NSMutableDictionary *hidContextByContextId;
  void *v9;
  __CFString *v10;
  id v11;
  _QWORD v13[4];
  _UIHIDTransformer *v14;
  __CFRunLoop *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIHIDTransformer;
  v4 = -[_UIHIDTransformer init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    hidEvents = v4->_hidEvents;
    v4->_hidEvents = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    hidContextByContextId = v4->_hidContextByContextId;
    v4->_hidContextByContextId = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _UIWindowDidDetachContextNotification;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37___UIHIDTransformer_initWithRunLoop___block_invoke;
    v13[3] = &unk_1E16DF328;
    v15 = a3;
    v14 = v4;
    v11 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v13);

  }
  return v4;
}

- (_QWORD)pathCollection
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = a1[1];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_pathCollection, v1, CFSTR("_UIHIDTransformer.m"), 423, CFSTR("Attempting to access a path collection when no hidEvent is being processed"));

      v2 = v1[1];
    }
    v3 = *(void **)(v2 + 8);
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      v4 = v1[1];
      v5 = *(void **)(v4 + 8);
      *(_QWORD *)(v4 + 8) = v3;

    }
    a1 = v3;
  }
  return a1;
}

- (_QWORD)scaleEventTracker
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;

  if (a1)
  {
    v1 = a1;
    v2 = a1[1];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_scaleEventTracker, v1, CFSTR("_UIHIDTransformer.m"), 429, CFSTR("Attempting to access a scaleEventTracker when no hidEvent is being processed"));

      v2 = v1[1];
    }
    v3 = *(void **)(v2 + 16);
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      v4 = v1[1];
      v5 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = v3;

    }
    a1 = v3;
  }
  return a1;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidContextByContextId, 0);
  objc_storeStrong((id *)&self->_hidEvents, 0);
  objc_storeStrong((id *)&self->_hidContext, 0);
}

@end
