@implementation AHTLoader

+ (id)allDevices
{
  void *v2;
  const __CFDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  io_iterator_t existing;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  existing = 0;
  v2 = (void *)objc_opt_new();
  v3 = IOServiceMatching("AppleFirmwareUpdateKext");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    v5 = IOIteratorNext(existing);
    if ((_DWORD)v5)
    {
      v6 = v5;
      do
      {
        +[AHTLoader withService:](AHTLoader, "withService:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IOObjectRelease(v6);
        if (v7)
          objc_msgSend(v2, "addObject:", v7);

        v6 = IOIteratorNext(existing);
      }
      while ((_DWORD)v6);
    }
    IOObjectRelease(existing);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", 0, 0, &__block_literal_global);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortUsingDescriptors:", v9);

    v10 = v2;
  }
  else
  {
    v4 = v2;
  }

  return v2;
}

uint64_t __23__AHTLoader_allDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "loadingGroup");
  if (v6 >= objc_msgSend(v5, "loadingGroup"))
  {
    v8 = objc_msgSend(v4, "loadingGroup");
    v7 = v8 > objc_msgSend(v5, "loadingGroup");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)withName:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[AHTLoader allDevices](AHTLoader, "allDevices");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "name", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)withService:(unsigned int)a3
{
  return -[AHTLoader initWithService:]([AHTLoader alloc], "initWithService:", *(_QWORD *)&a3);
}

- (AHTLoader)initWithService:(unsigned int)a3
{
  AHTLoader *v4;
  AHTLoader *v5;
  AHTLoader *v6;
  const __CFAllocator *v7;
  NSString *CFProperty;
  NSString *name;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AHTLoader;
  v4 = -[AHTLoader init](&v13, sel_init);
  v5 = v4;
  v6 = 0;
  if (a3 && v4)
  {
    if (!IOObjectConformsTo(a3, "AppleFirmwareUpdateKext"))
      goto LABEL_8;
    v5->_service = a3;
    IOObjectRetain(a3);
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (NSString *)IORegistryEntryCreateCFProperty(a3, CFSTR("AHTLoaderName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    name = v5->_name;
    v5->_name = CFProperty;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("Image Tag"), v7, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5->_imageTag = objc_msgSend(v10, "unsignedIntValue");
        v11 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("LoadingGroup"), v7, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5->_loadingGroup = objc_msgSend(v11, "unsignedIntValue");
          v6 = v5;
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
LABEL_8:
      v6 = 0;
    }
  }

  return v6;
}

+ (id)bootloaderPropertiesForImageTag:(unsigned int)a3
{
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t v7;
  io_object_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  io_iterator_t existing;

  existing = 0;
  v4 = *MEMORY[0x24BDD8B18];
  v5 = IOServiceMatching("AppleHIDTransportBootloader");
  if (IOServiceGetMatchingServices(v4, v5, &existing))
    return 0;
  while (1)
  {
    v7 = IOIteratorNext(existing);
    if (!(_DWORD)v7)
      break;
    v8 = v7;
    +[AHTLoader registryPropertiesForService:](AHTLoader, "registryPropertiesForService:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("image-tag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");

    if (v11 == a3)
      v12 = v9;
    else
      v12 = 0;
    IOObjectRelease(v8);

    if (v12)
      goto LABEL_10;
  }
  v12 = 0;
LABEL_10:
  IOObjectRelease(existing);
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[AHTLoader close](self, "close");
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTLoader;
  -[AHTLoader dealloc](&v3, sel_dealloc);
}

- (BOOL)open:(id *)a3
{
  return self->_connect
      || +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOServiceOpen(self->_service, *MEMORY[0x24BDAEC58], 0, &self->_connect), a3);
}

- (void)close
{
  io_connect_t connect;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_connect = 0;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AHTLoader name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%c%c%c%c)"), v4, ((int)-[AHTLoader imageTag](self, "imageTag") >> 24), ((int)(-[AHTLoader imageTag](self, "imageTag") << 8) >> 24), ((__int16)-[AHTLoader imageTag](self, "imageTag") >> 8), (char)-[AHTLoader imageTag](self, "imageTag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  -[AHTLoader description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AHTLoader bootloaderPropertiesForImageTag:](AHTLoader, "bootloaderPropertiesForImageTag:", -[AHTLoader imageTag](self, "imageTag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\n%-20s | %-60s | %-20s\n"), "Description", "Result", "Time (ms)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v9 = __28__AHTLoader_fullDescription__block_invoke(v8, (uint64_t)CFSTR("-"), 0x14u);
  v10 = __28__AHTLoader_fullDescription__block_invoke(v9, (uint64_t)CFSTR("-"), 0x3Cu);
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%s | %s | %s\n"), v9, v10, __28__AHTLoader_fullDescription__block_invoke(v10, (uint64_t)CFSTR("-"), 0x14u));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __28__AHTLoader_fullDescription__block_invoke_2;
  v21[3] = &unk_24F25A1D8;
  v22 = v4;
  v13 = v4;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2CD924](v21);
  ((void (**)(_QWORD, const char *))v14)[2](v14, "LoadImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@\n"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, const char *))v14)[2](v14, "LoadFirmware");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("%@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __28__AHTLoader_fullDescription__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  id v3;
  uint64_t v4;

  objc_msgSend(&stru_24F25A298, "stringByPaddingToLength:withString:startingAtIndex:", a3, a2, 0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "UTF8String");

  return v4;
}

