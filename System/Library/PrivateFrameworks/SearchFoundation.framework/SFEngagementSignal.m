@implementation SFEngagementSignal

- (SFEngagementSignal)initWithVersion:(id)a3 serverScore:(id)a4 severScoreConfidence:(id)a5 localScore:(id)a6 localScoreConfidence:(id)a7 domainScores:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SFEngagementSignal *v20;
  SFEngagementSignal *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SFEngagementSignal;
  v20 = -[SFEngagementSignal init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[SFEngagementSignal setVersion:](v20, "setVersion:", v14);
    -[SFEngagementSignal setServerScore:](v21, "setServerScore:", v15);
    -[SFEngagementSignal setServerScoreConfidence:](v21, "setServerScoreConfidence:", v16);
    -[SFEngagementSignal setLocalScore:](v21, "setLocalScore:", v17);
    -[SFEngagementSignal setLocalScoreConfidence:](v21, "setLocalScoreConfidence:", v18);
    -[SFEngagementSignal setDomainEngagementScores:](v21, "setDomainEngagementScores:", v19);
  }

  return v21;
}

- (SFEngagementSignal)initWithProtobuf:(id)a3
{
  id v4;
  SFEngagementSignal *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  SFDomainEngagementScore *v22;
  SFEngagementSignal *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SFEngagementSignal;
  v5 = -[SFEngagementSignal init](&v29, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "version"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal setVersion:](v5, "setVersion:", v6);

    }
    objc_msgSend(v4, "serverScore");
    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "serverScore");
      objc_msgSend(v8, "numberWithFloat:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal setServerScore:](v5, "setServerScore:", v9);

    }
    objc_msgSend(v4, "localScore");
    if (v10 != 0.0)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "localScore");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal setLocalScore:](v5, "setLocalScore:", v12);

    }
    if (objc_msgSend(v4, "serverScoreConfidence"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "serverScoreConfidence"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal setServerScoreConfidence:](v5, "setServerScoreConfidence:", v13);

    }
    if (objc_msgSend(v4, "localScoreConfidence"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "localScoreConfidence"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal setLocalScoreConfidence:](v5, "setLocalScoreConfidence:", v14);

    }
    objc_msgSend(v4, "domainEngagementScores");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v16 = 0;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "domainEngagementScores", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = -[SFDomainEngagementScore initWithProtobuf:]([SFDomainEngagementScore alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v19);
    }

    -[SFEngagementSignal setDomainEngagementScores:](v5, "setDomainEngagementScores:", v16);
    v23 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFEngagementSignal)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBEngagementSignal *v6;
  SFEngagementSignal *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBEngagementSignal initWithData:]([_SFPBEngagementSignal alloc], "initWithData:", v5);
  v7 = -[SFEngagementSignal initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBEngagementSignal *v6;

  v4 = a3;
  v6 = -[_SFPBEngagementSignal initWithFacade:]([_SFPBEngagementSignal alloc], "initWithFacade:", self);
  -[_SFPBEngagementSignal data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBEngagementSignal *v2;
  void *v3;

  v2 = -[_SFPBEngagementSignal initWithFacade:]([_SFPBEngagementSignal alloc], "initWithFacade:", self);
  -[_SFPBEngagementSignal dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBEngagementSignal *v2;
  void *v3;

  v2 = -[_SFPBEngagementSignal initWithFacade:]([_SFPBEngagementSignal alloc], "initWithFacade:", self);
  -[_SFPBEngagementSignal jsonData](v2, "jsonData");
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFEngagementSignal version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setVersion:", v6);

  -[SFEngagementSignal serverScore](self, "serverScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setServerScore:", v8);

  -[SFEngagementSignal localScore](self, "localScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLocalScore:", v10);

  -[SFEngagementSignal serverScoreConfidence](self, "serverScoreConfidence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setServerScoreConfidence:", v12);

  -[SFEngagementSignal localScoreConfidence](self, "localScoreConfidence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setLocalScoreConfidence:", v14);

  -[SFEngagementSignal domainEngagementScores](self, "domainEngagementScores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setDomainEngagementScores:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFEngagementSignal *v5;
  SFEngagementSignal *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v5 = (SFEngagementSignal *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFEngagementSignal isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFEngagementSignal version](self, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal version](v6, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_36:

        goto LABEL_37;
      }
      -[SFEngagementSignal version](self, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFEngagementSignal version](self, "version");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEngagementSignal version](v6, "version");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_34;
        }
        v54 = v10;
      }
      -[SFEngagementSignal serverScore](self, "serverScore");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal serverScore](v6, "serverScore");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v56 == 0) == (v55 != 0))
        goto LABEL_32;
      -[SFEngagementSignal serverScore](self, "serverScore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SFEngagementSignal serverScore](self, "serverScore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEngagementSignal serverScore](v6, "serverScore");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
        {

LABEL_31:
LABEL_32:

          v11 = 0;
          goto LABEL_33;
        }
        v51 = v13;
        v53 = v8;
        v14 = v57;
        v15 = v12;
      }
      else
      {
        v53 = v8;
        v14 = v57;
        v15 = 0;
      }
      v52 = v3;
      v57 = v14;
      -[SFEngagementSignal localScore](self, "localScore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFEngagementSignal localScore](v6, "localScore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v8 = v53;
      if ((v16 == 0) != (v17 != 0))
      {
        v50 = v17;
        -[SFEngagementSignal localScore](self, "localScore");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          -[SFEngagementSignal localScore](self, "localScore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFEngagementSignal localScore](v6, "localScore");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v24 = v49;
            goto LABEL_56;
          }
          v48 = v15;
        }
        else
        {
          v48 = v15;
        }
        -[SFEngagementSignal serverScoreConfidence](self, "serverScoreConfidence");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFEngagementSignal serverScoreConfidence](v6, "serverScoreConfidence");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) != (v20 != 0))
        {
          v45 = v20;
          -[SFEngagementSignal serverScoreConfidence](self, "serverScoreConfidence");
          v12 = v48;
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v19;
          if (v43)
          {
            -[SFEngagementSignal serverScoreConfidence](self, "serverScoreConfidence");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFEngagementSignal serverScoreConfidence](v6, "serverScoreConfidence");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              v11 = 0;
              v22 = (void *)v43;
LABEL_54:

LABEL_55:
              v24 = v49;
              if (!v49)
              {
LABEL_57:

                if (v12)
                {

                }
LABEL_33:
                v10 = v54;
                if (!v9)
                {
LABEL_35:

                  goto LABEL_36;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_56:

              goto LABEL_57;
            }
          }
          -[SFEngagementSignal localScoreConfidence](self, "localScoreConfidence");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFEngagementSignal localScoreConfidence](v6, "localScoreConfidence");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v25 == 0) == (v26 != 0))
          {

            v11 = 0;
            v12 = v48;
            goto LABEL_53;
          }
          v39 = v25;
          v40 = v26;
          -[SFEngagementSignal localScoreConfidence](self, "localScoreConfidence");
          v12 = v48;
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38
            && (-[SFEngagementSignal localScoreConfidence](self, "localScoreConfidence"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFEngagementSignal localScoreConfidence](v6, "localScoreConfidence"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v37 = v27,
                !objc_msgSend(v27, "isEqual:")))
          {
            v11 = 0;
            v32 = (void *)v38;
          }
          else
          {
            -[SFEngagementSignal domainEngagementScores](self, "domainEngagementScores");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFEngagementSignal domainEngagementScores](v6, "domainEngagementScores");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 == 0) == (v29 != 0))
            {

              v11 = 0;
              v12 = v48;
            }
            else
            {
              v35 = v29;
              -[SFEngagementSignal domainEngagementScores](self, "domainEngagementScores");
              v30 = objc_claimAutoreleasedReturnValue();
              v12 = v48;
              if (v30)
              {
                v34 = (void *)v30;
                -[SFEngagementSignal domainEngagementScores](self, "domainEngagementScores");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFEngagementSignal domainEngagementScores](v6, "domainEngagementScores");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v33, "isEqual:");

              }
              else
              {

                v11 = 1;
              }
            }
            v32 = (void *)v38;
            if (!v38)
              goto LABEL_52;
          }

