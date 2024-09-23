@implementation SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasEmbeddingVersion
{
  return self->_embeddingVersion != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup;
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *locale;
  NSString *embeddingVersion;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  embeddingVersion = self->_embeddingVersion;
  if (embeddingVersion)
    objc_msgSend(v4, "setObject:forKey:", embeddingVersion, CFSTR("embedding_version"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_embeddingVersion)
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
  if (self->_locale)
  {
    objc_msgSend(v4, "setLocale:");
    v4 = v5;
  }
  if (self->_embeddingVersion)
  {
    objc_msgSend(v5, "setEmbeddingVersion:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_embeddingVersion, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *locale;
  NSString *embeddingVersion;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    embeddingVersion = self->_embeddingVersion;
    if ((unint64_t)embeddingVersion | v4[1])
      v7 = -[NSString isEqual:](embeddingVersion, "isEqual:");
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

  v3 = -[NSString hash](self->_locale, "hash");
  return -[NSString hash](self->_embeddingVersion, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup setLocale:](self, "setLocale:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup setEmbeddingVersion:](self, "setEmbeddingVersion:");
    v4 = v5;
  }

}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)setEmbeddingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
}

@end
