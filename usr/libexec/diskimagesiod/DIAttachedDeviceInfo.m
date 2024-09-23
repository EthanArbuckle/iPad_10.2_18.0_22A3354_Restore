@implementation DIAttachedDeviceInfo

- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4
{
  id v6;
  DIAttachedDeviceInfo *v7;
  DIIOMedia *v8;
  DIIOMedia *ioMedia;
  uint64_t v10;
  DIIOMedia *v11;
  NSNumber *v12;
  NSNumber *mediaSize;
  uint64_t v14;
  NSNumber *v15;
  NSNumber *blockSize;
  uint64_t v17;
  NSString *BSDName;
  DIAttachedDeviceInfo *v19;
  DIAttachedDeviceInfo *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DIAttachedDeviceInfo;
  v7 = -[DIAttachedDeviceInfo init](&v22, "init");
  if (!v7)
    goto LABEL_8;
  v8 = (DIIOMedia *)objc_msgSend(v6, "copyIOMediaWithError:", a4);
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = v8;

  v11 = v7->_ioMedia;
  if (!v11)
  {
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v12 = -[DIIOObject copyPropertyWithClass:key:](v11, "copyPropertyWithClass:key:", objc_opt_class(NSNumber, v10), CFSTR("Size"));
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = v12;

  v15 = -[DIIOObject copyPropertyWithClass:key:](v7->_ioMedia, "copyPropertyWithClass:key:", objc_opt_class(NSNumber, v14), CFSTR("Preferred Block Size"));
  blockSize = v7->_blockSize;
  v7->_blockSize = v15;

  v17 = objc_claimAutoreleasedReturnValue(-[DIIOMedia BSDName](v7->_ioMedia, "BSDName"));
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v17;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    v19 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, CFSTR("Basic information about the IOMedia device is missing"), a4));
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "diskImageDevice"))
  {
    if (!IOObjectConformsTo((io_object_t)objc_msgSend(v6, "ioObj"), "IOHDIXHDDriveNub"))
    {
      v19 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:description:error:](DIError, "nilWithEnumValue:description:error:", 157, CFSTR("Device is not a disk image"), a4));
      goto LABEL_10;
    }
    if (-[DIAttachedDeviceInfo fillDI1InfoWithDevice:error:](v7, "fillDI1InfoWithDevice:error:", v6, a4))
      goto LABEL_8;
    goto LABEL_13;
  }
  if (!-[DIAttachedDeviceInfo fillDI2InfoWithDevice:error:](v7, "fillDI2InfoWithDevice:error:", v6, a4))
    goto LABEL_13;
LABEL_8:
  v19 = v7;
LABEL_10:
  v20 = v19;
