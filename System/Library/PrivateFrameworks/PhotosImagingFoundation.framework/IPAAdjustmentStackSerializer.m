@implementation IPAAdjustmentStackSerializer

- (id)dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  id v17;

  v12 = a3;
  if (v12)
  {
    v17 = 0;
    -[IPAAdjustmentStackSerializer _dataFromAdjustmentStack:error:](self, "_dataFromAdjustmentStack:error:", v12, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    IPAAdjustmentError(1000, CFSTR("attempting to serialize nil adjustment stack"), v6, v7, v8, v9, v10, v11, v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (v14)
    *a4 = objc_retainAutorelease(v14);
LABEL_7:

  return v13;
}

- (id)adjustmentStackFromData:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  id v10;
  uint64_t v12;

  if (a3)
  {
    -[IPAAdjustmentStackSerializer _adjustmentStackFromData:error:](self, "_adjustmentStackFromData:error:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  else
  {
    IPAAdjustmentError(1001, CFSTR("attempting to deserialize nil data"), 0, (uint64_t)a4, v4, v5, v6, v7, v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (a4 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      v9 = 0;
      *a4 = v10;
    }
  }

  return v9;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAAdjustmentStackSerializer _dataFromAdjustmentStack:error:](v6, v7, v8, v9);
}

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAAdjustmentStackSerializer _adjustmentStackFromData:error:](v6, v7, v8, v9);
}

- (id)_adjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAAdjustmentStackSerializer archiveFromData:error:](v6, v7, v8, v9);
}

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  IPAPhotoAdjustmentStackSerializer *v6;
  SEL v7;
  id v8;
  id *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAPhotoAdjustmentStackSerializer *)_PFAssertFailHandler();
  return -[IPAPhotoAdjustmentStackSerializer _dataFromAdjustmentStack:error:](v6, v7, v8, v9);
}

+ (id)dataFromPropertyList:(id)a3
{
  return (id)objc_msgSend(a1, "dataFromPropertyList:error:", a3, 0);
}

+ (id)dataFromPropertyList:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15[4];

  v15[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      IPAAdjustmentError(1008, CFSTR("dataWithPropertyList returned nil with no error"), v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    if (a4 && v13)
    {
      v13 = (uint64_t)objc_retainAutorelease((id)v13);
      *a4 = (id)v13;
    }
  }
  else
  {
    v13 = 0;
    v6 = 0;
  }

  return (id)v6;
}

+ (id)propertyListFromData:(id)a3
{
  return (id)objc_msgSend(a1, "propertyListFromData:error:", a3, 0);
}

+ (id)propertyListFromData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15[4];

  v15[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      IPAAdjustmentError(1008, CFSTR("propertyListWithData returned nil with no error"), v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    if (a4 && v13)
    {
      v13 = (uint64_t)objc_retainAutorelease((id)v13);
      *a4 = (id)v13;
    }
  }
  else
  {
    v6 = 0;
    v13 = 0;
  }

  return (id)v6;
}

+ (id)unarchiveData:(id)a3
{
  return (id)objc_msgSend(a1, "unarchiveData:error:", a3, 0);
}

+ (id)unarchiveData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13[3];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);
  v13[0] = 0;
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13[0];

  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return v10;
}

+ (id)archiveDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "archiveDictionary:error:", a3, 0);
}

+ (id)archiveDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10[4];

  v10[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v10[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10[0];
  v8 = v7;
  if (a4 && v7)
    *a4 = objc_retainAutorelease(v7);

  return v6;
}

+ (id)dataFromJSON:(id)a3
{
  return (id)objc_msgSend(a1, "dataFromJSON:error:", a3, 0);
}

+ (id)dataFromJSON:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15[4];

  v15[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      IPAAdjustmentError(1002, CFSTR("dataWithJSONObject returned nil with no error"), v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    if (a4 && v13)
    {
      v13 = (uint64_t)objc_retainAutorelease((id)v13);
      *a4 = (id)v13;
    }
  }
  else
  {
    v6 = 0;
    v13 = 0;
  }

  return (id)v6;
}

+ (id)JSONFromData:(id)a3
{
  return (id)objc_msgSend(a1, "JSONFromData:error:", a3, 0);
}

+ (id)JSONFromData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15[4];

  v15[3] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      IPAAdjustmentError(1002, CFSTR("JSONObjectWithData returned nil with no error"), v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    if (a4 && v13)
    {
      v13 = (uint64_t)objc_retainAutorelease((id)v13);
      *a4 = (id)v13;
    }
  }
  else
  {
    v13 = 0;
    v6 = 0;
  }

  return (id)v6;
}

+ (id)compressData:(id)a3
{
  return (id)objc_msgSend(a1, "compressData:error:", a3, 0);
}

+ (id)compressData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D75350], "compressData:options:error:", a3, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

+ (id)decompressData:(id)a3
{
  return (id)objc_msgSend(a1, "decompressData:error:", a3, 0);
}

+ (id)decompressData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D75350], "decompressData:options:error:", a3, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

+ (id)B64StringForData:(id)a3
{
  return (id)objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

+ (id)dataFromB64String:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  return v5;
}

@end
