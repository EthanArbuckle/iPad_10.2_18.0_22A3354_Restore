@implementation COMAPPLEPETCOMMONPETMetadata

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
  *(_WORD *)&self->_has |= 0x40u;
  self->_isInternal = a3;
}

- (void)setHasIsInternal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsInternal
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsSeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSeed = a3;
}

- (void)setHasIsSeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSeed
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsGm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isGm = a3;
}

- (void)setHasIsGm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsGm
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  *(_WORD *)&self->_has |= 0x80u;
  self->_isInternalCarry = a3;
}

- (void)setHasIsInternalCarry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsInternalCarry
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isConfigEnabled = a3;
}

- (void)setHasIsConfigEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsConfigEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasMessageGroup
{
  return self->_messageGroup != 0;
}

- (int)uploadService
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_uploadService;
  else
    return 0;
}

- (void)setUploadService:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uploadService = a3;
}

- (void)setHasUploadService:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasUploadService
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)uploadServiceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2A41370[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUploadService:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PET_UPLOAD_SERVICE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PET_UPLOAD_SERVICE_PARSEC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PET_UPLOAD_SERVICE_LDCP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PET_UPLOAD_SERVICE_PFA")))
  {
    v4 = 3;
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

- (void)setTypeId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_typeId = a3;
}

- (void)setHasTypeId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTypeId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasMessageName
{
  return self->_messageName != 0;
}

- (void)setIsTestingData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTestingData = a3;
}

- (void)setHasIsTestingData:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTestingData
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsTrialUpload:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isTrialUpload = a3;
}

