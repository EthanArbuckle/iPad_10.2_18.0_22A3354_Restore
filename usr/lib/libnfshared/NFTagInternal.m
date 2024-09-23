@implementation NFTagInternal

- (NSData)atqa
{
  return self->_atqa;
}

- (NSData)sak
{
  return self->_sak;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (NSData)selectedAID
{
  return self->_appData;
}

- (double)sfgt
{
  return dbl_1C3503C00[self->_sfgi] / 13560000.0;
}

- (unsigned)sfgi
{
  return self->_sfgi;
}

- (NSData)pupi
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 0, 4);
}

- (NSData)applicationData
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 4, 4);
}

- (BOOL)applicationDataCoding
{
  return (*(_BYTE *)(-[NSData bytes](self->_tagID, "bytes") + 10) & 0xC) == 4;
}

- (NSData)IDm
{
  return self->_tagID;
}

- (NSData)PMm
{
  return self->_pmm;
}

- (NSData)SystemCode
{
  return self->_appData;
}

- (NSArray)allSystemCodes
{
  return self->_allSystemCodes;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)technology
{
  return self->_technology;
}

- (NSData)UID
{
  return self->_uid;
}

- (NSData)tagID
{
  return self->_tagID;
}

- (NSData)AppData
{
  return self->_appData;
}

- (unsigned)ndefAvailability
{
  return self->_ndefAvailability;
}

- (unint64_t)ndefMessageSize
{
  return self->_ndefMessageSize;
}

- (unint64_t)ndefContainerSize
{
  return self->_ndefContainerSize;
}

- (NSString)description
{
  uint64_t v2;
  unsigned int type;
  const __CFString *v4;
  const __CFString *v5;
  unsigned int technology;
  __CFString *v7;
  BOOL v8;
  int v9;
  void *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  objc_super v33;
  objc_super v34;
  objc_super v35;

  v2 = (uint64_t)self;
  type = self->_type;
  v4 = CFSTR("Unknown");
  v5 = CFSTR("Unknown");
  if (type - 1 <= 0xF)
    v5 = *(&off_1E7D7F990 + (int)(type - 1));
  technology = self->_technology;
  if ((technology & 0x10) != 0)
    v4 = CFSTR("Iso15693");
  if ((technology & 4) != 0)
    v4 = CFSTR("F");
  if ((technology & 2) != 0)
    v4 = CFSTR("B");
  if ((technology & 1) != 0)
    v7 = CFSTR("A");
  else
    v7 = (__CFString *)v4;
  v8 = type > 0x10;
  v9 = (1 << type) & 0x1E20E;
  if (v8 || v9 == 0)
  {
    if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("F")))
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33.receiver = (id)v2;
      v33.super_class = (Class)NFTagInternal;
      -[NFTagInternal description](&v33, sel_description);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 56), "NF_asHexString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 16), "NF_asHexString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@-%@ { Tech=%@ Type=%@ ID=%@, NDEF=%d, capacity=%lu, messageSize=%lu }"), v12, v14, v7, v5, v15, *(unsigned int *)(v2 + 64), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 72));
      goto LABEL_20;
    }
    if (objc_msgSend(*(id *)(v2 + 40), "count"))
    {
      objc_msgSend((id)v2, "_getSystemCodeListString");
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    v34.receiver = (id)v2;
    v34.super_class = (Class)NFTagInternal;
    -[NFTagInternal description](&v34, sel_description);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 56), "NF_asHexString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 16), "NF_asHexString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "NF_asHexString");
    v30 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(v2 + 48);
    if (v24)
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(v2 + 48), "NF_asHexString");
      v2 = objc_claimAutoreleasedReturnValue();
      v26 = (__CFString *)objc_msgSend(v25, "initWithFormat:", CFSTR("SystemCode=%@"), v2);
    }
    else
    {
      v26 = &stru_1E7D801F8;
    }
    if (v31)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SystemCodeList=%@ "), v31);
      v28 = (void *)v30;
      v20 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@-%@ { Tech=%@ Type=%@ ID=%@ PMm=%@ %@%@}"), v14, v15, v7, v5, v23, v30, v26, v27);

      if (!v24)
      {
LABEL_32:

        v12 = (__CFString *)v31;
        goto LABEL_20;
      }
    }
    else
    {
      v28 = (void *)v30;
      v20 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@-%@ { Tech=%@ Type=%@ ID=%@ PMm=%@ %@%@}"), v14, v15, v7, v5, v23, v30, v26, &stru_1E7D801F8);
      if (!v24)
        goto LABEL_32;
    }

    goto LABEL_32;
  }
  -[NSData NF_asHexString](self->_historicalBytes, "NF_asHexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  if (objc_msgSend(v11, "length"))
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("historicalBytes=%@ "), v11);
  else
    v12 = &stru_1E7D801F8;

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v35.receiver = (id)v2;
  v35.super_class = (Class)NFTagInternal;
  -[NFTagInternal description](&v35, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 56), "NF_asHexString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 16), "NF_asHexString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(unsigned __int8 *)(v2 + 112);
  objc_msgSend(*(id *)(v2 + 96), "NF_asHexString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 88), "NF_asHexString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@-%@ { Tech=%@ Type=%@ ID=%@ silentType=%d SAK=%@ ATQA=%@ sfgi=0x%X %@}"), v14, v15, v32, v5, v16, v17, v18, v19, *(unsigned __int8 *)(v2 + 113), v12);

LABEL_20:
  return (NSString *)v20;
}

