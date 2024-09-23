@implementation ICPBDGSResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSResponse;
  -[ICPBDGSResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPBDGSResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  ICPBDGSStartDelegationResponse *startDelegationResponse;
  void *v6;
  ICPBDGSFinishDelegationResponse *finishDelegationResponse;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_requestUniqueID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("requestUniqueID"));

  }
  startDelegationResponse = self->_startDelegationResponse;
  if (startDelegationResponse)
  {
    -[ICPBDGSStartDelegationResponse dictionaryRepresentation](startDelegationResponse, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("startDelegationResponse"));

  }
  finishDelegationResponse = self->_finishDelegationResponse;
  if (finishDelegationResponse)
  {
    -[ICPBDGSFinishDelegationResponse dictionaryRepresentation](finishDelegationResponse, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("finishDelegationResponse"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_startDelegationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_finishDelegationResponse)
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
    *(_DWORD *)(v5 + 16) = self->_requestUniqueID;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[ICPBDGSStartDelegationResponse copyWithZone:](self->_startDelegationResponse, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[ICPBDGSFinishDelegationResponse copyWithZone:](self->_finishDelegationResponse, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ICPBDGSStartDelegationResponse *startDelegationResponse;
  ICPBDGSFinishDelegationResponse *finishDelegationResponse;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_requestUniqueID != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  startDelegationResponse = self->_startDelegationResponse;
  if ((unint64_t)startDelegationResponse | *((_QWORD *)v4 + 3)
    && !-[ICPBDGSStartDelegationResponse isEqual:](startDelegationResponse, "isEqual:"))
  {
    goto LABEL_11;
  }
  finishDelegationResponse = self->_finishDelegationResponse;
  if ((unint64_t)finishDelegationResponse | *((_QWORD *)v4 + 1))
    v7 = -[ICPBDGSFinishDelegationResponse isEqual:](finishDelegationResponse, "isEqual:");
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
    v3 = 2654435761 * self->_requestUniqueID;
  else
    v3 = 0;
  v4 = -[ICPBDGSStartDelegationResponse hash](self->_startDelegationResponse, "hash") ^ v3;
  return v4 ^ -[ICPBDGSFinishDelegationResponse hash](self->_finishDelegationResponse, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDelegationResponse, 0);
  objc_storeStrong((id *)&self->_finishDelegationResponse, 0);
}

@end
