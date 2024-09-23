@implementation PBBProtoRemoteActivationFailureReport

- (BOOL)hasActivationError
{
  return self->_activationError != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoRemoteActivationFailureReport;
  -[PBBProtoRemoteActivationFailureReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoRemoteActivationFailureReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *activationError;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  activationError = self->_activationError;
  if (activationError)
    objc_msgSend(v3, "setObject:forKey:", activationError, CFSTR("activationError"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoRemoteActivationFailureReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_activationError)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  NSData *activationError;

  activationError = self->_activationError;
  if (activationError)
    objc_msgSend(a3, "setActivationError:", activationError);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_activationError, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *activationError;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    activationError = self->_activationError;
    if ((unint64_t)activationError | v4[1])
      v6 = -[NSData isEqual:](activationError, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_activationError, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[PBBProtoRemoteActivationFailureReport setActivationError:](self, "setActivationError:");
}

- (NSData)activationError
{
  return self->_activationError;
}

- (void)setActivationError:(id)a3
{
  objc_storeStrong((id *)&self->_activationError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationError, 0);
}

@end
