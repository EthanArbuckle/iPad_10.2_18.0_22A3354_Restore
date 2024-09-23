@implementation UIDictationCursorPositionRestorer

- (void)saveCursorLocationAndRestoreAfterPerforming:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__UIDictationCursorPositionRestorer_saveCursorLocationAndRestoreAfterPerforming_completion___block_invoke;
  v10[3] = &unk_1E16D7690;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:](self, "_withCurrentSelectionOffsets:", v10);

}

uint64_t __92__UIDictationCursorPositionRestorer_saveCursorLocationAndRestoreAfterPerforming_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "set_selectionStartOffsetFromBeginningPriorToOperation:", a2);
  objc_msgSend(*(id *)(a1 + 32), "set_selectionEndOffsetFromEndPriorToOperation:", a3);
  objc_msgSend(*(id *)(a1 + 32), "set_selectionLengthPriorToOperation:", a4);
  _UIDictationControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "_selectionStartOffsetFromBeginningPriorToOperation");
    v9 = objc_msgSend(*(id *)(a1 + 32), "_selectionEndOffsetFromEndPriorToOperation");
    v10 = objc_msgSend(*(id *)(a1 + 32), "_selectionLengthPriorToOperation");
    v12 = 136315906;
    v13 = "-[UIDictationCursorPositionRestorer saveCursorLocationAndRestoreAfterPerforming:completion:]_block_invoke";
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s Saving selection offsets prior to operation: selection start offset from beginning: %ld selection end offset from end: %ld selection length: %ld", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_restoreCursorLocationWithCompletion:", *(_QWORD *)(a1 + 48));
}

- (void)_withCurrentSelectionOffsets:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D87170]);
  objc_msgSend(v4, "setFlags:", 9);
  objc_msgSend(v4, "setTextGranularity:", 3);
  objc_msgSend(v4, "setSurroundingGranularityCount:", 3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTextInputPartnerPrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__UIDictationCursorPositionRestorer__withCurrentSelectionOffsets___block_invoke;
  v8[3] = &unk_1E16D4A60;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "_performDocumentRequest:completion:", v4, v8);

}

void __66__UIDictationCursorPositionRestorer__withCurrentSelectionOffsets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v26 = a1;
    objc_msgSend(v3, "documentState");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "selectedTextRange");
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject contextBeforeInput](v5, "contextBeforeInput");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_1E16EDF20;
    -[NSObject selectedText](v5, "selectedText");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1E16EDF20;
    -[NSObject contextAfterInput](v5, "contextAfterInput");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1E16EDF20;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), v10, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "length");
    v19 = objc_msgSend(v4, "selectedTextRange");
    v21 = v18 - (v19 + v20);
    objc_msgSend(v4, "selectedTextRange");
    v23 = v22;
    _UIDictationControllerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v28 = "-[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:]_block_invoke";
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v6;
      v33 = 2048;
      v34 = v21;
      v35 = 2048;
      v36 = v23;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "%s Got document of length %ld, selectionStartOffsetFromBeginning: %ld, selectionEndOffsetFromEnd: %ld,  selectionLength: %ld", buf, 0x34u);
    }

    v25 = *(_QWORD *)(v26 + 32);
    if (v25)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 16))(v25, v6, v21, v23, v18);

  }
  else
  {
    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:]_block_invoke";
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%s Received nil RTIDocumentState", buf, 0xCu);
    }
  }

}

- (void)_restoreCursorLocationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke;
  v6[3] = &unk_1E16D76E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:](self, "_withCurrentSelectionOffsets:", v6);

}

