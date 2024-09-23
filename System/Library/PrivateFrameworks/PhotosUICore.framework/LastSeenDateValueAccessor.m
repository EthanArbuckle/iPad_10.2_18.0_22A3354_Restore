@implementation LastSeenDateValueAccessor

void ___LastSeenDateValueAccessor_block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, CFSTR("PXSharedAlbumsActivityLastSeenDateKey"), &__block_literal_global_9_158292, &__block_literal_global_12_158293, &__block_literal_global_15_158294);
  v2 = (void *)_LastSeenDateValueAccessor_lastSeenDateAccessor;
  _LastSeenDateValueAccessor_lastSeenDateAccessor = v1;

}

void ___LastSeenDateValueAccessor_block_invoke_2_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("PXSharedAlbumsActivityLastSeenDateKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PXSharedAlbumsActivityLastSeenDateChangeNotification"), 0, v5);
}

BOOL ___LastSeenDateValueAccessor_block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL8 v6;

  v4 = a2;
  v5 = a3;
  v6 = (PFOSVariantHasInternalUI() & 1) != 0 || objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

id ___LastSeenDateValueAccessor_block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  PLUIGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityLastSeen] Using default 'last seen' date (now)", v2, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
