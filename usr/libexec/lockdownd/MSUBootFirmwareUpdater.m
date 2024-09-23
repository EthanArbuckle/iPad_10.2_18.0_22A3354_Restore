@implementation MSUBootFirmwareUpdater

+ (id)_updaterClasses
{
  id *v3;
  uint64_t v4;
  id v6;
  _QWORD v7[5];

  if ((id)objc_opt_class(MSUBootFirmwareUpdater) == a1)
  {
    v7[0] = objc_opt_class(SPIiBootUpdater);
    v7[1] = objc_opt_class(PCIeNANDiBootUpdater);
    v7[2] = objc_opt_class(ASPStorageiBootUpdater);
    v7[3] = objc_opt_class(NVMEiBootUpdater);
    v7[4] = objc_opt_class(IMG3NorUpdater);
    v3 = (id *)v7;
    v4 = 5;
  }
  else
  {
    v6 = a1;
    v3 = &v6;
    v4 = 1;
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4);
}

+ (id)updater
{
  id result;
  __objc2_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if ((id)objc_opt_class(MSUBootFirmwareUpdater) != a1)
    return objc_alloc_init((Class)a1);
  if (objc_msgSend(a1, "supportsPCIeNANDBoot"))
  {
    v4 = PCIeNANDiBootUpdater;
    return -[__objc2_class updater](v4, "updater");
  }
  if (objc_msgSend(a1, "supportsDualiBoot"))
  {
    v4 = SPIiBootUpdater;
    return -[__objc2_class updater](v4, "updater");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(a1, "_updaterClasses", 0);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
LABEL_10:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v5);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "updater");
      if (result)
        break;
      if (v6 == (id)++v8)
      {
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
        if (result)
          goto LABEL_10;
        return result;
      }
    }
  }
  return result;
}

+ (id)updaterWithIOService:(unsigned int)a3
{
  uint64_t v3;
  id result;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = *(_QWORD *)&a3;
  if ((id)objc_opt_class(MSUBootFirmwareUpdater) != a1)
    return objc_msgSend(objc_alloc((Class)a1), "initWithIOService:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = objc_msgSend(a1, "_updaterClasses", 0);
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v6);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "updaterWithIOService:", v3);
      if (result)
        break;
      if (v7 == (id)++v9)
      {
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v7 = result;
        if (result)
          goto LABEL_5;
        return result;
      }
    }
  }
  return result;
}

+ (id)updaterWithTimeout:(double)a3
{
  NSProcessInfo *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  objc_class *v25;
  NSString *v27;

  v5 = +[NSProcessInfo processInfo](NSProcessInfo, "processInfo");
  -[NSProcessInfo systemUptime](v5, "systemUptime");
  v7 = v6 + a3;
  NSStringFromClass((Class)a1);
  iBU_LOG_real((uint64_t)CFSTR("Waiting %ld seconds for %@\n"), "+[MSUBootFirmwareUpdater updaterWithTimeout:]", v8, v9, v10, v11, v12, v13, llround(a3));
  while (1)
  {
    v14 = objc_msgSend(a1, "updater");
    v15 = v14;
    if (v14)
      break;
    -[NSProcessInfo systemUptime](v5, "systemUptime");
    v17 = llround(v7 - v16);
    sleep(v17 > 0);
    if (v17 <= 0)
    {
      v24 = CFSTR("Found no matching service.");
      goto LABEL_6;
    }
  }
  v25 = (objc_class *)objc_opt_class(v14);
  v27 = NSStringFromClass(v25);
  v24 = CFSTR("Created an instance of %@ to update this device's firmware and boot images");
LABEL_6:
  iBU_LOG_real((uint64_t)v24, "+[MSUBootFirmwareUpdater updaterWithTimeout:]", v18, v19, v20, v21, v22, v23, (uint64_t)v27);
  return v15;
}

+ (id)updaterForDevice
{
  return objc_msgSend(a1, "updaterWithTimeout:", 60.0);
}

+ (id)IOMatchingPropertyTable
{
  return 0;
}

- (MSUBootFirmwareUpdater)init
{
  id v3;

  v3 = objc_msgSend((id)objc_opt_class(self), "IOMatchingPropertyTable");
  return -[MSUBootFirmwareUpdater initWithIOServiceMatching:](self, "initWithIOServiceMatching:", v3);
}

