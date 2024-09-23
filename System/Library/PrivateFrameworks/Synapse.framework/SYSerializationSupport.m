@implementation SYSerializationSupport

+ (id)archiveDataFromItemData:(id)a3
{
  return (id)objc_msgSend(a1, "archiveDataFromData:formatIdentifier:majorVersion:minorVersion:", a3, 4034099561, 1, 3);
}

+ (id)archiveDataFromData:(id)a3 formatIdentifier:(unsigned int)a4 majorVersion:(unsigned __int8)a5 minorVersion:(unsigned __int8)a6
{
  id v11;
  void *v12;
  void *v14;
  void *v15;
  __int16 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned int v19;

  v11 = a3;
  v19 = a4;
  v18 = a5;
  v17 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYSerializationSupport.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemData"));

  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v11, "length") + 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendBytes:length:", &v19, 4);
  objc_msgSend(v12, "appendBytes:length:", &v18, 1);
  objc_msgSend(v12, "appendBytes:length:", &v17, 1);
  v16 = 8;
  objc_msgSend(v12, "appendBytes:length:", &v16, 2);
  if (objc_msgSend(v12, "length") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYSerializationSupport.m"), 81, CFSTR("Header size is wrong."));

  }
  objc_msgSend(v12, "appendData:", v11);

  return v12;
}

+ (id)itemDataFromArchiveData:(id)a3 majorVersion:(int64_t *)a4 minorVersion:(int64_t *)a5 error:(id *)a6
{
  id v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if ((unint64_t)objc_msgSend(v11, "length") <= 7)
    goto LABEL_7;
  if ((unint64_t)objc_msgSend(v11, "length") <= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYSerializationSupport.m"), 103, CFSTR("Invalid data size"));

  }
  LODWORD(v24[0]) = 0;
  objc_msgSend(v11, "getBytes:range:", v24, 0, 4);
  if (LODWORD(v24[0]) != -260867735)
  {
LABEL_7:
    SYFormatErrorMalformed();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v22 = 0;
  objc_msgSend(v11, "getBytes:range:", (char *)&v22 + 1, 4, 1);
  objc_msgSend(v11, "getBytes:range:", &v22, 5, 1);
  v12 = HIBYTE(v22);
  v13 = v22;
  if (HIBYTE(v22) >= 2uLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data format is a future or unsupported version: %ld.%ld."), HIBYTE(v22), v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -123, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  LOWORD(v24[0]) = 0;
  objc_msgSend(v11, "getBytes:range:", v24, 6, 2);
  v20 = LOWORD(v24[0]);
  if (LOWORD(v24[0]) < 8uLL || objc_msgSend(v11, "length") <= v20)
  {
    SYFormatErrorMalformed();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v18 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v11, "length");
  objc_msgSend(v11, "subdataWithRange:", 8, objc_msgSend(v11, "length") - 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a4)
LABEL_9:
    *a4 = v12;
LABEL_10:
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = objc_retainAutorelease(v17);

  return v18;
}

@end
