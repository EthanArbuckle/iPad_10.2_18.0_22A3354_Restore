@implementation PKProtobufRemotePaymentRequest

- (BOOL)hasPaymentRequest
{
  return self->_paymentRequest != 0;
}

- (BOOL)hasPaymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setPaymentType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaymentType
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PKProtobufRemotePaymentRequest;
  -[PKProtobufRemotePaymentRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PKProtobufPaymentRequest *paymentRequest;
  void *v5;
  NSString *paymentApplicationIdentifier;
  NSString *identifier;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentRequest = self->_paymentRequest;
  if (paymentRequest)
  {
    -[PKProtobufPaymentRequest dictionaryRepresentation](paymentRequest, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paymentRequest"));

  }
  paymentApplicationIdentifier = self->_paymentApplicationIdentifier;
  if (paymentApplicationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", paymentApplicationIdentifier, CFSTR("paymentApplicationIdentifier"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_paymentType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("paymentType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemotePaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_paymentRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paymentApplicationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 2;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_paymentRequest)
  {
    objc_msgSend(v4, "setPaymentRequest:");
    v4 = v5;
  }
  if (self->_paymentApplicationIdentifier)
  {
    objc_msgSend(v5, "setPaymentApplicationIdentifier:");
    v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_paymentType;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKProtobufPaymentRequest copyWithZone:](self->_paymentRequest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_paymentApplicationIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_paymentType;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PKProtobufPaymentRequest *paymentRequest;
  NSString *paymentApplicationIdentifier;
  NSString *identifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  paymentRequest = self->_paymentRequest;
  if ((unint64_t)paymentRequest | *((_QWORD *)v4 + 3))
  {
    if (!-[PKProtobufPaymentRequest isEqual:](paymentRequest, "isEqual:"))
      goto LABEL_12;
  }
  paymentApplicationIdentifier = self->_paymentApplicationIdentifier;
  if ((unint64_t)paymentApplicationIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](paymentApplicationIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_paymentType == *((_DWORD *)v4 + 8))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[PKProtobufPaymentRequest hash](self->_paymentRequest, "hash");
  v4 = -[NSString hash](self->_paymentApplicationIdentifier, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_paymentType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PKProtobufPaymentRequest *paymentRequest;
  uint64_t v6;
  id v7;

  v4 = a3;
  paymentRequest = self->_paymentRequest;
  v6 = *((_QWORD *)v4 + 3);
  v7 = v4;
  if (paymentRequest)
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufPaymentRequest mergeFrom:](paymentRequest, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufRemotePaymentRequest setPaymentRequest:](self, "setPaymentRequest:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufRemotePaymentRequest setPaymentApplicationIdentifier:](self, "setPaymentApplicationIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufRemotePaymentRequest setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (PKProtobufPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)paymentType
{
  return self->_paymentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
