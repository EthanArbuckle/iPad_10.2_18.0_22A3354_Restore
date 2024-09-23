@implementation _SFPBEngagementSignal

- (_SFPBEngagementSignal)initWithFacade:(id)a3
{
  id v4;
  _SFPBEngagementSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _SFPBDomainEngagementScore *v23;
  _SFPBEngagementSignal *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBEngagementSignal init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEngagementSignal setVersion:](v5, "setVersion:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "serverScore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "serverScore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBEngagementSignal setServerScore:](v5, "setServerScore:");

    }
    objc_msgSend(v4, "localScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "localScore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[_SFPBEngagementSignal setLocalScore:](v5, "setLocalScore:");

    }
    objc_msgSend(v4, "serverScoreConfidence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "serverScoreConfidence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEngagementSignal setServerScoreConfidence:](v5, "setServerScoreConfidence:", objc_msgSend(v13, "intValue"));

    }
    objc_msgSend(v4, "localScoreConfidence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "localScoreConfidence");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBEngagementSignal setLocalScoreConfidence:](v5, "setLocalScoreConfidence:", objc_msgSend(v15, "intValue"));

    }
    objc_msgSend(v4, "domainEngagementScores");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "domainEngagementScores", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[_SFPBDomainEngagementScore initWithFacade:]([_SFPBDomainEngagementScore alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[_SFPBEngagementSignal setDomainEngagementScores:](v5, "setDomainEngagementScores:", v17);
    v24 = v5;

  }
  return v5;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)setServerScore:(float)a3
{
  self->_serverScore = a3;
}

- (void)setLocalScore:(float)a3
{
  self->_localScore = a3;
}

- (void)setServerScoreConfidence:(int)a3
{
  self->_serverScoreConfidence = a3;
}

- (void)setLocalScoreConfidence:(int)a3
{
  self->_localScoreConfidence = a3;
}

- (void)setDomainEngagementScores:(id)a3
{
  NSArray *v4;
  NSArray *domainEngagementScores;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  domainEngagementScores = self->_domainEngagementScores;
  self->_domainEngagementScores = v4;

}

- (void)clearDomainEngagementScores
{
  -[NSArray removeAllObjects](self->_domainEngagementScores, "removeAllObjects");
}

- (void)addDomainEngagementScores:(id)a3
{
  id v4;
  NSArray *domainEngagementScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  domainEngagementScores = self->_domainEngagementScores;
  v8 = v4;
  if (!domainEngagementScores)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_domainEngagementScores;
    self->_domainEngagementScores = v6;

    v4 = v8;
    domainEngagementScores = self->_domainEngagementScores;
  }
  -[NSArray addObject:](domainEngagementScores, "addObject:", v4);

}

- (unint64_t)domainEngagementScoresCount
{
  return -[NSArray count](self->_domainEngagementScores, "count");
}

