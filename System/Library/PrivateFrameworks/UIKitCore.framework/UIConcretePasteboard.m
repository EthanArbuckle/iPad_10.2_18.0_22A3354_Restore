@implementation UIConcretePasteboard

void __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  int8x16_t v20;

  v2 = *(unsigned __int8 *)(a1 + 64);
  if (*(_BYTE *)(a1 + 64))
  {
    v3 = 0;
  }
  else
  {
    _pasteboardCacheQueue_pasteboardForName(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "_pasteboardCacheQueue_isPersistent") && !*(_BYTE *)(a1 + 65))
    {
      _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        _pasteboardCacheQueue_removePasteboardForName(*(void **)(a1 + 32));
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = 0;

      }
    }
    return;
  }
  _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "_initWithName:", *(_QWORD *)(a1 + 32));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
LABEL_18:

    goto LABEL_19;
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v12 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "_initWithName:", *(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general")) & 1) != 0
      || !_UIApplicationIsExtension()
      || (dyld_program_sdk_at_least() & 1) == 0)
    {
      _notificationStateQueue();
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke_2;
      block[3] = &unk_1E16C2E60;
      v20 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      dispatch_sync(v11, block);
      goto LABEL_18;
    }
  }
LABEL_19:
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v15 && !*(_BYTE *)(a1 + 64))
  {
    v16 = *(id *)(a1 + 32);
    v17 = v15;
    _pasteboardCacheQueue_PasteboardNameToPasteboardMap();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v16);

  }
}

void __81___UIConcretePasteboard__pinItemProviders_forPasteboardNamed_withExpirationDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  _pasteboardCacheQueue_itemCollectionForName(*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general")))
      _getTemporaryLocalGeneralPasteboard(0);
    else
      _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D6C0C0]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke(uint64_t a1)
{
  _pasteboardCacheQueue_removeItemCollectionForName(*(void **)(a1 + 32));
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;

  v10 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not save pasteboard named %@. Error: %@"), v6, v5, v10);
  }
  else
  {
    _notificationStateQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_3;
    block[3] = &unk_1E16B1B28;
    v8 = v10;
    v12 = v8;
    dispatch_sync(v7, block);

    objc_msgSend(v8, "sharingToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSharingToken:", v9);

    v6 = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __45___UIConcretePasteboard__saveItemCollection___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "notificationState");
  _notificationStateQueue_notificationState = result;
  return result;
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_4(uint64_t a1)
{
  _pasteboardCacheQueue_setItemCollectionForName(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  _notificationStateQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_6;
  block[3] = &unk_1E16B9698;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_sync(v2, block);

}

uint64_t __45___UIConcretePasteboard__saveItemCollection___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_saveItemCollection:currentNotificationState:outNewNotificationState:", *(_QWORD *)(a1 + 40), _notificationStateQueue_notificationState);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __44___UIConcretePasteboard__pinItemCollection___block_invoke(uint64_t a1)
{
  _pasteboardCacheQueue_setPinnedItemCollectionForName(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40));
}

uint64_t __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_pasteboardCacheQueue_setPersistent:currentNotificationState:outNewNotificationState:", 1, _notificationStateQueue_notificationState);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __50___UIConcretePasteboard_removePasteboardWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _pasteboardCacheQueue_pasteboardForName(*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  _pasteboardCacheQueue_removePasteboardForName(*(void **)(a1 + 32));
  _pasteboardCacheQueue_removeItemCollectionForName(*(void **)(a1 + 32));
  _pasteboardCacheQueue_removePinnedItemCollectionForName(*(void **)(a1 + 32));
}

uint64_t __50___UIConcretePasteboard_removePasteboardWithName___block_invoke_2(uint64_t result)
{
  _notificationStateQueue_notificationState = *(_QWORD *)(result + 32);
  return result;
}

void __59___UIConcretePasteboard__attemptAuthenticationWithMessage___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&_pasteboardLastAuthenticatedMessage, *(id *)(a1 + 32));
}

uint64_t __37___UIConcretePasteboard_isPersistent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_isPersistent");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __40___UIConcretePasteboard__setPersistent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  __int128 v4;
  char v5;

  _notificationStateQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___UIConcretePasteboard__setPersistent___block_invoke_2;
  block[3] = &unk_1E16D9EC8;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  dispatch_sync(v2, block);

}

uint64_t __40___UIConcretePasteboard__setPersistent___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_setPersistent:currentNotificationState:outNewNotificationState:", *(unsigned __int8 *)(a1 + 48), _notificationStateQueue_notificationState);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __36___UIConcretePasteboard_changeCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(*(_QWORD *)(a1 + 32) + 8), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _pasteboardCacheQueue_countOffsetForName(*(void **)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "changeCount") + v2;

}

