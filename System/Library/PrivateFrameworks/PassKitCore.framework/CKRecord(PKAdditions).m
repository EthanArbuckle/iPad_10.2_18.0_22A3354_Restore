@implementation CKRecord(PKAdditions)

- (id)pk_encryptedStringForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_encryptedUUIDForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_encryptedStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)pk_encryptedNumberForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_encryptedDateForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_encryptedDataForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_encryptedLocationForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_encryptedObjectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_encryptedDecimalNumberForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_encryptedStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_encryptedUrlForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_encryptedStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_encryptedDictionaryForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_encryptedStringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PKDictionaryFromJSONString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pk_encryptedArrayOfClasses:()PKAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "pk_encryptedStringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_arrayFromStringValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__CKRecord_PKAdditions__pk_encryptedArrayOfClasses_forKey___block_invoke;
  v14[3] = &unk_1E2AC3380;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "pk_objectsPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)pk_encryptedBoolForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_encryptedIntegerForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_encryptedIntForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "intValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_encryptedUint64ForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_encryptedUnsignedIntegerForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_encryptedNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (id)pk_encryptedObjectForKey:()PKAdditions ofClass:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "encryptedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    if (v8)
    {
      PKLogFacilityTypeGetObject(9uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412802;
        v14 = (id)objc_opt_class();
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = a4;
        v11 = v14;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@. Expected class type: %@", (uint8_t *)&v13, 0x20u);

      }
    }
    v9 = 0;
  }

  return v9;
}

- (id)pk_stringForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_numberForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_dateForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_dataForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_locationForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_decimalNumberForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_urlForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)pk_dictionaryForKey:()PKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pk_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PKDictionaryFromJSONString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pk_arrayForKey:()PKAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_arrayFromStringValue:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject(9uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = (id)objc_opt_class();
    v13 = 2112;
    v14 = v4;
    v9 = v12;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@ as array. Expected string or array", (uint8_t *)&v11, 0x16u);

  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (uint64_t)pk_BOOLForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_integerForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_intForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "intValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_uint64ForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)pk_unsignedIntegerForKey:()PKAdditions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "pk_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = 0;

  return v3;
}

- (id)pk_referenceForKey:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "pk_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_objectForKey:()PKAdditions ofClass:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    if (v7)
    {
      PKLogFacilityTypeGetObject(9uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412802;
        v13 = (id)objc_opt_class();
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = a4;
        v10 = v13;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "CKRecord Error: unexpected class type \"%@\" for key %@. Expected class type: %@", (uint8_t *)&v12, 0x20u);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (id)pk_description
{
  void *v2;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("recordName: '%@', "), v4);

  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("zoneName: '%@', "), v7);

  objc_msgSend(a1, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("createdDate: '%@', "), v8);

  objc_msgSend(a1, "recordChangeTag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("recordChangeTag: '%@', "), v9);

  objc_msgSend(a1, "creatorUserRecordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("creatorUserRecordID: '%@', "), v10);

  objc_msgSend(a1, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("creationDate: '%@', "), v11);

  objc_msgSend(a1, "lastModifiedUserRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("lastModifiedUserRecordID: '%@', "), v12);

  objc_msgSend(a1, "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("modificationDate: '%@', "), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "pk_hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("pk_hash: '%@', "), v14);

  objc_msgSend(v2, "appendFormat:", CFSTR("values: { "));
  objc_msgSend(a1, "values");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __39__CKRecord_PKAdditions__pk_description__block_invoke;
  v33[3] = &unk_1E2ACBCB8;
  v16 = v2;
  v34 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v33);

  objc_msgSend(v16, "appendFormat:", CFSTR("},"));
  objc_msgSend(v16, "appendString:", CFSTR(" encryptedValues: { "));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = a1;
  objc_msgSend(a1, "encryptedValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23);
        objc_msgSend(v17, "encryptedValues");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v16, "appendFormat:", CFSTR("%@: '%@',  "), v24, CFSTR("<large data blob>"));
        else
          objc_msgSend(v16, "appendFormat:", CFSTR("%@: '%@',  "), v24, v26);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v21);
  }

  objc_msgSend(v16, "appendFormat:", CFSTR("}"));
  objc_msgSend(v16, "appendFormat:", CFSTR(">"));

  return v16;
}

