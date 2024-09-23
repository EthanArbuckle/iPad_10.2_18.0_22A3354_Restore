@implementation LCServiceLoggingConfiguration

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LCServiceLoggingConfiguration;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LCServiceLoggingConfiguration deleteDefaultParameters](self, "deleteDefaultParameters");
  -[LCServiceLoggingConfiguration applications](self, "applications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCServiceLoggingConfiguration setApplications:](self, "setApplications:", v10);

  return v5;
}

- (BOOL)hasDefaultParameters
{
  return self->_defaultParameters != 0;
}

- (void)deleteDefaultParameters
{
  -[LCServiceLoggingConfiguration setDefaultParameters:](self, "setDefaultParameters:", 0);
}

- (void)setConfigurationVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_configurationVersion = a3;
}

- (BOOL)hasConfigurationVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfigurationVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConfigurationVersion
{
  -[LCServiceLoggingConfiguration setConfigurationVersion:](self, "setConfigurationVersion:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearApplications
{
  -[NSArray removeAllObjects](self->_applications, "removeAllObjects");
}

- (void)addApplications:(id)a3
{
  id v4;
  NSArray *applications;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  applications = self->_applications;
  v8 = v4;
  if (!applications)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_applications;
    self->_applications = v6;

    v4 = v8;
    applications = self->_applications;
  }
  -[NSArray addObject:](applications, "addObject:", v4);

}

- (unint64_t)applicationsCount
{
  return -[NSArray count](self->_applications, "count");
}

- (id)applicationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_applications, "objectAtIndexedSubscript:", a3);
}

- (void)clearBlacklistedBundleIdentifiers
{
  -[NSArray removeAllObjects](self->_blacklistedBundleIdentifiers, "removeAllObjects");
}

- (void)addBlacklistedBundleIdentifiers:(id)a3
{
  id v4;
  NSArray *blacklistedBundleIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  blacklistedBundleIdentifiers = self->_blacklistedBundleIdentifiers;
  v8 = v4;
  if (!blacklistedBundleIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_blacklistedBundleIdentifiers;
    self->_blacklistedBundleIdentifiers = v6;

    v4 = v8;
    blacklistedBundleIdentifiers = self->_blacklistedBundleIdentifiers;
  }
  -[NSArray addObject:](blacklistedBundleIdentifiers, "addObject:", v4);

}

- (unint64_t)blacklistedBundleIdentifiersCount
{
  return -[NSArray count](self->_blacklistedBundleIdentifiers, "count");
}

- (id)blacklistedBundleIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_blacklistedBundleIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)clearDenyListedCategories
{
  -[NSArray removeAllObjects](self->_denyListedCategories, "removeAllObjects");
}

- (void)addDenyListedCategories:(int)a3
{
  uint64_t v3;
  NSArray *denyListedCategories;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  denyListedCategories = self->_denyListedCategories;
  if (!denyListedCategories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_denyListedCategories;
    self->_denyListedCategories = v6;

    denyListedCategories = self->_denyListedCategories;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](denyListedCategories, "addObject:", v8);

}

- (unint64_t)denyListedCategoriesCount
{
  return -[NSArray count](self->_denyListedCategories, "count");
}

