@implementation DeviceType

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_4);
  return (id)sharedInstance_device_type;
}

void __28__DeviceType_sharedInstance__block_invoke(id a1)
{
  DeviceType *v1;
  void *v2;

  v1 = objc_alloc_init(DeviceType);
  v2 = (void *)sharedInstance_device_type;
  sharedInstance_device_type = (uint64_t)v1;

}

- (DeviceType)init
{
  DeviceType *v2;
  id v3;
  id v4;
  NSString *v5;
  NSString *product_type;
  id v7;
  NSString *v8;
  NSString *hardware_model;
  id v10;
  NSString *v11;
  NSString *device_class;
  id v13;
  id v14;
  NSString *v15;
  NSString *soc_generation;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSCharacterSet *v33;
  id v34;
  id v35;
  void *v36;
  unsigned int v37;
  NSFileManager *v38;
  unsigned int v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  unsigned int v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  unsigned int v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)DeviceType;
  v2 = -[DeviceType init](&v60, "init");
  if (v2)
  {
    v2->_is_internal_build = os_variant_allows_internal_security_policies(objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String"));
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics(objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String"));
    v3 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
    v4 = objc_msgSend(v3, "copyAnswer:", CFSTR("ProductType"));
    v5 = (NSString *)isNSString(v4);
    product_type = v2->_product_type;
    v2->_product_type = v5;

    v7 = objc_msgSend(v3, "copyAnswer:", CFSTR("HWModelStr"));
    v8 = (NSString *)isNSString(v7);
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = v8;

    v2->_is_ipod = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPod"));
    v2->_is_ipad = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPad"));
    v2->_is_iphone = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPhone"));
    v2->_is_audio_accessory = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("AudioAccessory"));
    v2->_is_dev_board = -[NSString hasSuffix:](v2->_hardware_model, "hasSuffix:", CFSTR("DEV"));
    v10 = objc_msgSend(v3, "copyAnswer:", CFSTR("DeviceClass"));
    v11 = (NSString *)isNSString(v10);
    device_class = v2->_device_class;
    v2->_device_class = v11;

    v2->_has_baseband = objc_msgSend(v3, "getBoolAnswer:", CFSTR("HasBaseband"));
    v13 = objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/arm-io"));
    v14 = -[DeviceType copyDeviceTreeString:key:defaultValue:](v2, "copyDeviceTreeString:key:defaultValue:", v13, CFSTR("soc-generation"), 0);
    v15 = (NSString *)objc_msgSend(v14, "uppercaseString");
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = v15;

    v17 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
    v18 = objc_msgSend(v17, "copyAnswer:", CFSTR("ChipID"));
    v19 = isNSNumber(v18);

    if ((objc_msgSend(v19, "isEqualToNumber:", &off_1002715E0) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &off_1002715F8) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &off_100271610) & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }
    else
    {
      v20 = objc_msgSend(v19, "isEqualToNumber:", &off_100271628) ^ 1;
    }
    v2->_device_supports_mfi_certificates = v20;
    if ((objc_msgSend(v19, "isEqualToNumber:", &off_100271628) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &off_1002715F8) & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      v21 = objc_msgSend(v19, "isEqualToNumber:", &off_100271610) ^ 1;
    }
    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = objc_msgSend(v3, "getBoolAnswer:", CFSTR("DeviceSupportsFairPlaySecureVideoPath"));
    v22 = objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/product"));
    v23 = -[DeviceType copyDeviceTreeInt:key:defaultValue:](v2, "copyDeviceTreeInt:key:defaultValue:", v22, CFSTR("allow-hactivation"), 0);

    v24 = objc_msgSend(v3, "copyAnswer:", CFSTR("CertificateProductionStatus"));
    v25 = isNSNumber(v24);

    v26 = objc_msgSend(v3, "copyAnswer:", CFSTR("EffectiveProductionStatusAp"));
    v27 = isNSNumber(v26);

    v28 = objc_msgSend(v3, "copyAnswer:", CFSTR("CertificateSecurityMode"));
    v29 = isNSNumber(v28);

    v30 = objc_msgSend(v3, "copyAnswer:", CFSTR("EffectiveSecurityModeSEP"));
    v31 = isNSNumber(v30);

    if (v25 && v27 && v31 && v29)
    {
      if (objc_msgSend(v25, "isEqualToNumber:", &off_100271640)
        && objc_msgSend(v27, "isEqualToNumber:", &off_100271658)
        && objc_msgSend(v29, "isEqualToNumber:", &off_100271640)
        && objc_msgSend(v31, "isEqualToNumber:", &off_100271640))
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }
      if (objc_msgSend(v25, "isEqualToNumber:", &off_100271658)
        && objc_msgSend(v27, "isEqualToNumber:", &off_100271658)
        && objc_msgSend(v29, "isEqualToNumber:", &off_100271640)
        && objc_msgSend(v31, "isEqualToNumber:", &off_100271640))
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }
    if (!v2->_is_internal_build)
      goto LABEL_50;
    if (!v2->_should_hactivate)
      v2->_should_hactivate = objc_msgSend(v3, "getBoolAnswer:", CFSTR("ShouldHactivate"));
    v32 = -[DeviceType copyBootArgs](v2, "copyBootArgs");
    v33 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    v55 = v32;
    v34 = objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);

    if (-[NSString containsString:](v2->_product_type, "containsString:", CFSTR("iFPGA")))
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }
    v56 = v29;
    if (v2->_is_dev_board)
      v2->_should_hactivate = 1;
    v35 = isNSNumber(v23);
    if (v35)
    {
      v36 = v35;
      v37 = objc_msgSend(v23, "BOOLValue");

      if (v37)
        v2->_should_hactivate = 1;
    }
    if (objc_msgSend(v34, "containsObject:", CFSTR("disable-hactivation-ma=1")))
      v2->_should_hactivate = 0;
    v58 = v27;
    v59 = v34;
    v57 = v23;
    v38 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v39 = -[NSFileManager fileExistsAtPath:](v38, "fileExistsAtPath:", CFSTR("/AppleInternal/Lockdown/.hactivateoff"));

    if (v39)
      v2->_should_hactivate = 0;
    v40 = v31;
    v41 = objc_alloc((Class)NSUserDefaults);
    v42 = objc_msgSend(v41, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));

    v43 = objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DisableHactivation"));
    v44 = isNSNumber(v43);
    if (v44)
    {
      v45 = v44;
      v46 = objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DisableHactivation"));
      v47 = objc_msgSend(v46, "BOOLValue");

      if (v47)
        v2->_should_hactivate = 0;
    }
    else
    {

    }
    v48 = v59;
    if (is_virtual_machine())
    {
      v49 = objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen"));
      v50 = -[DeviceType copyDeviceTreeInt:key:defaultValue:](v2, "copyDeviceTreeInt:key:defaultValue:", v49, CFSTR("enable-avp-fairplay"), 0);

      v51 = isNSNumber(v50);
      v31 = v40;
      if (v51)
      {
        v52 = v51;
        v53 = objc_msgSend(v50, "BOOLValue");

        v27 = v58;
        if (v53)
          v2->_should_hactivate = 0;
        v23 = v57;
        v48 = v59;
        goto LABEL_49;
      }
    }
    else
    {
      v50 = 0;
      v31 = v40;
    }
    v23 = v57;
    v27 = v58;