- (MSUBootFirmwareUpdater)initWithIOService:(unsigned int)a3
{
  MSUBootFirmwareUpdater *v4;
  MSUBootFirmwareUpdater *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  BOOL v8;
  BOOLean_t matches;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSUBootFirmwareUpdater;
  v4 = -[MSUBootFirmwareUpdater init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    matches = 0;
    v6 = (const __CFDictionary *)objc_msgSend((id)objc_opt_class(v4), "IOMatchingPropertyTable");
    if (a3
      && (v7 = v6, -[__CFDictionary count](v6, "count"))
      && (!IOServiceMatchPropertyTable(a3, v7, &matches) ? (v8 = matches == 0) : (v8 = 1), !v8))
    {
      IOServiceWaitQuiet(a3, 0);
      IOObjectRetain(a3);
      v5->_matchedService = a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (MSUBootFirmwareUpdater)initWithIOServiceMatching:(id)a3
{
  const __CFDictionary *v5;
  uint64_t MatchingService;
  MSUBootFirmwareUpdater *v7;
  uint64_t v9;
  _OWORD v10[5];

  if (objc_msgSend(a3, "count"))
  {
    if (a3)
      v5 = (const __CFDictionary *)CFRetain(a3);
    else
      v5 = 0;
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  }
  else
  {
    MatchingService = 0;
  }
  v7 = -[MSUBootFirmwareUpdater initWithIOService:](self, "initWithIOService:", MatchingService);
  if ((_DWORD)MatchingService && IOObjectRelease(MatchingService))
    sub_1000F9A74(&v9, v10);
  return v7;
}

- (void)setApNonce:(id)a3
{
  NSData *v4;

  v4 = (NSData *)objc_msgSend(a3, "copy");

  self->_apNonce = v4;
  self->_apNonceSlotID = 0;
  self->_supportsSlotIDs = 0;
}

- (void)setApNonceSlotID:(unsigned int)a3
{

  self->_apNonce = 0;
  self->_apNonceSlotID = a3;
  self->_supportsSlotIDs = 1;
}

- (void)dealloc
{
  io_object_t matchedService;
  objc_super v4;

  matchedService = self->_matchedService;
  if (matchedService)
    IOObjectRelease(matchedService);
  v4.receiver = self;
  v4.super_class = (Class)MSUBootFirmwareUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v4, "dealloc");
}

+ (BOOL)supportsAFUH
{
  return sub_10009786C("IODeviceTree:/product", CFSTR("atomic-firmware-update-support"));
}

+ (BOOL)supportsPCIeNANDBoot
{
  return sub_10009786C("IODeviceTree:/defaults", CFSTR("pcie-nand-boot-supported"));
}

+ (BOOL)supportsDualiBoot
{
  int v3;

  v3 = sub_10009786C("IODeviceTree:/product", CFSTR("dual-iboot-support"));
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "supportsPCIeNANDBoot") ^ 1;
  return v3;
}

+ (BOOL)supportsDualSPINAND
{
  return sub_1000979B4(CFSTR("dual-spi-nand"));
}

+ (BOOL)requiresSEPInFW
{
  return sub_1000979B4(CFSTR("sep-is-firmware-payload"));
}

+ (BOOL)isSingleStageBoot
{
  return sub_10009786C("IODeviceTree:/product", CFSTR("single-stage-boot"));
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  return 0;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  return -[MSUBootFirmwareUpdater updateBootFirmwareWithError:](self, "updateBootFirmwareWithError:", a5, a4);
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  NSMutableArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v72;
  id v73;
  firmware_update_context *v74;
  void *v75;
  ramrod_update_callbacks *v76;
  id v77;
  NSArray *obj;
  NSMutableArray *v79;
  _QWORD v80[5];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  _BYTE v89[128];
  _QWORD v90[5];

  v7 = objc_opt_new(NSMutableArray);
  v79 = objc_opt_new(NSMutableArray);
  v90[0] = CFSTR("iBoot");
  v90[1] = CFSTR("ANS");
  v90[2] = CFSTR("iBootData");
  v90[3] = CFSTR("DCP");
  v90[4] = CFSTR("AppleLogo");
  obj = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 5);
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 1;
  v8 = (void *)((uint64_t (*)(firmware_update_context *))a3->var2)(a4);
  -[NSMutableArray addObject:](v7, "addObject:", v8);
  v9 = (void *)((uint64_t (*)(firmware_update_context *))a3->var3)(a4);
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = objc_msgSend(v9, "mutableCopy");
    if (objc_msgSend((id)objc_opt_class(self), "isSingleStageBoot"))
    {
      iBU_LOG_real((uint64_t)CFSTR("iBoot data provided in firmware images yet this is single-stage-boot device - removing from firmware images being updated."), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v12, v13, v14, v15, v16, v17, v72);
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("iBoot"));
      v18 = 0;
    }
    else
    {
      v18 = objc_msgSend(v11, "objectForKey:", CFSTR("iBoot"));
    }
    v77 = objc_msgSend(v11, "objectForKey:", CFSTR("Dali"));
    iBU_LOG_real((uint64_t)CFSTR("Ordered firmware image names: %@."), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v29, v30, v31, v32, v33, v34, (uint64_t)obj);
    v76 = a3;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    v73 = v18;
    v74 = a4;
    v75 = v9;
    v27 = 0;
    v28 = 0;
    if (v35)
    {
      v36 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v82 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "objectForKeyedSubscript:", v38))
          {
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("ANS")))
            {
              iBU_LOG_real((uint64_t)CFSTR("Pulling ANS out of the list of firmwares."), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v39, v40, v41, v42, v43, v44, v72);
              v27 = objc_msgSend(v11, "objectForKeyedSubscript:", v38);
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("AppleLogo")))
            {
              iBU_LOG_real((uint64_t)CFSTR("Pulling Logo out of the list of firmwares."), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v45, v46, v47, v48, v49, v50, v72);
              v28 = objc_msgSend(v11, "objectForKeyedSubscript:", v38);
            }
            -[NSMutableArray addObject:](v79, "addObject:", objc_msgSend(v11, "objectForKeyedSubscript:", v38));
            objc_msgSend(v11, "removeObjectForKey:", v38);
          }
        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
      }
      while (v35);
    }
    v9 = v75;
    v26 = v73;
    a4 = v74;
    a3 = v76;
    -[NSMutableArray addObjectsFromArray:](v79, "addObjectsFromArray:", objc_msgSend(v11, "allValues"));

  }
  else
  {
    v19 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v9, v19) & 1) == 0)
    {
      iBU_LOG_real((uint64_t)CFSTR("request for images data returned non-Array and non-Dictionary. Type returned was: %@"), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v20, v21, v22, v23, v24, v25, (uint64_t)v9);
LABEL_29:
      v70 = 0;
      goto LABEL_30;
    }
    -[NSMutableArray addObjectsFromArray:](v79, "addObjectsFromArray:", v9);
    v77 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }
  if (objc_msgSend((id)objc_opt_class(self), "requiresSEPInFW"))
  {
    v51 = (void *)((uint64_t (*)(firmware_update_context *))a3->var6)(a4);
    iBU_LOG_real((uint64_t)CFSTR("Appending SEP to firmwareImages"), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v52, v53, v54, v55, v56, v57, v72);
    if (!v51)
    {
      iBU_LOG_real((uint64_t)CFSTR("NULL returned from copy_sep()!"), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v58, v59, v60, v61, v62, v63, v72);
      goto LABEL_29;
    }
    -[NSMutableArray addObject:](v79, "addObject:", v51);

  }
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3254779904;
  v80[2] = sub_100097F94;
  v80[3] = &unk_100181850;
  v80[4] = &v85;
  -[NSMutableArray enumerateObjectsUsingBlock:](v79, "enumerateObjectsUsingBlock:", v80);
  if (!*((_BYTE *)v86 + 24))
  {
    iBU_LOG_real((uint64_t)CFSTR("Firmware images array contains non-CFDataRef/non-NSArray."), "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]", v64, v65, v66, v67, v68, v69, v72);
    goto LABEL_29;
  }
  ((void (*)(_QWORD, _QWORD, firmware_update_context *))a3->var1)(0, 0, a4);
  -[MSUBootFirmwareUpdater setBootBlockImages:](self, "setBootBlockImages:", v7);
  -[MSUBootFirmwareUpdater setFirmwareImages:](self, "setFirmwareImages:", v79);
  -[MSUBootFirmwareUpdater setDaliData:](self, "setDaliData:", v77);
  -[MSUBootFirmwareUpdater setIbootData:](self, "setIbootData:", v26);
  -[MSUBootFirmwareUpdater setLlbData:](self, "setLlbData:", v8);
  -[MSUBootFirmwareUpdater setAns2Data:](self, "setAns2Data:", v27);
  -[MSUBootFirmwareUpdater setLogoData:](self, "setLogoData:", v28);
  v70 = 1;
