@implementation AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy

- (AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *v9;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *v10;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperBackDeploy initWithOptions:logFunction:logContext:](&v13, "initWithOptions:logFunction:logContext:", v8, a4, a5);
  v10 = v9;
  if (!v9
    || -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy parseOptions:](v9, "parseOptions:", v8)
    && -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy generateRequestDictionary](v10, "generateRequestDictionary"))
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
  uint64_t v6;
  FTABFileBackDeploy *v7;
  FTABFileBackDeploy *v8;
  id v9;
  void *v10;
  NSData *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSData *v19;
  void *v20;
  BOOL v21;
  UARPSuperBinaryBackDeploy *v22;
  UARPSuperBinaryBackDeploy *v23;
  UARPAssetTagBackDeploy *v24;
  id v25;
  void *v26;
  NSData *v27;
  void *v28;
  UARPAssetTagBackDeploy *v29;
  id v30;
  FTABFileBackDeploy *v31;
  id v32;
  FTABFileBackDeploy *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  NSData *v39;
  void *v40;
  const __CFString *v41;
  int v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSData *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSArray *v50;
  void *v51;
  const __CFString *v52;
  id v54;
  UARPAssetTagBackDeploy *v55;

  v4 = a3;
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
  v6 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = -[FTABFileBackDeploy initWithData:]([FTABFileBackDeploy alloc], "initWithData:", v5);
    v8 = v7;
    if (v7)
    {
      v9 = -[FTABFileBackDeploy subfileWithTag:](v7, "subfileWithTag:", CFSTR("rrko"));
      if (v9)
      {
        v10 = v9;
        v11 = (NSData *)objc_msgSend(v9, "data");
        v12 = *(NSData **)((char *)&self->_rkosData + 1);
        *(NSData **)((char *)&self->_rkosData + 1) = v11;

        v13 = -[FTABFileBackDeploy subfileWithTag:](v8, "subfileWithTag:", CFSTR("rkos"));
        if (v13)
        {
          v14 = v13;
          v15 = objc_msgSend(v13, "data");
          v16 = *(void **)(&self->super._verbose + 1);
          *(_QWORD *)(&self->super._verbose + 1) = v15;

          v17 = -[FTABFileBackDeploy subfileWithTag:](v8, "subfileWithTag:", CFSTR("cphy"));
          v18 = v17;
          if (v17)
          {
            v19 = (NSData *)objc_msgSend(v17, "data");
            v20 = *(NSData **)((char *)&self->_rrkoData + 1);
            *(NSData **)((char *)&self->_rrkoData + 1) = v19;

          }
          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("No cphy data found"));
          }

          goto LABEL_32;
        }
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to locate rkos file in ftab"));

        goto LABEL_31;
      }
      v41 = CFSTR("Failed to locate rrko file in ftab");
    }
    else
    {
      v22 = -[UARPSuperBinaryBackDeploy initWithData:delegate:delegateQueue:]([UARPSuperBinaryBackDeploy alloc], "initWithData:delegate:delegateQueue:", v5, 0, 0);
      if (v22)
      {
        v23 = v22;
        v24 = -[UARPAssetTagBackDeploy initWithString:]([UARPAssetTagBackDeploy alloc], "initWithString:", CFSTR("RRKO"));
        v25 = -[UARPSuperBinaryBackDeploy payloadWith4ccTag:](v23, "payloadWith4ccTag:", v24);
        v26 = v25;
        if (v25)
        {
          v27 = (NSData *)objc_msgSend(v25, "payloadData");
          v28 = *(NSData **)((char *)&self->_rkosData + 1);
          *(NSData **)((char *)&self->_rkosData + 1) = v27;

          v29 = -[UARPAssetTagBackDeploy initWithString:]([UARPAssetTagBackDeploy alloc], "initWithString:", CFSTR("FIRM"));
          v30 = -[UARPSuperBinaryBackDeploy payloadWith4ccTag:](v23, "payloadWith4ccTag:", v29);
          if (v30)
          {
            v55 = v29;
            v31 = [FTABFileBackDeploy alloc];
            v32 = objc_msgSend(v30, "payloadData");
            v33 = -[FTABFileBackDeploy initWithData:](v31, "initWithData:", v32);

            if (v33)
            {
              v34 = -[FTABFileBackDeploy subfileWithTag:](v33, "subfileWithTag:", CFSTR("rkos"));
              if (v34)
              {
                v54 = v34;
                v35 = objc_msgSend(v34, "data");
                v36 = *(void **)(&self->super._verbose + 1);
                *(_QWORD *)(&self->super._verbose + 1) = v35;

                v37 = -[FTABFileBackDeploy subfileWithTag:](v33, "subfileWithTag:", CFSTR("cphy"));
                v38 = v37;
                if (v37)
                {
                  v39 = (NSData *)objc_msgSend(v37, "data");
                  v40 = *(NSData **)((char *)&self->_rrkoData + 1);
                  *(NSData **)((char *)&self->_rrkoData + 1) = v39;

                }
                else
                {
                  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("No cphy data found"));
                }

                v42 = 0;
                v43 = v54;
              }
              else
              {
                -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to locate rkos file in super binary ftab"));
                v43 = 0;
                v42 = 1;
              }

            }
            else
            {
              -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to parse FTAB in super binary"));
              v42 = 1;
            }

            v29 = v55;
          }
          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to locate FTAB in super binary"));
            v42 = 1;
          }

        }
        else
        {
          -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to locate rrko file in super binary"));
          v42 = 1;
        }

        if (!v42)
        {
LABEL_32:
          v44 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo"));
          v45 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
          {
            v46 = (NSData *)objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("InfoArray"));
            v47 = *(NSData **)((char *)&self->_cphyData + 1);
            *(NSData **)((char *)&self->_cphyData + 1) = v46;

            v48 = *(uint64_t *)((char *)&self->_cphyData + 1);
            v49 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
            {
              v50 = (NSArray *)objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("APInfo"));
              v51 = *(NSArray **)((char *)&self->_deviceInfoArray + 1);
              *(NSArray **)((char *)&self->_deviceInfoArray + 1) = v50;

              v21 = 1;
LABEL_38:

              goto LABEL_39;
            }
            v52 = CFSTR("Failed to locate device info array");
          }
          else
          {
            v52 = CFSTR("Failed to locate device info");
          }
          -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", v52);
          v21 = 0;
          goto LABEL_38;
        }
