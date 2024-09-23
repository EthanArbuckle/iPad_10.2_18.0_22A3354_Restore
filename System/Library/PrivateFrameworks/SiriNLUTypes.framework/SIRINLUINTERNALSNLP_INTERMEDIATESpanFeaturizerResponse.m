@implementation SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse

- (BOOL)hasTensor
{
  return self->_tensor != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse;
  -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *tensor;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tensor = self->_tensor;
  if (tensor)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor dictionaryRepresentation](tensor, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tensor"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tensor)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *tensor;

  tensor = self->_tensor;
  if (tensor)
    objc_msgSend(a3, "setTensor:", tensor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor copyWithZone:](self->_tensor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *tensor;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    tensor = self->_tensor;
    if ((unint64_t)tensor | v4[1])
      v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor isEqual:](tensor, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor hash](self->_tensor, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *tensor;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  tensor = self->_tensor;
  v6 = v4[1];
  if (tensor)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor mergeFrom:](tensor, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALSNLP_INTERMEDIATESpanFeaturizerResponse setTensor:](self, "setTensor:");
    goto LABEL_6;
  }

}

- (SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor)tensor
{
  return self->_tensor;
}

- (void)setTensor:(id)a3
{
  objc_storeStrong((id *)&self->_tensor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensor, 0);
}

@end
