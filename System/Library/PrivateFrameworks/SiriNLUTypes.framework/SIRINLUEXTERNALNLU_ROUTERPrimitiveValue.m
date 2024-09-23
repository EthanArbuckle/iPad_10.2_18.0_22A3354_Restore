@implementation SIRINLUEXTERNALNLU_ROUTERPrimitiveValue

- (BOOL)hasApp
{
  return self->_app != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERPrimitiveValue;
  -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALNLU_ROUTERApp *app;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  app = self->_app;
  if (app)
  {
    -[SIRINLUEXTERNALNLU_ROUTERApp dictionaryRepresentation](app, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("app"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERPrimitiveValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_app)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUEXTERNALNLU_ROUTERApp *app;

  app = self->_app;
  if (app)
    objc_msgSend(a3, "setApp:", app);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALNLU_ROUTERApp copyWithZone:](self->_app, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERApp *app;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    app = self->_app;
    if ((unint64_t)app | v4[1])
      v6 = -[SIRINLUEXTERNALNLU_ROUTERApp isEqual:](app, "isEqual:");
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
  return -[SIRINLUEXTERNALNLU_ROUTERApp hash](self->_app, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERApp *app;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  app = self->_app;
  v6 = v4[1];
  if (app)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUEXTERNALNLU_ROUTERApp mergeFrom:](app, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue setApp:](self, "setApp:");
    goto LABEL_6;
  }

}

- (SIRINLUEXTERNALNLU_ROUTERApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
}

@end
