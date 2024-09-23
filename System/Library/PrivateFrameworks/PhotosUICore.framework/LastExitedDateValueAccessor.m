@implementation LastExitedDateValueAccessor

void ___LastExitedDateValueAccessor_block_invoke()
{
  PXUbiquitousKeyValueStoreValueAccessor *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXUbiquitousKeyValueStoreValueAccessor initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:](v0, "initWithUbiquitousKeyValueStore:key:defaultValueFuture:valueFilter:changeHandler:", v3, CFSTR("PXForYouLastExitedDateKey"), &__block_literal_global_6_224179, &__block_literal_global_9_224180, &__block_literal_global_11_224181);
  v2 = (void *)_LastExitedDateValueAccessor_lastExitedDateAccessor;
  _LastExitedDateValueAccessor_lastExitedDateAccessor = v1;

}

void ___LastExitedDateValueAccessor_block_invoke_4(uint64_t a1, void *a2)
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
  v6 = CFSTR("PXForYouLastExitedDateKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PXForYouLastExitedDateChangeNotification"), 0, v5);
}

BOOL ___LastExitedDateValueAccessor_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:") == -1;
}

uint64_t ___LastExitedDateValueAccessor_block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
