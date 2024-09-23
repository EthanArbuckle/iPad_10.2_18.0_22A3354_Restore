@implementation AppleTypeCRetimerFirmwareRequestCreatorBackDeploy

- (AppleTypeCRetimerFirmwareRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *v9;
  AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *v10;
  AppleTypeCRetimerFirmwareRequestCreatorBackDeploy *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareRequestCreatorBackDeploy;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperBackDeploy initWithOptions:logFunction:logContext:](&v13, "initWithOptions:logFunction:logContext:", v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    if (!-[AppleTypeCRetimerFirmwareRequestCreatorBackDeploy parseOptions:](v9, "parseOptions:", v8))
    {
      v11 = 0;
      goto LABEL_6;
    }
    -[AppleTypeCRetimerFirmwareRequestCreatorBackDeploy generateRequestDictionary](v10, "generateRequestDictionary");
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4;
  id v5;
  FTABFileBackDeploy *v6;
  void *v7;
  void *v8;
  FTABSubfileBackDeploy *v9;
  void *v10;
  FTABFileBackDeploy *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v4 = a3;
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  if (!v5)
  {
    v32 = CFSTR("Unable to locate firmware data");
LABEL_14:
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", v32);
    v25 = 0;
    goto LABEL_15;
  }
  v6 = -[FTABFileBackDeploy initWithData:]([FTABFileBackDeploy alloc], "initWithData:", v5);
  v7 = *(void **)(&self->super._verbose + 1);
  *(_QWORD *)(&self->super._verbose + 1) = v6;

  v8 = *(void **)(&self->super._verbose + 1);
  if (!v8)
  {
    v32 = CFSTR("Failed to parse ftab");
    goto LABEL_14;
  }
  v9 = (FTABSubfileBackDeploy *)objc_msgSend(v8, "subfileWithTag:", CFSTR("rrko"));
  v10 = *(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1);
  *(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1) = v9;

  if (!*(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1))
  {
    v32 = CFSTR("Failed to locate rrko file in ftab");
    goto LABEL_14;
  }
  v11 = (FTABFileBackDeploy *)objc_msgSend(*(id *)(&self->super._verbose + 1), "subfileWithTag:", CFSTR("rkos"));
  v12 = *(FTABFileBackDeploy **)((char *)&self->_ftab + 1);
  *(FTABFileBackDeploy **)((char *)&self->_ftab + 1) = v11;

  if (!*(FTABFileBackDeploy **)((char *)&self->_ftab + 1))
  {
    v32 = CFSTR("Failed to locate rkos file in ftab");
    goto LABEL_14;
  }
  v13 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo"));
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TagNumber"));
    v16 = v15;
    if (v15)
    {
      BYTE1(self->_rrko) = objc_msgSend(v15, "unsignedCharValue");
      v17 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HardwareID"));
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ChipID"));
        *(_WORD *)((char *)&self->_rrko + 3) = (unsigned __int16)objc_msgSend(v19, "unsignedShortValue");
        v20 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BoardID"));
        *(_WORD *)((char *)&self->_rrko + 5) = (unsigned __int16)objc_msgSend(v20, "unsignedShortValue");
        v21 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityEpoch"));
        HIBYTE(self->_rrko) = objc_msgSend(v21, "unsignedCharValue");
        v39 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ProductionStatus"));
        self->_tagNumber = objc_msgSend(v39, "unsignedCharValue");
        v38 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityMode"));
        *(&self->_tagNumber + 1) = objc_msgSend(v38, "unsignedCharValue");
        v37 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityDomain"));
        LOBYTE(self->_chipID) = objc_msgSend(v37, "unsignedCharValue");
        v36 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ECID"));
        *(_QWORD *)&self->_securityDomain = objc_msgSend(v36, "unsignedLongLongValue");
        v22 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Nonce"));
        v23 = *(void **)((char *)&self->_ecid + 1);
        *(unint64_t *)((char *)&self->_ecid + 1) = (unint64_t)v22;

        v24 = *(unint64_t *)((char *)&self->_ecid + 1);
        v25 = v24 != 0;
        if (v24)
        {
          v35 = v19;
          v26 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ChipRev"));
          BYTE1(self->_nonce) = objc_msgSend(v26, "unsignedCharValue");
          v34 = v16;
          v27 = v21;
          v28 = v20;
          v29 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Demote"));
          BYTE2(self->_nonce) = objc_msgSend(v29, "BOOLValue");
          v30 = v29;
          v20 = v28;
          v21 = v27;
          v16 = v34;

          v31 = v26;
          v19 = v35;

        }
        else
        {
          -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Nonce missing from hardware dictionary"));
        }

      }
      else
      {
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Unable to locate hardware ID data"));
        v25 = 0;
      }

    }
    else
    {
      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Unable to locate tag number in device info"));
      v25 = 0;
    }

  }
  else
  {
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Unable to locate device info"));
    v25 = 0;
  }