LABEL_30:

  _Block_object_dispose(&v85, 8);
  return v70;
}

- (id)copyFirmwareWithRestoreInfo:(id)a3
{
  return -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", a3, -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary"));
}

- (id)_restoreInfoDictionary
{
  NSNumber **v3;
  const __CFString **v4;
  NSData *v5;
  CFTypeRef v6;
  const __CFString *v8;
  NSData *v9;
  const __CFString *v10;
  NSNumber *v11;

  if (-[MSUBootFirmwareUpdater supportsSlotIDs](self, "supportsSlotIDs"))
  {
    v10 = CFSTR("anid");
    v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MSUBootFirmwareUpdater apNonceSlotID](self, "apNonceSlotID"));
    v3 = &v11;
    v4 = &v10;
  }
  else
  {
    v5 = -[MSUBootFirmwareUpdater apNonce](self, "apNonce");
    if (!v5)
    {
      v6 = sub_100098134("IODeviceTree:/chosen", CFSTR("boot-nonce"));
      v5 = (id)CFMakeCollectable(v6);
      if (!v5)
        return (id)__NSDictionary0__;
    }
    v8 = CFSTR("BNCN");
    v9 = v5;
    v3 = (NSNumber **)&v9;
    v4 = &v8;
  }
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v4, 1);
}

