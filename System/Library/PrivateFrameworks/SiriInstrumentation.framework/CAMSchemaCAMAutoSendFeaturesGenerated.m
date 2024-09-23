@implementation CAMSchemaCAMAutoSendFeaturesGenerated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CAMSchemaCAMAutoSendFeaturesGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v52, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserAsrScore](self, "deleteUserAsrScore");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserAsrScoreWhenCompleted](self, "deleteUserAsrScoreWhenCompleted");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserAsrScoreWhenRejected](self, "deleteUserAsrScoreWhenRejected");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserAsrScoreTargetContact](self, "deleteUserAsrScoreTargetContact");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserAsrScoreTargetApp](self, "deleteUserAsrScoreTargetApp");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserRejectRate](self, "deleteUserRejectRate");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserRejectRateTargetContact](self, "deleteUserRejectRateTargetContact");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserRejectRateTargetApp](self, "deleteUserRejectRateTargetApp");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserRejectRateWhenSkipDecision](self, "deleteUserRejectRateWhenSkipDecision");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserRejectRateWhenConfirmDecision](self, "deleteUserRejectRateWhenConfirmDecision");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserPayloadLengthInCharacters](self, "deleteUserPayloadLengthInCharacters");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserPayloadLengthInCharactersTargetContact](self, "deleteUserPayloadLengthInCharactersTargetContact");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserPayloadLengthInCharactersTargetApp](self, "deleteUserPayloadLengthInCharactersTargetApp");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserPayloadLengthInCharactersWhenCompleted](self, "deleteUserPayloadLengthInCharactersWhenCompleted");
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[CAMSchemaCAMAutoSendFeaturesGenerated deleteUserPayloadLengthInCharactersWhenRejected](self, "deleteUserPayloadLengthInCharactersWhenRejected");

  return v5;
}

- (BOOL)hasUserAsrScore
{
  return self->_userAsrScore != 0;
}

- (void)deleteUserAsrScore
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScore:](self, "setUserAsrScore:", 0);
}

- (BOOL)hasUserAsrScoreWhenCompleted
{
  return self->_userAsrScoreWhenCompleted != 0;
}

- (void)deleteUserAsrScoreWhenCompleted
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreWhenCompleted:](self, "setUserAsrScoreWhenCompleted:", 0);
}

- (BOOL)hasUserAsrScoreWhenRejected
{
  return self->_userAsrScoreWhenRejected != 0;
}

- (void)deleteUserAsrScoreWhenRejected
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreWhenRejected:](self, "setUserAsrScoreWhenRejected:", 0);
}

- (BOOL)hasUserAsrScoreTargetContact
{
  return self->_userAsrScoreTargetContact != 0;
}

- (void)deleteUserAsrScoreTargetContact
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreTargetContact:](self, "setUserAsrScoreTargetContact:", 0);
}

- (BOOL)hasUserAsrScoreTargetApp
{
  return self->_userAsrScoreTargetApp != 0;
}

- (void)deleteUserAsrScoreTargetApp
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreTargetApp:](self, "setUserAsrScoreTargetApp:", 0);
}

- (BOOL)hasUserRejectRate
{
  return self->_userRejectRate != 0;
}

- (void)deleteUserRejectRate
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRate:](self, "setUserRejectRate:", 0);
}

- (BOOL)hasUserRejectRateTargetContact
{
  return self->_userRejectRateTargetContact != 0;
}

- (void)deleteUserRejectRateTargetContact
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateTargetContact:](self, "setUserRejectRateTargetContact:", 0);
}

- (BOOL)hasUserRejectRateTargetApp
{
  return self->_userRejectRateTargetApp != 0;
}

- (void)deleteUserRejectRateTargetApp
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateTargetApp:](self, "setUserRejectRateTargetApp:", 0);
}

- (BOOL)hasUserRejectRateWhenSkipDecision
{
  return self->_userRejectRateWhenSkipDecision != 0;
}

- (void)deleteUserRejectRateWhenSkipDecision
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateWhenSkipDecision:](self, "setUserRejectRateWhenSkipDecision:", 0);
}

- (BOOL)hasUserRejectRateWhenConfirmDecision
{
  return self->_userRejectRateWhenConfirmDecision != 0;
}

- (void)deleteUserRejectRateWhenConfirmDecision
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateWhenConfirmDecision:](self, "setUserRejectRateWhenConfirmDecision:", 0);
}

- (BOOL)hasUserPayloadLengthInCharacters
{
  return self->_userPayloadLengthInCharacters != 0;
}

