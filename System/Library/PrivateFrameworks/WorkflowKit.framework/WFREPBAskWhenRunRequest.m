@implementation WFREPBAskWhenRunRequest

- (void)clearParameterKeys
{
  -[NSMutableArray removeAllObjects](self->_parameterKeys, "removeAllObjects");
}

- (void)addParameterKeys:(id)a3
{
  id v4;
  NSMutableArray *parameterKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameterKeys = self->_parameterKeys;
  v8 = v4;
  if (!parameterKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parameterKeys;
    self->_parameterKeys = v6;

    v4 = v8;
    parameterKeys = self->_parameterKeys;
  }
  -[NSMutableArray addObject:](parameterKeys, "addObject:", v4);

}

- (unint64_t)parameterKeysCount
{
  return -[NSMutableArray count](self->_parameterKeys, "count");
}

- (id)parameterKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parameterKeys, "objectAtIndex:", a3);
}

- (void)clearParameterKeysAndStates
{
  -[NSMutableArray removeAllObjects](self->_parameterKeysAndStates, "removeAllObjects");
}

- (void)addParameterKeysAndStates:(id)a3
{
  id v4;
  NSMutableArray *parameterKeysAndStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameterKeysAndStates = self->_parameterKeysAndStates;
  v8 = v4;
  if (!parameterKeysAndStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parameterKeysAndStates;
    self->_parameterKeysAndStates = v6;

    v4 = v8;
    parameterKeysAndStates = self->_parameterKeysAndStates;
  }
  -[NSMutableArray addObject:](parameterKeysAndStates, "addObject:", v4);

}

- (unint64_t)parameterKeysAndStatesCount
{
  return -[NSMutableArray count](self->_parameterKeysAndStates, "count");
}

- (id)parameterKeysAndStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parameterKeysAndStates, "objectAtIndex:", a3);
}

- (BOOL)hasActionSerializedParameters
{
  return self->_actionSerializedParameters != 0;
}

- (void)clearPossibleStates
{
  -[NSMutableArray removeAllObjects](self->_possibleStates, "removeAllObjects");
}

- (void)addPossibleStates:(id)a3
{
  id v4;
  NSMutableArray *possibleStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  possibleStates = self->_possibleStates;
  v8 = v4;
  if (!possibleStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    v4 = v8;
    possibleStates = self->_possibleStates;
  }
  -[NSMutableArray addObject:](possibleStates, "addObject:", v4);

}

- (unint64_t)possibleStatesCount
{
  return -[NSMutableArray count](self->_possibleStates, "count");
}

