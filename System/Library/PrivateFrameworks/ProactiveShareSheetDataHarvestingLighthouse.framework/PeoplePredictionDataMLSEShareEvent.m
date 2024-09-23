@implementation PeoplePredictionDataMLSEShareEvent

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)clearFeaturizedCandidates
{
  -[NSMutableArray removeAllObjects](self->_featurizedCandidates, "removeAllObjects");
}

- (void)addFeaturizedCandidate:(id)a3
{
  id v4;
  NSMutableArray *featurizedCandidates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  featurizedCandidates = self->_featurizedCandidates;
  v8 = v4;
  if (!featurizedCandidates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_featurizedCandidates;
    self->_featurizedCandidates = v6;

    v4 = v8;
    featurizedCandidates = self->_featurizedCandidates;
  }
  -[NSMutableArray addObject:](featurizedCandidates, "addObject:", v4);

}

- (unint64_t)featurizedCandidatesCount
{
  return -[NSMutableArray count](self->_featurizedCandidates, "count");
}

- (id)featurizedCandidateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_featurizedCandidates, "objectAtIndex:", a3);
}

+ (Class)featurizedCandidateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeaturizationConfig
{
  return self->_featurizationConfig != 0;
}

- (BOOL)hasTrialIdentifier
{
  return self->_trialIdentifier != 0;
}

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_engagementType;
  else
    return 0;
}

- (void)setEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_2515B8FB8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PEOPLE_SUGGESTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_SUGGESTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_SUGGESTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABANDON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRDROP_PEOPLE_SUGGESTION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_VALID_AS_PEOPLE_SUGGESTION_TARGET")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_NOT_VALID_AS_PEOPLE_SUGGESTION_TARGET")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)PeoplePredictionDataMLSEShareEvent;
  -[PeoplePredictionDataMLSEShareEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeoplePredictionDataMLSEShareEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionId;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PeoplePredictionDataFeaturizationConfig *featurizationConfig;
  void *v14;
  PeoplePredictionDataTrialIdentifier *trialIdentifier;
  void *v16;
  uint64_t engagementType;
  __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  if (-[NSMutableArray count](self->_featurizedCandidates, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_featurizedCandidates, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_featurizedCandidates;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("featurizedCandidate"));
  }
  featurizationConfig = self->_featurizationConfig;
  if (featurizationConfig)
  {
    -[PeoplePredictionDataFeaturizationConfig dictionaryRepresentation](featurizationConfig, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("featurizationConfig"));

  }
  trialIdentifier = self->_trialIdentifier;
  if (trialIdentifier)
  {
    -[PeoplePredictionDataTrialIdentifier dictionaryRepresentation](trialIdentifier, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("trialIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    engagementType = self->_engagementType;
    if (engagementType >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_2515B8FB8[engagementType];
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("engagementType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataMLSEShareEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sessionId)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_featurizedCandidates;
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

  if (self->_trialIdentifier)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_featurizationConfig)
    PBDataWriterWriteSubmessage();

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
  if (self->_sessionId)
    objc_msgSend(v9, "setSessionId:");
  if (-[PeoplePredictionDataMLSEShareEvent featurizedCandidatesCount](self, "featurizedCandidatesCount"))
  {
    objc_msgSend(v9, "clearFeaturizedCandidates");
    v4 = -[PeoplePredictionDataMLSEShareEvent featurizedCandidatesCount](self, "featurizedCandidatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PeoplePredictionDataMLSEShareEvent featurizedCandidateAtIndex:](self, "featurizedCandidateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFeaturizedCandidate:", v7);

      }
    }
  }
  if (self->_trialIdentifier)
    objc_msgSend(v9, "setTrialIdentifier:");
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 2) = self->_engagementType;
    *((_BYTE *)v9 + 48) |= 1u;
  }
  if (self->_featurizationConfig)
  {
    objc_msgSend(v9, "setFeaturizationConfig:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_featurizedCandidates;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addFeaturizedCandidate:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[PeoplePredictionDataTrialIdentifier copyWithZone:](self->_trialIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_engagementType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v16 = -[PeoplePredictionDataFeaturizationConfig copyWithZone:](self->_featurizationConfig, "copyWithZone:", a3, (_QWORD)v19);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionId;
  NSMutableArray *featurizedCandidates;
  PeoplePredictionDataTrialIdentifier *trialIdentifier;
  PeoplePredictionDataFeaturizationConfig *featurizationConfig;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_15;
  }
  featurizedCandidates = self->_featurizedCandidates;
  if ((unint64_t)featurizedCandidates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](featurizedCandidates, "isEqual:"))
      goto LABEL_15;
  }
  trialIdentifier = self->_trialIdentifier;
  if ((unint64_t)trialIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[PeoplePredictionDataTrialIdentifier isEqual:](trialIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  featurizationConfig = self->_featurizationConfig;
  if ((unint64_t)featurizationConfig | *((_QWORD *)v4 + 2))
    v9 = -[PeoplePredictionDataFeaturizationConfig isEqual:](featurizationConfig, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_sessionId, "hash");
  v4 = -[NSMutableArray hash](self->_featurizedCandidates, "hash");
  v5 = -[PeoplePredictionDataTrialIdentifier hash](self->_trialIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_engagementType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[PeoplePredictionDataFeaturizationConfig hash](self->_featurizationConfig, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PeoplePredictionDataTrialIdentifier *trialIdentifier;
  uint64_t v11;
  PeoplePredictionDataFeaturizationConfig *featurizationConfig;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[PeoplePredictionDataMLSEShareEvent setSessionId:](self, "setSessionId:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[PeoplePredictionDataMLSEShareEvent addFeaturizedCandidate:](self, "addFeaturizedCandidate:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  trialIdentifier = self->_trialIdentifier;
  v11 = *((_QWORD *)v4 + 5);
  if (trialIdentifier)
  {
    if (v11)
      -[PeoplePredictionDataTrialIdentifier mergeFrom:](trialIdentifier, "mergeFrom:");
  }
  else if (v11)
  {
    -[PeoplePredictionDataMLSEShareEvent setTrialIdentifier:](self, "setTrialIdentifier:");
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_engagementType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  featurizationConfig = self->_featurizationConfig;
  v13 = *((_QWORD *)v4 + 2);
  if (featurizationConfig)
  {
    if (v13)
      -[PeoplePredictionDataFeaturizationConfig mergeFrom:](featurizationConfig, "mergeFrom:");
  }
  else if (v13)
  {
    -[PeoplePredictionDataMLSEShareEvent setFeaturizationConfig:](self, "setFeaturizationConfig:");
  }

}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSMutableArray)featurizedCandidates
{
  return self->_featurizedCandidates;
}

- (void)setFeaturizedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_featurizedCandidates, a3);
}

- (PeoplePredictionDataFeaturizationConfig)featurizationConfig
{
  return self->_featurizationConfig;
}

- (void)setFeaturizationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_featurizationConfig, a3);
}

- (PeoplePredictionDataTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (void)setTrialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trialIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_featurizedCandidates, 0);
  objc_storeStrong((id *)&self->_featurizationConfig, 0);
}

@end
