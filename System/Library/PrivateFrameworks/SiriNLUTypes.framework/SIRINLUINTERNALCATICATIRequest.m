@implementation SIRINLUINTERNALCATICATIRequest

- (BOOL)hasEmbeddings
{
  return self->_embeddings != 0;
}

- (BOOL)hasOriginalUtterance
{
  return self->_originalUtterance != 0;
}

- (BOOL)hasNormalisedUtterance
{
  return self->_normalisedUtterance != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasTurnInput
{
  return self->_turnInput != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALCATICATIRequest;
  -[SIRINLUINTERNALCATICATIRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCATICATIRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  void *v5;
  NSString *originalUtterance;
  NSString *normalisedUtterance;
  SIRINLUEXTERNALUUID *requestId;
  void *v9;
  SIRINLUEXTERNALTurnInput *turnInput;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  embeddings = self->_embeddings;
  if (embeddings)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddings, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("embeddings"));

  }
  originalUtterance = self->_originalUtterance;
  if (originalUtterance)
    objc_msgSend(v3, "setObject:forKey:", originalUtterance, CFSTR("original_utterance"));
  normalisedUtterance = self->_normalisedUtterance;
  if (normalisedUtterance)
    objc_msgSend(v3, "setObject:forKey:", normalisedUtterance, CFSTR("normalised_utterance"));
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("request_id"));

  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](turnInput, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("turn_input"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCATICATIRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_embeddings)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_originalUtterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_requestId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_turnInput)
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
  if (self->_embeddings)
  {
    objc_msgSend(v4, "setEmbeddings:");
    v4 = v5;
  }
  if (self->_originalUtterance)
  {
    objc_msgSend(v5, "setOriginalUtterance:");
    v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    objc_msgSend(v5, "setNormalisedUtterance:");
    v4 = v5;
  }
  if (self->_requestId)
  {
    objc_msgSend(v5, "setRequestId:");
    v4 = v5;
  }
  if (self->_turnInput)
  {
    objc_msgSend(v5, "setTurnInput:");
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
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddings, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_originalUtterance, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_normalisedUtterance, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_turnInput, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  NSString *originalUtterance;
  NSString *normalisedUtterance;
  SIRINLUEXTERNALUUID *requestId;
  SIRINLUEXTERNALTurnInput *turnInput;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((embeddings = self->_embeddings, !((unint64_t)embeddings | v4[1]))
     || -[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddings, "isEqual:"))
    && ((originalUtterance = self->_originalUtterance, !((unint64_t)originalUtterance | v4[3]))
     || -[NSString isEqual:](originalUtterance, "isEqual:"))
    && ((normalisedUtterance = self->_normalisedUtterance, !((unint64_t)normalisedUtterance | v4[2]))
     || -[NSString isEqual:](normalisedUtterance, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")))
  {
    turnInput = self->_turnInput;
    if ((unint64_t)turnInput | v4[5])
      v10 = -[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddings, "hash");
  v4 = -[NSString hash](self->_originalUtterance, "hash") ^ v3;
  v5 = -[NSString hash](self->_normalisedUtterance, "hash");
  v6 = v4 ^ v5 ^ -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  return v6 ^ -[SIRINLUEXTERNALTurnInput hash](self->_turnInput, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  uint64_t v6;
  SIRINLUEXTERNALUUID *requestId;
  uint64_t v8;
  SIRINLUEXTERNALTurnInput *turnInput;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  embeddings = self->_embeddings;
  v11 = v4;
  v6 = v4[1];
  if (embeddings)
  {
    if (v6)
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddings, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALCATICATIRequest setEmbeddings:](self, "setEmbeddings:");
  }
  if (v11[3])
    -[SIRINLUINTERNALCATICATIRequest setOriginalUtterance:](self, "setOriginalUtterance:");
  if (v11[2])
    -[SIRINLUINTERNALCATICATIRequest setNormalisedUtterance:](self, "setNormalisedUtterance:");
  requestId = self->_requestId;
  v8 = v11[4];
  if (requestId)
  {
    if (v8)
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALCATICATIRequest setRequestId:](self, "setRequestId:");
  }
  turnInput = self->_turnInput;
  v10 = v11[5];
  if (turnInput)
  {
    if (v10)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUINTERNALCATICATIRequest setTurnInput:](self, "setTurnInput:");
  }

}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings
{
  return self->_embeddings;
}

- (void)setEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_embeddings, a3);
}

- (NSString)originalUtterance
{
  return self->_originalUtterance;
}

- (void)setOriginalUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_originalUtterance, a3);
}

- (NSString)normalisedUtterance
{
  return self->_normalisedUtterance;
}

- (void)setNormalisedUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_normalisedUtterance, a3);
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (void)setTurnInput:(id)a3
{
  objc_storeStrong((id *)&self->_turnInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_originalUtterance, 0);
  objc_storeStrong((id *)&self->_normalisedUtterance, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
}

@end
