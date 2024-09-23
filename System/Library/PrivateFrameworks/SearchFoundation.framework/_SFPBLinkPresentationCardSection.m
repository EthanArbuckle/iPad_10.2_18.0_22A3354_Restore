@implementation _SFPBLinkPresentationCardSection

- (_SFPBLinkPresentationCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBLinkPresentationCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _SFPBPerson *v17;
  _SFPBLinkPresentationCardSection *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBLinkPresentationCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBLinkPresentationCardSection setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBLinkPresentationCardSection setUrl:](v5, "setUrl:", v9);

    }
    objc_msgSend(v4, "peopleToBadge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "peopleToBadge", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    -[_SFPBLinkPresentationCardSection setPeopleToBadges:](v5, "setPeopleToBadges:", v11);
    if (objc_msgSend(v4, "hasIsHighlighted"))
      -[_SFPBLinkPresentationCardSection setIsHighlighted:](v5, "setIsHighlighted:", objc_msgSend(v4, "isHighlighted"));
    v18 = v5;

  }
  return v5;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  NSString *v4;
  NSString *coreSpotlightIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  coreSpotlightIdentifier = self->_coreSpotlightIdentifier;
  self->_coreSpotlightIdentifier = v4;

}

- (void)setUrl:(id)a3
{
  NSString *v4;
  NSString *url;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  url = self->_url;
  self->_url = v4;

}

- (void)setPeopleToBadge:(id)a3
{
  NSArray *v4;
  NSArray *peopleToBadges;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  peopleToBadges = self->_peopleToBadges;
  self->_peopleToBadges = v4;

}

- (void)clearPeopleToBadge
{
  -[NSArray removeAllObjects](self->_peopleToBadges, "removeAllObjects");
}

- (void)addPeopleToBadge:(id)a3
{
  id v4;
  NSArray *peopleToBadges;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  peopleToBadges = self->_peopleToBadges;
  v8 = v4;
  if (!peopleToBadges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_peopleToBadges;
    self->_peopleToBadges = v6;

    v4 = v8;
    peopleToBadges = self->_peopleToBadges;
  }
  -[NSArray addObject:](peopleToBadges, "addObject:", v4);

}

- (unint64_t)peopleToBadgeCount
{
  return -[NSArray count](self->_peopleToBadges, "count");
}

- (id)peopleToBadgeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_peopleToBadges, "objectAtIndexedSubscript:", a3);
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLinkPresentationCardSectionReadFrom(self, (uint64_t)a3);
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
  -[_SFPBLinkPresentationCardSection coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBLinkPresentationCardSection url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBLinkPresentationCardSection peopleToBadges](self, "peopleToBadges");
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (-[_SFPBLinkPresentationCardSection isHighlighted](self, "isHighlighted"))
    PBDataWriterWriteBOOLField();

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
  int isHighlighted;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBLinkPresentationCardSection coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBLinkPresentationCardSection coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBLinkPresentationCardSection coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBLinkPresentationCardSection url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBLinkPresentationCardSection url](self, "url");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBLinkPresentationCardSection url](self, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBLinkPresentationCardSection peopleToBadges](self, "peopleToBadges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleToBadges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBLinkPresentationCardSection peopleToBadges](self, "peopleToBadges");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      isHighlighted = self->_isHighlighted;
      v22 = isHighlighted == objc_msgSend(v4, "isHighlighted");
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBLinkPresentationCardSection peopleToBadges](self, "peopleToBadges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peopleToBadges");
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
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_coreSpotlightIdentifier, "hash");
  v4 = -[NSString hash](self->_url, "hash");
  v5 = -[NSArray hash](self->_peopleToBadges, "hash");
  v6 = 2654435761;
  if (!self->_isHighlighted)
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_coreSpotlightIdentifier)
  {
    -[_SFPBLinkPresentationCardSection coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreSpotlightIdentifier"));

  }
  if (self->_isHighlighted)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBLinkPresentationCardSection isHighlighted](self, "isHighlighted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isHighlighted"));

  }
  if (-[NSArray count](self->_peopleToBadges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_peopleToBadges;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("peopleToBadge"));
  }
  if (self->_url)
  {
    -[_SFPBLinkPresentationCardSection url](self, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("url"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBLinkPresentationCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBLinkPresentationCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBLinkPresentationCardSection *v5;
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
    self = -[_SFPBLinkPresentationCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBLinkPresentationCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBLinkPresentationCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _SFPBPerson *v17;
  void *v18;
  _SFPBLinkPresentationCardSection *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFPBLinkPresentationCardSection;
  v5 = -[_SFPBLinkPresentationCardSection init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpotlightIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBLinkPresentationCardSection setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBLinkPresentationCardSection setUrl:](v5, "setUrl:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peopleToBadge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v16);
              -[_SFPBLinkPresentationCardSection addPeopleToBadge:](v5, "addPeopleToBadge:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v8 = v21;
      v6 = v22;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighlighted"), v21, v22, (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBLinkPresentationCardSection setIsHighlighted:](v5, "setIsHighlighted:", objc_msgSend(v18, "BOOLValue"));
    v19 = v5;

  }
  return v5;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (NSString)url
{
  return self->_url;
}

- (NSArray)peopleToBadges
{
  return self->_peopleToBadges;
}

- (void)setPeopleToBadges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleToBadges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

@end
