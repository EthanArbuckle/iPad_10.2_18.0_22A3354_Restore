@implementation SFCoreSpotlightRankingSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wasNominatedAsTopHit = a3;
}

- (BOOL)hasWasNominatedAsTopHit
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isExactMatchOfLaunchString = a3;
}

- (BOOL)hasIsExactMatchOfLaunchString
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wasEngagedInSpotlight = a3;
}

- (BOOL)hasWasEngagedInSpotlight
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setResultQueryRecency:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resultQueryRecency = a3;
}

- (BOOL)hasResultQueryRecency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isSemanticMatch = a3;
}

- (BOOL)hasIsSemanticMatch
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isSyntacticMatch = a3;
}

- (BOOL)hasIsSyntacticMatch
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEmbeddingStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_embeddingStatus = a3;
}

- (BOOL)hasEmbeddingStatus
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setItemAgeInDays:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_itemAgeInDays = a3;
}

- (BOOL)hasItemAgeInDays
{
  return *(_BYTE *)&self->_has >> 7;
}

- (SFCoreSpotlightRankingSignals)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightRankingSignals *v6;
  SFCoreSpotlightRankingSignals *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCoreSpotlightRankingSignals initWithData:]([_SFPBCoreSpotlightRankingSignals alloc], "initWithData:", v5);
  v7 = -[SFCoreSpotlightRankingSignals initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCoreSpotlightRankingSignals *v6;

  v4 = a3;
  v6 = -[_SFPBCoreSpotlightRankingSignals initWithFacade:]([_SFPBCoreSpotlightRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightRankingSignals data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCoreSpotlightRankingSignals *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightRankingSignals initWithFacade:]([_SFPBCoreSpotlightRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightRankingSignals dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCoreSpotlightRankingSignals *v2;
  void *v3;

  v2 = -[_SFPBCoreSpotlightRankingSignals initWithFacade:]([_SFPBCoreSpotlightRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBCoreSpotlightRankingSignals jsonData](v2, "jsonData");
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTopicalityScore:", v6);

  -[SFCoreSpotlightRankingSignals freshness](self, "freshness");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFreshness:", v8);

  -[SFCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEngagementScore:", v10);

  -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPredictedLikelihoodOfEngagement:", v12);

  objc_msgSend(v4, "setWasNominatedAsTopHit:", -[SFCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit"));
  -[SFCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setSodiumL2Score:", v14);

  objc_msgSend(v4, "setIsExactMatchOfLaunchString:", -[SFCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"));
  objc_msgSend(v4, "setWasEngagedInSpotlight:", -[SFCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight"));
  objc_msgSend(v4, "setResultQueryRecency:", -[SFCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency"));
  -[SFCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPommesL2Score:", v16);

  objc_msgSend(v4, "setIsSemanticMatch:", -[SFCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch"));
  -[SFCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSemanticScore:", v18);

  objc_msgSend(v4, "setIsSyntacticMatch:", -[SFCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
  -[SFCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setSyntacticScore:", v20);

  objc_msgSend(v4, "setEmbeddingStatus:", -[SFCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus"));
  objc_msgSend(v4, "setItemAgeInDays:", -[SFCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCoreSpotlightRankingSignals *v4;
  SFCoreSpotlightRankingSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  int v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  v4 = (SFCoreSpotlightRankingSignals *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFCoreSpotlightRankingSignals isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals topicalityScore](v5, "topicalityScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v11 = 0;
LABEL_54:

        goto LABEL_55;
      }
      -[SFCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightRankingSignals topicalityScore](v5, "topicalityScore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v73 = v10;
        v74 = v9;
      }
      -[SFCoreSpotlightRankingSignals freshness](self, "freshness");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals freshness](v5, "freshness");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_50;
      -[SFCoreSpotlightRankingSignals freshness](self, "freshness");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[SFCoreSpotlightRankingSignals freshness](self, "freshness");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightRankingSignals freshness](v5, "freshness");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v15;
        if (!objc_msgSend(v15, "isEqual:", v70))
          goto LABEL_20;
      }
      v72 = v14;
      -[SFCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals engagementScore](v5, "engagementScore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
          goto LABEL_50;
        goto LABEL_20;
      }
      v67 = v16;
      v68 = v17;
      -[SFCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        -[SFCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightRankingSignals engagementScore](v5, "engagementScore");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v18;
        if (!objc_msgSend(v18, "isEqual:", v65))
        {
LABEL_48:

LABEL_49:
          if (v14)
          {
LABEL_20:

          }
LABEL_50:

          v11 = 0;
          if (!v8)
          {
LABEL_53:

            goto LABEL_54;
          }
          goto LABEL_51;
        }
      }
      -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](v5, "predictedLikelihoodOfEngagement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {

        goto LABEL_47;
      }
      v62 = v19;
      v63 = v20;
      -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](v5, "predictedLikelihoodOfEngagement");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v21;
        v22 = objc_msgSend(v21, "isEqual:");
        v14 = v72;
        if (!v22)
          goto LABEL_45;
      }
      v23 = -[SFCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit");
      if (v23 == -[SFCoreSpotlightRankingSignals wasNominatedAsTopHit](v5, "wasNominatedAsTopHit"))
      {
        -[SFCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCoreSpotlightRankingSignals sodiumL2Score](v5, "sodiumL2Score");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v24 == 0) != (v25 != 0))
        {
          v57 = v24;
          v58 = v25;
          -[SFCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
          v14 = v72;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            -[SFCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
            v26 = objc_claimAutoreleasedReturnValue();
            -[SFCoreSpotlightRankingSignals sodiumL2Score](v5, "sodiumL2Score");
            v27 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)v26;
            v28 = (void *)v26;
            v24 = (void *)v27;
            if (!objc_msgSend(v28, "isEqual:", v27))
              goto LABEL_42;
          }
          v29 = -[SFCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString");
          if (v29 == -[SFCoreSpotlightRankingSignals isExactMatchOfLaunchString](v5, "isExactMatchOfLaunchString"))
          {
            v30 = -[SFCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight");
            if (v30 == -[SFCoreSpotlightRankingSignals wasEngagedInSpotlight](v5, "wasEngagedInSpotlight"))
            {
              v31 = -[SFCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency");
              if (v31 == -[SFCoreSpotlightRankingSignals resultQueryRecency](v5, "resultQueryRecency"))
              {
                -[SFCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFCoreSpotlightRankingSignals pommesL2Score](v5, "pommesL2Score");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v55 == 0) != (v54 != 0))
                {
                  v53 = v24;
                  -[SFCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    -[SFCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCoreSpotlightRankingSignals pommesL2Score](v5, "pommesL2Score");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v33;
                    if (!objc_msgSend(v33, "isEqual:"))
                      goto LABEL_63;
                  }
                  v35 = -[SFCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch");
                  if (v35 == -[SFCoreSpotlightRankingSignals isSemanticMatch](v5, "isSemanticMatch"))
                  {
                    -[SFCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCoreSpotlightRankingSignals semanticScore](v5, "semanticScore");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v50 == 0) != (v49 != 0))
                    {
                      -[SFCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v48)
                      {
                        -[SFCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFCoreSpotlightRankingSignals semanticScore](v5, "semanticScore");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v47 = v36;
                        if (!objc_msgSend(v36, "isEqual:"))
                        {
                          v11 = 0;
LABEL_87:

LABEL_88:
                          if (v32)
                          {

                          }
                          if (v59)
                          {

                          }
                          if (v64)
                          {

                          }
                          if (v69)
                          {

                          }
                          if (v72)
                          {

                          }
                          if (!v8)
                            goto LABEL_53;
LABEL_51:
                          v10 = v73;
                          v9 = v74;
                          goto LABEL_52;
                        }
                      }
                      v37 = -[SFCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch");
                      if (v37 == -[SFCoreSpotlightRankingSignals isSyntacticMatch](v5, "isSyntacticMatch"))
                      {
                        -[SFCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFCoreSpotlightRankingSignals syntacticScore](v5, "syntacticScore");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v45 == 0) != (v44 != 0))
                        {
                          -[SFCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v43
                            || (-[SFCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore"),
                                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFCoreSpotlightRankingSignals syntacticScore](v5, "syntacticScore"),
                                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                                v42 = v38,
                                objc_msgSend(v38, "isEqual:")))
                          {
                            v39 = -[SFCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus");
                            if (v39 == -[SFCoreSpotlightRankingSignals embeddingStatus](v5, "embeddingStatus"))
                            {
                              v40 = -[SFCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays");
                              v11 = v40 == -[SFCoreSpotlightRankingSignals itemAgeInDays](v5, "itemAgeInDays");
                            }
                            else
                            {
                              v11 = 0;
                            }
                            if (!v43)
                              goto LABEL_85;
                          }
                          else
                          {
                            v11 = 0;
                          }

LABEL_85:
LABEL_86:
                          if (!v48)
                            goto LABEL_88;
                          goto LABEL_87;
                        }

                      }
                      v11 = 0;
                      goto LABEL_86;
                    }

                  }
                  if (!v32)
                  {
LABEL_64:

                    if (v59)
                    {

                    }
                    if (v64)
                    {

                    }
                    if (v69)
                    {

                    }
                    if (v72)
                    {

                    }
                    goto LABEL_50;
                  }
LABEL_63:

                  goto LABEL_64;
                }

              }
            }
          }
          v14 = v72;
          if (!v59)
          {
LABEL_43:

LABEL_44:
            if (!v64)
            {
LABEL_46:

LABEL_47:
              if (!v69)
                goto LABEL_49;
              goto LABEL_48;
            }
LABEL_45:

            goto LABEL_46;
          }
LABEL_42:

          goto LABEL_43;
        }

      }
      v14 = v72;
      goto LABEL_44;
    }
    v11 = 0;
  }
LABEL_55:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;

  -[SFCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v27, "hash");
  -[SFCoreSpotlightRankingSignals freshness](self, "freshness");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[SFCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit");
  -[SFCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ v10 ^ objc_msgSend(v11, "hash");
  v13 = -[SFCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString");
  v14 = v13 ^ -[SFCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight");
  v15 = v12 ^ v14 ^ -[SFCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency");
  -[SFCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  v18 = v17 ^ -[SFCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch");
  -[SFCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  v21 = v15 ^ v20 ^ -[SFCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch");
  -[SFCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  v24 = v23 ^ -[SFCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus");
  v25 = v21 ^ v24 ^ -[SFCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays");

  return v25;
}

- (NSNumber)topicalityScore
{
  return self->_topicalityScore;
}

- (void)setTopicalityScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)freshness
{
  return self->_freshness;
}

- (void)setFreshness:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)engagementScore
{
  return self->_engagementScore;
}

- (void)setEngagementScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (void)setPredictedLikelihoodOfEngagement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (NSNumber)sodiumL2Score
{
  return self->_sodiumL2Score;
}

- (void)setSodiumL2Score:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isExactMatchOfLaunchString
{
  return self->_isExactMatchOfLaunchString;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (int)resultQueryRecency
{
  return self->_resultQueryRecency;
}

- (NSNumber)pommesL2Score
{
  return self->_pommesL2Score;
}

- (void)setPommesL2Score:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (NSNumber)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (NSNumber)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSyntacticScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (unint64_t)itemAgeInDays
{
  return self->_itemAgeInDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntacticScore, 0);
  objc_storeStrong((id *)&self->_semanticScore, 0);
  objc_storeStrong((id *)&self->_pommesL2Score, 0);
  objc_storeStrong((id *)&self->_sodiumL2Score, 0);
  objc_storeStrong((id *)&self->_predictedLikelihoodOfEngagement, 0);
  objc_storeStrong((id *)&self->_engagementScore, 0);
  objc_storeStrong((id *)&self->_freshness, 0);
  objc_storeStrong((id *)&self->_topicalityScore, 0);
}

- (SFCoreSpotlightRankingSignals)initWithProtobuf:(id)a3
{
  id v4;
  SFCoreSpotlightRankingSignals *v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  SFCoreSpotlightRankingSignals *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFCoreSpotlightRankingSignals;
  v5 = -[SFCoreSpotlightRankingSignals init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "topicalityScore");
    if (v6 != 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "topicalityScore");
      objc_msgSend(v7, "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setTopicalityScore:](v5, "setTopicalityScore:", v8);

    }
    objc_msgSend(v4, "freshness");
    if (v9 != 0.0)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "freshness");
      objc_msgSend(v10, "numberWithFloat:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setFreshness:](v5, "setFreshness:", v11);

    }
    objc_msgSend(v4, "engagementScore");
    if (v12 != 0.0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "engagementScore");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setEngagementScore:](v5, "setEngagementScore:", v14);

    }
    objc_msgSend(v4, "predictedLikelihoodOfEngagement");
    if (v15 != 0.0)
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "predictedLikelihoodOfEngagement");
      objc_msgSend(v16, "numberWithFloat:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:", v17);

    }
    if (objc_msgSend(v4, "wasNominatedAsTopHit"))
      -[SFCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", objc_msgSend(v4, "wasNominatedAsTopHit"));
    objc_msgSend(v4, "sodiumL2Score");
    if (v18 != 0.0)
    {
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "sodiumL2Score");
      objc_msgSend(v19, "numberWithFloat:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setSodiumL2Score:](v5, "setSodiumL2Score:", v20);

    }
    if (objc_msgSend(v4, "isExactMatchOfLaunchString"))
      -[SFCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", objc_msgSend(v4, "isExactMatchOfLaunchString"));
    if (objc_msgSend(v4, "wasEngagedInSpotlight"))
      -[SFCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", objc_msgSend(v4, "wasEngagedInSpotlight"));
    if (objc_msgSend(v4, "resultQueryRecency"))
      -[SFCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", objc_msgSend(v4, "resultQueryRecency"));
    objc_msgSend(v4, "pommesL2Score");
    if (v21 != 0.0)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "pommesL2Score");
      objc_msgSend(v22, "numberWithFloat:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setPommesL2Score:](v5, "setPommesL2Score:", v23);

    }
    if (objc_msgSend(v4, "isSemanticMatch"))
      -[SFCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    objc_msgSend(v4, "semanticScore");
    if (v24 != 0.0)
    {
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "semanticScore");
      objc_msgSend(v25, "numberWithFloat:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setSemanticScore:](v5, "setSemanticScore:", v26);

    }
    if (objc_msgSend(v4, "isSyntacticMatch"))
      -[SFCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "syntacticScore");
    if (v27 != 0.0)
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "syntacticScore");
      objc_msgSend(v28, "numberWithFloat:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCoreSpotlightRankingSignals setSyntacticScore:](v5, "setSyntacticScore:", v29);

    }
    if (objc_msgSend(v4, "embeddingStatus"))
      -[SFCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", objc_msgSend(v4, "embeddingStatus"));
    if (objc_msgSend(v4, "itemAgeInDays"))
      -[SFCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", objc_msgSend(v4, "itemAgeInDays"));
    v30 = v5;
  }

  return v5;
}

@end
