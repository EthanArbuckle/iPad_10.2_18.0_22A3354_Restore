@implementation ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent;
  -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsBeforeActivation;
  void *v5;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsAfterActivation;
  void *v7;
  NSString *contactId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  if (embeddingsBeforeActivation)
  {
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding dictionaryRepresentation](embeddingsBeforeActivation, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("embeddingsBeforeActivation"));

  }
  embeddingsAfterActivation = self->_embeddingsAfterActivation;
  if (embeddingsAfterActivation)
  {
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding dictionaryRepresentation](embeddingsAfterActivation, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("embeddingsAfterActivation"));

  }
  contactId = self->_contactId;
  if (contactId)
    objc_msgSend(v3, "setObject:forKey:", contactId, CFSTR("contactId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_embeddingsBeforeActivation)
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_embeddingsAfterActivation)
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if (!self->_contactId)
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:].cold.3();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsBeforeActivation;
  id v5;

  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  v5 = a3;
  objc_msgSend(v5, "setEmbeddingsBeforeActivation:", embeddingsBeforeActivation);
  objc_msgSend(v5, "setEmbeddingsAfterActivation:", self->_embeddingsAfterActivation);
  objc_msgSend(v5, "setContactId:", self->_contactId);

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ContactEmbeddingAnalysisPETNeuralNetEmbedding copyWithZone:](self->_embeddingsBeforeActivation, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[ContactEmbeddingAnalysisPETNeuralNetEmbedding copyWithZone:](self->_embeddingsAfterActivation, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_contactId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsBeforeActivation;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsAfterActivation;
  NSString *contactId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((embeddingsBeforeActivation = self->_embeddingsBeforeActivation,
         !((unint64_t)embeddingsBeforeActivation | v4[3]))
     || -[ContactEmbeddingAnalysisPETNeuralNetEmbedding isEqual:](embeddingsBeforeActivation, "isEqual:"))
    && ((embeddingsAfterActivation = self->_embeddingsAfterActivation,
         !((unint64_t)embeddingsAfterActivation | v4[2]))
     || -[ContactEmbeddingAnalysisPETNeuralNetEmbedding isEqual:](embeddingsAfterActivation, "isEqual:")))
  {
    contactId = self->_contactId;
    if ((unint64_t)contactId | v4[1])
      v8 = -[NSString isEqual:](contactId, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[ContactEmbeddingAnalysisPETNeuralNetEmbedding hash](self->_embeddingsBeforeActivation, "hash");
  v4 = -[ContactEmbeddingAnalysisPETNeuralNetEmbedding hash](self->_embeddingsAfterActivation, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_contactId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsBeforeActivation;
  uint64_t v6;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *embeddingsAfterActivation;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  embeddingsBeforeActivation = self->_embeddingsBeforeActivation;
  v6 = v4[3];
  v9 = v4;
  if (embeddingsBeforeActivation)
  {
    if (!v6)
      goto LABEL_7;
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding mergeFrom:](embeddingsBeforeActivation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsBeforeActivation:](self, "setEmbeddingsBeforeActivation:");
  }
  v4 = v9;
LABEL_7:
  embeddingsAfterActivation = self->_embeddingsAfterActivation;
  v8 = v4[2];
  if (embeddingsAfterActivation)
  {
    if (!v8)
      goto LABEL_13;
    -[ContactEmbeddingAnalysisPETNeuralNetEmbedding mergeFrom:](embeddingsAfterActivation, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsAfterActivation:](self, "setEmbeddingsAfterActivation:");
  }
  v4 = v9;
LABEL_13:
  if (v4[1])
  {
    -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setContactId:](self, "setContactId:");
    v4 = v9;
  }

}

- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsBeforeActivation
{
  return self->_embeddingsBeforeActivation;
}

- (void)setEmbeddingsBeforeActivation:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingsBeforeActivation, a3);
}

- (ContactEmbeddingAnalysisPETNeuralNetEmbedding)embeddingsAfterActivation
{
  return self->_embeddingsAfterActivation;
}

- (void)setEmbeddingsAfterActivation:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingsAfterActivation, a3);
}

- (NSString)contactId
{
  return self->_contactId;
}

- (void)setContactId:(id)a3
{
  objc_storeStrong((id *)&self->_contactId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingsBeforeActivation, 0);
  objc_storeStrong((id *)&self->_embeddingsAfterActivation, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 120, "self->_embeddingsBeforeActivation != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 125, "self->_embeddingsAfterActivation != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent.m", 130, "nil != self->_contactId");
}

@end