- (int)denyListedCategoriesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_denyListedCategories, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceLoggingConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_applications;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_blacklistedBundleIdentifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_denyListedCategories;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21), "intValue", (_QWORD)v22);
        PBDataWriterWriteInt32Field();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int configurationVersion;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    configurationVersion = self->_configurationVersion;
    if (configurationVersion != objc_msgSend(v4, "configurationVersion"))
      goto LABEL_25;
  }
  -[LCServiceLoggingConfiguration applications](self, "applications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[LCServiceLoggingConfiguration applications](self, "applications");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[LCServiceLoggingConfiguration applications](self, "applications");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_25;
  }
  else
  {

  }
  -[LCServiceLoggingConfiguration blacklistedBundleIdentifiers](self, "blacklistedBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blacklistedBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[LCServiceLoggingConfiguration blacklistedBundleIdentifiers](self, "blacklistedBundleIdentifiers");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[LCServiceLoggingConfiguration blacklistedBundleIdentifiers](self, "blacklistedBundleIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blacklistedBundleIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[LCServiceLoggingConfiguration denyListedCategories](self, "denyListedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "denyListedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[LCServiceLoggingConfiguration denyListedCategories](self, "denyListedCategories");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[LCServiceLoggingConfiguration denyListedCategories](self, "denyListedCategories");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denyListedCategories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[LCServiceLoggingParameters hash](self->_defaultParameters, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_configurationVersion;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSArray hash](self->_applications, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_blacklistedBundleIdentifiers, "hash");
  return v7 ^ -[NSArray hash](self->_denyListedCategories, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_applications, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_applications;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applications"));
  }
  if (self->_blacklistedBundleIdentifiers)
  {
    -[LCServiceLoggingConfiguration blacklistedBundleIdentifiers](self, "blacklistedBundleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("blacklistedBundleIdentifiers"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[LCServiceLoggingConfiguration configurationVersion](self, "configurationVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("configurationVersion"));

  }
  if (self->_defaultParameters)
  {
    -[LCServiceLoggingConfiguration defaultParameters](self, "defaultParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("defaultParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("defaultParameters"));

    }
  }
  if (-[NSArray count](self->_denyListedCategories, "count", (_QWORD)v21))
  {
    -[LCServiceLoggingConfiguration denyListedCategories](self, "denyListedCategories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("denyListedCategories"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LCServiceLoggingConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LCServiceLoggingConfiguration)initWithJSON:(id)a3
{
  void *v4;
  LCServiceLoggingConfiguration *v5;
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
    self = -[LCServiceLoggingConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LCServiceLoggingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  LCServiceLoggingConfiguration *v5;
  void *v6;
  LCServiceLoggingParameters *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  LCServiceApplicationConfiguration *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  LCServiceLoggingConfiguration *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)LCServiceLoggingConfiguration;
  v5 = -[LCServiceLoggingConfiguration init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultParameters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LCServiceLoggingParameters initWithDictionary:]([LCServiceLoggingParameters alloc], "initWithDictionary:", v6);
      -[LCServiceLoggingConfiguration setDefaultParameters:](v5, "setDefaultParameters:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configurationVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LCServiceLoggingConfiguration setConfigurationVersion:](v5, "setConfigurationVersion:", objc_msgSend(v8, "intValue"));
    v34 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applications"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[LCServiceApplicationConfiguration initWithDictionary:]([LCServiceApplicationConfiguration alloc], "initWithDictionary:", v15);
              -[LCServiceLoggingConfiguration addApplications:](v5, "addApplications:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v12);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blacklistedBundleIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v41 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v23, "copy");
              -[LCServiceLoggingConfiguration addBlacklistedBundleIdentifiers:](v5, "addBlacklistedBundleIdentifiers:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v20);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("denyListedCategories"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v37;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v37 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[LCServiceLoggingConfiguration addDenyListedCategories:](v5, "addDenyListedCategories:", objc_msgSend(v31, "intValue"));
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        }
        while (v28);
      }

    }
    v32 = v5;

  }
  return v5;
}

- (LCServiceLoggingParameters)defaultParameters
{
  return self->_defaultParameters;
}

- (void)setDefaultParameters:(id)a3
{
  objc_storeStrong((id *)&self->_defaultParameters, a3);
}

- (int)configurationVersion
{
  return self->_configurationVersion;
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)blacklistedBundleIdentifiers
{
  return self->_blacklistedBundleIdentifiers;
}

- (void)setBlacklistedBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)denyListedCategories
{
  return self->_denyListedCategories;
}

- (void)setDenyListedCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasDefaultParameters:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyListedCategories, 0);
  objc_storeStrong((id *)&self->_blacklistedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_defaultParameters, 0);
}

@end
