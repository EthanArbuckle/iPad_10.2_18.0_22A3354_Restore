@implementation PETMetadata

- (void)setUploadTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uploadTime = a3;
}

- (void)setHasUploadTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasUploadTime
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
}

- (BOOL)hasDevice
{
  return self->_device != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)setIsInternal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isInternal = a3;
}

- (void)setHasIsInternal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsInternal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsSeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isSeed = a3;
}

- (void)setHasIsSeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsSeed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsGm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isGm = a3;
}

- (void)setHasIsGm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsGm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setConfigVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_configVersion = a3;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConfigVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasPseudoDeviceId
{
  return self->_pseudoDeviceId != 0;
}

- (void)setIsInternalCarry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isInternalCarry = a3;
}

- (void)setHasIsInternalCarry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsInternalCarry
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isConfigEnabled = a3;
}

- (void)setHasIsConfigEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsConfigEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasMessageGroup
{
  return self->_messageGroup != 0;
}

- (int)uploadService
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_uploadService;
  else
    return 0;
}

- (void)setUploadService:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uploadService = a3;
}

- (void)setHasUploadService:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasUploadService
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)uploadServiceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2A41188[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUploadService:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSEC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LDCP")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasUploadIdentifier
{
  return self->_uploadIdentifier != 0;
}

- (void)setIsTestingData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isTestingData = a3;
}

- (void)setHasIsTestingData:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsTestingData
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsTrialUpload:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTrialUpload = a3;
}

- (void)setHasIsTrialUpload:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTrialUpload
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  v8.super_class = (Class)PETMetadata;
  -[PETMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *platform;
  NSString *device;
  NSString *build;
  __int16 has;
  void *v9;
  NSString *country;
  NSString *language;
  void *v12;
  NSString *pseudoDeviceId;
  __int16 v14;
  void *v15;
  void *v16;
  NSString *messageGroup;
  uint64_t uploadService;
  __CFString *v19;
  void *v20;
  void *v21;
  NSString *uploadIdentifier;
  __int16 v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uploadTime);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("upload_time"));

  }
  platform = self->_platform;
  if (platform)
    objc_msgSend(v3, "setObject:forKey:", platform, CFSTR("platform"));
  device = self->_device;
  if (device)
    objc_msgSend(v3, "setObject:forKey:", device, CFSTR("device"));
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternal);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("is_internal"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSeed);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_seed"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGm);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("is_gm"));

  }
LABEL_13:
  country = self->_country;
  if (country)
    objc_msgSend(v3, "setObject:forKey:", country, CFSTR("country"));
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_configVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("config_version"));

  }
  pseudoDeviceId = self->_pseudoDeviceId;
  if (pseudoDeviceId)
    objc_msgSend(v3, "setObject:forKey:", pseudoDeviceId, CFSTR("pseudo_device_id"));
  v14 = (__int16)self->_has;
  if ((v14 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternalCarry);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("is_internal_carry"));

    v14 = (__int16)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConfigEnabled);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_config_enabled"));

  }
  messageGroup = self->_messageGroup;
  if (messageGroup)
    objc_msgSend(v3, "setObject:forKey:", messageGroup, CFSTR("message_group"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    uploadService = self->_uploadService;
    if (uploadService >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uploadService);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E2A41188[uploadService];
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("upload_service"));

  }
  uploadIdentifier = self->_uploadIdentifier;
  if (uploadIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uploadIdentifier, CFSTR("upload_identifier"));
  v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTestingData);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("is_testing_data"));

    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTrialUpload);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("is_trial_upload"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PETMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
  if (self->_platform)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_device)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_13:
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_pseudoDeviceId)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_27:
  if (self->_messageGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_uploadIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  _QWORD *v8;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v4[1] = self->_uploadTime;
    *((_WORD *)v4 + 50) |= 1u;
  }
  v8 = v4;
  if (self->_platform)
  {
    objc_msgSend(v4, "setPlatform:");
    v4 = v8;
  }
  if (self->_device)
  {
    objc_msgSend(v8, "setDevice:");
    v4 = v8;
  }
  if (self->_build)
  {
    objc_msgSend(v8, "setBuild:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 94) = self->_isInternal;
    *((_WORD *)v4 + 50) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 96) = self->_isSeed;
  *((_WORD *)v4 + 50) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 93) = self->_isGm;
    *((_WORD *)v4 + 50) |= 0x10u;
  }
