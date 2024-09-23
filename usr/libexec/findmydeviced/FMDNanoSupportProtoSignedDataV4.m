@implementation FMDNanoSupportProtoSignedDataV4

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasSkAuth
{
  return self->_skAuth != 0;
}

- (BOOL)hasRefKeySignature
{
  return self->_refKeySignature != 0;
}

- (BOOL)hasRefKeyAttestation
{
  return self->_refKeyAttestation != 0;
}

- (BOOL)hasFinalRequestJsonData
{
  return self->_finalRequestJsonData != 0;
}

- (BOOL)hasRefKeyError
{
  return self->_refKeyError != 0;
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
  v8.super_class = (Class)FMDNanoSupportProtoSignedDataV4;
  v3 = -[FMDNanoSupportProtoSignedDataV4 description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoSignedDataV4 dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signedData;
  NSData *skAuth;
  NSData *refKeySignature;
  NSData *refKeyAttestation;
  NSData *finalRequestJsonData;
  NSString *refKeyError;
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
  refKeySignature = self->_refKeySignature;
  if (refKeySignature)
    objc_msgSend(v3, "setObject:forKey:", refKeySignature, CFSTR("ref_key_signature"));
  refKeyAttestation = self->_refKeyAttestation;
  if (refKeyAttestation)
    objc_msgSend(v3, "setObject:forKey:", refKeyAttestation, CFSTR("ref_key_attestation"));
  finalRequestJsonData = self->_finalRequestJsonData;
  if (finalRequestJsonData)
    objc_msgSend(v3, "setObject:forKey:", finalRequestJsonData, CFSTR("final_request_json_data"));
  refKeyError = self->_refKeyError;
  if (refKeyError)
    objc_msgSend(v3, "setObject:forKey:", refKeyError, CFSTR("ref_key_error"));
  signatureError = self->_signatureError;
  if (signatureError)
    objc_msgSend(v3, "setObject:forKey:", signatureError, CFSTR("signature_error"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataV4ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *signedData;
  NSData *skAuth;
  NSData *refKeySignature;
  void *v7;
  NSData *refKeyAttestation;
  NSData *finalRequestJsonData;
  NSString *refKeyError;
  NSString *signatureError;
  id v12;

  v12 = a3;
  PBDataWriterWriteBOOLField();
  signedData = self->_signedData;
  if (signedData)
    PBDataWriterWriteDataField(v12, signedData, 2);
  skAuth = self->_skAuth;
  if (skAuth)
    PBDataWriterWriteDataField(v12, skAuth, 3);
  refKeySignature = self->_refKeySignature;
  v7 = v12;
  if (refKeySignature)
  {
    PBDataWriterWriteDataField(v12, refKeySignature, 4);
    v7 = v12;
  }
  refKeyAttestation = self->_refKeyAttestation;
  if (refKeyAttestation)
  {
    PBDataWriterWriteDataField(v12, refKeyAttestation, 5);
    v7 = v12;
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if (finalRequestJsonData)
  {
    PBDataWriterWriteDataField(v12, finalRequestJsonData, 6);
    v7 = v12;
  }
  refKeyError = self->_refKeyError;
  if (refKeyError)
  {
    PBDataWriterWriteStringField(v12, refKeyError, 7);
    v7 = v12;
  }
  signatureError = self->_signatureError;
  if (signatureError)
  {
    PBDataWriterWriteStringField(v12, signatureError, 8);
    v7 = v12;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v4[64] = self->_errorOccurred;
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
  if (self->_refKeySignature)
  {
    objc_msgSend(v5, "setRefKeySignature:");
    v4 = v5;
  }
  if (self->_refKeyAttestation)
  {
    objc_msgSend(v5, "setRefKeyAttestation:");
    v4 = v5;
  }
  if (self->_finalRequestJsonData)
  {
    objc_msgSend(v5, "setFinalRequestJsonData:");
    v4 = v5;
  }
  if (self->_refKeyError)
  {
    objc_msgSend(v5, "setRefKeyError:");
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[64] = self->_errorOccurred;
  v6 = -[NSData copyWithZone:](self->_signedData, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v6;

  v8 = -[NSData copyWithZone:](self->_skAuth, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v8;

  v10 = -[NSData copyWithZone:](self->_refKeySignature, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v10;

  v12 = -[NSData copyWithZone:](self->_refKeyAttestation, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v12;

  v14 = -[NSData copyWithZone:](self->_finalRequestJsonData, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v14;

  v16 = -[NSString copyWithZone:](self->_refKeyError, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v16;

  v18 = -[NSString copyWithZone:](self->_signatureError, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *signedData;
  NSData *skAuth;
  NSData *refKeySignature;
  NSData *refKeyAttestation;
  NSData *finalRequestJsonData;
  NSString *refKeyError;
  NSString *signatureError;
  unsigned __int8 v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_20;
  if (self->_errorOccurred)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_20;
  }
  else if (*((_BYTE *)v4 + 64))
  {
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((_QWORD *)v4 + 6) && !-[NSData isEqual:](signedData, "isEqual:"))
    goto LABEL_20;
  skAuth = self->_skAuth;
  if ((unint64_t)skAuth | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](skAuth, "isEqual:"))
      goto LABEL_20;
  }
  refKeySignature = self->_refKeySignature;
  if ((unint64_t)refKeySignature | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](refKeySignature, "isEqual:"))
      goto LABEL_20;
  }
  refKeyAttestation = self->_refKeyAttestation;
  if ((unint64_t)refKeyAttestation | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](refKeyAttestation, "isEqual:"))
      goto LABEL_20;
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if ((unint64_t)finalRequestJsonData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](finalRequestJsonData, "isEqual:"))
      goto LABEL_20;
  }
  refKeyError = self->_refKeyError;
  if ((unint64_t)refKeyError | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](refKeyError, "isEqual:"))
      goto LABEL_20;
  }
  signatureError = self->_signatureError;
  if ((unint64_t)signatureError | *((_QWORD *)v4 + 5))
    v13 = -[NSString isEqual:](signatureError, "isEqual:");
  else
    v13 = 1;
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = 2654435761 * self->_errorOccurred;
  v4 = (unint64_t)-[NSData hash](self->_signedData, "hash");
  v5 = v4 ^ (unint64_t)-[NSData hash](self->_skAuth, "hash");
  v6 = v5 ^ (unint64_t)-[NSData hash](self->_refKeySignature, "hash");
  v7 = v6 ^ (unint64_t)-[NSData hash](self->_refKeyAttestation, "hash") ^ v3;
  v8 = (unint64_t)-[NSData hash](self->_finalRequestJsonData, "hash");
  v9 = v8 ^ -[NSString hash](self->_refKeyError, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_signatureError, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _QWORD *v5;

  v4 = a3;
  self->_errorOccurred = v4[64];
  v5 = v4;
  if (*((_QWORD *)v4 + 6))
    -[FMDNanoSupportProtoSignedDataV4 setSignedData:](self, "setSignedData:");
  if (v5[7])
    -[FMDNanoSupportProtoSignedDataV4 setSkAuth:](self, "setSkAuth:");
  if (v5[4])
    -[FMDNanoSupportProtoSignedDataV4 setRefKeySignature:](self, "setRefKeySignature:");
  if (v5[2])
    -[FMDNanoSupportProtoSignedDataV4 setRefKeyAttestation:](self, "setRefKeyAttestation:");
  if (v5[1])
    -[FMDNanoSupportProtoSignedDataV4 setFinalRequestJsonData:](self, "setFinalRequestJsonData:");
  if (v5[3])
    -[FMDNanoSupportProtoSignedDataV4 setRefKeyError:](self, "setRefKeyError:");
  if (v5[5])
    -[FMDNanoSupportProtoSignedDataV4 setSignatureError:](self, "setSignatureError:");

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

- (NSData)refKeySignature
{
  return self->_refKeySignature;
}

- (void)setRefKeySignature:(id)a3
{
  objc_storeStrong((id *)&self->_refKeySignature, a3);
}

- (NSData)refKeyAttestation
{
  return self->_refKeyAttestation;
}

- (void)setRefKeyAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_refKeyAttestation, a3);
}

- (NSData)finalRequestJsonData
{
  return self->_finalRequestJsonData;
}

- (void)setFinalRequestJsonData:(id)a3
{
  objc_storeStrong((id *)&self->_finalRequestJsonData, a3);
}

- (NSString)refKeyError
{
  return self->_refKeyError;
}

- (void)setRefKeyError:(id)a3
{
  objc_storeStrong((id *)&self->_refKeyError, a3);
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
  objc_storeStrong((id *)&self->_refKeySignature, 0);
  objc_storeStrong((id *)&self->_refKeyError, 0);
  objc_storeStrong((id *)&self->_refKeyAttestation, 0);
  objc_storeStrong((id *)&self->_finalRequestJsonData, 0);
}

@end
