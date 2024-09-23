@implementation SUTSchemaTestExecutionEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerprint");
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

  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerprint");
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
        LODWORD(v4) = 26;
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
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUTSchemaTestExecutionEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUTSchemaTestExecutionEvent deleteMetadata](self, "deleteMetadata");
  -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUTSchemaTestExecutionEvent deleteTestExecutionBegin](self, "deleteTestExecutionBegin");
  -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SUTSchemaTestExecutionEvent deleteTestExecutionEnd](self, "deleteTestExecutionEnd");
  -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SUTSchemaTestExecutionEvent deleteTestAssociatedSchemaIdentifier](self, "deleteTestAssociatedSchemaIdentifier");
  -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SUTSchemaTestExecutionEvent deleteTestOutcomeRecorded](self, "deleteTestOutcomeRecorded");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SUTSchemaTestExecutionEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AFC8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3)
    return 0;
  else
    return off_1E562AFE8[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SUTSchemaTestExecutionEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 3)
    return CFSTR("com.apple.aiml.siri.siriundertest.TestExecutionEvent");
  else
    return off_1E56383D8[v2 - 101];
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)deleteMetadata
{
  -[SUTSchemaTestExecutionEvent setMetadata:](self, "setMetadata:", 0);
}

- (void)setTestExecutionBegin:(id)a3
{
  SUTSchemaTestExecutionBegin *v4;
  SUTSchemaTestExecutionEnd *testExecutionEnd;
  SUTSchemaTestAssociatedSchemaIdentifier *testAssociatedSchemaIdentifier;
  SUTSchemaTestOutcomeRecorded *testOutcomeRecorded;
  unint64_t v8;
  SUTSchemaTestExecutionBegin *testExecutionBegin;

  v4 = (SUTSchemaTestExecutionBegin *)a3;
  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  v8 = 101;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = v4;

}

- (SUTSchemaTestExecutionBegin)testExecutionBegin
{
  if (self->_whichEvent_Type == 101)
    return self->_testExecutionBegin;
  else
    return (SUTSchemaTestExecutionBegin *)0;
}

- (void)deleteTestExecutionBegin
{
  SUTSchemaTestExecutionBegin *testExecutionBegin;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    testExecutionBegin = self->_testExecutionBegin;
    self->_testExecutionBegin = 0;

  }
}

- (void)setTestExecutionEnd:(id)a3
{
  SUTSchemaTestExecutionEnd *v4;
  SUTSchemaTestExecutionBegin *testExecutionBegin;
  SUTSchemaTestAssociatedSchemaIdentifier *testAssociatedSchemaIdentifier;
  SUTSchemaTestOutcomeRecorded *testOutcomeRecorded;
  unint64_t v8;
  SUTSchemaTestExecutionEnd *testExecutionEnd;

  v4 = (SUTSchemaTestExecutionEnd *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  v8 = 102;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = v4;

}

- (SUTSchemaTestExecutionEnd)testExecutionEnd
{
  if (self->_whichEvent_Type == 102)
    return self->_testExecutionEnd;
  else
    return (SUTSchemaTestExecutionEnd *)0;
}

- (void)deleteTestExecutionEnd
{
  SUTSchemaTestExecutionEnd *testExecutionEnd;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    testExecutionEnd = self->_testExecutionEnd;
    self->_testExecutionEnd = 0;

  }
}

- (void)setTestAssociatedSchemaIdentifier:(id)a3
{
  SUTSchemaTestAssociatedSchemaIdentifier *v4;
  SUTSchemaTestExecutionBegin *testExecutionBegin;
  SUTSchemaTestExecutionEnd *testExecutionEnd;
  SUTSchemaTestOutcomeRecorded *testOutcomeRecorded;
  unint64_t v8;
  SUTSchemaTestAssociatedSchemaIdentifier *testAssociatedSchemaIdentifier;

  v4 = (SUTSchemaTestAssociatedSchemaIdentifier *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = 0;

  v8 = 103;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = v4;

}

- (SUTSchemaTestAssociatedSchemaIdentifier)testAssociatedSchemaIdentifier
{
  if (self->_whichEvent_Type == 103)
    return self->_testAssociatedSchemaIdentifier;
  else
    return (SUTSchemaTestAssociatedSchemaIdentifier *)0;
}

- (void)deleteTestAssociatedSchemaIdentifier
{
  SUTSchemaTestAssociatedSchemaIdentifier *testAssociatedSchemaIdentifier;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
    self->_testAssociatedSchemaIdentifier = 0;

  }
}

