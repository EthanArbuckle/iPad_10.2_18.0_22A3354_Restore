@implementation PETSchemaPETUpload

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PETSchemaPETUpload;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETSchemaPETUpload metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PETSchemaPETUpload deleteMetadata](self, "deleteMetadata");
  -[PETSchemaPETUpload aggregated_messages](self, "aggregated_messages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETSchemaPETUpload setAggregated_messages:](self, "setAggregated_messages:", v10);

  -[PETSchemaPETUpload unaggregated_messages](self, "unaggregated_messages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETSchemaPETUpload setUnaggregated_messages:](self, "setUnaggregated_messages:", v12);

  -[PETSchemaPETUpload trial_messages](self, "trial_messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETSchemaPETUpload setTrial_messages:](self, "setTrial_messages:", v14);

  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.proactive.pet.PETUpload");
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)deleteMetadata
{
  -[PETSchemaPETUpload setMetadata:](self, "setMetadata:", 0);
}

- (void)clearAggregated_messages
{
  -[NSArray removeAllObjects](self->_aggregated_messages, "removeAllObjects");
}

- (void)addAggregated_messages:(id)a3
{
  id v4;
  NSArray *aggregated_messages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  aggregated_messages = self->_aggregated_messages;
  v8 = v4;
  if (!aggregated_messages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aggregated_messages;
    self->_aggregated_messages = v6;

    v4 = v8;
    aggregated_messages = self->_aggregated_messages;
  }
  -[NSArray addObject:](aggregated_messages, "addObject:", v4);

}

- (unint64_t)aggregated_messagesCount
{
  return -[NSArray count](self->_aggregated_messages, "count");
}

- (id)aggregated_messagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_aggregated_messages, "objectAtIndexedSubscript:", a3);
}

- (void)clearUnaggregated_messages
{
  -[NSArray removeAllObjects](self->_unaggregated_messages, "removeAllObjects");
}

- (void)addUnaggregated_messages:(id)a3
{
  id v4;
  NSArray *unaggregated_messages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  unaggregated_messages = self->_unaggregated_messages;
  v8 = v4;
  if (!unaggregated_messages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_unaggregated_messages;
    self->_unaggregated_messages = v6;

    v4 = v8;
    unaggregated_messages = self->_unaggregated_messages;
  }
  -[NSArray addObject:](unaggregated_messages, "addObject:", v4);

}

- (unint64_t)unaggregated_messagesCount
{
  return -[NSArray count](self->_unaggregated_messages, "count");
}

- (id)unaggregated_messagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_unaggregated_messages, "objectAtIndexedSubscript:", a3);
}

- (void)setIs_compressed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_is_compressed = a3;
}

