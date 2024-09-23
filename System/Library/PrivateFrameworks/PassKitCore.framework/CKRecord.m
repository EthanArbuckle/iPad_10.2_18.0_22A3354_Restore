@implementation CKRecord

uint64_t __59__CKRecord_PKAdditions__pk_encryptedArrayOfClasses_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = 1;
          goto LABEL_13;
        }
        PKLogFacilityTypeGetObject(0xEuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)objc_opt_class();
          v11 = *(void **)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 40);
          v12 = v9;
          objc_msgSend(v11, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v22 = v9;
          v23 = 2112;
          v24 = v10;
          v25 = 2112;
          v26 = v13;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Wrong class in encrypted array: %@, for key %@, expected classes: %@", buf, 0x20u);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

uint64_t __39__CKRecord_PKAdditions__pk_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: '%@',  "), a2, a3);
}

void __32__CKRecord_PKAdditions__pk_hash__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "coordinate");
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safelyAddObject:", v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safelyAddObject:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v9);
  }

}

@end
