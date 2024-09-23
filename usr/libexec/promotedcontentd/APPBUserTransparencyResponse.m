@implementation APPBUserTransparencyResponse

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBUserTransparencyResponse;
  v3 = -[APPBUserTransparencyResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBUserTransparencyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBTransparencyDetails *transparencyDetails;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTransparencyDetails dictionaryRepresentation](transparencyDetails, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("transparencyDetails"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBUserTransparencyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBTransparencyDetails *transparencyDetails;
  id v6;

  v4 = a3;
  transparencyDetails = self->_transparencyDetails;
  if (!transparencyDetails)
    sub_10017BB7C();
  v6 = v4;
  PBDataWriterWriteSubmessage(v4, transparencyDetails, 1);

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setTransparencyDetails:", self->_transparencyDetails);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBTransparencyDetails copyWithZone:](self->_transparencyDetails, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  APPBTransparencyDetails *transparencyDetails;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    transparencyDetails = self->_transparencyDetails;
    if ((unint64_t)transparencyDetails | v4[1])
      v6 = -[APPBTransparencyDetails isEqual:](transparencyDetails, "isEqual:");
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
  return -[APPBTransparencyDetails hash](self->_transparencyDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  APPBTransparencyDetails *transparencyDetails;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  transparencyDetails = self->_transparencyDetails;
  v6 = v4[1];
  if (transparencyDetails)
  {
    if (v6)
    {
      v7 = v4;
      -[APPBTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[APPBUserTransparencyResponse setTransparencyDetails:](self, "setTransparencyDetails:");
    goto LABEL_6;
  }

}

- (APPBTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
}

@end
