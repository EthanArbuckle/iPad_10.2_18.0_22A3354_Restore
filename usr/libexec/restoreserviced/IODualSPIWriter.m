@implementation IODualSPIWriter

- (IODualSPIWriter)initWithService:(unsigned int)a3
{
  uint64_t v3;
  IODualSPIWriter *v4;
  IODualSPIWriter *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)IODualSPIWriter;
  v4 = -[IOServiceWriter initWithService:](&v7, "initWithService:");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_usesAFUH = 0;
    *((_BYTE *)&v4->super._serviceConnect + 4) = +[MSUBootFirmwareUpdater supportsAFUH](MSUBootFirmwareUpdater, "supportsAFUH");
    *(const _reg_format_union **)((char *)&v5->_regStruct + 4) = (const _reg_format_union *)objc_msgSend(-[IODualSPIWriter _loadRegionLayout:](v5, "_loadRegionLayout:", v3), "copy");
    *(NSData **)((char *)&v5->_regData + 4) = (NSData *)objc_alloc_init((Class)NSMutableArray);
    if (!objc_msgSend(*(id *)((char *)&v5->_regStruct + 4), "length"))
    {

      return 0;
    }
  }
  return v5;
}

- (unsigned)_findFirmwareInfoEntry
{
  io_registry_entry_t v2;
  unsigned int v3;
  io_registry_entry_t v4;
  io_iterator_t iterator;

  v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product/util");
  if (v2)
  {
    v3 = v2;
    if (sub_1000089A4(v2))
      return v3;
    IOObjectRelease(v3);
  }
  iterator = 0;
  v3 = 0;
  if (!IORegistryCreateIterator(kIOMasterPortDefault, "IODeviceTree", 1u, &iterator))
  {
    do
    {
      v4 = IOIteratorNext(iterator);
      v3 = v4;
    }
    while (v4 && !sub_1000089A4(v4));
    IOObjectRelease(iterator);
  }
  return v3;
}

- (id)_loadRegionLayout:(unsigned int)a3
{
  io_registry_entry_t v4;
  io_object_t v5;
  CFTypeRef CFProperty;
  void *v7;
  CFTypeRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = -[IODualSPIWriter _findFirmwareInfoEntry](self, "_findFirmwareInfoEntry");
  if (v4)
  {
    v5 = v4;
    CFProperty = IORegistryEntryCreateCFProperty(v4, CFSTR("fw-regions"), 0, 0);
    v7 = (id)CFMakeCollectable(CFProperty);
    IOObjectRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v8 = IORegistryEntrySearchCFProperty(a3, "IOService", CFSTR("reg"), 0, 3u);
    v7 = (id)CFMakeCollectable(v8);
    if (!objc_msgSend(v7, "length"))
    {
      iBU_LOG_real((uint64_t)CFSTR("Found none of the required DT Properties (looked for 'low-level-fw-device-info' and 'reg')"), "-[IODualSPIWriter _loadRegionLayout:]", v9, v10, v11, v12, v13, v14, v16);
      return 0;
    }
  }
  return v7;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  if (-[IOServiceWriter isErase](self, "isErase"))
    return -[IODualSPIWriter writeFirstGenerationFirmware:withError:](self, "writeFirstGenerationFirmware:withError:", a3, a4);
  else
    return -[IODualSPIWriter writeNewerGenerationFirmware:withError:](self, "writeNewerGenerationFirmware:withError:", a3, a4);
}

- (int)openService
{
  CFStringRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFStringRef v11;
  io_service_t v12;
  kern_return_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = IORegistryEntryCopyPath(-[IOServiceWriter service](self, "service"), "IOService");
  if (*(_DWORD *)&self->_usesAFUH)
    return 0;
  v11 = v3;
  if (v3)
  {
    iBU_LOG_real((uint64_t)CFSTR("Matched service is: %@"), "-[IODualSPIWriter openService]", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    CFRelease(v11);
  }
  if (!*(const _reg_format_union **)((char *)&self->_regStruct + 4))
    return -536870160;
  v12 = -[IOServiceWriter service](self, "service");
  v13 = IOServiceOpen(v12, mach_task_self_, 0, (io_connect_t *)&self->_usesAFUH);
  *(_QWORD *)(&self->_regSize + 1) = objc_msgSend(*(id *)((char *)&self->_regStruct + 4), "bytes");
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)objc_msgSend(*(id *)((char *)&self->_regStruct + 4), "bytes");
  v14 = objc_msgSend(*(id *)((char *)&self->_regStruct + 4), "length");
  self->_spiDriverConnect = v14;
  iBU_LOG_real((uint64_t)CFSTR("RegSize is: %d"), "-[IODualSPIWriter openService]", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  return v13;
}

- (unsigned)_maxImageSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int spiDriverConnect;
  unsigned int v9;

  spiDriverConnect = self->_spiDriverConnect;
  if (spiDriverConnect != 40)
  {
    if (spiDriverConnect == 32)
      return 0x200000;
    if (spiDriverConnect != 24)
    {
      v9 = 0x200000;
      iBU_LOG_real((uint64_t)CFSTR("Unknown reg region size of %d. Returning the default iBootMaxPayloadSize of 0x%x"), "-[IODualSPIWriter _maxImageSize]", v2, v3, v4, v5, v6, v7, self->_spiDriverConnect);
      return v9;
    }
  }
  return (*(_DWORD **)((char *)&self->_regBuffer + 4))[3];
}

- (unsigned)_maxExtendedRegionSize
{
  if (self->_spiDriverConnect == 40)
    return (*(_DWORD **)((char *)&self->_regBuffer + 4))[7];
  else
    return 0;
}

- (BOOL)_usesExtendediBootRegion
{
  return self->_spiDriverConnect == 40;
}

