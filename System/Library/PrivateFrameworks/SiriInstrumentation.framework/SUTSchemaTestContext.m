@implementation SUTSchemaTestContext

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
  v9.super_class = (Class)SUTSchemaTestContext;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SUTSchemaTestContext deleteTestSessionInfo](self, "deleteTestSessionInfo");
  return v5;
}

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (void)deleteTestName
{
  -[SUTSchemaTestContext setTestName:](self, "setTestName:", 0);
}

- (void)setTestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_testType = a3;
}

- (BOOL)hasTestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTestType
{
  -[SUTSchemaTestContext setTestType:](self, "setTestType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTestSessionInfo
{
  return self->_testSessionInfo != 0;
}

- (void)deleteTestSessionInfo
{
  -[SUTSchemaTestContext setTestSessionInfo:](self, "setTestSessionInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SUTSchemaTestContext testName](self, "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int testType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SUTSchemaTestContext testName](self, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SUTSchemaTestContext testName](self, "testName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUTSchemaTestContext testName](self, "testName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    testType = self->_testType;
    if (testType != objc_msgSend(v4, "testType"))
      goto LABEL_15;
  }
  -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testSessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testSessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_testName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_testType;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[SUTSchemaTestSessionInfo hash](self->_testSessionInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_testName)
  {
    -[SUTSchemaTestContext testName](self, "testName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("testName"));

  }
  if (self->_testSessionInfo)
  {
    -[SUTSchemaTestContext testSessionInfo](self, "testSessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("testSessionInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("testSessionInfo"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = -[SUTSchemaTestContext testType](self, "testType") - 1;
    if (v9 > 3)
      v10 = CFSTR("TESTTYPE_UNKNOWN");
    else
      v10 = off_1E5638390[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("testType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUTSchemaTestContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUTSchemaTestContext)initWithJSON:(id)a3
{
  void *v4;
  SUTSchemaTestContext *v5;
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
    self = -[SUTSchemaTestContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUTSchemaTestContext)initWithDictionary:(id)a3
{
  id v4;
  SUTSchemaTestContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUTSchemaTestSessionInfo *v10;
  SUTSchemaTestContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUTSchemaTestContext;
  v5 = -[SUTSchemaTestContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SUTSchemaTestContext setTestName:](v5, "setTestName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTSchemaTestContext setTestType:](v5, "setTestType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testSessionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SUTSchemaTestSessionInfo initWithDictionary:]([SUTSchemaTestSessionInfo alloc], "initWithDictionary:", v9);
      -[SUTSchemaTestContext setTestSessionInfo:](v5, "setTestSessionInfo:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)testType
{
  return self->_testType;
}

- (SUTSchemaTestSessionInfo)testSessionInfo
{
  return self->_testSessionInfo;
}

- (void)setTestSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_testSessionInfo, a3);
}

- (void)setHasTestName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTestSessionInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSessionInfo, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