- (void)deleteUserPayloadLengthInCharacters
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharacters:](self, "setUserPayloadLengthInCharacters:", 0);
}

- (BOOL)hasUserPayloadLengthInCharactersTargetContact
{
  return self->_userPayloadLengthInCharactersTargetContact != 0;
}

- (void)deleteUserPayloadLengthInCharactersTargetContact
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersTargetContact:](self, "setUserPayloadLengthInCharactersTargetContact:", 0);
}

- (BOOL)hasUserPayloadLengthInCharactersTargetApp
{
  return self->_userPayloadLengthInCharactersTargetApp != 0;
}

- (void)deleteUserPayloadLengthInCharactersTargetApp
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersTargetApp:](self, "setUserPayloadLengthInCharactersTargetApp:", 0);
}

- (BOOL)hasUserPayloadLengthInCharactersWhenCompleted
{
  return self->_userPayloadLengthInCharactersWhenCompleted != 0;
}

- (void)deleteUserPayloadLengthInCharactersWhenCompleted
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersWhenCompleted:](self, "setUserPayloadLengthInCharactersWhenCompleted:", 0);
}

- (BOOL)hasUserPayloadLengthInCharactersWhenRejected
{
  return self->_userPayloadLengthInCharactersWhenRejected != 0;
}

- (void)deleteUserPayloadLengthInCharactersWhenRejected
{
  -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersWhenRejected:](self, "setUserPayloadLengthInCharactersWhenRejected:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMAutoSendFeaturesGeneratedReadFrom(self, (uint64_t)a3);
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
  id v34;

  v34 = a3;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  char v81;
  BOOL v82;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAsrScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAsrScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAsrScoreWhenCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAsrScoreWhenCompleted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAsrScoreWhenRejected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAsrScoreWhenRejected");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAsrScoreTargetContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAsrScoreTargetContact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAsrScoreTargetApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAsrScoreTargetApp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRejectRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userRejectRate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRejectRateTargetContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userRejectRateTargetContact");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRejectRateTargetApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userRejectRateTargetApp");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRejectRateWhenSkipDecision");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userRejectRateWhenSkipDecision");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRejectRateWhenConfirmDecision");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userRejectRateWhenConfirmDecision");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPayloadLengthInCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPayloadLengthInCharacters");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPayloadLengthInCharactersTargetContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPayloadLengthInCharactersTargetContact");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPayloadLengthInCharactersTargetApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPayloadLengthInCharactersTargetApp");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPayloadLengthInCharactersWhenCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPayloadLengthInCharactersWhenCompleted");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_77;
  }
  else
  {

  }
  -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPayloadLengthInCharactersWhenRejected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
    v77 = objc_claimAutoreleasedReturnValue();
    if (!v77)
    {

LABEL_80:
      v82 = 1;
      goto LABEL_78;
    }
    v78 = (void *)v77;
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPayloadLengthInCharactersWhenRejected");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if ((v81 & 1) != 0)
      goto LABEL_80;
  }
  else
  {
LABEL_76:

  }
LABEL_77:
  v82 = 0;
