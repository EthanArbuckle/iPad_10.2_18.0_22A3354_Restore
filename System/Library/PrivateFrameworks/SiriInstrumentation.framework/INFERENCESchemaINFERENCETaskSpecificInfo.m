@implementation INFERENCESchemaINFERENCETaskSpecificInfo

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCETaskSpecificInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCETaskSpecificInfo deleteLongRunningTaskInfo](self, "deleteLongRunningTaskInfo");
  return v5;
}

- (void)setLongRunningTaskInfo:(id)a3
{
  self->_whichTaskinfo = a3 != 0;
  objc_storeStrong((id *)&self->_longRunningTaskInfo, a3);
}

- (INFERENCESchemaINFERENCELongRunningTaskInfo)longRunningTaskInfo
{
  if (self->_whichTaskinfo == 1)
    return self->_longRunningTaskInfo;
  else
    return (INFERENCESchemaINFERENCELongRunningTaskInfo *)0;
}

- (void)deleteLongRunningTaskInfo
{
  INFERENCESchemaINFERENCELongRunningTaskInfo *longRunningTaskInfo;

  if (self->_whichTaskinfo == 1)
  {
    self->_whichTaskinfo = 0;
    longRunningTaskInfo = self->_longRunningTaskInfo;
    self->_longRunningTaskInfo = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCETaskSpecificInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichTaskinfo;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichTaskinfo = self->_whichTaskinfo;
    if (whichTaskinfo == objc_msgSend(v4, "whichTaskinfo"))
    {
      -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "longRunningTaskInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "longRunningTaskInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  return -[INFERENCESchemaINFERENCELongRunningTaskInfo hash](self->_longRunningTaskInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_longRunningTaskInfo)
  {
    -[INFERENCESchemaINFERENCETaskSpecificInfo longRunningTaskInfo](self, "longRunningTaskInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("longRunningTaskInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("longRunningTaskInfo"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCETaskSpecificInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCETaskSpecificInfo *v5;
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
    self = -[INFERENCESchemaINFERENCETaskSpecificInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCETaskSpecificInfo *v5;
  void *v6;
  INFERENCESchemaINFERENCELongRunningTaskInfo *v7;
  INFERENCESchemaINFERENCETaskSpecificInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCETaskSpecificInfo;
  v5 = -[INFERENCESchemaINFERENCETaskSpecificInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longRunningTaskInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCELongRunningTaskInfo initWithDictionary:]([INFERENCESchemaINFERENCELongRunningTaskInfo alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCETaskSpecificInfo setLongRunningTaskInfo:](v5, "setLongRunningTaskInfo:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichTaskinfo
{
  return self->_whichTaskinfo;
}

- (BOOL)hasLongRunningTaskInfo
{
  return self->_hasLongRunningTaskInfo;
}

- (void)setHasLongRunningTaskInfo:(BOOL)a3
{
  self->_hasLongRunningTaskInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longRunningTaskInfo, 0);
}

@end
