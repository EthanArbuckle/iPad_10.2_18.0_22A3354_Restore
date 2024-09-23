@implementation PBBProtoOfflineTerms

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasMultiterms
{
  return self->_multiterms != 0;
}

- (BOOL)hasWarranty
{
  return self->_warranty != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)clearAppleLanguages
{
  -[NSMutableArray removeAllObjects](self->_appleLanguages, "removeAllObjects");
}

- (void)addAppleLanguages:(id)a3
{
  id v4;
  NSMutableArray *appleLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appleLanguages = self->_appleLanguages;
  v8 = v4;
  if (!appleLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appleLanguages;
    self->_appleLanguages = v6;

    v4 = v8;
    appleLanguages = self->_appleLanguages;
  }
  -[NSMutableArray addObject:](appleLanguages, "addObject:", v4);

}

- (unint64_t)appleLanguagesCount
{
  return -[NSMutableArray count](self->_appleLanguages, "count");
}

- (id)appleLanguagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appleLanguages, "objectAtIndex:", a3);
}

+ (Class)appleLanguagesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoOfflineTerms;
  -[PBBProtoOfflineTerms description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoOfflineTerms dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *license;
  NSData *multiterms;
  NSData *warranty;
  NSString *languageCode;
  NSString *countryCode;
  NSMutableArray *appleLanguages;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  license = self->_license;
  if (license)
    objc_msgSend(v3, "setObject:forKey:", license, CFSTR("license"));
  multiterms = self->_multiterms;
  if (multiterms)
    objc_msgSend(v4, "setObject:forKey:", multiterms, CFSTR("multiterms"));
  warranty = self->_warranty;
  if (warranty)
    objc_msgSend(v4, "setObject:forKey:", warranty, CFSTR("warranty"));
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v4, "setObject:forKey:", languageCode, CFSTR("languageCode"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v4, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  appleLanguages = self->_appleLanguages;
  if (appleLanguages)
    objc_msgSend(v4, "setObject:forKey:", appleLanguages, CFSTR("appleLanguages"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoOfflineTermsReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_license)
    PBDataWriterWriteDataField();
  if (self->_multiterms)
    PBDataWriterWriteDataField();
  if (self->_warranty)
    PBDataWriterWriteDataField();
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_appleLanguages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_license)
    objc_msgSend(v8, "setLicense:");
  if (self->_multiterms)
    objc_msgSend(v8, "setMultiterms:");
  if (self->_warranty)
    objc_msgSend(v8, "setWarranty:");
  if (self->_languageCode)
    objc_msgSend(v8, "setLanguageCode:");
  if (self->_countryCode)
    objc_msgSend(v8, "setCountryCode:");
  if (-[PBBProtoOfflineTerms appleLanguagesCount](self, "appleLanguagesCount"))
  {
    objc_msgSend(v8, "clearAppleLanguages");
    v4 = -[PBBProtoOfflineTerms appleLanguagesCount](self, "appleLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PBBProtoOfflineTerms appleLanguagesAtIndex:](self, "appleLanguagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAppleLanguages:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_license, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSData copyWithZone:](self->_multiterms, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSData copyWithZone:](self->_warranty, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_appleLanguages;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addAppleLanguages:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *license;
  NSData *multiterms;
  NSData *warranty;
  NSString *languageCode;
  NSString *countryCode;
  NSMutableArray *appleLanguages;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((license = self->_license, !((unint64_t)license | v4[4]))
     || -[NSData isEqual:](license, "isEqual:"))
    && ((multiterms = self->_multiterms, !((unint64_t)multiterms | v4[5]))
     || -[NSData isEqual:](multiterms, "isEqual:"))
    && ((warranty = self->_warranty, !((unint64_t)warranty | v4[6]))
     || -[NSData isEqual:](warranty, "isEqual:"))
    && ((languageCode = self->_languageCode, !((unint64_t)languageCode | v4[3]))
     || -[NSString isEqual:](languageCode, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[2]))
     || -[NSString isEqual:](countryCode, "isEqual:")))
  {
    appleLanguages = self->_appleLanguages;
    if ((unint64_t)appleLanguages | v4[1])
      v11 = -[NSMutableArray isEqual:](appleLanguages, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSData hash](self->_license, "hash");
  v4 = -[NSData hash](self->_multiterms, "hash") ^ v3;
  v5 = -[NSData hash](self->_warranty, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_languageCode, "hash");
  v7 = -[NSString hash](self->_countryCode, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_appleLanguages, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[PBBProtoOfflineTerms setLicense:](self, "setLicense:");
  if (*((_QWORD *)v4 + 5))
    -[PBBProtoOfflineTerms setMultiterms:](self, "setMultiterms:");
  if (*((_QWORD *)v4 + 6))
    -[PBBProtoOfflineTerms setWarranty:](self, "setWarranty:");
  if (*((_QWORD *)v4 + 3))
    -[PBBProtoOfflineTerms setLanguageCode:](self, "setLanguageCode:");
  if (*((_QWORD *)v4 + 2))
    -[PBBProtoOfflineTerms setCountryCode:](self, "setCountryCode:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PBBProtoOfflineTerms addAppleLanguages:](self, "addAppleLanguages:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
  objc_storeStrong((id *)&self->_license, a3);
}

- (NSData)multiterms
{
  return self->_multiterms;
}

- (void)setMultiterms:(id)a3
{
  objc_storeStrong((id *)&self->_multiterms, a3);
}

- (NSData)warranty
{
  return self->_warranty;
}

- (void)setWarranty:(id)a3
{
  objc_storeStrong((id *)&self->_warranty, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSMutableArray)appleLanguages
{
  return self->_appleLanguages;
}

- (void)setAppleLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_appleLanguages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_multiterms, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end
