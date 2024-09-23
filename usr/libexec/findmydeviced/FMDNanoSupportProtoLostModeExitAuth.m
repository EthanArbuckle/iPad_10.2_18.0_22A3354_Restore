@implementation FMDNanoSupportProtoLostModeExitAuth

- (BOOL)hasLostModeExitAuthToken
{
  return self->_lostModeExitAuthToken != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDNanoSupportProtoLostModeExitAuth;
  v3 = -[FMDNanoSupportProtoLostModeExitAuth description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoLostModeExitAuth dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *lostModeExitAuthToken;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_errorOccurred));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("error_occurred"));

  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if (lostModeExitAuthToken)
    objc_msgSend(v3, "setObject:forKey:", lostModeExitAuthToken, CFSTR("lostModeExitAuthToken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoLostModeExitAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *lostModeExitAuthToken;
  id v5;

  v5 = a3;
  PBDataWriterWriteBOOLField();
  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if (lostModeExitAuthToken)
    PBDataWriterWriteStringField(v5, lostModeExitAuthToken, 2);

}

- (void)copyTo:(id)a3
{
  NSString *lostModeExitAuthToken;

  *((_BYTE *)a3 + 16) = self->_errorOccurred;
  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if (lostModeExitAuthToken)
    objc_msgSend(a3, "setLostModeExitAuthToken:", lostModeExitAuthToken);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[16] = self->_errorOccurred;
  v6 = -[NSString copyWithZone:](self->_lostModeExitAuthToken, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *lostModeExitAuthToken;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_7;
  if (self->_errorOccurred)
  {
    if (*((_BYTE *)v4 + 16))
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (*((_BYTE *)v4 + 16))
    goto LABEL_7;
LABEL_4:
  lostModeExitAuthToken = self->_lostModeExitAuthToken;
  if ((unint64_t)lostModeExitAuthToken | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](lostModeExitAuthToken, "isEqual:");
  else
    v7 = 1;
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_errorOccurred;
  return -[NSString hash](self->_lostModeExitAuthToken, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_errorOccurred = *((_BYTE *)a3 + 16);
  if (*((_QWORD *)a3 + 1))
    -[FMDNanoSupportProtoLostModeExitAuth setLostModeExitAuthToken:](self, "setLostModeExitAuthToken:");
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSString)lostModeExitAuthToken
{
  return self->_lostModeExitAuthToken;
}

- (void)setLostModeExitAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeExitAuthToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeExitAuthToken, 0);
}

@end
