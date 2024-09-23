@implementation SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier;
  -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionId;
  NSString *clientSessionId;
  NSString *clientRequestId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("session_id"));
  clientSessionId = self->_clientSessionId;
  if (clientSessionId)
    objc_msgSend(v4, "setObject:forKey:", clientSessionId, CFSTR("client_session_id"));
  clientRequestId = self->_clientRequestId;
  if (clientRequestId)
    objc_msgSend(v4, "setObject:forKey:", clientRequestId, CFSTR("client_request_id"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionId)
  {
    objc_msgSend(v4, "setSessionId:");
    v4 = v5;
  }
  if (self->_clientSessionId)
  {
    objc_msgSend(v5, "setClientSessionId:");
    v4 = v5;
  }
  if (self->_clientRequestId)
  {
    objc_msgSend(v5, "setClientRequestId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_clientSessionId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_clientRequestId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sessionId;
  NSString *clientSessionId;
  NSString *clientRequestId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | v4[3]))
     || -[NSString isEqual:](sessionId, "isEqual:"))
    && ((clientSessionId = self->_clientSessionId, !((unint64_t)clientSessionId | v4[2]))
     || -[NSString isEqual:](clientSessionId, "isEqual:")))
  {
    clientRequestId = self->_clientRequestId;
    if ((unint64_t)clientRequestId | v4[1])
      v8 = -[NSString isEqual:](clientRequestId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_sessionId, "hash");
  v4 = -[NSString hash](self->_clientSessionId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_clientRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setSessionId:](self, "setSessionId:");
  if (v4[2])
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setClientSessionId:](self, "setClientSessionId:");
  if (v4[1])
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier setClientRequestId:](self, "setClientRequestId:");

}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setClientSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_clientSessionId, a3);
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
}

@end
