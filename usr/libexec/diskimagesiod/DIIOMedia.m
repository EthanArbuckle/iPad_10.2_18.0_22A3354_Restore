@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  DIIOMedia *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
  v8 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)objc_msgSend(v7, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v8);

  if ((_DWORD)MatchingService)
  {
    v13.receiver = self;
    v13.super_class = (Class)DIIOMedia;
    self = -[DIIOObject initWithIOObject:](&v13, "initWithIOObject:", MatchingService);
    v10 = self;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to find IO media entry for %@"), v6));
    v10 = (DIIOMedia *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v11, a4));

  }
  return v10;
}

- (NSString)BSDName
{
  return (NSString *)-[DIIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(NSString, a2), CFSTR("BSD Name"));
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  void *v3;
  DIBlockDevice *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOObject ioObjectWithClassName:iterateParent:error:](self, "ioObjectWithClassName:iterateParent:error:", CFSTR("IOBlockStorageDevice"), 1, a3));
  v4 = -[DIIOObject initWithDIIOObject:]([DIBlockDevice alloc], "initWithDIIOObject:", v3);

  return v4;
}

@end
