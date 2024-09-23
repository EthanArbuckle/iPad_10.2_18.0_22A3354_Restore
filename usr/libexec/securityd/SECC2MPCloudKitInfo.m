@implementation SECC2MPCloudKitInfo

- (BOOL)hasClientProcessVersion
{
  return self->_clientProcessVersion != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (void)setAnonymous:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_anonymous = a3;
}

- (void)setHasAnonymous:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAnonymous
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearOperationGroups
{
  -[NSMutableArray removeAllObjects](self->_operationGroups, "removeAllObjects");
}

- (void)addOperationGroup:(id)a3
{
  id v4;
  NSMutableArray *operationGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  operationGroups = self->_operationGroups;
  v8 = v4;
  if (!operationGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_operationGroups;
    self->_operationGroups = v6;

    v4 = v8;
    operationGroups = self->_operationGroups;
  }
  -[NSMutableArray addObject:](operationGroups, "addObject:", v4);

}

- (unint64_t)operationGroupsCount
{
  return (unint64_t)-[NSMutableArray count](self->_operationGroups, "count");
}

- (id)operationGroupAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_operationGroups, "objectAtIndex:", a3);
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reportOperationGroupFrequency = a3;
}

- (void)setHasReportOperationGroupFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportOperationGroupFrequency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReportOperationGroupFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearClientOperations
{
  -[NSMutableArray removeAllObjects](self->_clientOperations, "removeAllObjects");
}

- (void)addClientOperation:(id)a3
{
  id v4;
  NSMutableArray *clientOperations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clientOperations = self->_clientOperations;
  v8 = v4;
  if (!clientOperations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_clientOperations;
    self->_clientOperations = v6;

    v4 = v8;
    clientOperations = self->_clientOperations;
  }
  -[NSMutableArray addObject:](clientOperations, "addObject:", v4);

}

- (unint64_t)clientOperationsCount
{
  return (unint64_t)-[NSMutableArray count](self->_clientOperations, "count");
}

- (id)clientOperationAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_clientOperations, "objectAtIndex:", a3);
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportClientOperationFrequency = a3;
}

