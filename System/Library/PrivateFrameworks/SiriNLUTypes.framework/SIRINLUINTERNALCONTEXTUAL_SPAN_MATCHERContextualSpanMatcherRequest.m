@implementation SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasNlContext
{
  return self->_nlContext != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest;
  -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALRequestID *requestId;
  void *v5;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v7;
  SIRINLUEXTERNALNLContext *nlContext;
  void *v9;
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("token_chain"));

  }
  nlContext = self->_nlContext;
  if (nlContext)
  {
    -[SIRINLUEXTERNALNLContext dictionaryRepresentation](nlContext, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nl_context"));

  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("nlu_request_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
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
  if (self->_nluRequestId)
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
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
    v4 = v5;
  }
  if (self->_nlContext)
  {
    objc_msgSend(v5, "setNlContext:");
    v4 = v5;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
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
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[SIRINLUEXTERNALNLContext copyWithZone:](self->_nlContext, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  SIRINLUINTERNALTokenChain *tokenChain;
  SIRINLUEXTERNALNLContext *nlContext;
  SIRINLUEXTERNALUUID *nluRequestId;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[4]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((nlContext = self->_nlContext, !((unint64_t)nlContext | v4[1]))
     || -[SIRINLUEXTERNALNLContext isEqual:](nlContext, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[2])
      v9 = -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:");
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
  unint64_t v5;

  v3 = -[SIRINLUEXTERNALRequestID hash](self->_requestId, "hash");
  v4 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash") ^ v3;
  v5 = -[SIRINLUEXTERNALNLContext hash](self->_nlContext, "hash");
  return v4 ^ v5 ^ -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  uint64_t v6;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v8;
  SIRINLUEXTERNALNLContext *nlContext;
  uint64_t v10;
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  requestId = self->_requestId;
  v6 = v4[3];
  v13 = v4;
  if (requestId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v13;
LABEL_7:
  tokenChain = self->_tokenChain;
  v8 = v4[4];
  if (tokenChain)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v13;
LABEL_13:
  nlContext = self->_nlContext;
  v10 = v4[1];
  if (nlContext)
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUEXTERNALNLContext mergeFrom:](nlContext, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setNlContext:](self, "setNlContext:");
  }
  v4 = v13;
LABEL_19:
  nluRequestId = self->_nluRequestId;
  v12 = v4[2];
  if (nluRequestId)
  {
    if (v12)
    {
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest setNluRequestId:](self, "setNluRequestId:");
    goto LABEL_24;
  }

}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
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

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

@end
