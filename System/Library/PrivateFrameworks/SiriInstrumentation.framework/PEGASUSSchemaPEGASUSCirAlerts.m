@implementation PEGASUSSchemaPEGASUSCirAlerts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCirAlert
{
  return self->_cirAlert != 0;
}

- (void)deleteCirAlert
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlert:](self, "setCirAlert:", 0);
}

- (BOOL)hasCirAlertContext
{
  return self->_cirAlertContext != 0;
}

- (void)deleteCirAlertContext
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertContext:](self, "setCirAlertContext:", 0);
}

- (BOOL)hasCirAlertDictionaryOverKgBoost
{
  return self->_cirAlertDictionaryOverKgBoost != 0;
}

- (void)deleteCirAlertDictionaryOverKgBoost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertDictionaryOverKgBoost:](self, "setCirAlertDictionaryOverKgBoost:", 0);
}

- (BOOL)hasCirAlertDomainFallback
{
  return self->_cirAlertDomainFallback != 0;
}

- (void)deleteCirAlertDomainFallback
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertDomainFallback:](self, "setCirAlertDomainFallback:", 0);
}

- (BOOL)hasCirAlertEmergencyOverride
{
  return self->_cirAlertEmergencyOverride != 0;
}

- (void)deleteCirAlertEmergencyOverride
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertEmergencyOverride:](self, "setCirAlertEmergencyOverride:", 0);
}

- (BOOL)hasCirAlertKgWaBoost
{
  return self->_cirAlertKgWaBoost != 0;
}

- (void)deleteCirAlertKgWaBoost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoost:](self, "setCirAlertKgWaBoost:", 0);
}

- (BOOL)hasCirAlertKgWaBoostQa
{
  return self->_cirAlertKgWaBoostQa != 0;
}

- (void)deleteCirAlertKgWaBoostQa
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostQa:](self, "setCirAlertKgWaBoostQa:", 0);
}

- (BOOL)hasCirAlertKgWaBoostWebPost
{
  return self->_cirAlertKgWaBoostWebPost != 0;
}

- (void)deleteCirAlertKgWaBoostWebPost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostWebPost:](self, "setCirAlertKgWaBoostWebPost:", 0);
}

- (BOOL)hasCirAlertKgWaBoostWebPre
{
  return self->_cirAlertKgWaBoostWebPre != 0;
}

- (void)deleteCirAlertKgWaBoostWebPre
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostWebPre:](self, "setCirAlertKgWaBoostWebPre:", 0);
}

- (BOOL)hasCirAlertMapsKgSwap
{
  return self->_cirAlertMapsKgSwap != 0;
}

- (void)deleteCirAlertMapsKgSwap
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertMapsKgSwap:](self, "setCirAlertMapsKgSwap:", 0);
}

- (BOOL)hasCirAlertMediaPodcastOverride
{
  return self->_cirAlertMediaPodcastOverride != 0;
}

- (void)deleteCirAlertMediaPodcastOverride
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertMediaPodcastOverride:](self, "setCirAlertMediaPodcastOverride:", 0);
}

- (BOOL)hasCirAlertProfaneFilter
{
  return self->_cirAlertProfaneFilter != 0;
}

- (void)deleteCirAlertProfaneFilter
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertProfaneFilter:](self, "setCirAlertProfaneFilter:", 0);
}

- (BOOL)hasCirAlertRespectIsFollowUpHeuristicFlag
{
  return self->_cirAlertRespectIsFollowUpHeuristicFlag != 0;
}

- (void)deleteCirAlertRespectIsFollowUpHeuristicFlag
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectIsFollowUpHeuristicFlag:](self, "setCirAlertRespectIsFollowUpHeuristicFlag:", 0);
}

- (BOOL)hasCirAlertRespectMultiTurnResolvedRankingFlag
{
  return self->_cirAlertRespectMultiTurnResolvedRankingFlag != 0;
}

- (void)deleteCirAlertRespectMultiTurnResolvedRankingFlag
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectMultiTurnResolvedRankingFlag:](self, "setCirAlertRespectMultiTurnResolvedRankingFlag:", 0);
}

- (BOOL)hasCirAlertRespectScoreOverrides
{
  return self->_cirAlertRespectScoreOverrides != 0;
}

- (void)deleteCirAlertRespectScoreOverrides
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectScoreOverrides:](self, "setCirAlertRespectScoreOverrides:", 0);
}

