@implementation APPBMescalSignSAPSetupCertificateResponse

+ (id)options
{
  if (qword_100269870 != -1)
    dispatch_once(&qword_100269870, &stru_100214BF0);
  return (id)qword_100269868;
}

- (BOOL)hasCertificate
{
  return self->_certificate != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBMescalSignSAPSetupCertificateResponse;
  v3 = -[APPBMescalSignSAPSetupCertificateResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMescalSignSAPSetupCertificateResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *certificate;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  certificate = self->_certificate;
  if (certificate)
    objc_msgSend(v3, "setObject:forKey:", certificate, CFSTR("certificate"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMescalSignSAPSetupCertificateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *certificate;

  certificate = self->_certificate;
  if (certificate)
    PBDataWriterWriteDataField(a3, certificate, 1);
}

- (void)copyTo:(id)a3
{
  NSData *certificate;

  certificate = self->_certificate;
  if (certificate)
    _objc_msgSend(a3, "setCertificate:", certificate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_certificate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *certificate;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    certificate = self->_certificate;
    if ((unint64_t)certificate | v4[1])
      v6 = -[NSData isEqual:](certificate, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_certificate, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[APPBMescalSignSAPSetupCertificateResponse setCertificate:](self, "setCertificate:");
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