LABEL_78:

  return v82;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v3 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userAsrScore, "hash");
  v4 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userAsrScoreWhenCompleted, "hash") ^ v3;
  v5 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userAsrScoreWhenRejected, "hash");
  v6 = v4 ^ v5 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userAsrScoreTargetContact, "hash");
  v7 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userAsrScoreTargetApp, "hash");
  v8 = v7 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userRejectRate, "hash");
  v9 = v6 ^ v8 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userRejectRateTargetContact, "hash");
  v10 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userRejectRateTargetApp, "hash");
  v11 = v10 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userRejectRateWhenSkipDecision, "hash");
  v12 = v11 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userRejectRateWhenConfirmDecision, "hash");
  v13 = v9 ^ v12 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userPayloadLengthInCharacters, "hash");
  v14 = -[CAMSchemaCAMAggregateFeatureValue hash](self->_userPayloadLengthInCharactersTargetContact, "hash");
  v15 = v14 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userPayloadLengthInCharactersTargetApp, "hash");
  v16 = v15 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userPayloadLengthInCharactersWhenCompleted, "hash");
  return v13 ^ v16 ^ -[CAMSchemaCAMAggregateFeatureValue hash](self->_userPayloadLengthInCharactersWhenRejected, "hash");
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_userAsrScore)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScore](self, "userAsrScore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("userAsrScore"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("userAsrScore"));

    }
  }
  if (self->_userAsrScoreTargetApp)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetApp](self, "userAsrScoreTargetApp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("userAsrScoreTargetApp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("userAsrScoreTargetApp"));

    }
  }
  if (self->_userAsrScoreTargetContact)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreTargetContact](self, "userAsrScoreTargetContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userAsrScoreTargetContact"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userAsrScoreTargetContact"));

    }
  }
  if (self->_userAsrScoreWhenCompleted)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenCompleted](self, "userAsrScoreWhenCompleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userAsrScoreWhenCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userAsrScoreWhenCompleted"));

    }
  }
  if (self->_userAsrScoreWhenRejected)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userAsrScoreWhenRejected](self, "userAsrScoreWhenRejected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("userAsrScoreWhenRejected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("userAsrScoreWhenRejected"));

    }
  }
  if (self->_userPayloadLengthInCharacters)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharacters](self, "userPayloadLengthInCharacters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("userPayloadLengthInCharacters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("userPayloadLengthInCharacters"));

    }
  }
  if (self->_userPayloadLengthInCharactersTargetApp)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetApp](self, "userPayloadLengthInCharactersTargetApp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("userPayloadLengthInCharactersTargetApp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("userPayloadLengthInCharactersTargetApp"));

    }
  }
  if (self->_userPayloadLengthInCharactersTargetContact)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersTargetContact](self, "userPayloadLengthInCharactersTargetContact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("userPayloadLengthInCharactersTargetContact"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("userPayloadLengthInCharactersTargetContact"));

    }
  }
  if (self->_userPayloadLengthInCharactersWhenCompleted)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenCompleted](self, "userPayloadLengthInCharactersWhenCompleted");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("userPayloadLengthInCharactersWhenCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("userPayloadLengthInCharactersWhenCompleted"));

    }
  }
  if (self->_userPayloadLengthInCharactersWhenRejected)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userPayloadLengthInCharactersWhenRejected](self, "userPayloadLengthInCharactersWhenRejected");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("userPayloadLengthInCharactersWhenRejected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("userPayloadLengthInCharactersWhenRejected"));

    }
  }
  if (self->_userRejectRate)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRate](self, "userRejectRate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("userRejectRate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("userRejectRate"));

    }
  }
  if (self->_userRejectRateTargetApp)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetApp](self, "userRejectRateTargetApp");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("userRejectRateTargetApp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("userRejectRateTargetApp"));

    }
  }
  if (self->_userRejectRateTargetContact)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateTargetContact](self, "userRejectRateTargetContact");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("userRejectRateTargetContact"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("userRejectRateTargetContact"));

    }
  }
  if (self->_userRejectRateWhenConfirmDecision)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenConfirmDecision](self, "userRejectRateWhenConfirmDecision");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("userRejectRateWhenConfirmDecision"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("userRejectRateWhenConfirmDecision"));

    }
  }
  if (self->_userRejectRateWhenSkipDecision)
  {
    -[CAMSchemaCAMAutoSendFeaturesGenerated userRejectRateWhenSkipDecision](self, "userRejectRateWhenSkipDecision");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("userRejectRateWhenSkipDecision"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("userRejectRateWhenSkipDecision"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAMSchemaCAMAutoSendFeaturesGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithJSON:(id)a3
{
  void *v4;
  CAMSchemaCAMAutoSendFeaturesGenerated *v5;
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
    self = -[CAMSchemaCAMAutoSendFeaturesGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAMSchemaCAMAutoSendFeaturesGenerated)initWithDictionary:(id)a3
{
  id v4;
  CAMSchemaCAMAutoSendFeaturesGenerated *v5;
  uint64_t v6;
  CAMSchemaCAMAggregateFeatureValue *v7;
  uint64_t v8;
  CAMSchemaCAMAggregateFeatureValue *v9;
  uint64_t v10;
  CAMSchemaCAMAggregateFeatureValue *v11;
  uint64_t v12;
  CAMSchemaCAMAggregateFeatureValue *v13;
  uint64_t v14;
  CAMSchemaCAMAggregateFeatureValue *v15;
  uint64_t v16;
  CAMSchemaCAMAggregateFeatureValue *v17;
  uint64_t v18;
  CAMSchemaCAMAggregateFeatureValue *v19;
  uint64_t v20;
  CAMSchemaCAMAggregateFeatureValue *v21;
  void *v22;
  CAMSchemaCAMAggregateFeatureValue *v23;
  void *v24;
  CAMSchemaCAMAggregateFeatureValue *v25;
  void *v26;
  CAMSchemaCAMAggregateFeatureValue *v27;
  void *v28;
  CAMSchemaCAMAggregateFeatureValue *v29;
  void *v30;
  CAMSchemaCAMAggregateFeatureValue *v31;
  void *v32;
  CAMSchemaCAMAggregateFeatureValue *v33;
  void *v34;
  CAMSchemaCAMAggregateFeatureValue *v35;
  CAMSchemaCAMAutoSendFeaturesGenerated *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMSchemaCAMAutoSendFeaturesGenerated;
  v5 = -[CAMSchemaCAMAutoSendFeaturesGenerated init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAsrScore"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v6);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScore:](v5, "setUserAsrScore:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAsrScoreWhenCompleted"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v8);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreWhenCompleted:](v5, "setUserAsrScoreWhenCompleted:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAsrScoreWhenRejected"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v10);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreWhenRejected:](v5, "setUserAsrScoreWhenRejected:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAsrScoreTargetContact"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v12);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreTargetContact:](v5, "setUserAsrScoreTargetContact:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAsrScoreTargetApp"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v14);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserAsrScoreTargetApp:](v5, "setUserAsrScoreTargetApp:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRejectRate"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = (void *)v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v16);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRate:](v5, "setUserRejectRate:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRejectRateTargetContact"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v18);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateTargetContact:](v5, "setUserRejectRateTargetContact:", v19);

    }
    v43 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRejectRateTargetApp"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v20);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateTargetApp:](v5, "setUserRejectRateTargetApp:", v21);

    }
    v38 = (void *)v20;
    v42 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRejectRateWhenSkipDecision"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v22);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateWhenSkipDecision:](v5, "setUserRejectRateWhenSkipDecision:", v23);

    }
    v41 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRejectRateWhenConfirmDecision"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v24);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserRejectRateWhenConfirmDecision:](v5, "setUserRejectRateWhenConfirmDecision:", v25);

    }
    v40 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPayloadLengthInCharacters"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v26);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharacters:](v5, "setUserPayloadLengthInCharacters:", v27);

    }
    v39 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPayloadLengthInCharactersTargetContact"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v28);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersTargetContact:](v5, "setUserPayloadLengthInCharactersTargetContact:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPayloadLengthInCharactersTargetApp"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v30);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersTargetApp:](v5, "setUserPayloadLengthInCharactersTargetApp:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPayloadLengthInCharactersWhenCompleted"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v32);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersWhenCompleted:](v5, "setUserPayloadLengthInCharactersWhenCompleted:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPayloadLengthInCharactersWhenRejected"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:]([CAMSchemaCAMAggregateFeatureValue alloc], "initWithDictionary:", v34);
      -[CAMSchemaCAMAutoSendFeaturesGenerated setUserPayloadLengthInCharactersWhenRejected:](v5, "setUserPayloadLengthInCharactersWhenRejected:", v35);

    }
    v36 = v5;

  }
  return v5;
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScore
{
  return self->_userAsrScore;
}