LABEL_49:

    v29 = v56;
LABEL_50:

  }
  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  CFTypeRef CFProperty;
  io_registry_entry_t v8;
  io_object_t v9;

  v5 = (__CFString *)a4;
  v6 = v5;
  CFProperty = 0;
  if (a3 && v5)
  {
    v8 = IORegistryEntryFromPath(kIOMasterPortDefault, (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"));
    if (v8)
    {
      v9 = v8;
      CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyBootSessionUUID
{
  id v2;
  void *v3;
  void *v4;
  size_t size;

  size = 0;
  v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v3 = malloc_type_malloc(size, 0x14BD9A43uLL);
    if (v3)
    {
      v4 = v3;
      v2 = 0;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0))
        v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v4);
      free(v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)copyBootArgs
{
  int v2;
  id result;
  size_t v4;
  _BYTE v5[1024];

  bzero(v5, 0x400uLL);
  v4 = 1024;
  v2 = sysctlbyname("kern.bootargs", v5, &v4, 0, 0);
  result = 0;
  if (!v2)
    return objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v5);
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSNumber *v10;
  NSNumber *v11;
  id v12;
  id v13;
  id v14;
  NSNumber *v15;
  unsigned int v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5);
  v11 = 0;
  v17 = v5;
  if (v8 && v9)
  {
    v11 = -[DeviceType copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", v8, v9);
    v12 = isNSData(v11);
    if (v12)
    {

    }
    else
    {
      v13 = isNSNumber(v11);

      if (!v13)
        goto LABEL_10;
    }
    v14 = isNSData(v11);

    if (v14)
    {
      if (-[NSNumber length](v11, "length") == (id)4)
      {
        -[NSNumber getBytes:length:](v11, "getBytes:length:", &v17, 4);
        v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17);

        v10 = v15;
      }
    }
    else
    {
      v11 = v11;

      v10 = v11;
    }
  }
LABEL_10:

  return v10;
}

- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v8 = a5;
  v9 = v8;
  v10 = 0;
  if (!a3)
    goto LABEL_6;
  v11 = v8;
  if (a4)
  {
    v10 = -[DeviceType copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", a3, a4);
    v12 = isNSData(v10);
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(v10, "length");

      if (v14)
      {
        v15 = objc_alloc((Class)NSString);
        v10 = objc_retainAutorelease(v10);
        v11 = objc_msgSend(v15, "initWithUTF8String:", objc_msgSend(v10, "bytes"));

        goto LABEL_7;
      }
    }
LABEL_6:
    v11 = v9;
  }
LABEL_7:

  return v11;
}