- (BOOL)_crossingRegionChangeBoundary
{
  unsigned int spiDriverConnect;
  io_registry_entry_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  unsigned int v10;
  unsigned __int8 v11;
  _QWORD v13[3];
  _QWORD v14[10];

  spiDriverConnect = self->_spiDriverConnect;
  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("board-id"), kCFAllocatorDefault, 0);
  v5 = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("chip-id"), kCFAllocatorDefault, 0);
  v6 = *(unsigned int *)CFDataGetBytePtr(CFProperty);
  v7 = *(unsigned int *)CFDataGetBytePtr(v5);
  v14[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8);
  v14[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9);
  v14[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10);
  v14[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 11);
  v14[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 12);
  v14[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 13);
  v14[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 15);
  v14[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4);
  v14[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5);
  v14[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 16);
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 10);
  v13[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 24577, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 24576));
  v13[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 24578);
  v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3);
  v10 = -[NSArray containsObject:](v8, "containsObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v11 = 0;
  if (v10)
    v11 = -[NSArray containsObject:](v9, "containsObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  if (CFProperty)
    CFRelease(CFProperty);
  if (v5)
    CFRelease(v5);
  if (v3)
    IOObjectRelease(v3);
  if (spiDriverConnect == 24)
    return v11;
  else
    return 0;
}

- (id)_getSFRManifestHashForPayload:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSData *v8;
  CC_LONG len;
  void *data;
  uint64_t v12;
  unsigned __int8 md[16];
  __int128 v14;
  __int128 v15;
  _OWORD v16[28];
  uint64_t v17;

  v5 = objc_alloc_init((Class)NSMutableData);
  v6 = objc_autoreleasePoolPush();
  objc_msgSend(v5, "appendData:", -[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", objc_msgSend(a3, "imageAddress"), -[IODualSPIWriter _maxImageSize](self, "_maxImageSize")));
  if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion"))
    objc_msgSend(v5, "appendData:", -[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", objc_msgSend(a3, "secondaryPayloadOffset"), -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize")));
  objc_autoreleasePoolPop(v6);
  v12 = 0;
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  data = 0;
  len = 0;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)md = 0u;
  if (!v5
    || Img4DecodeParseLengthFromBuffer(objc_msgSend(v5, "bytes"), -[IODualSPIWriter _maxImageSize](self, "_maxImageSize"), &v12)|| (v7 = objc_msgSend(v5, "bytes"), Img4DecodeInit(v7, v12, v16)))
  {
    v8 = 0;
  }
  else
  {
    Img4DecodeGetManifest(v16, &data, &len);
    CC_SHA384(data, len, md);
    v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 48);
  }

  return v8;
}

- (BOOL)_headerMatchesBootSFRManifestHash:(id)a3
{
  void *v5;
  id v6;
  io_registry_entry_t v7;

  v5 = objc_autoreleasePoolPush();
  v6 = -[IODualSPIWriter _getSFRManifestHashForPayload:](self, "_getSFRManifestHashForPayload:", a3);
  v7 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen/secure-boot-hashes");
  LOBYTE(v6) = objc_msgSend(v6, "isEqualToData:", IORegistryEntryCreateCFProperty(v7, CFSTR("sfr-manifest-hash"), kCFAllocatorDefault, 0));
  objc_autoreleasePoolPop(v5);
  return (char)v6;
}

