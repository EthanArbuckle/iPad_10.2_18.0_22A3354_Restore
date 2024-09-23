@implementation SetupSchemaProvisionalSiriSetupEnded

- (void)setSiriEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_siriEnabled = a3;
}

- (BOOL)hasSiriEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSiriEnabled
{
  -[SetupSchemaProvisionalSiriSetupEnded setSiriEnabled:](self, "setSiriEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setDismissed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dismissed = a3;
}

- (BOOL)hasDismissed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDismissed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteDismissed
{
  -[SetupSchemaProvisionalSiriSetupEnded setDismissed:](self, "setDismissed:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $799191CF2D2912DAED893BA627C48EF2 has;
  int v6;
  int siriEnabled;
  int dismissed;
  BOOL v9;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[12];
  if ((v6 & 1) != (*(_BYTE *)&has & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    siriEnabled = self->_siriEnabled;
    if (siriEnabled != objc_msgSend(v4, "siriEnabled"))
    {
LABEL_10:
      v9 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[12];
  }
  if (((v6 ^ *(_DWORD *)&has) & 2) != 0)
    goto LABEL_10;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    dismissed = self->_dismissed;
    if (dismissed != objc_msgSend(v4, "dismissed"))
      goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_siriEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_dismissed;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SetupSchemaProvisionalSiriSetupEnded dismissed](self, "dismissed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dismissed"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SetupSchemaProvisionalSiriSetupEnded siriEnabled](self, "siriEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("siriEnabled"));

  }
  -[SetupSchemaProvisionalSiriSetupEnded willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SetupSchemaProvisionalSiriSetupEnded dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupEnded)initWithJSON:(id)a3
{
  void *v4;
  SetupSchemaProvisionalSiriSetupEnded *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[SetupSchemaProvisionalSiriSetupEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupEnded)initWithDictionary:(id)a3
{
  id v4;
  SetupSchemaProvisionalSiriSetupEnded *v5;
  void *v6;
  void *v7;
  SetupSchemaProvisionalSiriSetupEnded *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SetupSchemaProvisionalSiriSetupEnded;
  v5 = -[SetupSchemaProvisionalSiriSetupEnded init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SetupSchemaProvisionalSiriSetupEnded setSiriEnabled:](v5, "setSiriEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SetupSchemaProvisionalSiriSetupEnded setDismissed:](v5, "setDismissed:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

@end
