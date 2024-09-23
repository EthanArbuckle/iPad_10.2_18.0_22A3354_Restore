@implementation SISchemaActiveStatus

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
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SISchemaActiveStatus;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaActiveStatus audioDevicesActiveWithin24Hours](self, "audioDevicesActiveWithin24Hours", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaActiveStatus setAudioDevicesActiveWithin24Hours:](self, "setAudioDevicesActiveWithin24Hours:", v7);

  -[SISchemaActiveStatus carBluetoothHeadUnitsActiveWithinLast24Hours](self, "carBluetoothHeadUnitsActiveWithinLast24Hours");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SISchemaActiveStatus setCarBluetoothHeadUnitsActiveWithinLast24Hours:](self, "setCarBluetoothHeadUnitsActiveWithinLast24Hours:", v9);
  return v5;
}

- (void)clearAudioDevicesActiveWithin24Hours
{
  -[NSArray removeAllObjects](self->_audioDevicesActiveWithin24Hours, "removeAllObjects");
}

- (void)addAudioDevicesActiveWithin24Hours:(id)a3
{
  id v4;
  NSArray *audioDevicesActiveWithin24Hours;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioDevicesActiveWithin24Hours = self->_audioDevicesActiveWithin24Hours;
  v8 = v4;
  if (!audioDevicesActiveWithin24Hours)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioDevicesActiveWithin24Hours;
    self->_audioDevicesActiveWithin24Hours = v6;

    v4 = v8;
    audioDevicesActiveWithin24Hours = self->_audioDevicesActiveWithin24Hours;
  }
  -[NSArray addObject:](audioDevicesActiveWithin24Hours, "addObject:", v4);

}

- (unint64_t)audioDevicesActiveWithin24HoursCount
{
  return -[NSArray count](self->_audioDevicesActiveWithin24Hours, "count");
}

- (id)audioDevicesActiveWithin24HoursAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioDevicesActiveWithin24Hours, "objectAtIndexedSubscript:", a3);
}

- (void)setCarPlayActiveWithin24Hours:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_carPlayActiveWithin24Hours = a3;
}

