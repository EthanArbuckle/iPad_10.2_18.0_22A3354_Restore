@implementation WFREPBRunRequest

- (id)payloadTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("SingleActionExecution");
  if (a3 == 2)
  {
    v3 = CFSTR("WorkflowExecution");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPayloadType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SingleActionExecution")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("WorkflowExecution")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequest;
  -[WFREPBRunRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRunRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int payloadType;
  __CFString *v5;
  NSData *payload;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  payloadType = self->_payloadType;
  if (payloadType == 1)
  {
    v5 = CFSTR("SingleActionExecution");
  }
  else if (payloadType == 2)
  {
    v5 = CFSTR("WorkflowExecution");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_payloadType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("payloadType"));

  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_payload)
    __assert_rtn("-[WFREPBRunRequest writeTo:]", "WFREPBRunRequest.m", 91, "nil != self->_payload");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_payloadType;
  objc_msgSend(a3, "setPayload:", self->_payload);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_payloadType;
  v6 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *payload;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_payloadType == *((_DWORD *)v4 + 4))
  {
    payload = self->_payload;
    if ((unint64_t)payload | v4[1])
      v6 = -[NSData isEqual:](payload, "isEqual:");
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
  uint64_t v2;

  v2 = 2654435761 * self->_payloadType;
  return -[NSData hash](self->_payload, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_payloadType = *((_DWORD *)a3 + 4);
  if (*((_QWORD *)a3 + 1))
    -[WFREPBRunRequest setPayload:](self, "setPayload:");
}

- (int)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(int)a3
{
  self->_payloadType = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
