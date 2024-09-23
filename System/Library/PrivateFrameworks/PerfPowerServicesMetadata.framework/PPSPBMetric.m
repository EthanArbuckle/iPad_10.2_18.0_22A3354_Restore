@implementation PPSPBMetric

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasSubsystem
{
  return self->_subsystem != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setVersion:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (int)datatype
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_datatype;
  else
    return 0;
}

- (void)setDatatype:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_datatype = a3;
}

- (void)setHasDatatype:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDatatype
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (BOOL)hasCadence
{
  return self->_cadence != 0;
}

- (int)directionality
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_directionality;
  else
    return 0;
}

- (void)setDirectionality:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_directionality = a3;
}

- (void)setHasDirectionality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDirectionality
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (int)storage
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_storage;
  else
    return 0;
}

- (void)setStorage:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_storage = a3;
}

- (void)setHasStorage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasStorage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTimeToLive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_timeToLive = a3;
}

- (void)setHasTimeToLive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTimeToLive
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)mode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_mode;
  else
    return 4;
}

- (void)setMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (int)deviceCapability
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_deviceCapability;
  else
    return 0;
}

- (void)setDeviceCapability:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deviceCapability = a3;
}

- (void)setHasDeviceCapability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeviceCapability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)enabledPopulation
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_enabledPopulation;
  else
    return 0;
}

- (void)setEnabledPopulation:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enabledPopulation = a3;
}

- (void)setHasEnabledPopulation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnabledPopulation
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasRounding
{
  return self->_rounding != 0;
}

- (int)obfuscation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_obfuscation;
  else
    return 0;
}

- (void)setObfuscation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_obfuscation = a3;
}

- (void)setHasObfuscation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasObfuscation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMetricDescription
{
  return self->_metricDescription != 0;
}

- (BOOL)hasExampleValue
{
  return self->_exampleValue != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (int)privacyClassification
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_privacyClassification;
  else
    return 0;
}

- (void)setPrivacyClassification:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_privacyClassification = a3;
}

- (void)setHasPrivacyClassification:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrivacyClassification
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasEnumMapping
{
  return self->_enumMapping != 0;
}

- (BOOL)hasGroupBy
{
  return self->_groupBy != 0;
}

- (BOOL)hasMetricType
{
  return self->_metricType != 0;
}

- (int)auxiliaryType
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_auxiliaryType;
  else
    return 0;
}

- (void)setAuxiliaryType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_auxiliaryType = a3;
}

- (void)setHasAuxiliaryType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAuxiliaryType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFilterEntryLogging:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_filterEntryLogging = a3;
}

- (void)setHasFilterEntryLogging:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFilterEntryLogging
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDmaCompliant:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_dmaCompliant = a3;
}

- (void)setHasDmaCompliant:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDmaCompliant
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFixedArraySize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fixedArraySize = a3;
}

- (void)setHasFixedArraySize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFixedArraySize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PPSPBMetric;
  -[PPSPBMetric description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *subsystem;
  NSString *category;
  __int16 has;
  void *v9;
  void *v10;
  PPSPBUnit *unit;
  void *v12;
  PPSPBCadence *cadence;
  void *v14;
  __int16 v15;
  void *v16;
  PPSPBSource *source;
  void *v18;
  __int16 v19;
  void *v20;
  void *v21;
  PPSPBRounding *rounding;
  void *v23;
  void *v24;
  NSString *metricDescription;
  NSString *exampleValue;
  NSString *build;
  void *v28;
  PPSPBEnumMapping *enumMapping;
  void *v30;
  PPSPBGroupingDimensions *groupBy;
  void *v32;
  PPSPBMetricType *metricType;
  void *v34;
  __int16 v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  subsystem = self->_subsystem;
  if (subsystem)
    objc_msgSend(v4, "setObject:forKey:", subsystem, CFSTR("subsystem"));
  category = self->_category;
  if (category)
    objc_msgSend(v4, "setObject:forKey:", category, CFSTR("category"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_version);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("version"));

    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_datatype);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("datatype"));

  }
  unit = self->_unit;
  if (unit)
  {
    -[PPSPBUnit dictionaryRepresentation](unit, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("unit"));

  }
  cadence = self->_cadence;
  if (cadence)
  {
    -[PPSPBCadence dictionaryRepresentation](cadence, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("cadence"));

  }
  v15 = (__int16)self->_has;
  if ((v15 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_directionality);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("directionality"));

    v15 = (__int16)self->_has;
    if ((v15 & 0x400) == 0)
    {
LABEL_17:
      if ((v15 & 0x800) == 0)
        goto LABEL_18;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_storage);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("storage"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x800) == 0)
  {
LABEL_18:
    if ((v15 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeToLive);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("timeToLive"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mode);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("mode"));

  }