LABEL_13:
  if (self->_country)
  {
    objc_msgSend(v8, "setCountry:");
    v4 = v8;
  }
  if (self->_language)
  {
    objc_msgSend(v8, "setLanguage:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_configVersion;
    *((_WORD *)v4 + 50) |= 2u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((_BYTE *)v4 + 97) = self->_isTestingData;
    *((_WORD *)v4 + 50) |= 0x100u;
  }
  if (self->_pseudoDeviceId)
  {
    objc_msgSend(v8, "setPseudoDeviceId:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 98) = self->_isTrialUpload;
    *((_WORD *)v4 + 50) |= 0x200u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  *((_BYTE *)v4 + 95) = self->_isInternalCarry;
  *((_WORD *)v4 + 50) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    *((_BYTE *)v4 + 92) = self->_isConfigEnabled;
    *((_WORD *)v4 + 50) |= 8u;
  }
LABEL_27:
  if (self->_messageGroup)
  {
    objc_msgSend(v8, "setMessageGroup:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_uploadService;
    *((_WORD *)v4 + 50) |= 4u;
  }
  if (self->_uploadIdentifier)
  {
    objc_msgSend(v8, "setUploadIdentifier:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_uploadTime;
    *(_WORD *)(v5 + 100) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_platform, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  v9 = -[NSString copyWithZone:](self->_device, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 94) = self->_isInternal;
    *(_WORD *)(v6 + 100) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 96) = self->_isSeed;
  *(_WORD *)(v6 + 100) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 93) = self->_isGm;
    *(_WORD *)(v6 + 100) |= 0x10u;
  }
LABEL_7:
  v14 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_configVersion;
    *(_WORD *)(v6 + 100) |= 2u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 97) = self->_isTestingData;
    *(_WORD *)(v6 + 100) |= 0x100u;
  }
  v19 = -[NSString copyWithZone:](self->_pseudoDeviceId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v19;

  v21 = (__int16)self->_has;
  if ((v21 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 98) = self->_isTrialUpload;
    *(_WORD *)(v6 + 100) |= 0x200u;
    v21 = (__int16)self->_has;
    if ((v21 & 0x40) == 0)
    {
LABEL_13:
      if ((v21 & 8) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  *(_BYTE *)(v6 + 95) = self->_isInternalCarry;
  *(_WORD *)(v6 + 100) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_14:
    *(_BYTE *)(v6 + 92) = self->_isConfigEnabled;
    *(_WORD *)(v6 + 100) |= 8u;
  }
LABEL_15:
  v22 = -[NSString copyWithZone:](self->_messageGroup, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v22;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_uploadService;
    *(_WORD *)(v6 + 100) |= 4u;
  }
  v24 = -[NSString copyWithZone:](self->_uploadIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *platform;
  NSString *device;
  NSString *build;
  __int16 has;
  __int16 v10;
  NSString *country;
  NSString *language;
  __int16 v13;
  __int16 v14;
  NSString *pseudoDeviceId;
  NSString *messageGroup;
  NSString *uploadIdentifier;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  v5 = *((_WORD *)v4 + 50);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_uploadTime != *((_QWORD *)v4 + 1))
      goto LABEL_91;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_91;
  }
  platform = self->_platform;
  if ((unint64_t)platform | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](platform, "isEqual:"))
    goto LABEL_91;
  device = self->_device;
  if ((unint64_t)device | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](device, "isEqual:"))
      goto LABEL_91;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_91;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 50);
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0)
      goto LABEL_91;
    if (self->_isInternal)
    {
      if (!*((_BYTE *)v4 + 94))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 94))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0)
      goto LABEL_91;
    if (self->_isSeed)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0)
      goto LABEL_91;
    if (self->_isGm)
    {
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 93))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  country = self->_country;
  if ((unint64_t)country | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](country, "isEqual:"))
    goto LABEL_91;
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_91;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 50);
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_configVersion != *((_DWORD *)v4 + 6))
      goto LABEL_91;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0)
      goto LABEL_91;
    if (self->_isTestingData)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  pseudoDeviceId = self->_pseudoDeviceId;
  if ((unint64_t)pseudoDeviceId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](pseudoDeviceId, "isEqual:"))
      goto LABEL_91;
    v13 = (__int16)self->_has;
    v14 = *((_WORD *)v4 + 50);
  }
  if ((v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0)
      goto LABEL_91;
    if (self->_isTrialUpload)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0)
      goto LABEL_91;
    if (self->_isInternalCarry)
    {
      if (!*((_BYTE *)v4 + 95))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 95))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0)
      goto LABEL_91;
    if (self->_isConfigEnabled)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_91;
  }
  messageGroup = self->_messageGroup;
  if (!((unint64_t)messageGroup | *((_QWORD *)v4 + 7)))
    goto LABEL_84;
  if (!-[NSString isEqual:](messageGroup, "isEqual:"))
  {
LABEL_91:
    v18 = 0;
    goto LABEL_92;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 50);
