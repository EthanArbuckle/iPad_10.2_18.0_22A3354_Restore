@implementation PKProtobufPayment

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasBillingContact
{
  return self->_billingContact != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (BOOL)hasShippingMethod
{
  return self->_shippingMethod != 0;
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
  v8.super_class = (Class)PKProtobufPayment;
  -[PKProtobufPayment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPayment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PKProtobufPaymentToken *token;
  void *v5;
  NSData *billingContact;
  NSData *shippingContact;
  PKProtobufShippingMethod *shippingMethod;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  if (token)
  {
    -[PKProtobufPaymentToken dictionaryRepresentation](token, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("token"));

  }
  billingContact = self->_billingContact;
  if (billingContact)
    objc_msgSend(v3, "setObject:forKey:", billingContact, CFSTR("billingContact"));
  shippingContact = self->_shippingContact;
  if (shippingContact)
    objc_msgSend(v3, "setObject:forKey:", shippingContact, CFSTR("shippingContact"));
  shippingMethod = self->_shippingMethod;
  if (shippingMethod)
  {
    -[PKProtobufShippingMethod dictionaryRepresentation](shippingMethod, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("shippingMethod"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_token)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_billingContact)
  {
    PBDataWriterWriteDataField();
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

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_token)
  {
    objc_msgSend(v4, "setToken:");
    v4 = v5;
  }
  if (self->_billingContact)
  {
    objc_msgSend(v5, "setBillingContact:");
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

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKProtobufPaymentToken copyWithZone:](self->_token, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSData copyWithZone:](self->_billingContact, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_shippingContact, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[PKProtobufShippingMethod copyWithZone:](self->_shippingMethod, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKProtobufPaymentToken *token;
  NSData *billingContact;
  NSData *shippingContact;
  PKProtobufShippingMethod *shippingMethod;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((token = self->_token, !((unint64_t)token | v4[4]))
     || -[PKProtobufPaymentToken isEqual:](token, "isEqual:"))
    && ((billingContact = self->_billingContact, !((unint64_t)billingContact | v4[1]))
     || -[NSData isEqual:](billingContact, "isEqual:"))
    && ((shippingContact = self->_shippingContact, !((unint64_t)shippingContact | v4[2]))
     || -[NSData isEqual:](shippingContact, "isEqual:")))
  {
    shippingMethod = self->_shippingMethod;
    if ((unint64_t)shippingMethod | v4[3])
      v9 = -[PKProtobufShippingMethod isEqual:](shippingMethod, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PKProtobufPaymentToken hash](self->_token, "hash");
  v4 = -[NSData hash](self->_billingContact, "hash") ^ v3;
  v5 = -[NSData hash](self->_shippingContact, "hash");
  return v4 ^ v5 ^ -[PKProtobufShippingMethod hash](self->_shippingMethod, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufPaymentToken *token;
  uint64_t v6;
  PKProtobufShippingMethod *shippingMethod;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  token = self->_token;
  v6 = v4[4];
  v9 = v4;
  if (token)
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufPaymentToken mergeFrom:](token, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PKProtobufPayment setToken:](self, "setToken:");
  }
  v4 = v9;
LABEL_7:
  if (v4[1])
  {
    -[PKProtobufPayment setBillingContact:](self, "setBillingContact:");
    v4 = v9;
  }
  if (v4[2])
  {
    -[PKProtobufPayment setShippingContact:](self, "setShippingContact:");
    v4 = v9;
  }
  shippingMethod = self->_shippingMethod;
  v8 = v4[3];
  if (shippingMethod)
  {
    if (v8)
    {
      -[PKProtobufShippingMethod mergeFrom:](shippingMethod, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PKProtobufPayment setShippingMethod:](self, "setShippingMethod:");
    goto LABEL_16;
  }

}

- (PKProtobufPaymentToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSData)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
{
  objc_storeStrong((id *)&self->_billingContact, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
}

@end
