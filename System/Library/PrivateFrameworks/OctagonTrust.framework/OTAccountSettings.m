@implementation OTAccountSettings

- (BOOL)hasWalrus
{
  return self->_walrus != 0;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0;
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
  v8.super_class = (Class)OTAccountSettings;
  -[OTAccountSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTAccountSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  OTWalrus *walrus;
  void *v5;
  OTWebAccess *webAccess;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  walrus = self->_walrus;
  if (walrus)
  {
    -[OTWalrus dictionaryRepresentation](walrus, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("walrus"));

  }
  webAccess = self->_webAccess;
  if (webAccess)
  {
    -[OTWebAccess dictionaryRepresentation](webAccess, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("webAccess"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTAccountSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_walrus)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_webAccess)
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
  if (self->_walrus)
  {
    objc_msgSend(v4, "setWalrus:");
    v4 = v5;
  }
  if (self->_webAccess)
  {
    objc_msgSend(v5, "setWebAccess:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OTWalrus copyWithZone:](self->_walrus, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[OTWebAccess copyWithZone:](self->_webAccess, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  OTWalrus *walrus;
  OTWebAccess *webAccess;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((walrus = self->_walrus, !((unint64_t)walrus | v4[1])) || -[OTWalrus isEqual:](walrus, "isEqual:")))
  {
    webAccess = self->_webAccess;
    if ((unint64_t)webAccess | v4[2])
      v7 = -[OTWebAccess isEqual:](webAccess, "isEqual:");
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
  unint64_t v3;

  v3 = -[OTWalrus hash](self->_walrus, "hash");
  return -[OTWebAccess hash](self->_webAccess, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  OTWalrus *walrus;
  uint64_t v6;
  OTWebAccess *webAccess;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  walrus = self->_walrus;
  v6 = v4[1];
  v9 = v4;
  if (walrus)
  {
    if (!v6)
      goto LABEL_7;
    -[OTWalrus mergeFrom:](walrus, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[OTAccountSettings setWalrus:](self, "setWalrus:");
  }
  v4 = v9;
LABEL_7:
  webAccess = self->_webAccess;
  v8 = v4[2];
  if (webAccess)
  {
    if (v8)
    {
      -[OTWebAccess mergeFrom:](webAccess, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[OTAccountSettings setWebAccess:](self, "setWebAccess:");
    goto LABEL_12;
  }

}

- (OTWalrus)walrus
{
  return self->_walrus;
}

- (void)setWalrus:(id)a3
{
  objc_storeStrong((id *)&self->_walrus, a3);
}

- (OTWebAccess)webAccess
{
  return self->_webAccess;
}

- (void)setWebAccess:(id)a3
{
  objc_storeStrong((id *)&self->_webAccess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
}

@end
