@implementation TRILogTreatment

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)TRILogTreatment;
  -[TRILogTreatment dealloc](&v3, sel_dealloc);
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (unint64_t)namespaceIdsCount
{
  return self->_namespaceIds.count;
}

- (unsigned)namespaceIds
{
  return self->_namespaceIds.list;
}

- (void)clearNamespaceIds
{
  PBRepeatedUInt32Clear();
}

- (void)addNamespaceId:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)namespaceIdAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_namespaceIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_namespaceIds = &self->_namespaceIds;
  count = self->_namespaceIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_namespaceIds->list[a3];
}

- (void)setNamespaceIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setDeploymentId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deploymentId = a3;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeploymentId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearNamespaces
{
  -[NSMutableArray removeAllObjects](self->_namespaces, "removeAllObjects");
}

- (void)addNamespace:(id)a3
{
  id v4;
  NSMutableArray *namespaces;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  namespaces = self->_namespaces;
  v8 = v4;
  if (!namespaces)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_namespaces;
    self->_namespaces = v6;

    v4 = v8;
    namespaces = self->_namespaces;
  }
  -[NSMutableArray addObject:](namespaces, "addObject:", v4);

}

- (unint64_t)namespacesCount
{
  return -[NSMutableArray count](self->_namespaces, "count");
}

- (id)namespaceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_namespaces, "objectAtIndex:", a3);
}

+ (Class)namespaceType
{
  return (Class)objc_opt_class();
}

- (void)clearNamespaceNames
{
  -[NSMutableArray removeAllObjects](self->_namespaceNames, "removeAllObjects");
}

- (void)addNamespaceName:(id)a3
{
  id v4;
  NSMutableArray *namespaceNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  namespaceNames = self->_namespaceNames;
  v8 = v4;
  if (!namespaceNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_namespaceNames;
    self->_namespaceNames = v6;

    v4 = v8;
    namespaceNames = self->_namespaceNames;
  }
  -[NSMutableArray addObject:](namespaceNames, "addObject:", v4);

}

- (unint64_t)namespaceNamesCount
{
  return -[NSMutableArray count](self->_namespaceNames, "count");
}

- (id)namespaceNameAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_namespaceNames, "objectAtIndex:", a3);
}

+ (Class)namespaceNameType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)TRILogTreatment;
  -[TRILogTreatment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogTreatment dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *namespaceNames;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experiment_id"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v4, "setObject:forKey:", treatmentId, CFSTR("treatment_id"));
  PBRepeatedUInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("namespace_id"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deploymentId);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("deployment_id"));

  }
  if (-[NSMutableArray count](self->_namespaces, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_namespaces, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_namespaces;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("namespace"));
  }
  namespaceNames = self->_namespaceNames;
  if (namespaceNames)
    objc_msgSend(v4, "setObject:forKey:", namespaceNames, CFSTR("namespace_name"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogTreatmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
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
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_namespaceIds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_namespaceIds.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_namespaceNames;
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
        PBDataWriterWriteStringField();
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
  v11 = self->_namespaces;
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
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_experimentId)
    objc_msgSend(v15, "setExperimentId:");
  if (self->_treatmentId)
    objc_msgSend(v15, "setTreatmentId:");
  if (-[TRILogTreatment namespaceIdsCount](self, "namespaceIdsCount"))
  {
    objc_msgSend(v15, "clearNamespaceIds");
    v4 = -[TRILogTreatment namespaceIdsCount](self, "namespaceIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v15, "addNamespaceId:", -[TRILogTreatment namespaceIdAtIndex:](self, "namespaceIdAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v15 + 8) = self->_deploymentId;
    *((_BYTE *)v15 + 72) |= 1u;
  }
  if (-[TRILogTreatment namespaceNamesCount](self, "namespaceNamesCount"))
  {
    objc_msgSend(v15, "clearNamespaceNames");
    v7 = -[TRILogTreatment namespaceNamesCount](self, "namespaceNamesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[TRILogTreatment namespaceNameAtIndex:](self, "namespaceNameAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addNamespaceName:", v10);

      }
    }
  }
  if (-[TRILogTreatment namespacesCount](self, "namespacesCount"))
  {
    objc_msgSend(v15, "clearNamespaces");
    v11 = -[TRILogTreatment namespacesCount](self, "namespacesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[TRILogTreatment namespaceAtIndex:](self, "namespaceAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addNamespace:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_deploymentId;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_namespaceNames;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNamespaceName:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_namespaces;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addNamespace:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSMutableArray *namespaceNames;
  NSMutableArray *namespaces;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:"))
      goto LABEL_16;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_16;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_deploymentId != *((_DWORD *)v4 + 8))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  namespaceNames = self->_namespaceNames;
  if ((unint64_t)namespaceNames | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](namespaceNames, "isEqual:"))
  {
    goto LABEL_16;
  }
  namespaces = self->_namespaces;
  if ((unint64_t)namespaces | *((_QWORD *)v4 + 7))
    v9 = -[NSMutableArray isEqual:](namespaces, "isEqual:");
  else
    v9 = 1;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[NSString hash](self->_treatmentId, "hash");
  v5 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_deploymentId;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_namespaceNames, "hash");
  return v7 ^ -[NSMutableArray hash](self->_namespaces, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[TRILogTreatment setExperimentId:](self, "setExperimentId:");
  if (*((_QWORD *)v4 + 8))
    -[TRILogTreatment setTreatmentId:](self, "setTreatmentId:");
  v5 = objc_msgSend(v4, "namespaceIdsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[TRILogTreatment addNamespaceId:](self, "addNamespaceId:", objc_msgSend(v4, "namespaceIdAtIndex:", i));
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_deploymentId = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = *((id *)v4 + 6);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[TRILogTreatment addNamespaceName:](self, "addNamespaceName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[TRILogTreatment addNamespace:](self, "addNamespace:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * k), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

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

- (unsigned)deploymentId
{
  return self->_deploymentId;
}

- (NSMutableArray)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
  objc_storeStrong((id *)&self->_namespaces, a3);
}

- (NSMutableArray)namespaceNames
{
  return self->_namespaceNames;
}

- (void)setNamespaceNames:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
