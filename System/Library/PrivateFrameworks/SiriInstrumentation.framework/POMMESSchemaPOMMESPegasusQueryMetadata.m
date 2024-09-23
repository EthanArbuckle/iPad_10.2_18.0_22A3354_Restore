@implementation POMMESSchemaPOMMESPegasusQueryMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_hasLatitude = a3;
}

- (BOOL)hasHasLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteHasLatitude
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLatitude:](self, "setHasLatitude:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasLongitude:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hasLongitude = a3;
}

- (BOOL)hasHasLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteHasLongitude
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLongitude:](self, "setHasLongitude:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasCountryCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hasCountryCode = a3;
}

- (BOOL)hasHasCountryCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasHasCountryCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteHasCountryCode
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHasCountryCode:](self, "setHasCountryCode:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasStorefront:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hasStorefront = a3;
}

- (BOOL)hasHasStorefront
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasHasStorefront:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteHasStorefront
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHasStorefront:](self, "setHasStorefront:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasSiriLocale:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hasSiriLocale = a3;
}

- (BOOL)hasHasSiriLocale
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasHasSiriLocale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteHasSiriLocale
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHasSiriLocale:](self, "setHasSiriLocale:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setUiScale:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uiScale = a3;
}

- (BOOL)hasUiScale
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasUiScale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteUiScale
{
  double v2;

  LODWORD(v2) = 0;
  -[POMMESSchemaPOMMESPegasusQueryMetadata setUiScale:](self, "setUiScale:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setIsNavigationMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isNavigationMode = a3;
}

- (BOOL)hasIsNavigationMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsNavigationMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsNavigationMode
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setIsNavigationMode:](self, "setIsNavigationMode:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setTemperatureScale:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_temperatureScale = a3;
}

- (BOOL)hasTemperatureScale
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasTemperatureScale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteTemperatureScale
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setTemperatureScale:](self, "setTemperatureScale:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setMeasurementSystem:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_measurementSystem = a3;
}

- (BOOL)hasMeasurementSystem
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasMeasurementSystem:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteMeasurementSystem
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setMeasurementSystem:](self, "setMeasurementSystem:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setInstalledAppsSignatureLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_installedAppsSignatureLength = a3;
}

- (BOOL)hasInstalledAppsSignatureLength
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasInstalledAppsSignatureLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteInstalledAppsSignatureLength
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setInstalledAppsSignatureLength:](self, "setInstalledAppsSignatureLength:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)hasStorefrontValue
{
  return self->_storefrontValue != 0;
}

- (void)deleteStorefrontValue
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setStorefrontValue:](self, "setStorefrontValue:", 0);
}

- (void)setHeySiriEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_heySiriEnabled = a3;
}

- (BOOL)hasHeySiriEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasHeySiriEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteHeySiriEnabled
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setHeySiriEnabled:](self, "setHeySiriEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setLocationAgeInSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_locationAgeInSeconds = a3;
}

- (BOOL)hasLocationAgeInSeconds
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasLocationAgeInSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteLocationAgeInSeconds
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationAgeInSeconds:](self, "setLocationAgeInSeconds:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setLocationSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_locationSource = a3;
}

- (BOOL)hasLocationSource
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasLocationSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteLocationSource
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationSource:](self, "setLocationSource:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setLocationPreciseStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_locationPreciseStatus = a3;
}

