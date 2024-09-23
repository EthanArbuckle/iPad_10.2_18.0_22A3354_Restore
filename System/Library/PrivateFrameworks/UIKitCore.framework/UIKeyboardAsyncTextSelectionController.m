@implementation UIKeyboardAsyncTextSelectionController

void __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  __int128 v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_2;
  v3[3] = &unk_1E16BB350;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v3);

}

void __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  v6 = objc_msgSend(*(id *)(a1 + 40), "conformsToProtocolCached:", &unk_1EE0CE288);
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    if (objc_msgSend(v7, "hasMarkedText"))
    {
      v8 = *(id *)(a1 + 40);
      objc_msgSend(v8, "updateCurrentSelectionTo:fromGesture:inState:", 14, 2, *(double *)(a1 + 48), *(double *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didChangePhraseBoundary");

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "conformsToProtocolCached:", &unk_1EE09F2A0);
    if (objc_msgSend(*(id *)(a1 + 40), "hasMarkedText"))
    {
      objc_msgSend(*(id *)(a1 + 40), "changeSelectionWithGestureAt:withGesture:withState:", 14, 2, *(double *)(a1 + 48), *(double *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "inputDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didChangePhraseBoundary");
        goto LABEL_8;
      }
    }
  }
LABEL_10:
  objc_msgSend(v17, "returnExecutionToParent");

}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_2;
  v3[3] = &unk_1E16BAF98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "transferExecutionToMainThreadWithTask:", v3);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollSelectionToVisible:", 0);

  objc_msgSend(v8, "returnExecutionToParent");
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_4;
  v3[3] = &unk_1E16BAF98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "transferExecutionToMainThreadWithTask:", v3);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollSelectionToVisible:", 0);

  objc_msgSend(v8, "returnExecutionToParent");
}

uint64_t __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_5(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_6;
  v3[3] = &unk_1E16BAF98;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "transferExecutionToMainThreadWithTask:", v3);
}

void __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollSelectionToVisible:", 0);

  objc_msgSend(v8, "returnExecutionToParent");
}

_BYTE *__94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BYTE *result;
  void *v5;
  _QWORD v6[6];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_2;
    v6[3] = &unk_1E16BBA90;
    v3 = *(_QWORD *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 40);
    v6[5] = v3;
    return (_BYTE *)objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setSelectionGranularity:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "showSelectionView");
    objc_msgSend(*(id *)(a1 + 40), "selectionInteractionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSelectionRects:", 1);

    objc_msgSend(*(id *)(a1 + 40), "scrollSelectionToVisible");
    result = *(_BYTE **)(a1 + 40);
    if (result[96])
      return (_BYTE *)objc_msgSend(result, "showSelectionCommands");
  }
  return result;
}

void __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "setSelectionGranularity:", v3);
  objc_msgSend(*(id *)(a1 + 32), "scrollSelectionToVisible");
  objc_msgSend(v5, "returnExecutionToParent");

}

uint64_t __95___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 56) == 1 && objc_msgSend(*(id *)(a1 + 32), "isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 40), "inputDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_rangeOfSmartSelectionIncludingRange:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && (objc_msgSend(v3, "isEmpty") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "inputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSelectedTextRange:", v3);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setSelectionGranularity:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "showSelectionView");
  objc_msgSend(*(id *)(a1 + 40), "selectionInteractionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSelectionRects:", 1);

  objc_msgSend(*(id *)(a1 + 40), "scrollSelectionToVisible");
  v6 = *(_BYTE **)(a1 + 40);
  if (v6[96])
    objc_msgSend(v6, "showSelectionCommands");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_2;
  v4[3] = &unk_1E16BBCF8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = a2;
  return objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v4);
}

void __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v16 = a2;
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForPosition:", v7);

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "caretRectForPosition:", v11);

  LODWORD(v10) = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)v10)
    objc_msgSend(v13, "end");
  else
    objc_msgSend(v13, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v15);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(v16, "returnExecutionToParent");

}

uint64_t __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_2;
  v4[3] = &unk_1E16BBCF8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = a2;
  return objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v4);
}

void __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v16 = a2;
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForPosition:", v7);

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "caretRectForPosition:", v11);

  LODWORD(v10) = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)v10)
    objc_msgSend(v13, "end");
  else
    objc_msgSend(v13, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v15);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(v16, "returnExecutionToParent");

}

uint64_t __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_2;
  v4[3] = &unk_1E16BBCF8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = a2;
  return objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v4);
}

void __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v4, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "end");
  else
    objc_msgSend(v6, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCursorPosition:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setSelectionGranularity:", 0);
  objc_msgSend(v9, "returnExecutionToParent");

}

@end
