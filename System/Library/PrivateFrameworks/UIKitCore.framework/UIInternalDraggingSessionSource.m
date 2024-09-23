@implementation UIInternalDraggingSessionSource

void __46___UIInternalDraggingSessionSource_beginDrag___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_didBeginDrag");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    objc_msgSend(*(id *)(a1 + 32), "setDruidConnection:", 0);
  }

}

void __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 88))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(_BYTE *)(v2 + 48))
    {
      v4 = 0;
    }
    else
    {
      +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_sendHandedOffDragImage");
      v2 = *(_QWORD *)(a1 + 32);
    }
    v3 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke_2;
    v6[3] = &unk_1E16B2100;
    v6[4] = v2;
    objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6, v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_sendHandedOffDragImageForItem:", v5);
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && !WeakRetained[88])
  {
    objc_msgSend(WeakRetained, "internalItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dragPreviewsOfItems(v8, v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendDragPreviewReplyWithIndexSet:dragPreviews:completion:", v10, v9, v5);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updatedPresentation:", v3);

}

uint64_t __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BYTE *WeakRetained;
  _BYTE *v7;
  int v8;
  BOOL v9;
  int v10;
  uint64_t v11;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!WeakRetained || !WeakRetained[48])
    goto LABEL_16;
  v8 = objc_msgSend((id)UIApp, "_canAnimateDragCancelInApp");
  if (v7[90])
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7[90])
      v10 = 0;
    else
      v10 = v8;
    if (v10 != 1)
      goto LABEL_16;
  }
  else if (!v7[89])
  {
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  if (!objc_msgSend(v7, "_canHandOffCancelledItems:", v5))
    goto LABEL_16;
  objc_msgSend(v7, "_setupAnimationForCancelledItems:returningLayerContext:", v5, a3);
  v11 = 1;
LABEL_17:

  return v11;
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", v5);
    objc_msgSend(WeakRetained, "_handOffCancelledItems:", v7);
    WeakRetained[10] = 5;
  }

}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_5(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  unint64_t v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 >= 3)
      v6 = 0;
    else
      v6 = a2 + 4;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setResultOperation:", a3);
    WeakRetained = v7;
    if (v7[9])
    {
      v7[10] = v6;
    }
    else
    {
      objc_msgSend(v7, "setState:", v6);
      WeakRetained = v7;
    }
  }

}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_sendDataTransferFinished");
    objc_msgSend(v3, "dragManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sessionSourceDidEnd:", v3);

    WeakRetained = v3;
  }

}

void __50___UIInternalDraggingSessionSource_dragDidExitApp__block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "state") == 2;
    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "druidConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dragDidExitApp");

      WeakRetained = v4;
    }
  }

}

uint64_t __91___UIInternalDraggingSessionSource__setupAnimationForCancelledItems_returningLayerContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

@end
