@implementation UARPSuperBinaryPayloadBackDeploy

- (UARPSuperBinaryPayloadBackDeploy)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UARPSuperBinaryPayloadBackDeploy *v14;
  UARPAssetTagBackDeploy *v15;
  UARPAssetTagBackDeploy *tag;
  UARPAssetVersionBackDeploy *v17;
  UARPAssetVersionBackDeploy *version;
  NSData *v19;
  NSData *payloadData;
  NSData *v21;
  NSData *metaData;
  NSMutableArray *v23;
  NSMutableArray *tlvs;
  NSMutableArray *v25;
  NSMutableArray *measurements;
  NSMutableDictionary *v27;
  NSMutableDictionary *tssRequest;
  NSMutableArray *v29;
  NSMutableArray *trimmedTlvs;
  NSMutableArray *v31;
  NSMutableArray *subfiles;
  FTABFileBackDeploy *v33;
  FTABFileBackDeploy *ftab;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)UARPSuperBinaryPayloadBackDeploy;
  v14 = -[UARPSuperBinaryPayloadBackDeploy init](&v36, "init");
  if (v14)
  {
    v15 = (UARPAssetTagBackDeploy *)objc_msgSend(v12, "copy");
    tag = v14->_tag;
    v14->_tag = v15;

    v17 = (UARPAssetVersionBackDeploy *)objc_msgSend(v13, "copy");
    version = v14->_version;
    v14->_version = v17;

    v19 = (NSData *)objc_msgSend(v10, "copy");
    payloadData = v14->_payloadData;
    v14->_payloadData = v19;

    v21 = (NSData *)objc_msgSend(v11, "copy");
    metaData = v14->_metaData;
    v14->_metaData = v21;

    v23 = objc_opt_new(NSMutableArray);
    tlvs = v14->_tlvs;
    v14->_tlvs = v23;

    v25 = objc_opt_new(NSMutableArray);
    measurements = v14->_measurements;
    v14->_measurements = v25;

    v27 = objc_opt_new(NSMutableDictionary);
    tssRequest = v14->_tssRequest;
    v14->_tssRequest = v27;

    v29 = objc_opt_new(NSMutableArray);
    trimmedTlvs = v14->_trimmedTlvs;
    v14->_trimmedTlvs = v29;

    v31 = objc_opt_new(NSMutableArray);
    subfiles = v14->_subfiles;
    v14->_subfiles = v31;

    v33 = -[FTABFileBackDeploy initWithData:]([FTABFileBackDeploy alloc], "initWithData:", v14->_payloadData);
    ftab = v14->_ftab;
    v14->_ftab = v33;

  }
  return v14;
}

- (id)getTlvs
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_tlvs);
}

- (id)getMeasurements
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_measurements);
}