- (BOOL)hasCarPlayActiveWithin24Hours
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCarPlayActiveWithin24Hours:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCarPlayActiveWithin24Hours
{
  -[SISchemaActiveStatus setCarPlayActiveWithin24Hours:](self, "setCarPlayActiveWithin24Hours:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearCarBluetoothHeadUnitsActiveWithinLast24Hours
{
  -[NSArray removeAllObjects](self->_carBluetoothHeadUnitsActiveWithinLast24Hours, "removeAllObjects");
}

- (void)addCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3
{
  id v4;
  NSArray *carBluetoothHeadUnitsActiveWithinLast24Hours;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  carBluetoothHeadUnitsActiveWithinLast24Hours = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  v8 = v4;
  if (!carBluetoothHeadUnitsActiveWithinLast24Hours)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
    self->_carBluetoothHeadUnitsActiveWithinLast24Hours = v6;

    v4 = v8;
    carBluetoothHeadUnitsActiveWithinLast24Hours = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  }
  -[NSArray addObject:](carBluetoothHeadUnitsActiveWithinLast24Hours, "addObject:", v4);

}

- (unint64_t)carBluetoothHeadUnitsActiveWithinLast24HoursCount
{
  return -[NSArray count](self->_carBluetoothHeadUnitsActiveWithinLast24Hours, "count");
}

- (id)carBluetoothHeadUnitsActiveWithinLast24HoursAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_carBluetoothHeadUnitsActiveWithinLast24Hours, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaActiveStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_audioDevicesActiveWithin24Hours;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

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
  int carPlayActiveWithin24Hours;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SISchemaActiveStatus audioDevicesActiveWithin24Hours](self, "audioDevicesActiveWithin24Hours");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDevicesActiveWithin24Hours");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SISchemaActiveStatus audioDevicesActiveWithin24Hours](self, "audioDevicesActiveWithin24Hours");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaActiveStatus audioDevicesActiveWithin24Hours](self, "audioDevicesActiveWithin24Hours");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioDevicesActiveWithin24Hours");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    carPlayActiveWithin24Hours = self->_carPlayActiveWithin24Hours;
    if (carPlayActiveWithin24Hours != objc_msgSend(v4, "carPlayActiveWithin24Hours"))
      goto LABEL_15;
  }
  -[SISchemaActiveStatus carBluetoothHeadUnitsActiveWithinLast24Hours](self, "carBluetoothHeadUnitsActiveWithinLast24Hours");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carBluetoothHeadUnitsActiveWithinLast24Hours");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaActiveStatus carBluetoothHeadUnitsActiveWithinLast24Hours](self, "carBluetoothHeadUnitsActiveWithinLast24Hours");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SISchemaActiveStatus carBluetoothHeadUnitsActiveWithinLast24Hours](self, "carBluetoothHeadUnitsActiveWithinLast24Hours");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carBluetoothHeadUnitsActiveWithinLast24Hours");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_audioDevicesActiveWithin24Hours, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_carPlayActiveWithin24Hours;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_carBluetoothHeadUnitsActiveWithinLast24Hours, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_audioDevicesActiveWithin24Hours, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = self->_audioDevicesActiveWithin24Hours;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("audioDevicesActiveWithin24Hours"));
  }
  if (-[NSArray count](self->_carBluetoothHeadUnitsActiveWithinLast24Hours, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("carBluetoothHeadUnitsActiveWithinLast24Hours"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaActiveStatus carPlayActiveWithin24Hours](self, "carPlayActiveWithin24Hours"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("carPlayActiveWithin24Hours"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v22);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaActiveStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaActiveStatus)initWithJSON:(id)a3
{
  void *v4;
  SISchemaActiveStatus *v5;
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
    self = -[SISchemaActiveStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaActiveStatus)initWithDictionary:(id)a3
{
  id v4;
  SISchemaActiveStatus *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SISchemaActiveAudioDevice *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SISchemaCarBluetoothHeadUnit *v22;
  SISchemaActiveStatus *v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SISchemaActiveStatus;
  v5 = -[SISchemaActiveStatus init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioDevicesActiveWithin24Hours"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v32;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v32 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[SISchemaActiveAudioDevice initWithDictionary:]([SISchemaActiveAudioDevice alloc], "initWithDictionary:", v12);
              -[SISchemaActiveStatus addAudioDevicesActiveWithin24Hours:](v5, "addAudioDevicesActiveWithin24Hours:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v9);
      }

      v6 = v26;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayActiveWithin24Hours"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaActiveStatus setCarPlayActiveWithin24Hours:](v5, "setCarPlayActiveWithin24Hours:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carBluetoothHeadUnitsActiveWithinLast24Hours"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v4;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[SISchemaCarBluetoothHeadUnit initWithDictionary:]([SISchemaCarBluetoothHeadUnit alloc], "initWithDictionary:", v21);
              -[SISchemaActiveStatus addCarBluetoothHeadUnitsActiveWithinLast24Hours:](v5, "addCarBluetoothHeadUnitsActiveWithinLast24Hours:", v22);

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v18);
      }

      v4 = v25;
      v6 = v26;
    }
    v23 = v5;

  }
  return v5;
}

- (NSArray)audioDevicesActiveWithin24Hours
{
  return self->_audioDevicesActiveWithin24Hours;
}

- (void)setAudioDevicesActiveWithin24Hours:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)carPlayActiveWithin24Hours
{
  return self->_carPlayActiveWithin24Hours;
}

- (NSArray)carBluetoothHeadUnitsActiveWithinLast24Hours
{
  return self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
}

- (void)setCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carBluetoothHeadUnitsActiveWithinLast24Hours, 0);
  objc_storeStrong((id *)&self->_audioDevicesActiveWithin24Hours, 0);
}

@end
