@implementation GestaltHlpr

+ (id)getSharedInstance
{
  if (getSharedInstance_once_0 != -1)
    dispatch_once(&getSharedInstance_once_0, &__block_literal_global_2);
  return (id)getSharedInstance_sharedInstance_0;
}

void __32__GestaltHlpr_getSharedInstance__block_invoke(id a1)
{
  GestaltHlpr *v1;
  void *v2;

  v1 = objc_opt_new(GestaltHlpr);
  v2 = (void *)getSharedInstance_sharedInstance_0;
  getSharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (id)copyAnswer:(__CFString *)a3
{
  void *v4;
  const __CFString *v5;

  if (!a3)
    return 0;
  v4 = (void *)MGCopyAnswer(a3, 0);
  if (os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String"))
    && is_virtual_machine())
  {
    if ((-[__CFString isEqualToString:](a3, "isEqualToString:", CFSTR("ProductType")) & 1) != 0)
    {
      v5 = CFSTR("iPod5,1");
LABEL_9:

      return (id)v5;
    }
    if (-[__CFString isEqualToString:](a3, "isEqualToString:", CFSTR("DeviceClass")))
    {
      v5 = CFSTR("iPod");
      goto LABEL_9;
    }
  }
  return v4;
}

- (BOOL)getBoolAnswer:(__CFString *)a3
{
  id v3;
  id v4;

  v3 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", a3);
  v4 = isNSNumber(v3);

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  return (char)v3;
}

- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSString *v17;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", a3);
  v13 = v12;
  if (v12
    && ((v14 = isNSString(v12)) == 0
     || (v15 = v14, v16 = objc_msgSend(v13, "length"), v15, v16)))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, a3);
  }
  else if (v7)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), a3);
    objc_msgSend(v11, "addObject:", v17);

  }
}

- (id)copyDeviceIDInfo:(id *)a3
{
  id v5;
  id v6;
  id v7;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v6, 1, v5);
  v7 = objc_msgSend(v5, "count");
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (id)copyDeviceInfo:(id *)a3
{
  id v5;
  id v6;
  id v7;
  NSString *v8;
  id v9;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ModelNumber"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductVersion"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionCode"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionInfo"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegulatoryModelNumber"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ReleaseType"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueChipID"), v6, 1, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 0, v5);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SigningFuse"), v6, 0, v5);
  v7 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", CFSTR("ProductName"));
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("OSType"));
  }
  else
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), CFSTR("ProductName"));
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = objc_msgSend(v5, "count");
  if (a3 && v9)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (id)copyRegulatoryImagesInfo:(id *)a3
{
  id v5;
  id v6;
  id v7;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 1, v5);
  v7 = objc_msgSend(v5, "count");
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (void)updateRecertInfo:(id)a3 errors:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  if (v6)
  {
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v6, 0, v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v6, 1, v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v6, 1, v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v6, 0, v7);
    -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v6, 0, v7);
    if (-[GestaltHlpr getBoolAnswer:](self, "getBoolAnswer:", CFSTR("HasBaseband")))
    {
      -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("InternationalMobileEquipmentIdentity"), v6, 0, v7);
      v8 = -[GestaltHlpr copyAnswer:](self, "copyAnswer:", CFSTR("xRyzf9zFE/ycr/wJPweZvQ"));
      if (v8)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("InternationalMobileEquipmentIdentity2"));
      -[GestaltHlpr addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("MobileEquipmentIdentifier"), v6, 0, v7);
    }
    else
    {
      v8 = 0;
    }
    v9 = objc_msgSend(v7, "count");
    if (a4 && v9)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v8 = 0;
  }

}

@end
