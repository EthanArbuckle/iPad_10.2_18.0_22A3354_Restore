@implementation UARPSuperBinaryBackDeploy

- (UARPSuperBinaryBackDeploy)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPSuperBinaryBackDeploy *v11;
  UARPSuperBinaryBackDeploy *v12;
  NSData *v13;
  NSData *data;
  NSMutableArray *v15;
  NSMutableArray *tlvs;
  NSMutableArray *v17;
  NSMutableArray *trimmedTlvs;
  NSMutableArray *v19;
  NSMutableArray *measurements;
  UARPSuperBinaryBackDeploy *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UARPSuperBinaryBackDeploy;
  v11 = -[UARPSuperBinaryBackDeploy init](&v23, "init");
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  if (!v8)
    goto LABEL_5;
  objc_storeWeak((id *)&v11->_delegate, v9);
  objc_storeStrong((id *)&v12->_delegateQueue, a5);
  v13 = (NSData *)objc_msgSend(v8, "copy");
  data = v12->_data;
  v12->_data = v13;

  v15 = objc_opt_new(NSMutableArray);
  tlvs = v12->_tlvs;
  v12->_tlvs = v15;

  v17 = objc_opt_new(NSMutableArray);
  trimmedTlvs = v12->_trimmedTlvs;
  v12->_trimmedTlvs = v17;

  v19 = objc_opt_new(NSMutableArray);
  measurements = v12->_measurements;
  v12->_measurements = v19;

  v12->_totalLength = -[NSData length](v12->_data, "length");
  if (-[UARPSuperBinaryBackDeploy expandSuperBinary](v12, "expandSuperBinary"))
LABEL_4:
    v21 = v12;
  else
LABEL_5:
    v21 = 0;

  return v21;
}

- (UARPSuperBinaryBackDeploy)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSData *v11;
  UARPSuperBinaryBackDeploy *v12;

  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(a3, "stringByExpandingTildeInPath");
  v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v10);
  v12 = -[UARPSuperBinaryBackDeploy initWithData:delegate:delegateQueue:](self, "initWithData:delegate:delegateQueue:", v11, v9, v8);

  return v12;
}

- (UARPSuperBinaryBackDeploy)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  NSData *v10;
  UARPSuperBinaryBackDeploy *v11;

  v8 = a5;
  v9 = a4;
  v10 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a3);
  v11 = -[UARPSuperBinaryBackDeploy initWithData:delegate:delegateQueue:](self, "initWithData:delegate:delegateQueue:", v10, v9, v8);

  return v11;
}

- (BOOL)expandSuperBinary
{
  NSMutableArray *v3;
  NSMutableArray *payloads;
  NSData *data;
  unint64_t v6;
  UARPAssetVersionBackDeploy *v7;
  UARPAssetVersionBackDeploy *v8;
  UARPAssetVersionBackDeploy *version;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[3];

  v3 = objc_opt_new(NSMutableArray);
  payloads = self->_payloads;
  self->_payloads = v3;

  data = self->_data;
  if (!data)
    return 0;
  if (-[NSData length](data, "length") < 0x2C)
    return 0;
  memset(v17, 0, 44);
  -[NSData getBytes:range:](self->_data, "getBytes:range:", v17, 0, 44);
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v17, v17);
  v6 = DWORD2(v17[0]);
  if (-[NSData length](self->_data, "length") < v6)
    return 0;
  self->_formatVersion = v17[0];
  v7 = [UARPAssetVersionBackDeploy alloc];
  v8 = -[UARPAssetVersionBackDeploy initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](v7, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", HIDWORD(v17[0]), LODWORD(v17[1]), DWORD1(v17[1]), DWORD2(v17[1]));
  version = self->_version;
  self->_version = v8;

  if (!-[UARPSuperBinaryBackDeploy expandMetaData:](self, "expandMetaData:", v17))
    return 0;
  v10 = DWORD1(v17[2]);
  v11 = DWORD2(v17[2]);
  do
  {
    v12 = v11 >= 0x28;
    v11 -= 40;
    v13 = !v12;
    if (!v12)
      break;
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    -[NSData getBytes:range:](self->_data, "getBytes:range:", v15, v10, 40);
    uarpPayloadHeaderEndianSwap((unsigned int *)v15, v15);
    v10 += 40;
  }
  while (-[UARPSuperBinaryBackDeploy preparePayload:](self, "preparePayload:", v15));
  return v13;
}

- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3
{
  unsigned int var5;
  unint64_t v6;
  NSData *v8;
  NSData *metaData;

  var5 = a3->var5;
  if (!var5)
    return 1;
  v6 = a3->var4 + var5;
  if (-[NSData length](self->_data, "length") < v6)
    return 0;
  v8 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var4, a3->var5);
  metaData = self->_metaData;
  self->_metaData = v8;

  return -[UARPSuperBinaryBackDeploy expandTLVs](self, "expandTLVs");
}

- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3
{
  UARPAssetTagBackDeploy *v5;
  UARPAssetVersionBackDeploy *v6;
  unint64_t v7;
  BOOL v8;
  NSData *v9;
  unint64_t v10;
  NSData *v11;
  UARPSuperBinaryPayloadBackDeploy *v12;
  UARPSuperBinaryPayloadBackDeploy *v13;

  v5 = -[UARPAssetTagBackDeploy initWithChar1:char2:char3:char4:]([UARPAssetTagBackDeploy alloc], "initWithChar1:char2:char3:char4:", (char)a3->var1.var0, (char)a3->var1.var1, (char)a3->var1.var2, (char)a3->var1.var3);
  v6 = -[UARPAssetVersionBackDeploy initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersionBackDeploy alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", a3->var2.var0, a3->var2.var1, a3->var2.var2, a3->var2.var3);
  v7 = a3->var4 + a3->var3;
  if (-[NSData length](self->_data, "length") >= v7)
  {
    if (a3->var4)
      v9 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var3);
    else
      v9 = 0;
    v10 = a3->var6 + a3->var5;
    if (-[NSData length](self->_data, "length") >= v10)
    {
      if (a3->var6)
        v11 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var5);
      else
        v11 = 0;
      v12 = -[UARPSuperBinaryPayloadBackDeploy initWithData:metaData:tag:version:]([UARPSuperBinaryPayloadBackDeploy alloc], "initWithData:metaData:tag:version:", v11, v9, v5, v6);
      v13 = v12;
      if (v12 && -[UARPSuperBinaryPayloadBackDeploy expandTLVs](v12, "expandTLVs"))
      {
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v13);
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)payloadWith4ccTag:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_payloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "tag", (_QWORD)v13);
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)payloadsWithout4ccTag:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  unsigned __int8 v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_payloads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "tag", (_QWORD)v16);
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) == 0)
          -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5);
  return v14;
}

- (id)getTlvs
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_tlvs);
}

- (id)personalizedMetaData
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *manifest;
  id v17;
  NSMutableData *v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  id v24;
  NSData *v25;
  UARPSuperBinaryBackDeploy *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  -[NSMutableArray removeAllObjects](self->_trimmedTlvs, "removeAllObjects");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(UARPTLVHostPersonalizationRequiredBackDeploy);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
        {
          v10 = objc_opt_class(UARPTLVPersonalizationManifestPrefixBackDeploy);
          if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
          {
            v11 = objc_opt_class(UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy);
            if ((objc_opt_isKindOfClass(v8, v11) & 1) == 0)
            {
              v12 = objc_opt_class(UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy);
              if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
              {
                v13 = objc_opt_class(UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy);
                if ((objc_opt_isKindOfClass(v8, v13) & 1) == 0)
                {
                  v14 = objc_opt_class(UARPTLVPersonalizationFTABPayloadBackDeploy);
                  if ((objc_opt_isKindOfClass(v8, v14) & 1) == 0)
                  {
                    v15 = objc_opt_class(UARPTLVRequiredPersonalizationOptionBackDeploy);
                    if ((objc_opt_isKindOfClass(v8, v15) & 1) == 0)
                      -[NSMutableArray addObject:](v27->_trimmedTlvs, "addObject:", v8);
                  }
                }
              }
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  manifest = v27->_manifest;
  if (manifest)
  {
    v17 = +[UARPMetaDataTLVBackDeploy tlvFromType:length:value:](UARPMetaDataTLVBackDeploy, "tlvFromType:length:value:", 2293403952, -[NSData length](manifest, "length"), -[NSData bytes](v27->_manifest, "bytes"));
    if (v17)
      -[NSMutableArray addObject:](v27->_trimmedTlvs, "addObject:", v17);

  }
  v18 = objc_opt_new(NSMutableData);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v27->_trimmedTlvs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), "generateTLV");
        -[NSMutableData appendData:](v18, "appendData:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  v25 = +[NSData dataWithData:](NSData, "dataWithData:", v18);
  return v25;
}

- (id)getPayloads
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_payloads);
}

