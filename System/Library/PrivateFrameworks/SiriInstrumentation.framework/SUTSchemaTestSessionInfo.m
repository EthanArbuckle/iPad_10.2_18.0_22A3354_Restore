@implementation SUTSchemaTestSessionInfo

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUTSchemaTestSessionInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTSchemaTestSessionInfo testSessionInfoItems](self, "testSessionInfoItems", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUTSchemaTestSessionInfo setTestSessionInfoItems:](self, "setTestSessionInfoItems:", v7);
  return v5;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[SUTSchemaTestSessionInfo setSystemBuild:](self, "setSystemBuild:", 0);
}

- (BOOL)hasCpuArchitecture
{
  return self->_cpuArchitecture != 0;
}

- (void)deleteCpuArchitecture
{
  -[SUTSchemaTestSessionInfo setCpuArchitecture:](self, "setCpuArchitecture:", 0);
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (void)deleteHardwareModel
{
  -[SUTSchemaTestSessionInfo setHardwareModel:](self, "setHardwareModel:", 0);
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteModelNumber
{
  -[SUTSchemaTestSessionInfo setModelNumber:](self, "setModelNumber:", 0);
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)deleteProductType
{
  -[SUTSchemaTestSessionInfo setProductType:](self, "setProductType:", 0);
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (void)deleteProductVersion
{
  -[SUTSchemaTestSessionInfo setProductVersion:](self, "setProductVersion:", 0);
}

- (void)setIsSimulator:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSimulator = a3;
}

- (BOOL)hasIsSimulator
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSimulator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSimulator
{
  -[SUTSchemaTestSessionInfo setIsSimulator:](self, "setIsSimulator:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteBundleId
{
  -[SUTSchemaTestSessionInfo setBundleId:](self, "setBundleId:", 0);
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)deleteDeviceName
{
  -[SUTSchemaTestSessionInfo setDeviceName:](self, "setDeviceName:", 0);
}

- (void)clearTestSessionInfoItem
{
  -[NSArray removeAllObjects](self->_testSessionInfoItems, "removeAllObjects");
}

- (void)addTestSessionInfoItem:(id)a3
{
  id v4;
  NSArray *testSessionInfoItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  testSessionInfoItems = self->_testSessionInfoItems;
  v8 = v4;
  if (!testSessionInfoItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_testSessionInfoItems;
    self->_testSessionInfoItems = v6;

    v4 = v8;
    testSessionInfoItems = self->_testSessionInfoItems;
  }
  -[NSArray addObject:](testSessionInfoItems, "addObject:", v4);

}

- (unint64_t)testSessionInfoItemCount
{
  return -[NSArray count](self->_testSessionInfoItems, "count");
}

- (id)testSessionInfoItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_testSessionInfoItems, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestSessionInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUTSchemaTestSessionInfo systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo cpuArchitecture](self, "cpuArchitecture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo hardwareModel](self, "hardwareModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo modelNumber](self, "modelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo productType](self, "productType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo productVersion](self, "productVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[SUTSchemaTestSessionInfo bundleId](self, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[SUTSchemaTestSessionInfo deviceName](self, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_testSessionInfoItems;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
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
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int isSimulator;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[SUTSchemaTestSessionInfo systemBuild](self, "systemBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo systemBuild](self, "systemBuild");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUTSchemaTestSessionInfo systemBuild](self, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo cpuArchitecture](self, "cpuArchitecture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cpuArchitecture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo cpuArchitecture](self, "cpuArchitecture");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SUTSchemaTestSessionInfo cpuArchitecture](self, "cpuArchitecture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cpuArchitecture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo hardwareModel](self, "hardwareModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo hardwareModel](self, "hardwareModel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SUTSchemaTestSessionInfo hardwareModel](self, "hardwareModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo modelNumber](self, "modelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo modelNumber](self, "modelNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SUTSchemaTestSessionInfo modelNumber](self, "modelNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo productType](self, "productType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo productType](self, "productType");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[SUTSchemaTestSessionInfo productType](self, "productType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo productVersion](self, "productVersion");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SUTSchemaTestSessionInfo productVersion](self, "productVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_50;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[88] & 1))
    goto LABEL_50;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isSimulator = self->_isSimulator;
    if (isSimulator != objc_msgSend(v4, "isSimulator"))
      goto LABEL_50;
  }
  -[SUTSchemaTestSessionInfo bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo bundleId](self, "bundleId");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[SUTSchemaTestSessionInfo bundleId](self, "bundleId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_49;
  -[SUTSchemaTestSessionInfo deviceName](self, "deviceName");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[SUTSchemaTestSessionInfo deviceName](self, "deviceName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_50;
  }
  else
  {

  }
  -[SUTSchemaTestSessionInfo testSessionInfoItems](self, "testSessionInfoItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testSessionInfoItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SUTSchemaTestSessionInfo testSessionInfoItems](self, "testSessionInfoItems");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_53:
      v53 = 1;
      goto LABEL_51;
    }
    v49 = (void *)v48;
    -[SUTSchemaTestSessionInfo testSessionInfoItems](self, "testSessionInfoItems");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "testSessionInfoItems");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_53;
  }
  else
  {
LABEL_49:

  }
