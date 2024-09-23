@implementation _SFPBDomainEngagementScore

- (_SFPBDomainEngagementScore)initWithFacade:(id)a3
{
  id v4;
  _SFPBDomainEngagementScore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBDomainEngagementScore *v12;

  v4 = a3;
  v5 = -[_SFPBDomainEngagementScore init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasDomain"))
      -[_SFPBDomainEngagementScore setDomain:](v5, "setDomain:", objc_msgSend(v4, "domain"));
    objc_msgSend(v4, "scoreConfidence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "scoreConfidence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDomainEngagementScore setScoreConfidence:](v5, "setScoreConfidence:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "score");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "score");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBDomainEngagementScore setScore:](v5, "setScore:");

    }
    objc_msgSend(v4, "iFunScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "iFunScore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[_SFPBDomainEngagementScore setIFunScore:](v5, "setIFunScore:");

    }
    v12 = v5;
  }

  return v5;
}

- (void)setDomain:(int)a3
{
  self->_domain = a3;
}

- (void)setScoreConfidence:(int)a3
{
  self->_scoreConfidence = a3;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (void)setIFunScore:(float)a3
{
  self->_iFunScore = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBDomainEngagementScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  void *v5;
  float v6;
  id v7;

  v7 = a3;
  if (-[_SFPBDomainEngagementScore domain](self, "domain"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBDomainEngagementScore scoreConfidence](self, "scoreConfidence"))
    PBDataWriterWriteInt32Field();
  -[_SFPBDomainEngagementScore score](self, "score");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBDomainEngagementScore iFunScore](self, "iFunScore");
  v5 = v7;
  if (v6 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v5 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int domain;
  int scoreConfidence;
  float score;
  float v8;
  BOOL v9;
  float iFunScore;
  float v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (domain = self->_domain, domain == objc_msgSend(v4, "domain"))
    && (scoreConfidence = self->_scoreConfidence, scoreConfidence == objc_msgSend(v4, "scoreConfidence"))
    && (score = self->_score, objc_msgSend(v4, "score"), score == v8))
  {
    iFunScore = self->_iFunScore;
    objc_msgSend(v4, "iFunScore");
    v9 = iFunScore == v12;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t domain;
  uint64_t scoreConfidence;
  float score;
  BOOL v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  float iFunScore;
  BOOL v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;

  domain = self->_domain;
  scoreConfidence = self->_scoreConfidence;
  score = self->_score;
  v6 = score < 0.0;
  if (score == 0.0)
  {
    v11 = 0;
  }
  else
  {
    v7 = score;
    v8 = -v7;
    if (!v6)
      v8 = v7;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v11 += (unint64_t)v10;
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  iFunScore = self->_iFunScore;
  v13 = iFunScore < 0.0;
  if (iFunScore == 0.0)
  {
    v18 = 0;
  }
  else
  {
    v14 = iFunScore;
    v15 = -v14;
    if (!v13)
      v15 = v14;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v18 += (unint64_t)v17;
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  return (2654435761 * scoreConfidence) ^ (2654435761 * domain) ^ v11 ^ v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_domain)
  {
    v4 = -[_SFPBDomainEngagementScore domain](self, "domain");
    if (v4 >= 0x58)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E40419D0 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("domain"));

  }
  if (self->_iFunScore != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBDomainEngagementScore iFunScore](self, "iFunScore");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("iFunScore"));

  }
  if (self->_score != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBDomainEngagementScore score](self, "score");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("score"));

  }
  if (self->_scoreConfidence)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBDomainEngagementScore scoreConfidence](self, "scoreConfidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("scoreConfidence"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDomainEngagementScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDomainEngagementScore)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDomainEngagementScore *v5;
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
    self = -[_SFPBDomainEngagementScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDomainEngagementScore)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDomainEngagementScore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBDomainEngagementScore *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBDomainEngagementScore;
  v5 = -[_SFPBDomainEngagementScore init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDomainEngagementScore setDomain:](v5, "setDomain:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scoreConfidence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDomainEngagementScore setScoreConfidence:](v5, "setScoreConfidence:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[_SFPBDomainEngagementScore setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iFunScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[_SFPBDomainEngagementScore setIFunScore:](v5, "setIFunScore:");
    }
    v10 = v5;

  }
  return v5;
}

- (int)domain
{
  return self->_domain;
}

- (int)scoreConfidence
{
  return self->_scoreConfidence;
}

- (float)score
{
  return self->_score;
}

- (float)iFunScore
{
  return self->_iFunScore;
}

@end