- (BOOL)hasCirAlertVerblessQueriesKgBoost
{
  return self->_cirAlertVerblessQueriesKgBoost != 0;
}

- (void)deleteCirAlertVerblessQueriesKgBoost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertVerblessQueriesKgBoost:](self, "setCirAlertVerblessQueriesKgBoost:", 0);
}

- (BOOL)hasCirAlertVideoMediaBoost
{
  return self->_cirAlertVideoMediaBoost != 0;
}

- (void)deleteCirAlertVideoMediaBoost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertVideoMediaBoost:](self, "setCirAlertVideoMediaBoost:", 0);
}

- (BOOL)hasCirAlertWaBoost
{
  return self->_cirAlertWaBoost != 0;
}

- (void)deleteCirAlertWaBoost
{
  -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertWaBoost:](self, "setCirAlertWaBoost:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSCirAlertsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
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
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlert](self, "cirAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertContext](self, "cirAlertContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDictionaryOverKgBoost](self, "cirAlertDictionaryOverKgBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDomainFallback](self, "cirAlertDomainFallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertEmergencyOverride](self, "cirAlertEmergencyOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoost](self, "cirAlertKgWaBoost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostQa](self, "cirAlertKgWaBoostQa");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPost](self, "cirAlertKgWaBoostWebPost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPre](self, "cirAlertKgWaBoostWebPre");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMapsKgSwap](self, "cirAlertMapsKgSwap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMediaPodcastOverride](self, "cirAlertMediaPodcastOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertProfaneFilter](self, "cirAlertProfaneFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectIsFollowUpHeuristicFlag](self, "cirAlertRespectIsFollowUpHeuristicFlag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectMultiTurnResolvedRankingFlag](self, "cirAlertRespectMultiTurnResolvedRankingFlag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectScoreOverrides](self, "cirAlertRespectScoreOverrides");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVerblessQueriesKgBoost](self, "cirAlertVerblessQueriesKgBoost");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVideoMediaBoost](self, "cirAlertVideoMediaBoost");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertWaBoost](self, "cirAlertWaBoost");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v23;
  if (v21)
  {
    PBDataWriterWriteStringField();
    v22 = v23;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  BOOL v97;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_92;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlert](self, "cirAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlert](self, "cirAlert");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlert](self, "cirAlert");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertContext](self, "cirAlertContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertContext](self, "cirAlertContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertContext](self, "cirAlertContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDictionaryOverKgBoost](self, "cirAlertDictionaryOverKgBoost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertDictionaryOverKgBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDictionaryOverKgBoost](self, "cirAlertDictionaryOverKgBoost");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDictionaryOverKgBoost](self, "cirAlertDictionaryOverKgBoost");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertDictionaryOverKgBoost");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDomainFallback](self, "cirAlertDomainFallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertDomainFallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDomainFallback](self, "cirAlertDomainFallback");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDomainFallback](self, "cirAlertDomainFallback");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertDomainFallback");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertEmergencyOverride](self, "cirAlertEmergencyOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertEmergencyOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertEmergencyOverride](self, "cirAlertEmergencyOverride");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertEmergencyOverride](self, "cirAlertEmergencyOverride");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertEmergencyOverride");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoost](self, "cirAlertKgWaBoost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertKgWaBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoost](self, "cirAlertKgWaBoost");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoost](self, "cirAlertKgWaBoost");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertKgWaBoost");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostQa](self, "cirAlertKgWaBoostQa");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertKgWaBoostQa");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostQa](self, "cirAlertKgWaBoostQa");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostQa](self, "cirAlertKgWaBoostQa");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertKgWaBoostQa");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPost](self, "cirAlertKgWaBoostWebPost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertKgWaBoostWebPost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPost](self, "cirAlertKgWaBoostWebPost");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPost](self, "cirAlertKgWaBoostWebPost");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertKgWaBoostWebPost");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPre](self, "cirAlertKgWaBoostWebPre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertKgWaBoostWebPre");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPre](self, "cirAlertKgWaBoostWebPre");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPre](self, "cirAlertKgWaBoostWebPre");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertKgWaBoostWebPre");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMapsKgSwap](self, "cirAlertMapsKgSwap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertMapsKgSwap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMapsKgSwap](self, "cirAlertMapsKgSwap");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMapsKgSwap](self, "cirAlertMapsKgSwap");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertMapsKgSwap");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMediaPodcastOverride](self, "cirAlertMediaPodcastOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertMediaPodcastOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMediaPodcastOverride](self, "cirAlertMediaPodcastOverride");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMediaPodcastOverride](self, "cirAlertMediaPodcastOverride");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertMediaPodcastOverride");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertProfaneFilter](self, "cirAlertProfaneFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertProfaneFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertProfaneFilter](self, "cirAlertProfaneFilter");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertProfaneFilter](self, "cirAlertProfaneFilter");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertProfaneFilter");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectIsFollowUpHeuristicFlag](self, "cirAlertRespectIsFollowUpHeuristicFlag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertRespectIsFollowUpHeuristicFlag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectIsFollowUpHeuristicFlag](self, "cirAlertRespectIsFollowUpHeuristicFlag");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectIsFollowUpHeuristicFlag](self, "cirAlertRespectIsFollowUpHeuristicFlag");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertRespectIsFollowUpHeuristicFlag");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectMultiTurnResolvedRankingFlag](self, "cirAlertRespectMultiTurnResolvedRankingFlag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertRespectMultiTurnResolvedRankingFlag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectMultiTurnResolvedRankingFlag](self, "cirAlertRespectMultiTurnResolvedRankingFlag");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectMultiTurnResolvedRankingFlag](self, "cirAlertRespectMultiTurnResolvedRankingFlag");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertRespectMultiTurnResolvedRankingFlag");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectScoreOverrides](self, "cirAlertRespectScoreOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertRespectScoreOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectScoreOverrides](self, "cirAlertRespectScoreOverrides");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectScoreOverrides](self, "cirAlertRespectScoreOverrides");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertRespectScoreOverrides");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVerblessQueriesKgBoost](self, "cirAlertVerblessQueriesKgBoost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertVerblessQueriesKgBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVerblessQueriesKgBoost](self, "cirAlertVerblessQueriesKgBoost");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVerblessQueriesKgBoost](self, "cirAlertVerblessQueriesKgBoost");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertVerblessQueriesKgBoost");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVideoMediaBoost](self, "cirAlertVideoMediaBoost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertVideoMediaBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_91;
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVideoMediaBoost](self, "cirAlertVideoMediaBoost");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVideoMediaBoost](self, "cirAlertVideoMediaBoost");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertVideoMediaBoost");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_92;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSCirAlerts cirAlertWaBoost](self, "cirAlertWaBoost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cirAlertWaBoost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertWaBoost](self, "cirAlertWaBoost");
    v92 = objc_claimAutoreleasedReturnValue();
    if (!v92)
    {

LABEL_95:
      v97 = 1;
      goto LABEL_93;
    }
    v93 = (void *)v92;
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertWaBoost](self, "cirAlertWaBoost");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cirAlertWaBoost");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if ((v96 & 1) != 0)
      goto LABEL_95;
  }
  else
  {
LABEL_91:

  }
