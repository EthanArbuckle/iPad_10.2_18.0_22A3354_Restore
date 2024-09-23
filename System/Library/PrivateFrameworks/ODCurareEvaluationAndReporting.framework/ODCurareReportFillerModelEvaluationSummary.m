@implementation ODCurareReportFillerModelEvaluationSummary

- (void)clearModelEvaluationResults
{
  -[NSMutableArray removeAllObjects](self->_modelEvaluationResults, "removeAllObjects");
}

- (void)addModelEvaluationResults:(id)a3
{
  id v4;
  NSMutableArray *modelEvaluationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  modelEvaluationResults = self->_modelEvaluationResults;
  v8 = v4;
  if (!modelEvaluationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_modelEvaluationResults;
    self->_modelEvaluationResults = v6;

    v4 = v8;
    modelEvaluationResults = self->_modelEvaluationResults;
  }
  -[NSMutableArray addObject:](modelEvaluationResults, "addObject:", v4);

}

- (unint64_t)modelEvaluationResultsCount
{
  return -[NSMutableArray count](self->_modelEvaluationResults, "count");
}

- (id)modelEvaluationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_modelEvaluationResults, "objectAtIndex:", a3);
}

+ (Class)modelEvaluationResultsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDataUsedToEvaluateModel
{
  return self->_dataUsedToEvaluateModel != 0;
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
  v8.super_class = (Class)ODCurareReportFillerModelEvaluationSummary;
  -[ODCurareReportFillerModelEvaluationSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerModelEvaluationSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *evaluationDate;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ODCurareReportFillerDataSet *dataUsedToEvaluateModel;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  modelName = self->_modelName;
  if (modelName)
    objc_msgSend(v3, "setObject:forKey:", modelName, CFSTR("modelName"));
  evaluationDate = self->_evaluationDate;
  if (evaluationDate)
    objc_msgSend(v4, "setObject:forKey:", evaluationDate, CFSTR("evaluationDate"));
  if (-[NSMutableArray count](self->_modelEvaluationResults, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_modelEvaluationResults, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_modelEvaluationResults;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("modelEvaluationResults"));
  }
  dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
  if (dataUsedToEvaluateModel)
  {
    -[ODCurareReportFillerDataSet dictionaryRepresentation](dataUsedToEvaluateModel, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("dataUsedToEvaluateModel"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelEvaluationSummaryReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_modelName)
    -[ODCurareReportFillerModelEvaluationSummary writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_evaluationDate)
    -[ODCurareReportFillerModelEvaluationSummary writeTo:].cold.2();
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_modelEvaluationResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_dataUsedToEvaluateModel)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setModelName:", self->_modelName);
  objc_msgSend(v8, "setEvaluationDate:", self->_evaluationDate);
  if (-[ODCurareReportFillerModelEvaluationSummary modelEvaluationResultsCount](self, "modelEvaluationResultsCount"))
  {
    objc_msgSend(v8, "clearModelEvaluationResults");
    v4 = -[ODCurareReportFillerModelEvaluationSummary modelEvaluationResultsCount](self, "modelEvaluationResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ODCurareReportFillerModelEvaluationSummary modelEvaluationResultsAtIndex:](self, "modelEvaluationResultsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addModelEvaluationResults:", v7);

      }
    }
  }
  if (self->_dataUsedToEvaluateModel)
    objc_msgSend(v8, "setDataUsedToEvaluateModel:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_evaluationDate, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_modelEvaluationResults;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addModelEvaluationResults:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[ODCurareReportFillerDataSet copyWithZone:](self->_dataUsedToEvaluateModel, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *modelName;
  NSString *evaluationDate;
  NSMutableArray *modelEvaluationResults;
  ODCurareReportFillerDataSet *dataUsedToEvaluateModel;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((modelName = self->_modelName, !((unint64_t)modelName | v4[4]))
     || -[NSString isEqual:](modelName, "isEqual:"))
    && ((evaluationDate = self->_evaluationDate, !((unint64_t)evaluationDate | v4[2]))
     || -[NSString isEqual:](evaluationDate, "isEqual:"))
    && ((modelEvaluationResults = self->_modelEvaluationResults, !((unint64_t)modelEvaluationResults | v4[3]))
     || -[NSMutableArray isEqual:](modelEvaluationResults, "isEqual:")))
  {
    dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
    if ((unint64_t)dataUsedToEvaluateModel | v4[1])
      v9 = -[ODCurareReportFillerDataSet isEqual:](dataUsedToEvaluateModel, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_modelName, "hash");
  v4 = -[NSString hash](self->_evaluationDate, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_modelEvaluationResults, "hash");
  return v4 ^ v5 ^ -[ODCurareReportFillerDataSet hash](self->_dataUsedToEvaluateModel, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ODCurareReportFillerDataSet *dataUsedToEvaluateModel;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[ODCurareReportFillerModelEvaluationSummary setModelName:](self, "setModelName:");
  if (*((_QWORD *)v4 + 2))
    -[ODCurareReportFillerModelEvaluationSummary setEvaluationDate:](self, "setEvaluationDate:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[ODCurareReportFillerModelEvaluationSummary addModelEvaluationResults:](self, "addModelEvaluationResults:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
  v11 = *((_QWORD *)v4 + 1);
  if (dataUsedToEvaluateModel)
  {
    if (v11)
      -[ODCurareReportFillerDataSet mergeFrom:](dataUsedToEvaluateModel, "mergeFrom:");
  }
  else if (v11)
  {
    -[ODCurareReportFillerModelEvaluationSummary setDataUsedToEvaluateModel:](self, "setDataUsedToEvaluateModel:");
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

- (NSString)evaluationDate
{
  return self->_evaluationDate;
}

- (void)setEvaluationDate:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationDate, a3);
}

- (NSMutableArray)modelEvaluationResults
{
  return self->_modelEvaluationResults;
}

- (void)setModelEvaluationResults:(id)a3
{
  objc_storeStrong((id *)&self->_modelEvaluationResults, a3);
}

- (ODCurareReportFillerDataSet)dataUsedToEvaluateModel
{
  return self->_dataUsedToEvaluateModel;
}

- (void)setDataUsedToEvaluateModel:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsedToEvaluateModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelEvaluationResults, 0);
  objc_storeStrong((id *)&self->_evaluationDate, 0);
  objc_storeStrong((id *)&self->_dataUsedToEvaluateModel, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluationSummary writeTo:]", "ODCurareReportFillerModelEvaluationSummary.m", 165, "nil != self->_modelName");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluationSummary writeTo:]", "ODCurareReportFillerModelEvaluationSummary.m", 170, "nil != self->_evaluationDate");
}

@end