- (id)personalizedData
{
  NSData *v3;

  if (self->_ftab)
  {
    if (-[NSMutableArray count](self->_subfiles, "count"))
      -[FTABFileBackDeploy addSubfiles:](self->_ftab, "addSubfiles:", self->_subfiles);
    if (self->_manifest)
      -[FTABFileBackDeploy setManifest:](self->_ftab, "setManifest:");
    v3 = (NSData *)-[FTABFileBackDeploy writeToData](self->_ftab, "writeToData");
  }
  else
  {
    v3 = self->_payloadData;
  }
  return v3;
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
  UARPSuperBinaryPayloadBackDeploy *v27;
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

  if (!v27->_ftab)
  {
    manifest = v27->_manifest;
    if (manifest)
    {
      v17 = +[UARPMetaDataTLVBackDeploy tlvFromType:length:value:](UARPMetaDataTLVBackDeploy, "tlvFromType:length:value:", 2293403952, -[NSData length](manifest, "length"), -[NSData bytes](v27->_manifest, "bytes"));
      if (v17)
        -[NSMutableArray addObject:](v27->_trimmedTlvs, "addObject:", v17);

    }
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

- (BOOL)getNeedsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (id)getManifest
{
  return self->_manifest;
}

- (id)getTssRequest
{
  return +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", self->_tssRequest);
}

- (id)tssRequestAsString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), self->_tssRequest);
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
  -[UARPSuperBinaryPayloadBackDeploy processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
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

- (id)composeTSSRequest:(unint64_t)a3
{
  return -[UARPSuperBinaryPayloadBackDeploy composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0);
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  _BOOL8 v4;
  NSData *manifest;
  NSMutableDictionary *v8;
  NSMutableDictionary *tssRequest;
  NSMutableString *v10;
  NSMutableString *keyManifest;
  NSNumber *v12;
  NSNumber *v13;
  id v14;
  NSNumber *v15;
  id v16;
  NSData *v17;
  id v18;
  void *v19;
  id v20;
  NSNumber *v21;
  id v22;
  void *v23;
  id v25;
  NSMutableString *v26;
  id v27;

  v4 = a4;
  manifest = self->_manifest;
  self->_manifest = 0;

  v8 = objc_opt_new(NSMutableDictionary);
  tssRequest = self->_tssRequest;
  self->_tssRequest = v8;

  v10 = objc_opt_new(NSMutableString);
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber)
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%lu"), a3);
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR(",Ticket"));
  if (!v4)
  {
    v26 = objc_opt_new(NSMutableString);
    -[NSMutableString appendFormat:](v26, "appendFormat:", CFSTR("@%@"), self->_keyManifest);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v26);
    v27 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("BoardID"), a3);
    v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[UARPSuperBinaryPayloadBackDeploy boardID](self, "boardID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v12, v27);

    v25 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ChipID"), a3);
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[UARPSuperBinaryPayloadBackDeploy chipID](self, "chipID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v13, v25);

    v14 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
    v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[UARPSuperBinaryPayloadBackDeploy ecID](self, "ecID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v15, v14);

    v16 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Nonce"), a3);
    v17 = -[UARPSuperBinaryPayloadBackDeploy nonce](self, "nonce");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v17, v16);

    v18 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ProductionMode"), a3);
    if (-[UARPSuperBinaryPayloadBackDeploy productionMode](self, "productionMode"))
      v19 = &__kCFBooleanTrue;
    else
      v19 = &__kCFBooleanFalse;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v19, v18);
    v20 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityDomain"), a3);
    v21 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[UARPSuperBinaryPayloadBackDeploy securityDomain](self, "securityDomain"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v21, v20);

    v22 = -[UARPSuperBinaryPayloadBackDeploy tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityMode"), a3);
    if (-[UARPSuperBinaryPayloadBackDeploy securityMode](self, "securityMode"))
      v23 = &__kCFBooleanTrue;
    else
      v23 = &__kCFBooleanFalse;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v23, v22);

  }
  -[UARPSuperBinaryPayloadBackDeploy processMeasurementsForTSSOptions:unitNumber:asMeasurement:](self, "processMeasurementsForTSSOptions:unitNumber:asMeasurement:", self->_tssRequest, a3, v4);
  return +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", self->_tssRequest);
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

- (void)processTLVsForPersonalization
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSString *v12;
  NSString *ticketPrefix;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(UARPTLVHostPersonalizationRequiredBackDeploy);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          self->_needsHostPersonalization = objc_msgSend(v8, "isRequired") != 0;
        }
        else
        {
          v10 = objc_opt_class(UARPTLVPersonalizationManifestPrefixBackDeploy);
          if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
          {
            v11 = v8;
            v12 = (NSString *)objc_msgSend(v11, "ticketPrefix");
            ticketPrefix = self->_ticketPrefix;
            self->_ticketPrefix = v12;

          }
          else
          {
            v14 = objc_opt_class(UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy);
            if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
            {
              self->_ticketNeedsUnitNumber = objc_msgSend(v8, "ticketNeedsLogicalUnitNumber") != 0;
            }
            else
            {
              v15 = objc_opt_class(UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy);
              if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
              {
                self->_prefixNeedsUnitNumber = objc_msgSend(v8, "prefixNeedsLogicalUnitNumber") != 0;
              }
              else
              {
                v16 = objc_opt_class(UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy);
                if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
                {
                  self->_suffixNeedsUnitNumber = objc_msgSend(v8, "suffixNeedsLogicalUnitNumber") != 0;
                }
                else
                {
                  v17 = objc_opt_class(UARPTLVPersonalizationFTABPayloadBackDeploy);
                  if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0)
                    -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (_QWORD)v18);
                }
              }
            }
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  NSMutableString *v28;
  NSMutableArray *obj;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v34;
  UARPSuperBinaryPayloadBackDeploy *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v31 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = self;
  obj = self->_measurements;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v34 = v6;
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
        v8 = objc_opt_new(NSMutableDictionary);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = objc_msgSend(v7, "tlvs");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (!v10)
        {
          v12 = 0;
          goto LABEL_38;
        }
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v16 = objc_opt_class(UARPTLVPersonalizationFTABSubfileLongnameBackDeploy);
            if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            {
              v17 = v15;
              v18 = objc_msgSend(v17, "longname");

              v12 = v18;
              continue;
            }
            v19 = objc_opt_class(UARPTLVPersonalizationFTABSubfileDigestBackDeploy);
            if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0)
            {
              v20 = objc_msgSend(v15, "digest");
              -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v20, CFSTR("Digest"));

              continue;
            }
            v21 = objc_opt_class(UARPTLVPersonalizationFTABSubfileESECBackDeploy);
            if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
            {
              if (a5)
                continue;
              if (-[UARPSuperBinaryPayloadBackDeploy securityMode](v35, "securityMode"))
                v22 = &__kCFBooleanTrue;
              else
                v22 = &__kCFBooleanFalse;
              v23 = v8;
              v24 = CFSTR("ESEC");
              goto LABEL_33;
            }
            v25 = objc_opt_class(UARPTLVPersonalizationFTABSubfileEPROBackDeploy);
            if ((objc_opt_isKindOfClass(v15, v25) & 1) != 0)
            {
              if (a5)
                continue;
              if (-[UARPSuperBinaryPayloadBackDeploy productionMode](v35, "productionMode"))
                v22 = &__kCFBooleanTrue;
              else
                v22 = &__kCFBooleanFalse;
              v23 = v8;
              v24 = CFSTR("EPRO");
              goto LABEL_33;
            }
            v26 = objc_opt_class(UARPTLVPersonalizationFTABSubfileTrustedBackDeploy);
            if ((objc_opt_isKindOfClass(v15, v26) & 1) != 0)
            {
              v27 = objc_msgSend(v15, "trusted");
              if (!a5)
              {
                if (v27)
                  v22 = &__kCFBooleanTrue;
                else
                  v22 = &__kCFBooleanFalse;
                v23 = v8;
                v24 = CFSTR("Trusted");
LABEL_33:
                -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);
                continue;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v11);