LABEL_92:
  v97 = 0;
LABEL_93:

  return v97;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;

  v3 = -[NSString hash](self->_cirAlert, "hash");
  v4 = -[NSString hash](self->_cirAlertContext, "hash") ^ v3;
  v5 = -[NSString hash](self->_cirAlertDictionaryOverKgBoost, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_cirAlertDomainFallback, "hash");
  v7 = -[NSString hash](self->_cirAlertEmergencyOverride, "hash");
  v8 = v7 ^ -[NSString hash](self->_cirAlertKgWaBoost, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_cirAlertKgWaBoostQa, "hash");
  v10 = -[NSString hash](self->_cirAlertKgWaBoostWebPost, "hash");
  v11 = v10 ^ -[NSString hash](self->_cirAlertKgWaBoostWebPre, "hash");
  v12 = v11 ^ -[NSString hash](self->_cirAlertMapsKgSwap, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_cirAlertMediaPodcastOverride, "hash");
  v14 = -[NSString hash](self->_cirAlertProfaneFilter, "hash");
  v15 = v14 ^ -[NSString hash](self->_cirAlertRespectIsFollowUpHeuristicFlag, "hash");
  v16 = v15 ^ -[NSString hash](self->_cirAlertRespectMultiTurnResolvedRankingFlag, "hash");
  v17 = v16 ^ -[NSString hash](self->_cirAlertRespectScoreOverrides, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_cirAlertVerblessQueriesKgBoost, "hash");
  v19 = -[NSString hash](self->_cirAlertVideoMediaBoost, "hash");
  return v18 ^ v19 ^ -[NSString hash](self->_cirAlertWaBoost, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  void *v21;
  void *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cirAlert)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlert](self, "cirAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cirAlert"));

  }
  if (self->_cirAlertContext)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertContext](self, "cirAlertContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cirAlertContext"));

  }
  if (self->_cirAlertDictionaryOverKgBoost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDictionaryOverKgBoost](self, "cirAlertDictionaryOverKgBoost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cirAlertDictionaryOverKgBoost"));

  }
  if (self->_cirAlertDomainFallback)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertDomainFallback](self, "cirAlertDomainFallback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cirAlertDomainFallback"));

  }
  if (self->_cirAlertEmergencyOverride)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertEmergencyOverride](self, "cirAlertEmergencyOverride");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cirAlertEmergencyOverride"));

  }
  if (self->_cirAlertKgWaBoost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoost](self, "cirAlertKgWaBoost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cirAlertKgWaBoost"));

  }
  if (self->_cirAlertKgWaBoostQa)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostQa](self, "cirAlertKgWaBoostQa");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("cirAlertKgWaBoostQa"));

  }
  if (self->_cirAlertKgWaBoostWebPost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPost](self, "cirAlertKgWaBoostWebPost");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("cirAlertKgWaBoostWebPost"));

  }
  if (self->_cirAlertKgWaBoostWebPre)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertKgWaBoostWebPre](self, "cirAlertKgWaBoostWebPre");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("cirAlertKgWaBoostWebPre"));

  }
  if (self->_cirAlertMapsKgSwap)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMapsKgSwap](self, "cirAlertMapsKgSwap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("cirAlertMapsKgSwap"));

  }
  if (self->_cirAlertMediaPodcastOverride)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertMediaPodcastOverride](self, "cirAlertMediaPodcastOverride");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("cirAlertMediaPodcastOverride"));

  }
  if (self->_cirAlertProfaneFilter)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertProfaneFilter](self, "cirAlertProfaneFilter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cirAlertProfaneFilter"));

  }
  if (self->_cirAlertRespectIsFollowUpHeuristicFlag)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectIsFollowUpHeuristicFlag](self, "cirAlertRespectIsFollowUpHeuristicFlag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("cirAlertRespectIsFollowUpHeuristicFlag"));

  }
  if (self->_cirAlertRespectMultiTurnResolvedRankingFlag)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectMultiTurnResolvedRankingFlag](self, "cirAlertRespectMultiTurnResolvedRankingFlag");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("cirAlertRespectMultiTurnResolvedRankingFlag"));

  }
  if (self->_cirAlertRespectScoreOverrides)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertRespectScoreOverrides](self, "cirAlertRespectScoreOverrides");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("cirAlertRespectScoreOverrides"));

  }
  if (self->_cirAlertVerblessQueriesKgBoost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVerblessQueriesKgBoost](self, "cirAlertVerblessQueriesKgBoost");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("cirAlertVerblessQueriesKgBoost"));

  }
  if (self->_cirAlertVideoMediaBoost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertVideoMediaBoost](self, "cirAlertVideoMediaBoost");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("cirAlertVideoMediaBoost"));

  }
  if (self->_cirAlertWaBoost)
  {
    -[PEGASUSSchemaPEGASUSCirAlerts cirAlertWaBoost](self, "cirAlertWaBoost");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("cirAlertWaBoost"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSCirAlerts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSCirAlerts)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSCirAlerts *v5;
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
    self = -[PEGASUSSchemaPEGASUSCirAlerts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSCirAlerts)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSCirAlerts *v5;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PEGASUSSchemaPEGASUSCirAlerts *v42;
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
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PEGASUSSchemaPEGASUSCirAlerts;
  v5 = -[PEGASUSSchemaPEGASUSCirAlerts init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlert"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlert:](v5, "setCirAlert:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertContext:](v5, "setCirAlertContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertDictionaryOverKgBoost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertDictionaryOverKgBoost:](v5, "setCirAlertDictionaryOverKgBoost:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertDomainFallback"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertDomainFallback:](v5, "setCirAlertDomainFallback:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertEmergencyOverride"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertEmergencyOverride:](v5, "setCirAlertEmergencyOverride:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertKgWaBoost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoost:](v5, "setCirAlertKgWaBoost:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertKgWaBoostQa"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostQa:](v5, "setCirAlertKgWaBoostQa:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertKgWaBoostWebPost"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostWebPost:](v5, "setCirAlertKgWaBoostWebPost:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertKgWaBoostWebPre"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertKgWaBoostWebPre:](v5, "setCirAlertKgWaBoostWebPre:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertMapsKgSwap"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertMapsKgSwap:](v5, "setCirAlertMapsKgSwap:", v25);

    }
    v49 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertMediaPodcastOverride"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertMediaPodcastOverride:](v5, "setCirAlertMediaPodcastOverride:", v27);

    }
    v44 = v26;
    v48 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertProfaneFilter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertProfaneFilter:](v5, "setCirAlertProfaneFilter:", v29);

    }
    v47 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertRespectIsFollowUpHeuristicFlag"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectIsFollowUpHeuristicFlag:](v5, "setCirAlertRespectIsFollowUpHeuristicFlag:", v31);

    }
    v46 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertRespectMultiTurnResolvedRankingFlag"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectMultiTurnResolvedRankingFlag:](v5, "setCirAlertRespectMultiTurnResolvedRankingFlag:", v33);

    }
    v45 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertRespectScoreOverrides"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = (void *)objc_msgSend(v34, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertRespectScoreOverrides:](v5, "setCirAlertRespectScoreOverrides:", v35);

    }
    v50 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertVerblessQueriesKgBoost"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = (void *)objc_msgSend(v36, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertVerblessQueriesKgBoost:](v5, "setCirAlertVerblessQueriesKgBoost:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertVideoMediaBoost"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = (void *)objc_msgSend(v38, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertVideoMediaBoost:](v5, "setCirAlertVideoMediaBoost:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cirAlertWaBoost"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[PEGASUSSchemaPEGASUSCirAlerts setCirAlertWaBoost:](v5, "setCirAlertWaBoost:", v41);

    }
    v42 = v5;

  }
  return v5;
}

