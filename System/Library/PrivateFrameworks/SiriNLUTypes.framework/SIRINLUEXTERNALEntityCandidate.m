@implementation SIRINLUEXTERNALEntityCandidate

- (BOOL)hasEntity
{
  return self->_entity != 0;
}

- (BOOL)hasScore
{
  return self->_score != 0;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)clearAnnotations
{
  -[NSMutableArray removeAllObjects](self->_annotations, "removeAllObjects");
}

- (void)addAnnotations:(id)a3
{
  id v4;
  NSMutableArray *annotations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  annotations = self->_annotations;
  v8 = v4;
  if (!annotations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_annotations;
    self->_annotations = v6;

    v4 = v8;
    annotations = self->_annotations;
  }
  -[NSMutableArray addObject:](annotations, "addObject:", v4);

}

- (unint64_t)annotationsCount
{
  return -[NSMutableArray count](self->_annotations, "count");
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_annotations, "objectAtIndex:", a3);
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALEntityCandidate;
  -[SIRINLUEXTERNALEntityCandidate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALEntityCandidate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUsoGraph *entity;
  void *v5;
  SIRICOMMONDoubleValue *score;
  void *v7;
  SIRICOMMONStringValue *entityId;
  void *v9;
  SIRICOMMONStringValue *appBundleId;
  void *v11;
  SIRINLUEXTERNALRRGroupIdentifier *groupId;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  SIRINLUEXTERNALRRMetadata *metadata;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  entity = self->_entity;
  if (entity)
  {
    -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](entity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("entity"));

  }
  score = self->_score;
  if (score)
  {
    -[SIRICOMMONDoubleValue dictionaryRepresentation](score, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("score"));

  }
  entityId = self->_entityId;
  if (entityId)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](entityId, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("entity_id"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](appBundleId, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("app_bundle_id"));

  }
  groupId = self->_groupId;
  if (groupId)
  {
    -[SIRINLUEXTERNALRRGroupIdentifier dictionaryRepresentation](groupId, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("group_id"));

  }
  if (-[NSMutableArray count](self->_annotations, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_annotations, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = self->_annotations;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("annotations"));
  }
  metadata = self->_metadata;
  if (metadata)
  {
    -[SIRINLUEXTERNALRRMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALEntityCandidateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_entity)
    PBDataWriterWriteSubmessage();
  if (self->_score)
    PBDataWriterWriteSubmessage();
  if (self->_entityId)
    PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteSubmessage();
  if (self->_groupId)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_annotations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_metadata)
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
  if (self->_entity)
    objc_msgSend(v8, "setEntity:");
  if (self->_score)
    objc_msgSend(v8, "setScore:");
  if (self->_entityId)
    objc_msgSend(v8, "setEntityId:");
  if (self->_appBundleId)
    objc_msgSend(v8, "setAppBundleId:");
  if (self->_groupId)
    objc_msgSend(v8, "setGroupId:");
  if (-[SIRINLUEXTERNALEntityCandidate annotationsCount](self, "annotationsCount"))
  {
    objc_msgSend(v8, "clearAnnotations");
    v4 = -[SIRINLUEXTERNALEntityCandidate annotationsCount](self, "annotationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALEntityCandidate annotationsAtIndex:](self, "annotationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnnotations:", v7);

      }
    }
  }
  if (self->_metadata)
    objc_msgSend(v8, "setMetadata:");

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
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_entity, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[SIRICOMMONDoubleValue copyWithZone:](self->_score, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[SIRICOMMONStringValue copyWithZone:](self->_entityId, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[SIRICOMMONStringValue copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[SIRINLUEXTERNALRRGroupIdentifier copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_annotations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addAnnotations:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  v22 = -[SIRINLUEXTERNALRRMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v23 = (void *)v5[6];
  v5[6] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUsoGraph *entity;
  SIRICOMMONDoubleValue *score;
  SIRICOMMONStringValue *entityId;
  SIRICOMMONStringValue *appBundleId;
  SIRINLUEXTERNALRRGroupIdentifier *groupId;
  NSMutableArray *annotations;
  SIRINLUEXTERNALRRMetadata *metadata;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((entity = self->_entity, !((unint64_t)entity | v4[3]))
     || -[SIRINLUEXTERNALUsoGraph isEqual:](entity, "isEqual:"))
    && ((score = self->_score, !((unint64_t)score | v4[7]))
     || -[SIRICOMMONDoubleValue isEqual:](score, "isEqual:"))
    && ((entityId = self->_entityId, !((unint64_t)entityId | v4[4]))
     || -[SIRICOMMONStringValue isEqual:](entityId, "isEqual:"))
    && ((appBundleId = self->_appBundleId, !((unint64_t)appBundleId | v4[2]))
     || -[SIRICOMMONStringValue isEqual:](appBundleId, "isEqual:"))
    && ((groupId = self->_groupId, !((unint64_t)groupId | v4[5]))
     || -[SIRINLUEXTERNALRRGroupIdentifier isEqual:](groupId, "isEqual:"))
    && ((annotations = self->_annotations, !((unint64_t)annotations | v4[1]))
     || -[NSMutableArray isEqual:](annotations, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[6])
      v12 = -[SIRINLUEXTERNALRRMetadata isEqual:](metadata, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[SIRINLUEXTERNALUsoGraph hash](self->_entity, "hash");
  v4 = -[SIRICOMMONDoubleValue hash](self->_score, "hash") ^ v3;
  v5 = -[SIRICOMMONStringValue hash](self->_entityId, "hash");
  v6 = v4 ^ v5 ^ -[SIRICOMMONStringValue hash](self->_appBundleId, "hash");
  v7 = -[SIRINLUEXTERNALRRGroupIdentifier hash](self->_groupId, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_annotations, "hash");
  return v6 ^ v8 ^ -[SIRINLUEXTERNALRRMetadata hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUsoGraph *entity;
  uint64_t v6;
  SIRICOMMONDoubleValue *score;
  uint64_t v8;
  SIRICOMMONStringValue *entityId;
  uint64_t v10;
  SIRICOMMONStringValue *appBundleId;
  uint64_t v12;
  SIRINLUEXTERNALRRGroupIdentifier *groupId;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  SIRINLUEXTERNALRRMetadata *metadata;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  entity = self->_entity;
  v6 = *((_QWORD *)v4 + 3);
  if (entity)
  {
    if (v6)
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](entity, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALEntityCandidate setEntity:](self, "setEntity:");
  }
  score = self->_score;
  v8 = *((_QWORD *)v4 + 7);
  if (score)
  {
    if (v8)
      -[SIRICOMMONDoubleValue mergeFrom:](score, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALEntityCandidate setScore:](self, "setScore:");
  }
  entityId = self->_entityId;
  v10 = *((_QWORD *)v4 + 4);
  if (entityId)
  {
    if (v10)
      -[SIRICOMMONStringValue mergeFrom:](entityId, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALEntityCandidate setEntityId:](self, "setEntityId:");
  }
  appBundleId = self->_appBundleId;
  v12 = *((_QWORD *)v4 + 2);
  if (appBundleId)
  {
    if (v12)
      -[SIRICOMMONStringValue mergeFrom:](appBundleId, "mergeFrom:");
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALEntityCandidate setAppBundleId:](self, "setAppBundleId:");
  }
  groupId = self->_groupId;
  v14 = *((_QWORD *)v4 + 5);
  if (groupId)
  {
    if (v14)
      -[SIRINLUEXTERNALRRGroupIdentifier mergeFrom:](groupId, "mergeFrom:");
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALEntityCandidate setGroupId:](self, "setGroupId:");
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = *((id *)v4 + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        -[SIRINLUEXTERNALEntityCandidate addAnnotations:](self, "addAnnotations:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  metadata = self->_metadata;
  v21 = *((_QWORD *)v4 + 6);
  if (metadata)
  {
    if (v21)
      -[SIRINLUEXTERNALRRMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v21)
  {
    -[SIRINLUEXTERNALEntityCandidate setMetadata:](self, "setMetadata:");
  }

}

- (SIRINLUEXTERNALUsoGraph)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (SIRICOMMONDoubleValue)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (SIRICOMMONStringValue)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_storeStrong((id *)&self->_entityId, a3);
}

- (SIRICOMMONStringValue)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (SIRINLUEXTERNALRRGroupIdentifier)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSMutableArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (SIRINLUEXTERNALRRMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

+ (Class)annotationsType
{
  return (Class)objc_opt_class();
}

@end
