@implementation INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals

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
  v9.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals deleteCommonDependent](self, "deleteCommonDependent");
  return v5;
}

- (BOOL)hasCommonDependent
{
  return self->_commonDependent != 0;
}

- (void)deleteCommonDependent
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setCommonDependent:](self, "setCommonDependent:", 0);
}

- (void)setWorkoutType:(int)a3
{
  *(&self->_isIndoorWorkout + 1) |= 1u;
  self->_workoutType = a3;
}

- (BOOL)hasWorkoutType
{
  return *(&self->_isIndoorWorkout + 1);
}

- (void)setHasWorkoutType:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFE | a3;
}

- (void)deleteWorkoutType
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setWorkoutType:](self, "setWorkoutType:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~1u;
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 1) |= 2u;
  self->_isIndoorWorkout = a3;
}

- (BOOL)hasIsIndoorWorkout
{
  return (*((unsigned __int8 *)&self->_isIndoorWorkout + 1) >> 1) & 1;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isIndoorWorkout + 1) = *(&self->_isIndoorWorkout + 1) & 0xFD | v3;
}

- (void)deleteIsIndoorWorkout
{
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setIsIndoorWorkout:](self, "setIsIndoorWorkout:", 0);
  *(&self->_isIndoorWorkout + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
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
    PBDataWriterWriteBOOLField();
    v7 = v8;
  }

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
  int workoutType;
  int v16;
  int isIndoorWorkout;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonDependent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonDependent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
  v14 = v4[21];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((v13 & 1) != 0)
  {
    workoutType = self->_workoutType;
    if (workoutType == objc_msgSend(v4, "workoutType"))
    {
      v13 = *((unsigned __int8 *)&self->_isIndoorWorkout + 1);
      v14 = v4[21];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    isIndoorWorkout = self->_isIndoorWorkout;
    if (isIndoorWorkout != objc_msgSend(v4, "isIndoorWorkout"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[INFERENCESchemaINFERENCECommonAppDependentSignals hash](self->_commonDependent, "hash");
  if (*(&self->_isIndoorWorkout + 1))
  {
    v4 = 2654435761 * self->_workoutType;
    if ((*(&self->_isIndoorWorkout + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(&self->_isIndoorWorkout + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isIndoorWorkout;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commonDependent)
  {
    -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals commonDependent](self, "commonDependent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonDependent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commonDependent"));

    }
  }
  v7 = *(&self->_isIndoorWorkout + 1);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals isIndoorWorkout](self, "isIndoorWorkout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isIndoorWorkout"));

    v7 = *(&self->_isIndoorWorkout + 1);
  }
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals workoutType](self, "workoutType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("workoutType"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *v5;
  void *v6;
  INFERENCESchemaINFERENCECommonAppDependentSignals *v7;
  void *v8;
  void *v9;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals;
  v5 = -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonDependent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCECommonAppDependentSignals initWithDictionary:]([INFERENCESchemaINFERENCECommonAppDependentSignals alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setCommonDependent:](v5, "setCommonDependent:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workoutType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setWorkoutType:](v5, "setWorkoutType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIndoorWorkout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEWorkoutsAppSelectionTrainingDependentSignals setIsIndoorWorkout:](v5, "setIsIndoorWorkout:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentSignals)commonDependent
{
  return self->_commonDependent;
}

- (void)setCommonDependent:(id)a3
{
  objc_storeStrong((id *)&self->_commonDependent, a3);
}

- (int)workoutType
{
  return self->_workoutType;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (void)setHasCommonDependent:(BOOL)a3
{
  *(&self->_isIndoorWorkout + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonDependent, 0);
}

@end