LABEL_84:
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_uploadService != *((_DWORD *)v4 + 22))
      goto LABEL_91;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_91;
  }
  uploadIdentifier = self->_uploadIdentifier;
  if ((unint64_t)uploadIdentifier | *((_QWORD *)v4 + 10))
    v18 = -[NSString isEqual:](uploadIdentifier, "isEqual:");
  else
    v18 = 1;
LABEL_92:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  unint64_t v22;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v22 = 2654435761u * self->_uploadTime;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_platform, "hash");
  v20 = -[NSString hash](self->_device, "hash");
  v19 = -[NSString hash](self->_build, "hash");
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    v18 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_6;
LABEL_9:
    v17 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v18 = 2654435761 * self->_isInternal;
  if ((has & 0x80) == 0)
    goto LABEL_9;
LABEL_6:
  v17 = 2654435761 * self->_isSeed;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v16 = 2654435761 * self->_isGm;
    goto LABEL_11;
  }
LABEL_10:
  v16 = 0;
LABEL_11:
  v15 = -[NSString hash](self->_country, "hash");
  v4 = -[NSString hash](self->_language, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_configVersion;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
  }
  else
  {
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_13:
      v6 = 2654435761 * self->_isTestingData;
      goto LABEL_16;
    }
  }
  v6 = 0;
LABEL_16:
  v7 = -[NSString hash](self->_pseudoDeviceId, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
    v9 = 0;
    if ((v8 & 0x40) != 0)
      goto LABEL_18;
LABEL_21:
    v10 = 0;
    if ((v8 & 8) != 0)
      goto LABEL_19;
    goto LABEL_22;
  }
  v9 = 2654435761 * self->_isTrialUpload;
  if ((v8 & 0x40) == 0)
    goto LABEL_21;
LABEL_18:
  v10 = 2654435761 * self->_isInternalCarry;
  if ((v8 & 8) != 0)
  {
LABEL_19:
    v11 = 2654435761 * self->_isConfigEnabled;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
LABEL_23:
  v12 = -[NSString hash](self->_messageGroup, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_uploadService;
  else
    v13 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_uploadIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  if ((*((_WORD *)v4 + 50) & 1) != 0)
  {
    self->_uploadTime = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[PETMetadata setPlatform:](self, "setPlatform:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PETMetadata setDevice:](self, "setDevice:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PETMetadata setBuild:](self, "setBuild:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x20) != 0)
  {
    self->_isInternal = *((_BYTE *)v4 + 94);
    *(_WORD *)&self->_has |= 0x20u;
    v5 = *((_WORD *)v4 + 50);
    if ((v5 & 0x80) == 0)
    {
LABEL_11:
      if ((v5 & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  self->_isSeed = *((_BYTE *)v4 + 96);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
LABEL_12:
    self->_isGm = *((_BYTE *)v4 + 93);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 4))
  {
    -[PETMetadata setCountry:](self, "setCountry:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PETMetadata setLanguage:](self, "setLanguage:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 50);
  if ((v6 & 2) != 0)
  {
    self->_configVersion = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 2u;
    v6 = *((_WORD *)v4 + 50);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_isTestingData = *((_BYTE *)v4 + 97);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PETMetadata setPseudoDeviceId:](self, "setPseudoDeviceId:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x200) != 0)
  {
    self->_isTrialUpload = *((_BYTE *)v4 + 98);
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)v4 + 50);
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  self->_isInternalCarry = *((_BYTE *)v4 + 95);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 50) & 8) != 0)
  {
LABEL_26:
    self->_isConfigEnabled = *((_BYTE *)v4 + 92);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_27:
  if (*((_QWORD *)v4 + 7))
  {
    -[PETMetadata setMessageGroup:](self, "setMessageGroup:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 50) & 4) != 0)
  {
    self->_uploadService = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PETMetadata setUploadIdentifier:](self, "setUploadIdentifier:");
    v4 = v8;
  }

}

- (unint64_t)uploadTime
{
  return self->_uploadTime;
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)isSeed
{
  return self->_isSeed;
}

- (BOOL)isGm
{
  return self->_isGm;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (unsigned)configVersion
{
  return self->_configVersion;
}

- (NSString)pseudoDeviceId
{
  return self->_pseudoDeviceId;
}

- (void)setPseudoDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_pseudoDeviceId, a3);
}

- (BOOL)isInternalCarry
{
  return self->_isInternalCarry;
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (NSString)messageGroup
{
  return self->_messageGroup;
}

- (void)setMessageGroup:(id)a3
{
  objc_storeStrong((id *)&self->_messageGroup, a3);
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (void)setUploadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uploadIdentifier, a3);
}

- (BOOL)isTestingData
{
  return self->_isTestingData;
}

- (BOOL)isTrialUpload
{
  return self->_isTrialUpload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
  objc_storeStrong((id *)&self->_pseudoDeviceId, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
