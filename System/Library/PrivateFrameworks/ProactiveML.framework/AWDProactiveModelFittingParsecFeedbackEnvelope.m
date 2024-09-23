@implementation AWDProactiveModelFittingParsecFeedbackEnvelope

- (BOOL)hasEvaluation
{
  return self->_evaluation != 0;
}

- (BOOL)hasLogRegWeights
{
  return self->_logRegWeights != 0;
}

- (BOOL)hasLogRegGradient
{
  return self->_logRegGradient != 0;
}

- (BOOL)hasLinRegFeatureMatrix
{
  return self->_linRegFeatureMatrix != 0;
}

- (BOOL)hasLinRegObjectiveFeatures
{
  return self->_linRegObjectiveFeatures != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingParsecFeedbackEnvelope;
  -[AWDProactiveModelFittingParsecFeedbackEnvelope description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingParsecFeedbackEnvelope dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDProactiveModelFittingEvaluation *evaluation;
  void *v5;
  AWDProactiveModelFittingLogRegWeights *logRegWeights;
  void *v7;
  AWDProactiveModelFittingLogRegGradient *logRegGradient;
  void *v9;
  AWDProactiveModelFittingLinRegFeatureMatrix *linRegFeatureMatrix;
  void *v11;
  AWDProactiveModelFittingLinRegObjectiveFeatures *linRegObjectiveFeatures;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  evaluation = self->_evaluation;
  if (evaluation)
  {
    -[AWDProactiveModelFittingEvaluation dictionaryRepresentation](evaluation, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("evaluation"));

  }
  logRegWeights = self->_logRegWeights;
  if (logRegWeights)
  {
    -[AWDProactiveModelFittingLogRegWeights dictionaryRepresentation](logRegWeights, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("logRegWeights"));

  }
  logRegGradient = self->_logRegGradient;
  if (logRegGradient)
  {
    -[AWDProactiveModelFittingLogRegGradient dictionaryRepresentation](logRegGradient, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("logRegGradient"));

  }
  linRegFeatureMatrix = self->_linRegFeatureMatrix;
  if (linRegFeatureMatrix)
  {
    -[AWDProactiveModelFittingLinRegFeatureMatrix dictionaryRepresentation](linRegFeatureMatrix, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("linRegFeatureMatrix"));

  }
  linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
  if (linRegObjectiveFeatures)
  {
    -[AWDProactiveModelFittingLinRegObjectiveFeatures dictionaryRepresentation](linRegObjectiveFeatures, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("linRegObjectiveFeatures"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingParsecFeedbackEnvelopeReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_evaluation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_logRegWeights)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_logRegGradient)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_linRegFeatureMatrix)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_linRegObjectiveFeatures)
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
  if (self->_evaluation)
  {
    objc_msgSend(v4, "setEvaluation:");
    v4 = v5;
  }
  if (self->_logRegWeights)
  {
    objc_msgSend(v5, "setLogRegWeights:");
    v4 = v5;
  }
  if (self->_logRegGradient)
  {
    objc_msgSend(v5, "setLogRegGradient:");
    v4 = v5;
  }
  if (self->_linRegFeatureMatrix)
  {
    objc_msgSend(v5, "setLinRegFeatureMatrix:");
    v4 = v5;
  }
  if (self->_linRegObjectiveFeatures)
  {
    objc_msgSend(v5, "setLinRegObjectiveFeatures:");
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
  v6 = -[AWDProactiveModelFittingEvaluation copyWithZone:](self->_evaluation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[AWDProactiveModelFittingLogRegWeights copyWithZone:](self->_logRegWeights, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[AWDProactiveModelFittingLogRegGradient copyWithZone:](self->_logRegGradient, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[AWDProactiveModelFittingLinRegFeatureMatrix copyWithZone:](self->_linRegFeatureMatrix, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[AWDProactiveModelFittingLinRegObjectiveFeatures copyWithZone:](self->_linRegObjectiveFeatures, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  AWDProactiveModelFittingEvaluation *evaluation;
  AWDProactiveModelFittingLogRegWeights *logRegWeights;
  AWDProactiveModelFittingLogRegGradient *logRegGradient;
  AWDProactiveModelFittingLinRegFeatureMatrix *linRegFeatureMatrix;
  AWDProactiveModelFittingLinRegObjectiveFeatures *linRegObjectiveFeatures;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((evaluation = self->_evaluation, !((unint64_t)evaluation | v4[1]))
     || -[AWDProactiveModelFittingEvaluation isEqual:](evaluation, "isEqual:"))
    && ((logRegWeights = self->_logRegWeights, !((unint64_t)logRegWeights | v4[5]))
     || -[AWDProactiveModelFittingLogRegWeights isEqual:](logRegWeights, "isEqual:"))
    && ((logRegGradient = self->_logRegGradient, !((unint64_t)logRegGradient | v4[4]))
     || -[AWDProactiveModelFittingLogRegGradient isEqual:](logRegGradient, "isEqual:"))
    && ((linRegFeatureMatrix = self->_linRegFeatureMatrix, !((unint64_t)linRegFeatureMatrix | v4[2]))
     || -[AWDProactiveModelFittingLinRegFeatureMatrix isEqual:](linRegFeatureMatrix, "isEqual:")))
  {
    linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
    if ((unint64_t)linRegObjectiveFeatures | v4[3])
      v10 = -[AWDProactiveModelFittingLinRegObjectiveFeatures isEqual:](linRegObjectiveFeatures, "isEqual:");
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

  v3 = -[AWDProactiveModelFittingEvaluation hash](self->_evaluation, "hash");
  v4 = -[AWDProactiveModelFittingLogRegWeights hash](self->_logRegWeights, "hash") ^ v3;
  v5 = -[AWDProactiveModelFittingLogRegGradient hash](self->_logRegGradient, "hash");
  v6 = v4 ^ v5 ^ -[AWDProactiveModelFittingLinRegFeatureMatrix hash](self->_linRegFeatureMatrix, "hash");
  return v6 ^ -[AWDProactiveModelFittingLinRegObjectiveFeatures hash](self->_linRegObjectiveFeatures, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  AWDProactiveModelFittingEvaluation *evaluation;
  uint64_t v6;
  AWDProactiveModelFittingLogRegWeights *logRegWeights;
  uint64_t v8;
  AWDProactiveModelFittingLogRegGradient *logRegGradient;
  uint64_t v10;
  AWDProactiveModelFittingLinRegFeatureMatrix *linRegFeatureMatrix;
  uint64_t v12;
  AWDProactiveModelFittingLinRegObjectiveFeatures *linRegObjectiveFeatures;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  evaluation = self->_evaluation;
  v15 = v4;
  v6 = v4[1];
  if (evaluation)
  {
    if (v6)
      -[AWDProactiveModelFittingEvaluation mergeFrom:](evaluation, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setEvaluation:](self, "setEvaluation:");
  }
  logRegWeights = self->_logRegWeights;
  v8 = v15[5];
  if (logRegWeights)
  {
    if (v8)
      -[AWDProactiveModelFittingLogRegWeights mergeFrom:](logRegWeights, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLogRegWeights:](self, "setLogRegWeights:");
  }
  logRegGradient = self->_logRegGradient;
  v10 = v15[4];
  if (logRegGradient)
  {
    if (v10)
      -[AWDProactiveModelFittingLogRegGradient mergeFrom:](logRegGradient, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLogRegGradient:](self, "setLogRegGradient:");
  }
  linRegFeatureMatrix = self->_linRegFeatureMatrix;
  v12 = v15[2];
  if (linRegFeatureMatrix)
  {
    if (v12)
      -[AWDProactiveModelFittingLinRegFeatureMatrix mergeFrom:](linRegFeatureMatrix, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLinRegFeatureMatrix:](self, "setLinRegFeatureMatrix:");
  }
  linRegObjectiveFeatures = self->_linRegObjectiveFeatures;
  v14 = v15[3];
  if (linRegObjectiveFeatures)
  {
    if (v14)
      -[AWDProactiveModelFittingLinRegObjectiveFeatures mergeFrom:](linRegObjectiveFeatures, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDProactiveModelFittingParsecFeedbackEnvelope setLinRegObjectiveFeatures:](self, "setLinRegObjectiveFeatures:");
  }

}

- (AWDProactiveModelFittingEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)setEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_evaluation, a3);
}

- (AWDProactiveModelFittingLogRegWeights)logRegWeights
{
  return self->_logRegWeights;
}

- (void)setLogRegWeights:(id)a3
{
  objc_storeStrong((id *)&self->_logRegWeights, a3);
}

- (AWDProactiveModelFittingLogRegGradient)logRegGradient
{
  return self->_logRegGradient;
}

- (void)setLogRegGradient:(id)a3
{
  objc_storeStrong((id *)&self->_logRegGradient, a3);
}

- (AWDProactiveModelFittingLinRegFeatureMatrix)linRegFeatureMatrix
{
  return self->_linRegFeatureMatrix;
}

- (void)setLinRegFeatureMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_linRegFeatureMatrix, a3);
}

- (AWDProactiveModelFittingLinRegObjectiveFeatures)linRegObjectiveFeatures
{
  return self->_linRegObjectiveFeatures;
}

- (void)setLinRegObjectiveFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_linRegObjectiveFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logRegWeights, 0);
  objc_storeStrong((id *)&self->_logRegGradient, 0);
  objc_storeStrong((id *)&self->_linRegObjectiveFeatures, 0);
  objc_storeStrong((id *)&self->_linRegFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
}

@end
