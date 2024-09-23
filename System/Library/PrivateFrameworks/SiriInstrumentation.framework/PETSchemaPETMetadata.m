@implementation PETSchemaPETMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setUpload_time:(unint64_t)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 1u;
  self->_upload_time = a3;
}

- (BOOL)hasUpload_time
{
  return *(_WORD *)(&self->_is_trial_upload + 1) & 1;
}

- (void)setHasUpload_time:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFE | a3;
}

- (void)deleteUpload_time
{
  -[PETSchemaPETMetadata setUpload_time:](self, "setUpload_time:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~1u;
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
}

- (void)deletePlatform
{
  -[PETSchemaPETMetadata setPlatform:](self, "setPlatform:", 0);
}

- (BOOL)hasDevice
{
  return self->_device != 0;
}

- (void)deleteDevice
{
  -[PETSchemaPETMetadata setDevice:](self, "setDevice:", 0);
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)deleteBuild
{
  -[PETSchemaPETMetadata setBuild:](self, "setBuild:", 0);
}

- (void)setIs_internal:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 2u;
  self->_is_internal = a3;
}

- (BOOL)hasIs_internal
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 1) & 1;
}

- (void)setHasIs_internal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFD | v3;
}

- (void)deleteIs_internal
{
  -[PETSchemaPETMetadata setIs_internal:](self, "setIs_internal:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~2u;
}

- (void)setIs_seed:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 4u;
  self->_is_seed = a3;
}

- (BOOL)hasIs_seed
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 2) & 1;
}

- (void)setHasIs_seed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFB | v3;
}

- (void)deleteIs_seed
{
  -[PETSchemaPETMetadata setIs_seed:](self, "setIs_seed:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~4u;
}

- (void)setIs_gm:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 8u;
  self->_is_gm = a3;
}

- (BOOL)hasIs_gm
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 3) & 1;
}

- (void)setHasIs_gm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFF7 | v3;
}

- (void)deleteIs_gm
{
  -[PETSchemaPETMetadata setIs_gm:](self, "setIs_gm:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~8u;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (void)deleteCountry
{
  -[PETSchemaPETMetadata setCountry:](self, "setCountry:", 0);
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)deleteLanguage
{
  -[PETSchemaPETMetadata setLanguage:](self, "setLanguage:", 0);
}

- (void)setConfig_version:(unsigned int)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x10u;
  self->_config_version = a3;
}

- (BOOL)hasConfig_version
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 4) & 1;
}

- (void)setHasConfig_version:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFEF | v3;
}

- (void)deleteConfig_version
{
  -[PETSchemaPETMetadata setConfig_version:](self, "setConfig_version:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x10u;
}

- (BOOL)hasPseudo_device_id
{
  return self->_pseudo_device_id != 0;
}

- (void)deletePseudo_device_id
{
  -[PETSchemaPETMetadata setPseudo_device_id:](self, "setPseudo_device_id:", 0);
}

- (void)setIs_internal_carry:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x20u;
  self->_is_internal_carry = a3;
}

- (BOOL)hasIs_internal_carry
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 5) & 1;
}

- (void)setHasIs_internal_carry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFDF | v3;
}

- (void)deleteIs_internal_carry
{
  -[PETSchemaPETMetadata setIs_internal_carry:](self, "setIs_internal_carry:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x20u;
}

- (void)setIs_config_enabled:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x40u;
  self->_is_config_enabled = a3;
}

- (BOOL)hasIs_config_enabled
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 6) & 1;
}

- (void)setHasIs_config_enabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFBF | v3;
}

- (void)deleteIs_config_enabled
{
  -[PETSchemaPETMetadata setIs_config_enabled:](self, "setIs_config_enabled:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x40u;
}

- (BOOL)hasMessage_group
{
  return self->_message_group != 0;
}

- (void)deleteMessage_group
{
  -[PETSchemaPETMetadata setMessage_group:](self, "setMessage_group:", 0);
}

- (BOOL)hasMsg_type
{
  return self->_msg_type != 0;
}

- (void)deleteMsg_type
{
  -[PETSchemaPETMetadata setMsg_type:](self, "setMsg_type:", 0);
}

- (void)setIs_testing_data:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x80u;
  self->_is_testing_data = a3;
}

- (BOOL)hasIs_testing_data
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 7) & 1;
}

- (void)setHasIs_testing_data:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFF7F | v3;
}

- (void)deleteIs_testing_data
{
  -[PETSchemaPETMetadata setIs_testing_data:](self, "setIs_testing_data:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x80u;
}

- (void)setIs_trial_upload:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x100u;
  self->_is_trial_upload = a3;
}

- (BOOL)hasIs_trial_upload
{
  return HIBYTE(*(unsigned __int16 *)(&self->_is_trial_upload + 1)) & 1;
}

