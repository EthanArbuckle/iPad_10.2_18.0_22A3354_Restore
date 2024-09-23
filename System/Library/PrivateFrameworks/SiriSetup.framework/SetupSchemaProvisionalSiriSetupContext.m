@implementation SetupSchemaProvisionalSiriSetupContext

- (void)setStarted:(id)a3
{
  SetupSchemaProvisionalSiriSetupStarted *v4;
  SetupSchemaProvisionalSiriSetupEnded *ended;
  SetupSchemaProvisionalSiriSetupStep *step;
  SetupSchemaProvisionalSiriSetupStarted *started;

  v4 = (SetupSchemaProvisionalSiriSetupStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  step = self->_step;
  self->_step = 0;

  self->_whichContextevent = v4 != 0;
  started = self->_started;
  self->_started = v4;

}

- (SetupSchemaProvisionalSiriSetupStarted)started
{
  if (self->_whichContextevent == 1)
    return self->_started;
  else
    return (SetupSchemaProvisionalSiriSetupStarted *)0;
}

- (void)deleteStarted
{
  SetupSchemaProvisionalSiriSetupStarted *started;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    started = self->_started;
    self->_started = 0;

  }
}

- (void)setEnded:(id)a3
{
  SetupSchemaProvisionalSiriSetupEnded *v4;
  SetupSchemaProvisionalSiriSetupStarted *started;
  SetupSchemaProvisionalSiriSetupStep *step;
  SetupSchemaProvisionalSiriSetupEnded *ended;

  v4 = (SetupSchemaProvisionalSiriSetupEnded *)a3;
  started = self->_started;
  self->_started = 0;

  step = self->_step;
  self->_step = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (SetupSchemaProvisionalSiriSetupEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (SetupSchemaProvisionalSiriSetupEnded *)0;
}

- (void)deleteEnded
{
  SetupSchemaProvisionalSiriSetupEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setStep:(id)a3
{
  SetupSchemaProvisionalSiriSetupStep *v4;
  SetupSchemaProvisionalSiriSetupStarted *started;
  SetupSchemaProvisionalSiriSetupEnded *ended;
  unint64_t v7;
  SetupSchemaProvisionalSiriSetupStep *step;

  v4 = (SetupSchemaProvisionalSiriSetupStep *)a3;
  started = self->_started;
  self->_started = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  step = self->_step;
  self->_step = v4;

}

- (SetupSchemaProvisionalSiriSetupStep)step
{
  if (self->_whichContextevent == 3)
    return self->_step;
  else
    return (SetupSchemaProvisionalSiriSetupStep *)0;
}

- (void)deleteStep
{
  SetupSchemaProvisionalSiriSetupStep *step;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    step = self->_step;
    self->_step = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichContextevent;
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
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_18;
  -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "started");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "started");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "step");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "step");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SetupSchemaProvisionalSiriSetupStarted hash](self->_started, "hash");
  v4 = -[SetupSchemaProvisionalSiriSetupEnded hash](self->_ended, "hash") ^ v3;
  return v4 ^ -[SetupSchemaProvisionalSiriSetupStep hash](self->_step, "hash");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ended)
  {
    -[SetupSchemaProvisionalSiriSetupContext ended](self, "ended");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));

    }
  }
  if (self->_started)
  {
    -[SetupSchemaProvisionalSiriSetupContext started](self, "started");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("started"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("started"));

    }
  }
  if (self->_step)
  {
    -[SetupSchemaProvisionalSiriSetupContext step](self, "step");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("step"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("step"));

    }
  }
  -[SetupSchemaProvisionalSiriSetupContext willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SetupSchemaProvisionalSiriSetupContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupContext)initWithJSON:(id)a3
{
  void *v4;
  SetupSchemaProvisionalSiriSetupContext *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[SetupSchemaProvisionalSiriSetupContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupContext)initWithDictionary:(id)a3
{
  id v4;
  SetupSchemaProvisionalSiriSetupContext *v5;
  void *v6;
  SetupSchemaProvisionalSiriSetupStarted *v7;
  void *v8;
  SetupSchemaProvisionalSiriSetupEnded *v9;
  void *v10;
  SetupSchemaProvisionalSiriSetupStep *v11;
  SetupSchemaProvisionalSiriSetupContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SetupSchemaProvisionalSiriSetupContext;
  v5 = -[SetupSchemaProvisionalSiriSetupContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("started"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SetupSchemaProvisionalSiriSetupStarted initWithDictionary:]([SetupSchemaProvisionalSiriSetupStarted alloc], "initWithDictionary:", v6);
      -[SetupSchemaProvisionalSiriSetupContext setStarted:](v5, "setStarted:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SetupSchemaProvisionalSiriSetupEnded initWithDictionary:]([SetupSchemaProvisionalSiriSetupEnded alloc], "initWithDictionary:", v8);
      -[SetupSchemaProvisionalSiriSetupContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("step"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SetupSchemaProvisionalSiriSetupStep initWithDictionary:]([SetupSchemaProvisionalSiriSetupStep alloc], "initWithDictionary:", v10);
      -[SetupSchemaProvisionalSiriSetupContext setStep:](v5, "setStep:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasStep
{
  return self->_hasStep;
}

- (void)setHasStep:(BOOL)a3
{
  self->_hasStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

@end
