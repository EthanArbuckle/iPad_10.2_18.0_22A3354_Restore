@implementation UIDictationStreamingOperations

- (UIDictationStreamingOperations)init
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDictationStreamingOperations;
  v2 = -[UIDictationStreamingOperations init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOperations:", v3);

    *(_OWORD *)(v2 + 8) = xmmword_186680890;
    v4 = v2;
  }

  return (UIDictationStreamingOperations *)v2;
}

- (void)clearOperations
{
  void *v3;

  -[UIDictationStreamingOperations operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_popAndInvoke, 0);
}

- (BOOL)hasOperations
{
  void *v2;
  BOOL v3;

  -[UIDictationStreamingOperations operations](self, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)pop
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIDictationStreamingOperations operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[UIDictationStreamingOperations operations](self, "operations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDictationStreamingOperations operations](self, "operations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (double)delayAfterSelector:(SEL)a3
{
  void *v4;
  double v5;
  void *v6;

  -[UIDictationStreamingOperations operations](self, "operations", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    -[UIDictationStreamingOperations operations](self, "operations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (double)(unint64_t)objc_msgSend(v6, "count") * 0.5;

  }
  return 1.0 / v5 * self->_timeAfterInsertion;
}

- (void)popAndInvoke
{
  void *v3;

  if (-[UIDictationStreamingOperations hasOperations](self, "hasOperations"))
  {
    if (-[UIDictationStreamingOperations hasOperations](self, "hasOperations"))
    {
      do
      {
        -[UIDictationStreamingOperations pop](self, "pop");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "start");

      }
      while (-[UIDictationStreamingOperations hasOperations](self, "hasOperations"));
    }
    +[UIDictationController poppedLastStreamingOperation](UIDictationController, "poppedLastStreamingOperation");
  }
}

- (void)pushSpeechOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIDictationStreamingOperations operations](self, "operations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)pushSpeechOperationWithSelectionChangeDelta:(int64_t)a3 block:(id)a4
{
  void (**v6)(void);
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  if (-[UIDictationStreamingOperations isEmpty](self, "isEmpty"))
  {
    v8[2]();
    v6 = v8;
  }
  else
  {
    +[NSBlockOperation blockOperationWithBlock:](UIDictationStreamingOperation, "blockOperationWithBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSelectionChangeDelta:", a3);
    -[UIDictationStreamingOperations pushSpeechOperation:](self, "pushSpeechOperation:", v7);
    v6 = (void (**)(void))v7;
  }

}

- (void)performSelectRangeForSpeech:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  UITextInput *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  length = a3.length;
  location = a3.location;
  v6 = self->_document;
  -[UITextInput beginningOfDocument](v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput positionFromPosition:inDirection:offset:](v6, "positionFromPosition:inDirection:offset:", v7, 2, location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextInput positionFromPosition:inDirection:offset:](v6, "positionFromPosition:inDirection:offset:", v8, 2, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput textRangeFromPosition:toPosition:](v6, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextInput setSelectedTextRange:](self->_document, "setSelectedTextRange:", v10);
}

- (void)setDocument:(id)a3
{
  UITextInput *v5;
  UITextInput *v6;

  v5 = (UITextInput *)a3;
  if (self->_document != v5)
  {
    v6 = v5;
    -[UIDictationStreamingOperations clearOperations](self, "clearOperations");
    objc_storeStrong((id *)&self->_document, a3);
    v5 = v6;
  }

}

- (void)pushSelectRangeForSpeech:(_NSRange)a3
{
  NSUInteger length;
  void *v4;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10[3];
  id location[2];

  if (self->_document)
  {
    length = a3.length;
    v4 = (void *)a3.location;
    objc_initWeak(location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__UIDictationStreamingOperations_pushSelectRangeForSpeech___block_invoke;
    v9[3] = &unk_1E16BE7C0;
    objc_copyWeak(v10, location);
    v10[1] = v4;
    v10[2] = (id)length;
    -[UIDictationStreamingOperations pushSpeechOperationWithSelectionChangeDelta:block:](self, "pushSpeechOperationWithSelectionChangeDelta:block:", -(uint64_t)length, v9);
    objc_destroyWeak(v10);
    objc_destroyWeak(location);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }

  }
  else
  {
    v6 = pushSelectRangeForSpeech____s_category;
    if (!pushSelectRangeForSpeech____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&pushSelectRangeForSpeech____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
}

void __59__UIDictationStreamingOperations_pushSelectRangeForSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectRangeForSpeech:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)pushInsertTextForSpeech:(id)a3
{
  id v4;
  UITextInput *document;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location[2];

  v4 = a3;
  document = self->_document;
  if (document)
  {
    objc_initWeak(location, document);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__UIDictationStreamingOperations_pushInsertTextForSpeech___block_invoke;
    v9[3] = &unk_1E16B1500;
    objc_copyWeak(&v11, location);
    v10 = v4;
    -[UIDictationStreamingOperations pushSpeechOperationWithSelectionChangeDelta:block:](self, "pushSpeechOperationWithSelectionChangeDelta:block:", 1, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }

  }
  else
  {
    v6 = pushInsertTextForSpeech____s_category;
    if (!pushInsertTextForSpeech____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&pushInsertTextForSpeech____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }

}

void __58__UIDictationStreamingOperations_pushInsertTextForSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "insertText:", *(_QWORD *)(a1 + 32));

}

- (void)_performReplaceSelectedText:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  UITextInput *document;
  UITextInput *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  document = self->_document;
  if (has_internal_diagnostics)
  {
    if (!document)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more edit notifications if dictation is stopped.", buf, 2u);
      }

    }
  }
  else if (!document)
  {
    v10 = _performReplaceSelectedText____s_category;
    if (!_performReplaceSelectedText____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_performReplaceSelectedText____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more edit notifications if dictation is stopped.", v12, 2u);
    }
  }
  v7 = self->_document;
  -[UITextInput selectedTextRange](v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput replaceRange:withText:](v7, "replaceRange:withText:", v8, v4);

}

