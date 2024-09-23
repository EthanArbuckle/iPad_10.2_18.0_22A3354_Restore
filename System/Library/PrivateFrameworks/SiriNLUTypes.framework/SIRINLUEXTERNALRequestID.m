@implementation SIRINLUEXTERNALRequestID

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasLoggableUserId
{
  return self->_loggableUserId != 0;
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (BOOL)hasConnectionId
{
  return self->_connectionId != 0;
}

- (int)requester
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_requester;
  else
    return 0;
}

- (void)setRequester:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requester = a3;
}

- (void)setHasRequester:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequester
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)requesterAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7BAF528[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequester:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_ORCHESTRATOR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_CURARE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_LIGHTHOUSE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_XCODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CDM_REQUESTER_SPOTLIGHT")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALRequestID;
  -[SIRINLUEXTERNALRequestID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALRequestID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idA;
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v7;
  NSString *userId;
  NSString *loggableUserId;
  NSString *trpId;
  NSString *connectionId;
  uint64_t requester;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idA = self->_idA;
  if (idA)
    objc_msgSend(v3, "setObject:forKey:", idA, CFSTR("id_a"));
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("nlu_request_id"));

  }
  userId = self->_userId;
  if (userId)
    objc_msgSend(v4, "setObject:forKey:", userId, CFSTR("user_id"));
  loggableUserId = self->_loggableUserId;
  if (loggableUserId)
    objc_msgSend(v4, "setObject:forKey:", loggableUserId, CFSTR("loggable_user_id"));
  trpId = self->_trpId;
  if (trpId)
    objc_msgSend(v4, "setObject:forKey:", trpId, CFSTR("trp_id"));
  connectionId = self->_connectionId;
  if (connectionId)
    objc_msgSend(v4, "setObject:forKey:", connectionId, CFSTR("connection_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    requester = self->_requester;
    if (requester >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requester);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E7BAF528[requester];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("requester"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRequestIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_idA)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nluRequestId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_loggableUserId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_trpId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_connectionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    v4 = v5;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
    v4 = v5;
  }
  if (self->_userId)
  {
    objc_msgSend(v5, "setUserId:");
    v4 = v5;
  }
  if (self->_loggableUserId)
  {
    objc_msgSend(v5, "setLoggableUserId:");
    v4 = v5;
  }
  if (self->_trpId)
  {
    objc_msgSend(v5, "setTrpId:");
    v4 = v5;
  }
  if (self->_connectionId)
  {
    objc_msgSend(v5, "setConnectionId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_requester;
    *((_BYTE *)v4 + 64) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_loggableUserId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_trpId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_connectionId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_requester;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *idA;
  SIRINLUEXTERNALUUID *nluRequestId;
  NSString *userId;
  NSString *loggableUserId;
  NSString *trpId;
  NSString *connectionId;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  idA = self->_idA;
  if ((unint64_t)idA | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](idA, "isEqual:"))
      goto LABEL_18;
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:"))
      goto LABEL_18;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_18;
  }
  loggableUserId = self->_loggableUserId;
  if ((unint64_t)loggableUserId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](loggableUserId, "isEqual:"))
      goto LABEL_18;
  }
  trpId = self->_trpId;
  if ((unint64_t)trpId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](trpId, "isEqual:"))
      goto LABEL_18;
  }
  connectionId = self->_connectionId;
  if ((unint64_t)connectionId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](connectionId, "isEqual:"))
      goto LABEL_18;
  }
  v11 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_requester == *((_DWORD *)v4 + 10))
    {
      v11 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_idA, "hash");
  v4 = -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
  v5 = -[NSString hash](self->_userId, "hash");
  v6 = -[NSString hash](self->_loggableUserId, "hash");
  v7 = -[NSString hash](self->_trpId, "hash");
  v8 = -[NSString hash](self->_connectionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_requester;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SIRINLUEXTERNALRequestID setIdA:](self, "setIdA:");
    v4 = v7;
  }
  nluRequestId = self->_nluRequestId;
  v6 = *((_QWORD *)v4 + 4);
  if (nluRequestId)
  {
    if (!v6)
      goto LABEL_9;
    -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[SIRINLUEXTERNALRequestID setNluRequestId:](self, "setNluRequestId:");
  }
  v4 = v7;
LABEL_9:
  if (*((_QWORD *)v4 + 7))
  {
    -[SIRINLUEXTERNALRequestID setUserId:](self, "setUserId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SIRINLUEXTERNALRequestID setLoggableUserId:](self, "setLoggableUserId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SIRINLUEXTERNALRequestID setTrpId:](self, "setTrpId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SIRINLUEXTERNALRequestID setConnectionId:](self, "setConnectionId:");
    v4 = v7;
  }
  if ((v4[16] & 1) != 0)
  {
    self->_requester = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)idA
{
  return self->_idA;
}

- (void)setIdA:(id)a3
{
  objc_storeStrong((id *)&self->_idA, a3);
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)loggableUserId
{
  return self->_loggableUserId;
}

- (void)setLoggableUserId:(id)a3
{
  objc_storeStrong((id *)&self->_loggableUserId, a3);
}

- (NSString)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_connectionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_loggableUserId, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
}

@end
