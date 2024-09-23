@implementation AppleTypeCRetimerFirmwareAggregateRequestCreatorOS

- (AppleTypeCRetimerFirmwareAggregateRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *v9;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *v10;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareAggregateRequestCreatorOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS initWithOptions:logFunction:logContext:](&v13, sel_initWithOptions_logFunction_logContext_, v8, a4, a5);
  v10 = v9;
  if (!v9
    || -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS parseOptions:](v9, "parseOptions:", v8)
    && -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateRequestDictionary](v10, "generateRequestDictionary"))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4;
  id v5;
  FTABFileOS *v6;
  FTABFileOS *v7;
  id v8;
  void *v9;
  NSData *v10;
  NSData *rrkoData;
  id v12;
  void *v13;
  NSData *v14;
  NSData *rkosData;
  id v16;
  void *v17;
  NSData *v18;
  NSData *cphyData;
  BOOL v20;
  UARPSuperBinaryOS *v21;
  UARPSuperBinaryOS *v22;
  UARPAssetTagOS *v23;
  id v24;
  void *v25;
  NSData *v26;
  NSData *v27;
  UARPAssetTagOS *v28;
  id v29;
  FTABFileOS *v30;
  id v31;
  FTABFileOS *v32;
  id v33;
  NSData *v34;
  NSData *v35;
  id v36;
  void *v37;
  NSData *v38;
  NSData *v39;
  const __CFString *v40;
  int v41;
  void *v42;
  id v43;
  NSArray *v44;
  NSArray *deviceInfoArray;
  NSDictionary *v46;
  NSDictionary *apParameters;
  const __CFString *v48;
  id v50;
  UARPAssetTagOS *v51;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[FTABFileOS initWithData:]([FTABFileOS alloc], "initWithData:", v5);
    v7 = v6;
    if (v6)
    {
      v8 = -[FTABFileOS subfileWithTag:](v6, "subfileWithTag:", CFSTR("rrko"));
      if (v8)
      {
        v9 = v8;
        v10 = (NSData *)(id)objc_msgSend(v8, "data");
        rrkoData = self->_rrkoData;
        self->_rrkoData = v10;

        v12 = -[FTABFileOS subfileWithTag:](v7, "subfileWithTag:", CFSTR("rkos"));
        if (v12)
        {
          v13 = v12;
          v14 = (NSData *)(id)objc_msgSend(v12, "data");
          rkosData = self->_rkosData;
          self->_rkosData = v14;

          v16 = -[FTABFileOS subfileWithTag:](v7, "subfileWithTag:", CFSTR("cphy"));
          v17 = v16;
          if (v16)
          {
            v18 = (NSData *)(id)objc_msgSend(v16, "data");
            cphyData = self->_cphyData;
            self->_cphyData = v18;

          }
          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("No cphy data found"));
          }

          goto LABEL_32;
        }
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to locate rkos file in ftab"));

        goto LABEL_31;
      }
      v40 = CFSTR("Failed to locate rrko file in ftab");
    }
    else
    {
      v21 = -[UARPSuperBinaryOS initWithData:delegate:delegateQueue:]([UARPSuperBinaryOS alloc], "initWithData:delegate:delegateQueue:", v5, 0, 0);
      if (v21)
      {
        v22 = v21;
        v23 = -[UARPAssetTagOS initWithString:]([UARPAssetTagOS alloc], "initWithString:", CFSTR("RRKO"));
        v24 = -[UARPSuperBinaryOS payloadWith4ccTag:](v22, "payloadWith4ccTag:", v23);
        v25 = v24;
        if (v24)
        {
          v26 = (NSData *)(id)objc_msgSend(v24, "payloadData");
          v27 = self->_rrkoData;
          self->_rrkoData = v26;

          v28 = -[UARPAssetTagOS initWithString:]([UARPAssetTagOS alloc], "initWithString:", CFSTR("FIRM"));
          v29 = -[UARPSuperBinaryOS payloadWith4ccTag:](v22, "payloadWith4ccTag:", v28);
          if (v29)
          {
            v51 = v28;
            v30 = [FTABFileOS alloc];
            v31 = (id)objc_msgSend(v29, "payloadData");
            v32 = -[FTABFileOS initWithData:](v30, "initWithData:", v31);

            if (v32)
            {
              v33 = -[FTABFileOS subfileWithTag:](v32, "subfileWithTag:", CFSTR("rkos"));
              if (v33)
              {
                v50 = v33;
                v34 = (NSData *)(id)objc_msgSend(v33, "data");
                v35 = self->_rkosData;
                self->_rkosData = v34;

                v36 = -[FTABFileOS subfileWithTag:](v32, "subfileWithTag:", CFSTR("cphy"));
                v37 = v36;
                if (v36)
                {
                  v38 = (NSData *)(id)objc_msgSend(v36, "data");
                  v39 = self->_cphyData;
                  self->_cphyData = v38;

                }
                else
                {
                  -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("No cphy data found"));
                }

                v41 = 0;
                v42 = v50;
              }
              else
              {
                -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to locate rkos file in super binary ftab"));
                v42 = 0;
                v41 = 1;
              }

            }
            else
            {
              -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to parse FTAB in super binary"));
              v41 = 1;
            }

            v28 = v51;
          }
          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to locate FTAB in super binary"));
            v41 = 1;
          }

        }
        else
        {
          -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to locate rrko file in super binary"));
          v41 = 1;
        }

        if (!v41)
        {
LABEL_32:
          v43 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = (NSArray *)(id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("InfoArray"));
            deviceInfoArray = self->_deviceInfoArray;
            self->_deviceInfoArray = v44;

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = (NSDictionary *)(id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("APInfo"));
              apParameters = self->_apParameters;
              self->_apParameters = v46;

              v20 = 1;
LABEL_38:

              goto LABEL_39;
            }
            v48 = CFSTR("Failed to locate device info array");
          }
          else
          {
            v48 = CFSTR("Failed to locate device info");
          }
          -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v48);
          v20 = 0;
          goto LABEL_38;
        }
