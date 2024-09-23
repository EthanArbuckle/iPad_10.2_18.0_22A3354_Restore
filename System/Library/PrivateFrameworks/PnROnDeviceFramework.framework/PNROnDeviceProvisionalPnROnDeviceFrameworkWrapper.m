@implementation PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return CFSTR("com.apple.aiml.pnrondeviceframework.PnROnDeviceFrameworkWrapper");
}

- (id)getVersion
{
  return &unk_2515234B8;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper whichEventtype](self, "whichEventtype");
  v3 = CFSTR("com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper.ProvisionalPnRSiriRequestGrainDebugSummary");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper.ProvisionalPnRSiriRequestGrainSummary");
  else
    return (id)v3;
}

- (void)setSiriRequestGrainMetrics:(id)a3
{
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v4;
  PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *siriRequestGrainDebugSummary;
  unint64_t v6;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *siriRequestGrainMetrics;

  v4 = (PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)a3;
  siriRequestGrainDebugSummary = self->_siriRequestGrainDebugSummary;
  self->_siriRequestGrainDebugSummary = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEventtype = v6;
  siriRequestGrainMetrics = self->_siriRequestGrainMetrics;
  self->_siriRequestGrainMetrics = v4;

}

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)siriRequestGrainMetrics
{
  if (self->_whichEventtype == 101)
    return self->_siriRequestGrainMetrics;
  else
    return (PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)0;
}

- (void)deleteSiriRequestGrainMetrics
{
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *siriRequestGrainMetrics;

  if (self->_whichEventtype == 101)
  {
    self->_whichEventtype = 0;
    siriRequestGrainMetrics = self->_siriRequestGrainMetrics;
    self->_siriRequestGrainMetrics = 0;

  }
}

- (void)setSiriRequestGrainDebugSummary:(id)a3
{
  PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *v4;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *siriRequestGrainMetrics;
  unint64_t v6;
  PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *siriRequestGrainDebugSummary;

  v4 = (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)a3;
  siriRequestGrainMetrics = self->_siriRequestGrainMetrics;
  self->_siriRequestGrainMetrics = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEventtype = v6;
  siriRequestGrainDebugSummary = self->_siriRequestGrainDebugSummary;
  self->_siriRequestGrainDebugSummary = v4;

}

- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)siriRequestGrainDebugSummary
{
  if (self->_whichEventtype == 102)
    return self->_siriRequestGrainDebugSummary;
  else
    return (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)0;
}

- (void)deleteSiriRequestGrainDebugSummary
{
  PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *siriRequestGrainDebugSummary;

  if (self->_whichEventtype == 102)
  {
    self->_whichEventtype = 0;
    siriRequestGrainDebugSummary = self->_siriRequestGrainDebugSummary;
    self->_siriRequestGrainDebugSummary = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPnROnDeviceFrameworkWrapperReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEventtype;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichEventtype = self->_whichEventtype;
  if (whichEventtype != objc_msgSend(v4, "whichEventtype"))
    goto LABEL_13;
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriRequestGrainMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriRequestGrainMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriRequestGrainDebugSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriRequestGrainDebugSummary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary hash](self->_siriRequestGrainMetrics, "hash");
  return -[PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary hash](self->_siriRequestGrainDebugSummary, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_siriRequestGrainDebugSummary)
  {
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainDebugSummary](self, "siriRequestGrainDebugSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("siriRequestGrainDebugSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("siriRequestGrainDebugSummary"));

    }
  }
  if (self->_siriRequestGrainMetrics)
  {
    -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper siriRequestGrainMetrics](self, "siriRequestGrainMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriRequestGrainMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriRequestGrainMetrics"));

    }
  }
  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithJSON:(id)a3
{
  void *v4;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *v5;
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
    self = -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithDictionary:(id)a3
{
  id v4;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *v5;
  void *v6;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v7;
  void *v8;
  PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *v9;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper;
  v5 = -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriRequestGrainMetrics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary initWithDictionary:]([PNROnDeviceProvisionalPnRSiriRequestGrainSummary alloc], "initWithDictionary:", v6);
      -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper setSiriRequestGrainMetrics:](v5, "setSiriRequestGrainMetrics:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriRequestGrainDebugSummary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary initWithDictionary:]([PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary alloc], "initWithDictionary:", v8);
      -[PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper setSiriRequestGrainDebugSummary:](v5, "setSiriRequestGrainDebugSummary:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (BOOL)hasSiriRequestGrainMetrics
{
  return self->_hasSiriRequestGrainMetrics;
}

- (void)setHasSiriRequestGrainMetrics:(BOOL)a3
{
  self->_hasSiriRequestGrainMetrics = a3;
}

- (BOOL)hasSiriRequestGrainDebugSummary
{
  return self->_hasSiriRequestGrainDebugSummary;
}

- (void)setHasSiriRequestGrainDebugSummary:(BOOL)a3
{
  self->_hasSiriRequestGrainDebugSummary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriRequestGrainDebugSummary, 0);
  objc_storeStrong((id *)&self->_siriRequestGrainMetrics, 0);
}

@end
