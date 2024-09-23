@implementation CKRecord(SafariCoreExtras)

- (id)safari_initWithEncodedRecordData:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10[0] = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, v10);
    v6 = v10[0];
    if (v6)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CKRecord(SafariCoreExtras) safari_initWithEncodedRecordData:].cold.2(v7, v6);
    }
    a1 = (id)objc_msgSend(a1, "initWithCoder:", v5);

    v8 = a1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_WBSCKRecordSystemEncoder)safari_systemFieldsEncoder
{
  return -[_WBSCKRecordSystemEncoder initWithRecord:]([_WBSCKRecordSystemEncoder alloc], "initWithRecord:", a1);
}

- (id)safari_encodedSystemFieldsData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a1, "encodeSystemFieldsWithCoder:", v2);
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)safari_hasAtLeastOneChangedField
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "changedKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "safari_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)safari_stringForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_dataForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_arrayForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)safari_encryptedDataForKey:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "safari_encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_referenceForKey:()SafariCoreExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)safari_isInPrivateDatabase
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safari_isInPrivateDatabase");

  return v2;
}

- (void)safari_initWithEncodedRecordData:()SafariCoreExtras .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a3, (uint64_t)a3, "Failed to read encoded record data with exception: %{public}@", (uint8_t *)a2);

}

- (void)safari_initWithEncodedRecordData:()SafariCoreExtras .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Failed to initialize reading from encoded record data: %{public}@", (uint8_t *)&v6);

}

@end