- (BOOL)runningInRAMDisk
{
  id v2;
  NSCharacterSet *v3;
  id v4;
  unsigned __int8 v5;

  v2 = -[DeviceType copyBootArgs](self, "copyBootArgs");
  if (v2
    && (v3 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"),
        v4 = objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3),
        v3,
        v4))
  {
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("-restore"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)product_type
{
  return self->_product_type;
}

- (NSString)device_class
{
  return self->_device_class;
}

- (NSString)hardware_model
{
  return self->_hardware_model;
}

- (NSString)soc_generation
{
  return self->_soc_generation;
}

- (BOOL)device_supports_dcrt_oob
{
  return self->_device_supports_dcrt_oob;
}

- (BOOL)device_supports_mfi_certificates
{
  return self->_device_supports_mfi_certificates;
}

- (BOOL)device_supports_eda_certificates
{
  return self->_device_supports_eda_certificates;
}

- (BOOL)is_prodfused_demoted
{
  return self->_is_prodfused_demoted;
}

- (BOOL)is_devfused_undemoted
{
  return self->_is_devfused_undemoted;
}

- (BOOL)is_dev_board
{
  return self->_is_dev_board;
}

- (BOOL)is_fpga
{
  return self->_is_fpga;
}

- (BOOL)is_ipod
{
  return self->_is_ipod;
}

- (BOOL)is_ipad
{
  return self->_is_ipad;
}

- (BOOL)is_iphone
{
  return self->_is_iphone;
}

- (BOOL)is_audio_accessory
{
  return self->_is_audio_accessory;
}

- (BOOL)has_baseband
{
  return self->_has_baseband;
}

- (BOOL)should_hactivate
{
  return self->_should_hactivate;
}

- (BOOL)is_internal_build
{
  return self->_is_internal_build;
}

- (BOOL)has_internal_diagnostics
{
  return self->_has_internal_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soc_generation, 0);
  objc_storeStrong((id *)&self->_hardware_model, 0);
  objc_storeStrong((id *)&self->_device_class, 0);
  objc_storeStrong((id *)&self->_product_type, 0);
}

@end