LABEL_14:

  return v20;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSURL *v9;
  NSURL *imageURL;
  NSURL **p_imageURL;
  uint64_t v12;
  id v13;
  NSURL *v14;
  NSURL *shadowURL;
  BOOL v16;
  uint64_t v17;
  id v18;
  NSURL *v19;
  NSURL *cacheURL;
  uint64_t v21;
  NSString *v22;
  NSString *instanceId;

  v6 = a3;
  v8 = objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v7), CFSTR("DiskImageURL"));
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v8);
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v9;
  }
  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0;
  }

  if (*p_imageURL)
  {
    v13 = objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v12), CFSTR("ShadowURL"));
    if (v13)
    {
      v14 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v13);
      shadowURL = self->_shadowURL;
      self->_shadowURL = v14;
    }
    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0;
    }

    v18 = objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v17), CFSTR("CacheURL"));
    if (v18)
    {
      v19 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v18);
      cacheURL = self->_cacheURL;
      self->_cacheURL = v19;
    }
    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0;
    }

    v22 = (NSString *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(NSString, v21), CFSTR("InstanceID"));
    instanceId = self->_instanceId;
    self->_instanceId = v22;

    self->_frameworkNum = 2;
    if (-[DIAttachedDeviceInfo setDI2PIDWithDevice:error:](self, "setDI2PIDWithDevice:error:", v6, a4))
      v16 = 1;
    else
      v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed to get Daemon PID"), a4);

  }
  else
  {
    v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Invalid or missing image URL key"), a4);
  }

  return v16;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  id v5;
  DIIOObject *v6;
  DIIOObject *v7;
  uint64_t v8;
  id v9;
  DIIOObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSNumber *v16;
  NSNumber *pid;
  uint64_t v19;

  v19 = -1;
  v5 = objc_msgSend(a3, "newIteratorWithOptions:error:", 0, a4);
  v6 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v5);
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo(-[DIIOObject ioObj](v7, "ioObj"), "DIDeviceIOUserClient"))
      {
        v9 = -[DIIOObject copyPropertyWithClass:key:](v7, "copyPropertyWithClass:key:", objc_opt_class(NSString, v8), CFSTR("IOUserClientCreator"));
        if (v9)
          break;
      }
      v10 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v5);

      v7 = v10;
      if (!v10)
        goto LABEL_6;
    }
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
    v15 = objc_msgSend(v13, "scanUpToCharactersFromSet:intoString:", v14, 0);

    if (v15 && objc_msgSend(v13, "scanInteger:", &v19))
    {
      v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
      pid = self->_pid;
      self->_pid = v16;

      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
LABEL_6:
    v11 = 0;
  }

  return v11;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);

  if (!v6)
  {
    v11 = CFSTR("Invalid path property (not UTF8)");
    goto LABEL_7;
  }
  v7 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v6);
  v8 = v7;
  if (!v7 || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme")), v9, !v9))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v6);

    v8 = v10;
    if (!v10)
    {
      v11 = CFSTR("Invalid path property (not a path or URL)");
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v11, a4));
    }
  }

  return v8;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  id v8;
  NSURL *v9;
  NSURL *imageURL;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSURL *v14;
  NSURL *shadowURL;
  BOOL v16;
  NSNumber *v17;
  NSNumber *pid;

  v7 = objc_msgSend(a3, "copyParentWithError:", a4);
  if (v7)
  {
    v8 = objc_msgSend(v7, "copyPropertyWithClass:key:", objc_opt_class(NSData, v6), CFSTR("image-path"));
    if (v8)
    {
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue(+[DIAttachedDeviceInfo DI1URLWithData:error:](DIAttachedDeviceInfo, "DI1URLWithData:error:", v8, a4));
      imageURL = self->_imageURL;
      self->_imageURL = v9;

      if (self->_imageURL)
      {
        v13 = objc_msgSend(v7, "copyPropertyWithClass:key:", objc_opt_class(NSData, v11), CFSTR("shadow-path"));
        if (v13
          && (v14 = (NSURL *)objc_claimAutoreleasedReturnValue(+[DIAttachedDeviceInfo DI1URLWithData:error:](DIAttachedDeviceInfo, "DI1URLWithData:error:", v13, a4)), shadowURL = self->_shadowURL, self->_shadowURL = v14, shadowURL, !self->_shadowURL))
        {
          v16 = 0;
        }
        else
        {
          v16 = 1;
          self->_frameworkNum = 1;
          v17 = (NSNumber *)objc_msgSend(v7, "copyPropertyWithClass:key:", objc_opt_class(NSNumber, v12), CFSTR("hdid-pid"));
          pid = self->_pid;
          self->_pid = v17;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&off_100196968;

            v16 = 1;
          }
        }

      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Missing image path property"), a4);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6;
  DIIOMedia *v7;
  id v8;
  DIAttachedDeviceInfo *v9;

  v6 = a3;
  v7 = -[DIIOMedia initWithDevName:error:]([DIIOMedia alloc], "initWithDevName:error:", v6, a4);

  if (v7)
  {
    v8 = -[DIIOMedia copyBlockDeviceWithError:](v7, "copyBlockDeviceWithError:", a4);
    if (v8)
    {
      self = -[DIAttachedDeviceInfo initWithDevice:error:](self, "initWithDevice:error:", v8, a4);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  void *v4;
  DIIOObject *v5;
  DIIOObject *v6;
  id v7;
  DIIOObject *v8;
  DIIOObject *v9;
  void *v10;
  DIBlockDevice *v11;
  DIAttachedDeviceInfo *v12;
  DIIOObject *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = -[DIIOObject initWithClassName:error:]([DIIOObject alloc], "initWithClassName:error:", CFSTR("IOHDIXController"), 0);
  v6 = v5;
  if (v5)
  {
    v7 = -[DIIOObject newIteratorWithOptions:error:](v5, "newIteratorWithOptions:error:", 0, a3);
    if (v7)
    {
      v8 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (objc_msgSend(v7, "startedOver"))
          {
            objc_msgSend(v4, "removeAllObjects");
            objc_msgSend(v7, "setStartedOver:", 0);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOObject ioObjectWithClassName:iterateParent:error:](v9, "ioObjectWithClassName:iterateParent:error:", CFSTR("IOHDIXHDDriveNub"), 0, a3));
          if (v10)
          {
            v11 = -[DIIOObject initWithDIIOObject:]([DIBlockDevice alloc], "initWithDIIOObject:", v10);
            v12 = -[DIAttachedDeviceInfo initWithDevice:error:]([DIAttachedDeviceInfo alloc], "initWithDevice:error:", v11, 0);
            if (v12)
              objc_msgSend(v4, "addObject:", v12);

          }
          v13 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v7);

          v9 = v13;
        }
        while (v13);
      }
      v14 = v4;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = v4;
  }

  return v14;
}