- (NFTagA)tagA
{
  if (self->_technology == 1)
    return (NFTagA *)self;
  else
    return (NFTagA *)0;
}

- (NFTagB)tagB
{
  if (self->_technology == 2)
    return (NFTagB *)self;
  else
    return (NFTagB *)0;
}

- (NFTagF)tagF
{
  if (self->_technology == 4)
    return (NFTagF *)self;
  else
    return (NFTagF *)0;
}

- (NFTagInternal)initWithNFTag:(id)a3
{
  id v4;
  NFTagInternal *v5;
  void *v6;
  uint64_t v7;
  NSData *uid;
  void *v9;
  uint64_t v10;
  NSData *tagID;
  id v12;
  void *v13;
  uint64_t v14;
  NSData *atqa;
  void *v16;
  uint64_t v17;
  NSData *sak;
  void *v19;
  uint64_t v20;
  NSData *historicalBytes;
  void *v22;
  uint64_t v23;
  NSData *appData;
  id v25;
  void *v26;
  uint64_t v27;
  NSData *v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSData *pmm;
  void *v33;
  uint64_t v34;
  NSData *v35;
  void *v36;
  uint64_t v37;
  NSArray *allSystemCodes;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NFTagInternal;
  v5 = -[NFTagInternal init](&v40, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    v5->_technology = objc_msgSend(v4, "technology");
    objc_msgSend(v4, "UID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    objc_msgSend(v4, "tagID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v10;

    v5->_ndefAvailability = objc_msgSend(v4, "ndefAvailability");
    v5->_ndefMessageSize = objc_msgSend(v4, "ndefMessageSize");
    v5->_ndefContainerSize = objc_msgSend(v4, "ndefContainerSize");
    if (objc_msgSend(v4, "technology") == 1
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EF8DCBB8))
    {
      v12 = v4;
      objc_msgSend(v12, "atqa");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      atqa = v5->_atqa;
      v5->_atqa = (NSData *)v14;

      objc_msgSend(v12, "sak");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      sak = v5->_sak;
      v5->_sak = (NSData *)v17;

      objc_msgSend(v12, "historicalBytes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      historicalBytes = v5->_historicalBytes;
      v5->_historicalBytes = (NSData *)v20;

      objc_msgSend(v12, "selectedAID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      appData = v5->_appData;
      v5->_appData = (NSData *)v23;

      LOBYTE(v22) = objc_msgSend(v12, "sfgi");
      v5->_sfgi = v22;
    }
    if (objc_msgSend(v4, "technology") == 2
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EF8DCD88))
    {
      v25 = v4;
      objc_msgSend(v25, "selectedAID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      v28 = v5->_appData;
      v5->_appData = (NSData *)v27;

      LOBYTE(v26) = objc_msgSend(v25, "sfgi");
      v5->_sfgi = v26;
    }
    if (objc_msgSend(v4, "technology") == 4
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EF8DCF18))
    {
      v29 = v4;
      objc_msgSend(v29, "PMm");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "copy");
      pmm = v5->_pmm;
      v5->_pmm = (NSData *)v31;

      objc_msgSend(v29, "SystemCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "copy");
      v35 = v5->_appData;
      v5->_appData = (NSData *)v34;

      objc_msgSend(v29, "allSystemCodes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v36, "copy");
      allSystemCodes = v5->_allSystemCodes;
      v5->_allSystemCodes = (NSArray *)v37;

    }
  }

  return v5;
}

- (NFTagInternal)initWithNFTagForUIDOnly:(id)a3
{
  id v4;
  NFTagInternal *v5;
  void *v6;
  uint64_t v7;
  NSData *uid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFTagInternal;
  v5 = -[NFTagInternal init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "UID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    v5->_ndefAvailability = objc_msgSend(v4, "ndefAvailability");
    v5->_ndefMessageSize = objc_msgSend(v4, "ndefMessageSize");
    v5->_ndefContainerSize = objc_msgSend(v4, "ndefContainerSize");
  }

  return v5;
}

- (NFTagInternal)initWithDictionary:(id)a3
{
  id v4;
  NFTagInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSData *tagID;
  void *v12;
  uint64_t v13;
  NSData *pmm;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSData *appData;
  void *v22;
  uint64_t v23;
  NSArray *allSystemCodes;
  void *v25;
  uint64_t v26;
  NSData *uid;
  void *v28;
  uint64_t v29;
  NSData *atqa;
  void *v31;
  uint64_t v32;
  NSData *sak;
  void *v34;
  uint64_t v35;
  NSData *historicalBytes;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NFTagInternal;
  v5 = -[NFTagInternal init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("technology"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_technology = objc_msgSend(v6, "integerValue");
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_type = objc_msgSend(v7, "integerValue");
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("silentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_silentType = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        tagID = v5->_tagID;
        v5->_tagID = (NSData *)v10;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("PMm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        pmm = v5->_pmm;
        v5->_pmm = (NSData *)v13;

      }
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = objc_msgSend(&unk_1E7D88C00, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      while (2)
      {
        v18 = 0;
        v19 = v12;
        do
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(&unk_1E7D88C00);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v18));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = objc_msgSend(v12, "copy");
              appData = v5->_appData;
              v5->_appData = (NSData *)v20;

              goto LABEL_28;
            }
          }
          ++v18;
          v19 = v12;
        }
        while (v16 != v18);
        v16 = objc_msgSend(&unk_1E7D88C00, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_28:
    objc_msgSend(v4, "objectForKey:", CFSTR("allSystemCodes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = objc_msgSend(v22, "copy");
        allSystemCodes = v5->_allSystemCodes;
        v5->_allSystemCodes = (NSArray *)v23;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("UID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = objc_msgSend(v25, "copy");
        uid = v5->_uid;
        v5->_uid = (NSData *)v26;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("atqa"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = objc_msgSend(v28, "copy");
        atqa = v5->_atqa;
        v5->_atqa = (NSData *)v29;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("sak"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = objc_msgSend(v31, "copy");
        sak = v5->_sak;
        v5->_sak = (NSData *)v32;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("historicalBytes"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = objc_msgSend(v34, "copy");
        historicalBytes = v5->_historicalBytes;
        v5->_historicalBytes = (NSData *)v35;

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("sfgi"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_sfgi = objc_msgSend(v37, "integerValue");
    }

  }
  return v5;
}

- (NFTagInternal)initWithCoder:(id)a3
{
  id v4;
  NFTagInternal *v5;
  uint64_t v6;
  NSData *tagID;
  uint64_t v8;
  NSData *pmm;
  uint64_t v10;
  NSArray *allSystemCodes;
  uint64_t v12;
  NSData *uid;
  uint64_t v14;
  NSData *appData;
  uint64_t v16;
  NSData *atqa;
  uint64_t v18;
  NSData *sak;
  uint64_t v20;
  NSData *historicalBytes;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NFTagInternal;
  v5 = -[NFTagInternal init](&v23, sel_init);
  if (v5)
  {
    v5->_technology = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("technology"));
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PMm"));
    v8 = objc_claimAutoreleasedReturnValue();
    pmm = v5->_pmm;
    v5->_pmm = (NSData *)v8;

    +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("allSystemCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    allSystemCodes = v5->_allSystemCodes;
    v5->_allSystemCodes = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UID"));
    v12 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppData"));
    v14 = objc_claimAutoreleasedReturnValue();
    appData = v5->_appData;
    v5->_appData = (NSData *)v14;

    v5->_ndefAvailability = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ndefAvailability"));
    v5->_ndefMessageSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ndefMessageSize"));
    v5->_ndefContainerSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ndefContainerSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atqa"));
    v16 = objc_claimAutoreleasedReturnValue();
    atqa = v5->_atqa;
    v5->_atqa = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sak"));
    v18 = objc_claimAutoreleasedReturnValue();
    sak = v5->_sak;
    v5->_sak = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historicalBytes"));
    v20 = objc_claimAutoreleasedReturnValue();
    historicalBytes = v5->_historicalBytes;
    v5->_historicalBytes = (NSData *)v20;

    v5->_silentType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("silentType"));
    v5->_sfgi = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sfgi"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t technology;
  id v5;

  technology = self->_technology;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", technology, CFSTR("technology"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tagID, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pmm, CFSTR("PMm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allSystemCodes, CFSTR("allSystemCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uid, CFSTR("UID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appData, CFSTR("AppData"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_ndefAvailability, CFSTR("ndefAvailability"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ndefMessageSize, CFSTR("ndefMessageSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ndefContainerSize, CFSTR("ndefContainerSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_atqa, CFSTR("atqa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sak, CFSTR("sak"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historicalBytes, CFSTR("historicalBytes"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_silentType, CFSTR("silentType"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_sfgi, CFSTR("sfgi"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  NFTagInternal *v4;
  NFTagInternal *v5;
  unsigned int type;
  unsigned int technology;
  NSData *tagID;
  uint64_t v9;
  void *v10;
  NSData *v11;
  void *v12;
  char v13;
  NSData *uid;
  uint64_t v15;
  NSData *v16;
  NSData *v17;
  void *v18;

  v4 = (NFTagInternal *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
    goto LABEL_13;
  }
  type = self->_type;
  if (type != -[NFTagInternal type](v4, "type"))
    goto LABEL_6;
  technology = self->_technology;
  if (technology != -[NFTagInternal technology](v5, "technology"))
    goto LABEL_6;
  tagID = self->_tagID;
  -[NFTagInternal tagID](v5, "tagID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (tagID == (NSData *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = self->_tagID;
    -[NFTagInternal tagID](v5, "tagID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!(_DWORD)v11)
    {
LABEL_6:
      v13 = 0;
      goto LABEL_13;
    }
  }
  uid = self->_uid;
  -[NFTagInternal UID](v5, "UID");
  v15 = objc_claimAutoreleasedReturnValue();
  if (uid == (NSData *)v15)
  {
    v13 = 1;
  }
  else
  {
    v16 = (NSData *)v15;
    v17 = self->_uid;
    -[NFTagInternal UID](v5, "UID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSData isEqual:](v17, "isEqual:", v18);

    uid = v16;
  }

LABEL_13:
  return v13;
}

- (void)_setIDm:(id)a3
{
  NSData *v4;
  NSData *tagID;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  tagID = self->_tagID;
  self->_tagID = v4;

}

- (void)_setPMm:(id)a3
{
  NSData *v4;
  NSData *pmm;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  pmm = self->_pmm;
  self->_pmm = v4;

}

- (void)_setSystemCode:(id)a3
{
  NSData *v4;
  NSData *appData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  appData = self->_appData;
  self->_appData = v4;

}

- (void)_setIdentifier:(id)a3
{
  NSData *v4;
  NSData *tagID;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  tagID = self->_tagID;
  self->_tagID = v4;

}

- (void)_setTechnology:(unsigned int)a3
{
  self->_technology = a3;
}

- (void)_setSilentType:(unsigned __int8)a3
{
  self->_silentType = a3;
}

- (void)_setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void)_setUID:(id)a3
{
  NSData *v4;
  NSData *uid;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  uid = self->_uid;
  self->_uid = v4;

}

- (void)_setAppData:(id)a3
{
  NSData *v4;
  NSData *appData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  appData = self->_appData;
  self->_appData = v4;

}

- (void)_setSystemCodes:(id)a3
{
  NSArray *v4;
  NSArray *allSystemCodes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  allSystemCodes = self->_allSystemCodes;
  self->_allSystemCodes = v4;

}

- (id)_getSystemCodeListString
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  NSUInteger v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
  if (-[NSArray count](self->_allSystemCodes, "count"))
  {
    v4 = 0;
    do
    {
      v5 = v4 + 1;
      -[NSArray objectAtIndex:](self->_allSystemCodes, "objectAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v7);

      if (v5 != -[NSArray count](self->_allSystemCodes, "count"))
        objc_msgSend(v3, "appendString:", CFSTR(", "));

      v8 = -[NSArray count](self->_allSystemCodes, "count");
      v4 = v5;
    }
    while (v5 < v8);
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (void)_setNDEFAvailability:(unsigned int)a3
{
  self->_ndefAvailability = a3;
}

- (void)_setNDEFMessageSize:(unint64_t)a3
{
  self->_ndefMessageSize = a3;
}

- (void)_setNDEFContainerSize:(unint64_t)a3
{
  self->_ndefContainerSize = a3;
}

- (void)_setAtqa:(id)a3
{
  NSData *v4;
  NSData *atqa;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  atqa = self->_atqa;
  self->_atqa = v4;

}

- (void)_setSak:(id)a3
{
  NSData *v4;
  NSData *sak;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  sak = self->_sak;
  self->_sak = v4;

}

- (void)_setHistoricalBytes:(id)a3
{
  NSData *v4;
  NSData *historicalBytes;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  historicalBytes = self->_historicalBytes;
  self->_historicalBytes = v4;

}

- (void)_setSelectedAID:(id)a3
{
  NSData *v4;
  NSData *appData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  appData = self->_appData;
  self->_appData = v4;

}

- (BOOL)isSilent
{
  return self->_silentType != 0;
}

- (unsigned)silentType
{
  return self->_silentType;
}

- (void)_setSFGI:(unsigned __int8)a3
{
  unsigned __int8 v3;

  if (a3 >= 0xFu)
    v3 = 15;
  else
    v3 = a3;
  self->_sfgi = v3;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSData *tagID;
  NSData *uid;
  NSData *pmm;
  NSArray *allSystemCodes;
  NSData *appData;
  NSData *atqa;
  NSData *sak;
  NSData *historicalBytes;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_technology);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("technology"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ndefAvailability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ndefAvailability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_ndefContainerSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ndefContainerSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_ndefMessageSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ndefMessageSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_silentType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("silentType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_sfgi);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sfgi"));

  tagID = self->_tagID;
  if (tagID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", tagID, CFSTR("identifier"));
  uid = self->_uid;
  if (uid)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", uid, CFSTR("UID"));
  pmm = self->_pmm;
  if (pmm)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", pmm, CFSTR("PMm"));
  allSystemCodes = self->_allSystemCodes;
  if (allSystemCodes)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", allSystemCodes, CFSTR("allSystemCodes"));
  appData = self->_appData;
  if (appData)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", appData, CFSTR("allSystemCodes"));
  atqa = self->_atqa;
  if (atqa)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", atqa, CFSTR("atqa"));
  sak = self->_sak;
  if (sak)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sak, CFSTR("sak"));
  historicalBytes = self->_historicalBytes;
  if (historicalBytes)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", historicalBytes, CFSTR("historicalBytes"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_sak, 0);
  objc_storeStrong((id *)&self->_atqa, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_allSystemCodes, 0);
  objc_storeStrong((id *)&self->_pmm, 0);
  objc_storeStrong((id *)&self->_idm, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end
