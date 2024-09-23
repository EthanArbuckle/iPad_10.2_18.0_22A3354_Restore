@implementation SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest;
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *text;
  SIRINLUEXTERNALRequestID *requestId;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("request_id"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_requestId)
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
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    v4 = v5;
  }
  if (self->_requestId)
  {
    objc_msgSend(v5, "setRequestId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *text;
  SIRINLUEXTERNALRequestID *requestId;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((text = self->_text, !((unint64_t)text | v4[2])) || -[NSString isEqual:](text, "isEqual:")))
  {
    requestId = self->_requestId;
    if ((unint64_t)requestId | v4[1])
      v7 = -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:");
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

  v3 = -[NSString hash](self->_text, "hash");
  return -[SIRINLUEXTERNALRequestID hash](self->_requestId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest setText:](self, "setText:");
    v4 = v7;
  }
  requestId = self->_requestId;
  v6 = v4[1];
  if (requestId)
  {
    if (v6)
    {
      -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest setRequestId:](self, "setRequestId:");
    goto LABEL_8;
  }

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
