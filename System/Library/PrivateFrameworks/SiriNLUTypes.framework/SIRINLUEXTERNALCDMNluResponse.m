@implementation SIRINLUEXTERNALCDMNluResponse

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)clearParses
{
  -[NSMutableArray removeAllObjects](self->_parses, "removeAllObjects");
}

- (void)addParses:(id)a3
{
  id v4;
  NSMutableArray *parses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parses = self->_parses;
  v8 = v4;
  if (!parses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parses;
    self->_parses = v6;

    v4 = v8;
    parses = self->_parses;
  }
  -[NSMutableArray addObject:](parses, "addObject:", v4);

}

- (unint64_t)parsesCount
{
  return -[NSMutableArray count](self->_parses, "count");
}

- (id)parsesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parses, "objectAtIndex:", a3);
}

- (BOOL)hasResponseStatus
{
  return self->_responseStatus != 0;
}

- (void)clearRepetitionResults
{
  -[NSMutableArray removeAllObjects](self->_repetitionResults, "removeAllObjects");
}

- (void)addRepetitionResults:(id)a3
{
  id v4;
  NSMutableArray *repetitionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  repetitionResults = self->_repetitionResults;
  v8 = v4;
  if (!repetitionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_repetitionResults;
    self->_repetitionResults = v6;

    v4 = v8;
    repetitionResults = self->_repetitionResults;
  }
  -[NSMutableArray addObject:](repetitionResults, "addObject:", v4);

}

- (unint64_t)repetitionResultsCount
{
  return -[NSMutableArray count](self->_repetitionResults, "count");
}

- (id)repetitionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_repetitionResults, "objectAtIndex:", a3);
}

- (BOOL)hasLanguageVariantResult
{
  return self->_languageVariantResult != 0;
}

