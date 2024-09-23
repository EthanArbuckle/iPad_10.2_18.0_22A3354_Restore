@implementation SPIiBootUpdater

+ (id)IOMatchingPropertyTable
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("IOProviderClass");
  v4 = CFSTR("AppleEmbeddedSimpleSPINORFlasherDriver");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

- (SPIiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3;
  SPIiBootUpdater *v4;
  SPIiBootUpdater *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  const __CFString *v14;
  __objc2_class **v15;
  IOServiceWriter *v16;
  objc_super v18;

  v3 = *(_QWORD *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)SPIiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v18, "initWithIOService:");
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend((id)objc_opt_class(v4), "supportsDualiBoot");
    v13 = v6 == 0;
    if (v6)
      v14 = CFSTR("Device supports dual SPI boot.");
    else
      v14 = CFSTR("Device does not support dual SPI boot.");
    if (v13)
      v15 = &off_100178958;
    else
      v15 = off_100178950;
    iBU_LOG_real((uint64_t)v14, "-[SPIiBootUpdater initWithIOService:]", v7, v8, v9, v10, v11, v12, (uint64_t)v18.receiver);
    v16 = (IOServiceWriter *)objc_msgSend(objc_alloc(*v15), "initWithService:", v3);
    v5->_writer = v16;
    if (!v16)
    {

      return 0;
    }
  }
  return v5;
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  IOServiceWriter *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  IOServiceWriter *v22;
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
  IOServiceWriter *v34;
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
  NSError *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  IOServiceWriter *v55;
  uint64_t v56;
  uint64_t v57;

  v57 = 0;
  if (!-[IOServiceWriter isAvailable](-[SPIiBootUpdater writer](self, "writer"), "isAvailable"))
  {
    v34 = -[SPIiBootUpdater writer](self, "writer");
    iBU_LOG_real((uint64_t)CFSTR("SPIWriter %@ was unavailable at write-time"), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v35, v36, v37, v38, v39, v40, (uint64_t)v34);
    if (a3)
    {
      v55 = -[SPIiBootUpdater writer](self, "writer");
      v46 = MSUBootFirmwareError(6, 0, (uint64_t)CFSTR("SPIWriter %@ was unavailable at write-time"), v41, v42, v43, v44, v45, (uint64_t)v55);
LABEL_15:
      v13 = 0;
      *a3 = v46;
      return v13;
    }
    return 0;
  }
  v5 = -[SPIiBootUpdater _stitchFirmwareImage](self, "_stitchFirmwareImage");
  -[IOServiceWriter setIsErase:](-[SPIiBootUpdater writer](self, "writer"), "setIsErase:", -[MSUBootFirmwareUpdater isErase](self, "isErase"));
  -[IOServiceWriter setShouldCommit:](-[SPIiBootUpdater writer](self, "writer"), "setShouldCommit:", -[MSUBootFirmwareUpdater shouldCommit](self, "shouldCommit"));
  if (!v5)
  {
    iBU_LOG_real((uint64_t)CFSTR("SPI writer firmware data was nil!"), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v6, v7, v8, v9, v10, v11, v53);
    if (a3)
    {
      v46 = MSUBootFirmwareError(6, 0, (uint64_t)CFSTR("SPI writer firmware data was nil!"), v47, v48, v49, v50, v51, v56);
      goto LABEL_15;
    }
    return 0;
  }
  iBU_LOG_real((uint64_t)CFSTR("Beginning write of iBoot data block to writer."), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v6, v7, v8, v9, v10, v11, v53);
  v12 = -[IOServiceWriter writeData:withError:](-[SPIiBootUpdater writer](self, "writer"), "writeData:withError:", v5, &v57);
  v13 = v12 == 0;
  if (v12)
  {
    v14 = -[SPIiBootUpdater writer](self, "writer");
    iBU_LOG_real((uint64_t)CFSTR("Updater %@ failed to write to SPI"), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    if (a3)
    {
      v21 = v57;
      v22 = -[SPIiBootUpdater writer](self, "writer");
      *a3 = MSUBootFirmwareError(3, v21, (uint64_t)CFSTR("Updater %@ failed to write to SPI"), v23, v24, v25, v26, v27, (uint64_t)v22);
    }
  }
  if (!-[IOServiceWriter finished](-[SPIiBootUpdater writer](self, "writer"), "finished"))
    iBU_LOG_real((uint64_t)CFSTR("Failed to clean up SPI iBoot writer."), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v28, v29, v30, v31, v32, v33, v54);
  if (v12)
    iBU_LOG_real((uint64_t)CFSTR("Failed to fully update iBoot firmware images"), "-[SPIiBootUpdater updateBootFirmwareWithError:]", v28, v29, v30, v31, v32, v33, v54);

  return v13;
}

- (id)_stitchFirmwareImage
{
  NSData *v3;
  NSData *v4;
  NSData *v5;
  NSData *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v3 = -[MSUBootFirmwareUpdater llbData](self, "llbData");
  v4 = -[MSUBootFirmwareUpdater ibootData](self, "ibootData");
  v5 = -[MSUBootFirmwareUpdater ans2Data](self, "ans2Data");
  v6 = -[MSUBootFirmwareUpdater logoData](self, "logoData");
  v7 = -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary");
  v8 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v3, v7);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (char *)-[NSData length](v4, "length") + -[NSData length](v3, "length") + 100);
  objc_msgSend(v10, "appendData:", v9);

  if (v4)
  {
    if (v10)
    {
      v11 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v4, v7);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v10, "appendData:", v11);

      }
    }
  }
  if (v5)
  {
    if (v10)
    {
      v13 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v5, v7);
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v10, "appendData:", v13);

      }
    }
  }
  if (v6)
  {
    if (v10)
    {
      v15 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v6, v7);
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v10, "appendData:", v15);

      }
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPIiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (IOServiceWriter)writer
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 88, 1);
}

@end
