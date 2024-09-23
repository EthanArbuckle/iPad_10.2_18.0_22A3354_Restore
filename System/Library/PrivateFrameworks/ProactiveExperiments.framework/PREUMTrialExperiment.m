@implementation PREUMTrialExperiment

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
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
  v8.super_class = (Class)PREUMTrialExperiment;
  -[PREUMTrialExperiment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREUMTrialExperiment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experiment_id"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v4, "setObject:forKey:", treatmentId, CFSTR("treatment_id"));
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName)
    objc_msgSend(v4, "setObject:forKey:", treatmentModelName, CFSTR("treatment_model_name"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PREUMTrialExperimentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_treatmentModelName)
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
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v5;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v5, "setTreatmentId:");
    v4 = v5;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v5, "setTreatmentModelName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_treatmentModelName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((experimentId = self->_experimentId, !((unint64_t)experimentId | v4[1]))
     || -[NSString isEqual:](experimentId, "isEqual:"))
    && ((treatmentId = self->_treatmentId, !((unint64_t)treatmentId | v4[2]))
     || -[NSString isEqual:](treatmentId, "isEqual:")))
  {
    treatmentModelName = self->_treatmentModelName;
    if ((unint64_t)treatmentModelName | v4[3])
      v8 = -[NSString isEqual:](treatmentModelName, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[NSString hash](self->_treatmentId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_treatmentModelName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[PREUMTrialExperiment setExperimentId:](self, "setExperimentId:");
  if (v4[2])
    -[PREUMTrialExperiment setTreatmentId:](self, "setTreatmentId:");
  if (v4[3])
    -[PREUMTrialExperiment setTreatmentModelName:](self, "setTreatmentModelName:");

}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentModelName:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentModelName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