void __60___UIConcretePasteboard__changeCountIgnoringPinningActivity__block_invoke(uint64_t a1)
{
  id v2;

  _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(*(_QWORD *)(a1 + 32) + 8), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "changeCount");

}

void __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke_2;
  block[3] = &unk_1E16B1BF8;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke_2(uint64_t a1)
{
  return +[UIUndoGestureInteraction showSecurePasteConfirmationWithCompletionHandler:](UIUndoGestureInteraction, "showSecurePasteConfirmationWithCompletionHandler:", *(_QWORD *)(a1 + 32));
}

void __51___UIConcretePasteboard_pasteboardTypesForItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    objc_msgSend(v6, "name");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to query types for out-of-bounds pasteboard %@ item index %u. There are only %u items on the pasteboard."), v10, a2, objc_msgSend(v8, "count"));
  }
  else
  {
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "availableTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Pasteboard %@ item at index %u has no available types."), v9, a2);

    }
  }

}

void __59___UIConcretePasteboard_containsPasteboardTypes_inItemSet___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          if (objc_msgSend(v9, "hasRepresentationConformingToType:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            *a3 = 1;
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

void __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  dispatch_semaphore_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  dispatch_semaphore_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  dispatch_semaphore_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t *v35;
  void *v36;
  int v37;
  id v38;
  dispatch_semaphore_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  id v43;
  void *v44;
  dispatch_semaphore_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  _QWORD v49[4];
  NSObject *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__148;
  v57 = __Block_byref_object_dispose__148;
  v58 = 0;
  objc_msgSend(*(id *)(a1 + 32), "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    objc_msgSend(v6, "name");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to coerce types for out-of-bounds pasteboard %@ item index %u. There are only %u items on the pasteboard."), v10, a2, objc_msgSend(v20, "count"));

    goto LABEL_31;
  }
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  v10 = v8;
  v11 = v9;
  v86 = 0;
  v87 = (id *)&v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__148;
  v90 = __Block_byref_object_dispose__148;
  v91 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__148;
  v84 = __Block_byref_object_dispose__148;
  v85 = 0;
  +[_UIConcretePasteboard _loadRequestContextForBlockingUIKitCall](_UIConcretePasteboard, "_loadRequestContextForBlockingUIKitCall");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(UIPasteboardTypeListImage, "containsObject:", v11)
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    v66 = 0;
    v67 = (uint64_t)&v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__148;
    v70 = __Block_byref_object_dispose__148;
    v71 = 0;
    v13 = dispatch_semaphore_create(0);
    v14 = objc_opt_class();
    v73 = MEMORY[0x1E0C809B0];
    v74 = 3221225472;
    v75 = (uint64_t)___coerceItemToType_block_invoke;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16D9F88;
    v78 = &v66;
    v79 = &v80;
    v15 = v13;
    v77 = (void (*)(uint64_t))v15;
    v16 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v14, v12, &v73);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (*(_QWORD *)(v67 + 40))
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "isEqualToString:", v17);

      if (v18)
      {
        UIImagePNGRepresentation(*(UIImage **)(v67 + 40));
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v38 = v87[5];
        v87[5] = (id)v19;

        goto LABEL_20;
      }
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v11, "isEqualToString:", v36);

      if (v37)
      {
        _UIImageJPEGRepresentation(*(void **)(v67 + 40), 0, 0.9);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
LABEL_20:
    if (!v87[5])
      objc_storeStrong(v87 + 5, *(id *)(v67 + 40));
    _Block_object_dispose(&v66, 8);
    v35 = v71;
    goto LABEL_23;
  }
  if (objc_msgSend(UIPasteboardTypeListColor, "containsObject:", v11)
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    v21 = dispatch_semaphore_create(0);
    v22 = objc_opt_class();
    v73 = MEMORY[0x1E0C809B0];
    v74 = 3221225472;
    v75 = (uint64_t)___coerceItemToType_block_invoke_2;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16D9F88;
    v78 = &v86;
    v79 = &v80;
    v23 = v21;
    v77 = (void (*)(uint64_t))v23;
    v24 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v22, v12, &v73);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_24;
  }
  if (!objc_msgSend(UIPasteboardTypeListURL, "containsObject:", v11))
    goto LABEL_24;
  if (objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    v25 = dispatch_semaphore_create(0);
    v26 = objc_opt_class();
    v73 = MEMORY[0x1E0C809B0];
    v74 = 3221225472;
    v75 = (uint64_t)___coerceItemToType_block_invoke_3;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16D9F88;
    v78 = &v86;
    v79 = &v80;
    v27 = v25;
    v77 = (void (*)(uint64_t))v27;
    v28 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v26, v12, &v73);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (v87[5] || !objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
    goto LABEL_24;
  v59 = 0;
  v60 = (uint64_t)&v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__148;
  v63 = __Block_byref_object_dispose__148;
  v64 = 0;
  v29 = dispatch_semaphore_create(0);
  v30 = objc_opt_class();
  v66 = MEMORY[0x1E0C809B0];
  v67 = 3221225472;
  v68 = (uint64_t)___coerceItemToType_block_invoke_4;
  v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16D9F88;
  v71 = &v59;
  v72 = &v80;
  v31 = v29;
  v70 = (void (*)(uint64_t))v31;
  v32 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v30, v12, &v66);
  dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", *(_QWORD *)(v60 + 40), 0);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v87[5];
  v87[5] = (id)v33;

  _Block_object_dispose(&v59, 8);
  v35 = v64;