- (void)setHasReportClientOperationFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportClientOperationFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportClientOperationFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPCloudKitInfo;
  v3 = -[SECC2MPCloudKitInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientProcessVersion;
  NSString *clientBundleId;
  NSString *container;
  NSString *environment;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  char has;
  void *v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion)
    objc_msgSend(v3, "setObject:forKey:", clientProcessVersion, CFSTR("client_process_version"));
  clientBundleId = self->_clientBundleId;
  if (clientBundleId)
    objc_msgSend(v4, "setObject:forKey:", clientBundleId, CFSTR("client_bundle_id"));
  container = self->_container;
  if (container)
    objc_msgSend(v4, "setObject:forKey:", container, CFSTR("container"));
  environment = self->_environment;
  if (environment)
    objc_msgSend(v4, "setObject:forKey:", environment, CFSTR("environment"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_anonymous));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("anonymous"));

  }
  if (-[NSMutableArray count](self->_operationGroups, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_operationGroups, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = self->_operationGroups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("operation_group"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportOperationGroupFrequency));
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("report_operation_group_frequency"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportOperationGroupFrequencyBase));
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("report_operation_group_frequency_base"));

  }
  if (-[NSMutableArray count](self->_clientOperations, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_clientOperations, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = self->_clientOperations;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation", (_QWORD)v31));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("client_operation"));
  }
  v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportClientOperationFrequency));
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("report_client_operation_frequency"));

    v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportClientOperationFrequencyBase));
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("report_client_operation_frequency_base"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10015720C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *clientProcessVersion;
  NSString *clientBundleId;
  NSString *container;
  NSString *environment;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  char has;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  v5 = v4;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion)
    PBDataWriterWriteStringField(v4, clientProcessVersion, 102);
  clientBundleId = self->_clientBundleId;
  if (clientBundleId)
    PBDataWriterWriteStringField(v5, clientBundleId, 103);
  container = self->_container;
  if (container)
    PBDataWriterWriteStringField(v5, container, 201);
  environment = self->_environment;
  if (environment)
    PBDataWriterWriteStringField(v5, environment, 202);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField(v5, self->_anonymous, 203);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_operationGroups;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), 301);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_reportOperationGroupFrequency, 302);
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint64Field(v5, self->_reportOperationGroupFrequencyBase, 303);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = self->_clientOperations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), 401);
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

  v21 = (char)self->_has;
  if ((v21 & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_reportClientOperationFrequency, 402);
    v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0)
    PBDataWriterWriteUint64Field(v5, self->_reportClientOperationFrequencyBase, 403);

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  _BYTE *v15;

  v4 = a3;
  v15 = v4;
  if (self->_clientProcessVersion)
  {
    objc_msgSend(v4, "setClientProcessVersion:");
    v4 = v15;
  }
  if (self->_clientBundleId)
  {
    objc_msgSend(v15, "setClientBundleId:");
    v4 = v15;
  }
  if (self->_container)
  {
    objc_msgSend(v15, "setContainer:");
    v4 = v15;
  }
  if (self->_environment)
  {
    objc_msgSend(v15, "setEnvironment:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[88] = self->_anonymous;
    v4[92] |= 0x10u;
  }
  if (-[SECC2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount"))
  {
    objc_msgSend(v15, "clearOperationGroups");
    v5 = -[SECC2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo operationGroupAtIndex:](self, "operationGroupAtIndex:", i));
        objc_msgSend(v15, "addOperationGroup:", v8);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v15 + 3) = self->_reportOperationGroupFrequency;
    v15[92] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_QWORD *)v15 + 4) = self->_reportOperationGroupFrequencyBase;
    v15[92] |= 8u;
  }
  if (-[SECC2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount"))
  {
    objc_msgSend(v15, "clearClientOperations");
    v10 = -[SECC2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo clientOperationAtIndex:](self, "clientOperationAtIndex:", j));
        objc_msgSend(v15, "addClientOperation:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((_QWORD *)v15 + 1) = self->_reportClientOperationFrequency;
    v15[92] |= 1u;
    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((_QWORD *)v15 + 2) = self->_reportClientOperationFrequencyBase;
    v15[92] |= 2u;
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
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  id v19;
  char has;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  id v26;
  char v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientProcessVersion, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_clientBundleId, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_container, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  v12 = -[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  v13 = (void *)v5[9];
  v5[9] = v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v5 + 88) = self->_anonymous;
    *((_BYTE *)v5 + 92) |= 0x10u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->_operationGroups;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addOperationGroup:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[3] = self->_reportOperationGroupFrequency;
    *((_BYTE *)v5 + 92) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[4] = self->_reportOperationGroupFrequencyBase;
    *((_BYTE *)v5 + 92) |= 8u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = self->_clientOperations;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend(v5, "addClientOperation:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    v5[1] = self->_reportClientOperationFrequency;
    *((_BYTE *)v5 + 92) |= 1u;
    v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
  {
    v5[2] = self->_reportClientOperationFrequencyBase;
    *((_BYTE *)v5 + 92) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientProcessVersion;
  NSString *clientBundleId;
  NSString *container;
  NSString *environment;
  char has;
  char v10;
  NSMutableArray *operationGroups;
  NSMutableArray *clientOperations;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_43;
  clientProcessVersion = self->_clientProcessVersion;
  if ((unint64_t)clientProcessVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientProcessVersion, "isEqual:"))
      goto LABEL_43;
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:"))
      goto LABEL_43;
  }
  container = self->_container;
  if ((unint64_t)container | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](container, "isEqual:"))
      goto LABEL_43;
  }
  environment = self->_environment;
  if ((unint64_t)environment | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](environment, "isEqual:"))
      goto LABEL_43;
  }
  has = (char)self->_has;
  v10 = *((_BYTE *)v4 + 92);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) == 0)
      goto LABEL_43;
    if (self->_anonymous)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_43;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  operationGroups = self->_operationGroups;
  if ((unint64_t)operationGroups | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](operationGroups, "isEqual:"))
      goto LABEL_43;
    has = (char)self->_has;
    v10 = *((_BYTE *)v4 + 92);
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_reportOperationGroupFrequency != *((_QWORD *)v4 + 3))
      goto LABEL_43;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_reportOperationGroupFrequencyBase != *((_QWORD *)v4 + 4))
      goto LABEL_43;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_43;
  }
  clientOperations = self->_clientOperations;
  if ((unint64_t)clientOperations | *((_QWORD *)v4 + 6))
  {
    if (-[NSMutableArray isEqual:](clientOperations, "isEqual:"))
    {
      has = (char)self->_has;
      v10 = *((_BYTE *)v4 + 92);
      goto LABEL_34;
    }
LABEL_43:
    v13 = 0;
    goto LABEL_44;
  }
