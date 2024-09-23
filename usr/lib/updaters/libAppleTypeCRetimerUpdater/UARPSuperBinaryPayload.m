@implementation UARPSuperBinaryPayload

- (UARPSuperBinaryPayload)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UARPSuperBinaryPayload *v14;
  uint64_t v15;
  UARPAssetTag *tag;
  uint64_t v17;
  UARPAssetVersion *version;
  uint64_t v19;
  NSData *payloadData;
  uint64_t v21;
  NSData *metaData;
  uint64_t v23;
  NSMutableArray *tlvs;
  uint64_t v25;
  NSMutableArray *measurements;
  uint64_t v27;
  NSMutableDictionary *tssRequest;
  uint64_t v29;
  NSMutableArray *trimmedTlvs;
  uint64_t v31;
  NSMutableArray *subfiles;
  FTABFile *v33;
  FTABFile *ftab;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)UARPSuperBinaryPayload;
  v14 = -[UARPSuperBinaryPayload init](&v36, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    tag = v14->_tag;
    v14->_tag = (UARPAssetTag *)v15;

    v17 = objc_msgSend(v13, "copy");
    version = v14->_version;
    v14->_version = (UARPAssetVersion *)v17;

    v19 = objc_msgSend(v10, "copy");
    payloadData = v14->_payloadData;
    v14->_payloadData = (NSData *)v19;

    v21 = objc_msgSend(v11, "copy");
    metaData = v14->_metaData;
    v14->_metaData = (NSData *)v21;

    v23 = objc_opt_new();
    tlvs = v14->_tlvs;
    v14->_tlvs = (NSMutableArray *)v23;

    v25 = objc_opt_new();
    measurements = v14->_measurements;
    v14->_measurements = (NSMutableArray *)v25;

    v27 = objc_opt_new();
    tssRequest = v14->_tssRequest;
    v14->_tssRequest = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    trimmedTlvs = v14->_trimmedTlvs;
    v14->_trimmedTlvs = (NSMutableArray *)v29;

    v31 = objc_opt_new();
    subfiles = v14->_subfiles;
    v14->_subfiles = (NSMutableArray *)v31;

    v33 = -[FTABFile initWithData:]([FTABFile alloc], "initWithData:", v14->_payloadData);
    ftab = v14->_ftab;
    v14->_ftab = v33;

  }
  return v14;
}

- (id)getTlvs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_tlvs);
}

- (id)getMeasurements
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_measurements);
}

- (id)personalizedData
{
  NSData *v3;

  if (self->_ftab)
  {
    if (-[NSMutableArray count](self->_subfiles, "count"))
      -[FTABFile addSubfiles:](self->_ftab, "addSubfiles:", self->_subfiles);
    if (self->_manifest)
      -[FTABFile setManifest:](self->_ftab, "setManifest:");
    -[FTABFile writeToData](self->_ftab, "writeToData");
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSData *manifest;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  UARPSuperBinaryPayload *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_trimmedTlvs, "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v8);
                  }
                }
              }
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  if (!v20->_ftab)
  {
    manifest = v20->_manifest;
    if (manifest)
    {
      +[UARPMetaDataTLV tlvFromType:length:value:](UARPMetaDataTLV, "tlvFromType:length:value:", 2293403952, -[NSData length](manifest, "length"), -[NSData bytes](v20->_manifest, "bytes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v10);

    }
  }
  v11 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v20->_trimmedTlvs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "generateTLV");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendData:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_tssRequest);
}

- (id)tssRequestAsString
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_tssRequest);
}

- (BOOL)expandTLVs
{
  char *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
      +[UARPMetaDataTLV tlvFromType:length:value:](UARPMetaDataTLV, "tlvFromType:length:value:", v5, v7, &v3[v6]);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);

    }
    while (v4 < -[NSData length](self->_metaData, "length"));
  }
  -[UARPSuperBinaryPayload processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
}

- (id)requiredTSSOptions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_tlvs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "tssOption", (_QWORD)v14) == -2001563388)
          {
            v11 = 4;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563387)
          {
            v11 = 5;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563386)
          {
            v11 = 7;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563339)
          {
            v11 = 29;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563385)
          {
            v11 = 24;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563383)
          {
            v11 = 8;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563382)
          {
            v11 = 9;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563381)
          {
            v11 = 10;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563343)
          {
            v11 = 25;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563342)
          {
            v11 = 26;
            goto LABEL_29;
          }
          if (objc_msgSend(v10, "tssOption") == -2001563341)
          {
            v11 = 27;
LABEL_29:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

          }
          continue;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)composeTSSRequest:(unint64_t)a3
{
  return -[UARPSuperBinaryPayload composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0);
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  _BOOL8 v4;
  NSData *manifest;
  NSMutableDictionary *v8;
  NSMutableDictionary *tssRequest;
  NSMutableString *v10;
  NSMutableString *keyManifest;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;

  v4 = a4;
  manifest = self->_manifest;
  self->_manifest = 0;

  v8 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v8;

  v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber)
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR("%lu"), a3);
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", CFSTR(",Ticket"));
  if (!v4)
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "appendFormat:", CFSTR("@%@"), self->_keyManifest);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v29);
    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("BoardID"), a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UARPSuperBinaryPayload boardID](self, "boardID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v12, v30);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ChipID"), a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UARPSuperBinaryPayload chipID](self, "chipID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v13, v28);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ECID"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[UARPSuperBinaryPayload ecID](self, "ecID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v15, v14);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("Nonce"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryPayload nonce](self, "nonce");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v17, v16);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("ProductionMode"), a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[UARPSuperBinaryPayload productionMode](self, "productionMode");
    v20 = MEMORY[0x24BDBD1C0];
    v21 = MEMORY[0x24BDBD1C8];
    if (v19)
      v22 = MEMORY[0x24BDBD1C8];
    else
      v22 = MEMORY[0x24BDBD1C0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v22, v18);
    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityDomain"), a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[UARPSuperBinaryPayload securityDomain](self, "securityDomain"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v24, v23);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", CFSTR("SecurityMode"), a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UARPSuperBinaryPayload securityMode](self, "securityMode"))
      v26 = v21;
    else
      v26 = v20;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v26, v25);

  }
  -[UARPSuperBinaryPayload processMeasurementsForTSSOptions:unitNumber:asMeasurement:](self, "processMeasurementsForTSSOptions:unitNumber:asMeasurement:", self->_tssRequest, a3, v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_tssRequest);
}

- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  NSMutableDictionary *tssRequest;
  void *v9;
  void *v10;
  NSData *v11;
  NSData *manifest;

  v5 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://gs.apple.com:443"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  tssRequest = self->_tssRequest;
  if (v5)
    UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  else
    UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", self->_keyManifest);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    manifest = self->_manifest;
    self->_manifest = v11;

  }
  return v10 != 0;
}

- (void)processTLVsForPersonalization
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *v10;
  NSString *ticketPrefix;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_tlvs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_needsHostPersonalization = objc_msgSend(v8, "isRequired") != 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            objc_msgSend(v9, "ticketPrefix");
            v10 = (NSString *)objc_claimAutoreleasedReturnValue();
            ticketPrefix = self->_ticketPrefix;
            self->_ticketPrefix = v10;

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              self->_ticketNeedsUnitNumber = objc_msgSend(v8, "ticketNeedsLogicalUnitNumber") != 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                self->_prefixNeedsUnitNumber = objc_msgSend(v8, "prefixNeedsLogicalUnitNumber") != 0;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  self->_suffixNeedsUnitNumber = objc_msgSend(v8, "suffixNeedsLogicalUnitNumber") != 0;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (_QWORD)v12);
                }
              }
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  NSMutableArray *obj;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v29;
  UARPSuperBinaryPayload *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = self;
  obj = self->_measurements;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v7, "tlvs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (!v10)
        {
          v12 = 0;
          goto LABEL_38;
        }
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v15;
              objc_msgSend(v16, "longname");
              v17 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v17;
              continue;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "digest");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("Digest"));

              continue;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (a5)
                continue;
              if (-[UARPSuperBinaryPayload securityMode](v30, "securityMode"))
                v19 = MEMORY[0x24BDBD1C8];
              else
                v19 = MEMORY[0x24BDBD1C0];
              v20 = v8;
              v21 = CFSTR("ESEC");
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (a5)
                continue;
              if (-[UARPSuperBinaryPayload productionMode](v30, "productionMode"))
                v19 = MEMORY[0x24BDBD1C8];
              else
                v19 = MEMORY[0x24BDBD1C0];
              v20 = v8;
              v21 = CFSTR("EPRO");
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = objc_msgSend(v15, "trusted");
              if (!a5)
              {
                if (v22)
                  v19 = MEMORY[0x24BDBD1C8];
                else
                  v19 = MEMORY[0x24BDBD1C0];
                v20 = v8;
                v21 = CFSTR("Trusted");
LABEL_33:
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);
                continue;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v11);
LABEL_38:

        v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "appendFormat:", CFSTR("%@"), v30->_ticketPrefix);
        if (v30->_prefixNeedsUnitNumber)
          objc_msgSend(v23, "appendFormat:", CFSTR("%lu"), a4);
        objc_msgSend(v23, "appendFormat:", CFSTR(",%@"), v12);
        if (v30->_suffixNeedsUnitNumber)
          objc_msgSend(v23, "appendFormat:", CFSTR(",%lu"), a4);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v8, v23);

        v6 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@"), self->_ticketPrefix);
  if (self->_prefixNeedsUnitNumber)
    objc_msgSend(v7, "appendFormat:", CFSTR("%lu"), a4);
  objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v6);
  if (self->_suffixNeedsUnitNumber)
    objc_msgSend(v7, "appendFormat:", CFSTR(",%lu"), a4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Payload - 4cc <%@> - Version <%@> - TLVs - %@"), self->_tag, self->_version, self->_tlvs);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tatsuMeasurements:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[NSMutableArray count](self->_tlvs, "count");
  if (v5)
  {
    -[UARPSuperBinaryPayload composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 120, 1);
}

- (UARPAssetVersion)version
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 128, 1);
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
  FTABSubfile *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[FTABSubfile initWithTag:data:]([FTABSubfile alloc], "initWithTag:data:", v6, v7);

  -[NSMutableArray addObject:](self->_subfiles, "addObject:", v8);
}

- (void)removeSubfile:(id)a3 tag:(id)a4
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(v11, "tag", (_QWORD)v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "compare:", v5);

      if (!v13)
        break;
      if (v8 == ++v10)
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
