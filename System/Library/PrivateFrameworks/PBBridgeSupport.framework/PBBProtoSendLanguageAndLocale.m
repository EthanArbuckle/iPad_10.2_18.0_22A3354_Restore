@implementation PBBProtoSendLanguageAndLocale

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

- (BOOL)hasAppleLocale
{
  return self->_appleLocale != 0;
}

- (BOOL)hasArchivedPreferences
{
  return self->_archivedPreferences != 0;
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
  v8.super_class = (Class)PBBProtoSendLanguageAndLocale;
  -[PBBProtoSendLanguageAndLocale description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendLanguageAndLocale dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *appleLanguages;
  NSString *appleLocale;
  NSData *archivedPreferences;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appleLanguages = self->_appleLanguages;
  if (appleLanguages)
    objc_msgSend(v3, "setObject:forKey:", appleLanguages, CFSTR("appleLanguages"));
  appleLocale = self->_appleLocale;
  if (appleLocale)
    objc_msgSend(v4, "setObject:forKey:", appleLocale, CFSTR("appleLocale"));
  archivedPreferences = self->_archivedPreferences;
  if (archivedPreferences)
    objc_msgSend(v4, "setObject:forKey:", archivedPreferences, CFSTR("archivedPreferences"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendLanguageAndLocaleReadFrom((char *)self, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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

  if (self->_appleLocale)
    PBDataWriterWriteStringField();
  if (self->_archivedPreferences)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PBBProtoSendLanguageAndLocale appleLanguagesCount](self, "appleLanguagesCount"))
  {
    objc_msgSend(v9, "clearAppleLanguages");
    v4 = -[PBBProtoSendLanguageAndLocale appleLanguagesCount](self, "appleLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PBBProtoSendLanguageAndLocale appleLanguagesAtIndex:](self, "appleLanguagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAppleLanguages:", v7);

      }
    }
  }
  if (self->_appleLocale)
    objc_msgSend(v9, "setAppleLocale:");
  v8 = v9;
  if (self->_archivedPreferences)
  {
    objc_msgSend(v9, "setArchivedPreferences:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_appleLanguages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addAppleLanguages:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_appleLocale, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSData copyWithZone:](self->_archivedPreferences, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *appleLanguages;
  NSString *appleLocale;
  NSData *archivedPreferences;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((appleLanguages = self->_appleLanguages, !((unint64_t)appleLanguages | v4[1]))
     || -[NSMutableArray isEqual:](appleLanguages, "isEqual:"))
    && ((appleLocale = self->_appleLocale, !((unint64_t)appleLocale | v4[2]))
     || -[NSString isEqual:](appleLocale, "isEqual:")))
  {
    archivedPreferences = self->_archivedPreferences;
    if ((unint64_t)archivedPreferences | v4[3])
      v8 = -[NSData isEqual:](archivedPreferences, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSMutableArray hash](self->_appleLanguages, "hash");
  v4 = -[NSString hash](self->_appleLocale, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_archivedPreferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[1];
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
        -[PBBProtoSendLanguageAndLocale addAppleLanguages:](self, "addAppleLanguages:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[2])
    -[PBBProtoSendLanguageAndLocale setAppleLocale:](self, "setAppleLocale:");
  if (v4[3])
    -[PBBProtoSendLanguageAndLocale setArchivedPreferences:](self, "setArchivedPreferences:");

}

- (NSMutableArray)appleLanguages
{
  return self->_appleLanguages;
}

- (void)setAppleLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_appleLanguages, a3);
}

- (NSString)appleLocale
{
  return self->_appleLocale;
}

- (void)setAppleLocale:(id)a3
{
  objc_storeStrong((id *)&self->_appleLocale, a3);
}

- (NSData)archivedPreferences
{
  return self->_archivedPreferences;
}

- (void)setArchivedPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_archivedPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedPreferences, 0);
  objc_storeStrong((id *)&self->_appleLocale, 0);
  objc_storeStrong((id *)&self->_appleLanguages, 0);
}

@end
