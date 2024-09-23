@implementation SignedParticipantPayload

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
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
  v8.super_class = (Class)SignedParticipantPayload;
  -[SignedParticipantPayload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignedParticipantPayload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DecryptedParticipantPayload *payload;
  void *v5;
  NSData *signature;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  payload = self->_payload;
  if (payload)
  {
    -[DecryptedParticipantPayload dictionaryRepresentation](payload, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("payload"));

  }
  signature = self->_signature;
  if (signature)
    objc_msgSend(v3, "setObject:forKey:", signature, CFSTR("signature"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SignedParticipantPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_payload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_payload)
  {
    objc_msgSend(v4, "setPayload:");
    v4 = v5;
  }
  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DecryptedParticipantPayload copyWithZone:](self->_payload, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DecryptedParticipantPayload *payload;
  NSData *signature;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((payload = self->_payload, !((unint64_t)payload | v4[1]))
     || -[DecryptedParticipantPayload isEqual:](payload, "isEqual:")))
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[2])
      v7 = -[NSData isEqual:](signature, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DecryptedParticipantPayload hash](self->_payload, "hash");
  return -[NSData hash](self->_signature, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  DecryptedParticipantPayload *payload;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  payload = self->_payload;
  v6 = v4[1];
  v7 = v4;
  if (payload)
  {
    if (!v6)
      goto LABEL_7;
    -[DecryptedParticipantPayload mergeFrom:](payload, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SignedParticipantPayload setPayload:](self, "setPayload:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[SignedParticipantPayload setSignature:](self, "setSignature:");
    v4 = v7;
  }

}

- (DecryptedParticipantPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
