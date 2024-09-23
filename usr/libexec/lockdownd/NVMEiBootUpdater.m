@implementation NVMEiBootUpdater

+ (id)IOMatchingPropertyTable
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("IOProviderClass");
  v4 = CFSTR("AppleEmbeddedNVMeController");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

- (NVMEiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3;
  NVMEiBootUpdater *v4;
  DevNodeWriter *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)NVMEiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = -[DevNodeWriter initWithServiceNamed:parent:]([DevNodeWriter alloc], "initWithServiceNamed:parent:", CFSTR("EmbeddedDeviceTypeFirmware"), v3);
    v4->_writer = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NVMEiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NVMEiBootUpdater;
  return -[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:](&v5, "generateFirmwareImagesWithCallback:context:", a3, a4);
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  NSData *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  DevNodeWriter *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSError *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSError *v48;
  BOOL result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSArray *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *i;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *j;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  DevNodeWriter *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  __int16 v114;
  id v115;
  _BYTE v116[128];
  _BYTE v117[128];

  v8 = -[MSUBootFirmwareUpdater llbData](self, "llbData", a3);
  v115 = (id)__NSArray0__;
  v114 = 0;
  v113 = 0;
  if (ramrod_hardware_partition_supports_bics()
    && !-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:](self, "_copyIBICFromPath:withOptions:intoArray:withError:", -[NSString UTF8String](-[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath"), "UTF8String"), a4->var1, &v115, &v113))
  {
    iBU_LOG_real((uint64_t)CFSTR("Copy iBIC failed."), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v9, v10, v11, v12, v13, v14, v101);
    if (!a5)
      return 0;
    v42 = MSUBootFirmwareError(1, v113, (uint64_t)CFSTR("Copy iBIC failed."), v43, v44, v45, v46, v47, v104);
    goto LABEL_10;
  }
  v15 = -[DevNodeWriter isAvailable](-[NVMEiBootUpdater writer](self, "writer"), "isAvailable");
  v16 = -[NVMEiBootUpdater writer](self, "writer");
  if ((v15 & 1) == 0)
  {
    iBU_LOG_real((uint64_t)CFSTR("Writer %@ was unavailable at write-time"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    if (!a5)
      return 0;
    v103 = -[NVMEiBootUpdater writer](self, "writer");
    v42 = MSUBootFirmwareError(6, 0, (uint64_t)CFSTR("Writer %@ was unavailable at write-time"), v37, v38, v39, v40, v41, (uint64_t)v103);
LABEL_10:
    v48 = v42;
    result = 0;
    *a5 = v48;
    return result;
  }
  v23 = -[DevNodeWriter devicePath](v16, "devicePath");
  iBU_LOG_real((uint64_t)CFSTR("Writing lldb data to dev node %@"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:](self, "_encodeAndWriteFirmware:toWriter:withError:", v8, -[NVMEiBootUpdater writer](self, "writer"), a5))
  {
    v36 = CFSTR("Failed to write lldb data to dev node.");
LABEL_31:
    iBU_LOG_real((uint64_t)v36, "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v30, v31, v32, v33, v34, v35, v102);
    return 0;
  }
  v50 = -[NSArray count](-[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages"), "count");
  -[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath");
  iBU_LOG_real((uint64_t)CFSTR("Writing %lu firmware images to dev node %@"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v51, v52, v53, v54, v55, v56, v50);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v57 = -[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages");
  v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
  if (v58)
  {
    v65 = v58;
    v66 = *(_QWORD *)v110;
    while (2)
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(_QWORD *)v110 != v66)
          objc_enumerationMutation(v57);
        if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:](self, "_encodeAndWriteFirmware:toWriter:withError:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i), -[NVMEiBootUpdater writer](self, "writer"), a5))
        {
          v36 = CFSTR("Failed to write firmware data to dev node.");
          goto LABEL_31;
        }
      }
      v65 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      if (v65)
        continue;
      break;
    }
  }
  if (v115)
  {
    v68 = objc_msgSend(v115, "count");
    -[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath");
    iBU_LOG_real((uint64_t)CFSTR("Writing %d iBIC firmware image segments to dev node %@"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v69, v70, v71, v72, v73, v74, (uint64_t)v68);
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v75 = v115;
    v76 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v106;
      while (2)
      {
        for (j = 0; j != v77; j = (char *)j + 1)
        {
          if (*(_QWORD *)v106 != v78)
            objc_enumerationMutation(v75);
          if (-[DevNodeWriter writeData:withError:](-[NVMEiBootUpdater writer](self, "writer"), "writeData:withError:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j), a5))
          {
            v36 = CFSTR("Failed to write ibic data to dev node.");
            goto LABEL_31;
          }
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
        if (v77)
          continue;
        break;
      }
    }
  }
  iBU_LOG_real((uint64_t)CFSTR("Writing end_of_contents_bytes to dev node."), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v59, v60, v61, v62, v63, v64, v102);
  if (-[DevNodeWriter writeData:withError:](-[NVMEiBootUpdater writer](self, "writer"), "writeData:withError:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v114, 2), a5))
  {
    v36 = CFSTR("Failed to write end_of_contents bytes.");
    goto LABEL_31;
  }
  v80 = -[DevNodeWriter numberOfBytesRemainingInBlock](-[NVMEiBootUpdater writer](self, "writer"), "numberOfBytesRemainingInBlock");
  if (v80)
  {
    v87 = v80;
    iBU_LOG_real((uint64_t)CFSTR("There are %lu bytes remaining in the boot block. Padding with zeroes."), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v81, v82, v83, v84, v85, v86, v80);
    if (-[DevNodeWriter writeData:withError:](-[NVMEiBootUpdater writer](self, "writer"), "writeData:withError:", +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v87), a5))
    {
      v36 = CFSTR("Failed to pad zeroes to the end of the block.");
      goto LABEL_31;
    }
  }
  if (!-[DevNodeWriter finished](-[NVMEiBootUpdater writer](self, "writer"), "finished"))
    iBU_LOG_real((uint64_t)CFSTR("Failed to clean up writer."), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v88, v89, v90, v91, v92, v93, v102);
  v94 = IORegistryEntrySetCFProperty(-[MSUBootFirmwareUpdater matchedService](self, "matchedService"), CFSTR("fw-write-done"), kCFBooleanTrue);
  if (!(_DWORD)v94)
  {
    iBU_LOG_real((uint64_t)CFSTR("Successfully updated iBoot firmware images"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v95, v96, v97, v98, v99, v100, v102);
    return 1;
  }
  iBU_LOG_real((uint64_t)CFSTR("Failed to set 'fw-write-done' property on dev node. Kernel error: %d"), "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v95, v96, v97, v98, v99, v100, v94);
  return 0;
}

- (BOOL)_copyIBICFromPath:(char *)a3 withOptions:(__CFDictionary *)a4 intoArray:(const __CFArray *)a5 withError:(__CFError *)a6
{
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFMutableArrayRef Mutable;
  __CFArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFArray *v20;
  const void *Value;
  const void *v22;
  const void *v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFURL *URLFromString;
  __CFArray *v35;
  CFIndex v36;
  const __CFString *ValueAtIndex;
  const char *CStringPtr;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFTypeID v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v55;
  const __CFArray **v56;
  const char *v57;
  off_t v58;
  off_t v59;
  CFDataRef theData;

  v59 = -1;
  theData = 0;
  v58 = -1;
  if (!a6)
  {
    iBU_LOG_real((uint64_t)CFSTR("error parameter is NULL"), "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, v6, v7, v55);
LABEL_33:
    v53 = 0;
    v20 = 0;
    Mutable = 0;
LABEL_42:
    URLFromString = 0;
    v10 = 0;
    goto LABEL_29;
  }
  if (!a5)
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 2, 0, CFSTR("%s: outDataArray is NULL"), (uint64_t)a6, v6, v7, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_33;
  }
  v10 = a3;
  if (!a3)
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 2, 0, CFSTR("%s: path parameter is NULL"), (uint64_t)a6, v6, v7, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    v53 = 0;
    v20 = 0;
    Mutable = 0;
LABEL_38:
    URLFromString = 0;
    goto LABEL_29;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: segment_data_array failed to allocate"), v12, v13, v14, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    v53 = 0;
    v20 = 0;
    goto LABEL_42;
  }
  v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v20 = v16;
  if (!v16)
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: segment_keys_array failed to allocate"), v17, v18, v19, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
LABEL_41:
    v53 = 0;
    goto LABEL_42;
  }
  CFArrayAppendValue(v16, CFSTR("ibic"));
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, CFSTR("iBICRequired"));
    v22 = CFDictionaryGetValue(a4, CFSTR("iBICAdditionalTag"));
    if (!v22)
      goto LABEL_11;
    v23 = v22;
    v24 = CFGetTypeID(v22);
    if (v24 == CFStringGetTypeID())
    {
      CFArrayAppendValue(v20, v23);
      goto LABEL_11;
    }
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 2, 0, CFSTR("%s: kAMRestoreOptionsiBICAdditionalTag is not a CFStringRef"), v25, v26, v27, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_41;
  }
  Value = 0;
LABEL_11:
  v10 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v10)
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: _copy_ibic unable to create fw_path"), v28, v29, v30, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    v53 = 0;
    goto LABEL_38;
  }
  URLFromString = (const __CFURL *)AMSupportCreateURLFromString(kCFAllocatorDefault, v10);
  if (URLFromString)
  {
    v56 = a5;
    v57 = v10;
    v35 = Mutable;
    if (CFArrayGetCount(v20) < 1)
    {
LABEL_27:
      Mutable = v35;
      *v56 = (const __CFArray *)CFRetain(v35);
      v53 = 1;
    }
    else
    {
      v36 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v20, v36);
        CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
        v45 = AMRestorePartitionFWCopyTagData(URLFromString, ValueAtIndex, 0, &v59, (CFTypeRef *)&theData, &v58);
        if (Value)
        {
          v46 = CFGetTypeID(Value);
          if (v46 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)Value) == 1 && (_DWORD)v45)
            break;
        }
        if ((_DWORD)v45 == 8)
        {
          iBU_LOG_real((uint64_t)CFSTR("FW tag %s missing, but this is not fatal.\n"), "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v39, v40, v41, v42, v43, v44, (uint64_t)CStringPtr);
        }
        else if ((_DWORD)v45)
        {
          iBU_LOG_real((uint64_t)CFSTR("Unexpected error %d scanning for FW tag %s - corrupt FW partition?\n"), "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v39, v40, v41, v42, v43, v44, v45);
        }
        else
        {
          CFDataGetLength(theData);
          iBU_LOG_real((uint64_t)CFSTR("Found FW tag %s of %lu length.\n"), "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v47, v48, v49, v50, v51, v52, (uint64_t)CStringPtr);
          CFArrayAppendValue(v35, theData);
        }
        if (theData)
        {
          CFRelease(theData);
          theData = 0;
        }
        if (CFArrayGetCount(v20) <= ++v36)
          goto LABEL_27;
      }
      ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 3, 0, CFSTR("%s: AMRestorePartitionFWCopyTagData returned %d"), v42, v43, v44, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
      v53 = 0;
      Mutable = v35;
    }
    v10 = v57;
  }
  else
  {
    ramrod_create_error_cf(a6, CFSTR("RamrodErrorDomain"), 6, 0, CFSTR("%s: _copy_ibic unable to create url"), v31, v32, v33, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    v53 = 0;
  }
LABEL_29:
  AMSupportSafeRelease(v10);
  AMSupportSafeRelease(URLFromString);
  AMSupportSafeRelease(v20);
  AMSupportSafeRelease(theData);
  AMSupportSafeRelease(Mutable);
  return v53;
}

- (DevNodeWriter)writer
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 88, 1);
}

@end
