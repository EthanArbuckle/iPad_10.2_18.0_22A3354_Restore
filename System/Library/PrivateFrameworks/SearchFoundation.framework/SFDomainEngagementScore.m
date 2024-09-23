@implementation SFDomainEngagementScore

- (SFDomainEngagementScore)initWithDomain:(int)a3 scoreConfidence:(id)a4 score:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  SFDomainEngagementScore *v10;
  SFDomainEngagementScore *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SFDomainEngagementScore;
  v10 = -[SFDomainEngagementScore init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SFDomainEngagementScore setDomain:](v10, "setDomain:", v6);
    -[SFDomainEngagementScore setScoreConfidence:](v11, "setScoreConfidence:", v8);
    -[SFDomainEngagementScore setScore:](v11, "setScore:", v9);
  }

  return v11;
}

- (SFDomainEngagementScore)initWithProtobuf:(id)a3
{
  id v4;
  SFDomainEngagementScore *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  SFDomainEngagementScore *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFDomainEngagementScore;
  v5 = -[SFDomainEngagementScore init](&v15, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "domain"))
      -[SFDomainEngagementScore setDomain:](v5, "setDomain:", objc_msgSend(v4, "domain"));
    if (objc_msgSend(v4, "scoreConfidence"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "scoreConfidence"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore setScoreConfidence:](v5, "setScoreConfidence:", v6);

    }
    objc_msgSend(v4, "score");
    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "score");
      objc_msgSend(v8, "numberWithFloat:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore setScore:](v5, "setScore:", v9);

    }
    objc_msgSend(v4, "iFunScore");
    if (v10 != 0.0)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "iFunScore");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore setIFunScore:](v5, "setIFunScore:", v12);

    }
    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_domain = a3;
}

- (BOOL)hasDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFDomainEngagementScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDomainEngagementScore *v6;
  SFDomainEngagementScore *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBDomainEngagementScore initWithData:]([_SFPBDomainEngagementScore alloc], "initWithData:", v5);
  v7 = -[SFDomainEngagementScore initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDomainEngagementScore *v6;

  v4 = a3;
  v6 = -[_SFPBDomainEngagementScore initWithFacade:]([_SFPBDomainEngagementScore alloc], "initWithFacade:", self);
  -[_SFPBDomainEngagementScore data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDomainEngagementScore *v2;
  void *v3;

  v2 = -[_SFPBDomainEngagementScore initWithFacade:]([_SFPBDomainEngagementScore alloc], "initWithFacade:", self);
  -[_SFPBDomainEngagementScore dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDomainEngagementScore *v2;
  void *v3;

  v2 = -[_SFPBDomainEngagementScore initWithFacade:]([_SFPBDomainEngagementScore alloc], "initWithFacade:", self);
  -[_SFPBDomainEngagementScore jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDomain:", -[SFDomainEngagementScore domain](self, "domain"));
  -[SFDomainEngagementScore scoreConfidence](self, "scoreConfidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setScoreConfidence:", v6);

  -[SFDomainEngagementScore score](self, "score");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setScore:", v8);

  -[SFDomainEngagementScore iFunScore](self, "iFunScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setIFunScore:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFDomainEngagementScore *v5;
  SFDomainEngagementScore *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (SFDomainEngagementScore *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFDomainEngagementScore isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFDomainEngagementScore domain](self, "domain");
      if (v7 != -[SFDomainEngagementScore domain](v6, "domain"))
      {
        v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[SFDomainEngagementScore scoreConfidence](self, "scoreConfidence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore scoreConfidence](v6, "scoreConfidence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[SFDomainEngagementScore scoreConfidence](self, "scoreConfidence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFDomainEngagementScore scoreConfidence](self, "scoreConfidence");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDomainEngagementScore scoreConfidence](v6, "scoreConfidence");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v11))
        {
          v12 = 0;
          goto LABEL_30;
        }
        v32 = v11;
      }
      -[SFDomainEngagementScore score](self, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore score](v6, "score");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        v12 = 0;
        goto LABEL_29;
      }
      -[SFDomainEngagementScore score](self, "score");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v26 = v13;
        -[SFDomainEngagementScore score](self, "score");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDomainEngagementScore score](v6, "score");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v12 = 0;
          v13 = v26;
          goto LABEL_27;
        }
        v30 = v16;
        v31 = v3;
        v13 = v26;
      }
      else
      {
        v30 = 0;
        v31 = v3;
      }
      -[SFDomainEngagementScore iFunScore](self, "iFunScore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDomainEngagementScore iFunScore](v6, "iFunScore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 == 0) == (v19 != 0))
      {

        v12 = 0;
        v16 = v30;
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
      else
      {
        v25 = v18;
        v27 = v19;
        -[SFDomainEngagementScore iFunScore](self, "iFunScore");
        v20 = objc_claimAutoreleasedReturnValue();
        v16 = v30;
        if (v20)
        {
          v24 = (void *)v20;
          -[SFDomainEngagementScore iFunScore](self, "iFunScore");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDomainEngagementScore iFunScore](v6, "iFunScore");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v23, "isEqual:");

        }
        else
        {

          v12 = 1;
        }
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
LABEL_27:

LABEL_28:
LABEL_29:
      v11 = v32;
      if (!v10)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    v12 = 0;
  }
LABEL_34:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SFDomainEngagementScore domain](self, "domain");
  -[SFDomainEngagementScore scoreConfidence](self, "scoreConfidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFDomainEngagementScore score](self, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFDomainEngagementScore iFunScore](self, "iFunScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (int)domain
{
  return self->_domain;
}

- (NSNumber)scoreConfidence
{
  return self->_scoreConfidence;
}

- (void)setScoreConfidence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)iFunScore
{
  return self->_iFunScore;
}

- (void)setIFunScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFunScore, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_scoreConfidence, 0);
}

@end