- (NSString)cirAlert
{
  return self->_cirAlert;
}

- (void)setCirAlert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cirAlertContext
{
  return self->_cirAlertContext;
}

- (void)setCirAlertContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cirAlertDictionaryOverKgBoost
{
  return self->_cirAlertDictionaryOverKgBoost;
}

- (void)setCirAlertDictionaryOverKgBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cirAlertDomainFallback
{
  return self->_cirAlertDomainFallback;
}

- (void)setCirAlertDomainFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cirAlertEmergencyOverride
{
  return self->_cirAlertEmergencyOverride;
}

- (void)setCirAlertEmergencyOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cirAlertKgWaBoost
{
  return self->_cirAlertKgWaBoost;
}

- (void)setCirAlertKgWaBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cirAlertKgWaBoostQa
{
  return self->_cirAlertKgWaBoostQa;
}

- (void)setCirAlertKgWaBoostQa:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)cirAlertKgWaBoostWebPost
{
  return self->_cirAlertKgWaBoostWebPost;
}

- (void)setCirAlertKgWaBoostWebPost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)cirAlertKgWaBoostWebPre
{
  return self->_cirAlertKgWaBoostWebPre;
}

- (void)setCirAlertKgWaBoostWebPre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)cirAlertMapsKgSwap
{
  return self->_cirAlertMapsKgSwap;
}