LABEL_23:

LABEL_24:
  if (!v87[5]
    && objc_msgSend(UIPasteboardTypeListString, "containsObject:", v11)
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    v39 = dispatch_semaphore_create(0);
    v40 = objc_opt_class();
    v59 = MEMORY[0x1E0C809B0];
    v60 = 3221225472;
    v61 = (uint64_t)___coerceItemToType_block_invoke_5;
    v62 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16D9F88;
    v64 = &v86;
    v65 = &v80;
    v41 = v39;
    v63 = (void (*)(uint64_t))v41;
    v42 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v40, v12, &v59);
    dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);

  }
  _recordHangAssertionIfNecessaryForResponseMetadata((void *)v81[5]);
  v43 = v87[5];

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  v44 = (void *)v54[5];
  v54[5] = (uint64_t)v43;

  if (!v54[5] && objc_msgSend(v10, "hasRepresentationConformingToType:", *(_QWORD *)(a1 + 40)))
  {
    v73 = 0;
    v74 = (uint64_t)&v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__148;
    v77 = __Block_byref_object_dispose__148;
    v78 = 0;
    v45 = dispatch_semaphore_create(0);
    v46 = *(_QWORD *)(a1 + 40);
    v47 = *(_QWORD *)(a1 + 48);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke_2;
    v49[3] = &unk_1E16D9F38;
    v51 = &v53;
    v52 = &v73;
    v48 = v45;
    v50 = v48;
    objc_msgSend(v10, "uikit_loadRepresentationAsType:context:completionBlock:", v46, v47, v49);
    dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

    _recordHangAssertionIfNecessaryForResponseMetadata(*(void **)(v74 + 40));
    _Block_object_dispose(&v73, 8);

  }
LABEL_31:

  if (v54[5])
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:");
  _Block_object_dispose(&v53, 8);

}

void __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v20 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v20)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v20;
    v14 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    objc_msgSend(v9, "readDataToEndOfFile");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
    goto LABEL_5;
  }