- (int)writeNewerGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  uint64_t v51;
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
  unsigned int v64;
  unint64_t v65;
  id v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  unsigned int v110;
  int v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v119;
  uint64_t v120;
  uint64_t v122;

  v6 = 0;
  v7 = 1;
  do
  {
    if (v6)

    v6 = -[IODualSPIWriter findHeaders](self, "findHeaders");
    if ((unint64_t)objc_msgSend(v6, "count") <= 1)
    {
      if (a4)
      {
        v112 = objc_msgSend(v6, "count");
        *a4 = MSUBootFirmwareError(-536870167, 0, (uint64_t)CFSTR("writeNewerGenerationFirmware: couldn't find enough headers (only found %d of %d)"), v113, v114, v115, v116, v117, (uint64_t)v112);
      }
      v111 = -536870167;
      goto LABEL_54;
    }
    v8 = objc_msgSend(v6, "objectAtIndex:", 0);
    v9 = objc_msgSend(v6, "objectAtIndex:", 1);
    v10 = objc_msgSend(v8, "headerGeneration");
    if (v10 >= objc_msgSend(v9, "headerGeneration"))
      v17 = v9;
    else
      v17 = v8;
    if (v8 == v17)
      v18 = v9;
    else
      v18 = v8;
    v122 = 0;
    iBU_LOG_real((uint64_t)CFSTR("Older header: %@"), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v11, v12, v13, v14, v15, v16, (uint64_t)v17);
    iBU_LOG_real((uint64_t)CFSTR("Newer header: %@"), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    v25 = objc_msgSend(v17, "isValid");
    v26 = objc_msgSend(v18, "isValid");
    v33 = v26 ^ 1;
    if (((v25 ^ 1) & 1) == 0 && (v33 & 1) == 0)
    {
      iBU_LOG_real((uint64_t)CFSTR("Both headers are valid. Checking to see which one we're booted from."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, v119);
      if (!-[IODualSPIWriter usesAFUH](self, "usesAFUH"))
      {
        objc_msgSend(v18, "headerGeneration");
        iBU_LOG_real((uint64_t)CFSTR("Both headers are valid. Selecting older header %@ (vs gc=0x%x)."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v46, v47, v48, v49, v50, v51, (uint64_t)v17);
        goto LABEL_26;
      }
      if (-[IODualSPIWriter _headerMatchesBootSFRManifestHash:](self, "_headerMatchesBootSFRManifestHash:", v18))
      {
        iBU_LOG_real((uint64_t)CFSTR("Overwriting older header %@ because we're booted from the newer header."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v34, v35, v36, v37, v38, v39, (uint64_t)v17);
LABEL_26:
        v8 = v17;
        goto LABEL_27;
      }
      if (!-[IODualSPIWriter _headerMatchesBootSFRManifestHash:](self, "_headerMatchesBootSFRManifestHash:", v17))
      {
        objc_msgSend(v18, "headerGeneration");
        iBU_LOG_real((uint64_t)CFSTR("Both headers are valid and we're not booted from either? Selecting older header %@ (vs gc=0x%x)."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v58, v59, v60, v61, v62, v63, (uint64_t)v17);
        goto LABEL_26;
      }
      iBU_LOG_real((uint64_t)CFSTR("Overwriting newer header %@ because we're booted from the older header."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v52, v53, v54, v55, v56, v57, (uint64_t)v18);
      goto LABEL_23;
    }
    if (((v25 ^ 1 | v26) & 1) == 0)
    {
      iBU_LOG_real((uint64_t)CFSTR("Older header is valid, newer is not. Selecting newer header %@"), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, (uint64_t)v18);
LABEL_23:
      v8 = v18;
      v18 = v17;
      goto LABEL_27;
    }
    if (((v25 | v33) & 1) == 0)
    {
      iBU_LOG_real((uint64_t)CFSTR("Newer header is valid, older is not. Selecting older header %@"), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v27, v28, v29, v30, v31, v32, (uint64_t)v17);
      goto LABEL_26;
    }
    objc_msgSend(v8, "setHeaderGeneration:", 0);
    iBU_LOG_real((uint64_t)CFSTR("Neither header is valid. Setting header0 to gen0."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v40, v41, v42, v43, v44, v45, v119);
    v18 = v9;
LABEL_27:
    if (objc_msgSend(v8, "headerGeneration") == -1
      && objc_msgSend(v18, "headerGeneration") == -1)
    {
      v65 = 0;
    }
    else
    {
      v64 = objc_msgSend(v8, "headerGeneration");
      v65 = (unint64_t)objc_msgSend(v18, "headerGeneration");
      if (v64 != -1)
      {
        v66 = objc_msgSend(v8, "headerGeneration");
        v67 = v66;
        if ((_DWORD)v65 == -1)
        {
          v65 = (unint64_t)v66;
        }
        else
        {
          v68 = objc_msgSend(v18, "headerGeneration");
          if (v67 <= v68)
            v65 = v68;
          else
            v65 = v67;
        }
      }
    }
    objc_msgSend(v8, "setHeaderGeneration:", v65);
    objc_msgSend(v8, "bumpGeneration");
    objc_msgSend(v8, "invalidate");
    if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion")
      && -[IODualSPIWriter _crossingRegionChangeBoundary](self, "_crossingRegionChangeBoundary"))
    {
      self->_spiDriverConnect = 40;
      *(const char **)((char *)&self->_regBuffer + 4) = (const char *)&unk_100019584;
      objc_msgSend(v8, "setImageAddress:", 0x20000);
      objc_msgSend(v8, "setSecondaryPayloadOffset:", 0x400000);
    }
    iBU_LOG_real((uint64_t)CFSTR("Writing updated header and images."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v69, v70, v71, v72, v73, v74, v120);
    v75 = -[IODualSPIWriter _writeFirmware:toHeader:withError:](self, "_writeFirmware:toHeader:withError:", a3, v8, &v122);
    v76 = objc_msgSend(v8, "headerGeneration");
    objc_msgSend(v8, "startLocation");
    if (v75)
    {
      iBU_LOG_real((uint64_t)CFSTR("Failed to write newer-generation firmware images to update header with generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v77, v78, v79, v80, v81, v82, (uint64_t)v76);
    }
    else
    {
      iBU_LOG_real((uint64_t)CFSTR("Successfully wrote newer-generation firmware images to update header with generation 0x%x at offset 0x%x."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v77, v78, v79, v80, v81, v82, (uint64_t)v76);
      if (!-[IOServiceWriter shouldCommit](self, "shouldCommit"))
        goto LABEL_53;
      v89 = objc_msgSend(v8, "headerGeneration");
      iBU_LOG_real((uint64_t)CFSTR("Committing updated header with newer-generation 0x%x"), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v90, v91, v92, v93, v94, v95, (uint64_t)v89);
      v96 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", v8, &v122);
      v97 = objc_msgSend(v8, "headerGeneration");
      objc_msgSend(v8, "startLocation");
      if (!v96)
      {
        iBU_LOG_real((uint64_t)CFSTR("Successfully committed header with newer-generation 0x%x at offset 0x%x."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
LABEL_53:
        iBU_LOG_real((uint64_t)CFSTR("Successfully wrote newer-generation firmware after %d retries."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v83, v84, v85, v86, v87, v88, v7);
        v111 = 0;
        if (!v6)
          return v111;
LABEL_54:

        return v111;
      }
      iBU_LOG_real((uint64_t)CFSTR("Failed to commit header with newer-generation 0x%x at offset 0x%x. Invalidating this header, then trying again with a different header."), "-[IODualSPIWriter writeNewerGenerationFirmware:withError:]", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
    }
    -[IODualSPIWriter markHeaderAsInvalid:](self, "markHeaderAsInvalid:", v8);
    v109 = v7 + 1;
    v110 = v7 - 1;
    v7 = (v7 + 1);
  }
  while (v110 < 0x1F);
  v111 = -536870167;
  if (a4)
    *a4 = MSUBootFirmwareError(-536870167, 0, (uint64_t)CFSTR("writeNewerGenerationFirmware: couldn't find enough headers after %d retries."), v104, v105, v106, v107, v108, (v109 - 1));
  if (v6)
    goto LABEL_54;
  return v111;
}

- (int)writeFirstGenerationFirmware:(id)a3 withError:(id *)a4
{
  id v4;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  unsigned int v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  unsigned int v75;
  id *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v91;

  v4 = a3;
  v6 = 0;
  v7 = CFSTR("Invalidated header0 in memory. %@");
  v8 = CFSTR("Invalidated header1 in memory. %@");
  v9 = CFSTR("Resetting header0 to Generation 1.");
  v10 = 1;
  while (1)
  {
    if (v6)

    v6 = -[IODualSPIWriter findHeaders](self, "findHeaders");
    if ((unint64_t)objc_msgSend(v6, "count") <= 1)
    {
      v76 = a4;
      if (a4)
      {
        v77 = (v10 - 1);
        v78 = objc_msgSend(v6, "count");
        *a4 = MSUBootFirmwareError(-536870167, 0, (uint64_t)CFSTR("writeFirstGenerationFirmware: couldn't find enough headers (only found %d of %d)"), v79, v80, v81, v82, v83, (uint64_t)v78);
LABEL_18:
        v84 = -536870167;
        *v76 = MSUBootFirmwareError(-536870167, 0, (uint64_t)CFSTR("writeFirstGenerationFirmware: couldn't find enough headers after %d retries."), v69, v70, v71, v72, v73, v77);
        if (!v6)
          return v84;
        goto LABEL_21;
      }
LABEL_20:
      v84 = -536870167;
      if (!v6)
        return v84;
      goto LABEL_21;
    }
    v11 = objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = objc_msgSend(v6, "objectAtIndex:", 1);
    v91 = 0;
    objc_msgSend(v11, "invalidate");
    iBU_LOG_real((uint64_t)v7, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
    objc_msgSend(v12, "invalidate");
    iBU_LOG_real((uint64_t)v8, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v19, v20, v21, v22, v23, v24, (uint64_t)v12);
    iBU_LOG_real((uint64_t)v9, "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v25, v26, v27, v28, v29, v30, v86);
    objc_msgSend(v11, "setAsFirstGeneration");
    if (!-[IODualSPIWriter _writeFirmware:toHeader:withError:](self, "_writeFirmware:toHeader:withError:", v4, v11, &v91))break;
    v37 = objc_msgSend(v11, "startLocation");
    iBU_LOG_real((uint64_t)CFSTR("Failed to write firmware images to header0 at offset 0x%x. Invalidating this header, then trying again with a different header."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v38, v39, v40, v41, v42, v43, (uint64_t)v37);
LABEL_13:
    -[IODualSPIWriter markHeaderAsInvalid:](self, "markHeaderAsInvalid:", v12);
    v74 = v10 + 1;
    v75 = v10 - 1;
    v10 = (v10 + 1);
    if (v75 >= 0x1F)
    {
      v76 = a4;
      if (a4)
      {
        v77 = (v74 - 1);
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  v44 = v9;
  v45 = v8;
  v46 = v7;
  iBU_LOG_real((uint64_t)CFSTR("Erasing header1."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v31, v32, v33, v34, v35, v36, v87);
  v47 = -[IODualSPIWriter eraseBytes:ofLength:withError:](self, "eraseBytes:ofLength:withError:", objc_msgSend(v12, "startLocation"), objc_msgSend(v12, "length"), &v91);
  v48 = objc_msgSend(v12, "startLocation");
  if (v47)
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to erase header1 at offset 0x%x. Invalidating this header, then trying again with a different header."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
LABEL_12:
    v7 = v46;
    v8 = v45;
    v9 = v44;
    v4 = a3;
    goto LABEL_13;
  }
  iBU_LOG_real((uint64_t)CFSTR("Successfully wrote header1 at offset 0x%x."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
  if (!-[IOServiceWriter shouldCommit](self, "shouldCommit"))
    goto LABEL_24;
  iBU_LOG_real((uint64_t)CFSTR("Committing header0 to the first partition."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v55, v56, v57, v58, v59, v60, v88);
  v61 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", v11, &v91);
  v62 = objc_msgSend(v11, "startLocation");
  if (v61)
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to commit header0 at offset 0x%x to the first partition. Invalidating this header, then trying again with a different header."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v63, v64, v65, v66, v67, v68, (uint64_t)v62);
    v12 = v11;
    goto LABEL_12;
  }
  iBU_LOG_real((uint64_t)CFSTR("Successfully committed header0 at offset 0x%x."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v63, v64, v65, v66, v67, v68, (uint64_t)v62);
LABEL_24:
  iBU_LOG_real((uint64_t)CFSTR("Successfully wrote firmware after %d retries."), "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]", v55, v56, v57, v58, v59, v60, v10);
  v84 = 0;
  if (v6)
LABEL_21:

  return v84;
}

- (void)markHeaderAsInvalid:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  iBU_LOG_real((uint64_t)CFSTR("Marking header as invalid: %@"), "-[IODualSPIWriter markHeaderAsInvalid:]", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
  -[NSMutableArray addObject:](-[IODualSPIWriter invalidHeaders](self, "invalidHeaders"), "addObject:", a3);
}

- (BOOL)headerIsInvalid:(id)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[IODualSPIWriter invalidHeaders](self, "invalidHeaders", 0);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend(a3, "startLocation");
        if (v10 == objc_msgSend(v9, "startLocation"))
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

- (int)commitHeaderAtIndex:(unint64_t)a3 withError:(id *)a4
{
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)objc_msgSend(v7, "count") >= a3 + 1)
  {
    v8 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", objc_msgSend(v7, "objectAtIndex:", a3), a4);
  }
  else
  {
    v8 = -536870212;
    if (a4)
    {
      v9 = objc_msgSend(v7, "count");
      *a4 = MSUBootFirmwareError(-536870212, 0, (uint64_t)CFSTR("commitHeaderAtIndex: couldn't find enough headers (only found %d of %d)"), v10, v11, v12, v13, v14, (uint64_t)v9);
    }
  }

  return v8;
}

- (int)commitPreparedHeaderWithError:(id *)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = -[IODualSPIWriter findPreparedHeader](self, "findPreparedHeader");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    return -[IODualSPIWriter commitHeaderAtIndex:withError:](self, "commitHeaderAtIndex:withError:", v5, a3);
  if (a3)
    *a3 = MSUBootFirmwareError(-536870212, 0, (uint64_t)CFSTR("commitPreparedHeader: couldn't find valid preparedHeader"), v6, v7, v8, v9, v10, v12);
  return -536870212;
}

- (unint64_t)findPreparedHeader
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)objc_msgSend(v2, "count") > 1)
  {
    v11 = objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v12 = objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v13 = objc_msgSend(v11, "compareTo:", v12);
    iBU_LOG_real((uint64_t)CFSTR("Header0: %@"), "-[IODualSPIWriter findPreparedHeader]", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    iBU_LOG_real((uint64_t)CFSTR("Header1: %@"), "-[IODualSPIWriter findPreparedHeader]", v20, v21, v22, v23, v24, v25, (uint64_t)v12);
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 == (id)1)
      v26 = 0;
    if (v13 == (id)-1)
      v10 = 1;
    else
      v10 = v26;

  }
  else
  {
    v3 = objc_msgSend(v2, "count");
    iBU_LOG_real((uint64_t)CFSTR("Error: findPreparedHeader: couldn't find enough headers (found %d of 2)"), "-[IODualSPIWriter findPreparedHeader]", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (id)findHeaders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  id v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MSUiBootHeaderV1 *v16;
  MSUiBootHeaderV1 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _BYTE *v32;
  NSMutableArray *v33;
  uint64_t v34;
  unint64_t v35;
  MSUiBootHeaderV2 *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t i;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[2];

  if (-[IODualSPIWriter usesAFUH](self, "usesAFUH"))
  {
    -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
    v79[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0x20000);
    v79[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[IODualSPIWriter _maxImageSize](self, "_maxImageSize") + 0x20000);
    v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2);
    v10 = -[NSArray mutableCopy](v9, "mutableCopy");
    v76 = -[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion");
    if (v76)
    {
      v78[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*(unsigned int **)((char *)&self->_regBuffer + 4))[6]);
      v78[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (*(unsigned int **)((char *)&self->_regBuffer + 4))[8]);
      v77 = -[NSArray mutableCopy](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 2), "mutableCopy");
    }
    else
    {
      v77 = 0;
    }
    v32 = -[NSArray count](v9, "count");
    v33 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 32);
    v34 = 0;
    v35 = 0;
    do
    {
      v36 = -[MSUiBootHeaderV2 initWithIOServiceWriter:]([MSUiBootHeaderV2 alloc], "initWithIOServiceWriter:", self);
      -[MSUiBootHeaderV2 loadHeaderAtOffset:](v36, "loadHeaderAtOffset:", v34);
      if (-[MSUiBootHeaderV2 validHeaderSignature](v36, "validHeaderSignature")
        && -[NSArray containsObject:](v9, "containsObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MSUiBootHeader imageAddress](v36, "imageAddress")))&& !-[IODualSPIWriter headerIsInvalid:](self, "headerIsInvalid:", v36))
      {
        objc_msgSend(v10, "removeObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MSUiBootHeader imageAddress](v36, "imageAddress")));
        objc_msgSend(v77, "removeObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MSUiBootHeaderV2 secondaryPayloadOffset](v36, "secondaryPayloadOffset")));
        -[NSMutableArray insertObject:atIndex:](v33, "insertObject:atIndex:", v36, v35++);
      }
      else
      {
        -[MSUiBootHeader setImageAddress:](v36, "setImageAddress:", 0);
        -[MSUiBootHeaderV2 setSecondaryPayloadOffset:](v36, "setSecondaryPayloadOffset:", 0);
        -[NSMutableArray addObject:](v33, "addObject:", v36);
      }
      if (v35 >= (unint64_t)v32)
        break;
      v37 = v34 == 126976;
      v34 += 4096;
    }
    while (!v37);
    -[NSMutableArray removeObjectsInRange:](v33, "removeObjectsInRange:", v32, (_BYTE *)-[NSMutableArray count](v33, "count") - v32);
    if (-[NSMutableArray count](v33, "count") < v32)
    {
      v44 = -[NSMutableArray count](v33, "count");
      iBU_LOG_real((uint64_t)CFSTR("Fatal error: Only found %d of the required %d AFUH-style headers."), "-[IODualSPIWriter findHeaders]", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
      return objc_alloc_init((Class)NSArray);
    }
    iBU_LOG_real((uint64_t)CFSTR("AFUH style header"), "-[IODualSPIWriter findHeaders]", v38, v39, v40, v41, v42, v43, v74);
    if (-[NSMutableArray count](v33, "count"))
    {
      for (i = 0; i < (unint64_t)-[NSMutableArray count](v33, "count"); ++i)
      {
        v52 = -[NSMutableArray objectAtIndexedSubscript:](v33, "objectAtIndexedSubscript:", i);
        objc_msgSend(v52, "startLocation");
        iBU_LOG_real((uint64_t)CFSTR("iBootHeader%lu loaded from offset: 0x%08lx (slot %lu)"), "-[IODualSPIWriter findHeaders]", v53, v54, v55, v56, v57, v58, i);
        if (!objc_msgSend(v52, "imageAddress") || objc_msgSend(v52, "imageAddress") == -1)
        {
          v59 = objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
          objc_msgSend(v10, "removeObjectAtIndex:", 0);
          objc_msgSend(v52, "setImageAddress:", v59);
          iBU_LOG_real((uint64_t)CFSTR("iBootHeader%lu payload is missing; using next available: 0x%08lx"),
            "-[IODualSPIWriter findHeaders]",
            v60,
            v61,
            v62,
            v63,
            v64,
            v65,
            i);
        }
        if (objc_msgSend(v52, "secondaryPayloadOffset"))
        {
          if (objc_msgSend(v52, "secondaryPayloadOffset") == -1)
            v66 = v76;
          else
            v66 = 0;
          if ((v66 & 1) == 0)
            continue;
        }
        else if (!v76)
        {
          continue;
        }
        v67 = objc_msgSend(objc_msgSend(v77, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
        objc_msgSend(v77, "removeObjectAtIndex:", 0);
        objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](v33, "objectAtIndexedSubscript:", i), "setSecondaryPayloadOffset:", v67);
        iBU_LOG_real((uint64_t)CFSTR("iBootHeader%lu secondary payload is missing, using next available: 0x%08lx"), "-[IODualSPIWriter findHeaders]", v68, v69, v70, v71, v72, v73, i);
      }
    }
    return -[NSMutableArray copy](v33, "copy");
  }
  else
  {
    iBU_LOG_real((uint64_t)CFSTR("Old style header"), "-[IODualSPIWriter findHeaders]", v3, v4, v5, v6, v7, v8, v74);
    v11 = *(unsigned int **)(&self->_regSize + 1);
    v12 = *v11;
    v13 = v11[2];
    v14 = v11[4];
    v15 = v11[6];
    v16 = -[MSUiBootHeader initWithIOServiceWriter:]([MSUiBootHeaderV1 alloc], "initWithIOServiceWriter:", self);
    v17 = -[MSUiBootHeader initWithIOServiceWriter:]([MSUiBootHeaderV1 alloc], "initWithIOServiceWriter:", self);
    if (!-[MSUiBootHeaderV1 loadHeaderAtOffset:](v16, "loadHeaderAtOffset:", v14))
      iBU_LOG_real((uint64_t)CFSTR("Reading iBoot0 failed?!"), "-[IODualSPIWriter findHeaders]", v18, v19, v20, v21, v22, v23, v75);
    -[MSUiBootHeader setImageAddress:](v16, "setImageAddress:", v12);
    if (!-[MSUiBootHeaderV1 loadHeaderAtOffset:](v17, "loadHeaderAtOffset:", v15))
      iBU_LOG_real((uint64_t)CFSTR("Reading iBoot1 failed?!"), "-[IODualSPIWriter findHeaders]", v24, v25, v26, v27, v28, v29, v75);
    -[MSUiBootHeader setImageAddress:](v17, "setImageAddress:", v13);
    v30 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v16, v17, 0);

    return v30;
  }
}

- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4
{
  __int16 v5;
  uint64_t v7;
  size_t v8;
  char *v9;
  NSData *v10;

  v5 = a3;
  v7 = a3 & 0xFFFFF000;
  v8 = ((a3 + a4 + 4095) & 0xFFFFF000) - v7;
  v9 = (char *)malloc(v8);
  if (-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:](self, "readDataAtOffset:ofLength:intoBuffer:", v7, v8, v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9[v5 & 0xFFF], a4);
  }
  free(v9);
  return v10;
}

- (BOOL)verifyHeadersAtIndex:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v4 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    v23 = objc_msgSend(v4, "count");
    iBU_LOG_real((uint64_t)CFSTR("Only %d of 2 headers found, cannot verify"), "-[IODualSPIWriter verifyHeadersAtIndex:]", v5, v6, v7, v8, v9, v10, (uint64_t)v23);
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v11 = objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v12 = 1;
  v13 = objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v14 = objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  if (v14 == v11)
    v11 = v13;
  if (objc_msgSend(v11, "isValid"))
  {
    v15 = objc_msgSend(v14, "headerGeneration");
    if (v15 <= objc_msgSend(v11, "headerGeneration"))
    {
      objc_msgSend(v11, "headerGeneration");
      objc_msgSend(v14, "headerGeneration");
      iBU_LOG_real((uint64_t)CFSTR("Header at partition %lu does not have a larger generation count than existing valid header (%d !> %d)"), "-[IODualSPIWriter verifyHeadersAtIndex:]", v16, v17, v18, v19, v20, v21, a3);
      goto LABEL_9;
    }
    v12 = 1;
  }
LABEL_10:

  return v12;
}

- (BOOL)verifyFirmwareAtIndex:(unint64_t)a3 againstData:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = -[IODualSPIWriter findHeaders](self, "findHeaders");
  if ((unint64_t)objc_msgSend(v7, "count") >= a3 + 1)
  {
    v16 = objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v17 = objc_autoreleasePoolPush();
    v15 = objc_msgSend(-[IODualSPIWriter readDataAtOffset:ofLength:](self, "readDataAtOffset:ofLength:", objc_msgSend(v16, "imageAddress"), objc_msgSend(a4, "length")), "isEqual:", a4);
    if ((v15 & 1) == 0)
      iBU_LOG_real((uint64_t)CFSTR("Header %lu firmware image did not match reference firmware image (Stored %@ != Reference %@)"), "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]", v18, v19, v20, v21, v22, v23, a3);
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v8 = objc_msgSend(v7, "count");
    iBU_LOG_real((uint64_t)CFSTR("Only %d of %d necessary headers found, cannot verify"), "-[IODualSPIWriter verifyFirmwareAtIndex:againstData:]", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    v15 = 0;
  }

  return v15;
}

- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t outputStructCnt;
  uint64_t input[2];

  input[0] = a3;
  input[1] = a4;
  outputStructCnt = a4;
  iBU_LOG_real((uint64_t)CFSTR("inputs[0] = 0x%llx; inputs[1] = 0x%llx; buf = %p; outSize = 0x%lx; &outSize = %p\n"),
    "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  v10 = IOConnectCallMethod(-[IODualSPIWriter spiDriverConnect](self, "spiDriverConnect"), 2u, input, 2u, 0, 0, 0, 0, a5, &outputStructCnt);
  iBU_LOG_real((uint64_t)CFSTR("Got result: 0x%x"), "-[IODualSPIWriter readDataAtOffset:ofLength:intoBuffer:]", v11, v12, v13, v14, v15, v16, v10);
  return v10;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t input[2];

  v9 = *(_QWORD *)&a4;
  input[0] = a3;
  input[1] = a4;
  iBU_LOG_real((uint64_t)CFSTR("inputs[0] = 0x%llx; inputs[1] = 0x%llx"),
    "-[IODualSPIWriter eraseBytes:ofLength:withError:]",
    *(uint64_t *)&a3,
    *(uint64_t *)&a4,
    (uint64_t)a5,
    v5,
    v6,
    v7,
    a3);
  v11 = IOConnectCallMethod(*(_DWORD *)&self->_usesAFUH, 3u, input, 2u, 0, 0, 0, 0, 0, 0);
  v17 = v11;
  if (a5 && v11)
    *a5 = MSUBootFirmwareError(v11, 0, (uint64_t)CFSTR("_eraseBytes: Failed to erase %d bytes with error %d"), v12, v13, v14, v15, v16, v9);
  return v17;
}

- (int)_writeFirmware:(id)a3 toHeader:(id)a4 withError:(id *)a5
{
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSError *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v55;
  id v56;
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
  const __CFString *v69;
  uint64_t v71;
  unsigned int v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;

  v9 = objc_msgSend(a4, "packStructure");
  v10 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", a3);
  v112 = objc_msgSend(v9, "bytes");
  v113 = 0;
  v11 = -[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion");
  v12 = -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
  v13 = -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize") + v12;
  v14 = -[IODualSPIWriter _maxImageSize](self, "_maxImageSize");
  -[IODualSPIWriter _maxExtendedRegionSize](self, "_maxExtendedRegionSize");
  if (!-[IODualSPIWriter usesAFUH](self, "usesAFUH"))
    goto LABEL_8;
  if (-[IODualSPIWriter _usesExtendediBootRegion](self, "_usesExtendediBootRegion"))
    iBU_LOG_real((uint64_t)CFSTR("Using iBoot extended region. iBootRegionSize (%d) + ExtendedRegionSize (%d) == maxImageSize (%d)"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v15, v16, v17, v18, v19, v20, v14);
  v21 = objc_msgSend(a3, "length");
  v22 = objc_msgSend(a3, "length");
  if ((unint64_t)v21 <= v13)
  {
    iBU_LOG_real((uint64_t)CFSTR("Increasing firmware payload length by %lu in order to zero-out remaining segment."), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v23, v24, v25, v26, v27, v28, v13 - (_QWORD)v22);
    v36 = objc_msgSend(a3, "length");
    iBU_LOG_real((uint64_t)CFSTR("Old firmware payload size: %lu. New size: %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v37, v38, v39, v40, v41, v42, (uint64_t)v36);
    objc_msgSend(v10, "increaseLengthBy:", v13 - (_QWORD)objc_msgSend(a3, "length"));
LABEL_8:
    v43 = objc_msgSend(v10, "length");
    if (v14 >= v43)
      v50 = v43;
    else
      v50 = v14;
    iBU_LOG_real((uint64_t)CFSTR("Writing %d bytes (out of a possible %d) of the header payload: %@."), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v44, v45, v46, v47, v48, v49, v50);
    v51 = objc_msgSend(v10, "bytes");
    v52 = objc_msgSend(a4, "imageAddress");
    v53 = objc_msgSend(v10, "length");
    if (v14 >= v53)
      v54 = v53;
    else
      v54 = v14;
    v55 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", v51, v52, v54, &v113);
    if (v55)
    {
      v29 = v55;
      v56 = objc_msgSend(a4, "imageAddress");
      iBU_LOG_real((uint64_t)CFSTR("Failed to write firmware images to offset 0x%x with error %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
      if (!a5)
        return v29;
      v63 = v113;
      v110 = objc_msgSend(a4, "imageAddress");
      v69 = CFSTR("Failed to write firmware images to offset 0x%x with error %d");
    }
    else
    {
      v71 = v14;
      if ((unint64_t)objc_msgSend(v10, "length") > v14)
        v72 = v11;
      else
        v72 = 0;
      v73 = objc_msgSend(v10, "length");
      if (v72 == 1)
      {
        v80 = ((_DWORD)v73 - v14);
        iBU_LOG_real((uint64_t)CFSTR("Writing remaining %d bytes of the header payload to the secondary offset: %@."), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v74, v75, v76, v77, v78, v79, v80);
        v81 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", (char *)objc_msgSend(v10, "bytes") + v71, objc_msgSend(a4, "secondaryPayloadOffset"), v80, &v113);
        if (v81)
        {
          v29 = v81;
          objc_msgSend(a4, "secondaryPayloadOffset");
          iBU_LOG_real((uint64_t)CFSTR("Failed to write remaining %d bytes of firmware images to offset 0x%x with error %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v82, v83, v84, v85, v86, v87, v80);
          if (!a5)
            return v29;
          v63 = v113;
          objc_msgSend(a4, "secondaryPayloadOffset");
          v110 = (id)v80;
          v69 = CFSTR("Failed to write reamining %d bytes firmware images to offset 0x%x with error %d");
          goto LABEL_17;
        }
      }
      else
      {
        if ((unint64_t)v73 <= v14)
          v88 = 1;
        else
          v88 = v11;
        if ((v88 & 1) == 0)
        {
          v29 = -536870212;
          v96 = objc_msgSend(v10, "length");
          iBU_LOG_real((uint64_t)CFSTR("State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v97, v98, v99, v100, v101, v102, (uint64_t)v96);
          if (!a5)
            return v29;
          v103 = v113;
          v111 = objc_msgSend(v10, "length");
          v35 = MSUBootFirmwareError(3, v103, (uint64_t)CFSTR("State inconsistency detected. Firmware data length (%d) >? iBootRegionSize (%d) and usesIBootExtendedRegion is %d"), v104, v105, v106, v107, v108, (uint64_t)v111);
          goto LABEL_18;
        }
      }
      iBU_LOG_real((uint64_t)CFSTR("Writing header structure: %@."), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v74, v75, v76, v77, v78, v79, (uint64_t)a4);
      v29 = -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", v112, objc_msgSend(a4, "startLocation"), objc_msgSend(v9, "length"), &v113);
      if (!v29)
      {

        return v29;
      }
      v89 = objc_msgSend(a4, "startLocation");
      iBU_LOG_real((uint64_t)CFSTR("Failed to write header structure to offset 0x%x with error %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v90, v91, v92, v93, v94, v95, (uint64_t)v89);
      if (!a5)
        return v29;
      v63 = v113;
      v110 = objc_msgSend(a4, "startLocation");
      v69 = CFSTR("Failed to write header structure to offset 0x%x with error %d");
    }
LABEL_17:
    v35 = MSUBootFirmwareError(3, v63, (uint64_t)v69, v64, v65, v66, v67, v68, (uint64_t)v110);
    goto LABEL_18;
  }
  v29 = -536870212;
  iBU_LOG_real((uint64_t)CFSTR("Firmware payload %lul is larger than maximum payload size %d"), "-[IODualSPIWriter _writeFirmware:toHeader:withError:]", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
  if (a5)
  {
    v109 = objc_msgSend(a3, "length");
    v35 = MSUBootFirmwareError(3, 0, (uint64_t)CFSTR("Firmware payload %lul is larger than maximum payload size %d"), v30, v31, v32, v33, v34, (uint64_t)v109);
LABEL_18:
    *a5 = v35;
  }
  return v29;
}

- (int)_commitHeader:(id)a3 withError:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (objc_msgSend(a3, "isValid"))
  {
    if (a4)
      *a4 = MSUBootFirmwareError(4, 0, (uint64_t)CFSTR("Header wasn't prepared / invalid at time of commit: %@"), v7, v8, v9, v10, v11, (uint64_t)a3);
    return -536870212;
  }
  else
  {
    objc_msgSend(a3, "makeValid");
    v13 = objc_msgSend(a3, "packStructure");
    v14 = objc_msgSend(v13, "bytes");
    iBU_LOG_real((uint64_t)CFSTR("Committing valid header via flash as: %@"), "-[IODualSPIWriter _commitHeader:withError:]", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
    return -[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:](self, "_writeBytes:atOffset:ofLength:withError:", v14, objc_msgSend(a3, "startLocation"), objc_msgSend(v13, "length"), a4);
  }
}

- (int)_writeBytes:(char *)a3 atOffset:(unsigned int)a4 ofLength:(unsigned int)a5 withError:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  size_t v12;
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t input[2];

  v9 = *(_QWORD *)&a5;
  v12 = a5;
  input[0] = a4;
  input[1] = a5;
  iBU_LOG_real((uint64_t)CFSTR("inputs[0] = 0x%llx; inputs[1] = 0x%llx"),
    "-[IODualSPIWriter _writeBytes:atOffset:ofLength:withError:]",
    (uint64_t)a3,
    *(uint64_t *)&a4,
    *(uint64_t *)&a5,
    (uint64_t)a6,
    v6,
    v7,
    a4);
  v13 = IOConnectCallMethod(-[IODualSPIWriter spiDriverConnect](self, "spiDriverConnect"), 1u, input, 2u, a3, v12, 0, 0, 0, 0);
  v19 = v13;
  if (a6 && v13)
    *a6 = MSUBootFirmwareError(v13, 0, (uint64_t)CFSTR("_writeBytes: Failed writing %d bytes with error %d"), v14, v15, v16, v17, v18, v9);
  return v19;
}

- (void)dealloc
{
  io_connect_t v3;
  objc_super v4;

  v3 = *(_DWORD *)&self->_usesAFUH;
  if (v3)
    IOServiceClose(v3);

  v4.receiver = self;
  v4.super_class = (Class)IODualSPIWriter;
  -[IOServiceWriter dealloc](&v4, "dealloc");
}

- (unsigned)spiDriverConnect
{
  return *(_DWORD *)&self->_usesAFUH;
}

- (void)setSpiDriverConnect:(unsigned int)a3
{
  *(_DWORD *)&self->_usesAFUH = a3;
}

- (const)regBuffer
{
  return *(const char **)(&self->_regSize + 1);
}

- (void)setRegBuffer:(const char *)a3
{
  *(_QWORD *)(&self->_regSize + 1) = a3;
}

- (BOOL)usesAFUH
{
  return *(_BYTE *)(&self->super._serviceConnect + 1) & 1;
}

- (const)regStruct
{
  return *(const _reg_format_union **)((char *)&self->_regBuffer + 4);
}

- (void)setRegStruct:(const _reg_format_union *)a3
{
  *(const char **)((char *)&self->_regBuffer + 4) = (const char *)a3;
}

- (unsigned)regSize
{
  return self->_spiDriverConnect;
}

- (void)setRegSize:(unsigned int)a3
{
  self->_spiDriverConnect = a3;
}

- (NSData)regData
{
  return *(NSData **)((char *)&self->_regStruct + 4);
}

- (void)setRegData:(id)a3
{
  *(const _reg_format_union **)((char *)&self->_regStruct + 4) = (const _reg_format_union *)a3;
}

- (NSMutableArray)invalidHeaders
{
  return *(NSMutableArray **)((char *)&self->_regData + 4);
}

- (void)setInvalidHeaders:(id)a3
{
  *(NSData **)((char *)&self->_regData + 4) = (NSData *)a3;
}

@end
