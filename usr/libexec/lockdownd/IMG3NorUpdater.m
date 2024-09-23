@implementation IMG3NorUpdater

+ (id)IOMatchingPropertyTable
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("IOProviderClass");
  v4 = CFSTR("AppleImage3NORAccess");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

- (IMG3NorUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3;
  IMG3NorUpdater *v4;
  IOServiceWriter *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)IMG3NorUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = -[IOServiceWriter initWithService:]([IOServiceWriter alloc], "initWithService:", v3);
    v4->_writer = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  NSData *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
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
  CFDataRef v29;
  NSArray *v30;
  id v31;
  id v32;
  char *v33;
  uint64_t v34;
  NSUInteger v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL result;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFErrorRef v51;
  const __CFString *v52;
  uint64_t v53;
  NSError *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id *v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CFErrorRef v64;
  CFDataRef v65;
  _BYTE v66[128];

  v64 = 0;
  v65 = 0;
  v9 = -[MSUBootFirmwareUpdater llbData](self, "llbData");
  v10 = -[NSArray count](-[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages"), "count");
  if (!ramrod_ticket_create_img3(&v65, &v64))
  {
    iBU_LOG_real((uint64_t)CFSTR("Img3 encoding failed"), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v11, v12, v13, v14, v15, v16, v55);
    if (!a5)
      return 0;
    v51 = v64;
    v52 = CFSTR("Img3 encoding failed");
    v53 = 8;
LABEL_26:
    v54 = MSUBootFirmwareError(v53, (uint64_t)v51, (uint64_t)v52, v46, v47, v48, v49, v50, v57);
    result = 0;
    *a5 = v54;
    return result;
  }
  if (!-[IOServiceWriter isAvailable](-[IMG3NorUpdater writer](self, "writer"), "isAvailable"))
  {
    iBU_LOG_real((uint64_t)CFSTR("SPI writer was unavailable at write-time."), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v17, v18, v19, v20, v21, v22, v55);
    if (!a5)
      return 0;
    v52 = CFSTR("SPI writer was unavailable at write-time.");
    v53 = 6;
    v51 = 0;
    goto LABEL_26;
  }
  if (!-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:](self, "_encodeAndWriteIMG3Data:isLLB:isTicket:withError:", v9, 1, 0, &v64))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to write Img3 boot data"), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v23, v24, v25, v26, v27, v28, v55);
    if (a5)
    {
      v51 = v64;
      v52 = CFSTR("Failed to write Img3 boot data");
LABEL_25:
      v53 = 1;
      goto LABEL_26;
    }
    return 0;
  }
  v29 = v65;
  if (v65
    && !-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:](self, "_encodeAndWriteIMG3Data:isLLB:isTicket:withError:", v65, 0, 1, &v64))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to write Img3 Ticket data"), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", (uint64_t)v29, v24, v25, v26, v27, v28, v55);
    if (a5)
    {
      v51 = v64;
      v52 = CFSTR("Failed to write Img3 Ticket data");
      goto LABEL_25;
    }
    return 0;
  }
  iBU_LOG_real((uint64_t)CFSTR("Img3 Ticket Data updated"), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", (uint64_t)v29, v24, v25, v26, v27, v28, v55);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v30 = -[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages");
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v31)
  {
    v32 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v61;
    v35 = v10 + 2;
    v58 = a5;
LABEL_8:
    v36 = 0;
    v59 = v33;
    v37 = 100 * (_QWORD)v33 + 200;
    while (1)
    {
      if (*(_QWORD *)v61 != v34)
        objc_enumerationMutation(v30);
      v38 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v36);
      ((void (*)(_QWORD, unint64_t, firmware_update_context *))a3->var1)(0, v37 / v35, a4);
      if (!-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:](self, "_encodeAndWriteIMG3Data:isLLB:isTicket:withError:", v38, 0, 0, &v64))break;
      v36 = (char *)v36 + 1;
      v37 += 100;
      if (v32 == v36)
      {
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        v33 = (char *)v36 + (_QWORD)v59;
        result = 1;
        if (v32)
          goto LABEL_8;
        return result;
      }
    }
    iBU_LOG_real((uint64_t)CFSTR("Failed to write Img3 Firmware data"), "-[IMG3NorUpdater updateBootFirmwareWithCallback:context:error:]", v39, v40, v41, v42, v43, v44, v56);
    a5 = v58;
    if (!v58)
      return 0;
    v51 = v64;
    v52 = CFSTR("Failed to write Img3 Firmware data");
    goto LABEL_25;
  }
  return 1;
}