- (void)setHasIsTrialUpload:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsTrialUpload
{
  return (*(_WORD *)&self->_has >> 10) & 1;
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
  v8.super_class = (Class)COMAPPLEPETCOMMONPETMetadata;
  -[COMAPPLEPETCOMMONPETMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPETCOMMONPETMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v23;
  NSString *messageName;
  __int16 v25;
  void *v26;
  void *v27;

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
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternal);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("is_internal"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSeed);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_seed"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
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
  if ((v14 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternalCarry);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("is_internal_carry"));

    v14 = (__int16)self->_has;
  }
  if ((v14 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConfigEnabled);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_config_enabled"));

  }
  messageGroup = self->_messageGroup;
  if (messageGroup)
    objc_msgSend(v3, "setObject:forKey:", messageGroup, CFSTR("message_group"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uploadService = self->_uploadService;
    if (uploadService >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uploadService);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E2A41370[uploadService];
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("upload_service"));

  }
  uploadIdentifier = self->_uploadIdentifier;
  if (uploadIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uploadIdentifier, CFSTR("upload_identifier"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_typeId);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("type_id"));

  }
  messageName = self->_messageName;
  if (messageName)
    objc_msgSend(v3, "setObject:forKey:", messageName, CFSTR("message_name"));
  v25 = (__int16)self->_has;
  if ((v25 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTestingData);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("is_testing_data"));

    v25 = (__int16)self->_has;
  }
  if ((v25 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTrialUpload);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("is_trial_upload"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPETCOMMONPETMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
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
  if ((v6 & 0x200) != 0)
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
  if ((v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_25:
      if ((v7 & 0x10) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
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
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
  if (self->_uploadIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_messageName)
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
    *((_WORD *)v4 + 58) |= 1u;
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
  if ((has & 0x40) != 0)
  {
    *((_BYTE *)v4 + 110) = self->_isInternal;
    *((_WORD *)v4 + 58) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 112) = self->_isSeed;
  *((_WORD *)v4 + 58) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 109) = self->_isGm;
    *((_WORD *)v4 + 58) |= 0x20u;
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
    *((_WORD *)v4 + 58) |= 2u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 113) = self->_isTestingData;
    *((_WORD *)v4 + 58) |= 0x200u;
  }
  if (self->_pseudoDeviceId)
  {
    objc_msgSend(v8, "setPseudoDeviceId:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 114) = self->_isTrialUpload;
    *((_WORD *)v4 + 58) |= 0x400u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_25:
      if ((v7 & 0x10) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  *((_BYTE *)v4 + 111) = self->_isInternalCarry;
  *((_WORD *)v4 + 58) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_26:
    *((_BYTE *)v4 + 108) = self->_isConfigEnabled;
    *((_WORD *)v4 + 58) |= 0x10u;
  }
LABEL_27:
  if (self->_messageGroup)
  {
    objc_msgSend(v8, "setMessageGroup:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_uploadService;
    *((_WORD *)v4 + 58) |= 8u;
  }
  if (self->_uploadIdentifier)
  {
    objc_msgSend(v8, "setUploadIdentifier:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_typeId;
    *((_WORD *)v4 + 58) |= 4u;
  }
  if (self->_messageName)
  {
    objc_msgSend(v8, "setMessageName:");
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
  uint64_t v26;
  void *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_uploadTime;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_platform, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v7;

  v9 = -[NSString copyWithZone:](self->_device, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 110) = self->_isInternal;
    *(_WORD *)(v6 + 116) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 112) = self->_isSeed;
  *(_WORD *)(v6 + 116) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 109) = self->_isGm;
    *(_WORD *)(v6 + 116) |= 0x20u;
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
    *(_WORD *)(v6 + 116) |= 2u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 113) = self->_isTestingData;
    *(_WORD *)(v6 + 116) |= 0x200u;
  }
  v19 = -[NSString copyWithZone:](self->_pseudoDeviceId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v19;

  v21 = (__int16)self->_has;
  if ((v21 & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 114) = self->_isTrialUpload;
    *(_WORD *)(v6 + 116) |= 0x400u;
    v21 = (__int16)self->_has;
    if ((v21 & 0x80) == 0)
    {
LABEL_13:
      if ((v21 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v21 & 0x80) == 0)
  {
    goto LABEL_13;
  }
  *(_BYTE *)(v6 + 111) = self->_isInternalCarry;
  *(_WORD *)(v6 + 116) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *(_BYTE *)(v6 + 108) = self->_isConfigEnabled;
    *(_WORD *)(v6 + 116) |= 0x10u;
  }
LABEL_15:
  v22 = -[NSString copyWithZone:](self->_messageGroup, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v22;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_uploadService;
    *(_WORD *)(v6 + 116) |= 8u;
  }
  v24 = -[NSString copyWithZone:](self->_uploadIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v24;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_typeId;
    *(_WORD *)(v6 + 116) |= 4u;
  }
  v26 = -[NSString copyWithZone:](self->_messageName, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v26;

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
  NSString *messageName;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_99;
  v5 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_uploadTime != *((_QWORD *)v4 + 1))
      goto LABEL_99;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_99;
  }
  platform = self->_platform;
  if ((unint64_t)platform | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](platform, "isEqual:"))
    goto LABEL_99;
  device = self->_device;
  if ((unint64_t)device | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](device, "isEqual:"))
      goto LABEL_99;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_99;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 58);
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0)
      goto LABEL_99;
    if (self->_isInternal)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0)
      goto LABEL_99;
    if (self->_isSeed)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_99;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_99;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0)
      goto LABEL_99;
    if (self->_isGm)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_99;
  }
  country = self->_country;
  if ((unint64_t)country | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](country, "isEqual:"))
    goto LABEL_99;
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_99;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 58);
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_configVersion != *((_DWORD *)v4 + 6))
      goto LABEL_99;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0)
      goto LABEL_99;
    if (self->_isTestingData)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_99;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_99;
  }
  pseudoDeviceId = self->_pseudoDeviceId;
  if ((unint64_t)pseudoDeviceId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](pseudoDeviceId, "isEqual:"))
      goto LABEL_99;
    v13 = (__int16)self->_has;
    v14 = *((_WORD *)v4 + 58);
  }
  if ((v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0)
      goto LABEL_99;
    if (self->_isTrialUpload)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_99;
    }
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_99;
  }
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0)
      goto LABEL_99;
    if (self->_isInternalCarry)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_99;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_99;
  }
  if ((v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0)
      goto LABEL_99;
    if (self->_isConfigEnabled)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_99;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_99;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_99;
  }
  messageGroup = self->_messageGroup;
  if ((unint64_t)messageGroup | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](messageGroup, "isEqual:"))
      goto LABEL_99;
    v13 = (__int16)self->_has;
    v14 = *((_WORD *)v4 + 58);
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_uploadService != *((_DWORD *)v4 + 26))
      goto LABEL_99;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_99;
  }
  uploadIdentifier = self->_uploadIdentifier;
  if ((unint64_t)uploadIdentifier | *((_QWORD *)v4 + 12))
  {
    if (-[NSString isEqual:](uploadIdentifier, "isEqual:"))
    {
      v13 = (__int16)self->_has;
      v14 = *((_WORD *)v4 + 58);
      goto LABEL_92;
    }
LABEL_99:
    v19 = 0;
    goto LABEL_100;
  }
LABEL_92:
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_typeId != *((_DWORD *)v4 + 22))
      goto LABEL_99;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_99;
  }
  messageName = self->_messageName;
  if ((unint64_t)messageName | *((_QWORD *)v4 + 8))
    v19 = -[NSString isEqual:](messageName, "isEqual:");
  else
    v19 = 1;
