@implementation SIRINLUINTERNALSSUSSURequest

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (void)clearMatchingSpans
{
  -[NSMutableArray removeAllObjects](self->_matchingSpans, "removeAllObjects");
}

- (void)addMatchingSpans:(id)a3
{
  id v4;
  NSMutableArray *matchingSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  matchingSpans = self->_matchingSpans;
  v8 = v4;
  if (!matchingSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  -[NSMutableArray addObject:](matchingSpans, "addObject:", v4);

}

- (unint64_t)matchingSpansCount
{
  return -[NSMutableArray count](self->_matchingSpans, "count");
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_matchingSpans, "objectAtIndex:", a3);
}

- (void)clearSalientEntities
{
  -[NSMutableArray removeAllObjects](self->_salientEntities, "removeAllObjects");
}

- (void)addSalientEntities:(id)a3
{
  id v4;
  NSMutableArray *salientEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  salientEntities = self->_salientEntities;
  v8 = v4;
  if (!salientEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_salientEntities;
    self->_salientEntities = v6;

    v4 = v8;
    salientEntities = self->_salientEntities;
  }
  -[NSMutableArray addObject:](salientEntities, "addObject:", v4);

}

- (unint64_t)salientEntitiesCount
{
  return -[NSMutableArray count](self->_salientEntities, "count");
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_salientEntities, "objectAtIndex:", a3);
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSSUSSURequest;
  -[SIRINLUINTERNALSSUSSURequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSSUSSURequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *utterance;
  NSString *locale;
  SIRINLUEXTERNALUUID *asrId;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  SIRINLUEXTERNALRequestID *nluRequestId;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v4, "setObject:forKey:", locale, CFSTR("locale"));
  asrId = self->_asrId;
  if (asrId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](asrId, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("asr_id"));

  }
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = self->_matchingSpans;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("matching_spans"));
  }
  if (-[NSMutableArray count](self->_salientEntities, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = self->_salientEntities;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("salient_entities"));
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("nlu_request_id"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSSUSSURequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_utterance)
    PBDataWriterWriteStringField();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if (self->_asrId)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_matchingSpans;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_salientEntities;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_nluRequestId)
    PBDataWriterWriteSubmessage();

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
  void *v11;
  id v12;

  v12 = a3;
  if (self->_utterance)
    objc_msgSend(v12, "setUtterance:");
  if (self->_locale)
    objc_msgSend(v12, "setLocale:");
  if (self->_asrId)
    objc_msgSend(v12, "setAsrId:");
  if (-[SIRINLUINTERNALSSUSSURequest matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v12, "clearMatchingSpans");
    v4 = -[SIRINLUINTERNALSSUSSURequest matchingSpansCount](self, "matchingSpansCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALSSUSSURequest matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addMatchingSpans:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALSSUSSURequest salientEntitiesCount](self, "salientEntitiesCount"))
  {
    objc_msgSend(v12, "clearSalientEntities");
    v8 = -[SIRINLUINTERNALSSUSSURequest salientEntitiesCount](self, "salientEntitiesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALSSUSSURequest salientEntitiesAtIndex:](self, "salientEntitiesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSalientEntities:", v11);

      }
    }
  }
  if (self->_nluRequestId)
    objc_msgSend(v12, "setNluRequestId:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_asrId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_matchingSpans;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addMatchingSpans:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_salientEntities;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addSalientEntities:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v24 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v25 = (void *)v5[4];
  v5[4] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *utterance;
  NSString *locale;
  SIRINLUEXTERNALUUID *asrId;
  NSMutableArray *matchingSpans;
  NSMutableArray *salientEntities;
  SIRINLUEXTERNALRequestID *nluRequestId;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:"))
    && ((asrId = self->_asrId, !((unint64_t)asrId | v4[1])) || -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[3]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((salientEntities = self->_salientEntities, !((unint64_t)salientEntities | v4[5]))
     || -[NSMutableArray isEqual:](salientEntities, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[4])
      v11 = -[SIRINLUEXTERNALRequestID isEqual:](nluRequestId, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_utterance, "hash");
  v4 = -[NSString hash](self->_locale, "hash") ^ v3;
  v5 = -[SIRINLUEXTERNALUUID hash](self->_asrId, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_matchingSpans, "hash");
  v7 = -[NSMutableArray hash](self->_salientEntities, "hash");
  return v6 ^ v7 ^ -[SIRINLUEXTERNALRequestID hash](self->_nluRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *asrId;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  SIRINLUEXTERNALRequestID *nluRequestId;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUINTERNALSSUSSURequest setUtterance:](self, "setUtterance:");
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALSSUSSURequest setLocale:](self, "setLocale:");
  asrId = self->_asrId;
  v6 = *((_QWORD *)v4 + 1);
  if (asrId)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALSSUSSURequest setAsrId:](self, "setAsrId:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUINTERNALSSUSSURequest addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = *((id *)v4 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUINTERNALSSUSSURequest addSalientEntities:](self, "addSalientEntities:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  nluRequestId = self->_nluRequestId;
  v18 = *((_QWORD *)v4 + 4);
  if (nluRequestId)
  {
    if (v18)
      -[SIRINLUEXTERNALRequestID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUINTERNALSSUSSURequest setNluRequestId:](self, "setNluRequestId:");
  }

}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setMatchingSpans:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSpans, a3);
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setSalientEntities:(id)a3
{
  objc_storeStrong((id *)&self->_salientEntities, a3);
}

- (SIRINLUEXTERNALRequestID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

@end
