@implementation SKIOMedia

- (SKIOMedia)initWithDevName:(id)a3
{
  id v4;
  id v5;
  const __CFDictionary *v6;
  uint64_t MatchingService;
  SKIOMedia *v8;
  id v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
  v6 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)objc_msgSend(v5, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);

  if ((_DWORD)MatchingService)
  {
    v12.receiver = self;
    v12.super_class = (Class)SKIOMedia;
    self = -[SKIOObject initWithIOObject:](&v12, "initWithIOObject:", MatchingService);
    v8 = self;
  }
  else
  {
    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to find IO media entry for %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (SKIOMedia)initWithDADisk:(id)a3
{
  __DADisk *v4;
  __DADisk *v5;
  uint64_t v6;
  SKIOMedia *v7;
  id v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  __DADisk *v13;

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
    v8 = sub_10000BA9C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get IO media object for DA disk %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKIOMedia;
  self = -[SKIOObject initWithIOObject:](&v11, "initWithIOObject:", v6);
  v7 = self;
LABEL_8:

  return v7;
}

- (NSString)BSDName
{
  return (NSString *)-[SKIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("BSD Name"));
}

- (id)copyBlockDevice
{
  void *v2;
  SKBlockDevice *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKIOObject ioObjectWithClassName:iterateParents:](self, "ioObjectWithClassName:iterateParents:", CFSTR("IOBlockStorageDevice"), 1));
  v3 = -[SKIOObject initWithSKIOObject:]([SKBlockDevice alloc], "initWithSKIOObject:", v2);

  return v3;
}

@end
