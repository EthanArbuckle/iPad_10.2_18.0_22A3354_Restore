@implementation SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest;
  -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *utterance;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_utterance)
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
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
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
  v6 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  NSString *utterance;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[1]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:")))
  {
    utterance = self->_utterance;
    if ((unint64_t)utterance | v4[2])
      v7 = -[NSString isEqual:](utterance, "isEqual:");
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

  v3 = -[SIRINLUEXTERNALRequestID hash](self->_requestId, "hash");
  return -[NSString hash](self->_utterance, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  requestId = self->_requestId;
  v6 = v4[1];
  v7 = v4;
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
    -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest setUtterance:](self, "setUtterance:");
    v4 = v7;
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

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
