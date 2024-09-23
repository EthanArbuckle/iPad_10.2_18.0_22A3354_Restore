@implementation SISchemaBluetoothCarPreferredAudioRouteChanged

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setBefore:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_before = a3;
}

- (BOOL)hasBefore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBefore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteBefore
{
  -[SISchemaBluetoothCarPreferredAudioRouteChanged setBefore:](self, "setBefore:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAfter:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_after = a3;
}

- (BOOL)hasAfter
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAfter
{
  -[SISchemaBluetoothCarPreferredAudioRouteChanged setAfter:](self, "setAfter:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaBluetoothCarPreferredAudioRouteChangedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $43FB4E6D12EE2CED69525A5FE2200D2F has;
  unsigned int v6;
  int before;
  int v8;
  int after;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    before = self->_before;
    if (before != objc_msgSend(v4, "before"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    after = self->_after;
    if (after != objc_msgSend(v4, "after"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_before;
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
  v3 = 2654435761 * self->_after;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[SISchemaBluetoothCarPreferredAudioRouteChanged after](self, "after");
    if (v5 == 1)
      v6 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_A2DP");
    else
      v6 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_HFP");
    if (v5 == 2)
      v7 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_DEVICE_SPEAKER");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("after"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = -[SISchemaBluetoothCarPreferredAudioRouteChanged before](self, "before");
    if (v8 == 1)
      v9 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_A2DP");
    else
      v9 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_HFP");
    if (v8 == 2)
      v10 = CFSTR("BLUETOOTHCARPREFERREDAUDIOROUTE_DEVICE_SPEAKER");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("before"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaBluetoothCarPreferredAudioRouteChanged dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithJSON:(id)a3
{
  void *v4;
  SISchemaBluetoothCarPreferredAudioRouteChanged *v5;
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
    self = -[SISchemaBluetoothCarPreferredAudioRouteChanged initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaBluetoothCarPreferredAudioRouteChanged)initWithDictionary:(id)a3
{
  id v4;
  SISchemaBluetoothCarPreferredAudioRouteChanged *v5;
  void *v6;
  void *v7;
  SISchemaBluetoothCarPreferredAudioRouteChanged *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaBluetoothCarPreferredAudioRouteChanged;
  v5 = -[SISchemaBluetoothCarPreferredAudioRouteChanged init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("before"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaBluetoothCarPreferredAudioRouteChanged setBefore:](v5, "setBefore:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("after"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaBluetoothCarPreferredAudioRouteChanged setAfter:](v5, "setAfter:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)before
{
  return self->_before;
}

- (int)after
{
  return self->_after;
}

@end
