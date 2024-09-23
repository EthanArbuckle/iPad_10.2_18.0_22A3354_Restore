@implementation _SFPBResponseWrapperCardSection

- (_SFPBResponseWrapperCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBResponseWrapperCardSection *v5;
  void *v6;
  _SFPBCATModel *v7;
  void *v8;
  _SFPBCATModel *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBPatternModel *v13;
  void *v14;
  _SFPBPatternModel *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _SFPBPatternModel *v23;
  _SFPBResponseWrapperCardSection *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBResponseWrapperCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "catModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCATModel alloc];
      objc_msgSend(v4, "catModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCATModel initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBResponseWrapperCardSection setCatModel:](v5, "setCatModel:", v9);

    }
    objc_msgSend(v4, "visualCATOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "visualCATOutput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBResponseWrapperCardSection setVisualCATOutput:](v5, "setVisualCATOutput:", v11);

    }
    objc_msgSend(v4, "pattern_model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBPatternModel alloc];
      objc_msgSend(v4, "pattern_model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBPatternModel initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBResponseWrapperCardSection setPattern_model:](v5, "setPattern_model:", v15);

    }
    objc_msgSend(v4, "pattern_models");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "pattern_models", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[_SFPBPatternModel initWithFacade:]([_SFPBPatternModel alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[_SFPBResponseWrapperCardSection setPattern_models:](v5, "setPattern_models:", v17);
    v24 = v5;

  }
  return v5;
}

- (void)setCatModel:(id)a3
{
  objc_storeStrong((id *)&self->_catModel, a3);
}

- (void)setVisualCATOutput:(id)a3
{
  NSData *v4;
  NSData *visualCATOutput;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  visualCATOutput = self->_visualCATOutput;
  self->_visualCATOutput = v4;

}

- (void)setPattern_model:(id)a3
{
  objc_storeStrong((id *)&self->_pattern_model, a3);
}

- (void)setPattern_models:(id)a3
{
  NSArray *v4;
  NSArray *pattern_models;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  pattern_models = self->_pattern_models;
  self->_pattern_models = v4;

}

- (void)clearPattern_models
{
  -[NSArray removeAllObjects](self->_pattern_models, "removeAllObjects");
}

- (void)addPattern_models:(id)a3
{
  id v4;
  NSArray *pattern_models;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pattern_models = self->_pattern_models;
  v8 = v4;
  if (!pattern_models)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pattern_models;
    self->_pattern_models = v6;

    v4 = v8;
    pattern_models = self->_pattern_models;
  }
  -[NSArray addObject:](pattern_models, "addObject:", v4);

}

- (unint64_t)pattern_modelsCount
{
  return -[NSArray count](self->_pattern_models, "count");
}

- (id)pattern_modelsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pattern_models, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBResponseWrapperCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBResponseWrapperCardSection catModel](self, "catModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteDataField();

  -[_SFPBResponseWrapperCardSection pattern_model](self, "pattern_model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBResponseWrapperCardSection pattern_models](self, "pattern_models");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBResponseWrapperCardSection catModel](self, "catModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBResponseWrapperCardSection catModel](self, "catModel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBResponseWrapperCardSection catModel](self, "catModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualCATOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualCATOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBResponseWrapperCardSection pattern_model](self, "pattern_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBResponseWrapperCardSection pattern_model](self, "pattern_model");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBResponseWrapperCardSection pattern_model](self, "pattern_model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBResponseWrapperCardSection pattern_models](self, "pattern_models");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_models");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBResponseWrapperCardSection pattern_models](self, "pattern_models");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBResponseWrapperCardSection pattern_models](self, "pattern_models");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_models");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[_SFPBCATModel hash](self->_catModel, "hash");
  v4 = -[NSData hash](self->_visualCATOutput, "hash") ^ v3;
  v5 = -[_SFPBPatternModel hash](self->_pattern_model, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_pattern_models, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_catModel)
  {
    -[_SFPBResponseWrapperCardSection catModel](self, "catModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("catModel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("catModel"));

    }
  }
  if (self->_pattern_model)
  {
    -[_SFPBResponseWrapperCardSection pattern_model](self, "pattern_model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("patternModel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("patternModel"));

    }
  }
  if (-[NSArray count](self->_pattern_models, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = self->_pattern_models;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("patternModels"));
  }
  if (self->_visualCATOutput)
  {
    -[_SFPBResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("visualCATOutput"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("visualCATOutput"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBResponseWrapperCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBResponseWrapperCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBResponseWrapperCardSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBResponseWrapperCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBResponseWrapperCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBResponseWrapperCardSection *v5;
  void *v6;
  _SFPBCATModel *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBPatternModel *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _SFPBPatternModel *v19;
  _SFPBResponseWrapperCardSection *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_SFPBResponseWrapperCardSection;
  v5 = -[_SFPBResponseWrapperCardSection init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCATModel initWithDictionary:]([_SFPBCATModel alloc], "initWithDictionary:", v6);
      -[_SFPBResponseWrapperCardSection setCatModel:](v5, "setCatModel:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visualCATOutput"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      -[_SFPBResponseWrapperCardSection setVisualCATOutput:](v5, "setVisualCATOutput:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBPatternModel initWithDictionary:]([_SFPBPatternModel alloc], "initWithDictionary:", v10);
      -[_SFPBResponseWrapperCardSection setPattern_model:](v5, "setPattern_model:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternModels"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v10;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBPatternModel initWithDictionary:]([_SFPBPatternModel alloc], "initWithDictionary:", v18);
              -[_SFPBResponseWrapperCardSection addPattern_models:](v5, "addPattern_models:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    v20 = v5;

  }
  return v5;
}

- (_SFPBCATModel)catModel
{
  return self->_catModel;
}

- (NSData)visualCATOutput
{
  return self->_visualCATOutput;
}

- (_SFPBPatternModel)pattern_model
{
  return self->_pattern_model;
}

- (NSArray)pattern_models
{
  return self->_pattern_models;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_models, 0);
  objc_storeStrong((id *)&self->_pattern_model, 0);
  objc_storeStrong((id *)&self->_visualCATOutput, 0);
  objc_storeStrong((id *)&self->_catModel, 0);
}

@end