LABEL_20:
  source = self->_source;
  if (source)
  {
    -[PPSPBSource dictionaryRepresentation](source, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("source"));

  }
  v19 = (__int16)self->_has;
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceCapability);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("deviceCapability"));

    v19 = (__int16)self->_has;
  }
  if ((v19 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_enabledPopulation);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("enabledPopulation"));

  }
  rounding = self->_rounding;
  if (rounding)
  {
    -[PPSPBRounding dictionaryRepresentation](rounding, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("rounding"));

  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_obfuscation);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("obfuscation"));

  }
  metricDescription = self->_metricDescription;
  if (metricDescription)
    objc_msgSend(v4, "setObject:forKey:", metricDescription, CFSTR("metricDescription"));
  exampleValue = self->_exampleValue;
  if (exampleValue)
    objc_msgSend(v4, "setObject:forKey:", exampleValue, CFSTR("exampleValue"));
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_privacyClassification);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("privacyClassification"));

  }
  enumMapping = self->_enumMapping;
  if (enumMapping)
  {
    -[PPSPBEnumMapping dictionaryRepresentation](enumMapping, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("enumMapping"));

  }
  groupBy = self->_groupBy;
  if (groupBy)
  {
    -[PPSPBGroupingDimensions dictionaryRepresentation](groupBy, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("groupBy"));

  }
  metricType = self->_metricType;
  if (metricType)
  {
    -[PPSPBMetricType dictionaryRepresentation](metricType, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("metricType"));

  }
  v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_auxiliaryType);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("auxiliaryType"));

    v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_46:
      if ((v35 & 0x1000) == 0)
        goto LABEL_47;
LABEL_56:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dmaCompliant);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("dmaCompliant"));

      if ((*(_WORD *)&self->_has & 0x40) == 0)
        return v4;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_filterEntryLogging);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("filterEntryLogging"));

  v35 = (__int16)self->_has;
  if ((v35 & 0x1000) != 0)
    goto LABEL_56;
LABEL_47:
  if ((v35 & 0x40) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fixedArraySize);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("fixedArraySize"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_subsystem)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v9;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_unit)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_cadence)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0)
        goto LABEL_18;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  v4 = v9;
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
LABEL_20:
  if (self->_source)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_rounding)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_metricDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_exampleValue)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_enumMapping)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_groupBy)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_metricType)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0)
        goto LABEL_47;
LABEL_56:
      PBDataWriterWriteBOOLField();
      v4 = v9;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteBOOLField();
  v4 = v9;
  v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0)
    goto LABEL_56;
LABEL_47:
  if ((v8 & 0x40) != 0)
  {
LABEL_48:
    PBDataWriterWriteUint32Field();
    v4 = v9;
  }
LABEL_49:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v9;
  }
  if (self->_subsystem)
  {
    objc_msgSend(v9, "setSubsystem:");
    v4 = v9;
  }
  if (self->_category)
  {
    objc_msgSend(v9, "setCategory:");
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_version;
    *((_WORD *)v4 + 94) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_datatype;
    *((_WORD *)v4 + 94) |= 4u;
  }
  if (self->_unit)
  {
    objc_msgSend(v9, "setUnit:");
    v4 = v9;
  }
  if (self->_cadence)
  {
    objc_msgSend(v9, "setCadence:");
    v4 = v9;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_directionality;
    *((_WORD *)v4 + 94) |= 0x10u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0)
        goto LABEL_18;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 38) = self->_storage;
  *((_WORD *)v4 + 94) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_52:
  *((_DWORD *)v4 + 42) = self->_timeToLive;
  *((_WORD *)v4 + 94) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 28) = self->_mode;
    *((_WORD *)v4 + 94) |= 0x80u;
  }
