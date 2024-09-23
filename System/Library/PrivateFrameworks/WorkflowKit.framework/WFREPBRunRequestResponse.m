@implementation WFREPBRunRequestResponse

- (void)clearVariablesDatas
{
  -[NSMutableArray removeAllObjects](self->_variablesDatas, "removeAllObjects");
}

- (void)addVariablesData:(id)a3
{
  id v4;
  NSMutableArray *variablesDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  variablesDatas = self->_variablesDatas;
  v8 = v4;
  if (!variablesDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_variablesDatas;
    self->_variablesDatas = v6;

    v4 = v8;
    variablesDatas = self->_variablesDatas;
  }
  -[NSMutableArray addObject:](variablesDatas, "addObject:", v4);

}

- (unint64_t)variablesDatasCount
{
  return -[NSMutableArray count](self->_variablesDatas, "count");
}

- (id)variablesDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_variablesDatas, "objectAtIndex:", a3);
}

- (void)clearOutputDatas
{
  -[NSMutableArray removeAllObjects](self->_outputDatas, "removeAllObjects");
}

- (void)addOutputData:(id)a3
{
  id v4;
  NSMutableArray *outputDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDatas = self->_outputDatas;
  v8 = v4;
  if (!outputDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDatas;
    self->_outputDatas = v6;

    v4 = v8;
    outputDatas = self->_outputDatas;
  }
  -[NSMutableArray addObject:](outputDatas, "addObject:", v4);

}

- (unint64_t)outputDatasCount
{
  return -[NSMutableArray count](self->_outputDatas, "count");
}

- (id)outputDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDatas, "objectAtIndex:", a3);
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)WFREPBRunRequestResponse;
  -[WFREPBRunRequestResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRunRequestResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *runRequestIdentifier;
  NSMutableArray *variablesDatas;
  NSMutableArray *outputDatas;
  NSData *errorData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", runRequestIdentifier, CFSTR("runRequestIdentifier"));
  variablesDatas = self->_variablesDatas;
  if (variablesDatas)
    objc_msgSend(v4, "setObject:forKey:", variablesDatas, CFSTR("variablesData"));
  outputDatas = self->_outputDatas;
  if (outputDatas)
    objc_msgSend(v4, "setObject:forKey:", outputDatas, CFSTR("outputData"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestResponseReadFrom((char *)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_runRequestIdentifier)
    __assert_rtn("-[WFREPBRunRequestResponse writeTo:]", "WFREPBRunRequestResponse.m", 163, "nil != self->_runRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_variablesDatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_outputDatas;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (self->_errorData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setRunRequestIdentifier:", self->_runRequestIdentifier);
  if (-[WFREPBRunRequestResponse variablesDatasCount](self, "variablesDatasCount"))
  {
    objc_msgSend(v12, "clearVariablesDatas");
    v4 = -[WFREPBRunRequestResponse variablesDatasCount](self, "variablesDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WFREPBRunRequestResponse variablesDataAtIndex:](self, "variablesDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addVariablesData:", v7);

      }
    }
  }
  if (-[WFREPBRunRequestResponse outputDatasCount](self, "outputDatasCount"))
  {
    objc_msgSend(v12, "clearOutputDatas");
    v8 = -[WFREPBRunRequestResponse outputDatasCount](self, "outputDatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WFREPBRunRequestResponse outputDataAtIndex:](self, "outputDataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addOutputData:", v11);

      }
    }
  }
  if (self->_errorData)
    objc_msgSend(v12, "setErrorData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_runRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_variablesDatas;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addVariablesData:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_outputDatas;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addOutputData:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  v20 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v21 = (void *)v5[1];
  v5[1] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *runRequestIdentifier;
  NSMutableArray *variablesDatas;
  NSMutableArray *outputDatas;
  NSData *errorData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((runRequestIdentifier = self->_runRequestIdentifier, !((unint64_t)runRequestIdentifier | v4[3]))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:"))
    && ((variablesDatas = self->_variablesDatas, !((unint64_t)variablesDatas | v4[4]))
     || -[NSMutableArray isEqual:](variablesDatas, "isEqual:"))
    && ((outputDatas = self->_outputDatas, !((unint64_t)outputDatas | v4[2]))
     || -[NSMutableArray isEqual:](outputDatas, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1])
      v9 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_runRequestIdentifier, "hash");
  v4 = -[NSMutableArray hash](self->_variablesDatas, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_outputDatas, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_errorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[WFREPBRunRequestResponse setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[WFREPBRunRequestResponse addVariablesData:](self, "addVariablesData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[WFREPBRunRequestResponse addOutputData:](self, "addOutputData:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 1))
    -[WFREPBRunRequestResponse setErrorData:](self, "setErrorData:");

}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)setRunRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, a3);
}

- (NSMutableArray)variablesDatas
{
  return self->_variablesDatas;
}

- (void)setVariablesDatas:(id)a3
{
  objc_storeStrong((id *)&self->_variablesDatas, a3);
}

- (NSMutableArray)outputDatas
{
  return self->_outputDatas;
}

- (void)setOutputDatas:(id)a3
{
  objc_storeStrong((id *)&self->_outputDatas, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variablesDatas, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

+ (Class)variablesDataType
{
  return (Class)objc_opt_class();
}

+ (Class)outputDataType
{
  return (Class)objc_opt_class();
}

@end
