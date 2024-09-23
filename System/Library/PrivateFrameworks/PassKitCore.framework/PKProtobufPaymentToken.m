@implementation PKProtobufPaymentToken

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (BOOL)hasInstrumentName
{
  return self->_instrumentName != 0;
}

- (BOOL)hasNetwork
{
  return self->_network != 0;
}

- (BOOL)hasTransactionIdentifier
{
  return self->_transactionIdentifier != 0;
}

- (BOOL)hasPaymentData
{
  return self->_paymentData != 0;
}

- (BOOL)hasRedeemURL
{
  return self->_redeemURL != 0;
}

- (BOOL)hasRetryNonce
{
  return self->_retryNonce != 0;
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
  v8.super_class = (Class)PKProtobufPaymentToken;
  -[PKProtobufPaymentToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PKProtobufPaymentMethod *paymentMethod;
  void *v5;
  NSString *instrumentName;
  NSString *network;
  NSString *transactionIdentifier;
  NSData *paymentData;
  NSString *redeemURL;
  NSString *retryNonce;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentMethod = self->_paymentMethod;
  if (paymentMethod)
  {
    -[PKProtobufPaymentMethod dictionaryRepresentation](paymentMethod, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paymentMethod"));

  }
  instrumentName = self->_instrumentName;
  if (instrumentName)
    objc_msgSend(v3, "setObject:forKey:", instrumentName, CFSTR("instrumentName"));
  network = self->_network;
  if (network)
    objc_msgSend(v3, "setObject:forKey:", network, CFSTR("network"));
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", transactionIdentifier, CFSTR("transactionIdentifier"));
  paymentData = self->_paymentData;
  if (paymentData)
    objc_msgSend(v3, "setObject:forKey:", paymentData, CFSTR("paymentData"));
  redeemURL = self->_redeemURL;
  if (redeemURL)
    objc_msgSend(v3, "setObject:forKey:", redeemURL, CFSTR("redeemURL"));
  retryNonce = self->_retryNonce;
  if (retryNonce)
    objc_msgSend(v3, "setObject:forKey:", retryNonce, CFSTR("retryNonce"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_paymentMethod)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_instrumentName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_network)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_paymentData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_redeemURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_retryNonce)
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
  if (self->_paymentMethod)
  {
    objc_msgSend(v4, "setPaymentMethod:");
    v4 = v5;
  }
  if (self->_instrumentName)
  {
    objc_msgSend(v5, "setInstrumentName:");
    v4 = v5;
  }
  if (self->_network)
  {
    objc_msgSend(v5, "setNetwork:");
    v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    objc_msgSend(v5, "setTransactionIdentifier:");
    v4 = v5;
  }
  if (self->_paymentData)
  {
    objc_msgSend(v5, "setPaymentData:");
    v4 = v5;
  }
  if (self->_redeemURL)
  {
    objc_msgSend(v5, "setRedeemURL:");
    v4 = v5;
  }
  if (self->_retryNonce)
  {
    objc_msgSend(v5, "setRetryNonce:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKProtobufPaymentMethod copyWithZone:](self->_paymentMethod, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_instrumentName, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_network, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_transactionIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSData copyWithZone:](self->_paymentData, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  v16 = -[NSString copyWithZone:](self->_redeemURL, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_retryNonce, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKProtobufPaymentMethod *paymentMethod;
  NSString *instrumentName;
  NSString *network;
  NSString *transactionIdentifier;
  NSData *paymentData;
  NSString *redeemURL;
  NSString *retryNonce;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((paymentMethod = self->_paymentMethod, !((unint64_t)paymentMethod | v4[4]))
     || -[PKProtobufPaymentMethod isEqual:](paymentMethod, "isEqual:"))
    && ((instrumentName = self->_instrumentName, !((unint64_t)instrumentName | v4[1]))
     || -[NSString isEqual:](instrumentName, "isEqual:"))
    && ((network = self->_network, !((unint64_t)network | v4[2]))
     || -[NSString isEqual:](network, "isEqual:"))
    && ((transactionIdentifier = self->_transactionIdentifier, !((unint64_t)transactionIdentifier | v4[7]))
     || -[NSString isEqual:](transactionIdentifier, "isEqual:"))
    && ((paymentData = self->_paymentData, !((unint64_t)paymentData | v4[3]))
     || -[NSData isEqual:](paymentData, "isEqual:"))
    && ((redeemURL = self->_redeemURL, !((unint64_t)redeemURL | v4[5]))
     || -[NSString isEqual:](redeemURL, "isEqual:")))
  {
    retryNonce = self->_retryNonce;
    if ((unint64_t)retryNonce | v4[6])
      v12 = -[NSString isEqual:](retryNonce, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;

  v3 = -[PKProtobufPaymentMethod hash](self->_paymentMethod, "hash");
  v4 = -[NSString hash](self->_instrumentName, "hash") ^ v3;
  v5 = -[NSString hash](self->_network, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_transactionIdentifier, "hash");
  v7 = -[NSData hash](self->_paymentData, "hash");
  v8 = v7 ^ -[NSString hash](self->_redeemURL, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_retryNonce, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PKProtobufPaymentMethod *paymentMethod;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  paymentMethod = self->_paymentMethod;
  v7 = v4;
  v6 = v4[4];
  if (paymentMethod)
  {
    if (v6)
      -[PKProtobufPaymentMethod mergeFrom:](paymentMethod, "mergeFrom:");
  }
  else if (v6)
  {
    -[PKProtobufPaymentToken setPaymentMethod:](self, "setPaymentMethod:");
  }
  if (v7[1])
    -[PKProtobufPaymentToken setInstrumentName:](self, "setInstrumentName:");
  if (v7[2])
    -[PKProtobufPaymentToken setNetwork:](self, "setNetwork:");
  if (v7[7])
    -[PKProtobufPaymentToken setTransactionIdentifier:](self, "setTransactionIdentifier:");
  if (v7[3])
    -[PKProtobufPaymentToken setPaymentData:](self, "setPaymentData:");
  if (v7[5])
    -[PKProtobufPaymentToken setRedeemURL:](self, "setRedeemURL:");
  if (v7[6])
    -[PKProtobufPaymentToken setRetryNonce:](self, "setRetryNonce:");

}

- (PKProtobufPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (NSString)instrumentName
{
  return self->_instrumentName;
}

- (void)setInstrumentName:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentName, a3);
}

- (NSString)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transactionIdentifier, a3);
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
  objc_storeStrong((id *)&self->_paymentData, a3);
}

- (NSString)redeemURL
{
  return self->_redeemURL;
}

- (void)setRedeemURL:(id)a3
{
  objc_storeStrong((id *)&self->_redeemURL, a3);
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
  objc_storeStrong((id *)&self->_retryNonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_redeemURL, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_instrumentName, 0);
}

@end
