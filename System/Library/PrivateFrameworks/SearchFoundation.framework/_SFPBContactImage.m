@implementation _SFPBContactImage

- (_SFPBContactImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBContactImage *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _SFPBContactImage *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBContactImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "contactIdentifiers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    -[_SFPBContactImage setContactIdentifiers:](v5, "setContactIdentifiers:", v7);
    if (objc_msgSend(v4, "hasThreeDTouchEnabled"))
      -[_SFPBContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", objc_msgSend(v4, "threeDTouchEnabled"));
    objc_msgSend(v4, "appIconBadgeBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "appIconBadgeBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBContactImage setAppIconBadgeBundleIdentifier:](v5, "setAppIconBadgeBundleIdentifier:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (void)setContactIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *contactIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  contactIdentifiers = self->_contactIdentifiers;
  self->_contactIdentifiers = v4;

}

- (void)clearContactIdentifiers
{
  -[NSArray removeAllObjects](self->_contactIdentifiers, "removeAllObjects");
}

- (void)addContactIdentifiers:(id)a3
{
  id v4;
  NSArray *contactIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contactIdentifiers = self->_contactIdentifiers;
  v8 = v4;
  if (!contactIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contactIdentifiers;
    self->_contactIdentifiers = v6;

    v4 = v8;
    contactIdentifiers = self->_contactIdentifiers;
  }
  -[NSArray addObject:](contactIdentifiers, "addObject:", v4);

}

- (unint64_t)contactIdentifiersCount
{
  return -[NSArray count](self->_contactIdentifiers, "count");
}

- (id)contactIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contactIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_threeDTouchEnabled = a3;
}

- (void)setAppIconBadgeBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *appIconBadgeBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appIconBadgeBundleIdentifier = self->_appIconBadgeBundleIdentifier;
  self->_appIconBadgeBundleIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBContactImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBContactImage contactIdentifiers](self, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (-[_SFPBContactImage threeDTouchEnabled](self, "threeDTouchEnabled"))
    PBDataWriterWriteBOOLField();
  -[_SFPBContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int threeDTouchEnabled;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[_SFPBContactImage contactIdentifiers](self, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_12;
  -[_SFPBContactImage contactIdentifiers](self, "contactIdentifiers");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBContactImage contactIdentifiers](self, "contactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_13;
  }
  else
  {

  }
  threeDTouchEnabled = self->_threeDTouchEnabled;
  if (threeDTouchEnabled != objc_msgSend(v4, "threeDTouchEnabled"))
    goto LABEL_13;
  -[_SFPBContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconBadgeBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_SFPBContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

LABEL_16:
    v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  -[_SFPBContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIconBadgeBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_16;
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_contactIdentifiers, "hash");
  if (self->_threeDTouchEnabled)
    v4 = 2654435761;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_appIconBadgeBundleIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appIconBadgeBundleIdentifier)
  {
    -[_SFPBContactImage appIconBadgeBundleIdentifier](self, "appIconBadgeBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appIconBadgeBundleIdentifier"));

  }
  if (self->_contactIdentifiers)
  {
    -[_SFPBContactImage contactIdentifiers](self, "contactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("contactIdentifiers"));

  }
  if (self->_threeDTouchEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBContactImage threeDTouchEnabled](self, "threeDTouchEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("threeDTouchEnabled"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBContactImage dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBContactImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBContactImage *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBContactImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBContactImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBContactImage *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFPBContactImage *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBContactImage;
  v5 = -[_SFPBContactImage init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v19);
              -[_SFPBContactImage addContactIdentifiers:](v5, "addContactIdentifiers:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threeDTouchEnabled"), (_QWORD)v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIconBadgeBundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[_SFPBContactImage setAppIconBadgeBundleIdentifier:](v5, "setAppIconBadgeBundleIdentifier:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (NSString)appIconBadgeBundleIdentifier
{
  return self->_appIconBadgeBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconBadgeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end