- (BOOL)expandTLVs
{
  char *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = -[NSData bytes](self->_metaData, "bytes");
  if (-[NSData length](self->_metaData, "length"))
  {
    v4 = 0;
    do
    {
      if (v4 + 4 > -[NSData length](self->_metaData, "length"))
        break;
      v5 = uarpNtohl(*(_DWORD *)&v3[v4]);
      v6 = v4 + 8;
      if (v4 + 8 > -[NSData length](self->_metaData, "length"))
        break;
      v7 = uarpNtohl(*(_DWORD *)&v3[v4 + 4]);
      v4 = v6 + v7;
      if (v4 > -[NSData length](self->_metaData, "length"))
        break;
      v8 = +[UARPMetaDataTLVBackDeploy tlvFromType:length:value:](UARPMetaDataTLVBackDeploy, "tlvFromType:length:value:", v5, v7, &v3[v6]);
      if (!v8)
        break;
      v9 = v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);

    }
    while (v4 < -[NSData length](self->_metaData, "length"));
  }
  -[UARPSuperBinaryBackDeploy processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
}

- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a5;
  v22 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_payloads;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "needsHostPersonalization") & 1) != 0)
        {
          objc_msgSend(v13, "setBoardID:", self->_boardID);
          objc_msgSend(v13, "setChipID:", self->_chipID);
          objc_msgSend(v13, "setEcID:", self->_ecID);
          objc_msgSend(v13, "setNonce:", self->_nonce);
          objc_msgSend(v13, "setProductionMode:", self->_productionMode);
          objc_msgSend(v13, "setSecurityDomain:", self->_securityDomain);
          objc_msgSend(v13, "setSecurityMode:", self->_securityMode);
          objc_msgSend(v13, "setTrustedOverride:", self->_trustedOverride);
          objc_msgSend(v13, "setDemote:", self->_demote);
          -[UARPSuperBinaryBackDeploy log:](self, "log:", CFSTR("Personalizing %@"), v13);
          v14 = objc_msgSend(v13, "composeTSSRequest:", a3);
          if (!v14
            || (v15 = objc_msgSend(v13, "tag"),
                -[UARPSuperBinaryBackDeploy log:](self, "log:", CFSTR("TSS Request Options for payload %@"), v15),
                v15,
                v16 = objc_msgSend(v13, "tssRequest"),
                -[UARPSuperBinaryBackDeploy log:](self, "log:", CFSTR("%@"), v16),
                v16,
                !objc_msgSend(v13, "queryTatsuSigningServer:ssoOnly:error:", v22, v5, 0)))
          {

            v19 = 0;
            goto LABEL_18;
          }
        }
        else
        {
          v14 = objc_msgSend(v13, "tag");
          -[UARPSuperBinaryBackDeploy log:](self, "log:", CFSTR("Host Personalization not required for payload %@"), v14);
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (!-[UARPSuperBinaryBackDeploy needsHostPersonalization](self, "needsHostPersonalization")
    || (v17 = -[UARPSuperBinaryBackDeploy composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0), v18 = -[UARPSuperBinaryBackDeploy queryTatsuSigningServer:ssoOnly:error:](self, "queryTatsuSigningServer:ssoOnly:error:", v22, v5, 0), v19 = 0, v18))
  {
    v20 = (NSMutableArray *)-[UARPSuperBinaryBackDeploy generatePersonalizedSuperBinary](self, "generatePersonalizedSuperBinary");
    v8 = v20;
    if (v20)
    {
      v8 = v20;
      v19 = v8;
    }
    else
    {
      v19 = 0;
    }
LABEL_18:

  }
  return v19;
}

- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  NSURL *v7;
  NSMutableDictionary *tssRequest;
  id v9;
  void *v10;
  NSData *v11;
  NSData *manifest;

  v5 = a4;
  v7 = (NSURL *)a3;
  if (!v7)
    v7 = +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://gs.apple.com:443"));
  tssRequest = self->_tssRequest;
  if (v5)
    v9 = UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  else
    v9 = UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  v10 = v9;
  if (v9)
  {
    v11 = (NSData *)objc_msgSend(v9, "objectForKeyedSubscript:", self->_keyManifest);
    manifest = self->_manifest;
    self->_manifest = v11;

  }
  return v10 != 0;
}

- (id)generatePersonalizedSuperBinary
{
  return -[UARPSuperBinaryBackDeploy generatePersonalizedSuperBinaryInternal:](self, "generatePersonalizedSuperBinaryInternal:", self->_payloads);
}

- (id)generatePersonalizedSuperBinaryWithoutRRKO
{
  UARPAssetTagBackDeploy *v3;
  UARPAssetTagBackDeploy *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  UARPSuperBinaryBackDeploy *v16;
  NSMutableArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = -[UARPAssetTagBackDeploy initWithString:]([UARPAssetTagBackDeploy alloc], "initWithString:", CFSTR("RRKO"));
  v4 = -[UARPAssetTagBackDeploy initWithString:]([UARPAssetTagBackDeploy alloc], "initWithString:", CFSTR("rrko"));
  v16 = self;
  v17 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_payloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "tag", v16);
        if (objc_msgSend(v11, "isEqual:", v3))
        {

        }
        else
        {
          v12 = objc_msgSend(v10, "tag");
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) == 0)
            -[NSMutableArray addObject:](v17, "addObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v14 = -[UARPSuperBinaryBackDeploy generatePersonalizedSuperBinaryInternal:](v16, "generatePersonalizedSuperBinaryInternal:", v17);
  return v14;
}

- (id)generatePersonalizedSuperBinaryInternal:(id)a3
{
  id v4;
  NSMutableData *v5;
  NSMutableData *v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unint64_t v11;
  _DWORD *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int *v25;
  NSMutableData *v26;
  id v27;
  id v28;
  unsigned int v29;
  unint64_t v30;
  id v32;
  NSMutableData *v33;
  unsigned int v34[2];
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;

  v4 = a3;
  v5 = objc_opt_new(NSMutableData);
  v6 = objc_opt_new(NSMutableData);
  v33 = objc_opt_new(NSMutableData);
  v34[0] = self->_formatVersion;
  v34[1] = 44;
  v36 = -[UARPAssetVersionBackDeploy majorVersion](self->_version, "majorVersion");
  v37 = -[UARPAssetVersionBackDeploy minorVersion](self->_version, "minorVersion");
  v38 = -[UARPAssetVersionBackDeploy releaseVersion](self->_version, "releaseVersion");
  v39 = -[UARPAssetVersionBackDeploy buildVersion](self->_version, "buildVersion");
  v42 = 44;
  v43 = 40 * objc_msgSend(v4, "count");
  v7 = -[UARPSuperBinaryBackDeploy personalizedMetaData](self, "personalizedMetaData");
  v40 = v43 + 44;
  v8 = objc_msgSend(v7, "length");
  v9 = v43 + 44 + v8;
  v41 = v8;
  v35 = v9;
  v32 = v7;
  -[NSMutableData appendData:](v6, "appendData:", v7);
  v10 = (unsigned int *)calloc((size_t)objc_msgSend(v4, "count"), 0x28uLL);
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = v10 + 4;
    do
    {
      v13 = objc_msgSend(v4, "objectAtIndex:", v11);
      v14 = objc_msgSend(v13, "personalizedMetaData");
      *(v12 - 4) = 40;
      v15 = objc_msgSend(v13, "tag");
      *((_BYTE *)v12 - 12) = objc_msgSend(v15, "char1");

      v16 = objc_msgSend(v13, "tag");
      *((_BYTE *)v12 - 11) = objc_msgSend(v16, "char2");

      v17 = objc_msgSend(v13, "tag");
      *((_BYTE *)v12 - 10) = objc_msgSend(v17, "char3");

      v18 = objc_msgSend(v13, "tag");
      *((_BYTE *)v12 - 9) = objc_msgSend(v18, "char4");

      v19 = objc_msgSend(v13, "version");
      *(v12 - 2) = objc_msgSend(v19, "majorVersion");

      v20 = objc_msgSend(v13, "version");
      *(v12 - 1) = objc_msgSend(v20, "minorVersion");

      v21 = objc_msgSend(v13, "version");
      *v12 = objc_msgSend(v21, "releaseVersion");

      v22 = objc_msgSend(v13, "version");
      v12[1] = objc_msgSend(v22, "buildVersion");

      v12[2] = v9;
      v23 = objc_msgSend(v14, "length");
      v12[3] = v23;
      v9 += v23;
      -[NSMutableData appendData:](v6, "appendData:", v14);

      ++v11;
      v12 += 10;
    }
    while (v11 < (unint64_t)objc_msgSend(v4, "count"));
  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = 0;
    v25 = v10 + 9;
    v26 = v33;
    do
    {
      v27 = objc_msgSend(v4, "objectAtIndex:", v24);
      v28 = objc_msgSend(v27, "personalizedData");
      *(v25 - 1) = v9;
      v29 = objc_msgSend(v28, "length");
      *v25 = v29;
      v25 += 10;
      v9 += v29;
      -[NSMutableData appendData:](v33, "appendData:", v28);

      ++v24;
    }
    while (v24 < (unint64_t)objc_msgSend(v4, "count"));
  }
  else
  {
    v26 = v33;
  }
  v35 = v9;
  uarpSuperBinaryHeaderEndianSwap(v34, v34);
  -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v34, 44);
  if (objc_msgSend(v4, "count"))
  {
    v30 = 0;
    do
    {
      uarpPayloadHeaderEndianSwap(v10, v10);
      -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v10, 40);
      ++v30;
      v10 += 10;
    }
    while (v30 < (unint64_t)objc_msgSend(v4, "count"));
  }
  -[NSMutableData appendData:](v5, "appendData:", v6);
  -[NSMutableData appendData:](v5, "appendData:", v26);

  return v5;
}

- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *tatsuMeasurements;
  id v9;
  NSString *v10;
  id v11;
  NSURL *v12;
  unsigned __int8 v13;

  v6 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  tatsuMeasurements = self->_tatsuMeasurements;
  self->_tatsuMeasurements = v7;

  if (-[UARPSuperBinaryBackDeploy expandTLVs](self, "expandTLVs"))
    -[UARPSuperBinaryBackDeploy processTLVsForPersonalization](self, "processTLVsForPersonalization");
  if (self->_needsHostPersonalization)
    -[UARPSuperBinaryBackDeploy generateTatsuMeasurements:](self, "generateTatsuMeasurements:", a3);
  else
    -[UARPSuperBinaryBackDeploy generateTatsuMeasurementsPerPayload:](self, "generateTatsuMeasurementsPerPayload:", a3);
  v9 = objc_msgSend(v6, "lastPathComponent");
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.plist"), v9);

  v11 = objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v12 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v10, 0, v11);

  v13 = -[NSMutableDictionary writeToURL:error:](self->_tatsuMeasurements, "writeToURL:error:", v12, 0);
  return v13;
}

- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_payloads;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (a3)
        {
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
          v11 = 1;
          do
          {
            v12 = objc_msgSend(v10, "tatsuMeasurements:", v11, (_QWORD)v13);
            if (v12)
              -[NSMutableDictionary addEntriesFromDictionary:](self->_tatsuMeasurements, "addEntriesFromDictionary:", v12);

            ++v11;
          }
          while (v11 <= a3);
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)generateTatsuMeasurements:(unint64_t)a3
{
  NSData *manifest;
  NSMutableDictionary *v6;
  NSMutableDictionary *tssRequest;
  uint64_t v8;
  id v9;

  manifest = self->_manifest;
  self->_manifest = 0;

  v6 = objc_opt_new(NSMutableDictionary);
  tssRequest = self->_tssRequest;
  self->_tssRequest = v6;

  if (a3)
  {
    v8 = 0;
    do
    {
      v9 = -[UARPSuperBinaryBackDeploy tatsuMeasurements:](self, "tatsuMeasurements:", v8);
      if (v9)
        -[NSMutableDictionary addEntriesFromDictionary:](self->_tatsuMeasurements, "addEntriesFromDictionary:", v9);

      ++v8;
    }
    while (a3 != v8);
  }
}

