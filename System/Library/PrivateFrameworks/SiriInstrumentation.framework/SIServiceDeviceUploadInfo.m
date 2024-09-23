@implementation SIServiceDeviceUploadInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRef_id
{
  return self->_ref_id != 0;
}

- (void)deleteRef_id
{
  -[SIServiceDeviceUploadInfo setRef_id:](self, "setRef_id:", 0);
}

- (void)setNs_relative_to_boot:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ns_relative_to_boot = a3;
}

- (BOOL)hasNs_relative_to_boot
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNs_relative_to_boot:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNs_relative_to_boot
{
  -[SIServiceDeviceUploadInfo setNs_relative_to_boot:](self, "setNs_relative_to_boot:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceDeviceUploadInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SIServiceDeviceUploadInfo ref_id](self, "ref_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t ns_relative_to_boot;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SIServiceDeviceUploadInfo ref_id](self, "ref_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ref_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[SIServiceDeviceUploadInfo ref_id](self, "ref_id");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SIServiceDeviceUploadInfo ref_id](self, "ref_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ref_id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[24] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    ns_relative_to_boot = self->_ns_relative_to_boot;
    if (ns_relative_to_boot != objc_msgSend(v4, "ns_relative_to_boot"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_ref_id, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_ns_relative_to_boot;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SIServiceDeviceUploadInfo ns_relative_to_boot](self, "ns_relative_to_boot"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("nsRelativeToBoot"));

  }
  if (self->_ref_id)
  {
    -[SIServiceDeviceUploadInfo ref_id](self, "ref_id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("refId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIServiceDeviceUploadInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIServiceDeviceUploadInfo)initWithJSON:(id)a3
{
  void *v4;
  SIServiceDeviceUploadInfo *v5;
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
    self = -[SIServiceDeviceUploadInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIServiceDeviceUploadInfo)initWithDictionary:(id)a3
{
  id v4;
  SIServiceDeviceUploadInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  SIServiceDeviceUploadInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIServiceDeviceUploadInfo;
  v5 = -[SIServiceDeviceUploadInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("refId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SIServiceDeviceUploadInfo setRef_id:](v5, "setRef_id:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nsRelativeToBoot"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIServiceDeviceUploadInfo setNs_relative_to_boot:](v5, "setNs_relative_to_boot:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)ref_id
{
  return self->_ref_id;
}

- (void)setRef_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)ns_relative_to_boot
{
  return self->_ns_relative_to_boot;
}

- (void)setHasRef_id:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ref_id, 0);
}

@end
