@implementation PTTransactionBegin

void __PTTransactionBegin_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  _TransactionsByReason();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    _TransactionsByReason();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v4 = (void *)os_transaction_create();
  objc_msgSend(v5, "addObject:", v4);

}

@end