- (void)setCirAlertMapsKgSwap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)cirAlertMediaPodcastOverride
{
  return self->_cirAlertMediaPodcastOverride;
}

- (void)setCirAlertMediaPodcastOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)cirAlertProfaneFilter
{
  return self->_cirAlertProfaneFilter;
}

- (void)setCirAlertProfaneFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)cirAlertRespectIsFollowUpHeuristicFlag
{
  return self->_cirAlertRespectIsFollowUpHeuristicFlag;
}

- (void)setCirAlertRespectIsFollowUpHeuristicFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)cirAlertRespectMultiTurnResolvedRankingFlag
{
  return self->_cirAlertRespectMultiTurnResolvedRankingFlag;
}

- (void)setCirAlertRespectMultiTurnResolvedRankingFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)cirAlertRespectScoreOverrides
{
  return self->_cirAlertRespectScoreOverrides;
}

- (void)setCirAlertRespectScoreOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)cirAlertVerblessQueriesKgBoost
{
  return self->_cirAlertVerblessQueriesKgBoost;
}

- (void)setCirAlertVerblessQueriesKgBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)cirAlertVideoMediaBoost
{
  return self->_cirAlertVideoMediaBoost;
}

- (void)setCirAlertVideoMediaBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)cirAlertWaBoost
{
  return self->_cirAlertWaBoost;
}

