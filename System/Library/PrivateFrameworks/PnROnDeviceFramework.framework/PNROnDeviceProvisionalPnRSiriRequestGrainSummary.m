@implementation PNROnDeviceProvisionalPnRSiriRequestGrainSummary

- (BOOL)hasTurnId
{
  return self->_turnId != 0;
}

- (void)deleteTurnId
{
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setTurnId:](self, "setTurnId:", 0);
}

- (BOOL)hasRequestStatus
{
  return self->_requestStatus != 0;
}

- (void)deleteRequestStatus
{
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setRequestStatus:](self, "setRequestStatus:", 0);
}

- (BOOL)hasSrt
{
  return self->_srt != 0;
}

- (void)deleteSrt
{
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setSrt:](self, "setSrt:", 0);
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setError:](self, "setError:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(self, (uint64_t)a3);
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
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary turnId](self, "turnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary requestStatus](self, "requestStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary turnId](self, "turnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary turnId](self, "turnId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary turnId](self, "turnId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary requestStatus](self, "requestStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary requestStatus](self, "requestStatus");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary requestStatus](self, "requestStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "srt");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary error](self, "error");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary error](self, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_turnId, "hash");
  v4 = -[NSString hash](self->_requestStatus, "hash") ^ v3;
  v5 = -[PNROnDeviceProvisionalPNRIntervalDurationMetric hash](self->_srt, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_error, "hash");
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
  if (self->_error)
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("error"));

  }
  if (self->_requestStatus)
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary requestStatus](self, "requestStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("requestStatus"));

  }
  if (self->_srt)
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary srt](self, "srt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("srt"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("srt"));

    }
  }
  if (self->_turnId)
  {
    -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary turnId](self, "turnId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("turnId"));

  }
  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithJSON:(id)a3
{
  void *v4;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v5;
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
    self = -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithDictionary:(id)a3
{
  id v4;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PNROnDeviceProvisionalPNRIntervalDurationMetric *v11;
  void *v12;
  void *v13;
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PNROnDeviceProvisionalPnRSiriRequestGrainSummary;
  v5 = -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setTurnId:](v5, "setTurnId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setRequestStatus:](v5, "setRequestStatus:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PNROnDeviceProvisionalPNRIntervalDurationMetric initWithDictionary:]([PNROnDeviceProvisionalPNRIntervalDurationMetric alloc], "initWithDictionary:", v10);
      -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setSrt:](v5, "setSrt:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PNROnDeviceProvisionalPnRSiriRequestGrainSummary setError:](v5, "setError:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)turnId
{
  return self->_turnId;
}

- (void)setTurnId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)srt
{
  return self->_srt;
}

- (void)setSrt:(id)a3
{
  objc_storeStrong((id *)&self->_srt, a3);
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasTurnId:(BOOL)a3
{
  self->_hasTurnId = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  self->_hasRequestStatus = a3;
}

- (void)setHasSrt:(BOOL)a3
{
  self->_hasSrt = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_srt, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
}

@end
