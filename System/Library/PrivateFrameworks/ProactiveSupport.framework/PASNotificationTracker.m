@implementation PASNotificationTracker

void __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v4, "group");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke_2;
  block[3] = &unk_1E442F090;
  v9 = v4;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v7 = v4;
  dispatch_group_async(v5, v6, block);

}

void __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke_2(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void (**v4)(_QWORD, _QWORD);

  v2 = (void *)MEMORY[0x1A1AFDC98]();
  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

@end