LABEL_6:
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v10;
  v19 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  dispatch_semaphore_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__148;
  v55 = __Block_byref_object_dispose__148;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__148;
  v49 = __Block_byref_object_dispose__148;
  v50 = 0;
  objc_msgSend(*(id *)(a1 + 32), "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "items");
    v12 = objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to retrieve data for out-of-bounds pasteboard %@ item index %u. There are only %u items on the pasteboard."), v8, a2, -[NSObject count](v12, "count"));
  }
  else
  {
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", 0x1E1759AC0))
    {
      v9 = dispatch_semaphore_create(0);
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(a1 + 48);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_2;
      v41[3] = &unk_1E16D9F88;
      v43 = &v51;
      v44 = &v45;
      v12 = v9;
      v42 = v12;
      v13 = (id)objc_msgSend(v8, "uikit_loadObjectOfClass:context:completionBlock:", v10, v11, v41);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      objc_msgSend(v8, "representationConformingToType:", *(_QWORD *)(a1 + 40));
      v14 = objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (v14)
      {
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 1;
        v15 = (void *)MEMORY[0x1E0CEC3F8];
        -[NSObject typeIdentifier](v14, "typeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_typeWithIdentifier:allowUndeclared:", v16, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "conformsToType:", *MEMORY[0x1E0CEC5C8]);
        v19 = MEMORY[0x1E0C809B0];
        if (v18)
        {
          v20 = dispatch_semaphore_create(0);
          v21 = *(_QWORD *)(a1 + 48);
          v32[0] = v19;
          v32[1] = 3221225472;
          v32[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_3;
          v32[3] = &unk_1E16D9FB0;
          v34 = &v51;
          v35 = &v37;
          v36 = &v45;
          v22 = v20;
          v33 = v22;
          v23 = (id)-[NSObject loadFileCopyWithContext:completion:](v12, "loadFileCopyWithContext:completion:", v21, v32);
          dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

        }
        if (*((_BYTE *)v38 + 24))
        {
          v24 = dispatch_semaphore_create(0);
          v25 = *(_QWORD *)(a1 + 48);
          v28[0] = v19;
          v28[1] = 3221225472;
          v28[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_4;
          v28[3] = &unk_1E16D9FD8;
          v30 = &v51;
          v31 = &v45;
          v26 = v24;
          v29 = v26;
          v27 = (id)-[NSObject loadDataWithContext:completion:](v12, "loadDataWithContext:completion:", v25, v28);
          dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

        }
        _Block_object_dispose(&v37, 8);
      }
    }
  }

  if (v52[5])
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:");
  _recordHangAssertionIfNecessaryForResponseMetadata((void *)v46[5]);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_2(uint64_t a1, UIImage *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    UIImagePNGRepresentation(a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v19 = 0;
    v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v19, *MEMORY[0x1E0C999D0], 0);
    v8 = v19;
    v9 = v8;
    if (v7 && objc_msgSend(v8, "BOOLValue"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v5, 1, 0);
      objc_msgSend(v10, "serializedRepresentation");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 2, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v6;
  v18 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __30___UIConcretePasteboard_items__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    v13 = v9;
    goto LABEL_18;
  }
  if (!v9 && v10)
  {
    objc_msgSend(v10, "readDataToEndOfFile");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(void **)(a1 + 32);
  v13 = v9;
  v15 = v14;
  v16 = v15;
  if (!v13)
    goto LABEL_12;
  if (!v15)
  {
    NSLog(CFSTR("%s must be called with a valid pasteboardType."), "_magicallyConvertDataToObject");
LABEL_12:
    v18 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(UIPasteboardTypeListImage, "containsObject:", v15))
  {
    if (!objc_msgSend(UIPasteboardTypeListColor, "containsObject:", v16))
    {
      if (objc_msgSend(UIPasteboardTypeListURL, "containsObject:", v16))
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v18 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((unint64_t)objc_msgSend(v28, "count") < 2)
          {
            v18 = 0;
          }
          else
          {
            v43 = v16;
            objc_msgSend(v28, "objectAtIndex:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", &stru_1E16EDF20);

            v31 = (void *)MEMORY[0x1E0C99E98];
            if (v30)
            {
              objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = v31;
              v34 = (void *)v32;
              objc_msgSend(v33, "URLWithString:encodingInvalidCharacters:", v32, 0);
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "URLWithString:encodingInvalidCharacters:", v40, 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                v41 = (void *)MEMORY[0x1E0C99E98];
                objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "URLWithString:relativeToURL:", v42, v34);
                v18 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v18 = 0;
              }
            }
            v16 = v43;

          }
        }

      }
      else
      {
        v44 = v16;
        objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v16, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        obj = UIPasteboardTypeListString;
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v48;
          while (2)
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v48 != v37)
                objc_enumerationMutation(obj);
              objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v46, "conformsToType:", v39) & 1) != 0)
              {
                v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:usedEncoding:", v13, 0);

                goto LABEL_34;
              }

            }
            v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
            if (v36)
              continue;
            break;
          }
        }

        v18 = v13;
LABEL_34:

        v16 = v44;
      }
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v16, "isEqual:", 0x1E1759AC0))
  {
LABEL_14:
    v19 = objc_opt_class();
    _UISecurelyDecodePasteboardDataToObject(v13, v19);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  +[UIImage imageWithData:](UIImage, "imageWithData:", v13);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v18 = (id)v17;
LABEL_16:

  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v18;

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(_QWORD *)(v22 + 40);
  v23 = (id *)(v22 + 40);
  if (!v24)
    objc_storeStrong(v23, v9);
LABEL_18:
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v11;
  v27 = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __42___UIConcretePasteboard_setItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0, 0);
}

void __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t __34___UIConcretePasteboard_addItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D6C0E0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_2;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 40);
  (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD, _QWORD *))v5 + 2))(v5, 0, v6, 0, 0, v8);

  return 0;
}

void __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32), 0, 0, 0, 0);
  return 0;
}

