@implementation _SFPBCoreSpotlightRankingSignals

- (_SFPBCoreSpotlightRankingSignals)initWithFacade:(id)a3
{
  id v4;
  _SFPBCoreSpotlightRankingSignals *v5;
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
  void *v21;
  _SFPBCoreSpotlightRankingSignals *v22;

  v4 = a3;
  v5 = -[_SFPBCoreSpotlightRankingSignals init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "topicalityScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "topicalityScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setTopicalityScore:](v5, "setTopicalityScore:");

    }
    objc_msgSend(v4, "freshness");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "freshness");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setFreshness:](v5, "setFreshness:");

    }
    objc_msgSend(v4, "engagementScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "engagementScore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setEngagementScore:](v5, "setEngagementScore:");

    }
    objc_msgSend(v4, "predictedLikelihoodOfEngagement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "predictedLikelihoodOfEngagement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");

    }
    if (objc_msgSend(v4, "hasWasNominatedAsTopHit"))
      -[_SFPBCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", objc_msgSend(v4, "wasNominatedAsTopHit"));
    objc_msgSend(v4, "sodiumL2Score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "sodiumL2Score");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSodiumL2Score:](v5, "setSodiumL2Score:");

    }
    if (objc_msgSend(v4, "hasIsExactMatchOfLaunchString"))
      -[_SFPBCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", objc_msgSend(v4, "isExactMatchOfLaunchString"));
    if (objc_msgSend(v4, "hasWasEngagedInSpotlight"))
      -[_SFPBCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", objc_msgSend(v4, "wasEngagedInSpotlight"));
    if (objc_msgSend(v4, "hasResultQueryRecency"))
      -[_SFPBCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", objc_msgSend(v4, "resultQueryRecency"));
    objc_msgSend(v4, "pommesL2Score");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "pommesL2Score");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setPommesL2Score:](v5, "setPommesL2Score:");

    }
    if (objc_msgSend(v4, "hasIsSemanticMatch"))
      -[_SFPBCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    objc_msgSend(v4, "semanticScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "semanticScore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSemanticScore:](v5, "setSemanticScore:");

    }
    if (objc_msgSend(v4, "hasIsSyntacticMatch"))
      -[_SFPBCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "syntacticScore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "syntacticScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");

    }
    if (objc_msgSend(v4, "hasEmbeddingStatus"))
      -[_SFPBCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", objc_msgSend(v4, "embeddingStatus"));
    if (objc_msgSend(v4, "hasItemAgeInDays"))
      -[_SFPBCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", objc_msgSend(v4, "itemAgeInDays"));
    v22 = v5;
  }

  return v5;
}

- (void)setTopicalityScore:(float)a3
{
  self->_topicalityScore = a3;
}

- (void)setFreshness:(float)a3
{
  self->_freshness = a3;
}

- (void)setEngagementScore:(float)a3
{
  self->_engagementScore = a3;
}

- (void)setPredictedLikelihoodOfEngagement:(float)a3
{
  self->_predictedLikelihoodOfEngagement = a3;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  self->_wasNominatedAsTopHit = a3;
}

- (void)setSodiumL2Score:(float)a3
{
  self->_sodiumL2Score = a3;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  self->_isExactMatchOfLaunchString = a3;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_wasEngagedInSpotlight = a3;
}

- (void)setResultQueryRecency:(int)a3
{
  self->_resultQueryRecency = a3;
}

- (void)setPommesL2Score:(float)a3
{
  self->_pommesL2Score = a3;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (void)setEmbeddingStatus:(int)a3
{
  self->_embeddingStatus = a3;
}

- (void)setItemAgeInDays:(unsigned int)a3
{
  self->_itemAgeInDays = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBCoreSpotlightRankingSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_SFPBCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBCoreSpotlightRankingSignals freshness](self, "freshness");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
  if (v9 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
  if (v10 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
  if (v11 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus"))
    PBDataWriterWriteInt32Field();
  v12 = -[_SFPBCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays");
  v13 = v14;
  if (v12)
  {
    PBDataWriterWriteUint32Field();
    v13 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float topicalityScore;
  float v6;
  float freshness;
  float v8;
  float engagementScore;
  float v10;
  float predictedLikelihoodOfEngagement;
  float v12;
  int wasNominatedAsTopHit;
  float sodiumL2Score;
  float v15;
  int isExactMatchOfLaunchString;
  int wasEngagedInSpotlight;
  int resultQueryRecency;
  float pommesL2Score;
  float v20;
  int isSemanticMatch;
  float semanticScore;
  float v23;
  int isSyntacticMatch;
  float syntacticScore;
  float v26;
  int embeddingStatus;
  unsigned int itemAgeInDays;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  topicalityScore = self->_topicalityScore;
  objc_msgSend(v4, "topicalityScore");
  if (topicalityScore != v6)
    goto LABEL_18;
  freshness = self->_freshness;
  objc_msgSend(v4, "freshness");
  if (freshness != v8)
    goto LABEL_18;
  engagementScore = self->_engagementScore;
  objc_msgSend(v4, "engagementScore");
  if (engagementScore != v10)
    goto LABEL_18;
  predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  objc_msgSend(v4, "predictedLikelihoodOfEngagement");
  if (predictedLikelihoodOfEngagement != v12)
    goto LABEL_18;
  wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  if (wasNominatedAsTopHit != objc_msgSend(v4, "wasNominatedAsTopHit"))
    goto LABEL_18;
  sodiumL2Score = self->_sodiumL2Score;
  objc_msgSend(v4, "sodiumL2Score");
  if (sodiumL2Score != v15)
    goto LABEL_18;
  isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  if (isExactMatchOfLaunchString != objc_msgSend(v4, "isExactMatchOfLaunchString"))
    goto LABEL_18;
  wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  if (wasEngagedInSpotlight != objc_msgSend(v4, "wasEngagedInSpotlight"))
    goto LABEL_18;
  resultQueryRecency = self->_resultQueryRecency;
  if (resultQueryRecency != objc_msgSend(v4, "resultQueryRecency"))
    goto LABEL_18;
  pommesL2Score = self->_pommesL2Score;
  objc_msgSend(v4, "pommesL2Score");
  if (pommesL2Score != v20)
    goto LABEL_18;
  isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch == objc_msgSend(v4, "isSemanticMatch")
    && (semanticScore = self->_semanticScore, objc_msgSend(v4, "semanticScore"), semanticScore == v23)
    && (isSyntacticMatch = self->_isSyntacticMatch,
        isSyntacticMatch == objc_msgSend(v4, "isSyntacticMatch"))
    && (syntacticScore = self->_syntacticScore, objc_msgSend(v4, "syntacticScore"), syntacticScore == v26)
    && (embeddingStatus = self->_embeddingStatus, embeddingStatus == objc_msgSend(v4, "embeddingStatus")))
  {
    itemAgeInDays = self->_itemAgeInDays;
    v29 = itemAgeInDays == objc_msgSend(v4, "itemAgeInDays");
  }
  else
  {
LABEL_18:
    v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  float topicalityScore;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float freshness;
  BOOL v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float engagementScore;
  BOOL v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  float predictedLikelihoodOfEngagement;
  BOOL v25;
  double v26;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  _BOOL4 wasNominatedAsTopHit;
  float sodiumL2Score;
  BOOL v33;
  double v34;
  double v35;
  long double v36;
  double v37;
  unint64_t v38;
  _BOOL4 isExactMatchOfLaunchString;
  _BOOL4 wasEngagedInSpotlight;
  float pommesL2Score;
  BOOL v42;
  double v43;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  _BOOL4 isSemanticMatch;
  float semanticScore;
  BOOL v50;
  double v51;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _BOOL4 isSyntacticMatch;
  float syntacticScore;
  BOOL v60;
  double v61;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t resultQueryRecency;
  _BOOL4 v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;

  topicalityScore = self->_topicalityScore;
  v4 = topicalityScore < 0.0;
  if (topicalityScore == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = topicalityScore;
    v6 = -v5;
    if (!v4)
      v6 = v5;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  freshness = self->_freshness;
  v11 = freshness < 0.0;
  if (freshness == 0.0)
  {
    v16 = 0;
  }
  else
  {
    v12 = freshness;
    v13 = -v12;
    if (!v11)
      v13 = v12;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v16 += (unint64_t)v15;
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  engagementScore = self->_engagementScore;
  v18 = engagementScore < 0.0;
  if (engagementScore == 0.0)
  {
    v23 = 0;
  }
  else
  {
    v19 = engagementScore;
    v20 = -v19;
    if (!v18)
      v20 = v19;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v23 += (unint64_t)v22;
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  v25 = predictedLikelihoodOfEngagement < 0.0;
  if (predictedLikelihoodOfEngagement == 0.0)
  {
    v30 = 0;
  }
  else
  {
    v26 = predictedLikelihoodOfEngagement;
    v27 = -v26;
    if (!v25)
      v27 = v26;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v30 += (unint64_t)v29;
    }
    else
    {
      v30 -= (unint64_t)fabs(v29);
    }
  }
  wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  sodiumL2Score = self->_sodiumL2Score;
  v33 = sodiumL2Score < 0.0;
  v76 = v9;
  if (sodiumL2Score == 0.0)
  {
    v38 = 0;
  }
  else
  {
    v34 = sodiumL2Score;
    v35 = -v34;
    if (!v33)
      v35 = v34;
    v36 = floor(v35 + 0.5);
    v37 = (v35 - v36) * 1.84467441e19;
    v38 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0)
        v38 += (unint64_t)v37;
    }
    else
    {
      v38 -= (unint64_t)fabs(v37);
    }
  }
  isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  pommesL2Score = self->_pommesL2Score;
  v42 = pommesL2Score < 0.0;
  v74 = v16;
  v75 = v30;
  v73 = wasNominatedAsTopHit;
  resultQueryRecency = self->_resultQueryRecency;
  if (pommesL2Score == 0.0)
  {
    v47 = 0;
  }
  else
  {
    v43 = pommesL2Score;
    v44 = -v43;
    if (!v42)
      v44 = v43;
    v45 = floor(v44 + 0.5);
    v46 = (v44 - v45) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0)
        v47 += (unint64_t)v46;
    }
    else
    {
      v47 -= (unint64_t)fabs(v46);
    }
  }
  isSemanticMatch = self->_isSemanticMatch;
  semanticScore = self->_semanticScore;
  v50 = semanticScore < 0.0;
  if (semanticScore == 0.0)
  {
    v56 = v38;
    v57 = v23;
    v55 = 0;
  }
  else
  {
    v51 = semanticScore;
    v52 = -v51;
    if (!v50)
      v52 = v51;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    v56 = v38;
    v57 = v23;
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v55 += (unint64_t)v54;
    }
    else
    {
      v55 -= (unint64_t)fabs(v54);
    }
  }
  isSyntacticMatch = self->_isSyntacticMatch;
  syntacticScore = self->_syntacticScore;
  v60 = syntacticScore < 0.0;
  if (syntacticScore == 0.0)
  {
    v65 = 0;
  }
  else
  {
    v61 = syntacticScore;
    v62 = -v61;
    if (!v60)
      v62 = v61;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v65 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v65 += (unint64_t)v64;
    }
    else
    {
      v65 -= (unint64_t)fabs(v64);
    }
  }
  if (isSyntacticMatch)
    v66 = 2654435761;
  else
    v66 = 0;
  if (isSemanticMatch)
    v67 = 2654435761;
  else
    v67 = 0;
  if (wasEngagedInSpotlight)
    v68 = 2654435761;
  else
    v68 = 0;
  if (isExactMatchOfLaunchString)
    v69 = 2654435761;
  else
    v69 = 0;
  if (v73)
    v70 = 2654435761;
  else
    v70 = 0;
  return v74 ^ v76 ^ v57 ^ v75 ^ v56 ^ v70 ^ v69 ^ v68 ^ v47 ^ (2654435761 * resultQueryRecency) ^ v67 ^ v55 ^ v66 ^ v65 ^ (2654435761 * self->_embeddingStatus) ^ (2654435761 * self->_itemAgeInDays);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_embeddingStatus)
  {
    v4 = -[_SFPBCoreSpotlightRankingSignals embeddingStatus](self, "embeddingStatus");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4042178 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("embeddingStatus"));

  }
  if (self->_engagementScore != 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals engagementScore](self, "engagementScore");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("engagementScore"));

  }
  if (self->_freshness != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals freshness](self, "freshness");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("freshness"));

  }
  if (self->_isExactMatchOfLaunchString)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isExactMatchOfLaunchString](self, "isExactMatchOfLaunchString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isExactMatchOfLaunchString"));

  }
  if (self->_isSemanticMatch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isSemanticMatch](self, "isSemanticMatch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isSemanticMatch"));

  }
  if (self->_isSyntacticMatch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isSyntacticMatch"));

  }
  if (self->_itemAgeInDays)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBCoreSpotlightRankingSignals itemAgeInDays](self, "itemAgeInDays"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("itemAgeInDays"));

  }
  if (self->_pommesL2Score != 0.0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals pommesL2Score](self, "pommesL2Score");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pommesL2Score"));

  }
  if (self->_predictedLikelihoodOfEngagement != 0.0)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals predictedLikelihoodOfEngagement](self, "predictedLikelihoodOfEngagement");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("predictedLikelihoodOfEngagement"));

  }
  if (self->_resultQueryRecency)
  {
    v18 = -[_SFPBCoreSpotlightRankingSignals resultQueryRecency](self, "resultQueryRecency");
    if (v18 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E4042130 + v18);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("resultQueryRecency"));

  }
  if (self->_semanticScore != 0.0)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals semanticScore](self, "semanticScore");
    objc_msgSend(v20, "numberWithFloat:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("semanticScore"));

  }
  if (self->_sodiumL2Score != 0.0)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals sodiumL2Score](self, "sodiumL2Score");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("sodiumL2Score"));

  }
  if (self->_syntacticScore != 0.0)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals syntacticScore](self, "syntacticScore");
    objc_msgSend(v24, "numberWithFloat:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("syntacticScore"));

  }
  if (self->_topicalityScore != 0.0)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBCoreSpotlightRankingSignals topicalityScore](self, "topicalityScore");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("topicalityScore"));

  }
  if (self->_wasEngagedInSpotlight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals wasEngagedInSpotlight](self, "wasEngagedInSpotlight"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("wasEngagedInSpotlight"));

  }
  if (self->_wasNominatedAsTopHit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCoreSpotlightRankingSignals wasNominatedAsTopHit](self, "wasNominatedAsTopHit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("wasNominatedAsTopHit"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCoreSpotlightRankingSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCoreSpotlightRankingSignals)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCoreSpotlightRankingSignals *v5;
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
    self = -[_SFPBCoreSpotlightRankingSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCoreSpotlightRankingSignals)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCoreSpotlightRankingSignals *v5;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _SFPBCoreSpotlightRankingSignals *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SFPBCoreSpotlightRankingSignals;
  v5 = -[_SFPBCoreSpotlightRankingSignals init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topicalityScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setTopicalityScore:](v5, "setTopicalityScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("freshness"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setFreshness:](v5, "setFreshness:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setEngagementScore:](v5, "setEngagementScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictedLikelihoodOfEngagement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");
    }
    v32 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasNominatedAsTopHit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", objc_msgSend(v10, "BOOLValue"));
    v11 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sodiumL2Score"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSodiumL2Score:](v5, "setSodiumL2Score:");
    }
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchOfLaunchString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasEngagedInSpotlight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", objc_msgSend(v15, "BOOLValue"));
    v34 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultQueryRecency"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setResultQueryRecency:](v5, "setResultQueryRecency:", objc_msgSend(v16, "intValue"));
    v33 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesL2Score"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setPommesL2Score:](v5, "setPommesL2Score:");
    }
    v27 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSemanticMatch"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v18, "BOOLValue"));
    v31 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticScore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSemanticScore:](v5, "setSemanticScore:");
    }
    v30 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSyntacticMatch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v20, "BOOLValue"));
    v28 = v16;
    v29 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syntacticScore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      -[_SFPBCoreSpotlightRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");
    }
    v22 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embeddingStatus"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setEmbeddingStatus:](v5, "setEmbeddingStatus:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemAgeInDays"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCoreSpotlightRankingSignals setItemAgeInDays:](v5, "setItemAgeInDays:", objc_msgSend(v24, "unsignedIntValue"));
    v25 = v5;

  }
  return v5;
}

- (float)topicalityScore
{
  return self->_topicalityScore;
}

- (float)freshness
{
  return self->_freshness;
}

- (float)engagementScore
{
  return self->_engagementScore;
}

- (float)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (float)sodiumL2Score
{
  return self->_sodiumL2Score;
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

- (float)pommesL2Score
{
  return self->_pommesL2Score;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (unsigned)itemAgeInDays
{
  return self->_itemAgeInDays;
}

@end