- (BOOL)hasSupplementaryOutput
{
  return self->_supplementaryOutput != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALCDMNluResponse;
  -[SIRINLUEXTERNALCDMNluResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDMNluResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALRequestID *requestId;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  SIRINLUEXTERNALResponseStatus *responseStatus;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  SIRINLUEXTERNALLanguageVariantResult *languageVariantResult;
  void *v23;
  SIRINLUEXTERNALNLUSupplementaryOutput *supplementaryOutput;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  if (-[NSMutableArray count](self->_parses, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_parses, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = self->_parses;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("parses"));
  }
  responseStatus = self->_responseStatus;
  if (responseStatus)
  {
    -[SIRINLUEXTERNALResponseStatus dictionaryRepresentation](responseStatus, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("response_status"));

  }
  if (-[NSMutableArray count](self->_repetitionResults, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_repetitionResults, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = self->_repetitionResults;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("repetition_results"));
  }
  languageVariantResult = self->_languageVariantResult;
  if (languageVariantResult)
  {
    -[SIRINLUEXTERNALLanguageVariantResult dictionaryRepresentation](languageVariantResult, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("language_variant_result"));

  }
  supplementaryOutput = self->_supplementaryOutput;
  if (supplementaryOutput)
  {
    -[SIRINLUEXTERNALNLUSupplementaryOutput dictionaryRepresentation](supplementaryOutput, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("supplementary_output"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDMNluResponseReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_requestId)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_parses;
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

  if (self->_responseStatus)
    PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_repetitionResults;
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

  if (self->_languageVariantResult)
    PBDataWriterWriteSubmessage();
  if (self->_supplementaryOutput)
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
  void *v12;
  id v13;

  v13 = a3;
  if (self->_requestId)
    objc_msgSend(v13, "setRequestId:");
  if (-[SIRINLUEXTERNALCDMNluResponse parsesCount](self, "parsesCount"))
  {
    objc_msgSend(v13, "clearParses");
    v4 = -[SIRINLUEXTERNALCDMNluResponse parsesCount](self, "parsesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALCDMNluResponse parsesAtIndex:](self, "parsesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addParses:", v7);

      }
    }
  }
  if (self->_responseStatus)
    objc_msgSend(v13, "setResponseStatus:");
  if (-[SIRINLUEXTERNALCDMNluResponse repetitionResultsCount](self, "repetitionResultsCount"))
  {
    objc_msgSend(v13, "clearRepetitionResults");
    v8 = -[SIRINLUEXTERNALCDMNluResponse repetitionResultsCount](self, "repetitionResultsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUEXTERNALCDMNluResponse repetitionResultsAtIndex:](self, "repetitionResultsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRepetitionResults:", v11);

      }
    }
  }
  if (self->_languageVariantResult)
    objc_msgSend(v13, "setLanguageVariantResult:");
  v12 = v13;
  if (self->_supplementaryOutput)
  {
    objc_msgSend(v13, "setSupplementaryOutput:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
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
  v6 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_parses;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addParses:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v14 = -[SIRINLUEXTERNALResponseStatus copyWithZone:](self->_responseStatus, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = self->_repetitionResults;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addRepetitionResults:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

  v22 = -[SIRINLUEXTERNALLanguageVariantResult copyWithZone:](self->_languageVariantResult, "copyWithZone:", a3);
  v23 = (void *)v5[1];
  v5[1] = v22;

  v24 = -[SIRINLUEXTERNALNLUSupplementaryOutput copyWithZone:](self->_supplementaryOutput, "copyWithZone:", a3);
  v25 = (void *)v5[6];
  v5[6] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  NSMutableArray *parses;
  SIRINLUEXTERNALResponseStatus *responseStatus;
  NSMutableArray *repetitionResults;
  SIRINLUEXTERNALLanguageVariantResult *languageVariantResult;
  SIRINLUEXTERNALNLUSupplementaryOutput *supplementaryOutput;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((parses = self->_parses, !((unint64_t)parses | v4[2]))
     || -[NSMutableArray isEqual:](parses, "isEqual:"))
    && ((responseStatus = self->_responseStatus, !((unint64_t)responseStatus | v4[5]))
     || -[SIRINLUEXTERNALResponseStatus isEqual:](responseStatus, "isEqual:"))
    && ((repetitionResults = self->_repetitionResults, !((unint64_t)repetitionResults | v4[3]))
     || -[NSMutableArray isEqual:](repetitionResults, "isEqual:"))
    && ((languageVariantResult = self->_languageVariantResult, !((unint64_t)languageVariantResult | v4[1]))
     || -[SIRINLUEXTERNALLanguageVariantResult isEqual:](languageVariantResult, "isEqual:")))
  {
    supplementaryOutput = self->_supplementaryOutput;
    if ((unint64_t)supplementaryOutput | v4[6])
      v11 = -[SIRINLUEXTERNALNLUSupplementaryOutput isEqual:](supplementaryOutput, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[SIRINLUEXTERNALRequestID hash](self->_requestId, "hash");
  v4 = -[NSMutableArray hash](self->_parses, "hash") ^ v3;
  v5 = -[SIRINLUEXTERNALResponseStatus hash](self->_responseStatus, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_repetitionResults, "hash");
  v7 = -[SIRINLUEXTERNALLanguageVariantResult hash](self->_languageVariantResult, "hash");
  return v6 ^ v7 ^ -[SIRINLUEXTERNALNLUSupplementaryOutput hash](self->_supplementaryOutput, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALRequestID *requestId;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SIRINLUEXTERNALResponseStatus *responseStatus;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  SIRINLUEXTERNALLanguageVariantResult *languageVariantResult;
  uint64_t v20;
  SIRINLUEXTERNALNLUSupplementaryOutput *supplementaryOutput;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestId = self->_requestId;
  v6 = *((_QWORD *)v4 + 4);
  if (requestId)
  {
    if (v6)
      -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDMNluResponse setRequestId:](self, "setRequestId:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALCDMNluResponse addParses:](self, "addParses:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  responseStatus = self->_responseStatus;
  v13 = *((_QWORD *)v4 + 5);
  if (responseStatus)
  {
    if (v13)
      -[SIRINLUEXTERNALResponseStatus mergeFrom:](responseStatus, "mergeFrom:");
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALCDMNluResponse setResponseStatus:](self, "setResponseStatus:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = *((id *)v4 + 3);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        -[SIRINLUEXTERNALCDMNluResponse addRepetitionResults:](self, "addRepetitionResults:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  languageVariantResult = self->_languageVariantResult;
  v20 = *((_QWORD *)v4 + 1);
  if (languageVariantResult)
  {
    if (v20)
      -[SIRINLUEXTERNALLanguageVariantResult mergeFrom:](languageVariantResult, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALCDMNluResponse setLanguageVariantResult:](self, "setLanguageVariantResult:");
  }
  supplementaryOutput = self->_supplementaryOutput;
  v22 = *((_QWORD *)v4 + 6);
  if (supplementaryOutput)
  {
    if (v22)
      -[SIRINLUEXTERNALNLUSupplementaryOutput mergeFrom:](supplementaryOutput, "mergeFrom:");
  }
  else if (v22)
  {
    -[SIRINLUEXTERNALCDMNluResponse setSupplementaryOutput:](self, "setSupplementaryOutput:");
  }

}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSMutableArray)parses
{
  return self->_parses;
}

- (void)setParses:(id)a3
{
  objc_storeStrong((id *)&self->_parses, a3);
}

- (SIRINLUEXTERNALResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_responseStatus, a3);
}

- (NSMutableArray)repetitionResults
{
  return self->_repetitionResults;
}

- (void)setRepetitionResults:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionResults, a3);
}

- (SIRINLUEXTERNALLanguageVariantResult)languageVariantResult
{
  return self->_languageVariantResult;
}

- (void)setLanguageVariantResult:(id)a3
{
  objc_storeStrong((id *)&self->_languageVariantResult, a3);
}

- (SIRINLUEXTERNALNLUSupplementaryOutput)supplementaryOutput
{
  return self->_supplementaryOutput;
}

- (void)setSupplementaryOutput:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryOutput, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_repetitionResults, 0);
  objc_storeStrong((id *)&self->_parses, 0);
  objc_storeStrong((id *)&self->_languageVariantResult, 0);
}

+ (Class)parsesType
{
  return (Class)objc_opt_class();
}

+ (Class)repetitionResultsType
{
  return (Class)objc_opt_class();
}

@end
