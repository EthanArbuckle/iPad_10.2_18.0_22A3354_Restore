@implementation SECC2MPError

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPError;
  v3 = -[SECC2MPError description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *errorDomain;
  void *v6;
  NSString *errorDescription;
  SECC2MPError *underlyingError;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("error_domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_errorCode));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("error_code"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("error_description"));
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](underlyingError, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("underlying_error"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100145AA8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *errorDomain;
  NSString *errorDescription;
  SECC2MPError *underlyingError;
  id v8;

  v4 = a3;
  errorDomain = self->_errorDomain;
  v8 = v4;
  if (errorDomain)
  {
    PBDataWriterWriteStringField(v4, errorDomain, 1);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v8, self->_errorCode, 2);
    v4 = v8;
  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
  {
    PBDataWriterWriteStringField(v8, errorDescription, 3);
    v4 = v8;
  }
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    PBDataWriterWriteSubmessage(v8, underlyingError, 4);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_errorDomain)
  {
    objc_msgSend(v4, "setErrorDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_errorCode;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    v4 = v5;
  }
  if (self->_underlyingError)
  {
    objc_msgSend(v5, "setUnderlyingError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_errorCode;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[SECC2MPError copyWithZone:](self->_underlyingError, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *errorDomain;
  NSString *errorDescription;
  SECC2MPError *underlyingError;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_13;
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_13;
  }
  underlyingError = self->_underlyingError;
  if ((unint64_t)underlyingError | *((_QWORD *)v4 + 4))
    v8 = -[SECC2MPError isEqual:](underlyingError, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorCode;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_errorDescription, "hash");
  return v5 ^ v6 ^ -[SECC2MPError hash](self->_underlyingError, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SECC2MPError *underlyingError;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[SECC2MPError setErrorDomain:](self, "setErrorDomain:");
    v4 = v7;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_errorCode = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[SECC2MPError setErrorDescription:](self, "setErrorDescription:");
    v4 = v7;
  }
  underlyingError = self->_underlyingError;
  v6 = v4[4];
  if (underlyingError)
  {
    if (v6)
    {
      -[SECC2MPError mergeFrom:](underlyingError, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SECC2MPError setUnderlyingError:](self, "setUnderlyingError:");
    goto LABEL_12;
  }

}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (SECC2MPError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
