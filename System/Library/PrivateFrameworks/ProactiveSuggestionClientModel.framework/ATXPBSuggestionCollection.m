@implementation ATXPBSuggestionCollection

- (BOOL)hasContextTitle
{
  return self->_contextTitle != 0;
}

- (void)clearSuggestions
{
  -[NSMutableArray removeAllObjects](self->_suggestions, "removeAllObjects");
}

- (void)addSuggestions:(id)a3
{
  id v4;
  NSMutableArray *suggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  suggestions = self->_suggestions;
  v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    v4 = v8;
    suggestions = self->_suggestions;
  }
  -[NSMutableArray addObject:](suggestions, "addObject:", v4);

}

- (unint64_t)suggestionsCount
{
  return -[NSMutableArray count](self->_suggestions, "count");
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestions, "objectAtIndex:", a3);
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSectionIdentifier
{
  return self->_sectionIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSuggestionCollection;
  -[ATXPBSuggestionCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *contextTitle;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *sectionIdentifier;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contextTitle = self->_contextTitle;
  if (contextTitle)
    objc_msgSend(v3, "setObject:forKey:", contextTitle, CFSTR("contextTitle"));
  if (-[NSMutableArray count](self->_suggestions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_suggestions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("suggestions"));
  }
  sectionIdentifier = self->_sectionIdentifier;
  if (sectionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sectionIdentifier, CFSTR("sectionIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSuggestionCollectionReadFrom((char *)self, (uint64_t)a3);
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_contextTitle)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_suggestions;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_sectionIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_contextTitle)
    objc_msgSend(v8, "setContextTitle:");
  if (-[ATXPBSuggestionCollection suggestionsCount](self, "suggestionsCount"))
  {
    objc_msgSend(v8, "clearSuggestions");
    v4 = -[ATXPBSuggestionCollection suggestionsCount](self, "suggestionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBSuggestionCollection suggestionsAtIndex:](self, "suggestionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSuggestions:", v7);

      }
    }
  }
  if (self->_sectionIdentifier)
    objc_msgSend(v8, "setSectionIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_contextTitle, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_suggestions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addSuggestions:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_sectionIdentifier, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *contextTitle;
  NSMutableArray *suggestions;
  NSString *sectionIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((contextTitle = self->_contextTitle, !((unint64_t)contextTitle | v4[1]))
     || -[NSString isEqual:](contextTitle, "isEqual:"))
    && ((suggestions = self->_suggestions, !((unint64_t)suggestions | v4[3]))
     || -[NSMutableArray isEqual:](suggestions, "isEqual:")))
  {
    sectionIdentifier = self->_sectionIdentifier;
    if ((unint64_t)sectionIdentifier | v4[2])
      v8 = -[NSString isEqual:](sectionIdentifier, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_contextTitle, "hash");
  v4 = -[NSMutableArray hash](self->_suggestions, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sectionIdentifier, "hash");
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[ATXPBSuggestionCollection setContextTitle:](self, "setContextTitle:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[ATXPBSuggestionCollection addSuggestions:](self, "addSuggestions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[ATXPBSuggestionCollection setSectionIdentifier:](self, "setSectionIdentifier:");

}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (void)setContextTitle:(id)a3
{
  objc_storeStrong((id *)&self->_contextTitle, a3);
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
}

@end