- (void)setHasIs_trial_upload:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFEFF | v3;
}

- (void)deleteIs_trial_upload
{
  -[PETSchemaPETMetadata setIs_trial_upload:](self, "setIs_trial_upload:", 0);
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  __int16 v14;
  id v15;

  v15 = a3;
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[PETSchemaPETMetadata platform](self, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PETSchemaPETMetadata device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PETSchemaPETMetadata build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(_WORD *)(&self->_is_trial_upload + 1);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 8) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:
  -[PETSchemaPETMetadata country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[PETSchemaPETMetadata language](self, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  -[PETSchemaPETMetadata pseudo_device_id](self, "pseudo_device_id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  }
  if ((v11 & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  -[PETSchemaPETMetadata message_group](self, "message_group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[PETSchemaPETMetadata msg_type](self, "msg_type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  v14 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v14 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = *(_WORD *)(&self->_is_trial_upload + 1);
  }
  if ((v14 & 0x100) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _WORD *v4;
  unint64_t upload_time;
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
  unsigned int v23;
  int v24;
  unsigned int v25;
  int is_internal;
  int v27;
  int is_seed;
  int v29;
  int is_gm;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  unsigned int config_version;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  int is_internal_carry;
  int v52;
  int is_config_enabled;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  BOOL v64;
  unsigned int v66;
  int v67;
  unsigned int v68;
  int is_testing_data;
  int v70;
  int is_trial_upload;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != (v4[53] & 1))
    goto LABEL_66;
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != 0)
  {
    upload_time = self->_upload_time;
    if (upload_time != objc_msgSend(v4, "upload_time"))
      goto LABEL_66;
  }
  -[PETSchemaPETMetadata platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata platform](self, "platform");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PETSchemaPETMetadata platform](self, "platform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "platform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_66;
  }
  else
  {

  }
  -[PETSchemaPETMetadata device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata device](self, "device");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PETSchemaPETMetadata device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_66;
  }
  else
  {

  }
  -[PETSchemaPETMetadata build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata build](self, "build");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PETSchemaPETMetadata build](self, "build");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "build");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_66;
  }
  else
  {

  }
  v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  v24 = (v23 >> 1) & 1;
  v25 = (unsigned __int16)v4[53];
  if (v24 != ((v25 >> 1) & 1))
    goto LABEL_66;
  if (v24)
  {
    is_internal = self->_is_internal;
    if (is_internal != objc_msgSend(v4, "is_internal"))
      goto LABEL_66;
    v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    v25 = (unsigned __int16)v4[53];
  }
  v27 = (v23 >> 2) & 1;
  if (v27 != ((v25 >> 2) & 1))
    goto LABEL_66;
  if (v27)
  {
    is_seed = self->_is_seed;
    if (is_seed != objc_msgSend(v4, "is_seed"))
      goto LABEL_66;
    v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    v25 = (unsigned __int16)v4[53];
  }
  v29 = (v23 >> 3) & 1;
  if (v29 != ((v25 >> 3) & 1))
    goto LABEL_66;
  if (v29)
  {
    is_gm = self->_is_gm;
    if (is_gm != objc_msgSend(v4, "is_gm"))
      goto LABEL_66;
  }
  -[PETSchemaPETMetadata country](self, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "country");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata country](self, "country");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[PETSchemaPETMetadata country](self, "country");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "country");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_66;
  }
  else
  {

  }
  -[PETSchemaPETMetadata language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata language](self, "language");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[PETSchemaPETMetadata language](self, "language");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "language");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_66;
  }
  else
  {

  }
  v41 = (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 4) & 1;
  if (v41 != (((unsigned __int16)v4[53] >> 4) & 1))
    goto LABEL_66;
  if (v41)
  {
    config_version = self->_config_version;
    if (config_version != objc_msgSend(v4, "config_version"))
      goto LABEL_66;
  }
  -[PETSchemaPETMetadata pseudo_device_id](self, "pseudo_device_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pseudo_device_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata pseudo_device_id](self, "pseudo_device_id");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PETSchemaPETMetadata pseudo_device_id](self, "pseudo_device_id");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pseudo_device_id");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_66;
  }
  else
  {

  }
  v48 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  v49 = (v48 >> 5) & 1;
  v50 = (unsigned __int16)v4[53];
  if (v49 != ((v50 >> 5) & 1))
    goto LABEL_66;
  if (v49)
  {
    is_internal_carry = self->_is_internal_carry;
    if (is_internal_carry != objc_msgSend(v4, "is_internal_carry"))
      goto LABEL_66;
    v48 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    v50 = (unsigned __int16)v4[53];
  }
  v52 = (v48 >> 6) & 1;
  if (v52 != ((v50 >> 6) & 1))
    goto LABEL_66;
  if (v52)
  {
    is_config_enabled = self->_is_config_enabled;
    if (is_config_enabled != objc_msgSend(v4, "is_config_enabled"))
      goto LABEL_66;
  }
  -[PETSchemaPETMetadata message_group](self, "message_group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message_group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_65;
  -[PETSchemaPETMetadata message_group](self, "message_group");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[PETSchemaPETMetadata message_group](self, "message_group");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message_group");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_66;
  }
  else
  {

  }
  -[PETSchemaPETMetadata msg_type](self, "msg_type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "msg_type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_65:

    goto LABEL_66;
  }
  -[PETSchemaPETMetadata msg_type](self, "msg_type");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[PETSchemaPETMetadata msg_type](self, "msg_type");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msg_type");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_66;
  }
  else
  {

  }
  v66 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  v67 = (v66 >> 7) & 1;
  v68 = (unsigned __int16)v4[53];
  if (v67 == ((v68 >> 7) & 1))
  {
    if (v67)
    {
      is_testing_data = self->_is_testing_data;
      if (is_testing_data != objc_msgSend(v4, "is_testing_data"))
        goto LABEL_66;
      v66 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
      v68 = (unsigned __int16)v4[53];
    }
    v70 = (v66 >> 8) & 1;
    if (v70 == ((v68 >> 8) & 1))
    {
      if (!v70
        || (is_trial_upload = self->_is_trial_upload,
            is_trial_upload == objc_msgSend(v4, "is_trial_upload")))
      {
        v64 = 1;
        goto LABEL_67;
      }
    }
  }
