@implementation SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (void)setMaxCandidates:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxCandidates = a3;
}

- (void)setHasMaxCandidates:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxCandidates
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest;
  -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *requestId;
  void *v5;
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v7;
  NSString *resultCandidateId;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v11;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  void *v13;
  void *v14;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nlu_request_id"));

  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId)
    objc_msgSend(v3, "setObject:forKey:", resultCandidateId, CFSTR("result_candidate_id"));
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("token_chain"));

  }
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddingTensor, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("embedding_tensor"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_maxCandidates);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("max_candidates"));

  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](cdmRequestId, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("cdm_request_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_nluRequestId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_resultCandidateId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_embeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_cdmRequestId)
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
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
    v4 = v5;
  }
  if (self->_resultCandidateId)
  {
    objc_msgSend(v5, "setResultCandidateId:");
    v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
    v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
    v4 = v5;
  }
  if (self->_embeddingTensor)
  {
    objc_msgSend(v5, "setEmbeddingTensor:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_maxCandidates;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_cdmRequestId)
  {
    objc_msgSend(v5, "setCdmRequestId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_resultCandidateId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddingTensor, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_maxCandidates;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v18 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_cdmRequestId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
  SIRINLUEXTERNALUUID *nluRequestId;
  NSString *resultCandidateId;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
      goto LABEL_21;
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:"))
      goto LABEL_21;
  }
  resultCandidateId = self->_resultCandidateId;
  if ((unint64_t)resultCandidateId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](resultCandidateId, "isEqual:"))
      goto LABEL_21;
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:"))
      goto LABEL_21;
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((_QWORD *)v4 + 7))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
      goto LABEL_21;
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((_QWORD *)v4 + 3))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_maxCandidates != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  cdmRequestId = self->_cdmRequestId;
  if ((unint64_t)cdmRequestId | *((_QWORD *)v4 + 2))
    v12 = -[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  v4 = -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
  v5 = -[NSString hash](self->_resultCandidateId, "hash");
  v6 = -[NSString hash](self->_utterance, "hash");
  v7 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
  v8 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddingTensor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761u * self->_maxCandidates;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[SIRINLUEXTERNALRequestID hash](self->_cdmRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *requestId;
  uint64_t v6;
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v8;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v10;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  uint64_t v12;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  requestId = self->_requestId;
  v6 = v4[5];
  v15 = v4;
  if (requestId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v15;
LABEL_7:
  nluRequestId = self->_nluRequestId;
  v8 = v4[4];
  if (nluRequestId)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setNluRequestId:](self, "setNluRequestId:");
  }
  v4 = v15;
LABEL_13:
  if (v4[6])
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setResultCandidateId:](self, "setResultCandidateId:");
    v4 = v15;
  }
  if (v4[8])
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setUtterance:](self, "setUtterance:");
    v4 = v15;
  }
  tokenChain = self->_tokenChain;
  v10 = v4[7];
  if (tokenChain)
  {
    if (!v10)
      goto LABEL_23;
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v15;
LABEL_23:
  embeddingTensor = self->_embeddingTensor;
  v12 = v4[3];
  if (embeddingTensor)
  {
    if (!v12)
      goto LABEL_29;
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_29;
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  v4 = v15;
LABEL_29:
  if ((v4[9] & 1) != 0)
  {
    self->_maxCandidates = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  cdmRequestId = self->_cdmRequestId;
  v14 = v4[2];
  if (cdmRequestId)
  {
    if (v14)
    {
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
LABEL_36:
      v4 = v15;
    }
  }
  else if (v14)
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setCdmRequestId:](self, "setCdmRequestId:");
    goto LABEL_36;
  }

}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_resultCandidateId, a3);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingTensor, a3);
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
}

- (void)setCdmRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_cdmRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

@end
