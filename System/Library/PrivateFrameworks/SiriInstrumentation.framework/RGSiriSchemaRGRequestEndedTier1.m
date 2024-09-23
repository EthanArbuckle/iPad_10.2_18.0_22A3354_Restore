@implementation RGSiriSchemaRGRequestEndedTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RGSiriSchemaRGRequestEndedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[RGSiriSchemaRGRequestEndedTier1 deleteDisplayString](self, "deleteDisplayString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteSpokenString](self, "deleteSpokenString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteCatId](self, "deleteCatId");
    -[RGSiriSchemaRGRequestEndedTier1 deleteStaticDialogId](self, "deleteStaticDialogId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[RGSiriSchemaRGRequestEndedTier1 deleteDisplayString](self, "deleteDisplayString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteSpokenString](self, "deleteSpokenString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteCatId](self, "deleteCatId");
    -[RGSiriSchemaRGRequestEndedTier1 deleteStaticDialogId](self, "deleteStaticDialogId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[RGSiriSchemaRGRequestEndedTier1 deleteDisplayString](self, "deleteDisplayString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteSpokenString](self, "deleteSpokenString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteCatId](self, "deleteCatId");
    -[RGSiriSchemaRGRequestEndedTier1 deleteStaticDialogId](self, "deleteStaticDialogId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[RGSiriSchemaRGRequestEndedTier1 deleteDisplayString](self, "deleteDisplayString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteSpokenString](self, "deleteSpokenString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteCatId](self, "deleteCatId");
    -[RGSiriSchemaRGRequestEndedTier1 deleteStaticDialogId](self, "deleteStaticDialogId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[RGSiriSchemaRGRequestEndedTier1 deleteDisplayString](self, "deleteDisplayString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteSpokenString](self, "deleteSpokenString");
    -[RGSiriSchemaRGRequestEndedTier1 deleteCatId](self, "deleteCatId");
    -[RGSiriSchemaRGRequestEndedTier1 deleteStaticDialogId](self, "deleteStaticDialogId");
  }
  -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RGSiriSchemaRGRequestEndedTier1 deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[RGSiriSchemaRGRequestEndedTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
}

- (void)deleteDisplayString
{
  -[RGSiriSchemaRGRequestEndedTier1 setDisplayString:](self, "setDisplayString:", 0);
}

- (BOOL)hasSpokenString
{
  return self->_spokenString != 0;
}

- (void)deleteSpokenString
{
  -[RGSiriSchemaRGRequestEndedTier1 setSpokenString:](self, "setSpokenString:", 0);
}

- (BOOL)hasCatId
{
  return self->_catId != 0;
}

- (void)deleteCatId
{
  -[RGSiriSchemaRGRequestEndedTier1 setCatId:](self, "setCatId:", 0);
}

- (BOOL)hasStaticDialogId
{
  return self->_staticDialogId != 0;
}

- (void)deleteStaticDialogId
{
  -[RGSiriSchemaRGRequestEndedTier1 setStaticDialogId:](self, "setStaticDialogId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGRequestEndedTier1ReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGRequestEndedTier1 displayString](self, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[RGSiriSchemaRGRequestEndedTier1 spokenString](self, "spokenString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[RGSiriSchemaRGRequestEndedTier1 catId](self, "catId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[RGSiriSchemaRGRequestEndedTier1 staticDialogId](self, "staticDialogId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[RGSiriSchemaRGRequestEndedTier1 displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RGSiriSchemaRGRequestEndedTier1 displayString](self, "displayString");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[RGSiriSchemaRGRequestEndedTier1 displayString](self, "displayString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[RGSiriSchemaRGRequestEndedTier1 spokenString](self, "spokenString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RGSiriSchemaRGRequestEndedTier1 spokenString](self, "spokenString");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RGSiriSchemaRGRequestEndedTier1 spokenString](self, "spokenString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spokenString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[RGSiriSchemaRGRequestEndedTier1 catId](self, "catId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[RGSiriSchemaRGRequestEndedTier1 catId](self, "catId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[RGSiriSchemaRGRequestEndedTier1 catId](self, "catId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[RGSiriSchemaRGRequestEndedTier1 staticDialogId](self, "staticDialogId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "staticDialogId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[RGSiriSchemaRGRequestEndedTier1 staticDialogId](self, "staticDialogId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[RGSiriSchemaRGRequestEndedTier1 staticDialogId](self, "staticDialogId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "staticDialogId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSString hash](self->_displayString, "hash") ^ v3;
  v5 = -[NSString hash](self->_spokenString, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_catId, "hash");
  return v6 ^ -[NSString hash](self->_staticDialogId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_catId)
  {
    -[RGSiriSchemaRGRequestEndedTier1 catId](self, "catId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("catId"));

  }
  if (self->_displayString)
  {
    -[RGSiriSchemaRGRequestEndedTier1 displayString](self, "displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("displayString"));

  }
  if (self->_linkId)
  {
    -[RGSiriSchemaRGRequestEndedTier1 linkId](self, "linkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));

    }
  }
  if (self->_spokenString)
  {
    -[RGSiriSchemaRGRequestEndedTier1 spokenString](self, "spokenString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("spokenString"));

  }
  if (self->_staticDialogId)
  {
    -[RGSiriSchemaRGRequestEndedTier1 staticDialogId](self, "staticDialogId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("staticDialogId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RGSiriSchemaRGRequestEndedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RGSiriSchemaRGRequestEndedTier1)initWithJSON:(id)a3
{
  void *v4;
  RGSiriSchemaRGRequestEndedTier1 *v5;
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
    self = -[RGSiriSchemaRGRequestEndedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RGSiriSchemaRGRequestEndedTier1)initWithDictionary:(id)a3
{
  id v4;
  RGSiriSchemaRGRequestEndedTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RGSiriSchemaRGRequestEndedTier1 *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RGSiriSchemaRGRequestEndedTier1;
  v5 = -[RGSiriSchemaRGRequestEndedTier1 init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[RGSiriSchemaRGRequestEndedTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[RGSiriSchemaRGRequestEndedTier1 setDisplayString:](v5, "setDisplayString:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[RGSiriSchemaRGRequestEndedTier1 setSpokenString:](v5, "setSpokenString:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[RGSiriSchemaRGRequestEndedTier1 setCatId:](v5, "setCatId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("staticDialogId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[RGSiriSchemaRGRequestEndedTier1 setStaticDialogId:](v5, "setStaticDialogId:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)spokenString
{
  return self->_spokenString;
}

- (void)setSpokenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)staticDialogId
{
  return self->_staticDialogId;
}

- (void)setStaticDialogId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasDisplayString:(BOOL)a3
{
  self->_hasDisplayString = a3;
}

- (void)setHasSpokenString:(BOOL)a3
{
  self->_hasSpokenString = a3;
}

- (void)setHasCatId:(BOOL)a3
{
  self->_hasCatId = a3;
}

- (void)setHasStaticDialogId:(BOOL)a3
{
  self->_hasStaticDialogId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticDialogId, 0);
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