- (id)description
{
  void *v2;
  objc_super v4;

  if (PKTransactionDebugDetailsEnabled())
  {
    objc_msgSend(a1, "pk_description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EE284538;
    objc_msgSendSuper2(&v4, sel_description);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)pk_hash
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[4];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v3);

  objc_msgSend(a1, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v4);

  objc_msgSend(a1, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v5);

  objc_msgSend(a1, "creatorUserRecordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v6);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CKRecord_PKAdditions__pk_hash__block_invoke;
  aBlock[3] = &unk_1E2ACBCE0;
  v7 = v2;
  v35 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v12);
  }
  objc_msgSend(a1, "valuesByKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v20);
  }

  v24 = PKCombinedHash(17, v7);
  return v24;
}

- (id)pk_copyRecordForNewRecordZone:()PKAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(v40, "zoneID");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v6;
  v38 = (void *)v4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v6, v4);
  v8 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(a1, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v7;
  v10 = (void *)objc_msgSend(v8, "initWithRecordType:recordID:", v9, v7);

  v39 = a1;
  objc_msgSend(a1, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encryptedValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v15);
  }
  v34 = v12;
  v35 = v11;
  objc_msgSend(v39, "valuesByKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  objc_msgSend(v10, "valuesByKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v20, "objectForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = objc_msgSend(v39, "_copyReference:forNewRecordZone:", v29, v40);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
          v30 = objc_msgSend(v39, "_copyArray:forNewRecordZone:", v29, v40);
        }
        v31 = (void *)v30;

        v29 = v31;
LABEL_18:
        objc_msgSend(v21, "setObject:forKey:", v29, v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v25);
  }

  return v33;
}

- (id)pk_participantWithRecipientHandle:()PKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "containsString:", CFSTR("@")))
    objc_msgSend(a1, "pk_participantWithEmailAddress:", v4);
  else
    objc_msgSend(a1, "pk_participantWithPhoneNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pk_participantWithEmailAddress:()PKAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C95218];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithEmailAddress:", v5);

  objc_msgSend(a1, "pk_participantWithLookupInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pk_participantWithPhoneNumber:()PKAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C95218];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPhoneNumber:", v5);

  objc_msgSend(a1, "pk_participantWithLookupInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pk_participantWithLookupInfo:()PKAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "pk_share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "participants", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "userIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lookupInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v4 && v13)
          {
            v15 = objc_msgSend(v13, "isEqual:", v4);

            if ((v15 & 1) != 0)
              goto LABEL_15;
          }
          else
          {

            if (v14 == v4)
            {
LABEL_15:
              v8 = v11;
              goto LABEL_16;
            }
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pk_share
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (uint64_t)_copyReference:()PKAdditions forNewRecordZone:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v7, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithRecordName:zoneID:", v9, v10);
  v12 = objc_alloc(MEMORY[0x1E0C950C0]);
  v13 = objc_msgSend(v6, "referenceAction");

  v14 = objc_msgSend(v12, "initWithRecordID:action:", v11, v13);
  return v14;
}

- (uint64_t)_copyArray:()PKAdditions forNewRecordZone:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_msgSend(a1, "_copyReference:forNewRecordZone:", v14, v7, (_QWORD)v18);

          v14 = (id)v15;
        }
        objc_msgSend(v8, "addObject:", v14, (_QWORD)v18);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v8, "copy");
  return v16;
}

- (id)_arrayFromStringValue:()PKAdditions
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    PKLogFacilityTypeGetObject(9uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error decoding CloudKit string into an NSArray with error: %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:

LABEL_8:
    v4 = 0;
  }

  return v4;
}

- (uint64_t)pk_isPass
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a1, "recordType");
  v1 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("Pass");
  v3 = v2;
  if (v1 == v2)
  {
    v4 = 1;
  }
  else
  {
    v4 = 0;
    if (v1 && v2)
      v4 = -[__CFString isEqualToString:](v1, "isEqualToString:", v2);
  }

  return v4;
}

- (uint64_t)pk_isPassCatalog
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a1, "recordType");
  v1 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("PassCatalog");
  v3 = v2;
  if (v1 == v2)
  {
    v4 = 1;
  }
  else
  {
    v4 = 0;
    if (v1 && v2)
      v4 = -[__CFString isEqualToString:](v1, "isEqualToString:", v2);
  }

  return v4;
}

- (uint64_t)pk_isRemoteAsset
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a1, "recordType");
  v1 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("RemoteAsset");
  v3 = v2;
  if (v1 == v2)
  {
    v4 = 1;
  }
  else
  {
    v4 = 0;
    if (v1 && v2)
      v4 = -[__CFString isEqualToString:](v1, "isEqualToString:", v2);
  }

  return v4;
}

+ (id)pk_recordWithSystemFieldsData:()PKAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v8 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v8);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v5);
  return v6;
}

- (id)pk_systemFieldsData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a1, "encodeSystemFieldsWithCoder:", v2);
  objc_msgSend(v2, "finishEncoding");
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