LABEL_66:
  v64 = 0;
LABEL_67:

  return v64;
}

- (unint64_t)hash
{
  __int16 v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  unint64_t v22;

  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != 0)
    v22 = 2654435761u * self->_upload_time;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_platform, "hash");
  v20 = -[NSString hash](self->_device, "hash");
  v19 = -[NSString hash](self->_build, "hash");
  v3 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v3 & 2) == 0)
  {
    v18 = 0;
    if ((v3 & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v17 = 0;
    if ((v3 & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v18 = 2654435761 * self->_is_internal;
  if ((v3 & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v17 = 2654435761 * self->_is_seed;
  if ((v3 & 8) != 0)
  {
LABEL_7:
    v16 = 2654435761 * self->_is_gm;
    goto LABEL_11;
  }
LABEL_10:
  v16 = 0;
LABEL_11:
  v4 = -[NSString hash](self->_country, "hash");
  v5 = -[NSString hash](self->_language, "hash");
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0)
    v6 = 2654435761 * self->_config_version;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_pseudo_device_id, "hash");
  v8 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v8 & 0x20) != 0)
  {
    v9 = 2654435761 * self->_is_internal_carry;
    if ((v8 & 0x40) != 0)
      goto LABEL_16;
  }
  else
  {
    v9 = 0;
    if ((v8 & 0x40) != 0)
    {
LABEL_16:
      v10 = 2654435761 * self->_is_config_enabled;
      goto LABEL_19;
    }
  }
  v10 = 0;
LABEL_19:
  v11 = -[NSString hash](self->_message_group, "hash");
  v12 = -[NSString hash](self->_msg_type, "hash");
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x80) != 0)
  {
    v13 = 2654435761 * self->_is_testing_data;
    if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) != 0)
      goto LABEL_21;
LABEL_23:
    v14 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) == 0)
    goto LABEL_23;
LABEL_21:
  v14 = 2654435761 * self->_is_trial_upload;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
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
  __int16 v11;
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
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_build)
  {
    -[PETSchemaPETMetadata build](self, "build");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("build"));

  }
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PETSchemaPETMetadata config_version](self, "config_version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("configVersion"));

  }
  if (self->_country)
  {
    -[PETSchemaPETMetadata country](self, "country");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("country"));

  }
  if (self->_device)
  {
    -[PETSchemaPETMetadata device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("device"));

  }
  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_config_enabled](self, "is_config_enabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isConfigEnabled"));

    v11 = *(_WORD *)(&self->_is_trial_upload + 1);
    if ((v11 & 8) == 0)
    {
LABEL_11:
      if ((v11 & 2) == 0)
        goto LABEL_12;
      goto LABEL_32;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_gm](self, "is_gm"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isGm"));

  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 2) == 0)
  {
LABEL_12:
    if ((v11 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_internal](self, "is_internal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isInternal"));

  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x20) == 0)
  {
LABEL_13:
    if ((v11 & 4) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_internal_carry](self, "is_internal_carry"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isInternalCarry"));

  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 4) == 0)
  {
LABEL_14:
    if ((v11 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_seed](self, "is_seed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isSeed"));

  v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x80) == 0)
  {
LABEL_15:
    if ((v11 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_testing_data](self, "is_testing_data"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isTestingData"));

  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PETSchemaPETMetadata is_trial_upload](self, "is_trial_upload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isTrialUpload"));

  }