- (void)setUserAsrScore:(id)a3
{
  objc_storeStrong((id *)&self->_userAsrScore, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenCompleted
{
  return self->_userAsrScoreWhenCompleted;
}

- (void)setUserAsrScoreWhenCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_userAsrScoreWhenCompleted, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreWhenRejected
{
  return self->_userAsrScoreWhenRejected;
}

- (void)setUserAsrScoreWhenRejected:(id)a3
{
  objc_storeStrong((id *)&self->_userAsrScoreWhenRejected, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetContact
{
  return self->_userAsrScoreTargetContact;
}

- (void)setUserAsrScoreTargetContact:(id)a3
{
  objc_storeStrong((id *)&self->_userAsrScoreTargetContact, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userAsrScoreTargetApp
{
  return self->_userAsrScoreTargetApp;
}

- (void)setUserAsrScoreTargetApp:(id)a3
{
  objc_storeStrong((id *)&self->_userAsrScoreTargetApp, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRate
{
  return self->_userRejectRate;
}

- (void)setUserRejectRate:(id)a3
{
  objc_storeStrong((id *)&self->_userRejectRate, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetContact
{
  return self->_userRejectRateTargetContact;
}

- (void)setUserRejectRateTargetContact:(id)a3
{
  objc_storeStrong((id *)&self->_userRejectRateTargetContact, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateTargetApp
{
  return self->_userRejectRateTargetApp;
}

- (void)setUserRejectRateTargetApp:(id)a3
{
  objc_storeStrong((id *)&self->_userRejectRateTargetApp, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenSkipDecision
{
  return self->_userRejectRateWhenSkipDecision;
}

- (void)setUserRejectRateWhenSkipDecision:(id)a3
{
  objc_storeStrong((id *)&self->_userRejectRateWhenSkipDecision, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userRejectRateWhenConfirmDecision
{
  return self->_userRejectRateWhenConfirmDecision;
}

- (void)setUserRejectRateWhenConfirmDecision:(id)a3
{
  objc_storeStrong((id *)&self->_userRejectRateWhenConfirmDecision, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharacters
{
  return self->_userPayloadLengthInCharacters;
}

- (void)setUserPayloadLengthInCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharacters, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetContact
{
  return self->_userPayloadLengthInCharactersTargetContact;
}

- (void)setUserPayloadLengthInCharactersTargetContact:(id)a3
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetContact, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersTargetApp
{
  return self->_userPayloadLengthInCharactersTargetApp;
}

- (void)setUserPayloadLengthInCharactersTargetApp:(id)a3
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetApp, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenCompleted
{
  return self->_userPayloadLengthInCharactersWhenCompleted;
}

- (void)setUserPayloadLengthInCharactersWhenCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenCompleted, a3);
}

- (CAMSchemaCAMAggregateFeatureValue)userPayloadLengthInCharactersWhenRejected
{
  return self->_userPayloadLengthInCharactersWhenRejected;
}

- (void)setUserPayloadLengthInCharactersWhenRejected:(id)a3
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenRejected, a3);
}

- (void)setHasUserAsrScore:(BOOL)a3
{
  self->_hasUserAsrScore = a3;
}

- (void)setHasUserAsrScoreWhenCompleted:(BOOL)a3
{
  self->_hasUserAsrScoreWhenCompleted = a3;
}

- (void)setHasUserAsrScoreWhenRejected:(BOOL)a3
{
  self->_hasUserAsrScoreWhenRejected = a3;
}

- (void)setHasUserAsrScoreTargetContact:(BOOL)a3
{
  self->_hasUserAsrScoreTargetContact = a3;
}

- (void)setHasUserAsrScoreTargetApp:(BOOL)a3
{
  self->_hasUserAsrScoreTargetApp = a3;
}

- (void)setHasUserRejectRate:(BOOL)a3
{
  self->_hasUserRejectRate = a3;
}

- (void)setHasUserRejectRateTargetContact:(BOOL)a3
{
  self->_hasUserRejectRateTargetContact = a3;
}

- (void)setHasUserRejectRateTargetApp:(BOOL)a3
{
  self->_hasUserRejectRateTargetApp = a3;
}

- (void)setHasUserRejectRateWhenSkipDecision:(BOOL)a3
{
  self->_hasUserRejectRateWhenSkipDecision = a3;
}

- (void)setHasUserRejectRateWhenConfirmDecision:(BOOL)a3
{
  self->_hasUserRejectRateWhenConfirmDecision = a3;
}

- (void)setHasUserPayloadLengthInCharacters:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharacters = a3;
}

- (void)setHasUserPayloadLengthInCharactersTargetContact:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersTargetContact = a3;
}

- (void)setHasUserPayloadLengthInCharactersTargetApp:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersTargetApp = a3;
}

- (void)setHasUserPayloadLengthInCharactersWhenCompleted:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersWhenCompleted = a3;
}

- (void)setHasUserPayloadLengthInCharactersWhenRejected:(BOOL)a3
{
  self->_hasUserPayloadLengthInCharactersWhenRejected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenRejected, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersWhenCompleted, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetApp, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharactersTargetContact, 0);
  objc_storeStrong((id *)&self->_userPayloadLengthInCharacters, 0);
  objc_storeStrong((id *)&self->_userRejectRateWhenConfirmDecision, 0);
  objc_storeStrong((id *)&self->_userRejectRateWhenSkipDecision, 0);
  objc_storeStrong((id *)&self->_userRejectRateTargetApp, 0);
  objc_storeStrong((id *)&self->_userRejectRateTargetContact, 0);
  objc_storeStrong((id *)&self->_userRejectRate, 0);
  objc_storeStrong((id *)&self->_userAsrScoreTargetApp, 0);
  objc_storeStrong((id *)&self->_userAsrScoreTargetContact, 0);
  objc_storeStrong((id *)&self->_userAsrScoreWhenRejected, 0);
  objc_storeStrong((id *)&self->_userAsrScoreWhenCompleted, 0);
  objc_storeStrong((id *)&self->_userAsrScore, 0);
}

@end