LABEL_34:
  if ((has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_reportClientOperationFrequency != *((_QWORD *)v4 + 1))
      goto LABEL_43;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_43;
  }
  v13 = (v10 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_reportClientOperationFrequencyBase != *((_QWORD *)v4 + 2))
      goto LABEL_43;
    v13 = 1;
  }
LABEL_44:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v14;

  v14 = -[NSString hash](self->_clientProcessVersion, "hash");
  v3 = -[NSString hash](self->_clientBundleId, "hash");
  v4 = -[NSString hash](self->_container, "hash");
  v5 = -[NSString hash](self->_environment, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v6 = 2654435761 * self->_anonymous;
  else
    v6 = 0;
  v7 = (unint64_t)-[NSMutableArray hash](self->_operationGroups, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761u * self->_reportOperationGroupFrequency;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v9 = 2654435761u * self->_reportOperationGroupFrequencyBase;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = (unint64_t)-[NSMutableArray hash](self->_clientOperations, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = 2654435761u * self->_reportClientOperationFrequency;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v12 = 2654435761u * self->_reportClientOperationFrequencyBase;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  char v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[SECC2MPCloudKitInfo setClientProcessVersion:](self, "setClientProcessVersion:");
  if (*((_QWORD *)v4 + 5))
    -[SECC2MPCloudKitInfo setClientBundleId:](self, "setClientBundleId:");
  if (*((_QWORD *)v4 + 8))
    -[SECC2MPCloudKitInfo setContainer:](self, "setContainer:");
  if (*((_QWORD *)v4 + 9))
    -[SECC2MPCloudKitInfo setEnvironment:](self, "setEnvironment:");
  if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    self->_anonymous = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 10);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[SECC2MPCloudKitInfo addOperationGroup:](self, "addOperationGroup:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 92);
  if ((v10 & 4) != 0)
  {
    self->_reportOperationGroupFrequency = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v4 + 92);
  }
  if ((v10 & 8) != 0)
  {
    self->_reportOperationGroupFrequencyBase = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[SECC2MPCloudKitInfo addClientOperation:](self, "addClientOperation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = *((_BYTE *)v4 + 92);
  if ((v16 & 1) != 0)
  {
    self->_reportClientOperationFrequency = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v16 = *((_BYTE *)v4 + 92);
  }
  if ((v16 & 2) != 0)
  {
    self->_reportClientOperationFrequencyBase = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (void)setClientProcessVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientProcessVersion, a3);
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (NSMutableArray)operationGroups
{
  return self->_operationGroups;
}

- (void)setOperationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroups, a3);
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (NSMutableArray)clientOperations
{
  return self->_clientOperations;
}

- (void)setClientOperations:(id)a3
{
  objc_storeStrong((id *)&self->_clientOperations, a3);
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

+ (Class)operationGroupType
{
  return (Class)objc_opt_class(SECC2MPCloudKitOperationGroupInfo);
}

+ (Class)clientOperationType
{
  return (Class)objc_opt_class(SECC2MPCloudKitOperationInfo);
}

@end