- (void)processTLVsForPersonalization
{
  NSMutableArray *v3;
  id v4;
  id v5;
  void **p_vtable;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSString *v13;
  NSString *ticketPrefix;
  uint64_t v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    p_vtable = CRRIK.vtable;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(p_vtable + 387);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          self->_needsHostPersonalization = objc_msgSend(v9, "isRequired") != 0;
          goto LABEL_13;
        }
        v11 = objc_opt_class(UARPTLVPersonalizationManifestPrefixBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          v12 = v9;
          v13 = (NSString *)objc_msgSend(v12, "ticketPrefix");
          ticketPrefix = self->_ticketPrefix;
          self->_ticketPrefix = v13;
LABEL_12:

          v17 = v12;
          p_vtable = (void **)(CRRIK + 24);

          goto LABEL_13;
        }
        v15 = objc_opt_class(UARPTLVPersonalizationManifestSuffixBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
        {
          v12 = v9;
          v16 = (NSString *)objc_msgSend(v12, "manifestSuffix");
          ticketPrefix = self->_ticketSuffix;
          self->_ticketSuffix = v16;
          goto LABEL_12;
        }
        v21 = objc_opt_class(UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v21) & 1) != 0)
        {
          self->_ticketNeedsUnitNumber = objc_msgSend(v9, "ticketNeedsLogicalUnitNumber") != 0;
        }
        else
        {
          v22 = objc_opt_class(UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy);
          if ((objc_opt_isKindOfClass(v9, v22) & 1) != 0)
          {
            self->_prefixNeedsUnitNumber = objc_msgSend(v9, "prefixNeedsLogicalUnitNumber") != 0;
          }
          else
          {
            v23 = objc_opt_class(UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy);
            if ((objc_opt_isKindOfClass(v9, v23) & 1) != 0
              || (v24 = objc_opt_class(UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy),
                  (objc_opt_isKindOfClass(v9, v24) & 1) != 0)
              || (v25 = objc_opt_class(UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy),
                  (objc_opt_isKindOfClass(v9, v25) & 1) != 0))
            {
              self->_suffixNeedsUnitNumber = objc_msgSend(v9, "suffixNeedsLogicalUnitNumber", (_QWORD)v28) != 0;
            }
            else
            {
              v26 = objc_opt_class(UARPTLVPersonalizationFTABPayloadBackDeploy);
              if ((objc_opt_isKindOfClass(v9, v26) & 1) != 0)
                -[NSMutableArray addObject:](self->_measurements, "addObject:", v9, (_QWORD)v28);
            }
          }
        }
LABEL_13:
        v18 = objc_opt_class(UARPTLVPersonalizationLifeBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v18) & 1) != 0)
          self->_life = objc_msgSend(v9, "life");
        v19 = objc_opt_class(UARPTLVPersonalizationProvisioningBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v19) & 1) != 0)
          self->_provisioning = objc_msgSend(v9, "provisioning") != 0;
        v20 = objc_opt_class(UARPTLVPersonalizationManifestEpochBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
          self->_manifestEpoch = objc_msgSend(v9, "manifestEpoch");
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v5 = v27;
    }
    while (v27);
  }

}

- (id)tatsuMeasurements:(unint64_t)a3
{
  id v5;

  v5 = -[NSMutableArray count](self->_tlvs, "count");
  if (v5)
    v5 = -[UARPSuperBinaryBackDeploy composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1);
  return v5;
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  NSData *manifest;
  NSMutableDictionary *v7;
  NSMutableDictionary *tssRequest;
  id v9;
  NSMutableString *v10;
  NSMutableString *keyManifest;
  NSMutableString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  uint64_t v19;
  unsigned int v20;
  NSData *ecidData;
  NSNumber *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  NSNumber *v25;
  NSDictionary *v26;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v28 = a4;
  manifest = self->_manifest;
  self->_manifest = 0;

  v7 = objc_opt_new(NSMutableDictionary);
  tssRequest = self->_tssRequest;
  self->_tssRequest = v7;

  v9 = -[UARPSuperBinaryBackDeploy requiredTSSOptions](self, "requiredTSSOptions");
  v10 = objc_opt_new(NSMutableString);
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber)
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%lu"), a3);
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR(",Ticket"));
  v12 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v12, "appendFormat:", CFSTR("@%@"), self->_keyManifest);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v12);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "unsignedLongValue"))
        {
          case 4u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("BoardID"), a3);
            v19 = -[UARPSuperBinaryBackDeploy boardID](self, "boardID");
            goto LABEL_13;
          case 5u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ChipID"), a3);
            v19 = -[UARPSuperBinaryBackDeploy chipID](self, "chipID");
