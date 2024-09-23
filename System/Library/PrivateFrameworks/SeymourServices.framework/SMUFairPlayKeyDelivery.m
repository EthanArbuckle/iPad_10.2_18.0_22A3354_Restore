@implementation SMUFairPlayKeyDelivery

- (id)remoteServerPlaybackContextForCertificate:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  SMUFairPlayRemoteServerPlaybackContext *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "gaX8gT7e", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", &unk_1E8C46A30, v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "Y7bdIsnh7", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v10);

  v11 = nS1Q9ljw9esy9((uint64_t)v7, (uint64_t)v8);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB3388];
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("SMUFairPlayKeyDeliveryErrorDomain"), 0, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "xNJu5eepP", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "rGLU5bt2", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v18);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = -[SMUFairPlayRemoteServerPlaybackContext initWithBlob:identifier:]([SMUFairPlayRemoteServerPlaybackContext alloc], "initWithBlob:identifier:", v12, objc_msgSend(v15, "unsignedIntValue"));

        v15 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SMUFairPlayKeyDeliveryErrorDomain"), 1, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    v16 = 0;
    *a4 = v15;
  }
  else
  {
    v16 = 0;
  }
LABEL_9:

  return v16;
}

- (id)serverPlaybackContextForPlaybackContext:(id)a3 remoteContextIdentifier:(unsigned int)a4 error:(id *)a5
{
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v16 = 0;
  v7 = (const __CFData *)a3;
  BytePtr = CFDataGetBytePtr(v7);
  Length = CFDataGetLength(v7);

  v10 = f5zGmdURga6BZ(a4, (uint64_t)BytePtr, Length, (uint64_t)&v17, (uint64_t)&v16);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB3388];
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("SMUFairPlayKeyDeliveryErrorDomain"), 0, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v16);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  return a5;
}

@end