LABEL_52:
LABEL_53:
          v22 = (void *)v43;
          if (!v43)
            goto LABEL_55;
          goto LABEL_54;
        }

        v12 = v48;
        if (v49)
        {

        }
        v17 = v50;
      }

      if (v12)
      {

      }
      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[SFEngagementSignal version](self, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFEngagementSignal serverScore](self, "serverScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFEngagementSignal localScore](self, "localScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFEngagementSignal serverScoreConfidence](self, "serverScoreConfidence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFEngagementSignal localScoreConfidence](self, "localScoreConfidence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SFEngagementSignal domainEngagementScores](self, "domainEngagementScores");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)serverScore
{
  return self->_serverScore;
}

- (void)setServerScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)localScore
{
  return self->_localScore;
}

- (void)setLocalScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)serverScoreConfidence
{
  return self->_serverScoreConfidence;
}

- (void)setServerScoreConfidence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)localScoreConfidence
{
  return self->_localScoreConfidence;
}

- (void)setLocalScoreConfidence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)domainEngagementScores
{
  return self->_domainEngagementScores;
}

- (void)setDomainEngagementScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainEngagementScores, 0);
  objc_storeStrong((id *)&self->_localScoreConfidence, 0);
  objc_storeStrong((id *)&self->_serverScoreConfidence, 0);
  objc_storeStrong((id *)&self->_localScore, 0);
  objc_storeStrong((id *)&self->_serverScore, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