LABEL_13:
            v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v19);
            goto LABEL_28;
          case 7u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
            v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[UARPSuperBinaryBackDeploy ecID](self, "ecID"));
            goto LABEL_28;
          case 8u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityDomain"), a3);
            v23 = -[UARPSuperBinaryBackDeploy securityDomain](self, "securityDomain");
            goto LABEL_27;
          case 9u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityMode"), a3);
            v20 = -[UARPSuperBinaryBackDeploy securityMode](self, "securityMode");
            goto LABEL_17;
          case 0xAu:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ProductionMode"), a3);
            v20 = -[UARPSuperBinaryBackDeploy productionMode](self, "productionMode");
LABEL_17:
            if (v20)
              ecidData = (NSData *)&__kCFBooleanTrue;
            else
              ecidData = (NSData *)&__kCFBooleanFalse;
            goto LABEL_20;
          case 0x18u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Nonce"), a3);
            v22 = -[UARPSuperBinaryBackDeploy nonce](self, "nonce");
            goto LABEL_28;
          case 0x19u:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Life"), a3);
            v23 = -[UARPSuperBinaryBackDeploy life](self, "life");
            goto LABEL_27;
          case 0x1Au:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Provisioning"), a3);
            if (!-[UARPSuperBinaryBackDeploy provisioning](self, "provisioning"))
              goto LABEL_29;
            v24 = self->_tssRequest;
            ecidData = (NSData *)&__kCFBooleanTrue;
            goto LABEL_21;
          case 0x1Bu:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ManifestEpoch"), a3);
            v23 = -[UARPSuperBinaryBackDeploy manifestEpoch](self, "manifestEpoch");
LABEL_27:
            v22 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v23);
LABEL_28:
            v25 = v22;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v22, v18);

            goto LABEL_29;
          case 0x1Du:
            v18 = -[UARPSuperBinaryBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
            ecidData = self->_ecidData;
LABEL_20:
            v24 = self->_tssRequest;
LABEL_21:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", ecidData, v18);
LABEL_29:

            break;
          default:
            continue;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  -[UARPSuperBinaryBackDeploy processMeasurementsForTSSOptions:unitNumber:asMeasurement:](self, "processMeasurementsForTSSOptions:unitNumber:asMeasurement:", self->_tssRequest, a3, v28);
  v26 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", self->_tssRequest);

  return v26;
}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6;
  NSMutableString *v7;
  NSString *v8;

  v6 = a3;
  v7 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_prefixNeedsUnitNumber)
    -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("%lu"), a4);
  -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR(",%@"), v6);
  if (self->_suffixNeedsUnitNumber)
    -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR(",%lu"), a4);
  v8 = +[NSString stringWithString:](NSString, "stringWithString:", v7);

  return v8;
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  void *i;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSMutableString *v26;
  id v28;
  NSMutableArray *obj;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  UARPSuperBinaryBackDeploy *v37;
  NSMutableDictionary *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v28 = a3;
  v37 = self;
  v38 = objc_opt_new(NSMutableDictionary);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = self->_payloads;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(obj);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "measurements");
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v33 = v7;
        v35 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v35)
        {
          v32 = i;
          v8 = 0;
          v9 = 0;
          v34 = *(_QWORD *)v45;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v45 != v34)
                objc_enumerationMutation(v33);
              v36 = v10;
              v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v12 = objc_msgSend(v11, "tlvs");
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v14; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v41 != v15)
                      objc_enumerationMutation(v12);
                    v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
                    v18 = objc_opt_class(UARPTLVPersonalizationFTABSubfileLongnameBackDeploy);
                    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
                    {
                      v19 = v17;
                      v20 = objc_msgSend(v19, "longname");

                      v9 = v20;
                    }
                    else
                    {
                      v21 = objc_opt_class(UARPTLVPersonalizationFTABSubfileDigestBackDeploy);
                      if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0)
                      {
                        v22 = v17;
                        v23 = objc_msgSend(v22, "digest");

                        v8 = v23;
                      }
                      else
                      {
                        v24 = objc_opt_class(UARPTLVPersonalizationFTABSubfileEPROBackDeploy);
                        if ((objc_opt_isKindOfClass(v17, v24) & 1) != 0 && !a5)
                        {
                          if (-[UARPSuperBinaryBackDeploy productionMode](v37, "productionMode"))
                            v25 = &__kCFBooleanTrue;
                          else
                            v25 = &__kCFBooleanFalse;
                          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v25, CFSTR("EPRO"));
                        }
                      }
                    }
                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                }
                while (v14);
              }

              v10 = v36 + 1;
            }
            while ((id)(v36 + 1) != v35);
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v35);
          if (v9)
          {
            i = v32;
            if (v8)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v8, v9);
          }
          else
          {
            i = v32;
          }
        }
        else
        {
          v9 = 0;
          v8 = 0;
        }

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v31);
  }

  v26 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v26, "appendFormat:", CFSTR("%@"), v37->_ticketPrefix);
  if (v37->_prefixNeedsUnitNumber)
    -[NSMutableString appendFormat:](v26, "appendFormat:", CFSTR("%lu"), a4);
  -[NSMutableString appendFormat:](v26, "appendFormat:", CFSTR(",%@"), v37->_ticketSuffix);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v38, v26);

}

