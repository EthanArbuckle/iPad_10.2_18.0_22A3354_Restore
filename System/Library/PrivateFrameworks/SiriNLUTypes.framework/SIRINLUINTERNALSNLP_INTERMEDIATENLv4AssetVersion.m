@implementation SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersion

- (BOOL)hasVersion
{
  return self->_version != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersion;
  -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  if (version)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion dictionaryRepresentation](version, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_version)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;

  version = self->_version;
  if (version)
    objc_msgSend(a3, "setVersion:", version);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion copyWithZone:](self->_version, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    version = self->_version;
    if ((unint64_t)version | v4[1])
      v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion isEqual:](version, "isEqual:");
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
  return -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion hash](self->_version, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  version = self->_version;
  v6 = v4[1];
  if (version)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion mergeFrom:](version, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4AssetVersion setVersion:](self, "setVersion:");
    goto LABEL_6;
  }

}

- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

@end