LABEL_20:
  if (self->_source)
  {
    objc_msgSend(v9, "setSource:");
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_deviceCapability;
    *((_WORD *)v4 + 94) |= 8u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_enabledPopulation;
    *((_WORD *)v4 + 94) |= 0x20u;
  }
  if (self->_rounding)
  {
    objc_msgSend(v9, "setRounding:");
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_obfuscation;
    *((_WORD *)v4 + 94) |= 0x100u;
  }
  if (self->_metricDescription)
  {
    objc_msgSend(v9, "setMetricDescription:");
    v4 = v9;
  }
  if (self->_exampleValue)
  {
    objc_msgSend(v9, "setExampleValue:");
    v4 = v9;
  }
  if (self->_build)
  {
    objc_msgSend(v9, "setBuild:");
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_privacyClassification;
    *((_WORD *)v4 + 94) |= 0x200u;
  }
  if (self->_enumMapping)
  {
    objc_msgSend(v9, "setEnumMapping:");
    v4 = v9;
  }
  if (self->_groupBy)
  {
    objc_msgSend(v9, "setGroupBy:");
    v4 = v9;
  }
  if (self->_metricType)
  {
    objc_msgSend(v9, "setMetricType:");
    v4 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_auxiliaryType;
    *((_WORD *)v4 + 94) |= 2u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0)
        goto LABEL_47;
LABEL_56:
      *((_BYTE *)v4 + 184) = self->_dmaCompliant;
      *((_WORD *)v4 + 94) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  *((_BYTE *)v4 + 185) = self->_filterEntryLogging;
  *((_WORD *)v4 + 94) |= 0x2000u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0)
    goto LABEL_56;
LABEL_47:
  if ((v8 & 0x40) != 0)
  {
LABEL_48:
    *((_DWORD *)v4 + 20) = self->_fixedArraySize;
    *((_WORD *)v4 + 94) |= 0x40u;
  }
