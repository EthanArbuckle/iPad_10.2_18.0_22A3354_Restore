@implementation INFERENCESchemaINFERENCEContactMatch

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INFERENCESchemaINFERENCEContactMatch;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEContactMatch deleteContactValue](self, "deleteContactValue");
  -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEContactMatch deleteContactSignalSet](self, "deleteContactSignalSet");
  -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCEContactMatch deleteBackgroundSignalSet](self, "deleteBackgroundSignalSet");
  -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[INFERENCESchemaINFERENCEContactMatch deleteFeatureSet](self, "deleteFeatureSet");

  return v5;
}

- (BOOL)hasContactValue
{
  return self->_contactValue != 0;
}

- (void)deleteContactValue
{
  -[INFERENCESchemaINFERENCEContactMatch setContactValue:](self, "setContactValue:", 0);
}

- (BOOL)hasContactSignalSet
{
  return self->_contactSignalSet != 0;
}

- (void)deleteContactSignalSet
{
  -[INFERENCESchemaINFERENCEContactMatch setContactSignalSet:](self, "setContactSignalSet:", 0);
}

- (BOOL)hasBackgroundSignalSet
{
  return self->_backgroundSignalSet != 0;
}

- (void)deleteBackgroundSignalSet
{
  -[INFERENCESchemaINFERENCEContactMatch setBackgroundSignalSet:](self, "setBackgroundSignalSet:", 0);
}

- (BOOL)hasFeatureSet
{
  return self->_featureSet != 0;
}

- (void)deleteFeatureSet
{
  -[INFERENCESchemaINFERENCEContactMatch setFeatureSet:](self, "setFeatureSet:", 0);
}

- (void)setScore:(float)a3
{
  *(&self->_isShownToUser + 1) |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(&self->_isShownToUser + 1);
}

- (void)setHasScore:(BOOL)a3
{
  *(&self->_isShownToUser + 1) = *(&self->_isShownToUser + 1) & 0xFE | a3;
}

- (void)deleteScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactMatch setScore:](self, "setScore:", v2);
  *(&self->_isShownToUser + 1) &= ~1u;
}

- (void)setIsShownToUser:(BOOL)a3
{
  *(&self->_isShownToUser + 1) |= 2u;
  self->_isShownToUser = a3;
}

- (BOOL)hasIsShownToUser
{
  return (*((unsigned __int8 *)&self->_isShownToUser + 1) >> 1) & 1;
}

- (void)setHasIsShownToUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isShownToUser + 1) = *(&self->_isShownToUser + 1) & 0xFD | v3;
}

