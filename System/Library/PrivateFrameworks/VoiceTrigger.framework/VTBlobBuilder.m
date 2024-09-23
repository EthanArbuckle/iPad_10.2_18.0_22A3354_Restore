@implementation VTBlobBuilder

+ (id)getBlobWithConfigFilename:(id)a3 rootDirectory:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  int BlobSize;
  id v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  unsigned int v18;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4);
  v9 = objc_retainAutorelease(v6);
  BlobSize = NDBlobGetBlobSize(v8, (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4), (N16ByteAlignedString *)1, 0, &v18);
  v11 = 0;
  if (!BlobSize && v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4);
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", 4);
    v15 = objc_retainAutorelease(v12);
    v16 = (void *)objc_msgSend(v15, "bytes");
    if (NDBlobBuildBlob(v13, v14, (N16ByteAlignedString *)1, 0, v16, v18))
      v11 = 0;
    else
      v11 = v15;

  }
  return v11;
}

+ (id)getDefaultBlob
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &gVTRTModelData, 40960);
}

@end