- (id)possibleStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_possibleStates, "objectAtIndex:", a3);
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
  v8.super_class = (Class)WFREPBAskWhenRunRequest;
  -[WFREPBAskWhenRunRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAskWhenRunRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *associatedRunRequestIdentifier;
  NSMutableArray *parameterKeys;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *actionIdentifier;
  NSData *actionSerializedParameters;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  if (associatedRunRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", associatedRunRequestIdentifier, CFSTR("associatedRunRequestIdentifier"));
  parameterKeys = self->_parameterKeys;
  if (parameterKeys)
    objc_msgSend(v4, "setObject:forKey:", parameterKeys, CFSTR("parameterKeys"));
  if (-[NSMutableArray count](self->_parameterKeysAndStates, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_parameterKeysAndStates, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = self->_parameterKeysAndStates;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("parameterKeysAndStates"));
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  actionSerializedParameters = self->_actionSerializedParameters;
  if (actionSerializedParameters)
    objc_msgSend(v4, "setObject:forKey:", actionSerializedParameters, CFSTR("actionSerializedParameters"));
  if (-[NSMutableArray count](self->_possibleStates, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_possibleStates, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_possibleStates;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("possibleStates"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAskWhenRunRequestReadFrom((char *)self, (uint64_t)a3);
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_associatedRunRequestIdentifier)
    __assert_rtn("-[WFREPBAskWhenRunRequest writeTo:]", "WFREPBAskWhenRunRequest.m", 243, "nil != self->_associatedRunRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_parameterKeys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_parameterKeysAndStates;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  if (!self->_actionIdentifier)
    __assert_rtn("-[WFREPBAskWhenRunRequest writeTo:]", "WFREPBAskWhenRunRequest.m", 262, "nil != self->_actionIdentifier");
  PBDataWriterWriteStringField();
  if (self->_actionSerializedParameters)
    PBDataWriterWriteDataField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_possibleStates;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "setAssociatedRunRequestIdentifier:", self->_associatedRunRequestIdentifier);
  if (-[WFREPBAskWhenRunRequest parameterKeysCount](self, "parameterKeysCount"))
  {
    objc_msgSend(v16, "clearParameterKeys");
    v4 = -[WFREPBAskWhenRunRequest parameterKeysCount](self, "parameterKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WFREPBAskWhenRunRequest parameterKeysAtIndex:](self, "parameterKeysAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addParameterKeys:", v7);

      }
    }
  }
  if (-[WFREPBAskWhenRunRequest parameterKeysAndStatesCount](self, "parameterKeysAndStatesCount"))
  {
    objc_msgSend(v16, "clearParameterKeysAndStates");
    v8 = -[WFREPBAskWhenRunRequest parameterKeysAndStatesCount](self, "parameterKeysAndStatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WFREPBAskWhenRunRequest parameterKeysAndStatesAtIndex:](self, "parameterKeysAndStatesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addParameterKeysAndStates:", v11);

      }
    }
  }
  objc_msgSend(v16, "setActionIdentifier:", self->_actionIdentifier);
  if (self->_actionSerializedParameters)
    objc_msgSend(v16, "setActionSerializedParameters:");
  if (-[WFREPBAskWhenRunRequest possibleStatesCount](self, "possibleStatesCount"))
  {
    objc_msgSend(v16, "clearPossibleStates");
    v12 = -[WFREPBAskWhenRunRequest possibleStatesCount](self, "possibleStatesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[WFREPBAskWhenRunRequest possibleStatesAtIndex:](self, "possibleStatesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addPossibleStates:", v15);

      }
    }
  }

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
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_associatedRunRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = self->_parameterKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addParameterKeys:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v10);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = self->_parameterKeysAndStates;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend(v5, "addParameterKeysAndStates:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v21 = (void *)v5[1];
  v5[1] = v20;

  v22 = -[NSData copyWithZone:](self->_actionSerializedParameters, "copyWithZone:", a3);
  v23 = (void *)v5[2];
  v5[2] = v22;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_possibleStates;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addPossibleStates:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v26);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *associatedRunRequestIdentifier;
  NSMutableArray *parameterKeys;
  NSMutableArray *parameterKeysAndStates;
  NSString *actionIdentifier;
  NSData *actionSerializedParameters;
  NSMutableArray *possibleStates;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier,
         !((unint64_t)associatedRunRequestIdentifier | v4[3]))
     || -[NSString isEqual:](associatedRunRequestIdentifier, "isEqual:"))
    && ((parameterKeys = self->_parameterKeys, !((unint64_t)parameterKeys | v4[4]))
     || -[NSMutableArray isEqual:](parameterKeys, "isEqual:"))
    && ((parameterKeysAndStates = self->_parameterKeysAndStates, !((unint64_t)parameterKeysAndStates | v4[5]))
     || -[NSMutableArray isEqual:](parameterKeysAndStates, "isEqual:"))
    && ((actionIdentifier = self->_actionIdentifier, !((unint64_t)actionIdentifier | v4[1]))
     || -[NSString isEqual:](actionIdentifier, "isEqual:"))
    && ((actionSerializedParameters = self->_actionSerializedParameters,
         !((unint64_t)actionSerializedParameters | v4[2]))
     || -[NSData isEqual:](actionSerializedParameters, "isEqual:")))
  {
    possibleStates = self->_possibleStates;
    if ((unint64_t)possibleStates | v4[6])
      v11 = -[NSMutableArray isEqual:](possibleStates, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_associatedRunRequestIdentifier, "hash");
  v4 = -[NSMutableArray hash](self->_parameterKeys, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_parameterKeysAndStates, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_actionIdentifier, "hash");
  v7 = -[NSData hash](self->_actionSerializedParameters, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_possibleStates, "hash");
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[WFREPBAskWhenRunRequest setAssociatedRunRequestIdentifier:](self, "setAssociatedRunRequestIdentifier:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[WFREPBAskWhenRunRequest addParameterKeys:](self, "addParameterKeys:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[WFREPBAskWhenRunRequest addParameterKeysAndStates:](self, "addParameterKeysAndStates:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 1))
    -[WFREPBAskWhenRunRequest setActionIdentifier:](self, "setActionIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[WFREPBAskWhenRunRequest setActionSerializedParameters:](self, "setActionSerializedParameters:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 6);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[WFREPBAskWhenRunRequest addPossibleStates:](self, "addPossibleStates:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (void)setAssociatedRunRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, a3);
}

- (NSMutableArray)parameterKeys
{
  return self->_parameterKeys;
}

- (void)setParameterKeys:(id)a3
{
  objc_storeStrong((id *)&self->_parameterKeys, a3);
}

- (NSMutableArray)parameterKeysAndStates
{
  return self->_parameterKeysAndStates;
}

- (void)setParameterKeysAndStates:(id)a3
{
  objc_storeStrong((id *)&self->_parameterKeysAndStates, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSData)actionSerializedParameters
{
  return self->_actionSerializedParameters;
}

- (void)setActionSerializedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_actionSerializedParameters, a3);
}

- (NSMutableArray)possibleStates
{
  return self->_possibleStates;
}

- (void)setPossibleStates:(id)a3
{
  objc_storeStrong((id *)&self->_possibleStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStates, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSerializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (Class)parameterKeysType
{
  return (Class)objc_opt_class();
}

+ (Class)parameterKeysAndStatesType
{
  return (Class)objc_opt_class();
}

+ (Class)possibleStatesType
{
  return (Class)objc_opt_class();
}

@end
