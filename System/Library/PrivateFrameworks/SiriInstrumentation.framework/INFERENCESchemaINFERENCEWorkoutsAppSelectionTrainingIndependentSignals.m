@implementation INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals deleteCommonIndependent](self, "deleteCommonIndependent");
  return v5;
}

- (BOOL)hasCommonIndependent
{
  return self->_commonIndependent != 0;
}

- (void)deleteCommonIndependent
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setCommonIndependent:](self, "setCommonIndependent:", 0);
}

- (void)setNowPlayingState:(int)a3
{
  *(&self->_isIndoorWorkout + 1) |= 1u;
  self->_nowPlayingState = a3;
}

- (BOOL)hasNowPlayingState
{
  return *(&self->_isIndoorWorkout + 1);
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFE | a3;
}

- (void)deleteNowPlayingState
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setNowPlayingState:](self, "setNowPlayingState:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~1u;
}

- (void)setDeviceMotionState:(int)a3
{
  *(&self->_isIndoorWorkout + 1) |= 2u;
  self->_deviceMotionState = a3;
}

- (BOOL)hasDeviceMotionState
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 1) & 1;
}

- (void)setHasDeviceMotionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFD | v3;
}

- (void)deleteDeviceMotionState
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setDeviceMotionState:](self, "setDeviceMotionState:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~2u;
}

- (void)setIsDeviceLockStatus:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 4u;
  self->_isDeviceLockStatus = a3;
}

- (BOOL)hasIsDeviceLockStatus
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 2) & 1;
}

- (void)setHasIsDeviceLockStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFB | v3;
}

- (void)deleteIsDeviceLockStatus
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsDeviceLockStatus:](self, "setIsDeviceLockStatus:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~4u;
}

- (void)setIsMobileDataOn:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 8u;
  self->_isMobileDataOn = a3;
}

- (BOOL)hasIsMobileDataOn
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 3) & 1;
}

- (void)setHasIsMobileDataOn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xF7 | v3;
}

- (void)deleteIsMobileDataOn
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsMobileDataOn:](self, "setIsMobileDataOn:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~8u;
}

- (void)setIsWifiOn:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 0x10u;
  self->_isWifiOn = a3;
}

- (BOOL)hasIsWifiOn
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 4) & 1;
}

- (void)setHasIsWifiOn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xEF | v3;
}

- (void)deleteIsWifiOn
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsWifiOn:](self, "setIsWifiOn:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~0x10u;
}

- (void)setWorkoutType:(int)a3
{
  *(&self->_isIndoorWorkout + 1) |= 0x20u;
  self->_workoutType = a3;
}

- (BOOL)hasWorkoutType
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 5) & 1;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xDF | v3;
}

- (void)deleteWorkoutType
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setWorkoutType:](self, "setWorkoutType:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~0x20u;
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 0x40u;
  self->_isIndoorWorkout = a3;
}

- (BOOL)hasIsIndoorWorkout
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 6) & 1;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xBF | v3;
}