void __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  UIWKDocumentRequest *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  unint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    v49 = 2048;
    v50 = a2;
    v51 = 2048;
    v52 = a3;
    v53 = 2048;
    v54 = a4;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%s Cursor offsets after operation: selection start offset from beginning: %ld selection end offset from end: %ld selection length: %ld", buf, 0x2Au);
  }

  if (a4)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "_selectionStartOffsetFromBeginningPriorToOperation");
    v12 = objc_msgSend(*(id *)(a1 + 32), "_selectionLengthPriorToOperation");
    v13 = objc_msgSend(*(id *)(a1 + 32), "_selectionEndOffsetFromEndPriorToOperation");
    v14 = a4 + a2;
    if (v13 | a3)
    {
      v15 = v12 + v11;
      if (v15 < a2)
      {
        _UIDictationControllerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "%s Prior cursor position is before the new selection start, so maintaining prior cursor offset from beginning", buf, 0xCu);
        }
        v14 = v15;
        goto LABEL_21;
      }
      if (v13 >= a3)
      {
        _UIDictationControllerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          v19 = "%s Prior cursor position is within new selection, so using new selection end as target";
          goto LABEL_20;
        }
      }
      else
      {
        v14 = a5 - v13;
        _UIDictationControllerLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          v19 = "%s Prior cursor position is after the new selection end, so maintaining prior cursor offset from end";
          goto LABEL_20;
        }
      }
    }
    else
    {
      _UIDictationControllerLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
        v19 = "%s Prior cursor position was end of text and so was new selection end, so maintaining cursor at end";
LABEL_20:
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }
LABEL_21:

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inputDelegateManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "hasAsyncCapableInputDelegate"))
    {
      v22 = objc_alloc_init(UIWKDocumentRequest);
      -[UIWKDocumentRequest setFlags:](v22, "setFlags:", 1);
      -[UIWKDocumentRequest setSurroundingGranularity:](v22, "setSurroundingGranularity:", 3);
      -[UIWKDocumentRequest setGranularityCount:](v22, "setGranularityCount:", 3);
      objc_msgSend(v21, "textInputView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "visibleBounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      objc_msgSend(v21, "textInteractionAssistant");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEditing");

      if (v34)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "subtractKeyboardFrameFromRect:inView:", v23, v25, v27, v29, v31);
        v25 = v36;
        v27 = v37;
        v29 = v38;
        v31 = v39;

      }
      -[UIWKDocumentRequest setDocumentRect:](v22, "setDocumentRect:", v25, v27, v29, v31);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_8;
      v43[3] = &unk_1E16D76B8;
      v46 = v14;
      v44 = v21;
      v45 = *(id *)(a1 + 40);
      objc_msgSend(v44, "requestDocumentContext:completionHandler:", v22, v43);

    }
    else
    {
      objc_msgSend(v21, "beginningOfDocument");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "positionFromPosition:offset:", v40, v14);
      v22 = (UIWKDocumentRequest *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "textRangeFromPosition:toPosition:", v22, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _UIDictationControllerLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
        v49 = 2048;
        v50 = v14;
        _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "%s Moving selection to index %ld", buf, 0x16u);
      }

      objc_msgSend(v21, "setSelectedTextRange:", v23);
      v42 = *(_QWORD *)(a1 + 40);
      if (v42)
        (*(void (**)(void))(v42 + 16))();
    }

    return;
  }
  _UIDictationControllerLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "%s New selection is empty, so skipping attempt to restore cursor location", buf, 0xCu);
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();
}

void __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "directionalRangeForSelectionRange:", *(_QWORD *)(a1 + 48), 0);
  v5 = v4;
  _UIDictationControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    v12 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    v13 = 2048;
    v14 = v7;
    v15 = 2048;
    v16 = v3;
    v17 = 2048;
    v18 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%s WebKit moving selection to index %ld using directional range (offset: %ld, length: %ld)", buf, 0x2Au);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_9;
  v9[3] = &unk_1E16B1BF8;
  v8 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "adjustSelection:completionHandler:", v3, v5, v9);

}

uint64_t __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "%s WebKit completed adjusting of selection", (uint8_t *)&v4, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)_selectionStartOffsetFromBeginningPriorToOperation
{
  return self->__selectionStartOffsetFromBeginningPriorToOperation;
}

- (void)set_selectionStartOffsetFromBeginningPriorToOperation:(unint64_t)a3
{
  self->__selectionStartOffsetFromBeginningPriorToOperation = a3;
}

- (unint64_t)_selectionEndOffsetFromEndPriorToOperation
{
  return self->__selectionEndOffsetFromEndPriorToOperation;
}

- (void)set_selectionEndOffsetFromEndPriorToOperation:(unint64_t)a3
{
  self->__selectionEndOffsetFromEndPriorToOperation = a3;
}

- (unint64_t)_selectionLengthPriorToOperation
{
  return self->__selectionLengthPriorToOperation;
}

- (void)set_selectionLengthPriorToOperation:(unint64_t)a3
{
  self->__selectionLengthPriorToOperation = a3;
}

@end
