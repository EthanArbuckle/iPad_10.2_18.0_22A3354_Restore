@implementation SIRINLUINTERNALSPANMATCHSpanMatchRequest

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSPANMATCHSpanMatchRequest;
  -[SIRINLUINTERNALSPANMATCHSpanMatchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSPANMATCHSpanMatchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v5;
  SIRINLUEXTERNALNLContext *nlContext;
  void *v7;
  NSString *utterance;
  SIRINLUEXTERNALUUID *asrId;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("token_chain"));

  }
  nlContext = self->_nlContext;
  if (nlContext)
  {
    -[SIRINLUEXTERNALNLContext dictionaryRepresentation](nlContext, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nl_context"));

  }
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  asrId = self->_asrId;
  if (asrId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](asrId, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("asrId"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSPANMATCHSpanMatchRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_nlContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_asrId)
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
  if (self->_tokenChain)
  {
    objc_msgSend(v4, "setTokenChain:");
    v4 = v5;
  }
  if (self->_nlContext)
  {
    objc_msgSend(v5, "setNlContext:");
    v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
    v4 = v5;
  }
  if (self->_asrId)
  {
    objc_msgSend(v5, "setAsrId:");
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
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[SIRINLUEXTERNALNLContext copyWithZone:](self->_nlContext, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_asrId, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  SIRINLUEXTERNALNLContext *nlContext;
  NSString *utterance;
  SIRINLUEXTERNALUUID *asrId;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[3]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[2]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:"))
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[4]))
     || -[NSString isEqual:](utterance, "isEqual:")))
  {
    asrId = self->_asrId;
    if ((unint64_t)asrId | v4[1])
      v9 = -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
  v4 = -[SIRINLUEXTERNALNLContext hash](self->_nlContext, "hash") ^ v3;
  v5 = -[NSString hash](self->_utterance, "hash");
  return v4 ^ v5 ^ -[SIRINLUEXTERNALUUID hash](self->_asrId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v6;
  SIRINLUEXTERNALNLContext *nlContext;
  uint64_t v8;
  SIRINLUEXTERNALUUID *asrId;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  tokenChain = self->_tokenChain;
  v6 = v4[3];
  v11 = v4;
  if (tokenChain)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v11;
LABEL_7:
  nlContext = self->_nlContext;
  v8 = v4[2];
  if (nlContext)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setNlContext:](self, "setNlContext:");
  }
  v4 = v11;
LABEL_13:
  if (v4[4])
  {
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setUtterance:](self, "setUtterance:");
    v4 = v11;
  }
  asrId = self->_asrId;
  v10 = v4[1];
  if (asrId)
  {
    if (v10)
    {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
LABEL_20:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALSPANMATCHSpanMatchRequest setAsrId:](self, "setAsrId:");
    goto LABEL_20;
  }

}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
}

- (SIRINLUEXTERNALNLContext)nlContext
{
  return self->_nlContext;
}

- (void)setNlContext:(id)a3
{
  objc_storeStrong((id *)&self->_nlContext, a3);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

@end
