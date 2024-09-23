@implementation SIRINLUEXTERNALTurnContext

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

- (BOOL)hasLegacyNlContext
{
  return self->_legacyNlContext != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALTurnContext;
  -[SIRINLUEXTERNALTurnContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALTurnContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALNLContext *nlContext;
  void *v5;
  SIRINLUEXTERNALLegacyNLContext *legacyNlContext;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nlContext = self->_nlContext;
  if (nlContext)
  {
    -[SIRINLUEXTERNALNLContext dictionaryRepresentation](nlContext, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nl_context"));

  }
  legacyNlContext = self->_legacyNlContext;
  if (legacyNlContext)
  {
    -[SIRINLUEXTERNALLegacyNLContext dictionaryRepresentation](legacyNlContext, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("legacy_nl_context"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALTurnContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nlContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_legacyNlContext)
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
  if (self->_nlContext)
  {
    objc_msgSend(v4, "setNlContext:");
    v4 = v5;
  }
  if (self->_legacyNlContext)
  {
    objc_msgSend(v5, "setLegacyNlContext:");
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
  v6 = -[SIRINLUEXTERNALNLContext copyWithZone:](self->_nlContext, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SIRINLUEXTERNALLegacyNLContext copyWithZone:](self->_legacyNlContext, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLContext *nlContext;
  SIRINLUEXTERNALLegacyNLContext *legacyNlContext;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[2]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:")))
  {
    legacyNlContext = self->_legacyNlContext;
    if ((unint64_t)legacyNlContext | v4[1])
      v7 = -[SIRINLUEXTERNALLegacyNLContext isEqual:](legacyNlContext, "isEqual:");
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

  v3 = -[SIRINLUEXTERNALNLContext hash](self->_nlContext, "hash");
  return -[SIRINLUEXTERNALLegacyNLContext hash](self->_legacyNlContext, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLContext *nlContext;
  uint64_t v6;
  SIRINLUEXTERNALLegacyNLContext *legacyNlContext;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  nlContext = self->_nlContext;
  v6 = v4[2];
  v9 = v4;
  if (nlContext)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALTurnContext setNlContext:](self, "setNlContext:");
  }
  v4 = v9;
LABEL_7:
  legacyNlContext = self->_legacyNlContext;
  v8 = v4[1];
  if (legacyNlContext)
  {
    if (v8)
    {
      -[SIRINLUEXTERNALLegacyNLContext mergeFrom:](legacyNlContext, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALTurnContext setLegacyNlContext:](self, "setLegacyNlContext:");
    goto LABEL_12;
  }

}

- (SIRINLUEXTERNALNLContext)nlContext
{
  return self->_nlContext;
}

- (void)setNlContext:(id)a3
{
  objc_storeStrong((id *)&self->_nlContext, a3);
}

- (SIRINLUEXTERNALLegacyNLContext)legacyNlContext
{
  return self->_legacyNlContext;
}

- (void)setLegacyNlContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNlContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlContext, 0);
  objc_storeStrong((id *)&self->_legacyNlContext, 0);
}

@end