- (BOOL)hasIs_compressed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIs_compressed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIs_compressed
{
  -[PETSchemaPETUpload setIs_compressed:](self, "setIs_compressed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasCompressed_messages
{
  return self->_compressed_messages != 0;
}

- (void)deleteCompressed_messages
{
  -[PETSchemaPETUpload setCompressed_messages:](self, "setCompressed_messages:", 0);
}

- (void)clearTrial_messages
{
  -[NSArray removeAllObjects](self->_trial_messages, "removeAllObjects");
}

- (void)addTrial_messages:(id)a3
{
  id v4;
  NSArray *trial_messages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  trial_messages = self->_trial_messages;
  v8 = v4;
  if (!trial_messages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trial_messages;
    self->_trial_messages = v6;

    v4 = v8;
    trial_messages = self->_trial_messages;
  }
  -[NSArray addObject:](trial_messages, "addObject:", v4);

}

- (unint64_t)trial_messagesCount
{
  return -[NSArray count](self->_trial_messages, "count");
}

- (id)trial_messagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_trial_messages, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCompressed_data
{
  return self->_compressed_data != 0;
}

- (void)deleteCompressed_data
{
  -[PETSchemaPETUpload setCompressed_data:](self, "setCompressed_data:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETUploadReadFrom(self, (uint64_t)a3);
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
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PETSchemaPETUpload metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PETSchemaPETUpload metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_aggregated_messages;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_unaggregated_messages;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PETSchemaPETUpload compressed_messages](self, "compressed_messages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteDataField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_trial_messages;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

  -[PETSchemaPETUpload compressed_data](self, "compressed_data", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    PBDataWriterWriteDataField();

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
  int is_compressed;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[PETSchemaPETUpload metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[PETSchemaPETUpload metadata](self, "metadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PETSchemaPETUpload metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_35;
  }
  else
  {

  }
  -[PETSchemaPETUpload aggregated_messages](self, "aggregated_messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregated_messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[PETSchemaPETUpload aggregated_messages](self, "aggregated_messages");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PETSchemaPETUpload aggregated_messages](self, "aggregated_messages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aggregated_messages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_35;
  }
  else
  {

  }
  -[PETSchemaPETUpload unaggregated_messages](self, "unaggregated_messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unaggregated_messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[PETSchemaPETUpload unaggregated_messages](self, "unaggregated_messages");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PETSchemaPETUpload unaggregated_messages](self, "unaggregated_messages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unaggregated_messages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_35;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    is_compressed = self->_is_compressed;
    if (is_compressed != objc_msgSend(v4, "is_compressed"))
      goto LABEL_35;
  }
  -[PETSchemaPETUpload compressed_messages](self, "compressed_messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compressed_messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[PETSchemaPETUpload compressed_messages](self, "compressed_messages");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PETSchemaPETUpload compressed_messages](self, "compressed_messages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compressed_messages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_35;
  }
  else
  {

  }
  -[PETSchemaPETUpload trial_messages](self, "trial_messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trial_messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[PETSchemaPETUpload trial_messages](self, "trial_messages");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PETSchemaPETUpload trial_messages](self, "trial_messages");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trial_messages");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_35;
  }
  else
  {

  }
  -[PETSchemaPETUpload compressed_data](self, "compressed_data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compressed_data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PETSchemaPETUpload compressed_data](self, "compressed_data");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_38:
      v38 = 1;
      goto LABEL_36;
    }
    v34 = (void *)v33;
    -[PETSchemaPETUpload compressed_data](self, "compressed_data");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compressed_data");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_38;
  }
  else
  {
LABEL_34:

  }
LABEL_35:
  v38 = 0;
LABEL_36:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[PETSchemaPETMetadata hash](self->_metadata, "hash");
  v4 = -[NSArray hash](self->_aggregated_messages, "hash");
  v5 = -[NSArray hash](self->_unaggregated_messages, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_is_compressed;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSData hash](self->_compressed_messages, "hash");
  v9 = v8 ^ -[NSArray hash](self->_trial_messages, "hash");
  return v7 ^ v9 ^ -[NSData hash](self->_compressed_data, "hash");
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
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_aggregated_messages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v5 = self->_aggregated_messages;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("aggregatedMessages"));
  }
  if (self->_compressed_data)
  {
    -[PETSchemaPETUpload compressed_data](self, "compressed_data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("compressedData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("compressedData"));

    }
  }
  if (self->_compressed_messages)
  {
    -[PETSchemaPETUpload compressed_messages](self, "compressed_messages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("compressedMessages"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("compressedMessages"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETUpload is_compressed](self, "is_compressed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isCompressed"));

  }
  if (self->_metadata)
  {
    -[PETSchemaPETUpload metadata](self, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("metadata"));

    }
  }
  if (-[NSArray count](self->_trial_messages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v23 = self->_trial_messages;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("trialMessages"));
  }
  if (-[NSArray count](self->_unaggregated_messages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = self->_unaggregated_messages;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v39);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend(v30, "addObject:", v36);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v37);

          }
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("unaggregatedMessages"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v39);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PETSchemaPETUpload dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PETSchemaPETUpload)initWithJSON:(id)a3
{
  void *v4;
  PETSchemaPETUpload *v5;
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
    self = -[PETSchemaPETUpload initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PETSchemaPETUpload)initWithDictionary:(id)a3
{
  id v4;
  PETSchemaPETUpload *v5;
  uint64_t v6;
  PETSchemaPETMetadata *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PETSchemaPETAggregatedMessage *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  PETSchemaPETRawMessage *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  PETSchemaPETRawMessage *v34;
  void *v35;
  void *v36;
  PETSchemaPETUpload *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PETSchemaPETUpload;
  v5 = -[PETSchemaPETUpload init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PETSchemaPETMetadata initWithDictionary:]([PETSchemaPETMetadata alloc], "initWithDictionary:", v6);
      -[PETSchemaPETUpload setMetadata:](v5, "setMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregatedMessages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v53 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[PETSchemaPETAggregatedMessage initWithDictionary:]([PETSchemaPETAggregatedMessage alloc], "initWithDictionary:", v14);
              -[PETSchemaPETUpload addAggregated_messages:](v5, "addAggregated_messages:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unaggregatedMessages"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[PETSchemaPETRawMessage initWithDictionary:]([PETSchemaPETRawMessage alloc], "initWithDictionary:", v22);
              -[PETSchemaPETUpload addUnaggregated_messages:](v5, "addUnaggregated_messages:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        }
        while (v19);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCompressed"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETUpload setIs_compressed:](v5, "setIs_compressed:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compressedMessages"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v25, 0);
      -[PETSchemaPETUpload setCompressed_messages:](v5, "setCompressed_messages:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialMessages"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = v25;
      v40 = v24;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v45;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = -[PETSchemaPETRawMessage initWithDictionary:]([PETSchemaPETRawMessage alloc], "initWithDictionary:", v33);
              -[PETSchemaPETUpload addTrial_messages:](v5, "addTrial_messages:", v34);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        }
        while (v30);
      }

      v24 = v40;
      v16 = v41;
      v25 = v39;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compressedData"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v35, 0);
      -[PETSchemaPETUpload setCompressed_data:](v5, "setCompressed_data:", v36);

    }
    v37 = v5;

  }
  return v5;
}

- (PETSchemaPETMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSArray)aggregated_messages
{
  return self->_aggregated_messages;
}

- (void)setAggregated_messages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)unaggregated_messages
{
  return self->_unaggregated_messages;
}

- (void)setUnaggregated_messages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)is_compressed
{
  return self->_is_compressed;
}

- (NSData)compressed_messages
{
  return self->_compressed_messages;
}

- (void)setCompressed_messages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)trial_messages
{
  return self->_trial_messages;
}

- (void)setTrial_messages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)compressed_data
{
  return self->_compressed_data;
}

- (void)setCompressed_data:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCompressed_messages:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasCompressed_data:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressed_data, 0);
  objc_storeStrong((id *)&self->_trial_messages, 0);
  objc_storeStrong((id *)&self->_compressed_messages, 0);
  objc_storeStrong((id *)&self->_unaggregated_messages, 0);
  objc_storeStrong((id *)&self->_aggregated_messages, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (int)getAnyEventType
{
  return 5;
}

@end