LABEL_49:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 has;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __int16 v17;
  id v18;
  void *v19;
  __int16 v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  __int16 v35;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[NSString copyWithZone:](self->_subsystem, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v8;

  v10 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_version;
    *(_WORD *)(v5 + 188) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_datatype;
    *(_WORD *)(v5 + 188) |= 4u;
  }
  v13 = -[PPSPBUnit copyWithZone:](self->_unit, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v13;

  v15 = -[PPSPBCadence copyWithZone:](self->_cadence, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_directionality;
    *(_WORD *)(v5 + 188) |= 0x10u;
    v17 = (__int16)self->_has;
    if ((v17 & 0x400) == 0)
    {
LABEL_7:
      if ((v17 & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 152) = self->_storage;
  *(_WORD *)(v5 + 188) |= 0x400u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_8:
    if ((v17 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_26:
  *(_DWORD *)(v5 + 168) = self->_timeToLive;
  *(_WORD *)(v5 + 188) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 112) = self->_mode;
    *(_WORD *)(v5 + 188) |= 0x80u;
  }
LABEL_10:
  v18 = -[PPSPBSource copyWithZone:](self->_source, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v18;

  v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_deviceCapability;
    *(_WORD *)(v5 + 188) |= 8u;
    v20 = (__int16)self->_has;
  }
  if ((v20 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_enabledPopulation;
    *(_WORD *)(v5 + 188) |= 0x20u;
  }
  v21 = -[PPSPBRounding copyWithZone:](self->_rounding, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v21;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_obfuscation;
    *(_WORD *)(v5 + 188) |= 0x100u;
  }
  v23 = -[NSString copyWithZone:](self->_metricDescription, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v23;

  v25 = -[NSString copyWithZone:](self->_exampleValue, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v25;

  v27 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v27;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_privacyClassification;
    *(_WORD *)(v5 + 188) |= 0x200u;
  }
  v29 = -[PPSPBEnumMapping copyWithZone:](self->_enumMapping, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v29;

  v31 = -[PPSPBGroupingDimensions copyWithZone:](self->_groupBy, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v31;

  v33 = -[PPSPBMetricType copyWithZone:](self->_metricType, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v33;

  v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_auxiliaryType;
    *(_WORD *)(v5 + 188) |= 2u;
    v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_20:
      if ((v35 & 0x1000) == 0)
        goto LABEL_21;
LABEL_30:
      *(_BYTE *)(v5 + 184) = self->_dmaCompliant;
      *(_WORD *)(v5 + 188) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        return (id)v5;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_20;
  }
  *(_BYTE *)(v5 + 185) = self->_filterEntryLogging;
  *(_WORD *)(v5 + 188) |= 0x2000u;
  v35 = (__int16)self->_has;
  if ((v35 & 0x1000) != 0)
    goto LABEL_30;
LABEL_21:
  if ((v35 & 0x40) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 80) = self->_fixedArraySize;
    *(_WORD *)(v5 + 188) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *subsystem;
  NSString *category;
  __int16 has;
  __int16 v9;
  PPSPBUnit *unit;
  PPSPBCadence *cadence;
  __int16 v12;
  __int16 v13;
  PPSPBSource *source;
  __int16 v15;
  PPSPBRounding *rounding;
  NSString *metricDescription;
  NSString *exampleValue;
  NSString *build;
  PPSPBEnumMapping *enumMapping;
  PPSPBGroupingDimensions *groupBy;
  PPSPBMetricType *metricType;
  __int16 v23;
  __int16 v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_106;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_106;
  }
  subsystem = self->_subsystem;
  if ((unint64_t)subsystem | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](subsystem, "isEqual:"))
      goto LABEL_106;
  }
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](category, "isEqual:"))
      goto LABEL_106;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 94);
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_version != *((double *)v4 + 1))
      goto LABEL_106;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_datatype != *((_DWORD *)v4 + 12))
      goto LABEL_106;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_106;
  }
  unit = self->_unit;
  if ((unint64_t)unit | *((_QWORD *)v4 + 22) && !-[PPSPBUnit isEqual:](unit, "isEqual:"))
    goto LABEL_106;
  cadence = self->_cadence;
  if ((unint64_t)cadence | *((_QWORD *)v4 + 4))
  {
    if (!-[PPSPBCadence isEqual:](cadence, "isEqual:"))
      goto LABEL_106;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 94);
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_directionality != *((_DWORD *)v4 + 14))
      goto LABEL_106;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x400) == 0 || self->_storage != *((_DWORD *)v4 + 38))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x800) == 0 || self->_timeToLive != *((_DWORD *)v4 + 42))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_mode != *((_DWORD *)v4 + 28))
      goto LABEL_106;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 18))
  {
    if (!-[PPSPBSource isEqual:](source, "isEqual:"))
      goto LABEL_106;
    v12 = (__int16)self->_has;
  }
  v15 = *((_WORD *)v4 + 94);
  if ((v12 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_deviceCapability != *((_DWORD *)v4 + 13))
      goto LABEL_106;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((v12 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_enabledPopulation != *((_DWORD *)v4 + 15))
      goto LABEL_106;
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  rounding = self->_rounding;
  if ((unint64_t)rounding | *((_QWORD *)v4 + 17))
  {
    if (!-[PPSPBRounding isEqual:](rounding, "isEqual:"))
      goto LABEL_106;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) == 0 || self->_obfuscation != *((_DWORD *)v4 + 32))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  metricDescription = self->_metricDescription;
  if ((unint64_t)metricDescription | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](metricDescription, "isEqual:"))
  {
    goto LABEL_106;
  }
  exampleValue = self->_exampleValue;
  if ((unint64_t)exampleValue | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](exampleValue, "isEqual:"))
      goto LABEL_106;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0 || self->_privacyClassification != *((_DWORD *)v4 + 33))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  enumMapping = self->_enumMapping;
  if ((unint64_t)enumMapping | *((_QWORD *)v4 + 8) && !-[PPSPBEnumMapping isEqual:](enumMapping, "isEqual:"))
    goto LABEL_106;
  groupBy = self->_groupBy;
  if ((unint64_t)groupBy | *((_QWORD *)v4 + 11))
  {
    if (!-[PPSPBGroupingDimensions isEqual:](groupBy, "isEqual:"))
      goto LABEL_106;
  }
  metricType = self->_metricType;
  if ((unint64_t)metricType | *((_QWORD *)v4 + 13))
  {
    if (!-[PPSPBMetricType isEqual:](metricType, "isEqual:"))
      goto LABEL_106;
  }
  v23 = (__int16)self->_has;
  v24 = *((_WORD *)v4 + 94);
  if ((v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_auxiliaryType != *((_DWORD *)v4 + 4))
      goto LABEL_106;
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x2000) == 0)
      goto LABEL_106;
    if (self->_filterEntryLogging)
    {
      if (!*((_BYTE *)v4 + 185))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 185))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
    {
      if (self->_dmaCompliant)
      {
        if (!*((_BYTE *)v4 + 184))
          goto LABEL_106;
        goto LABEL_101;
      }
      if (!*((_BYTE *)v4 + 184))
        goto LABEL_101;
    }