- (void)deleteIsIndoorWorkout
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsIndoorWorkout:](self, "setIsIndoorWorkout:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v6 = *(&self->_isIndoorWorkout + 1);
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = *(&self->_isIndoorWorkout + 1);
  }
  v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
    v6 = *(&self->_isIndoorWorkout + 1);
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 8) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  v6 = *(&self->_isIndoorWorkout + 1);
  if ((v6 & 8) == 0)
  {
LABEL_8:
    if ((v6 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  v7 = v8;
  v6 = *(&self->_isIndoorWorkout + 1);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
LABEL_17:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(&self->_isIndoorWorkout + 1) & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v7 = v8;
  v6 = *(&self->_isIndoorWorkout + 1);
  if ((v6 & 0x20) != 0)
    goto LABEL_17;
LABEL_10:
  if ((v6 & 0x40) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v7 = v8;
  }
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int nowPlayingState;
  int v16;
  int deviceMotionState;
  int v18;
  int isDeviceLockStatus;
  int v20;
  int isMobileDataOn;
  int v22;
  int isWifiOn;
  int v24;
  int workoutType;
  int v26;
  int isIndoorWorkout;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonIndependent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_36;
  }
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonIndependent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_36;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
  v14 = v4[33];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_36:
    v28 = 0;
    goto LABEL_37;
  }
  if ((v13 & 1) != 0)
  {
    nowPlayingState = self->_nowPlayingState;
    if (nowPlayingState != objc_msgSend(v4, "nowPlayingState"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
    v14 = v4[33];
  }
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_36;
  if (v16)
  {
    deviceMotionState = self->_deviceMotionState;
    if (deviceMotionState != objc_msgSend(v4, "deviceMotionState"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
    v14 = v4[33];
  }
  v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_36;
  if (v18)
  {
    isDeviceLockStatus = self->_isDeviceLockStatus;
    if (isDeviceLockStatus != objc_msgSend(v4, "isDeviceLockStatus"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
    v14 = v4[33];
  }
  v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_36;
  if (v20)
  {
    isMobileDataOn = self->_isMobileDataOn;
    if (isMobileDataOn != objc_msgSend(v4, "isMobileDataOn"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
    v14 = v4[33];
  }
  v22 = (v13 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_36;
  if (v22)
  {
    isWifiOn = self->_isWifiOn;
    if (isWifiOn != objc_msgSend(v4, "isWifiOn"))
      goto LABEL_36;
    v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
    v14 = v4[33];
  }
  v24 = (v13 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_36;
  if (v24)
  {
    workoutType = self->_workoutType;
    if (workoutType == objc_msgSend(v4, "workoutType"))
    {
      v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
      v14 = v4[33];
      goto LABEL_32;
    }
    goto LABEL_36;
  }
LABEL_32:
  v26 = (v13 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_36;
  if (v26)
  {
    isIndoorWorkout = self->_isIndoorWorkout;
    if (isIndoorWorkout != objc_msgSend(v4, "isIndoorWorkout"))
      goto LABEL_36;
  }
  v28 = 1;
LABEL_37:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals hash](self->_commonIndependent, "hash");
  if (*(&self->_isIndoorWorkout + 1))
  {
    v4 = 2654435761 * self->_nowPlayingState;
    if ((*(&self->_isIndoorWorkout + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_deviceMotionState;
      if ((*(&self->_isIndoorWorkout + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(&self->_isIndoorWorkout + 1) & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isDeviceLockStatus;
    if ((*(&self->_isIndoorWorkout + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isMobileDataOn;
    if ((*(&self->_isIndoorWorkout + 1) & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isWifiOn;
    if ((*(&self->_isIndoorWorkout + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(&self->_isIndoorWorkout + 1) & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  v8 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_workoutType;
  if ((*(&self->_isIndoorWorkout + 1) & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v10 = 2654435761 * self->_isIndoorWorkout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commonIndependent)
  {
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals commonIndependent](self, "commonIndependent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonIndependent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commonIndependent"));

    }
  }
  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals deviceMotionState](self, "deviceMotionState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("deviceMotionState"));

    v7 = *(&self->_isIndoorWorkout + 1);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((*(&self->_isIndoorWorkout + 1) & 4) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals isDeviceLockStatus](self, "isDeviceLockStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isDeviceLockStatus"));

  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals isIndoorWorkout](self, "isIndoorWorkout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isIndoorWorkout"));

  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals isMobileDataOn](self, "isMobileDataOn"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isMobileDataOn"));

  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 1) == 0)
      goto LABEL_12;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nowPlayingState"));

    if ((*(&self->_isIndoorWorkout + 1) & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals isWifiOn](self, "isWifiOn"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isWifiOn"));

  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 1) != 0)
    goto LABEL_20;
LABEL_12:
  if ((v7 & 0x20) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals workoutType](self, "workoutType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("workoutType"));

  }
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals *v5;
  void *v6;
  INFERENCESchemaINFERENCECommonAppIndependentSignals *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonIndependent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommonAppIndependentSignals alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setCommonIndependent:](v5, "setCommonIndependent:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setNowPlayingState:](v5, "setNowPlayingState:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMotionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setDeviceMotionState:](v5, "setDeviceMotionState:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDeviceLockStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsDeviceLockStatus:](v5, "setIsDeviceLockStatus:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMobileDataOn"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsMobileDataOn:](v5, "setIsMobileDataOn:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWifiOn"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsWifiOn:](v5, "setIsWifiOn:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workoutType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setWorkoutType:](v5, "setWorkoutType:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIndoorWorkout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingIndependentSignals setIsIndoorWorkout:](v5, "setIsIndoorWorkout:", objc_msgSend(v14, "BOOLValue"));
    v15 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)commonIndependent
{
  return self->_commonIndependent;
}

- (void)setCommonIndependent:(id)a3
{
  objc_storeStrong((id *)&self->_commonIndependent, a3);
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (int)deviceMotionState
{
  return self->_deviceMotionState;
}

- (BOOL)isDeviceLockStatus
{
  return self->_isDeviceLockStatus;
}

- (BOOL)isMobileDataOn
{
  return self->_isMobileDataOn;
}

- (BOOL)isWifiOn
{
  return self->_isWifiOn;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (void)setHasCommonIndependent:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonIndependent, 0);
}

@end