void __61___UIConcretePasteboard__setItemsAndSaveFromObjects_ofClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    _NSFullMethodName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(*(Class *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: Item %ld is not an object of type %@ [%@]"), v7, a3, v8, v10);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "present"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_3;
  v5[3] = &unk_1E16DA0F0;
  v6 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addPatternDetections:", v4);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "present"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "present"))
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    }
  }

}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_3;
  v5[3] = &unk_1E16DA0F0;
  v6 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addPatternDetections:", v4);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "present"))
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PBIndexOutOfRangeError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "present"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  id *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _pasteboardCompletionQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5;
    block[3] = &unk_1E16B2F48;
    v8 = &v19;
    v19 = a1[6];
    v9 = &v18;
    v18 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6;
    v15[3] = &unk_1E16DA0F0;
    v8 = &v16;
    v16 = a1[4];
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
    objc_msgSend(a1[5], "addPatternDetections:", v5);
    _pasteboardCompletionQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7;
    v12[3] = &unk_1E16B2F48;
    v9 = &v14;
    v14 = a1[6];
    v13 = a1[4];
    dispatch_async(v11, v12);

    v7 = v13;
  }

}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "present"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.link");
  v2[1] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.phone");
  v3[0] = &__block_literal_global_77_1;
  v3[1] = &__block_literal_global_80_0;
  v2[2] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.email");
  v2[3] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.address");
  v3[2] = &__block_literal_global_83;
  v3[3] = &__block_literal_global_86_2;
  v2[4] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.event");
  v2[5] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.shipment");
  v3[4] = &__block_literal_global_89_4;
  v3[5] = &__block_literal_global_92_0;
  v2[6] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.flight");
  v2[7] = CFSTR("com.apple.uikit.pasteboard-detection-pattern.dd.money");
  v3[6] = &__block_literal_global_95_0;
  v3[7] = &__block_literal_global_98_0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_7_8;
  _MergedGlobals_7_8 = v0;

}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B48];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B58];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B38];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B60];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_6(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B30];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_7(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B68];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B40];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_9(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CA9B50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDDScannerResult:", v3);

  return v4;
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  PBIndexOutOfRangeError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "present"))
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      objc_msgSend(v5, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientValueForValue:pattern:", v8, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    }
  }

}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  id *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[2];
  _QWORD block[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _pasteboardCompletionQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5;
    block[3] = &unk_1E16B2F48;
    v8 = &v21;
    v21 = *(id *)(a1 + 48);
    v9 = &v20;
    v20 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6;
    v17[3] = &unk_1E16DA2B8;
    v8 = (id *)v18;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 56);
    v18[0] = v11;
    v18[1] = v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);
    objc_msgSend(*(id *)(a1 + 40), "addPatternDetections:", v5);
    _pasteboardCompletionQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7;
    v14[3] = &unk_1E16B2F48;
    v9 = &v16;
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    dispatch_async(v13, v14);

    v7 = v15;
  }

}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "present"))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientValueForValue:pattern:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD, id);
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
    v7 = a3;
    v9(v3, 0, v7);
    v8 = 0;
  }

}

void __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (v17)
    v6 = v17;
  else
    v6 = v5;
  v7 = v6;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 8 * *(_QWORD *)(a1 + 56)), v6);
  v8 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  v10 = *(_QWORD *)(a1 + 64);
  if (v9 == v10 - 1)
  {
    if (v10)
    {
      v11 = 0;
      while (1)
      {
        v12 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;

        if ((unint64_t)++v11 >= *(_QWORD *)(a1 + 64))
          goto LABEL_11;
      }
      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v12);
    }
    else
    {
LABEL_11:
      v13 = *(_QWORD *)(a1 + 32);
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v12, 0);
    }

    if (*(_QWORD *)(a1 + 64))
    {
      v14 = 0;
      do
      {
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(void **)(v15 + 8 * v14);
        *(_QWORD *)(v15 + 8 * v14) = 0;

        ++v14;
      }
      while (v14 < *(_QWORD *)(a1 + 64));
    }
    free(*(void **)(a1 + 48));
  }

}

uint64_t __79___UIConcretePasteboard_detectPatternsForPatterns_inItemSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_UIConcretePasteboard _detectPatternsForPatterns:atIndex:itemCollection:completionHandler:](_UIConcretePasteboard, "_detectPatternsForPatterns:atIndex:itemCollection:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a3);
}

uint64_t __77___UIConcretePasteboard_detectValuesForPatterns_inItemSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_UIConcretePasteboard _detectValuesForPatterns:atIndex:itemCollection:completionHandler:](_UIConcretePasteboard, "_detectValuesForPatterns:atIndex:itemCollection:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a3);
}

void __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  _serverConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  objc_msgSend(v2, "requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:error:", v3, v4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  _pasteboardCompletionQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E16BB458;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
