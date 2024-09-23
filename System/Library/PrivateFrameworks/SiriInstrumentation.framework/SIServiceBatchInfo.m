@implementation SIServiceBatchInfo

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
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIServiceBatchInfo;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SIServiceBatchInfo deleteDevice_upload_info](self, "deleteDevice_upload_info");
  -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SIServiceBatchInfo deleteServer_upload_info](self, "deleteServer_upload_info");

  return v5;
}

- (BOOL)hasBatch_id
{
  return self->_batch_id != 0;
}

- (void)deleteBatch_id
{
  -[SIServiceBatchInfo setBatch_id:](self, "setBatch_id:", 0);
}

- (void)setDevice_upload_info:(id)a3
{
  SIServiceDeviceUploadInfo *v4;
  SIServiceServerUploadInfo *server_upload_info;
  SIServiceDeviceUploadInfo *device_upload_info;

  v4 = (SIServiceDeviceUploadInfo *)a3;
  server_upload_info = self->_server_upload_info;
  self->_server_upload_info = 0;

  *(_QWORD *)&self->_hasBatch_id = 2 * (v4 != 0);
  device_upload_info = self->_device_upload_info;
  self->_device_upload_info = v4;

}

- (SIServiceDeviceUploadInfo)device_upload_info
{
  if (*(_QWORD *)&self->_hasBatch_id == 2)
    return self->_device_upload_info;
  else
    return (SIServiceDeviceUploadInfo *)0;
}

- (void)deleteDevice_upload_info
{
  SIServiceDeviceUploadInfo *device_upload_info;

  if (*(_QWORD *)&self->_hasBatch_id == 2)
  {
    *(_QWORD *)&self->_hasBatch_id = 0;
    device_upload_info = self->_device_upload_info;
    self->_device_upload_info = 0;

  }
}

- (void)setServer_upload_info:(id)a3
{
  SIServiceServerUploadInfo *v4;
  SIServiceDeviceUploadInfo *device_upload_info;
  uint64_t v6;
  SIServiceServerUploadInfo *server_upload_info;

  v4 = (SIServiceServerUploadInfo *)a3;
  device_upload_info = self->_device_upload_info;
  self->_device_upload_info = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  *(_QWORD *)&self->_hasBatch_id = v6;
  server_upload_info = self->_server_upload_info;
  self->_server_upload_info = v4;

}

- (SIServiceServerUploadInfo)server_upload_info
{
  if (*(_QWORD *)&self->_hasBatch_id == 3)
    return self->_server_upload_info;
  else
    return (SIServiceServerUploadInfo *)0;
}

- (void)deleteServer_upload_info
{
  SIServiceServerUploadInfo *server_upload_info;

  if (*(_QWORD *)&self->_hasBatch_id == 3)
  {
    *(_QWORD *)&self->_hasBatch_id = 0;
    server_upload_info = self->_server_upload_info;
    self->_server_upload_info = 0;

  }
}

- (void)setBatch_type:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_batch_type = a3;
}

- (BOOL)hasBatch_type
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBatch_type:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBatch_type
{
  -[SIServiceBatchInfo setBatch_type:](self, "setBatch_type:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceBatchInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SIServiceBatchInfo batch_id](self, "batch_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  BOOL v23;
  int batch_type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  v5 = *(_QWORD *)&self->_hasBatch_id;
  if (v5 != objc_msgSend(v4, "whichUpload_Info"))
    goto LABEL_18;
  -[SIServiceBatchInfo batch_id](self, "batch_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batch_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SIServiceBatchInfo batch_id](self, "batch_id");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SIServiceBatchInfo batch_id](self, "batch_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batch_id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device_upload_info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device_upload_info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "server_upload_info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "server_upload_info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_18;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (batch_type = self->_batch_type, batch_type == objc_msgSend(v4, "batch_type")))
    {
      v23 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_batch_id, "hash");
  v4 = -[SIServiceDeviceUploadInfo hash](self->_device_upload_info, "hash");
  v5 = -[SIServiceServerUploadInfo hash](self->_server_upload_info, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_batch_type;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_batch_id)
  {
    -[SIServiceBatchInfo batch_id](self, "batch_id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("batchId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("batchId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[SIServiceBatchInfo batch_type](self, "batch_type");
    v8 = CFSTR("UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("DATA");
    if (v7 == 2)
      v9 = CFSTR("SENTINEL");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("batchType"));
  }
  if (self->_device_upload_info)
  {
    -[SIServiceBatchInfo device_upload_info](self, "device_upload_info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceUploadInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("deviceUploadInfo"));

    }
  }
  if (self->_server_upload_info)
  {
    -[SIServiceBatchInfo server_upload_info](self, "server_upload_info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("serverUploadInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("serverUploadInfo"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIServiceBatchInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIServiceBatchInfo)initWithJSON:(id)a3
{
  void *v4;
  SIServiceBatchInfo *v5;
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
    self = -[SIServiceBatchInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIServiceBatchInfo)initWithDictionary:(id)a3
{
  id v4;
  SIServiceBatchInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  SIServiceDeviceUploadInfo *v9;
  void *v10;
  SIServiceServerUploadInfo *v11;
  void *v12;
  SIServiceBatchInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIServiceBatchInfo;
  v5 = -[SIServiceBatchInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[SIServiceBatchInfo setBatch_id:](v5, "setBatch_id:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceUploadInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SIServiceDeviceUploadInfo initWithDictionary:]([SIServiceDeviceUploadInfo alloc], "initWithDictionary:", v8);
      -[SIServiceBatchInfo setDevice_upload_info:](v5, "setDevice_upload_info:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverUploadInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SIServiceServerUploadInfo initWithDictionary:]([SIServiceServerUploadInfo alloc], "initWithDictionary:", v10);
      -[SIServiceBatchInfo setServer_upload_info:](v5, "setServer_upload_info:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIServiceBatchInfo setBatch_type:](v5, "setBatch_type:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (unint64_t)whichUpload_Info
{
  return *(_QWORD *)&self->_hasBatch_id;
}

- (NSData)batch_id
{
  return self->_batch_id;
}

- (void)setBatch_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)batch_type
{
  return self->_batch_type;
}

- (void)setHasBatch_id:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasDevice_upload_info
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasDevice_upload_info:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasServer_upload_info
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasServer_upload_info:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server_upload_info, 0);
  objc_storeStrong((id *)&self->_device_upload_info, 0);
  objc_storeStrong((id *)&self->_batch_id, 0);
}

@end
