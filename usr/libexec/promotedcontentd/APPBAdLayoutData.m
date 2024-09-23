@implementation APPBAdLayoutData

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasAdLayoutDetails
{
  return self->_adLayoutDetails != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdLayoutData;
  v3 = -[APPBAdLayoutData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdLayoutData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *localeIdentifier;
  APPBAdLayoutDetails *adLayoutDetails;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  adLayoutDetails = self->_adLayoutDetails;
  if (adLayoutDetails)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdLayoutDetails dictionaryRepresentation](adLayoutDetails, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("adLayoutDetails"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdLayoutDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *localeIdentifier;
  APPBAdLayoutDetails *adLayoutDetails;
  id v7;

  v4 = a3;
  localeIdentifier = self->_localeIdentifier;
  v7 = v4;
  if (localeIdentifier)
  {
    PBDataWriterWriteStringField(v4, localeIdentifier, 1);
    v4 = v7;
  }
  adLayoutDetails = self->_adLayoutDetails;
  if (adLayoutDetails)
  {
    PBDataWriterWriteSubmessage(v7, adLayoutDetails, 2);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localeIdentifier)
  {
    objc_msgSend(v4, "setLocaleIdentifier:");
    v4 = v5;
  }
  if (self->_adLayoutDetails)
  {
    objc_msgSend(v5, "setAdLayoutDetails:");
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[APPBAdLayoutDetails copyWithZone:](self->_adLayoutDetails, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *localeIdentifier;
  APPBAdLayoutDetails *adLayoutDetails;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((localeIdentifier = self->_localeIdentifier, !((unint64_t)localeIdentifier | v4[2]))
     || -[NSString isEqual:](localeIdentifier, "isEqual:")))
  {
    adLayoutDetails = self->_adLayoutDetails;
    if ((unint64_t)adLayoutDetails | v4[1])
      v7 = -[APPBAdLayoutDetails isEqual:](adLayoutDetails, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_localeIdentifier, "hash");
  return -[APPBAdLayoutDetails hash](self->_adLayoutDetails, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  APPBAdLayoutDetails *adLayoutDetails;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[APPBAdLayoutData setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v7;
  }
  adLayoutDetails = self->_adLayoutDetails;
  v6 = v4[1];
  if (adLayoutDetails)
  {
    if (v6)
    {
      -[APPBAdLayoutDetails mergeFrom:](adLayoutDetails, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[APPBAdLayoutData setAdLayoutDetails:](self, "setAdLayoutDetails:");
    goto LABEL_8;
  }

}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (APPBAdLayoutDetails)adLayoutDetails
{
  return self->_adLayoutDetails;
}

- (void)setAdLayoutDetails:(id)a3
{
  objc_storeStrong((id *)&self->_adLayoutDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_adLayoutDetails, 0);
}

@end