LABEL_100:

  return v19;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  NSUInteger v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;

  if ((*(_WORD *)&self->_has & 1) != 0)
    v25 = 2654435761u * self->_uploadTime;
  else
    v25 = 0;
  v24 = -[NSString hash](self->_platform, "hash");
  v23 = -[NSString hash](self->_device, "hash");
  v22 = -[NSString hash](self->_build, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    v21 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
LABEL_9:
    v20 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v21 = 2654435761 * self->_isInternal;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_9;
LABEL_6:
  v20 = 2654435761 * self->_isSeed;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_isGm;
    goto LABEL_11;
  }
LABEL_10:
  v19 = 0;
LABEL_11:
  v18 = -[NSString hash](self->_country, "hash");
  v17 = -[NSString hash](self->_language, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v15 = 2654435761 * self->_configVersion;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_13;
  }
  else
  {
    v15 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_13:
      v4 = 2654435761 * self->_isTestingData;
      goto LABEL_16;
    }
  }
  v4 = 0;
LABEL_16:
  v5 = -[NSString hash](self->_pseudoDeviceId, "hash", v15);
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
    v7 = 0;
    if ((v6 & 0x80) != 0)
      goto LABEL_18;
LABEL_21:
    v8 = 0;
    if ((v6 & 0x10) != 0)
      goto LABEL_19;
    goto LABEL_22;
  }
  v7 = 2654435761 * self->_isTrialUpload;
  if ((v6 & 0x80) == 0)
    goto LABEL_21;
LABEL_18:
  v8 = 2654435761 * self->_isInternalCarry;
  if ((v6 & 0x10) != 0)
  {
LABEL_19:
    v9 = 2654435761 * self->_isConfigEnabled;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
LABEL_23:
  v10 = -[NSString hash](self->_messageGroup, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_uploadService;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_uploadIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_typeId;
  else
    v13 = 0;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_messageName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  if ((*((_WORD *)v4 + 58) & 1) != 0)
  {
    self->_uploadTime = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[COMAPPLEPETCOMMONPETMetadata setPlatform:](self, "setPlatform:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[COMAPPLEPETCOMMONPETMetadata setDevice:](self, "setDevice:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[COMAPPLEPETCOMMONPETMetadata setBuild:](self, "setBuild:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x40) != 0)
  {
    self->_isInternal = *((_BYTE *)v4 + 110);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x100) == 0)
    {
LABEL_11:
      if ((v5 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) == 0)
  {
    goto LABEL_11;
  }
  self->_isSeed = *((_BYTE *)v4 + 112);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 58) & 0x20) != 0)
  {
LABEL_12:
    self->_isGm = *((_BYTE *)v4 + 109);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 4))
  {
    -[COMAPPLEPETCOMMONPETMetadata setCountry:](self, "setCountry:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[COMAPPLEPETCOMMONPETMetadata setLanguage:](self, "setLanguage:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 2) != 0)
  {
    self->_configVersion = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 2u;
    v6 = *((_WORD *)v4 + 58);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_isTestingData = *((_BYTE *)v4 + 113);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[COMAPPLEPETCOMMONPETMetadata setPseudoDeviceId:](self, "setPseudoDeviceId:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 0x400) != 0)
  {
    self->_isTrialUpload = *((_BYTE *)v4 + 114);
    *(_WORD *)&self->_has |= 0x400u;
    v7 = *((_WORD *)v4 + 58);
    if ((v7 & 0x80) == 0)
    {
LABEL_25:
      if ((v7 & 0x10) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  self->_isInternalCarry = *((_BYTE *)v4 + 111);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 58) & 0x10) != 0)
  {
LABEL_26:
    self->_isConfigEnabled = *((_BYTE *)v4 + 108);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_27:
  if (*((_QWORD *)v4 + 7))
  {
    -[COMAPPLEPETCOMMONPETMetadata setMessageGroup:](self, "setMessageGroup:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 58) & 8) != 0)
  {
    self->_uploadService = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[COMAPPLEPETCOMMONPETMetadata setUploadIdentifier:](self, "setUploadIdentifier:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 58) & 4) != 0)
  {
    self->_typeId = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[COMAPPLEPETCOMMONPETMetadata setMessageName:](self, "setMessageName:");
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

- (unsigned)typeId
{
  return self->_typeId;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (void)setMessageName:(id)a3
{
  objc_storeStrong((id *)&self->_messageName, a3);
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
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