- (void)setCirAlertWaBoost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setHasCirAlert:(BOOL)a3
{
  self->_hasCirAlert = a3;
}

- (void)setHasCirAlertContext:(BOOL)a3
{
  self->_hasCirAlertContext = a3;
}

- (void)setHasCirAlertDictionaryOverKgBoost:(BOOL)a3
{
  self->_hasCirAlertDictionaryOverKgBoost = a3;
}

- (void)setHasCirAlertDomainFallback:(BOOL)a3
{
  self->_hasCirAlertDomainFallback = a3;
}

- (void)setHasCirAlertEmergencyOverride:(BOOL)a3
{
  self->_hasCirAlertEmergencyOverride = a3;
}

- (void)setHasCirAlertKgWaBoost:(BOOL)a3
{
  self->_hasCirAlertKgWaBoost = a3;
}

- (void)setHasCirAlertKgWaBoostQa:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostQa = a3;
}

- (void)setHasCirAlertKgWaBoostWebPost:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostWebPost = a3;
}

- (void)setHasCirAlertKgWaBoostWebPre:(BOOL)a3
{
  self->_hasCirAlertKgWaBoostWebPre = a3;
}

- (void)setHasCirAlertMapsKgSwap:(BOOL)a3
{
  self->_hasCirAlertMapsKgSwap = a3;
}

- (void)setHasCirAlertMediaPodcastOverride:(BOOL)a3
{
  self->_hasCirAlertMediaPodcastOverride = a3;
}

- (void)setHasCirAlertProfaneFilter:(BOOL)a3
{
  self->_hasCirAlertProfaneFilter = a3;
}

- (void)setHasCirAlertRespectIsFollowUpHeuristicFlag:(BOOL)a3
{
  self->_hasCirAlertRespectIsFollowUpHeuristicFlag = a3;
}

- (void)setHasCirAlertRespectMultiTurnResolvedRankingFlag:(BOOL)a3
{
  self->_hasCirAlertRespectMultiTurnResolvedRankingFlag = a3;
}

- (void)setHasCirAlertRespectScoreOverrides:(BOOL)a3
{
  self->_hasCirAlertRespectScoreOverrides = a3;
}

- (void)setHasCirAlertVerblessQueriesKgBoost:(BOOL)a3
{
  self->_hasCirAlertVerblessQueriesKgBoost = a3;
}

- (void)setHasCirAlertVideoMediaBoost:(BOOL)a3
{
  self->_hasCirAlertVideoMediaBoost = a3;
}

- (void)setHasCirAlertWaBoost:(BOOL)a3
{
  self->_hasCirAlertWaBoost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirAlertWaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertVideoMediaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertVerblessQueriesKgBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectScoreOverrides, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectMultiTurnResolvedRankingFlag, 0);
  objc_storeStrong((id *)&self->_cirAlertRespectIsFollowUpHeuristicFlag, 0);
  objc_storeStrong((id *)&self->_cirAlertProfaneFilter, 0);
  objc_storeStrong((id *)&self->_cirAlertMediaPodcastOverride, 0);
  objc_storeStrong((id *)&self->_cirAlertMapsKgSwap, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostWebPre, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostWebPost, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoostQa, 0);
  objc_storeStrong((id *)&self->_cirAlertKgWaBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertEmergencyOverride, 0);
  objc_storeStrong((id *)&self->_cirAlertDomainFallback, 0);
  objc_storeStrong((id *)&self->_cirAlertDictionaryOverKgBoost, 0);
  objc_storeStrong((id *)&self->_cirAlertContext, 0);
  objc_storeStrong((id *)&self->_cirAlert, 0);
}

@end