- (id)requiredTSSOptions
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_tlvs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(UARPTLVRequiredPersonalizationOptionBackDeploy);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          if (objc_msgSend(v11, "tssOption", (_QWORD)v15) == -2001563388)
          {
            v12 = 4;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563387)
          {
            v12 = 5;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563386)
          {
            v12 = 7;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563339)
          {
            v12 = 29;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563385)
          {
            v12 = 24;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563383)
          {
            v12 = 8;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563382)
          {
            v12 = 9;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563381)
          {
            v12 = 10;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563343)
          {
            v12 = 25;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563342)
          {
            v12 = 26;
            goto LABEL_29;
          }
          if (objc_msgSend(v11, "tssOption") == -2001563341)
          {
            v12 = 27;
LABEL_29:
            v13 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v12);
            -[NSMutableArray addObject:](v3, "addObject:", v13);

          }
          continue;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4
{
  NSData *v5;

  v5 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a4, a3);
  self->_totalBytesRequested += -[NSData length](v5, "length");
  return v5;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *delegateQueue;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:arguments:", v6, a4);

  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3254779904;
      v12[2] = sub_100021664;
      v12[3] = &unk_1000516B8;
      v12[4] = self;
      v13 = v7;
      dispatch_async(delegateQueue, v12);
      v10 = v13;
    }
    else
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "superbinary:logString:", self, v7);
      v10 = v11;
    }

  }
}

- (void)log:(id)a3
{
  uint64_t v3;

  -[UARPSuperBinaryBackDeploy logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)ecidData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEcidData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (unsigned)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(unsigned __int8)a3
{
  self->_productionMode = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned __int8)a3
{
  self->_securityDomain = a3;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(unsigned __int8)a3
{
  self->_securityMode = a3;
}

- (unsigned)life
{
  return self->_life;
}

- (void)setLife:(unsigned __int8)a3
{
  self->_life = a3;
}

- (BOOL)provisioning
{
  return self->_provisioning;
}

- (void)setProvisioning:(BOOL)a3
{
  self->_provisioning = a3;
}

- (unsigned)manifestEpoch
{
  return self->_manifestEpoch;
}

- (void)setManifestEpoch:(unsigned __int8)a3
{
  self->_manifestEpoch = a3;
}

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTrustedOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDemote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)payloads
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)layer2Context
{
  return self->_layer2Context;
}

- (void)setLayer2Context:(void *)a3
{
  self->_layer2Context = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalBytesRequested
{
  return self->_totalBytesRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)&self->_trustedOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecidData, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_ticketSuffix, 0);
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_tatsuMeasurements, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