LABEL_17:
  if (self->_language)
  {
    -[PETSchemaPETMetadata language](self, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("language"));

  }
  if (self->_message_group)
  {
    -[PETSchemaPETMetadata message_group](self, "message_group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("messageGroup"));

  }
  if (self->_msg_type)
  {
    -[PETSchemaPETMetadata msg_type](self, "msg_type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("msgType"));

  }
  if (self->_platform)
  {
    -[PETSchemaPETMetadata platform](self, "platform");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("platform"));

  }
  if (self->_pseudo_device_id)
  {
    -[PETSchemaPETMetadata pseudo_device_id](self, "pseudo_device_id");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("pseudoDeviceId"));

  }
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PETSchemaPETMetadata upload_time](self, "upload_time"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("uploadTime"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PETSchemaPETMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PETSchemaPETMetadata)initWithJSON:(id)a3
{
  void *v4;
  PETSchemaPETMetadata *v5;
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
    self = -[PETSchemaPETMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PETSchemaPETMetadata)initWithDictionary:(id)a3
{
  id v4;
  PETSchemaPETMetadata *v5;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PETSchemaPETMetadata *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PETSchemaPETMetadata;
  v5 = -[PETSchemaPETMetadata init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uploadTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setUpload_time:](v5, "setUpload_time:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[PETSchemaPETMetadata setPlatform:](v5, "setPlatform:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PETSchemaPETMetadata setDevice:](v5, "setDevice:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[PETSchemaPETMetadata setBuild:](v5, "setBuild:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInternal"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_internal:](v5, "setIs_internal:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSeed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_seed:](v5, "setIs_seed:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_gm:](v5, "setIs_gm:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("country"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[PETSchemaPETMetadata setCountry:](v5, "setCountry:", v17);

    }
    v38 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("language"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[PETSchemaPETMetadata setLanguage:](v5, "setLanguage:", v19);

    }
    v33 = v18;
    v37 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setConfig_version:](v5, "setConfig_version:", objc_msgSend(v20, "unsignedIntValue"));
    v36 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pseudoDeviceId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[PETSchemaPETMetadata setPseudo_device_id:](v5, "setPseudo_device_id:", v22);

    }
    v35 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInternalCarry"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_internal_carry:](v5, "setIs_internal_carry:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isConfigEnabled"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_config_enabled:](v5, "setIs_config_enabled:", objc_msgSend(v24, "BOOLValue"));
    v34 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageGroup"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (void *)objc_msgSend(v25, "copy");
      -[PETSchemaPETMetadata setMessage_group:](v5, "setMessage_group:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("msgType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(v27, "copy");
      -[PETSchemaPETMetadata setMsg_type:](v5, "setMsg_type:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTestingData"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_testing_data:](v5, "setIs_testing_data:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTrialUpload"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PETSchemaPETMetadata setIs_trial_upload:](v5, "setIs_trial_upload:", objc_msgSend(v30, "BOOLValue"));
    v31 = v5;

  }
  return v5;
}

- (unint64_t)upload_time
{
  return self->_upload_time;
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)is_internal
{
  return self->_is_internal;
}

- (BOOL)is_seed
{
  return self->_is_seed;
}

- (BOOL)is_gm
{
  return self->_is_gm;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)config_version
{
  return self->_config_version;
}

- (NSString)pseudo_device_id
{
  return self->_pseudo_device_id;
}

- (void)setPseudo_device_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)is_internal_carry
{
  return self->_is_internal_carry;
}

- (BOOL)is_config_enabled
{
  return self->_is_config_enabled;
}

- (NSString)message_group
{
  return self->_message_group;
}

- (void)setMessage_group:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)msg_type
{
  return self->_msg_type;
}

- (void)setMsg_type:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)is_testing_data
{
  return self->_is_testing_data;
}

- (BOOL)is_trial_upload
{
  return self->_is_trial_upload;
}

- (void)setHasPlatform:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasDevice:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasCountry:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasLanguage:(BOOL)a3
{
  self->_hasPlatform = a3;
}

- (void)setHasPseudo_device_id:(BOOL)a3
{
  self->_hasDevice = a3;
}

- (void)setHasMessage_group:(BOOL)a3
{
  self->_hasBuild = a3;
}

- (void)setHasMsg_type:(BOOL)a3
{
  self->_hasCountry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msg_type, 0);
  objc_storeStrong((id *)&self->_message_group, 0);
  objc_storeStrong((id *)&self->_pseudo_device_id, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

@end
