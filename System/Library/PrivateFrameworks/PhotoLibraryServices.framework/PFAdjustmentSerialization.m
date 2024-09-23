@implementation PFAdjustmentSerialization

+ (id)serializeAdjustments:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "envelopeDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serializeDictionary:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)deserializeAdjustmentsFromData:(id)a3 error:(id *)a4
{
  void *v5;
  PFAdjustmentStack *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v7 = (void *)objc_opt_new();
    return v7;
  }
  objc_msgSend(a1, "deserializeDictionaryFromData:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PFAdjustmentStack initWithEnvelopeDictionary:]([PFAdjustmentStack alloc], "initWithEnvelopeDictionary:", v5);
    v7 = v6;
    if (!a4 || v6)
      goto LABEL_7;
    v8 = (void *)objc_opt_new();
    v9 = +[PFAdjustmentStack isValidEnvelopeDictionary:errors:](PFAdjustmentStack, "isValidEnvelopeDictionary:errors:", v5, v8);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14[0] = CFSTR("isValid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("errors");
    v15[0] = v11;
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), 4001, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (id)serializeDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5
    && (v12[0] = 0,
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, v12),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D76618], "compressData:error:", v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v8;
    if (a4 && !v7)
      *a4 = objc_retainAutorelease(v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  id v12[4];

  v12[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v12[0] = 0;
    objc_msgSend(MEMORY[0x1E0D76618], "decompressData:error:", v5, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12[0];
    v8 = v7;
    if (v6)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v7);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)validateArchive:(id)a3 containsEntryWithKey:(id)a4 ofType:(Class)a5 errors:(id)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[3];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  objc_msgSend(a3, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("parameter");
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = 3;
LABEL_6:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), v16, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

    v12 = 0;
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v20[0] = CFSTR("parameter");
    v20[1] = CFSTR("expected");
    v21[0] = CFSTR("formatVersion");
    v21[1] = a5;
    v20[2] = CFSTR("actual");
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    v16 = 2;
    goto LABEL_6;
  }
  v12 = 1;
LABEL_7:

  return v12;
}

+ (BOOL)validateValue:(id)a3 isOfType:(Class)a4 errors:(id)a5
{
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14[0] = CFSTR("parameter");
    v14[1] = CFSTR("expected");
    v15[0] = CFSTR("formatVersion");
    v15[1] = a4;
    v14[2] = CFSTR("actual");
    v15[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  return isKindOfClass & 1;
}

@end
