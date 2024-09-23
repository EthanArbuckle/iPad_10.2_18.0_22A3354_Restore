@implementation PREAMResponsesViewed

- (void)setLastViewedIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastViewedIndex = a3;
}

- (void)setHasLastViewedIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastViewedIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
}

- (BOOL)hasHostProcess
{
  return self->_hostProcess != 0;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isApricotDevice = a3;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsApricotDevice
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)ageGroup
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_ageGroup;
  else
    return 0;
}

- (void)setAgeGroup:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ageGroup = a3;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgeGroup
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 < 7)
    return off_1E7D9DD80[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAgeGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_0TO18")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_19TO30")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_31TO50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_51TO65")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_66TO75")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_76UP")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)PREAMResponsesViewed;
  -[PREAMResponsesViewed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREAMResponsesViewed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  char has;
  void *v10;
  uint64_t ageGroup;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastViewedIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("last_viewed_index"));

  }
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v3, "setObject:forKey:", experimentId, CFSTR("experiment_id"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v3, "setObject:forKey:", treatmentId, CFSTR("treatment_id"));
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName)
    objc_msgSend(v3, "setObject:forKey:", treatmentModelName, CFSTR("treatment_model_name"));
  hostProcess = self->_hostProcess;
  if (hostProcess)
    objc_msgSend(v3, "setObject:forKey:", hostProcess, CFSTR("host_process"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isApricotDevice);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("is_apricot_device"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    ageGroup = self->_ageGroup;
    if (ageGroup >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ageGroup);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E7D9DD80[ageGroup];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("age_group"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponsesViewedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentModelName)
    PBDataWriterWriteStringField();
  if (self->_hostProcess)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_lastViewedIndex;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  v6 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    v4 = v6;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v6, "setTreatmentId:");
    v4 = v6;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v6, "setTreatmentModelName:");
    v4 = v6;
  }
  if (self->_hostProcess)
  {
    objc_msgSend(v6, "setHostProcess:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_isApricotDevice;
    *((_BYTE *)v4 + 60) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_ageGroup;
    *((_BYTE *)v4 + 60) |= 1u;
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
  uint64_t v13;
  void *v14;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_lastViewedIndex;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_treatmentId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_treatmentModelName, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_hostProcess, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_isApricotDevice;
    *(_BYTE *)(v6 + 60) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_ageGroup;
    *(_BYTE *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *experimentId;
  NSString *treatmentId;
  NSString *treatmentModelName;
  NSString *hostProcess;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_lastViewedIndex != *((_DWORD *)v4 + 8))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_27;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:"))
      goto LABEL_27;
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:"))
      goto LABEL_27;
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_isApricotDevice)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_23;
    }
LABEL_27:
    v9 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
    goto LABEL_27;
LABEL_23:
  v9 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2))
      goto LABEL_27;
    v9 = 1;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_lastViewedIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_experimentId, "hash");
  v5 = -[NSString hash](self->_treatmentId, "hash");
  v6 = -[NSString hash](self->_treatmentModelName, "hash");
  v7 = -[NSString hash](self->_hostProcess, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761 * self->_isApricotDevice;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 2654435761 * self->_ageGroup;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_lastViewedIndex = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PREAMResponsesViewed setExperimentId:](self, "setExperimentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PREAMResponsesViewed setTreatmentId:](self, "setTreatmentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PREAMResponsesViewed setTreatmentModelName:](self, "setTreatmentModelName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PREAMResponsesViewed setHostProcess:](self, "setHostProcess:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_isApricotDevice = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 1) != 0)
  {
    self->_ageGroup = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)lastViewedIndex
{
  return self->_lastViewedIndex;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentModelName:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentModelName, a3);
}

- (NSString)hostProcess
{
  return self->_hostProcess;
}

- (void)setHostProcess:(id)a3
{
  objc_storeStrong((id *)&self->_hostProcess, a3);
}

- (BOOL)isApricotDevice
{
  return self->_isApricotDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
