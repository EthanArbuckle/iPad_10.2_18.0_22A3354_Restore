@implementation PKProtobufPaymentHostUpdate

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (BOOL)hasShippingMethod
{
  return self->_shippingMethod != 0;
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
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
  v8.super_class = (Class)PKProtobufPaymentHostUpdate;
  -[PKProtobufPaymentHostUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentHostUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *remotePaymentRequestIdentifier;
  NSData *shippingContact;
  PKProtobufShippingMethod *shippingMethod;
  void *v8;
  PKProtobufPaymentMethod *paymentMethod;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", remotePaymentRequestIdentifier, CFSTR("remotePaymentRequestIdentifier"));
  shippingContact = self->_shippingContact;
  if (shippingContact)
    objc_msgSend(v4, "setObject:forKey:", shippingContact, CFSTR("shippingContact"));
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    -[PKProtobufShippingMethod dictionaryRepresentation](shippingMethod, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("shippingMethod"));

  }
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    -[PKProtobufPaymentMethod dictionaryRepresentation](paymentMethod, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("paymentMethod"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentHostUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shippingContact)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_shippingMethod)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paymentMethod)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v4, "setRemotePaymentRequestIdentifier:");
    v4 = v5;
  }
  if (self->_shippingContact)
  {
    objc_msgSend(v5, "setShippingContact:");
    v4 = v5;
  }
  if (self->_shippingMethod)
  {
    objc_msgSend(v5, "setShippingMethod:");
    v4 = v5;
  }
  if (self->_paymentMethod)
  {
    objc_msgSend(v5, "setPaymentMethod:");
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
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_remotePaymentRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_shippingContact, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[PKProtobufShippingMethod copyWithZone:](self->_shippingMethod, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[PKProtobufPaymentMethod copyWithZone:](self->_paymentMethod, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *remotePaymentRequestIdentifier;
  NSData *shippingContact;
  PKProtobufShippingMethod *shippingMethod;
  PKProtobufPaymentMethod *paymentMethod;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier,
         !((unint64_t)remotePaymentRequestIdentifier | v4[2]))
     || -[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:"))
    && ((shippingContact = self->_shippingContact, !((unint64_t)shippingContact | v4[3]))
     || -[NSData isEqual:](shippingContact, "isEqual:"))
    && ((shippingMethod = self->_shippingMethod, !((unint64_t)shippingMethod | v4[4]))
     || -[PKProtobufShippingMethod isEqual:](shippingMethod, "isEqual:")))
  {
    paymentMethod = self->_paymentMethod;
    if ((unint64_t)paymentMethod | v4[1])
      v9 = -[PKProtobufPaymentMethod isEqual:](paymentMethod, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_remotePaymentRequestIdentifier, "hash");
  v4 = -[NSData hash](self->_shippingContact, "hash") ^ v3;
  v5 = -[PKProtobufShippingMethod hash](self->_shippingMethod, "hash");
  return v4 ^ v5 ^ -[PKProtobufPaymentMethod hash](self->_paymentMethod, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufShippingMethod *shippingMethod;
  uint64_t v6;
  PKProtobufPaymentMethod *paymentMethod;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[PKProtobufPaymentHostUpdate setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
    v4 = v9;
  }
  if (v4[3])
  {
    -[PKProtobufPaymentHostUpdate setShippingContact:](self, "setShippingContact:");
    v4 = v9;
  }
  shippingMethod = self->_shippingMethod;
  v6 = v4[4];
  if (shippingMethod)
  {
    if (!v6)
      goto LABEL_11;
    -[PKProtobufShippingMethod mergeFrom:](shippingMethod, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[PKProtobufPaymentHostUpdate setShippingMethod:](self, "setShippingMethod:");
  }
  v4 = v9;
LABEL_11:
  paymentMethod = self->_paymentMethod;
  v8 = v4[1];
  if (paymentMethod)
  {
    if (v8)
    {
      -[PKProtobufPaymentMethod mergeFrom:](paymentMethod, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PKProtobufPaymentHostUpdate setPaymentMethod:](self, "setPaymentMethod:");
    goto LABEL_16;
  }

}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, a3);
}

- (NSData)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
  objc_storeStrong((id *)&self->_shippingContact, a3);
}

- (PKProtobufShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (void)setShippingMethod:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethod, a3);
}

- (PKProtobufPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
}

@end