LABEL_50:
  v53 = 0;
LABEL_51:

  return v53;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_systemBuild, "hash");
  v4 = -[NSString hash](self->_cpuArchitecture, "hash");
  v5 = -[NSString hash](self->_hardwareModel, "hash");
  v6 = -[NSString hash](self->_modelNumber, "hash");
  v7 = -[NSString hash](self->_productType, "hash");
  v8 = -[NSString hash](self->_productVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_isSimulator;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[NSString hash](self->_bundleId, "hash");
  v12 = v11 ^ -[NSString hash](self->_deviceName, "hash");
  return v10 ^ v12 ^ -[NSArray hash](self->_testSessionInfoItems, "hash");
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleId)
  {
    -[SUTSchemaTestSessionInfo bundleId](self, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleId"));

  }
  if (self->_cpuArchitecture)
  {
    -[SUTSchemaTestSessionInfo cpuArchitecture](self, "cpuArchitecture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cpuArchitecture"));

  }
  if (self->_deviceName)
  {
    -[SUTSchemaTestSessionInfo deviceName](self, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceName"));

  }
  if (self->_hardwareModel)
  {
    -[SUTSchemaTestSessionInfo hardwareModel](self, "hardwareModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hardwareModel"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUTSchemaTestSessionInfo isSimulator](self, "isSimulator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isSimulator"));

  }
  if (self->_modelNumber)
  {
    -[SUTSchemaTestSessionInfo modelNumber](self, "modelNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("modelNumber"));

  }
  if (self->_productType)
  {
    -[SUTSchemaTestSessionInfo productType](self, "productType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("productType"));

  }
  if (self->_productVersion)
  {
    -[SUTSchemaTestSessionInfo productVersion](self, "productVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("productVersion"));

  }
  if (self->_systemBuild)
  {
    -[SUTSchemaTestSessionInfo systemBuild](self, "systemBuild");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("systemBuild"));

  }
  if (-[NSArray count](self->_testSessionInfoItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = self->_testSessionInfoItems;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v21, "addObject:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("testSessionInfoItem"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v30);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUTSchemaTestSessionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUTSchemaTestSessionInfo)initWithJSON:(id)a3
{
  void *v4;
  SUTSchemaTestSessionInfo *v5;
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
    self = -[SUTSchemaTestSessionInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUTSchemaTestSessionInfo)initWithDictionary:(id)a3
{
  id v4;
  SUTSchemaTestSessionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  SUTSchemaTestSessionInfoItem *v31;
  SUTSchemaTestSessionInfo *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SUTSchemaTestSessionInfo;
  v5 = -[SUTSchemaTestSessionInfo init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SUTSchemaTestSessionInfo setSystemBuild:](v5, "setSystemBuild:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuArchitecture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SUTSchemaTestSessionInfo setCpuArchitecture:](v5, "setCpuArchitecture:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SUTSchemaTestSessionInfo setHardwareModel:](v5, "setHardwareModel:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[SUTSchemaTestSessionInfo setModelNumber:](v5, "setModelNumber:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[SUTSchemaTestSessionInfo setProductType:](v5, "setProductType:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[SUTSchemaTestSessionInfo setProductVersion:](v5, "setProductVersion:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSimulator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTSchemaTestSessionInfo setIsSimulator:](v5, "setIsSimulator:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v18;
      v21 = (void *)objc_msgSend(v39, "copy");
      -[SUTSchemaTestSessionInfo setBundleId:](v5, "setBundleId:", v21);

      v18 = v20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[SUTSchemaTestSessionInfo setDeviceName:](v5, "setDeviceName:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testSessionInfoItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v22;
      v35 = v18;
      v36 = v12;
      v37 = v10;
      v38 = v8;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v42 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = -[SUTSchemaTestSessionInfoItem initWithDictionary:]([SUTSchemaTestSessionInfoItem alloc], "initWithDictionary:", v30);
              -[SUTSchemaTestSessionInfo addTestSessionInfoItem:](v5, "addTestSessionInfoItem:", v31);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v27);
      }

      v10 = v37;
      v8 = v38;
      v12 = v36;
      v18 = v35;
      v22 = v34;
    }
    v32 = v5;

  }
  return v5;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cpuArchitecture
{
  return self->_cpuArchitecture;
}

- (void)setCpuArchitecture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)testSessionInfoItems
{
  return self->_testSessionInfoItems;
}

- (void)setTestSessionInfoItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCpuArchitecture:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasHardwareModel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasProductType:(BOOL)a3
{
  self->_hasCpuArchitecture = a3;
}

- (void)setHasProductVersion:(BOOL)a3
{
  self->_hasHardwareModel = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasModelNumber = a3;
}

- (void)setHasDeviceName:(BOOL)a3
{
  self->_hasProductType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSessionInfoItems, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_cpuArchitecture, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

@end