- (void)pushReplaceSelectionWithText:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  UITextInput *document;
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location[2];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  document = self->_document;
  if (has_internal_diagnostics)
  {
    if (!document)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more edit notifications if dictation is stopped.", (uint8_t *)location, 2u);
      }

    }
  }
  else if (!document)
  {
    v9 = pushReplaceSelectionWithText____s_category;
    if (!pushReplaceSelectionWithText____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&pushReplaceSelectionWithText____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more edit notifications if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
  objc_initWeak(location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__UIDictationStreamingOperations_pushReplaceSelectionWithText___block_invoke;
  v11[3] = &unk_1E16B1500;
  objc_copyWeak(&v13, location);
  v7 = v4;
  v12 = v7;
  -[UIDictationStreamingOperations pushSpeechOperationWithSelectionChangeDelta:block:](self, "pushSpeechOperationWithSelectionChangeDelta:block:", 1, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(location);

}

void __63__UIDictationStreamingOperations_pushReplaceSelectionWithText___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performReplaceSelectedText:", *(_QWORD *)(a1 + 32));

}

- (void)willEndEditingInInputDelegate:(id)a3
{
  UITextInput *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = (UITextInput *)a3;
  if (self->_document == v4)
  {
    -[UIDictationStreamingOperations setDocument:](self, "setDocument:", 0);
    -[UIDictationStreamingOperations clearOperations](self, "clearOperations");
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "We were never set up properly to stream in this document.", buf, 2u);
    }

  }
  else
  {
    v5 = willEndEditingInInputDelegate____s_category;
    if (!willEndEditingInInputDelegate____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&willEndEditingInInputDelegate____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "We were never set up properly to stream in this document.", v8, 2u);
    }
  }

}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[UIDictationStreamingOperations operations](self, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isNotEmpty
{
  void *v2;
  BOOL v3;

  -[UIDictationStreamingOperations operations](self, "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (unint64_t)selectionChangeDelta
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  -[UIDictationStreamingOperations operations](self, "operations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "selectionChangeDelta");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_storeStrong((id *)&self->_operations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
