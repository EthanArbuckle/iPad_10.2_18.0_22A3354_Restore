@implementation PSInteractionAndContactMonitor

void __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "_PSInteractionAndContactMonitor: Contact store changed, processing changes", buf, 2u);
    }

    v3 = WeakRetained[9];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_7;
    block[3] = &unk_1E43FEB68;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyWhenContactStoreChanged");
}

uint64_t __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69___PSInteractionAndContactMonitor_fetchAllContactIdsFromContactStore__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __CFSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1A1AFCA24]();
  v4 = *(__CFSet **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v8, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFSetAddValue(v4, (const void *)objc_msgSend(v5, "_ps_pointerSizedHash"));

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ps_appendObject:truncatingToCount:", v7, 32);

  objc_autoreleasePoolPop(v3);
}

uint64_t __73___PSInteractionAndContactMonitor_fetchChangedContactIdsFromContactStore__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = CFSetContainsValue(*(CFSetRef *)(*(_QWORD *)(a1 + 32) + 56), (const void *)objc_msgSend(a2, "_ps_pointerSizedHash"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

void __66___PSInteractionAndContactMonitor_enumerateContactStoreWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x1A1AFCA24]();
  v4 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count") <= 0x1F)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  objc_autoreleasePoolPop(v3);
}

@end
