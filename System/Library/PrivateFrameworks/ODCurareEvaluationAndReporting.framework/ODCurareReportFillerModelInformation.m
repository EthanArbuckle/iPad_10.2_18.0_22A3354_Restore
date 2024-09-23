@implementation ODCurareReportFillerModelInformation

- (BOOL)hasModelCreationDate
{
  return self->_modelCreationDate != 0;
}

- (BOOL)hasDataUsedToPersonalizeModel
{
  return self->_dataUsedToPersonalizeModel != 0;
}

- (BOOL)hasModelHyperparameters
{
  return self->_modelHyperparameters != 0;
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
  v8.super_class = (Class)ODCurareReportFillerModelInformation;
  -[ODCurareReportFillerModelInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerModelInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *modelName;
  NSString *modelCreationDate;
  void *v7;
  ODCurareReportFillerDataSet *dataUsedToPersonalizeModel;
  void *v9;
  ODCurareReportFillerModelHyperparameters *modelHyperparameters;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  modelName = self->_modelName;
  if (modelName)
    objc_msgSend(v3, "setObject:forKey:", modelName, CFSTR("modelName"));
  modelCreationDate = self->_modelCreationDate;
  if (modelCreationDate)
    objc_msgSend(v4, "setObject:forKey:", modelCreationDate, CFSTR("modelCreationDate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDefaultModel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isDefaultModel"));

  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  if (dataUsedToPersonalizeModel)
  {
    -[ODCurareReportFillerDataSet dictionaryRepresentation](dataUsedToPersonalizeModel, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("dataUsedToPersonalizeModel"));

  }
  modelHyperparameters = self->_modelHyperparameters;
  if (modelHyperparameters)
  {
    -[ODCurareReportFillerModelHyperparameters dictionaryRepresentation](modelHyperparameters, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("modelHyperparameters"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_modelName)
    -[ODCurareReportFillerModelInformation writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_modelCreationDate)
    PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_dataUsedToPersonalizeModel)
    PBDataWriterWriteSubmessage();
  if (self->_modelHyperparameters)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setModelName:", self->_modelName);
  if (self->_modelCreationDate)
    objc_msgSend(v5, "setModelCreationDate:");
  v4 = v5;
  v5[40] = self->_isDefaultModel;
  if (self->_dataUsedToPersonalizeModel)
  {
    objc_msgSend(v5, "setDataUsedToPersonalizeModel:");
    v4 = v5;
  }
  if (self->_modelHyperparameters)
  {
    objc_msgSend(v5, "setModelHyperparameters:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_modelCreationDate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_BYTE *)(v5 + 40) = self->_isDefaultModel;
  v10 = -[ODCurareReportFillerDataSet copyWithZone:](self->_dataUsedToPersonalizeModel, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[ODCurareReportFillerModelHyperparameters copyWithZone:](self->_modelHyperparameters, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *modelName;
  NSString *modelCreationDate;
  ODCurareReportFillerDataSet *dataUsedToPersonalizeModel;
  ODCurareReportFillerModelHyperparameters *modelHyperparameters;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:"))
      goto LABEL_14;
  }
  modelCreationDate = self->_modelCreationDate;
  if ((unint64_t)modelCreationDate | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](modelCreationDate, "isEqual:"))
      goto LABEL_14;
  }
  if (self->_isDefaultModel)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_14;
  }
  else if (*((_BYTE *)v4 + 40))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  if ((unint64_t)dataUsedToPersonalizeModel | *((_QWORD *)v4 + 1)
    && !-[ODCurareReportFillerDataSet isEqual:](dataUsedToPersonalizeModel, "isEqual:"))
  {
    goto LABEL_14;
  }
  modelHyperparameters = self->_modelHyperparameters;
  if ((unint64_t)modelHyperparameters | *((_QWORD *)v4 + 3))
    v9 = -[ODCurareReportFillerModelHyperparameters isEqual:](modelHyperparameters, "isEqual:");
  else
    v9 = 1;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_modelName, "hash");
  v4 = -[NSString hash](self->_modelCreationDate, "hash") ^ v3;
  v5 = 2654435761 * self->_isDefaultModel;
  v6 = v4 ^ -[ODCurareReportFillerDataSet hash](self->_dataUsedToPersonalizeModel, "hash");
  return v6 ^ -[ODCurareReportFillerModelHyperparameters hash](self->_modelHyperparameters, "hash") ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  ODCurareReportFillerDataSet *dataUsedToPersonalizeModel;
  uint64_t v6;
  ODCurareReportFillerModelHyperparameters *modelHyperparameters;
  uint64_t v8;
  BOOL *v9;

  v4 = (BOOL *)a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ODCurareReportFillerModelInformation setModelName:](self, "setModelName:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ODCurareReportFillerModelInformation setModelCreationDate:](self, "setModelCreationDate:");
    v4 = v9;
  }
  self->_isDefaultModel = v4[40];
  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  v6 = *((_QWORD *)v4 + 1);
  if (dataUsedToPersonalizeModel)
  {
    if (!v6)
      goto LABEL_11;
    -[ODCurareReportFillerDataSet mergeFrom:](dataUsedToPersonalizeModel, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[ODCurareReportFillerModelInformation setDataUsedToPersonalizeModel:](self, "setDataUsedToPersonalizeModel:");
  }
  v4 = v9;
LABEL_11:
  modelHyperparameters = self->_modelHyperparameters;
  v8 = *((_QWORD *)v4 + 3);
  if (modelHyperparameters)
  {
    if (v8)
    {
      -[ODCurareReportFillerModelHyperparameters mergeFrom:](modelHyperparameters, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[ODCurareReportFillerModelInformation setModelHyperparameters:](self, "setModelHyperparameters:");
    goto LABEL_16;
  }

}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (NSString)modelCreationDate
{
  return self->_modelCreationDate;
}

- (void)setModelCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modelCreationDate, a3);
}

- (BOOL)isDefaultModel
{
  return self->_isDefaultModel;
}

- (void)setIsDefaultModel:(BOOL)a3
{
  self->_isDefaultModel = a3;
}

- (ODCurareReportFillerDataSet)dataUsedToPersonalizeModel
{
  return self->_dataUsedToPersonalizeModel;
}

- (void)setDataUsedToPersonalizeModel:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsedToPersonalizeModel, a3);
}

- (ODCurareReportFillerModelHyperparameters)modelHyperparameters
{
  return self->_modelHyperparameters;
}

- (void)setModelHyperparameters:(id)a3
{
  objc_storeStrong((id *)&self->_modelHyperparameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelHyperparameters, 0);
  objc_storeStrong((id *)&self->_modelCreationDate, 0);
  objc_storeStrong((id *)&self->_dataUsedToPersonalizeModel, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelInformation writeTo:]", "ODCurareReportFillerModelInformation.m", 151, "nil != self->_modelName");
}

@end
