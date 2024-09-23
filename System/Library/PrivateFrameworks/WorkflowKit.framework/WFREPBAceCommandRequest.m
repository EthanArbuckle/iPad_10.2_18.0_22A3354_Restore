@implementation WFREPBAceCommandRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAceCommandRequest;
  -[WFREPBAceCommandRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAceCommandRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *aceCommandData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  aceCommandData = self->_aceCommandData;
  if (aceCommandData)
    objc_msgSend(v3, "setObject:forKey:", aceCommandData, CFSTR("aceCommandData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAceCommandRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_aceCommandData)
    __assert_rtn("-[WFREPBAceCommandRequest writeTo:]", "WFREPBAceCommandRequest.m", 72, "nil != self->_aceCommandData");
  v5 = v4;
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setAceCommandData:", self->_aceCommandData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_aceCommandData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *aceCommandData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    aceCommandData = self->_aceCommandData;
    if ((unint64_t)aceCommandData | v4[1])
      v6 = -[NSData isEqual:](aceCommandData, "isEqual:");
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
  return -[NSData hash](self->_aceCommandData, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[WFREPBAceCommandRequest setAceCommandData:](self, "setAceCommandData:");
}

- (NSData)aceCommandData
{
  return self->_aceCommandData;
}

- (void)setAceCommandData:(id)a3
{
  objc_storeStrong((id *)&self->_aceCommandData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceCommandData, 0);
}

@end