LABEL_106:
    v25 = 0;
    goto LABEL_107;
  }
  if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
    goto LABEL_106;
LABEL_101:
  if ((v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_fixedArraySize != *((_DWORD *)v4 + 20))
      goto LABEL_106;
    v25 = 1;
  }
  else
  {
    v25 = (v24 & 0x40) == 0;
  }
LABEL_107:

  return v25;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double version;
  double v6;
  long double v7;
  double v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;

  v39 = -[NSString hash](self->_name, "hash");
  v38 = -[NSString hash](self->_subsystem, "hash");
  v37 = -[NSString hash](self->_category, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    version = self->_version;
    v6 = -version;
    if (version >= 0.0)
      v6 = self->_version;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v36 = v4;
  if ((has & 4) != 0)
    v35 = 2654435761 * self->_datatype;
  else
    v35 = 0;
  v34 = -[PPSPBUnit hash](self->_unit, "hash");
  v33 = -[PPSPBCadence hash](self->_cadence, "hash");
  v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v32 = 2654435761 * self->_directionality;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_14:
      v31 = 2654435761 * self->_storage;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_15;
LABEL_19:
      v30 = 0;
      if ((v9 & 0x80) != 0)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_14;
  }
  v31 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_19;
LABEL_15:
  v30 = 2654435761 * self->_timeToLive;
  if ((v9 & 0x80) != 0)
  {
LABEL_16:
    v29 = 2654435761 * self->_mode;
    goto LABEL_21;
  }
LABEL_20:
  v29 = 0;
LABEL_21:
  v28 = -[PPSPBSource hash](self->_source, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    v27 = 2654435761 * self->_deviceCapability;
    if ((v10 & 0x20) != 0)
      goto LABEL_23;
  }
  else
  {
    v27 = 0;
    if ((v10 & 0x20) != 0)
    {
LABEL_23:
      v26 = 2654435761 * self->_enabledPopulation;
      goto LABEL_26;
    }
  }
  v26 = 0;
LABEL_26:
  v25 = -[PPSPBRounding hash](self->_rounding, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v11 = 2654435761 * self->_obfuscation;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_metricDescription, "hash");
  v13 = -[NSString hash](self->_exampleValue, "hash");
  v14 = -[NSString hash](self->_build, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v15 = 2654435761 * self->_privacyClassification;
  else
    v15 = 0;
  v16 = -[PPSPBEnumMapping hash](self->_enumMapping, "hash");
  v17 = -[PPSPBGroupingDimensions hash](self->_groupBy, "hash");
  v18 = -[PPSPBMetricType hash](self->_metricType, "hash");
  v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    v20 = 2654435761 * self->_auxiliaryType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_34:
      v21 = 2654435761 * self->_filterEntryLogging;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_35;
LABEL_39:
      v22 = 0;
      if ((v19 & 0x40) != 0)
        goto LABEL_36;
LABEL_40:
      v23 = 0;
      return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
    }
  }
  else
  {
    v20 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_34;
  }
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_39;
LABEL_35:
  v22 = 2654435761 * self->_dmaCompliant;
  if ((v19 & 0x40) == 0)
    goto LABEL_40;