- (BOOL)_encodeAndWriteIMG3Data:(__CFData *)a3 isLLB:(BOOL)a4 isTicket:(BOOL)a5 withError:(id *)a6
{
  _BOOL4 v8;
  UInt8 *BytePtr;
  CFIndex Length;
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
  const __CFString *v24;
  NSError *v25;
  BOOL v26;
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
  uint64_t v37;
  NSError *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFIndex v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const UInt8 *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v8 = a4;
  v64 = 0;
  v65 = 0;
  BytePtr = (UInt8 *)CFDataGetBytePtr(a3);
  Length = CFDataGetLength(a3);
  if (image3InstantiateFromBuffer(&v65, BytePtr, Length, 0))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to instantiate img3 image"), "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v13, v14, v15, v16, v17, v18, v61);
    if (a6)
    {
      v24 = CFSTR("Failed to instantiate img3 image");
LABEL_4:
      v25 = MSUBootFirmwareError(1, 0, (uint64_t)v24, v19, v20, v21, v22, v23, v62);
LABEL_5:
      v26 = 0;
      *a6 = v25;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (image3GetTagUnsignedNumber(v65, 1415139397, &v64, 0))
  {
    iBU_LOG_real((uint64_t)CFSTR("Failed to read img3 type"), "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v27, v28, v29, v30, v31, v32, v61);
    if (a6)
    {
      v38 = MSUBootFirmwareError(1, 0, (uint64_t)CFSTR("Failed to read img3 type"), v33, v34, v35, v36, v37, v63);
LABEL_9:
      v26 = 0;
      *a6 = v38;
      return v26;
    }
    return 0;
  }
  if (!a5 && v64 == 1396916546)
  {
    iBU_LOG_real((uint64_t)CFSTR("Unexpected imageType in firmware"), "-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]", v27, v28, v29, v30, v31, v32, v61);
    if (a6)
    {
      v24 = CFSTR("Unexpected imageType in firmware");
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  CFDataGetLength(a3);
  ramrod_log_msg("%s: flashing %c%c%c%c data (length = 0x%lx)\n", v39, v40, v41, v42, v43, v44, v45, (char)"-[IMG3NorUpdater _encodeAndWriteIMG3Data:isLLB:isTicket:withError:]");
  v46 = CFDataGetLength(a3);
  v47 = mmap(0, v46, 3, 4098, -1, 0);
  if (v47 == (void *)-1)
  {
    if (a6)
    {
      v25 = MSUBootFirmwareError(3, 0, (uint64_t)CFSTR("unable to mmap %zu bytes for image3 data"), v48, v49, v50, v51, v52, v46);
      goto LABEL_5;
    }
LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  v53 = v47;
  v54 = CFDataGetBytePtr(a3);
  memmove(v53, v54, v46);
  if (IOConnectCallStructMethod(-[IOServiceWriter serviceConnect](-[IMG3NorUpdater writer](self, "writer"), "serviceConnect"), !v8, v53, v46, 0, 0))
  {
    if (a6)
    {
      v38 = MSUBootFirmwareError(3, 0, (uint64_t)CFSTR("%s returned an error when writing img3 object"), v55, v56, v57, v58, v59, (uint64_t)"AppleImage3NORAccess");
      goto LABEL_9;
    }
    return 0;
  }
  munmap(v53, v46);
  v26 = 1;
LABEL_22:
  if (v65)
    image3Discard(&v65);
  return v26;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMG3NorUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (IOServiceWriter)writer
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 88, 1);
}

@end
