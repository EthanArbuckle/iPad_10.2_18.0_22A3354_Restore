@implementation ODDSiriSchemaODDDeviceSegment

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSegmentType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_segmentType = a3;
}

- (BOOL)hasSegmentType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSegmentType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSegmentType
{
  -[ODDSiriSchemaODDDeviceSegment setSegmentType:](self, "setSegmentType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSegmentDataAvailabilityState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_segmentDataAvailabilityState = a3;
}

- (BOOL)hasSegmentDataAvailabilityState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSegmentDataAvailabilityState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSegmentDataAvailabilityState
{
  -[ODDSiriSchemaODDDeviceSegment setSegmentDataAvailabilityState:](self, "setSegmentDataAvailabilityState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDeviceSegmentReadFrom(self, (uint64_t)a3);
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
  $02F4D335578A6ECA27C9E49D1443F8CC has;
  unsigned int v6;
  int segmentType;
  int v8;
  int segmentDataAvailabilityState;
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
    segmentType = self->_segmentType;
    if (segmentType != objc_msgSend(v4, "segmentType"))
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
    segmentDataAvailabilityState = self->_segmentDataAvailabilityState;
    if (segmentDataAvailabilityState != objc_msgSend(v4, "segmentDataAvailabilityState"))
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
    v2 = 2654435761 * self->_segmentType;
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
  v3 = 2654435761 * self->_segmentDataAvailabilityState;
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
    v5 = -[ODDSiriSchemaODDDeviceSegment segmentDataAvailabilityState](self, "segmentDataAvailabilityState");
    v6 = CFSTR("ODDDATAAVAILABILITYSTATE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("ODDDATAAVAILABILITYSTATE_COMPLETE");
    if (v5 == 2)
      v7 = CFSTR("ODDDATAAVAILABILITYSTATE_INSUFFICIENT_DATA");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("segmentDataAvailabilityState"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = -[ODDSiriSchemaODDDeviceSegment segmentType](self, "segmentType");
    v9 = CFSTR("ODDDEVICESEGMENTTYPE_UNKNOWN");
    if (v8 == 1)
      v9 = CFSTR("ODDDEVICESEGMENTTYPE_NONE");
    if (v8 == 2)
      v10 = CFSTR("ODDDEVICESEGMENTTYPE_ASSISTANT_2X3");
    else
      v10 = v9;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("segmentType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDDeviceSegment dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDDeviceSegment)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDDeviceSegment *v5;
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
    self = -[ODDSiriSchemaODDDeviceSegment initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDDeviceSegment)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDDeviceSegment *v5;
  void *v6;
  void *v7;
  ODDSiriSchemaODDDeviceSegment *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDDeviceSegment;
  v5 = -[ODDSiriSchemaODDDeviceSegment init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segmentType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceSegment setSegmentType:](v5, "setSegmentType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segmentDataAvailabilityState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDDeviceSegment setSegmentDataAvailabilityState:](v5, "setSegmentDataAvailabilityState:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)segmentType
{
  return self->_segmentType;
}

- (int)segmentDataAvailabilityState
{
  return self->_segmentDataAvailabilityState;
}

@end
