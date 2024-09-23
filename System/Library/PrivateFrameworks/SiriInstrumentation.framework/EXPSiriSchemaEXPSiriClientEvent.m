@implementation EXPSiriSchemaEXPSiriClientEvent

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
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EXPSiriSchemaEXPSiriClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[EXPSiriSchemaEXPSiriClientEvent deleteAllocationSnapshot](self, "deleteAllocationSnapshot");
  -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[EXPSiriSchemaEXPSiriClientEvent deleteAllocationChangelogSnapshot](self, "deleteAllocationChangelogSnapshot");
  -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[EXPSiriSchemaEXPSiriClientEvent deleteExperimentTriggered](self, "deleteExperimentTriggered");
  -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[EXPSiriSchemaEXPSiriClientEvent deleteSiriRequestExperimentTriggered](self, "deleteSiriRequestExperimentTriggered");
  -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[EXPSiriSchemaEXPSiriClientEvent deleteRolloutChangeSnapshot](self, "deleteRolloutChangeSnapshot");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[EXPSiriSchemaEXPSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629498[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E56294C0[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[EXPSiriSchemaEXPSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.exp.siri.EXPSiriClientEvent");
  else
    return off_1E562D510[v2 - 101];
}

- (void)setAllocationSnapshot:(id)a3
{
  EXPSiriSchemaEXPAllocationSnapshot *v4;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;
  unint64_t v9;
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;

  v4 = (EXPSiriSchemaEXPAllocationSnapshot *)a3;
  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = v4;

}

- (EXPSiriSchemaEXPAllocationSnapshot)allocationSnapshot
{
  if (self->_whichEvent_Type == 101)
    return self->_allocationSnapshot;
  else
    return (EXPSiriSchemaEXPAllocationSnapshot *)0;
}

- (void)deleteAllocationSnapshot
{
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    allocationSnapshot = self->_allocationSnapshot;
    self->_allocationSnapshot = 0;

  }
}

- (void)setAllocationChangelogSnapshot:(id)a3
{
  EXPSiriSchemaEXPAllocationChangelogSnapshot *v4;
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;
  unint64_t v9;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;

  v4 = (EXPSiriSchemaEXPAllocationChangelogSnapshot *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = v4;

}

- (EXPSiriSchemaEXPAllocationChangelogSnapshot)allocationChangelogSnapshot
{
  if (self->_whichEvent_Type == 102)
    return self->_allocationChangelogSnapshot;
  else
    return (EXPSiriSchemaEXPAllocationChangelogSnapshot *)0;
}

- (void)deleteAllocationChangelogSnapshot
{
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
    self->_allocationChangelogSnapshot = 0;

  }
}

- (void)setExperimentTriggered:(id)a3
{
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *v4;
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;
  unint64_t v9;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;

  v4 = (EXPSiriSchemaEXPClientExperimentTriggeredTier1 *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = v4;

}

- (EXPSiriSchemaEXPClientExperimentTriggeredTier1)experimentTriggered
{
  if (self->_whichEvent_Type == 103)
    return self->_experimentTriggered;
  else
    return (EXPSiriSchemaEXPClientExperimentTriggeredTier1 *)0;
}

- (void)deleteExperimentTriggered
{
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    experimentTriggered = self->_experimentTriggered;
    self->_experimentTriggered = 0;

  }
}

- (void)setSiriRequestExperimentTriggered:(id)a3
{
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *v4;
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;
  unint64_t v9;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;

  v4 = (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = v4;

}

- (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1)SiriRequestExperimentTriggered
{
  if (self->_whichEvent_Type == 104)
    return self->_SiriRequestExperimentTriggered;
  else
    return (EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *)0;
}

- (void)deleteSiriRequestExperimentTriggered
{
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
    self->_SiriRequestExperimentTriggered = 0;

  }
}

- (void)setRolloutChangeSnapshot:(id)a3
{
  EXPSiriSchemaEXPRolloutChangeSnapshot *v4;
  EXPSiriSchemaEXPAllocationSnapshot *allocationSnapshot;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *allocationChangelogSnapshot;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *experimentTriggered;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *SiriRequestExperimentTriggered;
  unint64_t v9;
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;

  v4 = (EXPSiriSchemaEXPRolloutChangeSnapshot *)a3;
  allocationSnapshot = self->_allocationSnapshot;
  self->_allocationSnapshot = 0;

  allocationChangelogSnapshot = self->_allocationChangelogSnapshot;
  self->_allocationChangelogSnapshot = 0;

  experimentTriggered = self->_experimentTriggered;
  self->_experimentTriggered = 0;

  SiriRequestExperimentTriggered = self->_SiriRequestExperimentTriggered;
  self->_SiriRequestExperimentTriggered = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
  self->_rolloutChangeSnapshot = v4;

}

- (EXPSiriSchemaEXPRolloutChangeSnapshot)rolloutChangeSnapshot
{
  if (self->_whichEvent_Type == 105)
    return self->_rolloutChangeSnapshot;
  else
    return (EXPSiriSchemaEXPRolloutChangeSnapshot *)0;
}

- (void)deleteRolloutChangeSnapshot
{
  EXPSiriSchemaEXPRolloutChangeSnapshot *rolloutChangeSnapshot;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    rolloutChangeSnapshot = self->_rolloutChangeSnapshot;
    self->_rolloutChangeSnapshot = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPSiriClientEventReadFrom(self, (uint64_t)a3);
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
  id v14;

  v14 = a3;
  -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocationSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocationSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocationChangelogSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocationChangelogSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentTriggered");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SiriRequestExperimentTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SiriRequestExperimentTriggered");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rolloutChangeSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rolloutChangeSnapshot");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[EXPSiriSchemaEXPAllocationSnapshot hash](self->_allocationSnapshot, "hash");
  v4 = -[EXPSiriSchemaEXPAllocationChangelogSnapshot hash](self->_allocationChangelogSnapshot, "hash") ^ v3;
  v5 = -[EXPSiriSchemaEXPClientExperimentTriggeredTier1 hash](self->_experimentTriggered, "hash");
  v6 = v4 ^ v5 ^ -[EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 hash](self->_SiriRequestExperimentTriggered, "hash");
  return v6 ^ -[EXPSiriSchemaEXPRolloutChangeSnapshot hash](self->_rolloutChangeSnapshot, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_SiriRequestExperimentTriggered)
  {
    -[EXPSiriSchemaEXPSiriClientEvent SiriRequestExperimentTriggered](self, "SiriRequestExperimentTriggered");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SiriRequestExperimentTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("SiriRequestExperimentTriggered"));

    }
  }
  if (self->_allocationChangelogSnapshot)
  {
    -[EXPSiriSchemaEXPSiriClientEvent allocationChangelogSnapshot](self, "allocationChangelogSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("allocationChangelogSnapshot"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("allocationChangelogSnapshot"));

    }
  }
  if (self->_allocationSnapshot)
  {
    -[EXPSiriSchemaEXPSiriClientEvent allocationSnapshot](self, "allocationSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("allocationSnapshot"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("allocationSnapshot"));

    }
  }
  if (self->_experimentTriggered)
  {
    -[EXPSiriSchemaEXPSiriClientEvent experimentTriggered](self, "experimentTriggered");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("experimentTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("experimentTriggered"));

    }
  }
  if (self->_rolloutChangeSnapshot)
  {
    -[EXPSiriSchemaEXPSiriClientEvent rolloutChangeSnapshot](self, "rolloutChangeSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rolloutChangeSnapshot"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rolloutChangeSnapshot"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSiriSchemaEXPSiriClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSiriSchemaEXPSiriClientEvent)initWithJSON:(id)a3
{
  void *v4;
  EXPSiriSchemaEXPSiriClientEvent *v5;
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
    self = -[EXPSiriSchemaEXPSiriClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSiriSchemaEXPSiriClientEvent)initWithDictionary:(id)a3
{
  id v4;
  EXPSiriSchemaEXPSiriClientEvent *v5;
  void *v6;
  EXPSiriSchemaEXPAllocationSnapshot *v7;
  void *v8;
  EXPSiriSchemaEXPAllocationChangelogSnapshot *v9;
  void *v10;
  EXPSiriSchemaEXPClientExperimentTriggeredTier1 *v11;
  void *v12;
  EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 *v13;
  void *v14;
  EXPSiriSchemaEXPRolloutChangeSnapshot *v15;
  EXPSiriSchemaEXPSiriClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EXPSiriSchemaEXPSiriClientEvent;
  v5 = -[EXPSiriSchemaEXPSiriClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationSnapshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[EXPSiriSchemaEXPAllocationSnapshot initWithDictionary:]([EXPSiriSchemaEXPAllocationSnapshot alloc], "initWithDictionary:", v6);
      -[EXPSiriSchemaEXPSiriClientEvent setAllocationSnapshot:](v5, "setAllocationSnapshot:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationChangelogSnapshot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[EXPSiriSchemaEXPAllocationChangelogSnapshot initWithDictionary:]([EXPSiriSchemaEXPAllocationChangelogSnapshot alloc], "initWithDictionary:", v8);
      -[EXPSiriSchemaEXPSiriClientEvent setAllocationChangelogSnapshot:](v5, "setAllocationChangelogSnapshot:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentTriggered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[EXPSiriSchemaEXPClientExperimentTriggeredTier1 initWithDictionary:]([EXPSiriSchemaEXPClientExperimentTriggeredTier1 alloc], "initWithDictionary:", v10);
      -[EXPSiriSchemaEXPSiriClientEvent setExperimentTriggered:](v5, "setExperimentTriggered:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SiriRequestExperimentTriggered"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 initWithDictionary:]([EXPSiriSchemaEXPClientSiriRequestExperimentTriggeredTier1 alloc], "initWithDictionary:", v12);
      -[EXPSiriSchemaEXPSiriClientEvent setSiriRequestExperimentTriggered:](v5, "setSiriRequestExperimentTriggered:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rolloutChangeSnapshot"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[EXPSiriSchemaEXPRolloutChangeSnapshot initWithDictionary:]([EXPSiriSchemaEXPRolloutChangeSnapshot alloc], "initWithDictionary:", v14);
      -[EXPSiriSchemaEXPSiriClientEvent setRolloutChangeSnapshot:](v5, "setRolloutChangeSnapshot:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (BOOL)hasAllocationSnapshot
{
  return self->_hasAllocationSnapshot;
}

- (void)setHasAllocationSnapshot:(BOOL)a3
{
  self->_hasAllocationSnapshot = a3;
}

- (BOOL)hasAllocationChangelogSnapshot
{
  return self->_hasAllocationChangelogSnapshot;
}

- (void)setHasAllocationChangelogSnapshot:(BOOL)a3
{
  self->_hasAllocationChangelogSnapshot = a3;
}

- (BOOL)hasExperimentTriggered
{
  return self->_hasExperimentTriggered;
}

- (void)setHasExperimentTriggered:(BOOL)a3
{
  self->_hasExperimentTriggered = a3;
}

- (BOOL)hasSiriRequestExperimentTriggered
{
  return self->_hasSiriRequestExperimentTriggered;
}

- (void)setHasSiriRequestExperimentTriggered:(BOOL)a3
{
  self->_hasSiriRequestExperimentTriggered = a3;
}

- (BOOL)hasRolloutChangeSnapshot
{
  return self->_hasRolloutChangeSnapshot;
}

- (void)setHasRolloutChangeSnapshot:(BOOL)a3
{
  self->_hasRolloutChangeSnapshot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutChangeSnapshot, 0);
  objc_storeStrong((id *)&self->_SiriRequestExperimentTriggered, 0);
  objc_storeStrong((id *)&self->_experimentTriggered, 0);
  objc_storeStrong((id *)&self->_allocationChangelogSnapshot, 0);
  objc_storeStrong((id *)&self->_allocationSnapshot, 0);
}

- (int)getAnyEventType
{
  return 40;
}

@end
