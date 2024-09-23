@implementation SISchemaVersion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerelease, 0);
}

- (void)setPatch:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_patch = a3;
}

- (void)setMinor:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minor = a3;
}

- (void)setMajor:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_major = a3;
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  -[SISchemaVersion prerelease](self, "prerelease");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (NSString)prerelease
{
  return self->_prerelease;
}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasMajor
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMajor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMajor
{
  -[SISchemaVersion setMajor:](self, "setMajor:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasMinor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMinor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMinor
{
  -[SISchemaVersion setMinor:](self, "setMinor:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasPatch
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePatch
{
  -[SISchemaVersion setPatch:](self, "setPatch:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasPrerelease
{
  return self->_prerelease != 0;
}

- (void)deletePrerelease
{
  -[SISchemaVersion setPrerelease:](self, "setPrerelease:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVersionReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2CD5129B3692A3D0A2ED2AD034419021 has;
  unsigned int v6;
  unsigned int major;
  int v8;
  unsigned int minor;
  int v10;
  unsigned int patch;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    major = self->_major;
    if (major != objc_msgSend(v4, "major"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      minor = self->_minor;
      if (minor != objc_msgSend(v4, "minor"))
        goto LABEL_18;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10 || (patch = self->_patch, patch == objc_msgSend(v4, "patch")))
      {
        -[SISchemaVersion prerelease](self, "prerelease");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "prerelease");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          -[SISchemaVersion prerelease](self, "prerelease");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

LABEL_21:
            v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          -[SISchemaVersion prerelease](self, "prerelease");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "prerelease");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
      }
    }
  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_prerelease, "hash");
  }
  v2 = 2654435761 * self->_major;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_minor;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_patch;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_prerelease, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaVersion major](self, "major"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("major"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaVersion minor](self, "minor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("minor"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaVersion patch](self, "patch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("patch"));

  }
LABEL_5:
  if (self->_prerelease)
  {
    -[SISchemaVersion prerelease](self, "prerelease");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("prerelease"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaVersion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaVersion)initWithJSON:(id)a3
{
  void *v4;
  SISchemaVersion *v5;
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
    self = -[SISchemaVersion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaVersion)initWithDictionary:(id)a3
{
  id v4;
  SISchemaVersion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaVersion *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaVersion;
  v5 = -[SISchemaVersion init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("major"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVersion setMajor:](v5, "setMajor:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVersion setMinor:](v5, "setMinor:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaVersion setPatch:](v5, "setPatch:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prerelease"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SISchemaVersion setPrerelease:](v5, "setPrerelease:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unsigned)major
{
  return self->_major;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)patch
{
  return self->_patch;
}

- (void)setPrerelease:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasPrerelease:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

@end
