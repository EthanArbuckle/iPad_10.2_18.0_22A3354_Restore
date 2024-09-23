@implementation SearchUICalendarStore

+ (id)sharedCalendarStore
{
  void *v2;

  v2 = (void *)sharedCalendarStore_calendarStore;
  if (!sharedCalendarStore_calendarStore)
  {
    if (sharedCalendarStore_onceToken != -1)
      dispatch_once(&sharedCalendarStore_onceToken, &__block_literal_global_6);
    v2 = (void *)sharedCalendarStore_calendarStore;
  }
  return v2;
}

void __44__SearchUICalendarStore_sharedCalendarStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCalendarStore_calendarStore;
  sharedCalendarStore_calendarStore = v0;

}

+ (void)fetchCalendarItemFromEventIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICalendarStore sharedCalendarStore](SearchUICalendarStore, "sharedCalendarStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1EA1F6778;
  v12 = v7;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v10, "requestFullAccessToEventsWithCompletion:", v11);

}

void __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarItemsWithExternalIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v10 = 0;
    if (!v5)
      goto LABEL_8;
  }
  SearchUIGeneralLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v6, v11);

LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)eventControllerWithIdentifier:(id)a3
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

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICalendarStore sharedCalendarStore](SearchUICalendarStore, "sharedCalendarStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarItemsWithExternalIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUICalendarStore sharedCalendarStore](SearchUICalendarStore, "sharedCalendarStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventWithUniqueId:occurrenceDate:", v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA228]), "initWithEvent:", v14);
  else
    v15 = 0;

  return v15;
}

+ (id)colorForDefaultCalendarForNewEvents
{
  void *v2;
  void *v3;
  CGColor *v4;
  void *v5;

  objc_msgSend(a1, "sharedCalendarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCalendarForNewEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CGColorRetain((CGColorRef)objc_msgSend(v3, "CGColor"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __80__SearchUICalendarStore_fetchCalendarItemFromEventIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "SearchUICalendarStore: %@", (uint8_t *)&v2, 0xCu);
}

@end