LABEL_38:

        v28 = objc_opt_new(NSMutableString);
        -[NSMutableString appendFormat:](v28, "appendFormat:", CFSTR("%@"), v35->_ticketPrefix);
        if (v35->_prefixNeedsUnitNumber)
          -[NSMutableString appendFormat:](v28, "appendFormat:", CFSTR("%lu"), a4);
        -[NSMutableString appendFormat:](v28, "appendFormat:", CFSTR(",%@"), v12);
        if (v35->_suffixNeedsUnitNumber)
          -[NSMutableString appendFormat:](v28, "appendFormat:", CFSTR(",%lu"), a4);
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v8, v28);

        v6 = v34 + 1;
      }
      while ((id)(v34 + 1) != v32);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v32);
  }

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

- (id)description
{
  NSMutableString *v3;
  NSString *v4;

  v3 = objc_opt_new(NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Payload - 4cc <%@> - Version <%@> - TLVs - %@"), self->_tag, self->_version, self->_tlvs);
  v4 = +[NSString stringWithString:](NSString, "stringWithString:", v3);

  return v4;
}

- (id)tatsuMeasurements:(unint64_t)a3
{
  id v5;

  v5 = -[NSMutableArray count](self->_tlvs, "count");
  if (v5)
    v5 = -[UARPSuperBinaryPayloadBackDeploy composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1);
  return v5;
}

- (UARPAssetTagBackDeploy)tag
{
  return (UARPAssetTagBackDeploy *)objc_getProperty(self, a2, 120, 1);
}

- (UARPAssetVersionBackDeploy)version
{
  return (UARPAssetVersionBackDeploy *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)payloadData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)metaData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManifest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
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

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
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

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrustedOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDemote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSDictionary)tssRequest
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)measurements
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demote, 0);
  objc_storeStrong((id *)&self->_trustedOverride, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_subfiles, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_ticketPrefix, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_ftab, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
}

- (void)addSubfile:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  FTABSubfileBackDeploy *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[FTABSubfileBackDeploy initWithTag:data:]([FTABSubfileBackDeploy alloc], "initWithTag:data:", v6, v7);

  -[NSMutableArray addObject:](self->_subfiles, "addObject:", v8);
}

- (void)removeSubfile:(id)a3 tag:(id)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_subfiles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "tag", (_QWORD)v15);
      v13 = objc_msgSend(v12, "compare:", v5);

      if (!v13)
        break;
      if (v8 == (id)++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_13;
    -[NSMutableArray removeObject:](self->_subfiles, "removeObject:", v14);
    v6 = v14;
  }
LABEL_12:

LABEL_13:
}

@end