id __28__AHTLoader_fullDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  mach_error_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AHTBootload%sResult"), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntValue");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(v7));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("N/A");
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AHTBootload%sTimeMs"), a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "unsignedIntValue");
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("N/A");
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_retainAutorelease(v8);
  v16 = -[__CFString UTF8String](v15, "UTF8String");
  v17 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%-20s | %-60s | %-20s"), a2, v16, -[__CFString UTF8String](v17, "UTF8String"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)errorFromKernel:(int)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), a3, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return a3 == 0;
}

+ (BOOL)errorFromAfuKextResult:(int)a3 error:(id *)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    if (a3 == 1)
    {
      v6 = CFSTR("kFWDownloadFailure");
    }
    else if (a3 == 2)
    {
      v6 = CFSTR("kFWDownloadAsync");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown FWDownloadStatus: 0x%08X"), *(_QWORD *)&a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), a3, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return a3 == 0;
}

- (BOOL)loadImage:(id)a3 payloadOnly:(BOOL)a4 options:(unint64_t)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  uint64_t input[5];

  v8 = a4;
  input[4] = *MEMORY[0x24BDAC8D0];
  v10 = objc_retainAutorelease(a3);
  input[0] = objc_msgSend(v10, "bytes");
  v11 = objc_msgSend(v10, "length");

  input[1] = v11;
  input[2] = v8;
  input[3] = a5;
  if (!-[AHTLoader open:](self, "open:", a6))
    return 0;
  v12 = IOConnectCallScalarMethod(self->_connect, 0, input, 4u, 0, 0);
  +[AHTLoader bootloaderPropertiesForImageTag:](AHTLoader, "bootloaderPropertiesForImageTag:", -[AHTLoader imageTag](self, "imageTag"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AHTBootloadLoadImageResult"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 && v14)
    v16 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", objc_msgSend(v14, "intValue"), a6);
  else
    v16 = +[AHTLoader errorFromAfuKextResult:error:](AHTLoader, "errorFromAfuKextResult:error:", v12, a6);
  v17 = v16;

  return v17;
}

- (BOOL)overrideFDR:(id)a3 fdrClass:(id)a4 fdrSubclass:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t input[3];
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v10, "length") + objc_msgSend(v15, "length"));
  objc_msgSend(v16, "appendData:", v15);
  objc_msgSend(v16, "appendData:", v10);
  v17 = objc_retainAutorelease(v16);
  input[0] = objc_msgSend(v17, "bytes");
  input[1] = objc_msgSend(v17, "length");
  input[2] = objc_msgSend(v15, "length");
  v21 = xmmword_22960B2B0;
  if (-[AHTLoader open:](self, "open:", a6))
    v18 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOConnectCallScalarMethod(self->_connect, 1u, input, 5u, 0, 0), a6);
  else
    v18 = 0;

  return v18;
}

- (BOOL)overrideNextLoadOptions:(unint64_t)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IORegistryEntrySetCFProperty(self->_service, CFSTR("AIDNextLoadOptions"), v6), a4);

  return (char)a4;
}

+ (id)registryPropertiesForService:(unsigned int)a3
{
  CFMutableDictionaryRef properties;

  properties = 0;
  if (IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
    return 0;
  else
    return properties;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)imageTag
{
  return self->_imageTag;
}

- (unsigned)loadingGroup
{
  return self->_loadingGroup;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
