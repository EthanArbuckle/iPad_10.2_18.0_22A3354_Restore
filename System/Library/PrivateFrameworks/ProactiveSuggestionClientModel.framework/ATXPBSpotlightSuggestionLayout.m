@implementation ATXPBSpotlightSuggestionLayout

- (NSString)uuidString
{
  return self->_uuidString;
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)ATXPBSpotlightSuggestionLayout;
  -[ATXPBSpotlightSuggestionLayout dealloc](&v3, sel_dealloc);
}

- (NSMutableArray)collections
{
  return self->_collections;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightSuggestionLayoutReadFrom(self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)clearCollections
{
  -[NSMutableArray removeAllObjects](self->_collections, "removeAllObjects");
}

- (void)addCollections:(id)a3
{
  id v4;
  NSMutableArray *collections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  collections = self->_collections;
  v8 = v4;
  if (!collections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_collections;
    self->_collections = v6;

    v4 = v8;
    collections = self->_collections;
  }
  -[NSMutableArray addObject:](collections, "addObject:", v4);

}

- (unint64_t)collectionsCount
{
  return -[NSMutableArray count](self->_collections, "count");
}

- (id)collectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_collections, "objectAtIndex:", a3);
}

+ (Class)collectionsType
{
  return (Class)objc_opt_class();
}

- (double)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
  PBRepeatedDoubleClear();
}

- (void)addScores:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)scoresAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_scores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scores = &self->_scores;
  count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scores->list[a3];
}

- (void)setScores:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
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
  v8.super_class = (Class)ATXPBSpotlightSuggestionLayout;
  -[ATXPBSpotlightSuggestionLayout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightSuggestionLayout dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
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
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  if (-[NSMutableArray count](self->_collections, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_collections, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_collections;
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

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("collections"));
  }
  PBRepeatedDoubleNSArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("scores"));

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_scores;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuidString)
    PBDataWriterWriteStringField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_collections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  p_scores = &self->_scores;
  if (p_scores->count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v11;
    }
    while (v11 < p_scores->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  id v11;

  v11 = a3;
  if (self->_uuidString)
    objc_msgSend(v11, "setUuidString:");
  if (-[ATXPBSpotlightSuggestionLayout collectionsCount](self, "collectionsCount"))
  {
    objc_msgSend(v11, "clearCollections");
    v4 = -[ATXPBSpotlightSuggestionLayout collectionsCount](self, "collectionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBSpotlightSuggestionLayout collectionsAtIndex:](self, "collectionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addCollections:", v7);

      }
    }
  }
  if (-[ATXPBSpotlightSuggestionLayout scoresCount](self, "scoresCount"))
  {
    objc_msgSend(v11, "clearScores");
    v8 = -[ATXPBSpotlightSuggestionLayout scoresCount](self, "scoresCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXPBSpotlightSuggestionLayout scoresAtIndex:](self, "scoresAtIndex:", j);
        objc_msgSend(v11, "addScores:");
      }
    }
  }

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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_collections;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addCollections:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  PBRepeatedDoubleCopy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuidString;
  NSMutableArray *collections;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[5]))
     || -[NSString isEqual:](uuidString, "isEqual:"))
    && ((collections = self->_collections, !((unint64_t)collections | v4[4]))
     || -[NSMutableArray isEqual:](collections, "isEqual:")))
  {
    IsEqual = PBRepeatedDoubleIsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSMutableArray hash](self->_collections, "hash") ^ v3;
  return v4 ^ PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[ATXPBSpotlightSuggestionLayout setUuidString:](self, "setUuidString:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[ATXPBSpotlightSuggestionLayout addCollections:](self, "addCollections:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "scoresCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      objc_msgSend(v4, "scoresAtIndex:", j, (_QWORD)v13);
      -[ATXPBSpotlightSuggestionLayout addScores:](self, "addScores:");
    }
  }

}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

@end
