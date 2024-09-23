@implementation PKProtobufRemotePaymentResponse

- (BOOL)hasPayment
{
  return self->_payment != 0;
}

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
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
  v8.super_class = (Class)PKProtobufRemotePaymentResponse;
  -[PKProtobufRemotePaymentResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRemotePaymentResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PKProtobufPayment *payment;
  void *v5;
  NSString *remotePaymentRequestIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  payment = self->_payment;
  if (payment)
  {
    -[PKProtobufPayment dictionaryRepresentation](payment, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("payment"));

  }
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", remotePaymentRequestIdentifier, CFSTR("remotePaymentRequestIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemotePaymentResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_payment)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_remotePaymentRequestIdentifier)
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
  if (self->_payment)
  {
    objc_msgSend(v4, "setPayment:");
    v4 = v5;
  }
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v5, "setRemotePaymentRequestIdentifier:");
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
  v6 = -[PKProtobufPayment copyWithZone:](self->_payment, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_remotePaymentRequestIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKProtobufPayment *payment;
  NSString *remotePaymentRequestIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((payment = self->_payment, !((unint64_t)payment | v4[1]))
     || -[PKProtobufPayment isEqual:](payment, "isEqual:")))
  {
    remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
    if ((unint64_t)remotePaymentRequestIdentifier | v4[2])
      v7 = -[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:");
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

  v3 = -[PKProtobufPayment hash](self->_payment, "hash");
  return -[NSString hash](self->_remotePaymentRequestIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufPayment *payment;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  payment = self->_payment;
  v6 = v4[1];
  v7 = v4;
  if (payment)
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufPayment mergeFrom:](payment, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufRemotePaymentResponse setPayment:](self, "setPayment:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[PKProtobufRemotePaymentResponse setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
    v4 = v7;
  }

}

- (PKProtobufPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
  objc_storeStrong((id *)&self->_payment, a3);
}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_payment, 0);
}

@end