LABEL_36:
  v23 = 2654435761 * self->_fixedArraySize;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  PPSPBUnit *unit;
  uint64_t v7;
  PPSPBCadence *cadence;
  uint64_t v9;
  __int16 v10;
  PPSPBSource *source;
  uint64_t v12;
  __int16 v13;
  PPSPBRounding *rounding;
  uint64_t v15;
  PPSPBEnumMapping *enumMapping;
  uint64_t v17;
  PPSPBGroupingDimensions *groupBy;
  uint64_t v19;
  PPSPBMetricType *metricType;
  uint64_t v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v23 = v4;
  if (*((_QWORD *)v4 + 15))
  {
    -[PPSPBMetric setName:](self, "setName:");
    v4 = v23;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[PPSPBMetric setSubsystem:](self, "setSubsystem:");
    v4 = v23;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PPSPBMetric setCategory:](self, "setCategory:");
    v4 = v23;
  }
  v5 = *((_WORD *)v4 + 94);
  if ((v5 & 1) != 0)
  {
    self->_version = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 94);
  }
  if ((v5 & 4) != 0)
  {
    self->_datatype = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
  }
  unit = self->_unit;
  v7 = *((_QWORD *)v4 + 22);
  if (unit)
  {
    if (!v7)
      goto LABEL_17;
    -[PPSPBUnit mergeFrom:](unit, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_17;
    -[PPSPBMetric setUnit:](self, "setUnit:");
  }
  v4 = v23;
LABEL_17:
  cadence = self->_cadence;
  v9 = *((_QWORD *)v4 + 4);
  if (cadence)
  {
    if (!v9)
      goto LABEL_23;
    -[PPSPBCadence mergeFrom:](cadence, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_23;
    -[PPSPBMetric setCadence:](self, "setCadence:");
  }
  v4 = v23;
LABEL_23:
  v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x10) != 0)
  {
    self->_directionality = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x10u;
    v10 = *((_WORD *)v4 + 94);
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0)
        goto LABEL_26;
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) == 0)
  {
    goto LABEL_25;
  }
  self->_storage = *((_DWORD *)v4 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_33:
  self->_timeToLive = *((_DWORD *)v4 + 42);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 94) & 0x80) != 0)
  {
LABEL_27:
    self->_mode = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_28:
  source = self->_source;
  v12 = *((_QWORD *)v4 + 18);
  if (source)
  {
    if (!v12)
      goto LABEL_38;
    -[PPSPBSource mergeFrom:](source, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_38;
    -[PPSPBMetric setSource:](self, "setSource:");
  }
  v4 = v23;
LABEL_38:
  v13 = *((_WORD *)v4 + 94);
  if ((v13 & 8) != 0)
  {
    self->_deviceCapability = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 8u;
    v13 = *((_WORD *)v4 + 94);
  }
  if ((v13 & 0x20) != 0)
  {
    self->_enabledPopulation = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x20u;
  }
  rounding = self->_rounding;
  v15 = *((_QWORD *)v4 + 17);
  if (rounding)
  {
    if (!v15)
      goto LABEL_48;
    -[PPSPBRounding mergeFrom:](rounding, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_48;
    -[PPSPBMetric setRounding:](self, "setRounding:");
  }
  v4 = v23;
LABEL_48:
  if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    self->_obfuscation = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PPSPBMetric setMetricDescription:](self, "setMetricDescription:");
    v4 = v23;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PPSPBMetric setExampleValue:](self, "setExampleValue:");
    v4 = v23;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PPSPBMetric setBuild:](self, "setBuild:");
    v4 = v23;
  }
  if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    self->_privacyClassification = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_has |= 0x200u;
  }
  enumMapping = self->_enumMapping;
  v17 = *((_QWORD *)v4 + 8);
  if (enumMapping)
  {
    if (!v17)
      goto LABEL_64;
    -[PPSPBEnumMapping mergeFrom:](enumMapping, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_64;
    -[PPSPBMetric setEnumMapping:](self, "setEnumMapping:");
  }
  v4 = v23;
LABEL_64:
  groupBy = self->_groupBy;
  v19 = *((_QWORD *)v4 + 11);
  if (groupBy)
  {
    if (!v19)
      goto LABEL_70;
    -[PPSPBGroupingDimensions mergeFrom:](groupBy, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_70;
    -[PPSPBMetric setGroupBy:](self, "setGroupBy:");
  }
  v4 = v23;
LABEL_70:
  metricType = self->_metricType;
  v21 = *((_QWORD *)v4 + 13);
  if (metricType)
  {
    if (!v21)
      goto LABEL_76;
    -[PPSPBMetricType mergeFrom:](metricType, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_76;
    -[PPSPBMetric setMetricType:](self, "setMetricType:");
  }
  v4 = v23;
LABEL_76:
  v22 = *((_WORD *)v4 + 94);
  if ((v22 & 2) != 0)
  {
    self->_auxiliaryType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
    v22 = *((_WORD *)v4 + 94);
    if ((v22 & 0x2000) == 0)
    {
LABEL_78:
      if ((v22 & 0x1000) == 0)
        goto LABEL_79;
LABEL_84:
      self->_dmaCompliant = *((_BYTE *)v4 + 184);
      *(_WORD *)&self->_has |= 0x1000u;
      if ((*((_WORD *)v4 + 94) & 0x40) == 0)
        goto LABEL_81;
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) == 0)
  {
    goto LABEL_78;
  }
  self->_filterEntryLogging = *((_BYTE *)v4 + 185);
  *(_WORD *)&self->_has |= 0x2000u;
  v22 = *((_WORD *)v4 + 94);
  if ((v22 & 0x1000) != 0)
    goto LABEL_84;
LABEL_79:
  if ((v22 & 0x40) != 0)
  {
LABEL_80:
    self->_fixedArraySize = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_81:

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_subsystem, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (double)version
{
  return self->_version;
}

- (PPSPBUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (PPSPBCadence)cadence
{
  return self->_cadence;
}

- (void)setCadence:(id)a3
{
  objc_storeStrong((id *)&self->_cadence, a3);
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (PPSPBSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (PPSPBRounding)rounding
{
  return self->_rounding;
}

- (void)setRounding:(id)a3
{
  objc_storeStrong((id *)&self->_rounding, a3);
}

- (NSString)metricDescription
{
  return self->_metricDescription;
}

- (void)setMetricDescription:(id)a3
{
  objc_storeStrong((id *)&self->_metricDescription, a3);
}

- (NSString)exampleValue
{
  return self->_exampleValue;
}

- (void)setExampleValue:(id)a3
{
  objc_storeStrong((id *)&self->_exampleValue, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (PPSPBEnumMapping)enumMapping
{
  return self->_enumMapping;
}

- (void)setEnumMapping:(id)a3
{
  objc_storeStrong((id *)&self->_enumMapping, a3);
}

- (PPSPBGroupingDimensions)groupBy
{
  return self->_groupBy;
}

- (void)setGroupBy:(id)a3
{
  objc_storeStrong((id *)&self->_groupBy, a3);
}

- (PPSPBMetricType)metricType
{
  return self->_metricType;
}

- (void)setMetricType:(id)a3
{
  objc_storeStrong((id *)&self->_metricType, a3);
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

- (BOOL)dmaCompliant
{
  return self->_dmaCompliant;
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_rounding, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_metricDescription, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_exampleValue, 0);
  objc_storeStrong((id *)&self->_enumMapping, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_cadence, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
