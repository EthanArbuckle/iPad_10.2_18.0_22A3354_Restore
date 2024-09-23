@implementation PDURLSessionProxyError

- (id)_initWithActualError:(id)a3
{
  id v4;
  PDURLSessionProxyError *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = -[PDURLSessionProxyError init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    -[PDURLSessionProxyError setDomain:](v5, "setDomain:", v6);

    -[PDURLSessionProxyError setCode:](v5, "setCode:", objc_msgSend(v4, "code"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("NSErrorPeerCertificateChainKey"));
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("NSErrorClientCertificateChainKey"));
    objc_msgSend(v8, "removeObjectForKey:", NSURLErrorFailingURLPeerTrustErrorKey);
    objc_msgSend(v8, "removeObjectForKey:", NSUnderlyingErrorKey);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100045584;
    v12[3] = &unk_1000B1820;
    v9 = v8;
    v13 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:](NSKeyedArchiver, "_nsurlsessionproxy_secureArchivedDataWithRootObject:", v9));
    -[PDURLSessionProxyError setUserInfo:](v5, "setUserInfo:", v10);

  }
  return v5;
}

- (id)_actualError
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyError domain](self, "domain"));
  v4 = -[PDURLSessionProxyError code](self, "code");
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyError userInfo](self, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:](NSKeyedUnarchiver, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:", v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, v4, v7));

  return v8;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyError;
  v3 = -[PDURLSessionProxyError description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyError dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSData *userInfo;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_code));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("code"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005DD0C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *domain;
  NSData *userInfo;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v7;
  }
  domain = self->_domain;
  if (domain)
  {
    PBDataWriterWriteStringField(v7, domain, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_code, 3);
    v4 = v7;
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    PBDataWriterWriteDataField(v7, userInfo, 4);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_code;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_userInfo)
  {
    objc_msgSend(v5, "setUserInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((_BYTE *)v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = self->_code;
    *((_BYTE *)v6 + 36) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *domain;
  NSData *userInfo;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_17;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_code != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_17;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](userInfo, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_code;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ (unint64_t)-[NSData hash](self->_userInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PDURLSessionProxyError setDomain:](self, "setDomain:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_code = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PDURLSessionProxyError setUserInfo:](self, "setUserInfo:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (unint64_t)code
{
  return self->_code;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