LABEL_31:
        v20 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v40 = CFSTR("Failed to parse firmware data");
    }
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v40);
    goto LABEL_31;
  }
  -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Unable to locate firmware data"));
  v20 = 0;
LABEL_40:

  return v20;
}

- (id)generateHashForData:(id)a3
{
  id v3;
  id v4;
  const void *v5;
  CC_LONG v6;
  CC_SHA512_CTX v8;
  unsigned __int8 md[48];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&v8, 0, sizeof(v8));
  v3 = a3;
  CC_SHA384_Init(&v8);
  v4 = objc_retainAutorelease(v3);
  v5 = (const void *)objc_msgSend(v4, "bytes", *(_OWORD *)v8.count, *(_OWORD *)v8.hash, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[4], *(_OWORD *)&v8.hash[6], *(_OWORD *)v8.wbuf, *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[4], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[8], *(_OWORD *)&v8.wbuf[10], *(_OWORD *)&v8.wbuf[12], *(_OWORD *)&v8.wbuf[14]);
  v6 = objc_msgSend(v4, "length");

  CC_SHA384_Update(&v8, v5, v6);
  CC_SHA384_Final(md, &v8);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 48);
}

- (BOOL)generateRequestDictionary
{
  AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  char isKindOfClass;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  NSDictionary *v69;
  NSDictionary *requestDictionary;
  BOOL v71;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  NSArray *obj;
  id v93;
  id v94;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorOS *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[4];
  _QWORD v116[4];
  _BYTE v117[128];
  uint64_t v118;

  v2 = self;
  v118 = *MEMORY[0x24BDAC8D0];
  v3 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:](self, "generateHashForData:", self->_rkosData);
  v4 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:](v2, "generateHashForData:", v2->_rrkoData);
  if (v2->_cphyData)
    v5 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:](v2, "generateHashForData:");
  else
    v5 = 0;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v2->_deviceInfoArray;
  v96 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  if (v96)
  {
    v97 = *(_QWORD *)v102;
    v98 = v6;
    v85 = v4;
    v86 = v3;
    v84 = v5;
    v95 = v2;
LABEL_6:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v102 != v97)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v7);
      v9 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TagNumber"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v10 = objc_msgSend(v9, "unsignedCharValue");
      v11 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HardwareID"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate hardware ID data"));

        goto LABEL_93;
      }
      v99 = v9;
      v100 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("@Timer%u,Ticket"), CFSTR("%u"), 0, v10);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8]);
      v12 = v6;
      v13 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BoardID"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v93 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,BoardID,%u"), CFSTR("%u"), 0, v10);
        v94 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13);
        v14 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ChipID"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ChipID,%u"), CFSTR("%u"), 0, v10);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v15);
          v16 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ECID"));
          objc_opt_class();
          v90 = v16;
          v91 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v88 = v14;
            v87 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ECID,%u"), CFSTR("%u"), 0, v10);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v16);
            v17 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Nonce"));
            objc_opt_class();
            v89 = v17;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v82 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,Nonce,%u"), CFSTR("%u"), 0, v10);
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v17);
              v18 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ProductionStatus"));
              objc_opt_class();
              v83 = v18;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ProductionMode,%u"), CFSTR("%u"), 0, v10);
                if (objc_msgSend(v18, "unsignedCharValue"))
                  v20 = MEMORY[0x24BDBD1C8];
                else
                  v20 = MEMORY[0x24BDBD1C0];
                v81 = v19;
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);
                v21 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecurityDomain"));
                objc_opt_class();
                v14 = v88;
                v80 = v21;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v79 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityDomain,%u"), CFSTR("%u"), 0, v10);
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21);
                  v22 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecurityMode"));
                  objc_opt_class();
                  v78 = v22;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v23 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityMode,%u"), CFSTR("%u"), 0, v10);
                    if (objc_msgSend(v22, "unsignedCharValue"))
                      v24 = MEMORY[0x24BDBD1C8];
                    else
                      v24 = MEMORY[0x24BDBD1C0];
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v23);
                    v25 = v22;
                    v26 = (id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Demote"));
                    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v2 = v95;
                      -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Invalid demote setting for tag %u"), v10);
                      v35 = 1;
                      v29 = v99;
                      v36 = v100;
                    }
                    else
                    {
                      v27 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Trusted"));
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();
                      v77 = (id)MEMORY[0x24BDBD1C8];
                      v29 = v99;
                      if ((isKindOfClass & 1) != 0)
                        v77 = v27;
                      v73 = v27;
                      v74 = v23;
                      v76 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RTKitOS,%u"), CFSTR("%u"), 0, v10);
                      v30 = v26;
                      if (objc_msgSend(v26, "BOOLValue")
                        && objc_msgSend(v83, "unsignedCharValue"))
                      {
                        v113[0] = CFSTR("Digest");
                        v113[1] = CFSTR("EPRO");
                        v114[0] = v86;
                        v114[1] = MEMORY[0x24BDBD1C0];
                        v113[2] = CFSTR("DPRO");
                        v113[3] = CFSTR("ESEC");
                        v114[2] = MEMORY[0x24BDBD1C8];
                        v114[3] = MEMORY[0x24BDBD1C8];
                        v113[4] = CFSTR("Trusted");
                        v114[4] = MEMORY[0x24BDBD1C0];
                        v31 = (void *)MEMORY[0x24BDBCE70];
                        v32 = v114;
                        v33 = v113;
                        v34 = 5;
                      }
                      else
                      {
                        v116[0] = v86;
                        v115[0] = CFSTR("Digest");
                        v115[1] = CFSTR("EPRO");
                        v39 = objc_msgSend(v83, "unsignedCharValue");
                        v40 = MEMORY[0x24BDBD1C8];
                        v41 = MEMORY[0x24BDBD1C0];
                        if (v39)
                          v42 = MEMORY[0x24BDBD1C8];
                        else
                          v42 = MEMORY[0x24BDBD1C0];
                        v116[1] = v42;
                        v115[2] = CFSTR("ESEC");
                        if (objc_msgSend(v25, "unsignedCharValue"))
                          v43 = v40;
                        else
                          v43 = v41;
                        v116[2] = v43;
                        v115[3] = CFSTR("Trusted");
                        if (objc_msgSend(v77, "BOOLValue"))
                          v44 = v40;
                        else
                          v44 = v41;
                        v26 = v30;
                        v116[3] = v44;
                        v31 = (void *)MEMORY[0x24BDBCE70];
                        v32 = v116;
                        v33 = v115;
                        v34 = 4;
                      }
                      v45 = (id)objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
                      objc_msgSend(v98, "setObject:forKeyedSubscript:", v45, v76);

                      v75 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RestoreRTKitOS,%u"), CFSTR("%u"), 0, v10);
                      if (objc_msgSend(v26, "BOOLValue")
                        && objc_msgSend(v83, "unsignedCharValue"))
                      {
                        v109[0] = CFSTR("Digest");
                        v109[1] = CFSTR("EPRO");
                        v110[0] = v85;
                        v110[1] = MEMORY[0x24BDBD1C0];
                        v109[2] = CFSTR("DPRO");
                        v109[3] = CFSTR("ESEC");
                        v110[2] = MEMORY[0x24BDBD1C8];
                        v110[3] = MEMORY[0x24BDBD1C8];
                        v109[4] = CFSTR("Trusted");
                        v110[4] = MEMORY[0x24BDBD1C0];
                        v46 = (void *)MEMORY[0x24BDBCE70];
                        v47 = v110;
                        v48 = v109;
                        v49 = 5;
                      }
                      else
                      {
                        v112[0] = v85;
                        v111[0] = CFSTR("Digest");
                        v111[1] = CFSTR("EPRO");
                        v50 = objc_msgSend(v83, "unsignedCharValue");
                        v51 = MEMORY[0x24BDBD1C8];
                        v52 = MEMORY[0x24BDBD1C0];
                        if (v50)
                          v53 = MEMORY[0x24BDBD1C8];
                        else
                          v53 = MEMORY[0x24BDBD1C0];
                        v112[1] = v53;
                        v111[2] = CFSTR("ESEC");
                        if (objc_msgSend(v25, "unsignedCharValue"))
                          v54 = v51;
                        else
                          v54 = v52;
                        v112[2] = v54;
                        v111[3] = CFSTR("Trusted");
                        if (objc_msgSend(v77, "BOOLValue"))
                          v55 = v51;
                        else
                          v55 = v52;
                        v26 = v30;
                        v112[3] = v55;
                        v46 = (void *)MEMORY[0x24BDBCE70];
                        v47 = v112;
                        v48 = v111;
                        v49 = 4;
                      }
                      v56 = (id)objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, v49);
                      v23 = v74;
                      objc_msgSend(v98, "setObject:forKeyedSubscript:", v56, v75);

                      if (v95->_cphyData)
                      {
                        v57 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Timer,AppleTypeCPhyFirmware,%u"), v10);
                        if (objc_msgSend(v26, "BOOLValue")
                          && objc_msgSend(v83, "unsignedCharValue"))
                        {
                          v105[0] = CFSTR("Digest");
                          v105[1] = CFSTR("EPRO");
                          v106[0] = v84;
                          v106[1] = MEMORY[0x24BDBD1C0];
                          v105[2] = CFSTR("DPRO");
                          v105[3] = CFSTR("ESEC");
                          v106[2] = MEMORY[0x24BDBD1C8];
                          v106[3] = MEMORY[0x24BDBD1C8];
                          v105[4] = CFSTR("Trusted");
                          v106[4] = MEMORY[0x24BDBD1C0];
                          v58 = (void *)MEMORY[0x24BDBCE70];
                          v59 = v106;
                          v60 = v105;
                          v61 = 5;
                        }
                        else
                        {
                          v108[0] = v84;
                          v107[0] = CFSTR("Digest");
                          v107[1] = CFSTR("EPRO");
                          v62 = objc_msgSend(v83, "unsignedCharValue");
                          v63 = MEMORY[0x24BDBD1C8];
                          v64 = MEMORY[0x24BDBD1C0];
                          if (v62)
                            v65 = MEMORY[0x24BDBD1C8];
                          else
                            v65 = MEMORY[0x24BDBD1C0];
                          v108[1] = v65;
                          v107[2] = CFSTR("ESEC");
                          if (objc_msgSend(v25, "unsignedCharValue"))
                            v66 = v63;
                          else
                            v66 = v64;
                          v108[2] = v66;
                          v107[3] = CFSTR("Trusted");
                          if (objc_msgSend(v77, "BOOLValue"))
                            v67 = v63;
                          else
                            v67 = v64;
                          v26 = v30;
                          v23 = v74;
                          v108[3] = v67;
                          v58 = (void *)MEMORY[0x24BDBCE70];
                          v59 = v108;
                          v60 = v107;
                          v61 = 4;
                        }
                        v68 = (id)objc_msgSend(v58, "dictionaryWithObjects:forKeys:count:", v59, v60, v61);
                        objc_msgSend(v98, "setObject:forKeyedSubscript:", v68, v57);

                      }
                      v35 = 0;
                      v2 = v95;
                      v36 = v100;
                    }

                  }
                  else
                  {
                    v2 = v95;
                    -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate security mode for tag %u"), v10);
                    v35 = 1;
                    v29 = v99;
                    v36 = v100;
                  }
                  v13 = v94;
                  v37 = v93;
                  v38 = v87;

                }
                else
                {
                  v2 = v95;
                  -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate security domain for tag %u"), v10);
                  v35 = 1;
                  v29 = v99;
                  v36 = v100;
                  v37 = v93;
                  v13 = v94;
                  v38 = v87;
                }

              }
              else
              {
                v2 = v95;
                -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate production status for tag %u"), v10);
                v35 = 1;
                v29 = v99;
                v36 = v100;
                v37 = v93;
                v13 = v94;
                v38 = v87;
                v14 = v88;
              }

            }
            else
            {
              v2 = v95;
              -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate nonce for tag %u"), v10);
              v35 = 1;
              v29 = v99;
              v36 = v100;
              v37 = v93;
              v13 = v94;
              v38 = v87;
              v14 = v88;
            }

          }
          else
          {
            v2 = v95;
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate ECID for tag %u"), v10);
            v35 = 1;
            v29 = v99;
            v36 = v100;
            v37 = v93;
            v13 = v94;
          }

        }
        else
        {
          v2 = v95;
          -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate board ID for tag %u"), v10);
          v35 = 1;
          v29 = v99;
          v36 = v100;
          v37 = v93;
        }

      }
      else
      {
        v2 = v95;
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", CFSTR("Unable to locate board ID for tag %u"), v10);
        v35 = 1;
        v29 = v99;
        v36 = v100;
      }

      if (v35)
        goto LABEL_94;
      ++v7;
      v6 = v98;
      if (v96 == v7)
      {
        v4 = v85;
        v3 = v86;
        v5 = v84;
        v96 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
        if (v96)
          goto LABEL_6;
        goto LABEL_88;
      }
    }
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](v2, "log:", CFSTR("Unable to locate tag number in device info"));
LABEL_93:

LABEL_94:
    v71 = 0;
    v4 = v85;
    v3 = v86;
    v5 = v84;
    v6 = v98;
    goto LABEL_95;
  }
LABEL_88:

  if (v2->_apParameters)
    objc_msgSend(v6, "addEntriesFromDictionary:");
  v69 = (NSDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  requestDictionary = v2->_requestDictionary;
  v2->_requestDictionary = v69;

  -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](v2, "verboseLog:", CFSTR("ATCRT request dictionary = %@"), v2->_requestDictionary);
  v71 = 1;
LABEL_95:

  return v71;
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_apParameters, 0);
  objc_storeStrong((id *)&self->_deviceInfoArray, 0);
  objc_storeStrong((id *)&self->_cphyData, 0);
  objc_storeStrong((id *)&self->_rrkoData, 0);
  objc_storeStrong((id *)&self->_rkosData, 0);
}

@end