- (id)domainEngagementScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_domainEngagementScores, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBEngagementSignalReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  float v5;
  float v6;
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
  if (-[_SFPBEngagementSignal version](self, "version"))
    PBDataWriterWriteInt32Field();
  -[_SFPBEngagementSignal serverScore](self, "serverScore");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBEngagementSignal localScore](self, "localScore");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBEngagementSignal serverScoreConfidence](self, "serverScoreConfidence"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBEngagementSignal localScoreConfidence](self, "localScoreConfidence"))
    PBDataWriterWriteInt32Field();
  -[_SFPBEngagementSignal domainEngagementScores](self, "domainEngagementScores");
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

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int version;
  float serverScore;
  float v7;
  float localScore;
  float v9;
  int serverScoreConfidence;
  int localScoreConfidence;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    version = self->_version;
    if (version == objc_msgSend(v4, "version"))
    {
      serverScore = self->_serverScore;
      objc_msgSend(v4, "serverScore");
      if (serverScore == v7)
      {
        localScore = self->_localScore;
        objc_msgSend(v4, "localScore");
        if (localScore == v9)
        {
          serverScoreConfidence = self->_serverScoreConfidence;
          if (serverScoreConfidence == objc_msgSend(v4, "serverScoreConfidence"))
          {
            localScoreConfidence = self->_localScoreConfidence;
            if (localScoreConfidence == objc_msgSend(v4, "localScoreConfidence"))
            {
              -[_SFPBEngagementSignal domainEngagementScores](self, "domainEngagementScores");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "domainEngagementScores");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if ((v12 == 0) != (v13 != 0))
              {
                -[_SFPBEngagementSignal domainEngagementScores](self, "domainEngagementScores");
                v15 = objc_claimAutoreleasedReturnValue();
                if (!v15)
                {

LABEL_15:
                  v20 = 1;
                  goto LABEL_13;
                }
                v16 = (void *)v15;
                -[_SFPBEngagementSignal domainEngagementScores](self, "domainEngagementScores");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "domainEngagementScores");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "isEqual:", v18);

                if ((v19 & 1) != 0)
                  goto LABEL_15;
              }
              else
              {

              }
            }
          }
        }
      }
    }
  }
  v20 = 0;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  uint64_t version;
  float serverScore;
  BOOL v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float localScore;
  BOOL v12;
  double v13;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;

  version = self->_version;
  serverScore = self->_serverScore;
  v5 = serverScore < 0.0;
  if (serverScore == 0.0)
  {
    v10 = 0;
  }
  else
  {
    v6 = serverScore;
    v7 = -v6;
    if (!v5)
      v7 = v6;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v10 += (unint64_t)v9;
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  localScore = self->_localScore;
  v12 = localScore < 0.0;
  if (localScore == 0.0)
  {
    v17 = 0;
  }
  else
  {
    v13 = localScore;
    v14 = -v13;
    if (!v12)
      v14 = v13;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v17 += (unint64_t)v16;
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  v18 = v10 ^ v17 ^ (2654435761 * version) ^ (2654435761 * self->_serverScoreConfidence) ^ (2654435761
                                                                                              * self->_localScoreConfidence);
  return v18 ^ -[NSArray hash](self->_domainEngagementScores, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_domainEngagementScores, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_domainEngagementScores;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("domainEngagementScores"));
  }
  if (self->_localScore != 0.0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBEngagementSignal localScore](self, "localScore");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("localScore"));

  }
  if (self->_localScoreConfidence)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBEngagementSignal localScoreConfidence](self, "localScoreConfidence"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("localScoreConfidence"));

  }
  if (self->_serverScore != 0.0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBEngagementSignal serverScore](self, "serverScore");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("serverScore"));

  }
  if (self->_serverScoreConfidence)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBEngagementSignal serverScoreConfidence](self, "serverScoreConfidence"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("serverScoreConfidence"));

  }
  if (self->_version)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBEngagementSignal version](self, "version"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("version"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBEngagementSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBEngagementSignal)initWithJSON:(id)a3
{
  void *v4;
  _SFPBEngagementSignal *v5;
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
    self = -[_SFPBEngagementSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBEngagementSignal)initWithDictionary:(id)a3
{
  id v4;
  _SFPBEngagementSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _SFPBDomainEngagementScore *v18;
  _SFPBEngagementSignal *v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_SFPBEngagementSignal;
  v5 = -[_SFPBEngagementSignal init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBEngagementSignal setVersion:](v5, "setVersion:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[_SFPBEngagementSignal setServerScore:](v5, "setServerScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[_SFPBEngagementSignal setLocalScore:](v5, "setLocalScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverScoreConfidence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBEngagementSignal setServerScoreConfidence:](v5, "setServerScoreConfidence:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localScoreConfidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBEngagementSignal setLocalScoreConfidence:](v5, "setLocalScoreConfidence:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainEngagementScores"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v10;
      v22 = v9;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[_SFPBDomainEngagementScore initWithDictionary:]([_SFPBDomainEngagementScore alloc], "initWithDictionary:", v17);
              -[_SFPBEngagementSignal addDomainEngagementScores:](v5, "addDomainEngagementScores:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v14);
      }

      v6 = v23;
      v9 = v22;
      v10 = v21;
    }
    v19 = v5;

  }
  return v5;
}

- (int)version
{
  return self->_version;
}

- (float)serverScore
{
  return self->_serverScore;
}

- (float)localScore
{
  return self->_localScore;
}

- (int)serverScoreConfidence
{
  return self->_serverScoreConfidence;
}

- (int)localScoreConfidence
{
  return self->_localScoreConfidence;
}

- (NSArray)domainEngagementScores
{
  return self->_domainEngagementScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainEngagementScores, 0);
}

@end
