@implementation SetupSingleWriterWithConnection

BOOL ____SetupSingleWriterWithConnection_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  ICDelegateAccountStoreReader *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  ICDelegateAccountStoreSQLWriter *v10;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  v4 = +[ICDelegateAccountStoreSchema setupWithConnection:error:](ICDelegateAccountStoreSchema, "setupWithConnection:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = -[ICDelegateAccountStoreReader initWithConnection:]([ICDelegateAccountStoreReader alloc], "initWithConnection:", a1[4]);
    -[ICDelegateAccountStoreReader lastExpirationPruningDate](v5, "lastExpirationPruningDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v8 = v7;
    if (!v6 || (objc_msgSend(v7, "timeIntervalSinceDate:", v6), v9 >= 43200.0))
    {
      v10 = -[ICDelegateAccountStoreSQLWriter initWithConnection:]([ICDelegateAccountStoreSQLWriter alloc], "initWithConnection:", a1[4]);
      -[ICDelegateAccountStoreSQLWriter removeTokensExpiringBeforeDate:completionHandler:](v10, "removeTokensExpiringBeforeDate:completionHandler:", v8, 0);

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

  }
  return v4;
}

@end