+ (id)newDI2DevicesArrayWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  DIBlockDevice *v8;
  DIBlockDevice *v9;
  DIAttachedDeviceInfo *v10;
  DIBlockDevice *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = +[DIIOObject copyDiskImagesControllerWithError:](DIIOObject, "copyDiskImagesControllerWithError:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "newIteratorWithOptions:error:", 0, a3);
    if (v7)
    {
      v8 = -[DIIOObject initWithIteratorNext:]([DIBlockDevice alloc], "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (objc_msgSend(v7, "startedOver"))
          {
            objc_msgSend(v4, "removeAllObjects");
            objc_msgSend(v7, "setStartedOver:", 0);
          }
          if (-[DIBlockDevice diskImageDevice](v9, "diskImageDevice"))
          {
            v10 = -[DIAttachedDeviceInfo initWithDevice:error:]([DIAttachedDeviceInfo alloc], "initWithDevice:error:", v9, 0);
            if (v10)
              objc_msgSend(v4, "addObject:", v10);

          }
          v11 = -[DIIOObject initWithIteratorNext:]([DIBlockDevice alloc], "initWithIteratorNext:", v7);

          v9 = v11;
        }
        while (v11);
      }
      v12 = v4;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)newDevicesArrayWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(a1, "newDI2DevicesArrayWithError:");
  if (v5)
  {
    v6 = objc_msgSend(a1, "newDI1DevicesArrayWithError:", a3);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));
      objc_msgSend(v7, "addObjectsFromArray:", v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo BSDName](self, "BSDName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo imageURL](self, "imageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attached disk image device info: BSD Name [%@], image URL [%@]"), v3, v4));

  return v5;
}

