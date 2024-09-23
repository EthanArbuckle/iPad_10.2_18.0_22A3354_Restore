@implementation _SFPBContactButtonItem

- (_SFPBContactButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBContactButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPerson *v9;
  void *v10;
  _SFPBPerson *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _SFPBContactButtonItem *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBContactButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBContactButtonItem setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    objc_msgSend(v4, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBPerson alloc];
      objc_msgSend(v4, "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBPerson initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBContactButtonItem setPerson:](v5, "setPerson:", v11);

    }
    objc_msgSend(v4, "actionTypesToShow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "actionTypesToShow", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if (*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i))
            objc_msgSend(v13, "addObject:");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    -[_SFPBContactButtonItem setActionTypesToShows:](v5, "setActionTypesToShows:", v13);
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBContactButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v19 = v5;

  }
  return v5;
}

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void)setActionTypesToShow:(id)a3
{
  NSArray *v4;
  NSArray *actionTypesToShows;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  actionTypesToShows = self->_actionTypesToShows;
  self->_actionTypesToShows = v4;

}

- (void)clearActionTypesToShow
{
  -[NSArray removeAllObjects](self->_actionTypesToShows, "removeAllObjects");
}

- (void)addActionTypesToShow:(int)a3
{
  uint64_t v3;
  NSArray *actionTypesToShows;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  actionTypesToShows = self->_actionTypesToShows;
  if (!actionTypesToShows)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_actionTypesToShows;
    self->_actionTypesToShows = v6;

    actionTypesToShows = self->_actionTypesToShows;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](actionTypesToShows, "addObject:", v8);

}

- (unint64_t)actionTypesToShowCount
{
  return -[NSArray count](self->_actionTypesToShows, "count");
}

- (int)actionTypesToShowAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_actionTypesToShows, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBContactButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBContactButtonItem contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBContactButtonItem person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBContactButtonItem actionTypesToShows](self, "actionTypesToShows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "intValue");
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (-[_SFPBContactButtonItem uniqueId](self, "uniqueId"))
    PBDataWriterWriteUint64Field();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBContactButtonItem contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBContactButtonItem contactIdentifier](self, "contactIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBContactButtonItem contactIdentifier](self, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBContactButtonItem person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBContactButtonItem person](self, "person");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBContactButtonItem person](self, "person");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBContactButtonItem actionTypesToShows](self, "actionTypesToShows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionTypesToShows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBContactButtonItem actionTypesToShows](self, "actionTypesToShows");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      uniqueId = self->_uniqueId;
      v22 = uniqueId == objc_msgSend(v4, "uniqueId");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBContactButtonItem actionTypesToShows](self, "actionTypesToShows");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionTypesToShows");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = -[_SFPBPerson hash](self->_person, "hash");
  return v4 ^ v3 ^ -[NSArray hash](self->_actionTypesToShows, "hash") ^ (2654435761u * self->_uniqueId);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_actionTypesToShows, "count"))
  {
    -[_SFPBContactButtonItem actionTypesToShows](self, "actionTypesToShows");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionTypesToShow"));

  }
  if (self->_contactIdentifier)
  {
    -[_SFPBContactButtonItem contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("contactIdentifier"));

  }
  if (self->_person)
  {
    -[_SFPBContactButtonItem person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("person"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("person"));

    }
  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBContactButtonItem uniqueId](self, "uniqueId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("uniqueId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBContactButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBContactButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBContactButtonItem *v5;
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
    self = -[_SFPBContactButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBContactButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBContactButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPerson *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _SFPBContactButtonItem *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBContactButtonItem;
  v5 = -[_SFPBContactButtonItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBContactButtonItem setContactIdentifier:](v5, "setContactIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("person"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v8);
      -[_SFPBContactButtonItem setPerson:](v5, "setPerson:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionTypesToShow"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[_SFPBContactButtonItem addActionTypesToShow:](v5, "addActionTypesToShow:", objc_msgSend(v16, "intValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v13);
      }

      v6 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBContactButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v17, "unsignedLongLongValue"));
    v18 = v5;

  }
  return v5;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (_SFPBPerson)person
{
  return self->_person;
}

- (NSArray)actionTypesToShows
{
  return self->_actionTypesToShows;
}

- (void)setActionTypesToShows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypesToShows, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
