@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  id v4;
  mach_port_t v5;
  id v6;
  const __CFDictionary *v7;
  uint64_t MatchingService;
  SKIOMedia *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDD8B18];
  objc_msgSend(v4, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = IOBSDNameMatching(v5, 0, (const char *)objc_msgSend(v6, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(v5, v7);

  if ((_DWORD)MatchingService)
  {
    v12.receiver = self;
    v12.super_class = (Class)SKIOMedia;
    self = -[SKIOObject initWithIOObject:](&v12, sel_initWithIOObject_, MatchingService);
    v9 = self;
  }
  else
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "Failed to find IO media entry for %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  __DADisk *v4;
  __DADisk *v5;
  uint64_t v6;
  SKIOMedia *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  __DADisk *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (__DADisk *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v6 = DADiskCopyIOMedia(v4);
  if (!(_DWORD)v6)
  {
    SKGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_22FE50000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get IO media object for DA disk %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)SKIOMedia;
  self = -[SKIOObject initWithIOObject:](&v10, sel_initWithIOObject_, v6);
  v7 = self;
LABEL_8:

  return v7;
}

- (NSString)BSDName
{
  return (NSString *)-[SKIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("BSD Name"));
}

- (id)copyBlockDevice
{
  void *v2;
  SKBlockDevice *v3;

  -[SKIOObject ioObjectWithClassName:iterateParents:](self, "ioObjectWithClassName:iterateParents:", CFSTR("IOBlockStorageDevice"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SKIOObject initWithSKIOObject:]([SKBlockDevice alloc], "initWithSKIOObject:", v2);

  return v3;
}

@end
