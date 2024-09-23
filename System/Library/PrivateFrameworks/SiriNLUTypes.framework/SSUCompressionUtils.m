@implementation SSUCompressionUtils

+ (BOOL)_compressArchiveForData:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v7 = a4;
  v16 = 0;
  objc_msgSend(a3, "compressedDataUsingAlgorithm:error:", 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (v8)
  {
    v15 = 0;
    v11 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1, &v15);
    v12 = v15;
    v13 = v12;
    if (a5 && (v11 & 1) == 0)
      *a5 = objc_retainAutorelease(v12);

  }
  else
  {
    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }

  return v11;
}

+ (BOOL)compressArchiveForSSUFile:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v8, "flatbuffData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v9, "_compressArchiveForData:outputFileURL:error:", v10, v7, a5);
  return (char)a5;
}

+ (BOOL)compressArchiveForSSUFileURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v13;

  v7 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "_compressArchiveForData:outputFileURL:error:", v8, v7, a5);
  }
  else
  {
    v11 = 0;
    if (v9)
      *a5 = objc_retainAutorelease(v9);
  }

  return v11;
}

+ (id)_dataFromCompressedSSUFilePath:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
  {
    v13 = 0;
    objc_msgSend(v5, "decompressedDataUsingAlgorithm:error:", 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = v9;
    if (v8)
    {
      v11 = v8;
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v8;
}

+ (BOOL)decompressFromCompressedSSUFilePath:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v16;
  id v17;

  v7 = a4;
  v8 = a3;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_dataFromCompressedSSUFilePath:error:", v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  v11 = v10;
  if (v9)
  {
    v16 = 0;
    v12 = objc_msgSend(v9, "writeToURL:options:error:", v7, 1, &v16);
    v13 = v16;
    v14 = v13;
    if (a5 && (v12 & 1) == 0)
      *a5 = objc_retainAutorelease(v13);

  }
  else
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v12;
}

+ (id)SSUFileFromCompressedSSUFilePath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_dataFromCompressedSSUFilePath:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FLTSSUFile initAndVerifyWithFlatbuffData:]([FLTSSUFile alloc], "initAndVerifyWithFlatbuffData:", v6);
  return v7;
}

@end