+ (id)copyAllMountPoints
{
  void *v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v18;
  uint64_t v19;
  statfs *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v20 = 0;
  v3 = getmntinfo_r_np(&v20, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = 2168 * v3;
      do
      {
        v6 = +[DIHelpers copyDevicePathWithStatfs:](DIHelpers, "copyDevicePathWithStatfs:", &v20[v4 / 0x878]);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20[v4 / 0x878].f_mntonname));
        if (v6)
        {
          if (objc_msgSend(v6, "hasPrefix:", CFSTR("/dev/disk")))
            v8 = v7 == 0;
          else
            v8 = 1;
          if (!v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v9);

          }
        }

        v4 += 2168;
      }
      while (v5 != v4);
    }
    free(v20);
  }
  else
  {
    v10 = *__error();
    if (sub_1000BF0BC())
    {
      v19 = 0;
      v11 = sub_1000BF044();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      *(_DWORD *)buf = 68157954;
      v22 = 42;
      v23 = 2080;
      v24 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      LODWORD(v18) = 18;
      v14 = (char *)_os_log_send_and_compose_impl(v13, &v19, 0, 0, &_mh_execute_header, v12, 16, "%.*s: Failed getting mounts list", (int)buf, v18);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      v15 = sub_1000BF044();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v22 = 42;
        v23 = 2080;
        v24 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%.*s: Failed getting mounts list", buf, 0x12u);
      }

    }
    *__error() = v10;
  }
  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  const __CFString *v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "BSDName"));
  v8 = (void *)v7;
  if (v7)
  {
    v15 = CFSTR("BSD Name");
    v16 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("Mount Point"));

    v13 = objc_msgSend(v5, "copyPropertyWithClass:key:", objc_opt_class(NSString, v12), CFSTR("Content"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("Content"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyEntitiesList
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  DIIOMedia *v9;
  DIIOMedia *v10;
  id v11;
  DIIOMedia *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = +[DIAttachedDeviceInfo copyAllMountPoints](DIAttachedDeviceInfo, "copyAllMountPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo ioMedia](self, "ioMedia"));
  v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:](DIAttachedDeviceInfo, "newEntityDictWithIOMedia:mountPoints:", v5, v4);

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo ioMedia](self, "ioMedia"));
  v8 = objc_msgSend(v7, "newIteratorWithOptions:error:", 1, 0);

  if (v8)
  {
    v9 = -[DIIOObject initWithIteratorNext:]([DIIOMedia alloc], "initWithIteratorNext:", v8);
    if (v9)
    {
      v10 = v9;
      do
      {
        if (objc_msgSend(v8, "startedOver"))
        {
          objc_msgSend(v3, "removeAllObjects");
          objc_msgSend(v8, "setStartedOver:", 0);
        }
        if (IOObjectConformsTo(-[DIIOObject ioObj](v10, "ioObj"), "IOMedia"))
        {
          v11 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:](DIAttachedDeviceInfo, "newEntityDictWithIOMedia:mountPoints:", v10, v4);
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

        }
        v12 = -[DIIOObject initWithIteratorNext:]([DIIOMedia alloc], "initWithIteratorNext:", v8);

        v10 = v12;
      }
      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];

  v22[0] = CFSTR("BSD Name");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo BSDName](self, "BSDName"));
  v23[0] = v21;
  v22[1] = CFSTR("DiskImages Framework");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[DIAttachedDeviceInfo frameworkNum](self, "frameworkNum")));
  v23[1] = v3;
  v22[2] = CFSTR("DiskImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo imageURL](self, "imageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  v23[2] = v5;
  v22[3] = CFSTR("Size");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo mediaSize](self, "mediaSize"));
  v23[3] = v6;
  v22[4] = CFSTR("Preferred Block Size");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo blockSize](self, "blockSize"));
  v23[4] = v7;
  v22[5] = CFSTR("System Entities");
  v8 = -[DIAttachedDeviceInfo copyEntitiesList](self, "copyEntitiesList");
  v23[5] = v8;
  v22[6] = CFSTR("Daemon PID");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo pid](self, "pid"));
  v23[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo shadowURL](self, "shadowURL"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo shadowURL](self, "shadowURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ShadowURL"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo cacheURL](self, "cacheURL"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo cacheURL](self, "cacheURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("CacheURL"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo instanceId](self, "instanceId"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachedDeviceInfo instanceId](self, "instanceId"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("InstanceID"));

  }
  return v11;
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)shadowURL
{
  return self->_shadowURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)frameworkNum
{
  return self->_frameworkNum;
}

- (NSNumber)mediaSize
{
  return self->_mediaSize;
}

- (NSNumber)blockSize
{
  return self->_blockSize;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (DIIOMedia)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(id)a3
{
  objc_storeStrong((id *)&self->_ioMedia, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioMedia, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_blockSize, 0);
  objc_storeStrong((id *)&self->_mediaSize, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_shadowURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end
