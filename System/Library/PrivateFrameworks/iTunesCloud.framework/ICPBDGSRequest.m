@implementation ICPBDGSRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSRequest;
  -[ICPBDGSRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPBDGSRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  ICPBDGSStartDelegationRequest *startDelegationRequest;
  void *v6;
  ICPBDGSFinishDelegationRequest *finishDelegationRequest;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uniqueID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("uniqueID"));

  }
  startDelegationRequest = self->_startDelegationRequest;
  if (startDelegationRequest)
  {
    -[ICPBDGSStartDelegationRequest dictionaryRepresentation](startDelegationRequest, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("startDelegationRequest"));

  }
  finishDelegationRequest = self->_finishDelegationRequest;
  if (finishDelegationRequest)
  {
    -[ICPBDGSFinishDelegationRequest dictionaryRepresentation](finishDelegationRequest, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("finishDelegationRequest"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_startDelegationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_finishDelegationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_uniqueID;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[ICPBDGSStartDelegationRequest copyWithZone:](self->_startDelegationRequest, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[ICPBDGSFinishDelegationRequest copyWithZone:](self->_finishDelegationRequest, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ICPBDGSStartDelegationRequest *startDelegationRequest;
  ICPBDGSFinishDelegationRequest *finishDelegationRequest;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_uniqueID != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  startDelegationRequest = self->_startDelegationRequest;
  if ((unint64_t)startDelegationRequest | *((_QWORD *)v4 + 2)
    && !-[ICPBDGSStartDelegationRequest isEqual:](startDelegationRequest, "isEqual:"))
  {
    goto LABEL_11;
  }
  finishDelegationRequest = self->_finishDelegationRequest;
  if ((unint64_t)finishDelegationRequest | *((_QWORD *)v4 + 1))
    v7 = -[ICPBDGSFinishDelegationRequest isEqual:](finishDelegationRequest, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_uniqueID;
  else
    v3 = 0;
  v4 = -[ICPBDGSStartDelegationRequest hash](self->_startDelegationRequest, "hash") ^ v3;
  return v4 ^ -[ICPBDGSFinishDelegationRequest hash](self->_finishDelegationRequest, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDelegationRequest, 0);
  objc_storeStrong((id *)&self->_finishDelegationRequest, 0);
}

@end