- (void)setTestOutcomeRecorded:(id)a3
{
  SUTSchemaTestOutcomeRecorded *v4;
  SUTSchemaTestExecutionBegin *testExecutionBegin;
  SUTSchemaTestExecutionEnd *testExecutionEnd;
  SUTSchemaTestAssociatedSchemaIdentifier *testAssociatedSchemaIdentifier;
  unint64_t v8;
  SUTSchemaTestOutcomeRecorded *testOutcomeRecorded;

  v4 = (SUTSchemaTestOutcomeRecorded *)a3;
  testExecutionBegin = self->_testExecutionBegin;
  self->_testExecutionBegin = 0;

  testExecutionEnd = self->_testExecutionEnd;
  self->_testExecutionEnd = 0;

  testAssociatedSchemaIdentifier = self->_testAssociatedSchemaIdentifier;
  self->_testAssociatedSchemaIdentifier = 0;

  v8 = 104;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  testOutcomeRecorded = self->_testOutcomeRecorded;
  self->_testOutcomeRecorded = v4;

}

- (SUTSchemaTestOutcomeRecorded)testOutcomeRecorded
{
  if (self->_whichEvent_Type == 104)
    return self->_testOutcomeRecorded;
  else
    return (SUTSchemaTestOutcomeRecorded *)0;
}

