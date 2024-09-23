@implementation VGCoderUtilities

+ (void)encodePixelBuffer:(__CVBuffer *)a3 forKey:(id)a4 encoder:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  CVPixelBufferGetIOSurface(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E18], CFSTR("Only supports IOSurface backed pixel buffer"));
  objc_msgSend(v8, "allAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "bytesPerRow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD8E38]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "allocationSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD8E18]);

  objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("properties"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v11, v14);

  objc_msgSend(v8, "lockWithOptions:seed:", 1, 0);
  v15 = objc_retainAutorelease(v8);
  v16 = objc_msgSend(v15, "baseAddress");
  v17 = objc_msgSend(v15, "allocationSize");
  objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("bytes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeBytes:length:forKey:", v16, v17, v18);

  objc_msgSend(v15, "unlockWithOptions:seed:", 1, 0);
}

+ (__CVBuffer)decodePixelBufferForKey:(id)a3 decoder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  id v19;
  __CVBuffer *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _BYTE pixelBufferOut[12];
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("properties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v13);
  if (!v14)
  {
    __VGLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pixelBufferOut = 138412290;
      *(_QWORD *)&pixelBufferOut[4] = v13;
      _os_log_impl(&dword_249CAD000, v21, OS_LOG_TYPE_ERROR, " Failed to create iosurface with properties %@ ", pixelBufferOut, 0xCu);
    }

    goto LABEL_10;
  }
  v26 = 0;
  v15 = objc_retainAutorelease(v6);
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("bytes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (const void *)objc_msgSend(v15, "decodeBytesForKey:returnedLength:", v16, &v26);

  v18 = v26;
  if (v18 != objc_msgSend(v14, "allocationSize"))
  {
    __VGLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v26;
      v24 = objc_msgSend(v14, "allocationSize");
      *(_DWORD *)pixelBufferOut = 134218240;
      *(_QWORD *)&pixelBufferOut[4] = v23;
      v28 = 2048;
      v29 = v24;
      _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_ERROR, " Failed to decode iosurface data [%ld != %ld] ", pixelBufferOut, 0x16u);
    }

LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v14, "lockWithOptions:seed:", 0, 0);
  v19 = objc_retainAutorelease(v14);
  memcpy((void *)objc_msgSend(v19, "baseAddress"), v17, objc_msgSend(v19, "allocationSize"));
  objc_msgSend(v19, "unlockWithOptions:seed:", 0, 0);
  *(_QWORD *)pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], (IOSurfaceRef)v19, 0, (CVPixelBufferRef *)pixelBufferOut);
  v20 = *(__CVBuffer **)pixelBufferOut;
LABEL_11:

  return v20;
}

+ (BOOL)hasPixelBufferForKey:(id)a3 decoder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("properties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsValueForKey:", v7))
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("bytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "containsValueForKey:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
