@implementation QDSchemaQDClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "qdId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "qdId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 50;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

+ (int)joinability
{
  return 2;
}

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
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)QDSchemaQDClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[QDSchemaQDClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[QDSchemaQDClientEvent deleteCollectionContext](self, "deleteCollectionContext");
  -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[QDSchemaQDClientEvent deleteEntitiesCollected](self, "deleteEntitiesCollected");
  -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[QDSchemaQDClientEvent deleteTuplesGenerated](self, "deleteTuplesGenerated");
  -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[QDSchemaQDClientEvent deleteEntitiesRanked](self, "deleteEntitiesRanked");
  -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[QDSchemaQDClientEvent deleteSubComponentContext](self, "deleteSubComponentContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[QDSchemaQDClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 100 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AAC8[v3 - 100]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 4)
    return 0;
  else
    return off_1E562AAF0[a3 - 100];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[QDSchemaQDClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 100 > 4)
    return CFSTR("com.apple.aiml.siri.qd.QDClientEvent");
  else
    return *(&off_1E563DC80 + v2 - 100);
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[QDSchemaQDClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setCollectionContext:(id)a3
{
  QDSchemaQDCollectionContext *v4;
  QDSchemaQDEntitiesCollected *entitiesCollected;
  QDSchemaQDTuplesGenerated *tuplesGenerated;
  QDSchemaQDEntitiesRanked *entitiesRanked;
  QDSchemaQDSubComponentContext *subComponentContext;
  unint64_t v9;
  QDSchemaQDCollectionContext *collectionContext;

  v4 = (QDSchemaQDCollectionContext *)a3;
  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  v9 = 100;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  collectionContext = self->_collectionContext;
  self->_collectionContext = v4;

}

- (QDSchemaQDCollectionContext)collectionContext
{
  if (self->_whichEvent_Type == 100)
    return self->_collectionContext;
  else
    return (QDSchemaQDCollectionContext *)0;
}

- (void)deleteCollectionContext
{
  QDSchemaQDCollectionContext *collectionContext;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    collectionContext = self->_collectionContext;
    self->_collectionContext = 0;

  }
}

- (void)setEntitiesCollected:(id)a3
{
  QDSchemaQDEntitiesCollected *v4;
  QDSchemaQDCollectionContext *collectionContext;
  QDSchemaQDTuplesGenerated *tuplesGenerated;
  QDSchemaQDEntitiesRanked *entitiesRanked;
  QDSchemaQDSubComponentContext *subComponentContext;
  unint64_t v9;
  QDSchemaQDEntitiesCollected *entitiesCollected;

  v4 = (QDSchemaQDEntitiesCollected *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = v4;

}

- (QDSchemaQDEntitiesCollected)entitiesCollected
{
  if (self->_whichEvent_Type == 101)
    return self->_entitiesCollected;
  else
    return (QDSchemaQDEntitiesCollected *)0;
}

- (void)deleteEntitiesCollected
{
  QDSchemaQDEntitiesCollected *entitiesCollected;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    entitiesCollected = self->_entitiesCollected;
    self->_entitiesCollected = 0;

  }
}

- (void)setTuplesGenerated:(id)a3
{
  QDSchemaQDTuplesGenerated *v4;
  QDSchemaQDCollectionContext *collectionContext;
  QDSchemaQDEntitiesCollected *entitiesCollected;
  QDSchemaQDEntitiesRanked *entitiesRanked;
  QDSchemaQDSubComponentContext *subComponentContext;
  unint64_t v9;
  QDSchemaQDTuplesGenerated *tuplesGenerated;

  v4 = (QDSchemaQDTuplesGenerated *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = v4;

}

- (QDSchemaQDTuplesGenerated)tuplesGenerated
{
  if (self->_whichEvent_Type == 102)
    return self->_tuplesGenerated;
  else
    return (QDSchemaQDTuplesGenerated *)0;
}

- (void)deleteTuplesGenerated
{
  QDSchemaQDTuplesGenerated *tuplesGenerated;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    tuplesGenerated = self->_tuplesGenerated;
    self->_tuplesGenerated = 0;

  }
}

- (void)setEntitiesRanked:(id)a3
{
  QDSchemaQDEntitiesRanked *v4;
  QDSchemaQDCollectionContext *collectionContext;
  QDSchemaQDEntitiesCollected *entitiesCollected;
  QDSchemaQDTuplesGenerated *tuplesGenerated;
  QDSchemaQDSubComponentContext *subComponentContext;
  unint64_t v9;
  QDSchemaQDEntitiesRanked *entitiesRanked;

  v4 = (QDSchemaQDEntitiesRanked *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = v4;

}

- (QDSchemaQDEntitiesRanked)entitiesRanked
{
  if (self->_whichEvent_Type == 103)
    return self->_entitiesRanked;
  else
    return (QDSchemaQDEntitiesRanked *)0;
}

- (void)deleteEntitiesRanked
{
  QDSchemaQDEntitiesRanked *entitiesRanked;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    entitiesRanked = self->_entitiesRanked;
    self->_entitiesRanked = 0;

  }
}

- (void)setSubComponentContext:(id)a3
{
  QDSchemaQDSubComponentContext *v4;
  QDSchemaQDCollectionContext *collectionContext;
  QDSchemaQDEntitiesCollected *entitiesCollected;
  QDSchemaQDTuplesGenerated *tuplesGenerated;
  QDSchemaQDEntitiesRanked *entitiesRanked;
  unint64_t v9;
  QDSchemaQDSubComponentContext *subComponentContext;

  v4 = (QDSchemaQDSubComponentContext *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = v4;

}

- (QDSchemaQDSubComponentContext)subComponentContext
{
  if (self->_whichEvent_Type == 104)
    return self->_subComponentContext;
  else
    return (QDSchemaQDSubComponentContext *)0;
}

- (void)deleteSubComponentContext
{
  QDSchemaQDSubComponentContext *subComponentContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    subComponentContext = self->_subComponentContext;
    self->_subComponentContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDClientEventReadFrom(self, (uint64_t)a3);
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
  id v16;

  v16 = a3;
  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_33;
  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitiesCollected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitiesCollected");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tuplesGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tuplesGenerated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitiesRanked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitiesRanked");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subComponentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subComponentContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[QDSchemaQDClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[QDSchemaQDCollectionContext hash](self->_collectionContext, "hash") ^ v3;
  v5 = -[QDSchemaQDEntitiesCollected hash](self->_entitiesCollected, "hash");
  v6 = v4 ^ v5 ^ -[QDSchemaQDTuplesGenerated hash](self->_tuplesGenerated, "hash");
  v7 = -[QDSchemaQDEntitiesRanked hash](self->_entitiesRanked, "hash");
  return v6 ^ v7 ^ -[QDSchemaQDSubComponentContext hash](self->_subComponentContext, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_collectionContext)
  {
    -[QDSchemaQDClientEvent collectionContext](self, "collectionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("collectionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("collectionContext"));

    }
  }
  if (self->_entitiesCollected)
  {
    -[QDSchemaQDClientEvent entitiesCollected](self, "entitiesCollected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entitiesCollected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entitiesCollected"));

    }
  }
  if (self->_entitiesRanked)
  {
    -[QDSchemaQDClientEvent entitiesRanked](self, "entitiesRanked");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entitiesRanked"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("entitiesRanked"));

    }
  }
  if (self->_eventMetadata)
  {
    -[QDSchemaQDClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  if (self->_subComponentContext)
  {
    -[QDSchemaQDClientEvent subComponentContext](self, "subComponentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("subComponentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subComponentContext"));

    }
  }
  if (self->_tuplesGenerated)
  {
    -[QDSchemaQDClientEvent tuplesGenerated](self, "tuplesGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("tuplesGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("tuplesGenerated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDClientEvent)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDClientEvent *v5;
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
    self = -[QDSchemaQDClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDClientEvent)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDClientEvent *v5;
  void *v6;
  QDSchemaQDClientEventMetadata *v7;
  void *v8;
  QDSchemaQDCollectionContext *v9;
  void *v10;
  QDSchemaQDEntitiesCollected *v11;
  void *v12;
  QDSchemaQDTuplesGenerated *v13;
  void *v14;
  QDSchemaQDEntitiesRanked *v15;
  void *v16;
  QDSchemaQDSubComponentContext *v17;
  QDSchemaQDClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)QDSchemaQDClientEvent;
  v5 = -[QDSchemaQDClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[QDSchemaQDClientEventMetadata initWithDictionary:]([QDSchemaQDClientEventMetadata alloc], "initWithDictionary:", v6);
      -[QDSchemaQDClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[QDSchemaQDCollectionContext initWithDictionary:]([QDSchemaQDCollectionContext alloc], "initWithDictionary:", v8);
      -[QDSchemaQDClientEvent setCollectionContext:](v5, "setCollectionContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitiesCollected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[QDSchemaQDEntitiesCollected initWithDictionary:]([QDSchemaQDEntitiesCollected alloc], "initWithDictionary:", v10);
      -[QDSchemaQDClientEvent setEntitiesCollected:](v5, "setEntitiesCollected:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tuplesGenerated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[QDSchemaQDTuplesGenerated initWithDictionary:]([QDSchemaQDTuplesGenerated alloc], "initWithDictionary:", v12);
      -[QDSchemaQDClientEvent setTuplesGenerated:](v5, "setTuplesGenerated:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitiesRanked"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[QDSchemaQDEntitiesRanked initWithDictionary:]([QDSchemaQDEntitiesRanked alloc], "initWithDictionary:", v14);
      -[QDSchemaQDClientEvent setEntitiesRanked:](v5, "setEntitiesRanked:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subComponentContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[QDSchemaQDSubComponentContext initWithDictionary:]([QDSchemaQDSubComponentContext alloc], "initWithDictionary:", v16);
      -[QDSchemaQDClientEvent setSubComponentContext:](v5, "setSubComponentContext:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (QDSchemaQDClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasCollectionContext
{
  return self->_hasCollectionContext;
}

- (void)setHasCollectionContext:(BOOL)a3
{
  self->_hasCollectionContext = a3;
}

- (BOOL)hasEntitiesCollected
{
  return self->_hasEntitiesCollected;
}

- (void)setHasEntitiesCollected:(BOOL)a3
{
  self->_hasEntitiesCollected = a3;
}

- (BOOL)hasTuplesGenerated
{
  return self->_hasTuplesGenerated;
}

- (void)setHasTuplesGenerated:(BOOL)a3
{
  self->_hasTuplesGenerated = a3;
}

- (BOOL)hasEntitiesRanked
{
  return self->_hasEntitiesRanked;
}

- (void)setHasEntitiesRanked:(BOOL)a3
{
  self->_hasEntitiesRanked = a3;
}

- (BOOL)hasSubComponentContext
{
  return self->_hasSubComponentContext;
}

- (void)setHasSubComponentContext:(BOOL)a3
{
  self->_hasSubComponentContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subComponentContext, 0);
  objc_storeStrong((id *)&self->_entitiesRanked, 0);
  objc_storeStrong((id *)&self->_tuplesGenerated, 0);
  objc_storeStrong((id *)&self->_entitiesCollected, 0);
  objc_storeStrong((id *)&self->_collectionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 95;
}

@end
