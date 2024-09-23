@implementation FMDNanoSupportProtoSignedDataV3

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasSkAuth
{
  return self->_skAuth != 0;
}

- (BOOL)hasFinalRequestJsonData
{
  return self->_finalRequestJsonData != 0;
}

- (BOOL)hasSignatureError
{
  return self->_signatureError != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDNanoSupportProtoSignedDataV3;
  v3 = -[FMDNanoSupportProtoSignedDataV3 description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoSignedDataV3 dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signedData;
  NSData *skAuth;
  NSData *finalRequestJsonData;
  NSString *signatureError;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_errorOccurred));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("error_occurred"));

  signedData = self->_signedData;
  if (signedData)
    objc_msgSend(v3, "setObject:forKey:", signedData, CFSTR("signed_data"));
  skAuth = self->_skAuth;
  if (skAuth)
    objc_msgSend(v3, "setObject:forKey:", skAuth, CFSTR("sk_auth"));
  finalRequestJsonData = self->_finalRequestJsonData;
  if (finalRequestJsonData)
    objc_msgSend(v3, "setObject:forKey:", finalRequestJsonData, CFSTR("final_request_json_data"));
  signatureError = self->_signatureError;
  if (signatureError)
    objc_msgSend(v3, "setObject:forKey:", signatureError, CFSTR("signature_error"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataV3ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *signedData;
  NSData *skAuth;
  NSData *finalRequestJsonData;
  void *v7;
  NSString *signatureError;
  id v9;

  v9 = a3;
  PBDataWriterWriteBOOLField();
  signedData = self->_signedData;
  if (signedData)
    PBDataWriterWriteDataField(v9, signedData, 2);
  skAuth = self->_skAuth;
  if (skAuth)
    PBDataWriterWriteDataField(v9, skAuth, 3);
  finalRequestJsonData = self->_finalRequestJsonData;
  v7 = v9;
  if (finalRequestJsonData)
  {
    PBDataWriterWriteDataField(v9, finalRequestJsonData, 4);
    v7 = v9;
  }
  signatureError = self->_signatureError;
  if (signatureError)
  {
    PBDataWriterWriteStringField(v9, signatureError, 5);
    v7 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v4[40] = self->_errorOccurred;
  v5 = v4;
  if (self->_signedData)
  {
    objc_msgSend(v4, "setSignedData:");
    v4 = v5;
  }
  if (self->_skAuth)
  {
    objc_msgSend(v5, "setSkAuth:");
    v4 = v5;
  }
  if (self->_finalRequestJsonData)
  {
    objc_msgSend(v5, "setFinalRequestJsonData:");
    v4 = v5;
  }
  if (self->_signatureError)
  {
    objc_msgSend(v5, "setSignatureError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[40] = self->_errorOccurred;
  v6 = -[NSData copyWithZone:](self->_signedData, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v6;

  v8 = -[NSData copyWithZone:](self->_skAuth, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v8;

  v10 = -[NSData copyWithZone:](self->_finalRequestJsonData, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v10;

  v12 = -[NSString copyWithZone:](self->_signatureError, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *signedData;
  NSData *skAuth;
  NSData *finalRequestJsonData;
  NSString *signatureError;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_14;
  if (self->_errorOccurred)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_14;
  }
  else if (*((_BYTE *)v4 + 40))
  {
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](signedData, "isEqual:"))
    goto LABEL_14;
  skAuth = self->_skAuth;
  if ((unint64_t)skAuth | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](skAuth, "isEqual:"))
      goto LABEL_14;
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if ((unint64_t)finalRequestJsonData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](finalRequestJsonData, "isEqual:"))
      goto LABEL_14;
  }
  signatureError = self->_signatureError;
  if ((unint64_t)signatureError | *((_QWORD *)v4 + 2))
    v10 = -[NSString isEqual:](signatureError, "isEqual:");
  else
    v10 = 1;
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = 2654435761 * self->_errorOccurred;
  v4 = (unint64_t)-[NSData hash](self->_signedData, "hash");
  v5 = v4 ^ (unint64_t)-[NSData hash](self->_skAuth, "hash");
  v6 = v5 ^ (unint64_t)-[NSData hash](self->_finalRequestJsonData, "hash");
  return v6 ^ -[NSString hash](self->_signatureError, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _QWORD *v5;

  v4 = a3;
  self->_errorOccurred = v4[40];
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
    -[FMDNanoSupportProtoSignedDataV3 setSignedData:](self, "setSignedData:");
  if (v5[4])
    -[FMDNanoSupportProtoSignedDataV3 setSkAuth:](self, "setSkAuth:");
  if (v5[1])
    -[FMDNanoSupportProtoSignedDataV3 setFinalRequestJsonData:](self, "setFinalRequestJsonData:");
  if (v5[2])
    -[FMDNanoSupportProtoSignedDataV3 setSignatureError:](self, "setSignatureError:");

}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_storeStrong((id *)&self->_signedData, a3);
}

- (NSData)skAuth
{
  return self->_skAuth;
}

- (void)setSkAuth:(id)a3
{
  objc_storeStrong((id *)&self->_skAuth, a3);
}

- (NSData)finalRequestJsonData
{
  return self->_finalRequestJsonData;
}

- (void)setFinalRequestJsonData:(id)a3
{
  objc_storeStrong((id *)&self->_finalRequestJsonData, a3);
}

- (NSString)signatureError
{
  return self->_signatureError;
}

- (void)setSignatureError:(id)a3
{
  objc_storeStrong((id *)&self->_signatureError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skAuth, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_finalRequestJsonData, 0);
}

@end
