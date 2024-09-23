@implementation SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasModelType
{
  return self->_modelType != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion;
  -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *modelType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  if (version)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion dictionaryRepresentation](version, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  }
  modelType = self->_modelType;
  if (modelType)
    objc_msgSend(v3, "setObject:forKey:", modelType, CFSTR("model_type"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_version)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_modelType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_version)
  {
    objc_msgSend(v4, "setVersion:");
    v4 = v5;
  }
  if (self->_modelType)
  {
    objc_msgSend(v5, "setModelType:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion copyWithZone:](self->_version, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_modelType, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;
  NSString *modelType;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((version = self->_version, !((unint64_t)version | v4[2]))
     || -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion isEqual:](version, "isEqual:")))
  {
    modelType = self->_modelType;
    if ((unint64_t)modelType | v4[1])
      v7 = -[NSString isEqual:](modelType, "isEqual:");
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

  v3 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion hash](self->_version, "hash");
  return -[NSString hash](self->_modelType, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *version;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  version = self->_version;
  v6 = v4[2];
  v7 = v4;
  if (version)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion mergeFrom:](version, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion setVersion:](self, "setVersion:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion setModelType:](self, "setModelType:");
    v4 = v7;
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

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
  objc_storeStrong((id *)&self->_modelType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

@end