LABEL_15:
  return v25;
}

- (id)generateHashForSubfile:(id)a3
{
  id v3;
  id v4;
  CC_LONG v5;
  CC_SHA512_CTX v7;
  unsigned __int8 md[48];

  memset(&v7, 0, sizeof(v7));
  v3 = a3;
  CC_SHA384_Init(&v7);
  v4 = objc_msgSend(v3, "dataPointer", *(_OWORD *)v7.count, *(_OWORD *)v7.hash, *(_OWORD *)&v7.hash[2], *(_OWORD *)&v7.hash[4], *(_OWORD *)&v7.hash[6], *(_OWORD *)v7.wbuf, *(_OWORD *)&v7.wbuf[2], *(_OWORD *)&v7.wbuf[4], *(_OWORD *)&v7.wbuf[6], *(_OWORD *)&v7.wbuf[8], *(_OWORD *)&v7.wbuf[10], *(_OWORD *)&v7.wbuf[12], *(_OWORD *)&v7.wbuf[14]);
  v5 = objc_msgSend(v3, "dataLength");

  CC_SHA384_Update(&v7, v4, v5);
  CC_SHA384_Final(md, &v7);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 48);
}

- (void)generateRequestDictionary
{
  uint64_t v3;
  id v4;
  NSString *v5;
  NSNumber *v6;
  NSString *v7;
  NSNumber *v8;
  NSString *v9;
  NSNumber *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  NSNumber *v14;
  NSString *v15;
  void *v16;
  int tagNumber;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  id v24;
  NSString *v25;
  int v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  uint64_t v40;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[4];
  _QWORD v52[4];

  v3 = BYTE1(self->_rrko);
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v40 = v3;
  v36 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("@Timer%u,Ticket"), CFSTR("%u"), 0, v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v5 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,BoardID,%u"), CFSTR("%u"), 0, v3);
  v6 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)&self->_rrko + 5));
  v35 = v5;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  v7 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ChipID,%u"), CFSTR("%u"), 0, v3);
  v8 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)&self->_rrko + 3));
  v42 = v7;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

  v9 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ECID,%u"), CFSTR("%u"), 0, v3);
  v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)&self->_securityDomain);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);

  v41 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,Nonce,%u"), CFSTR("%u"), 0, v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(unint64_t *)((char *)&self->_ecid + 1));
  v11 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ProductionMode,%u"), CFSTR("%u"), 0, v3);
  if (self->_tagNumber)
    v12 = &__kCFBooleanTrue;
  else
    v12 = &__kCFBooleanFalse;
  v39 = v11;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12);
  v13 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityDomain,%u"), CFSTR("%u"), 0, v3);
  v14 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", LOBYTE(self->_chipID));
  v38 = v13;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);

  v15 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityMode,%u"), CFSTR("%u"), 0, v3);
  if (*(&self->_tagNumber + 1))
    v16 = &__kCFBooleanTrue;
  else
    v16 = &__kCFBooleanFalse;
  v37 = v15;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16);
  v44 = -[AppleTypeCRetimerFirmwareRequestCreatorBackDeploy generateHashForSubfile:](self, "generateHashForSubfile:", *(FTABFileBackDeploy **)((char *)&self->_ftab + 1));
  v43 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RTKitOS,%u"), CFSTR("%u"), 0, v3);
  tagNumber = self->_tagNumber;
  if (BYTE2(self->_nonce) && self->_tagNumber)
  {
    v49[0] = CFSTR("Digest");
    v49[1] = CFSTR("EPRO");
    v50[0] = v44;
    v50[1] = &__kCFBooleanFalse;
    v49[2] = CFSTR("DPRO");
    v49[3] = CFSTR("ESEC");
    v50[2] = &__kCFBooleanTrue;
    v50[3] = &__kCFBooleanTrue;
    v49[4] = CFSTR("Trusted");
    v50[4] = &__kCFBooleanFalse;
    v18 = v50;
    v19 = v49;
    v20 = 5;
  }
  else
  {
    v51[0] = CFSTR("Digest");
    v51[1] = CFSTR("EPRO");
    if (tagNumber)
      v21 = &__kCFBooleanTrue;
    else
      v21 = &__kCFBooleanFalse;
    v52[0] = v44;
    v52[1] = v21;
    if (*(&self->_tagNumber + 1))
      v22 = &__kCFBooleanTrue;
    else
      v22 = &__kCFBooleanFalse;
    v51[2] = CFSTR("ESEC");
    v51[3] = CFSTR("Trusted");
    v52[2] = v22;
    v52[3] = &__kCFBooleanTrue;
    v18 = v52;
    v19 = v51;
    v20 = 4;
  }
  v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v43);

  v24 = -[AppleTypeCRetimerFirmwareRequestCreatorBackDeploy generateHashForSubfile:](self, "generateHashForSubfile:", *(FTABSubfileBackDeploy **)((char *)&self->_rkos + 1));
  v25 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RestoreRTKitOS,%u"), CFSTR("%u"), 0, v40);
  v26 = self->_tagNumber;
  if (BYTE2(self->_nonce) && self->_tagNumber)
  {
    v45[0] = CFSTR("Digest");
    v45[1] = CFSTR("EPRO");
    v46[0] = v24;
    v46[1] = &__kCFBooleanFalse;
    v45[2] = CFSTR("DPRO");
    v45[3] = CFSTR("ESEC");
    v46[2] = &__kCFBooleanTrue;
    v46[3] = &__kCFBooleanTrue;
    v45[4] = CFSTR("Trusted");
    v46[4] = &__kCFBooleanFalse;
    v27 = v46;
    v28 = v45;
    v29 = 5;
  }
  else
  {
    v47[0] = CFSTR("Digest");
    v47[1] = CFSTR("EPRO");
    if (v26)
      v30 = &__kCFBooleanTrue;
    else
      v30 = &__kCFBooleanFalse;
    v48[0] = v24;
    v48[1] = v30;
    if (*(&self->_tagNumber + 1))
      v31 = &__kCFBooleanTrue;
    else
      v31 = &__kCFBooleanFalse;
    v47[2] = CFSTR("ESEC");
    v47[3] = CFSTR("Trusted");
    v48[2] = v31;
    v48[3] = &__kCFBooleanTrue;
    v27 = v48;
    v28 = v47;
    v29 = 4;
  }
  v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v28, v29);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, v25);

  v33 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4);
  v34 = *(void **)&self->_demote;
  *(_QWORD *)&self->_demote = v33;

  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: request dictionary = %@"), BYTE1(self->_rrko) - 1, *(_QWORD *)&self->_demote);
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 89, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)((char *)&self->_ecid + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rkos + 1), 0);
  objc_storeStrong((id *)((char *)&self->_ftab + 1), 0);
  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
