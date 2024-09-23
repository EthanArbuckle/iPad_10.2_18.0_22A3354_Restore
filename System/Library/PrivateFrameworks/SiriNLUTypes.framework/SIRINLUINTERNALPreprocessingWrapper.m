@implementation SIRINLUINTERNALPreprocessingWrapper

- (BOOL)hasTokenizerResponse
{
  return self->_tokenizerResponse != 0;
}

- (BOOL)hasSpanMatchResponse
{
  return self->_spanMatchResponse != 0;
}

- (BOOL)hasEmbeddingResponse
{
  return self->_embeddingResponse != 0;
}

- (BOOL)hasMentionResolverResponse
{
  return self->_mentionResolverResponse != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALPreprocessingWrapper;
  -[SIRINLUINTERNALPreprocessingWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALPreprocessingWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALTOKENIZERTokenizerResponse *tokenizerResponse;
  void *v5;
  SIRINLUINTERNALSPANMATCHSpanMatchResponse *spanMatchResponse;
  void *v7;
  SIRINLUINTERNALEMBEDDINGEmbeddingResponse *embeddingResponse;
  void *v9;
  SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *mentionResolverResponse;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokenizerResponse = self->_tokenizerResponse;
  if (tokenizerResponse)
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse dictionaryRepresentation](tokenizerResponse, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tokenizer_response"));

  }
  spanMatchResponse = self->_spanMatchResponse;
  if (spanMatchResponse)
  {
    -[SIRINLUINTERNALSPANMATCHSpanMatchResponse dictionaryRepresentation](spanMatchResponse, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("span_match_response"));

  }
  embeddingResponse = self->_embeddingResponse;
  if (embeddingResponse)
  {
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse dictionaryRepresentation](embeddingResponse, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("embedding_response"));

  }
  mentionResolverResponse = self->_mentionResolverResponse;
  if (mentionResolverResponse)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse dictionaryRepresentation](mentionResolverResponse, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mention_resolver_response"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPreprocessingWrapperReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tokenizerResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_spanMatchResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_embeddingResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mentionResolverResponse)
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
  if (self->_tokenizerResponse)
  {
    objc_msgSend(v4, "setTokenizerResponse:");
    v4 = v5;
  }
  if (self->_spanMatchResponse)
  {
    objc_msgSend(v5, "setSpanMatchResponse:");
    v4 = v5;
  }
  if (self->_embeddingResponse)
  {
    objc_msgSend(v5, "setEmbeddingResponse:");
    v4 = v5;
  }
  if (self->_mentionResolverResponse)
  {
    objc_msgSend(v5, "setMentionResolverResponse:");
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
  v6 = -[SIRINLUINTERNALTOKENIZERTokenizerResponse copyWithZone:](self->_tokenizerResponse, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[SIRINLUINTERNALSPANMATCHSpanMatchResponse copyWithZone:](self->_spanMatchResponse, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse copyWithZone:](self->_embeddingResponse, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse copyWithZone:](self->_mentionResolverResponse, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTOKENIZERTokenizerResponse *tokenizerResponse;
  SIRINLUINTERNALSPANMATCHSpanMatchResponse *spanMatchResponse;
  SIRINLUINTERNALEMBEDDINGEmbeddingResponse *embeddingResponse;
  SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *mentionResolverResponse;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tokenizerResponse = self->_tokenizerResponse, !((unint64_t)tokenizerResponse | v4[4]))
     || -[SIRINLUINTERNALTOKENIZERTokenizerResponse isEqual:](tokenizerResponse, "isEqual:"))
    && ((spanMatchResponse = self->_spanMatchResponse, !((unint64_t)spanMatchResponse | v4[3]))
     || -[SIRINLUINTERNALSPANMATCHSpanMatchResponse isEqual:](spanMatchResponse, "isEqual:"))
    && ((embeddingResponse = self->_embeddingResponse, !((unint64_t)embeddingResponse | v4[1]))
     || -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse isEqual:](embeddingResponse, "isEqual:")))
  {
    mentionResolverResponse = self->_mentionResolverResponse;
    if ((unint64_t)mentionResolverResponse | v4[2])
      v9 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse isEqual:](mentionResolverResponse, "isEqual:");
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

  v3 = -[SIRINLUINTERNALTOKENIZERTokenizerResponse hash](self->_tokenizerResponse, "hash");
  v4 = -[SIRINLUINTERNALSPANMATCHSpanMatchResponse hash](self->_spanMatchResponse, "hash") ^ v3;
  v5 = -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse hash](self->_embeddingResponse, "hash");
  return v4 ^ v5 ^ -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse hash](self->_mentionResolverResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTOKENIZERTokenizerResponse *tokenizerResponse;
  uint64_t v6;
  SIRINLUINTERNALSPANMATCHSpanMatchResponse *spanMatchResponse;
  uint64_t v8;
  SIRINLUINTERNALEMBEDDINGEmbeddingResponse *embeddingResponse;
  uint64_t v10;
  SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *mentionResolverResponse;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  tokenizerResponse = self->_tokenizerResponse;
  v6 = v4[4];
  v13 = v4;
  if (tokenizerResponse)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse mergeFrom:](tokenizerResponse, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALPreprocessingWrapper setTokenizerResponse:](self, "setTokenizerResponse:");
  }
  v4 = v13;
LABEL_7:
  spanMatchResponse = self->_spanMatchResponse;
  v8 = v4[3];
  if (spanMatchResponse)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALSPANMATCHSpanMatchResponse mergeFrom:](spanMatchResponse, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALPreprocessingWrapper setSpanMatchResponse:](self, "setSpanMatchResponse:");
  }
  v4 = v13;
LABEL_13:
  embeddingResponse = self->_embeddingResponse;
  v10 = v4[1];
  if (embeddingResponse)
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUINTERNALEMBEDDINGEmbeddingResponse mergeFrom:](embeddingResponse, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUINTERNALPreprocessingWrapper setEmbeddingResponse:](self, "setEmbeddingResponse:");
  }
  v4 = v13;
LABEL_19:
  mentionResolverResponse = self->_mentionResolverResponse;
  v12 = v4[2];
  if (mentionResolverResponse)
  {
    if (v12)
    {
      -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse mergeFrom:](mentionResolverResponse, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALPreprocessingWrapper setMentionResolverResponse:](self, "setMentionResolverResponse:");
    goto LABEL_24;
  }

}

- (SIRINLUINTERNALTOKENIZERTokenizerResponse)tokenizerResponse
{
  return self->_tokenizerResponse;
}

- (void)setTokenizerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizerResponse, a3);
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (void)setSpanMatchResponse:(id)a3
{
  objc_storeStrong((id *)&self->_spanMatchResponse, a3);
}

- (SIRINLUINTERNALEMBEDDINGEmbeddingResponse)embeddingResponse
{
  return self->_embeddingResponse;
}

- (void)setEmbeddingResponse:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingResponse, a3);
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)mentionResolverResponse
{
  return self->_mentionResolverResponse;
}

- (void)setMentionResolverResponse:(id)a3
{
  objc_storeStrong((id *)&self->_mentionResolverResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerResponse, 0);
  objc_storeStrong((id *)&self->_spanMatchResponse, 0);
  objc_storeStrong((id *)&self->_mentionResolverResponse, 0);
  objc_storeStrong((id *)&self->_embeddingResponse, 0);
}

@end