- (int)_encodeAndWriteFirmware:(id)a3 toWriter:(id)a4 withError:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary");
  if (!a3)
  {
    if (!a5)
      return -536870212;
    v19 = CFSTR("_encodeAndWriteFirmware called with NULL data?");
LABEL_9:
    v20 = 7;
LABEL_12:
    *a5 = MSUBootFirmwareError(v20, 0, (uint64_t)v19, v10, v11, v12, v13, v14, v21);
    return -536870212;
  }
  v10 = (uint64_t)v9;
  if (!v9)
  {
    if (!a5)
      return -536870212;
    v19 = CFSTR("_encodeAndWriteFirmware retrieved a null restoreInfo dictionary?");
    goto LABEL_9;
  }
  v15 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", a3, v9);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(a4, "writeData:withError:", v15, a5);

    return v17;
  }
  if (a5)
  {
    v19 = CFSTR("_encodeAndWriteFirmware failed to encode Img4 data.");
    v20 = 9;
    goto LABEL_12;
  }
  return -536870212;
}

- (id)_encodeFirmware:(id)a3 withRestoreInfo:(id)a4
{
  id result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFDataRef v21;

  v21 = 0;
  result = objc_msgSend(a3, "length");
  if (result)
  {
    v7 = AMAuthInstallApImg4EncodeRestoreInfo((const __CFData *)a3, (CFDictionaryRef)a4, &v21);
    if ((_DWORD)v7)
    {
      iBU_LOG_real((uint64_t)CFSTR("AMAuthInstallApImg4EncodeRestoreInfo returned %d during Img4 encoding?"), "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]", v8, v9, v10, v11, v12, v13, v7);
    }
    else
    {
      v14 = objc_msgSend(a3, "length");
      -[__CFData length](v21, "length");
      iBU_LOG_real((uint64_t)CFSTR("original data length: %lu. img4_restore_data length: %lu"), "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }
    return v21;
  }
  return result;
}

- (unsigned)matchedService
{
  return self->_matchedService;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

- (NSArray)bootBlockImages
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBootBlockImages:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)firmwareImages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirmwareImages:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)llbData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLlbData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSData)ans2Data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAns2Data:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)daliData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDaliData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSData)ibootData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIbootData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)logoData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogoData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (unsigned)apNonceSlotID
{
  return self->_apNonceSlotID;
}

- (BOOL)supportsSlotIDs
{
  return self->_supportsSlotIDs;
}

@end
