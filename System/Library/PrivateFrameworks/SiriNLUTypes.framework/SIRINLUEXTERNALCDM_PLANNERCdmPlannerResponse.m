@implementation SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse

- (BOOL)hasPlanText
{
  return self->_planText != 0;
}

- (BOOL)hasGeneratedTranscriptEventsJson
{
  return self->_generatedTranscriptEventsJson != 0;
}

- (void)clearTranscriptEvents
{
  -[NSMutableArray removeAllObjects](self->_transcriptEvents, "removeAllObjects");
}

- (void)addTranscriptEvents:(id)a3
{
  id v4;
  NSMutableArray *transcriptEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transcriptEvents = self->_transcriptEvents;
  v8 = v4;
  if (!transcriptEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_transcriptEvents;
    self->_transcriptEvents = v6;

    v4 = v8;
    transcriptEvents = self->_transcriptEvents;
  }
  -[NSMutableArray addObject:](transcriptEvents, "addObject:", v4);

}

- (unint64_t)transcriptEventsCount
{
  return -[NSMutableArray count](self->_transcriptEvents, "count");
}

- (id)transcriptEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transcriptEvents, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse;
  -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *planText;
  NSData *generatedTranscriptEventsJson;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  planText = self->_planText;
  if (planText)
    objc_msgSend(v3, "setObject:forKey:", planText, CFSTR("plan_text"));
  generatedTranscriptEventsJson = self->_generatedTranscriptEventsJson;
  if (generatedTranscriptEventsJson)
    objc_msgSend(v4, "setObject:forKey:", generatedTranscriptEventsJson, CFSTR("generated_transcript_events_json"));
  if (-[NSMutableArray count](self->_transcriptEvents, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_transcriptEvents, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_transcriptEvents;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("transcript_events"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponseReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_planText)
    PBDataWriterWriteStringField();
  if (self->_generatedTranscriptEventsJson)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_transcriptEvents;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_planText)
    objc_msgSend(v8, "setPlanText:");
  if (self->_generatedTranscriptEventsJson)
    objc_msgSend(v8, "setGeneratedTranscriptEventsJson:");
  if (-[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse transcriptEventsCount](self, "transcriptEventsCount"))
  {
    objc_msgSend(v8, "clearTranscriptEvents");
    v4 = -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse transcriptEventsCount](self, "transcriptEventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse transcriptEventsAtIndex:](self, "transcriptEventsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTranscriptEvents:", v7);

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
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  v6 = -[NSString copyWithZone:](self->_planText, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_generatedTranscriptEventsJson, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_transcriptEvents;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addTranscriptEvents:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *planText;
  NSData *generatedTranscriptEventsJson;
  NSMutableArray *transcriptEvents;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((planText = self->_planText, !((unint64_t)planText | v4[2]))
     || -[NSString isEqual:](planText, "isEqual:"))
    && ((generatedTranscriptEventsJson = self->_generatedTranscriptEventsJson,
         !((unint64_t)generatedTranscriptEventsJson | v4[1]))
     || -[NSData isEqual:](generatedTranscriptEventsJson, "isEqual:")))
  {
    transcriptEvents = self->_transcriptEvents;
    if ((unint64_t)transcriptEvents | v4[3])
      v8 = -[NSMutableArray isEqual:](transcriptEvents, "isEqual:");
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

  v3 = -[NSString hash](self->_planText, "hash");
  v4 = -[NSData hash](self->_generatedTranscriptEventsJson, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_transcriptEvents, "hash");
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
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse setPlanText:](self, "setPlanText:");
  if (*((_QWORD *)v4 + 1))
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse setGeneratedTranscriptEventsJson:](self, "setGeneratedTranscriptEventsJson:");
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
        -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse addTranscriptEvents:](self, "addTranscriptEvents:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)planText
{
  return self->_planText;
}

- (void)setPlanText:(id)a3
{
  objc_storeStrong((id *)&self->_planText, a3);
}

- (NSData)generatedTranscriptEventsJson
{
  return self->_generatedTranscriptEventsJson;
}

- (void)setGeneratedTranscriptEventsJson:(id)a3
{
  objc_storeStrong((id *)&self->_generatedTranscriptEventsJson, a3);
}

- (NSMutableArray)transcriptEvents
{
  return self->_transcriptEvents;
}

- (void)setTranscriptEvents:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptEvents, 0);
  objc_storeStrong((id *)&self->_planText, 0);
  objc_storeStrong((id *)&self->_generatedTranscriptEventsJson, 0);
}

+ (Class)transcriptEventsType
{
  return (Class)objc_opt_class();
}

@end