- (void)deleteIsShownToUser
{
  -[INFERENCESchemaINFERENCEContactMatch setIsShownToUser:](self, "setIsShownToUser:", 0);
  *(&self->_isShownToUser + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEContactMatchReadFrom(self, (uint64_t)a3, v3);
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
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v12 = *(&self->_isShownToUser + 1);
  if ((v12 & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v12 = *(&self->_isShownToUser + 1);
  }
  v13 = v14;
  if ((v12 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  BOOL v27;
  unsigned int v29;
  unsigned int v30;
  float score;
  float v32;
  int v33;
  int isShownToUser;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSignalSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSignalSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundSignalSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundSignalSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  v29 = *((unsigned __int8 *)&self->_isShownToUser + 1);
  v30 = v4[45];
  if ((v29 & 1) == (v30 & 1))
  {
    if ((v29 & 1) != 0)
    {
      score = self->_score;
      objc_msgSend(v4, "score");
      if (score != v32)
        goto LABEL_22;
      v29 = *((unsigned __int8 *)&self->_isShownToUser + 1);
      v30 = v4[45];
    }
    v33 = (v29 >> 1) & 1;
    if (v33 == ((v30 >> 1) & 1))
    {
      if (!v33
        || (isShownToUser = self->_isShownToUser, isShownToUser == objc_msgSend(v4, "isShownToUser")))
      {
        v27 = 1;
        goto LABEL_23;
      }
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  float score;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;

  v3 = -[INFERENCESchemaINFERENCEContact hash](self->_contactValue, "hash");
  v4 = -[INFERENCESchemaINFERENCEContactSignalSet hash](self->_contactSignalSet, "hash");
  v5 = -[INFERENCESchemaINFERENCEBackgroundContactSignalSet hash](self->_backgroundSignalSet, "hash");
  v6 = -[INFERENCESchemaINFERENCEContactFeatureSet hash](self->_featureSet, "hash");
  v7 = *(&self->_isShownToUser + 1);
  if ((v7 & 1) != 0)
  {
    score = self->_score;
    v10 = score;
    if (score < 0.0)
      v10 = -score;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((v7 & 2) != 0)
    v13 = 2654435761 * self->_isShownToUser;
  else
    v13 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
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
  char v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundSignalSet)
  {
    -[INFERENCESchemaINFERENCEContactMatch backgroundSignalSet](self, "backgroundSignalSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundSignalSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundSignalSet"));

    }
  }
  if (self->_contactSignalSet)
  {
    -[INFERENCESchemaINFERENCEContactMatch contactSignalSet](self, "contactSignalSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contactSignalSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactSignalSet"));

    }
  }
  if (self->_contactValue)
  {
    -[INFERENCESchemaINFERENCEContactMatch contactValue](self, "contactValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contactValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("contactValue"));

    }
  }
  if (self->_featureSet)
  {
    -[INFERENCESchemaINFERENCEContactMatch featureSet](self, "featureSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("featureSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("featureSet"));

    }
  }
  v16 = *(&self->_isShownToUser + 1);
  if ((v16 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactMatch isShownToUser](self, "isShownToUser"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isShownToUser"));

    v16 = *(&self->_isShownToUser + 1);
  }
  if ((v16 & 1) != 0)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactMatch score](self, "score");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("score"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactMatch dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactMatch)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactMatch *v5;
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
    self = -[INFERENCESchemaINFERENCEContactMatch initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactMatch)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactMatch *v5;
  void *v6;
  INFERENCESchemaINFERENCEContact *v7;
  void *v8;
  INFERENCESchemaINFERENCEContactSignalSet *v9;
  void *v10;
  INFERENCESchemaINFERENCEBackgroundContactSignalSet *v11;
  void *v12;
  INFERENCESchemaINFERENCEContactFeatureSet *v13;
  void *v14;
  void *v15;
  INFERENCESchemaINFERENCEContactMatch *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEContactMatch;
  v5 = -[INFERENCESchemaINFERENCEContactMatch init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCEContact initWithDictionary:]([INFERENCESchemaINFERENCEContact alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEContactMatch setContactValue:](v5, "setContactValue:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSignalSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[INFERENCESchemaINFERENCEContactSignalSet initWithDictionary:]([INFERENCESchemaINFERENCEContactSignalSet alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEContactMatch setContactSignalSet:](v5, "setContactSignalSet:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundSignalSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[INFERENCESchemaINFERENCEBackgroundContactSignalSet initWithDictionary:]([INFERENCESchemaINFERENCEBackgroundContactSignalSet alloc], "initWithDictionary:", v10);
      -[INFERENCESchemaINFERENCEContactMatch setBackgroundSignalSet:](v5, "setBackgroundSignalSet:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[INFERENCESchemaINFERENCEContactFeatureSet initWithDictionary:]([INFERENCESchemaINFERENCEContactFeatureSet alloc], "initWithDictionary:", v12);
      -[INFERENCESchemaINFERENCEContactMatch setFeatureSet:](v5, "setFeatureSet:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[INFERENCESchemaINFERENCEContactMatch setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShownToUser"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactMatch setIsShownToUser:](v5, "setIsShownToUser:", objc_msgSend(v15, "BOOLValue"));
    v16 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCEContact)contactValue
{
  return self->_contactValue;
}

- (void)setContactValue:(id)a3
{
  objc_storeStrong((id *)&self->_contactValue, a3);
}

- (INFERENCESchemaINFERENCEContactSignalSet)contactSignalSet
{
  return self->_contactSignalSet;
}

- (void)setContactSignalSet:(id)a3
{
  objc_storeStrong((id *)&self->_contactSignalSet, a3);
}

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)backgroundSignalSet
{
  return self->_backgroundSignalSet;
}

- (void)setBackgroundSignalSet:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSignalSet, a3);
}

- (INFERENCESchemaINFERENCEContactFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void)setFeatureSet:(id)a3
{
  objc_storeStrong((id *)&self->_featureSet, a3);
}

- (float)score
{
  return self->_score;
}

- (BOOL)isShownToUser
{
  return self->_isShownToUser;
}

- (void)setHasContactValue:(BOOL)a3
{
  *(&self->_isShownToUser + 2) = a3;
}

- (void)setHasContactSignalSet:(BOOL)a3
{
  *(&self->_isShownToUser + 3) = a3;
}

- (void)setHasBackgroundSignalSet:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasFeatureSet:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_backgroundSignalSet, 0);
  objc_storeStrong((id *)&self->_contactSignalSet, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);
}

@end