- (void)deleteTestOutcomeRecorded
{
  SUTSchemaTestOutcomeRecorded *testOutcomeRecorded;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    testOutcomeRecorded = self->_testOutcomeRecorded;
    self->_testOutcomeRecorded = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestExecutionEventReadFrom(self, (uint64_t)a3);
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
  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
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
  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testExecutionBegin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testExecutionBegin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testExecutionEnd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testExecutionEnd");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testAssociatedSchemaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testAssociatedSchemaIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testOutcomeRecorded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testOutcomeRecorded");
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

  v3 = -[SUTSchemaTestExecutionMetadata hash](self->_metadata, "hash");
  v4 = -[SUTSchemaTestExecutionBegin hash](self->_testExecutionBegin, "hash") ^ v3;
  v5 = -[SUTSchemaTestExecutionEnd hash](self->_testExecutionEnd, "hash");
  v6 = v4 ^ v5 ^ -[SUTSchemaTestAssociatedSchemaIdentifier hash](self->_testAssociatedSchemaIdentifier, "hash");
  return v6 ^ -[SUTSchemaTestOutcomeRecorded hash](self->_testOutcomeRecorded, "hash");
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
  if (self->_metadata)
  {
    -[SUTSchemaTestExecutionEvent metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("metadata"));

    }
  }
  if (self->_testAssociatedSchemaIdentifier)
  {
    -[SUTSchemaTestExecutionEvent testAssociatedSchemaIdentifier](self, "testAssociatedSchemaIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("testAssociatedSchemaIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("testAssociatedSchemaIdentifier"));

    }
  }
  if (self->_testExecutionBegin)
  {
    -[SUTSchemaTestExecutionEvent testExecutionBegin](self, "testExecutionBegin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("testExecutionBegin"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("testExecutionBegin"));

    }
  }
  if (self->_testExecutionEnd)
  {
    -[SUTSchemaTestExecutionEvent testExecutionEnd](self, "testExecutionEnd");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("testExecutionEnd"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("testExecutionEnd"));

    }
  }
  if (self->_testOutcomeRecorded)
  {
    -[SUTSchemaTestExecutionEvent testOutcomeRecorded](self, "testOutcomeRecorded");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("testOutcomeRecorded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("testOutcomeRecorded"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUTSchemaTestExecutionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUTSchemaTestExecutionEvent)initWithJSON:(id)a3
{
  void *v4;
  SUTSchemaTestExecutionEvent *v5;
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
    self = -[SUTSchemaTestExecutionEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUTSchemaTestExecutionEvent)initWithDictionary:(id)a3
{
  id v4;
  SUTSchemaTestExecutionEvent *v5;
  void *v6;
  SUTSchemaTestExecutionMetadata *v7;
  void *v8;
  SUTSchemaTestExecutionBegin *v9;
  void *v10;
  SUTSchemaTestExecutionEnd *v11;
  void *v12;
  SUTSchemaTestAssociatedSchemaIdentifier *v13;
  void *v14;
  SUTSchemaTestOutcomeRecorded *v15;
  SUTSchemaTestExecutionEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUTSchemaTestExecutionEvent;
  v5 = -[SUTSchemaTestExecutionEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SUTSchemaTestExecutionMetadata initWithDictionary:]([SUTSchemaTestExecutionMetadata alloc], "initWithDictionary:", v6);
      -[SUTSchemaTestExecutionEvent setMetadata:](v5, "setMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testExecutionBegin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUTSchemaTestExecutionBegin initWithDictionary:]([SUTSchemaTestExecutionBegin alloc], "initWithDictionary:", v8);
      -[SUTSchemaTestExecutionEvent setTestExecutionBegin:](v5, "setTestExecutionBegin:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testExecutionEnd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SUTSchemaTestExecutionEnd initWithDictionary:]([SUTSchemaTestExecutionEnd alloc], "initWithDictionary:", v10);
      -[SUTSchemaTestExecutionEvent setTestExecutionEnd:](v5, "setTestExecutionEnd:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testAssociatedSchemaIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SUTSchemaTestAssociatedSchemaIdentifier initWithDictionary:]([SUTSchemaTestAssociatedSchemaIdentifier alloc], "initWithDictionary:", v12);
      -[SUTSchemaTestExecutionEvent setTestAssociatedSchemaIdentifier:](v5, "setTestAssociatedSchemaIdentifier:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testOutcomeRecorded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SUTSchemaTestOutcomeRecorded initWithDictionary:]([SUTSchemaTestOutcomeRecorded alloc], "initWithDictionary:", v14);
      -[SUTSchemaTestExecutionEvent setTestOutcomeRecorded:](v5, "setTestOutcomeRecorded:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SUTSchemaTestExecutionMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (BOOL)hasTestExecutionBegin
{
  return self->_hasTestExecutionBegin;
}

- (void)setHasTestExecutionBegin:(BOOL)a3
{
  self->_hasTestExecutionBegin = a3;
}

- (BOOL)hasTestExecutionEnd
{
  return self->_hasTestExecutionEnd;
}

- (void)setHasTestExecutionEnd:(BOOL)a3
{
  self->_hasTestExecutionEnd = a3;
}

- (BOOL)hasTestAssociatedSchemaIdentifier
{
  return self->_hasTestAssociatedSchemaIdentifier;
}

- (void)setHasTestAssociatedSchemaIdentifier:(BOOL)a3
{
  self->_hasTestAssociatedSchemaIdentifier = a3;
}

- (BOOL)hasTestOutcomeRecorded
{
  return self->_hasTestOutcomeRecorded;
}

- (void)setHasTestOutcomeRecorded:(BOOL)a3
{
  self->_hasTestOutcomeRecorded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOutcomeRecorded, 0);
  objc_storeStrong((id *)&self->_testAssociatedSchemaIdentifier, 0);
  objc_storeStrong((id *)&self->_testExecutionEnd, 0);
  objc_storeStrong((id *)&self->_testExecutionBegin, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (int)getAnyEventType
{
  return 8;
}

@end
