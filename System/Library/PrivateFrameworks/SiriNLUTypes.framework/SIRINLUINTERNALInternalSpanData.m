@implementation SIRINLUINTERNALInternalSpanData

- (BOOL)hasSiriVocabularySpanData
{
  return self->_siriVocabularySpanData != 0;
}

- (BOOL)hasPlumSpanData
{
  return self->_plumSpanData != 0;
}

- (BOOL)hasOvertonKgSpanData
{
  return self->_overtonKgSpanData != 0;
}

- (BOOL)hasMentionDetectorSpanData
{
  return self->_mentionDetectorSpanData != 0;
}

- (BOOL)hasMentionResolverSpanData
{
  return self->_mentionResolverSpanData != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALInternalSpanData;
  -[SIRINLUINTERNALInternalSpanData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALInternalSpanData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALSiriVocabularySpanData *siriVocabularySpanData;
  void *v5;
  SIRINLUINTERNALPLUMSpanData *plumSpanData;
  void *v7;
  SIRINLUINTERNALOvertonKGSpanData *overtonKgSpanData;
  void *v9;
  SIRINLUINTERNALMentionDetectorSpanData *mentionDetectorSpanData;
  void *v11;
  SIRINLUINTERNALMentionResolverSpanData *mentionResolverSpanData;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  siriVocabularySpanData = self->_siriVocabularySpanData;
  if (siriVocabularySpanData)
  {
    -[SIRINLUINTERNALSiriVocabularySpanData dictionaryRepresentation](siriVocabularySpanData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("siri_vocabulary_span_data"));

  }
  plumSpanData = self->_plumSpanData;
  if (plumSpanData)
  {
    -[SIRINLUINTERNALPLUMSpanData dictionaryRepresentation](plumSpanData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("plum_span_data"));

  }
  overtonKgSpanData = self->_overtonKgSpanData;
  if (overtonKgSpanData)
  {
    -[SIRINLUINTERNALOvertonKGSpanData dictionaryRepresentation](overtonKgSpanData, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("overton_kg_span_data"));

  }
  mentionDetectorSpanData = self->_mentionDetectorSpanData;
  if (mentionDetectorSpanData)
  {
    -[SIRINLUINTERNALMentionDetectorSpanData dictionaryRepresentation](mentionDetectorSpanData, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mention_detector_span_data"));

  }
  mentionResolverSpanData = self->_mentionResolverSpanData;
  if (mentionResolverSpanData)
  {
    -[SIRINLUINTERNALMentionResolverSpanData dictionaryRepresentation](mentionResolverSpanData, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mention_resolver_span_data"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALInternalSpanDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_siriVocabularySpanData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_plumSpanData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_overtonKgSpanData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mentionDetectorSpanData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mentionResolverSpanData)
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
  if (self->_siriVocabularySpanData)
  {
    objc_msgSend(v4, "setSiriVocabularySpanData:");
    v4 = v5;
  }
  if (self->_plumSpanData)
  {
    objc_msgSend(v5, "setPlumSpanData:");
    v4 = v5;
  }
  if (self->_overtonKgSpanData)
  {
    objc_msgSend(v5, "setOvertonKgSpanData:");
    v4 = v5;
  }
  if (self->_mentionDetectorSpanData)
  {
    objc_msgSend(v5, "setMentionDetectorSpanData:");
    v4 = v5;
  }
  if (self->_mentionResolverSpanData)
  {
    objc_msgSend(v5, "setMentionResolverSpanData:");
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
  id v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSiriVocabularySpanData copyWithZone:](self->_siriVocabularySpanData, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[SIRINLUINTERNALPLUMSpanData copyWithZone:](self->_plumSpanData, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[SIRINLUINTERNALOvertonKGSpanData copyWithZone:](self->_overtonKgSpanData, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[SIRINLUINTERNALMentionDetectorSpanData copyWithZone:](self->_mentionDetectorSpanData, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[SIRINLUINTERNALMentionResolverSpanData copyWithZone:](self->_mentionResolverSpanData, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSiriVocabularySpanData *siriVocabularySpanData;
  SIRINLUINTERNALPLUMSpanData *plumSpanData;
  SIRINLUINTERNALOvertonKGSpanData *overtonKgSpanData;
  SIRINLUINTERNALMentionDetectorSpanData *mentionDetectorSpanData;
  SIRINLUINTERNALMentionResolverSpanData *mentionResolverSpanData;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((siriVocabularySpanData = self->_siriVocabularySpanData, !((unint64_t)siriVocabularySpanData | v4[5]))
     || -[SIRINLUINTERNALSiriVocabularySpanData isEqual:](siriVocabularySpanData, "isEqual:"))
    && ((plumSpanData = self->_plumSpanData, !((unint64_t)plumSpanData | v4[4]))
     || -[SIRINLUINTERNALPLUMSpanData isEqual:](plumSpanData, "isEqual:"))
    && ((overtonKgSpanData = self->_overtonKgSpanData, !((unint64_t)overtonKgSpanData | v4[3]))
     || -[SIRINLUINTERNALOvertonKGSpanData isEqual:](overtonKgSpanData, "isEqual:"))
    && ((mentionDetectorSpanData = self->_mentionDetectorSpanData, !((unint64_t)mentionDetectorSpanData | v4[1]))
     || -[SIRINLUINTERNALMentionDetectorSpanData isEqual:](mentionDetectorSpanData, "isEqual:")))
  {
    mentionResolverSpanData = self->_mentionResolverSpanData;
    if ((unint64_t)mentionResolverSpanData | v4[2])
      v10 = -[SIRINLUINTERNALMentionResolverSpanData isEqual:](mentionResolverSpanData, "isEqual:");
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
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[SIRINLUINTERNALSiriVocabularySpanData hash](self->_siriVocabularySpanData, "hash");
  v4 = -[SIRINLUINTERNALPLUMSpanData hash](self->_plumSpanData, "hash") ^ v3;
  v5 = -[SIRINLUINTERNALOvertonKGSpanData hash](self->_overtonKgSpanData, "hash");
  v6 = v4 ^ v5 ^ -[SIRINLUINTERNALMentionDetectorSpanData hash](self->_mentionDetectorSpanData, "hash");
  return v6 ^ -[SIRINLUINTERNALMentionResolverSpanData hash](self->_mentionResolverSpanData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSiriVocabularySpanData *siriVocabularySpanData;
  uint64_t v6;
  SIRINLUINTERNALPLUMSpanData *plumSpanData;
  uint64_t v8;
  SIRINLUINTERNALOvertonKGSpanData *overtonKgSpanData;
  uint64_t v10;
  SIRINLUINTERNALMentionDetectorSpanData *mentionDetectorSpanData;
  uint64_t v12;
  SIRINLUINTERNALMentionResolverSpanData *mentionResolverSpanData;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  siriVocabularySpanData = self->_siriVocabularySpanData;
  v15 = v4;
  v6 = v4[5];
  if (siriVocabularySpanData)
  {
    if (v6)
      -[SIRINLUINTERNALSiriVocabularySpanData mergeFrom:](siriVocabularySpanData, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALInternalSpanData setSiriVocabularySpanData:](self, "setSiriVocabularySpanData:");
  }
  plumSpanData = self->_plumSpanData;
  v8 = v15[4];
  if (plumSpanData)
  {
    if (v8)
      -[SIRINLUINTERNALPLUMSpanData mergeFrom:](plumSpanData, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALInternalSpanData setPlumSpanData:](self, "setPlumSpanData:");
  }
  overtonKgSpanData = self->_overtonKgSpanData;
  v10 = v15[3];
  if (overtonKgSpanData)
  {
    if (v10)
      -[SIRINLUINTERNALOvertonKGSpanData mergeFrom:](overtonKgSpanData, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUINTERNALInternalSpanData setOvertonKgSpanData:](self, "setOvertonKgSpanData:");
  }
  mentionDetectorSpanData = self->_mentionDetectorSpanData;
  v12 = v15[1];
  if (mentionDetectorSpanData)
  {
    if (v12)
      -[SIRINLUINTERNALMentionDetectorSpanData mergeFrom:](mentionDetectorSpanData, "mergeFrom:");
  }
  else if (v12)
  {
    -[SIRINLUINTERNALInternalSpanData setMentionDetectorSpanData:](self, "setMentionDetectorSpanData:");
  }
  mentionResolverSpanData = self->_mentionResolverSpanData;
  v14 = v15[2];
  if (mentionResolverSpanData)
  {
    if (v14)
      -[SIRINLUINTERNALMentionResolverSpanData mergeFrom:](mentionResolverSpanData, "mergeFrom:");
  }
  else if (v14)
  {
    -[SIRINLUINTERNALInternalSpanData setMentionResolverSpanData:](self, "setMentionResolverSpanData:");
  }

}

- (SIRINLUINTERNALSiriVocabularySpanData)siriVocabularySpanData
{
  return self->_siriVocabularySpanData;
}

- (void)setSiriVocabularySpanData:(id)a3
{
  objc_storeStrong((id *)&self->_siriVocabularySpanData, a3);
}

- (SIRINLUINTERNALPLUMSpanData)plumSpanData
{
  return self->_plumSpanData;
}

- (void)setPlumSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_plumSpanData, a3);
}

- (SIRINLUINTERNALOvertonKGSpanData)overtonKgSpanData
{
  return self->_overtonKgSpanData;
}

- (void)setOvertonKgSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_overtonKgSpanData, a3);
}

- (SIRINLUINTERNALMentionDetectorSpanData)mentionDetectorSpanData
{
  return self->_mentionDetectorSpanData;
}

- (void)setMentionDetectorSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_mentionDetectorSpanData, a3);
}

- (SIRINLUINTERNALMentionResolverSpanData)mentionResolverSpanData
{
  return self->_mentionResolverSpanData;
}

- (void)setMentionResolverSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_mentionResolverSpanData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriVocabularySpanData, 0);
  objc_storeStrong((id *)&self->_plumSpanData, 0);
  objc_storeStrong((id *)&self->_overtonKgSpanData, 0);
  objc_storeStrong((id *)&self->_mentionResolverSpanData, 0);
  objc_storeStrong((id *)&self->_mentionDetectorSpanData, 0);
}

@end