- (BOOL)hasLocationPreciseStatus
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasLocationPreciseStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteLocationPreciseStatus
{
  -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationPreciseStatus:](self, "setLocationPreciseStatus:", 0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return POMMESSchemaPOMMESPegasusQueryMetadataReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  void *v5;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:
  -[POMMESSchemaPOMMESPegasusQueryMetadata storefrontValue](self, "storefrontValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_has;
    if ((v6 & 0x800) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0)
        goto LABEL_17;
LABEL_32:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_has & 0x2000) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
    goto LABEL_32;
LABEL_17:
  if ((v6 & 0x2000) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field();
LABEL_19:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $650077331ADD6EB83ECA1302D4436A84 has;
  unsigned int v6;
  int hasLatitude;
  int v8;
  int hasLongitude;
  int v10;
  int hasCountryCode;
  int v12;
  int hasStorefront;
  int v14;
  int hasSiriLocale;
  int v16;
  float uiScale;
  float v18;
  int v19;
  int isNavigationMode;
  int v21;
  int temperatureScale;
  int v23;
  int measurementSystem;
  int v25;
  unsigned int installedAppsSignatureLength;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  $650077331ADD6EB83ECA1302D4436A84 v35;
  int v36;
  unsigned int v37;
  int heySiriEnabled;
  int v39;
  unsigned int locationAgeInSeconds;
  int v41;
  int locationSource;
  int v43;
  int locationPreciseStatus;
  BOOL v45;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_63;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    hasLatitude = self->_hasLatitude;
    if (hasLatitude != objc_msgSend(v4, "hasLatitude"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_63;
  if (v8)
  {
    hasLongitude = self->_hasLongitude;
    if (hasLongitude != objc_msgSend(v4, "hasLongitude"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_63;
  if (v10)
  {
    hasCountryCode = self->_hasCountryCode;
    if (hasCountryCode != objc_msgSend(v4, "hasCountryCode"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_63;
  if (v12)
  {
    hasStorefront = self->_hasStorefront;
    if (hasStorefront != objc_msgSend(v4, "hasStorefront"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_63;
  if (v14)
  {
    hasSiriLocale = self->_hasSiriLocale;
    if (hasSiriLocale != objc_msgSend(v4, "hasSiriLocale"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_63;
  if (v16)
  {
    uiScale = self->_uiScale;
    objc_msgSend(v4, "uiScale");
    if (uiScale != v18)
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v19 = (*(unsigned int *)&has >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1))
    goto LABEL_63;
  if (v19)
  {
    isNavigationMode = self->_isNavigationMode;
    if (isNavigationMode != objc_msgSend(v4, "isNavigationMode"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v21 = (*(unsigned int *)&has >> 7) & 1;
  if (v21 != ((v6 >> 7) & 1))
    goto LABEL_63;
  if (v21)
  {
    temperatureScale = self->_temperatureScale;
    if (temperatureScale != objc_msgSend(v4, "temperatureScale"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v23 = (*(unsigned int *)&has >> 8) & 1;
  if (v23 != ((v6 >> 8) & 1))
    goto LABEL_63;
  if (v23)
  {
    measurementSystem = self->_measurementSystem;
    if (measurementSystem != objc_msgSend(v4, "measurementSystem"))
      goto LABEL_63;
    has = self->_has;
    v6 = v4[32];
  }
  v25 = (*(unsigned int *)&has >> 9) & 1;
  if (v25 != ((v6 >> 9) & 1))
    goto LABEL_63;
  if (v25)
  {
    installedAppsSignatureLength = self->_installedAppsSignatureLength;
    if (installedAppsSignatureLength != objc_msgSend(v4, "installedAppsSignatureLength"))
      goto LABEL_63;
  }
  -[POMMESSchemaPOMMESPegasusQueryMetadata storefrontValue](self, "storefrontValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storefrontValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if ((v27 == 0) == (v28 != 0))
  {

    goto LABEL_63;
  }
  -[POMMESSchemaPOMMESPegasusQueryMetadata storefrontValue](self, "storefrontValue");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[POMMESSchemaPOMMESPegasusQueryMetadata storefrontValue](self, "storefrontValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storefrontValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_63;
  }
  else
  {

  }
  v35 = self->_has;
  v36 = (*(unsigned int *)&v35 >> 10) & 1;
  v37 = v4[32];
  if (v36 != ((v37 >> 10) & 1))
  {
LABEL_63:
    v45 = 0;
    goto LABEL_64;
  }
  if (v36)
  {
    heySiriEnabled = self->_heySiriEnabled;
    if (heySiriEnabled != objc_msgSend(v4, "heySiriEnabled"))
      goto LABEL_63;
    v35 = self->_has;
    v37 = v4[32];
  }
  v39 = (*(unsigned int *)&v35 >> 11) & 1;
  if (v39 != ((v37 >> 11) & 1))
    goto LABEL_63;
  if (v39)
  {
    locationAgeInSeconds = self->_locationAgeInSeconds;
    if (locationAgeInSeconds != objc_msgSend(v4, "locationAgeInSeconds"))
      goto LABEL_63;
    v35 = self->_has;
    v37 = v4[32];
  }
  v41 = (*(unsigned int *)&v35 >> 12) & 1;
  if (v41 != ((v37 >> 12) & 1))
    goto LABEL_63;
  if (v41)
  {
    locationSource = self->_locationSource;
    if (locationSource == objc_msgSend(v4, "locationSource"))
    {
      v35 = self->_has;
      v37 = v4[32];
      goto LABEL_59;
    }
    goto LABEL_63;
  }
LABEL_59:
  v43 = (*(unsigned int *)&v35 >> 13) & 1;
  if (v43 != ((v37 >> 13) & 1))
    goto LABEL_63;
  if (v43)
  {
    locationPreciseStatus = self->_locationPreciseStatus;
    if (locationPreciseStatus != objc_msgSend(v4, "locationPreciseStatus"))
      goto LABEL_63;
  }
  v45 = 1;
LABEL_64:

  return v45;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  float uiScale;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v23 = 2654435761 * self->_hasLatitude;
    if ((has & 2) != 0)
    {
LABEL_3:
      v22 = 2654435761 * self->_hasLongitude;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v23 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v22 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v21 = 2654435761 * self->_hasCountryCode;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v21 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_hasStorefront;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_15:
    v5 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_7;
LABEL_16:
    v10 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v4 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_15;
LABEL_6:
  v5 = 2654435761 * self->_hasSiriLocale;
  if ((has & 0x20) == 0)
    goto LABEL_16;
LABEL_7:
  uiScale = self->_uiScale;
  v7 = uiScale;
  if (uiScale < 0.0)
    v7 = -uiScale;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_19:
  if ((has & 0x40) != 0)
  {
    v11 = 2654435761 * self->_isNavigationMode;
    if ((has & 0x80) != 0)
    {
LABEL_21:
      v12 = 2654435761 * self->_temperatureScale;
      if ((has & 0x100) != 0)
        goto LABEL_22;
LABEL_26:
      v13 = 0;
      if ((has & 0x200) != 0)
        goto LABEL_23;
      goto LABEL_27;
    }
  }
  else
  {
    v11 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_21;
  }
  v12 = 0;
  if ((has & 0x100) == 0)
    goto LABEL_26;
LABEL_22:
  v13 = 2654435761 * self->_measurementSystem;
  if ((has & 0x200) != 0)
  {
LABEL_23:
    v14 = 2654435761 * self->_installedAppsSignatureLength;
    goto LABEL_28;
  }
LABEL_27:
  v14 = 0;
LABEL_28:
  v15 = -[NSString hash](self->_storefrontValue, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v16 = 2654435761 * self->_heySiriEnabled;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_30:
      v17 = 2654435761 * self->_locationAgeInSeconds;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_31;
LABEL_35:
      v18 = 0;
      if ((*(_WORD *)&self->_has & 0x2000) != 0)
        goto LABEL_32;
LABEL_36:
      v19 = 0;
      return v22 ^ v23 ^ v21 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v15;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_30;
  }
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_35;
LABEL_31:
  v18 = 2654435761 * self->_locationSource;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_36;
LABEL_32:
  v19 = 2654435761 * self->_locationPreciseStatus;
  return v22 ^ v23 ^ v21 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  unsigned int v17;
  const __CFString *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __int16 v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasCountryCode](self, "hasCountryCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasCountryCode"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasLatitude](self, "hasLatitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasLatitude"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasLongitude](self, "hasLongitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasLongitude"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasSiriLocale](self, "hasSiriLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasSiriLocale"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasStorefront](self, "hasStorefront"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasStorefront"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata heySiriEnabled](self, "heySiriEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("heySiriEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusQueryMetadata installedAppsSignatureLength](self, "installedAppsSignatureLength"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("installedAppsSignatureLength"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata isNavigationMode](self, "isNavigationMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isNavigationMode"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusQueryMetadata locationAgeInSeconds](self, "locationAgeInSeconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("locationAgeInSeconds"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_23:
  v14 = -[POMMESSchemaPOMMESPegasusQueryMetadata locationPreciseStatus](self, "locationPreciseStatus");
  v15 = CFSTR("POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_UNKNOWN");
  if (v14 == 1)
    v15 = CFSTR("POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_PRECISE");
  if (v14 == 2)
    v16 = CFSTR("POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_NOT_PRECISE");
  else
    v16 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("locationPreciseStatus"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_37;
    goto LABEL_33;
  }
LABEL_29:
  v17 = -[POMMESSchemaPOMMESPegasusQueryMetadata locationSource](self, "locationSource") - 1;
  if (v17 > 7)
    v18 = CFSTR("POMMESPEGASUSREQUESTLOCATIONSOURCE_UNKNOWN");
  else
    v18 = off_1E5632FE8[v17];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("locationSource"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_33:
    v19 = -[POMMESSchemaPOMMESPegasusQueryMetadata measurementSystem](self, "measurementSystem") - 1;
    if (v19 > 2)
      v20 = CFSTR("MEASUREMENTSYSTEM_UNKNOWN");
    else
      v20 = off_1E5633028[v19];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("measurementSystem"));
  }
LABEL_37:
  if (self->_storefrontValue)
  {
    -[POMMESSchemaPOMMESPegasusQueryMetadata storefrontValue](self, "storefrontValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("storefrontValue"));

  }
  v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    v24 = -[POMMESSchemaPOMMESPegasusQueryMetadata temperatureScale](self, "temperatureScale");
    v25 = CFSTR("TEMPERATURESCALE_UNKNOWN");
    if (v24 == 1)
      v25 = CFSTR("TEMPERATURESCALE_CELSIUS");
    if (v24 == 2)
      v26 = CFSTR("TEMPERATURESCALE_FAHRENHEIT");
    else
      v26 = v25;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("temperatureScale"));
    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x20) != 0)
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESPegasusQueryMetadata uiScale](self, "uiScale");
    objc_msgSend(v27, "numberWithFloat:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("uiScale"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusQueryMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusQueryMetadata *v5;
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
    self = -[POMMESSchemaPOMMESPegasusQueryMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusQueryMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  POMMESSchemaPOMMESPegasusQueryMetadata *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POMMESSchemaPOMMESPegasusQueryMetadata;
  v5 = -[POMMESSchemaPOMMESPegasusQueryMetadata init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLatitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLatitude:](v5, "setHasLatitude:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLongitude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLongitude:](v5, "setHasLongitude:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCountryCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasCountryCode:](v5, "setHasCountryCode:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasStorefront"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasStorefront:](v5, "setHasStorefront:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSiriLocale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasSiriLocale:](v5, "setHasSiriLocale:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiScale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[POMMESSchemaPOMMESPegasusQueryMetadata setUiScale:](v5, "setUiScale:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNavigationMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setIsNavigationMode:](v5, "setIsNavigationMode:", objc_msgSend(v12, "BOOLValue"));
    v32 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("temperatureScale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setTemperatureScale:](v5, "setTemperatureScale:", objc_msgSend(v13, "intValue"));
    v31 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("measurementSystem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setMeasurementSystem:](v5, "setMeasurementSystem:", objc_msgSend(v14, "intValue"));
    v29 = v9;
    v30 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installedAppsSignatureLength"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setInstalledAppsSignatureLength:](v5, "setInstalledAppsSignatureLength:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storefrontValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[POMMESSchemaPOMMESPegasusQueryMetadata setStorefrontValue:](v5, "setStorefrontValue:", v17);

    }
    v28 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heySiriEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHeySiriEnabled:](v5, "setHeySiriEnabled:", objc_msgSend(v18, "BOOLValue"));
    v26 = v13;
    v27 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAgeInSeconds"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationAgeInSeconds:](v5, "setLocationAgeInSeconds:", objc_msgSend(v19, "unsignedIntValue"));
    v20 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationSource"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationSource:](v5, "setLocationSource:", objc_msgSend(v21, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationPreciseStatus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationPreciseStatus:](v5, "setLocationPreciseStatus:", objc_msgSend(v22, "intValue"));
    v23 = v5;

  }
  return v5;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (BOOL)hasCountryCode
{
  return self->_hasCountryCode;
}

- (BOOL)hasStorefront
{
  return self->_hasStorefront;
}

- (BOOL)hasSiriLocale
{
  return self->_hasSiriLocale;
}

- (float)uiScale
{
  return self->_uiScale;
}

- (BOOL)isNavigationMode
{
  return self->_isNavigationMode;
}

- (int)temperatureScale
{
  return self->_temperatureScale;
}

- (int)measurementSystem
{
  return self->_measurementSystem;
}

- (unsigned)installedAppsSignatureLength
{
  return self->_installedAppsSignatureLength;
}

- (NSString)storefrontValue
{
  return self->_storefrontValue;
}

- (void)setStorefrontValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)heySiriEnabled
{
  return self->_heySiriEnabled;
}

- (unsigned)locationAgeInSeconds
{
  return self->_locationAgeInSeconds;
}

- (int)locationSource
{
  return self->_locationSource;
}

- (int)locationPreciseStatus
{
  return self->_locationPreciseStatus;
}

- (void)setHasStorefrontValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontValue, 0);
}

@end
