@implementation AppleTypeCRetimerFirmwareRequestCreatorOS

- (AppleTypeCRetimerFirmwareRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareRequestCreatorOS *v9;
  AppleTypeCRetimerFirmwareRequestCreatorOS *v10;
  AppleTypeCRetimerFirmwareRequestCreatorOS *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareRequestCreatorOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS initWithOptions:logFunction:logContext:](&v13, sel_initWithOptions_logFunction_logContext_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    if (!-[AppleTypeCRetimerFirmwareRequestCreatorOS parseOptions:](v9, "parseOptions:", v8))
    {
      v11 = 0;
      goto LABEL_6;
    }
    -[AppleTypeCRetimerFirmwareRequestCreatorOS generateRequestDictionary](v10, "generateRequestDictionary");
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4;
  id v5;
  FTABFileOS *v6;
  FTABFileOS *ftab;
  FTABFileOS *v8;
  FTABSubfileOS *v9;
  FTABSubfileOS *rrko;
  FTABSubfileOS *v11;
  FTABSubfileOS *rkos;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSData *v22;
  NSData *nonce;
  NSData *v24;
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
  v5 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  if (!v5)
  {
    v32 = CFSTR("Unable to locate firmware data");
LABEL_14:
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v32);
    v25 = 0;
    goto LABEL_15;
  }
  v6 = -[FTABFileOS initWithData:]([FTABFileOS alloc], "initWithData:", v5);
  ftab = self->_ftab;
  self->_ftab = v6;

  v8 = self->_ftab;
  if (!v8)
  {
    v32 = CFSTR("Failed to parse ftab");
    goto LABEL_14;
  }
  v9 = (FTABSubfileOS *)-[FTABFileOS subfileWithTag:](v8, "subfileWithTag:", CFSTR("rrko"));
  rrko = self->_rrko;
  self->_rrko = v9;

  if (!self->_rrko)
  {
    v32 = CFSTR("Failed to locate rrko file in ftab");
    goto LABEL_14;
  }
  v11 = (FTABSubfileOS *)-[FTABFileOS subfileWithTag:](self->_ftab, "subfileWithTag:", CFSTR("rkos"));
  rkos = self->_rkos;
  self->_rkos = v11;

  if (!self->_rkos)
  {
    v32 = CFSTR("Failed to locate rkos file in ftab");
    goto LABEL_14;
  }
  v13 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo"));
  v14 = v13;
  if (v13)
  {
    v15 = (id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TagNumber"));
    v16 = v15;
    if (v15)
    {
      self->_tagNumber = objc_msgSend(v15, "unsignedCharValue");
      v17 = (id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HardwareID"));
      v18 = v17;
      if (v17)
      {
        v19 = (id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ChipID"));
        self->_chipID = objc_msgSend(v19, "unsignedShortValue");
        v20 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BoardID"));
        self->_boardID = objc_msgSend(v20, "unsignedShortValue");
        v21 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityEpoch"));
        self->_securityEpoch = objc_msgSend(v21, "unsignedCharValue");
        v39 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ProductionStatus"));
        self->_productionStatus = objc_msgSend(v39, "unsignedCharValue");
        v38 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityMode"));
        self->_securityMode = objc_msgSend(v38, "unsignedCharValue");
        v37 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SecurityDomain"));
        self->_securityDomain = objc_msgSend(v37, "unsignedCharValue");
        v36 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ECID"));
        self->_ecid = objc_msgSend(v36, "unsignedLongLongValue");
        v22 = (NSData *)(id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Nonce"));
        nonce = self->_nonce;
        self->_nonce = v22;

        v24 = self->_nonce;
        v25 = v24 != 0;
        if (v24)
        {
          v35 = v19;
          v26 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ChipRev"));
          self->_chipRev = objc_msgSend(v26, "unsignedCharValue");
          v34 = v16;
          v27 = v21;
          v28 = v20;
          v29 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Demote"));
          self->_demote = objc_msgSend(v29, "BOOLValue");
          v30 = v29;
          v20 = v28;
          v21 = v27;
          v16 = v34;

          v31 = v26;
          v19 = v35;

        }
        else
        {
          -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Nonce missing from hardware dictionary"));
        }

      }
      else
      {
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Unable to locate hardware ID data"));
        v25 = 0;
      }

    }
    else
    {
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Unable to locate tag number in device info"));
      v25 = 0;
    }

  }
  else
  {
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Unable to locate device info"));
    v25 = 0;
  }

LABEL_15:
  return v25;
}

- (id)generateHashForSubfile:(id)a3
{
  id v3;
  const void *v4;
  CC_LONG v5;
  CC_SHA512_CTX v7;
  unsigned __int8 md[48];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  v3 = a3;
  CC_SHA384_Init(&v7);
  v4 = (const void *)objc_msgSend(v3, "dataPointer", *(_OWORD *)v7.count, *(_OWORD *)v7.hash, *(_OWORD *)&v7.hash[2], *(_OWORD *)&v7.hash[4], *(_OWORD *)&v7.hash[6], *(_OWORD *)v7.wbuf, *(_OWORD *)&v7.wbuf[2], *(_OWORD *)&v7.wbuf[4], *(_OWORD *)&v7.wbuf[6], *(_OWORD *)&v7.wbuf[8], *(_OWORD *)&v7.wbuf[10], *(_OWORD *)&v7.wbuf[12], *(_OWORD *)&v7.wbuf[14]);
  v5 = objc_msgSend(v3, "dataLength");

  CC_SHA384_Update(&v7, v4, v5);
  CC_SHA384_Final(md, &v7);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 48);
}

- (void)generateRequestDictionary
{
  uint64_t tagNumber;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  int productionStatus;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  int v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSDictionary *v42;
  NSDictionary *requestDictionary;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[4];
  _QWORD v62[6];

  v62[4] = *MEMORY[0x24BDAC8D0];
  tagNumber = self->_tagNumber;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v49 = tagNumber;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("@Timer%u,Ticket"), CFSTR("%u"), 0, tagNumber);
  v6 = MEMORY[0x24BDBD1C8];
  v45 = v5;
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v7 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,BoardID,%u"), CFSTR("%u"), 0, tagNumber);
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_boardID);
  v44 = v7;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

  v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ChipID,%u"), CFSTR("%u"), 0, tagNumber);
  v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_chipID);
  v52 = v9;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);

  v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ECID,%u"), CFSTR("%u"), 0, tagNumber);
  v12 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ecid);
  v51 = v11;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

  v50 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,Nonce,%u"), CFSTR("%u"), 0, tagNumber);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_nonce);
  v13 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ProductionMode,%u"), CFSTR("%u"), 0, tagNumber);
  v14 = MEMORY[0x24BDBD1C0];
  v15 = v6;
  if (self->_productionStatus)
    v16 = v6;
  else
    v16 = MEMORY[0x24BDBD1C0];
  v48 = v13;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16);
  v17 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityDomain,%u"), CFSTR("%u"), 0, tagNumber);
  v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_securityDomain);
  v47 = v17;
  v19 = v17;
  v20 = v15;
  v21 = v14;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

  v22 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityMode,%u"), CFSTR("%u"), 0, tagNumber);
  if (self->_securityMode)
    v23 = v20;
  else
    v23 = v14;
  v46 = v22;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23);
  v54 = -[AppleTypeCRetimerFirmwareRequestCreatorOS generateHashForSubfile:](self, "generateHashForSubfile:", self->_rkos);
  v53 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RTKitOS,%u"), CFSTR("%u"), 0, tagNumber);
  productionStatus = self->_productionStatus;
  if (self->_demote && self->_productionStatus)
  {
    v59[0] = CFSTR("Digest");
    v59[1] = CFSTR("EPRO");
    v60[0] = v54;
    v60[1] = v14;
    v59[2] = CFSTR("DPRO");
    v59[3] = CFSTR("ESEC");
    v60[2] = v20;
    v60[3] = v20;
    v59[4] = CFSTR("Trusted");
    v60[4] = v14;
    v25 = (void *)MEMORY[0x24BDBCE70];
    v26 = v60;
    v27 = v59;
    v28 = 5;
  }
  else
  {
    v61[0] = CFSTR("Digest");
    v61[1] = CFSTR("EPRO");
    if (productionStatus)
      v29 = v20;
    else
      v29 = v14;
    v62[0] = v54;
    v62[1] = v29;
    if (self->_securityMode)
      v30 = v20;
    else
      v30 = v14;
    v61[2] = CFSTR("ESEC");
    v61[3] = CFSTR("Trusted");
    v62[2] = v30;
    v62[3] = v20;
    v25 = (void *)MEMORY[0x24BDBCE70];
    v26 = v62;
    v27 = v61;
    v28 = 4;
  }
  v31 = (id)objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, v53);

  v32 = -[AppleTypeCRetimerFirmwareRequestCreatorOS generateHashForSubfile:](self, "generateHashForSubfile:", self->_rrko);
  v33 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RestoreRTKitOS,%u"), CFSTR("%u"), 0, v49);
  v34 = self->_productionStatus;
  if (self->_demote && self->_productionStatus)
  {
    v55[0] = CFSTR("Digest");
    v55[1] = CFSTR("EPRO");
    v56[0] = v32;
    v56[1] = v21;
    v55[2] = CFSTR("DPRO");
    v55[3] = CFSTR("ESEC");
    v56[2] = v20;
    v56[3] = v20;
    v55[4] = CFSTR("Trusted");
    v56[4] = v21;
    v35 = (void *)MEMORY[0x24BDBCE70];
    v36 = v56;
    v37 = v55;
    v38 = 5;
  }
  else
  {
    v57[0] = CFSTR("Digest");
    v57[1] = CFSTR("EPRO");
    if (v34)
      v39 = v20;
    else
      v39 = v21;
    v58[0] = v32;
    v58[1] = v39;
    if (self->_securityMode)
      v40 = v20;
    else
      v40 = v21;
    v57[2] = CFSTR("ESEC");
    v57[3] = CFSTR("Trusted");
    v58[2] = v40;
    v58[3] = v20;
    v35 = (void *)MEMORY[0x24BDBCE70];
    v36 = v58;
    v37 = v57;
    v38 = 4;
  }
  v41 = (id)objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, v38);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, v33);

  v42 = (NSDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  requestDictionary = self->_requestDictionary;
  self->_requestDictionary = v42;

  -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](self, "verboseLog:", CFSTR("ATCRT %u: request dictionary = %@"), self->_tagNumber - 1, self->_requestDictionary);
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_rrko, 0);
  objc_storeStrong((id *)&self->_rkos, 0);
  objc_storeStrong((id *)&self->_ftab, 0);
}

@end