LABEL_31:
        v21 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v41 = CFSTR("Failed to parse firmware data");
    }
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", v41);
    goto LABEL_31;
  }
  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Unable to locate firmware data"));
  v21 = 0;
LABEL_40:

  return v21;
}

- (id)generateHashForData:(id)a3
{
  id v3;
  id v4;
  id v5;
  CC_LONG v6;
  CC_SHA512_CTX v8;
  unsigned __int8 md[48];

  memset(&v8, 0, sizeof(v8));
  v3 = a3;
  CC_SHA384_Init(&v8);
  v4 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v4, "bytes", *(_OWORD *)v8.count, *(_OWORD *)v8.hash, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[4], *(_OWORD *)&v8.hash[6], *(_OWORD *)v8.wbuf, *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[4], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[8], *(_OWORD *)&v8.wbuf[10], *(_OWORD *)&v8.wbuf[12], *(_OWORD *)&v8.wbuf[14]);
  v6 = objc_msgSend(v4, "length");

  CC_SHA384_Update(&v8, v5, v6);
  CC_SHA384_Final(md, &v8);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 48);
}

- (BOOL)generateRequestDictionary
{
  AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSString *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSString *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  int v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  NSDictionary *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSDictionary *v60;
  NSString *v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  NSDictionary *v68;
  NSDictionary *v69;
  void *v70;
  BOOL v71;
  NSString *v73;
  NSString *v74;
  id v75;
  id v76;
  NSString *v77;
  id v78;
  NSString *v79;
  NSString *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  NSString *v85;
  id v86;
  id v87;
  id v88;
  NSString *v89;
  id obj;
  NSString *v91;
  id v92;
  AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy *v93;
  id v94;
  uint64_t v95;
  void *v96;
  id v97;
  NSString *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[4];
  _QWORD v114[4];
  _BYTE v115[128];

  v2 = self;
  v3 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy generateHashForData:](self, "generateHashForData:", *(_QWORD *)(&self->super._verbose + 1));
  v4 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy generateHashForData:](v2, "generateHashForData:", *(NSData **)((char *)&v2->_rkosData + 1));
  if (*(NSData **)((char *)&v2->_rrkoData + 1))
    v5 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorBackDeploy generateHashForData:](v2, "generateHashForData:");
  else
    v5 = 0;
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = *(id *)((char *)&v2->_cphyData + 1);
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
  if (v94)
  {
    v95 = *(_QWORD *)v100;
    v7 = &AMFDRRegisterModuleChallengeCallback_ptr;
    v96 = v6;
    v83 = v4;
    v84 = v3;
    v82 = v5;
    v93 = v2;
LABEL_6:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v100 != v95)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v8);
      v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TagNumber"));
      v11 = objc_opt_class(v7[140]);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
        break;
      v12 = objc_msgSend(v10, "unsignedCharValue");
      v13 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HardwareID"));
      v14 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
      {
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate hardware ID data"));

        goto LABEL_93;
      }
      v97 = v10;
      v98 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("@Timer%u,Ticket"), CFSTR("%u"), 0, v12);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
      v15 = v6;
      v16 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BoardID"));
      v17 = objc_opt_class(v7[140]);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v91 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,BoardID,%u"), CFSTR("%u"), 0, v12);
        v92 = v16;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16);
        v18 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ChipID"));
        v19 = objc_opt_class(v7[140]);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        {
          v20 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ChipID,%u"), CFSTR("%u"), 0, v12);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, v20);
          v21 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ECID"));
          v22 = v7[140];
          v23 = v21;
          v24 = objc_opt_class(v22);
          v88 = v23;
          v89 = v20;
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          {
            v86 = v18;
            v85 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ECID,%u"), CFSTR("%u"), 0, v12);
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23);
            v25 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Nonce"));
            v26 = objc_opt_class(NSData);
            v87 = v25;
            if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
            {
              v80 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,Nonce,%u"), CFSTR("%u"), 0, v12);
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v25);
              v27 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ProductionStatus"));
              v28 = objc_opt_class(NSNumber);
              v81 = v27;
              if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
              {
                v29 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,ProductionMode,%u"), CFSTR("%u"), 0, v12);
                if (objc_msgSend(v27, "unsignedCharValue"))
                  v30 = &__kCFBooleanTrue;
                else
                  v30 = &__kCFBooleanFalse;
                v79 = v29;
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, v29);
                v31 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SecurityDomain"));
                v32 = objc_opt_class(NSNumber);
                v18 = v86;
                v78 = v31;
                if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
                {
                  v77 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityDomain,%u"), CFSTR("%u"), 0, v12);
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v31);
                  v33 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SecurityMode"));
                  v34 = objc_opt_class(NSNumber);
                  v76 = v33;
                  if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
                  {
                    v35 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,SecurityMode,%u"), CFSTR("%u"), 0, v12);
                    if (objc_msgSend(v33, "unsignedCharValue"))
                      v36 = &__kCFBooleanTrue;
                    else
                      v36 = &__kCFBooleanFalse;
                    objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, v35);
                    v37 = v33;
                    v38 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Demote"));
                    if (v38
                      && (v39 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v38, v39) & 1) == 0))
                    {
                      v2 = v93;
                      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Invalid demote setting for tag %u"), v12);
                      v46 = 1;
                      v42 = v97;
                      v47 = v98;
                    }
                    else
                    {
                      v40 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Trusted"));
                      v41 = objc_opt_class(NSNumber);
                      v75 = &__kCFBooleanTrue;
                      v42 = v97;
                      if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
                        v75 = v40;
                      v74 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RTKitOS,%u"), CFSTR("%u"), 0, v12);
                      if (objc_msgSend(v38, "BOOLValue")
                        && objc_msgSend(v81, "unsignedCharValue"))
                      {
                        v111[0] = CFSTR("Digest");
                        v111[1] = CFSTR("EPRO");
                        v112[0] = v84;
                        v112[1] = &__kCFBooleanFalse;
                        v111[2] = CFSTR("DPRO");
                        v111[3] = CFSTR("ESEC");
                        v112[2] = &__kCFBooleanTrue;
                        v112[3] = &__kCFBooleanTrue;
                        v111[4] = CFSTR("Trusted");
                        v112[4] = &__kCFBooleanFalse;
                        v43 = v112;
                        v44 = v111;
                        v45 = 5;
                      }
                      else
                      {
                        v114[0] = v84;
                        v113[0] = CFSTR("Digest");
                        v113[1] = CFSTR("EPRO");
                        if (objc_msgSend(v81, "unsignedCharValue"))
                          v50 = &__kCFBooleanTrue;
                        else
                          v50 = &__kCFBooleanFalse;
                        v114[1] = v50;
                        v113[2] = CFSTR("ESEC");
                        if (objc_msgSend(v37, "unsignedCharValue"))
                          v51 = &__kCFBooleanTrue;
                        else
                          v51 = &__kCFBooleanFalse;
                        v114[2] = v51;
                        v113[3] = CFSTR("Trusted");
                        if (objc_msgSend(v75, "BOOLValue"))
                          v52 = &__kCFBooleanTrue;
                        else
                          v52 = &__kCFBooleanFalse;
                        v114[3] = v52;
                        v43 = v114;
                        v44 = v113;
                        v45 = 4;
                      }
                      v53 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v44, v45);
                      objc_msgSend(v96, "setObject:forKeyedSubscript:", v53, v74);

                      v73 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", CFSTR("Timer,RestoreRTKitOS,%u"), CFSTR("%u"), 0, v12);
                      if (objc_msgSend(v38, "BOOLValue")
                        && objc_msgSend(v81, "unsignedCharValue"))
                      {
                        v107[0] = CFSTR("Digest");
                        v107[1] = CFSTR("EPRO");
                        v108[0] = v83;
                        v108[1] = &__kCFBooleanFalse;
                        v107[2] = CFSTR("DPRO");
                        v107[3] = CFSTR("ESEC");
                        v108[2] = &__kCFBooleanTrue;
                        v108[3] = &__kCFBooleanTrue;
                        v107[4] = CFSTR("Trusted");
                        v108[4] = &__kCFBooleanFalse;
                        v54 = v108;
                        v55 = v107;
                        v56 = 5;
                      }
                      else
                      {
                        v110[0] = v83;
                        v109[0] = CFSTR("Digest");
                        v109[1] = CFSTR("EPRO");
                        if (objc_msgSend(v81, "unsignedCharValue"))
                          v57 = &__kCFBooleanTrue;
                        else
                          v57 = &__kCFBooleanFalse;
                        v110[1] = v57;
                        v109[2] = CFSTR("ESEC");
                        if (objc_msgSend(v37, "unsignedCharValue"))
                          v58 = &__kCFBooleanTrue;
                        else
                          v58 = &__kCFBooleanFalse;
                        v110[2] = v58;
                        v109[3] = CFSTR("Trusted");
                        if (objc_msgSend(v75, "BOOLValue"))
                          v59 = &__kCFBooleanTrue;
                        else
                          v59 = &__kCFBooleanFalse;
                        v110[3] = v59;
                        v54 = v110;
                        v55 = v109;
                        v56 = 4;
                      }
                      v60 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v55, v56);
                      objc_msgSend(v96, "setObject:forKeyedSubscript:", v60, v73);

                      if (*(NSData **)((char *)&v93->_rrkoData + 1))
                      {
                        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timer,AppleTypeCPhyFirmware,%u"), v12);
                        if (objc_msgSend(v38, "BOOLValue")
                          && objc_msgSend(v81, "unsignedCharValue"))
                        {
                          v103[0] = CFSTR("Digest");
                          v103[1] = CFSTR("EPRO");
                          v104[0] = v82;
                          v104[1] = &__kCFBooleanFalse;
                          v103[2] = CFSTR("DPRO");
                          v103[3] = CFSTR("ESEC");
                          v104[2] = &__kCFBooleanTrue;
                          v104[3] = &__kCFBooleanTrue;
                          v103[4] = CFSTR("Trusted");
                          v104[4] = &__kCFBooleanFalse;
                          v62 = v104;
                          v63 = v103;
                          v64 = 5;
                        }
                        else
                        {
                          v106[0] = v82;
                          v105[0] = CFSTR("Digest");
                          v105[1] = CFSTR("EPRO");
                          if (objc_msgSend(v81, "unsignedCharValue"))
                            v65 = &__kCFBooleanTrue;
                          else
                            v65 = &__kCFBooleanFalse;
                          v106[1] = v65;
                          v105[2] = CFSTR("ESEC");
                          if (objc_msgSend(v37, "unsignedCharValue"))
                            v66 = &__kCFBooleanTrue;
                          else
                            v66 = &__kCFBooleanFalse;
                          v106[2] = v66;
                          v105[3] = CFSTR("Trusted");
                          if (objc_msgSend(v75, "BOOLValue"))
                            v67 = &__kCFBooleanTrue;
                          else
                            v67 = &__kCFBooleanFalse;
                          v106[3] = v67;
                          v62 = v106;
                          v63 = v105;
                          v64 = 4;
                        }
                        v68 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v63, v64);
                        objc_msgSend(v96, "setObject:forKeyedSubscript:", v68, v61);

                      }
                      v46 = 0;
                      v2 = v93;
                      v47 = v98;
                    }

                  }
                  else
                  {
                    v2 = v93;
                    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate security mode for tag %u"), v12);
                    v46 = 1;
                    v42 = v97;
                    v47 = v98;
                  }
                  v16 = v92;
                  v48 = v91;
                  v49 = v85;

                }
                else
                {
                  v2 = v93;
                  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate security domain for tag %u"), v12);
                  v46 = 1;
                  v42 = v97;
                  v47 = v98;
                  v48 = v91;
                  v16 = v92;
                  v49 = v85;
                }

              }
              else
              {
                v2 = v93;
                -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate production status for tag %u"), v12);
                v46 = 1;
                v42 = v97;
                v47 = v98;
                v48 = v91;
                v16 = v92;
                v49 = v85;
                v18 = v86;
              }

            }
            else
            {
              v2 = v93;
              -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate nonce for tag %u"), v12);
              v46 = 1;
              v42 = v97;
              v47 = v98;
              v48 = v91;
              v16 = v92;
              v49 = v85;
              v18 = v86;
            }

          }
          else
          {
            v2 = v93;
            -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate ECID for tag %u"), v12);
            v46 = 1;
            v42 = v97;
            v47 = v98;
            v48 = v91;
            v16 = v92;
          }

        }
        else
        {
          v2 = v93;
          -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate board ID for tag %u"), v12);
          v46 = 1;
          v42 = v97;
          v47 = v98;
          v48 = v91;
        }

      }
      else
      {
        v2 = v93;
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v93, "log:", CFSTR("Unable to locate board ID for tag %u"), v12);
        v46 = 1;
        v42 = v97;
        v47 = v98;
      }

      if (v46)
        goto LABEL_94;
      v8 = (char *)v8 + 1;
      v6 = v96;
      v7 = &AMFDRRegisterModuleChallengeCallback_ptr;
      if (v94 == v8)
      {
        v4 = v83;
        v3 = v84;
        v5 = v82;
        v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
        if (v94)
          goto LABEL_6;
        goto LABEL_88;
      }
    }
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](v2, "log:", CFSTR("Unable to locate tag number in device info"));
LABEL_93:

LABEL_94:
    v71 = 0;
    v4 = v83;
    v3 = v84;
    v5 = v82;
    v6 = v96;
    goto LABEL_95;
  }
LABEL_88:

  if (*(NSArray **)((char *)&v2->_deviceInfoArray + 1))
    objc_msgSend(v6, "addEntriesFromDictionary:");
  v69 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v6);
  v70 = *(NSDictionary **)((char *)&v2->_apParameters + 1);
  *(NSDictionary **)((char *)&v2->_apParameters + 1) = v69;

  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy verboseLog:](v2, "verboseLog:", CFSTR("ATCRT request dictionary = %@"), *(NSDictionary **)((char *)&v2->_apParameters + 1));
  v71 = 1;
LABEL_95:

  return v71;
}

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 65, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_apParameters + 1), 0);
  objc_storeStrong((id *)((char *)&self->_deviceInfoArray + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cphyData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rrkoData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rkosData + 1), 0);
  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
