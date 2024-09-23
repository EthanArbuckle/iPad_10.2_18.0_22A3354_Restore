@implementation MBDriveProperties

+ (id)propertiesWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MBDriveProperties *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[MBDriveProperties initWithDrive:path:error:]([MBDriveProperties alloc], "initWithDrive:path:error:", v8, v7, a5);

  return v9;
}

- (MBDriveProperties)initWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MBDriveProperties *v13;
  const __CFString *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBProtectionClassFileHandleFactory factoryWithProtectionClass:](MBProtectionClassFileHandleFactory, "factoryWithProtectionClass:", 1));
  v15 = CFSTR("FileHandleFactory");
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataAtPath:options:error:", v8, v11, a5));

  if (v12)
  {
    v13 = -[MBDriveProperties initWithData:error:](self, "initWithData:error:", v12, a5);
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (void)removeAllContainers
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBDriveProperties;
  -[MBDriveProperties removeAllContainers](&v2, "removeAllContainers");
}

@end
