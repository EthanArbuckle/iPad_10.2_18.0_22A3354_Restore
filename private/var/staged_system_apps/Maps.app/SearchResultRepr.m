@implementation SearchResultRepr

- (id)typeAsString:(unsigned int)a3
{
  if (a3 - 3 > 9)
    return CFSTR("Default");
  else
    return *(&off_1011E07C0 + (int)(a3 - 3));
}

- (unsigned)StringAsType:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DroppedPin")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CurrentLocation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RefinementEntry")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Section")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ParkedCar")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)originalTypeAsString:(unsigned int)a3
{
  if (a3 - 3 > 9)
    return CFSTR("Default");
  else
    return *(&off_1011E07C0 + (int)(a3 - 3));
}

- (unsigned)StringAsOriginalType:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DroppedPin")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CurrentLocation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RefinementEntry")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Section")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ParkedCar")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasObsoleteName
{
  return self->_obsoleteName != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasObsoleteLocality
{
  return self->_obsoleteLocality != 0;
}

- (BOOL)hasObsoleteRegion
{
  return self->_obsoleteRegion != 0;
}

- (BOOL)hasObsoletePostalCode
{
  return self->_obsoletePostalCode != 0;
}

- (BOOL)hasObsoleteCountryCode
{
  return self->_obsoleteCountryCode != 0;
}

- (BOOL)hasObsoleteCountryName
{
  return self->_obsoleteCountryName != 0;
}

- (BOOL)hasObsoletePhone
{
  return self->_obsoletePhone != 0;
}

- (BOOL)hasObsoleteReferenceURL
{
  return self->_obsoleteReferenceURL != 0;
}

- (BOOL)hasMapsURL
{
  return self->_mapsURL != 0;
}

- (BOOL)hasObsoleteDependentLocality
{
  return self->_obsoleteDependentLocality != 0;
}

- (BOOL)hasObsoleteThoroughfare
{
  return self->_obsoleteThoroughfare != 0;
}

- (void)setObsoleteLatitudeE6Value:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_obsoleteLatitudeE6Value = a3;
}

- (void)setHasObsoleteLatitudeE6Value:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasObsoleteLatitudeE6Value
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setObsoleteLongitudeE6Value:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_obsoleteLongitudeE6Value = a3;
}

- (void)setHasObsoleteLongitudeE6Value:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasObsoleteLongitudeE6Value
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setZoomLevel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasZoomLevel
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setObsoleteInexactPosition:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_obsoleteInexactPosition = a3;
}

- (void)setHasObsoleteInexactPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasObsoleteInexactPosition
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setObsoleteCid:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_obsoleteCid = a3;
}

- (void)setHasObsoleteCid:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasObsoleteCid
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearObsoleteAddressLines
{
  -[NSMutableArray removeAllObjects](self->_obsoleteAddressLines, "removeAllObjects");
}

- (void)addObsoleteAddressLine:(id)a3
{
  id v4;
  NSMutableArray *obsoleteAddressLines;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  obsoleteAddressLines = self->_obsoleteAddressLines;
  v8 = v4;
  if (!obsoleteAddressLines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_obsoleteAddressLines;
    self->_obsoleteAddressLines = v6;

    v4 = v8;
    obsoleteAddressLines = self->_obsoleteAddressLines;
  }
  -[NSMutableArray addObject:](obsoleteAddressLines, "addObject:", v4);

}

- (unint64_t)obsoleteAddressLinesCount
{
  return (unint64_t)-[NSMutableArray count](self->_obsoleteAddressLines, "count");
}

- (id)obsoleteAddressLineAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_obsoleteAddressLines, "objectAtIndex:", a3);
}

+ (Class)obsoleteAddressLineType
{
  return (Class)objc_opt_class(NSString);
}

- (void)setObsoleteUnverifiedListing:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_obsoleteUnverifiedListing = a3;
}

- (void)setHasObsoleteUnverifiedListing:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasObsoleteUnverifiedListing
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setObsoleteClosedListing:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_obsoleteClosedListing = a3;
}

- (void)setHasObsoleteClosedListing:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasObsoleteClosedListing
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (void)setHasIncompleteMetadata:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasIncompleteMetadata = a3;
}

- (void)setHasHasIncompleteMetadata:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHasIncompleteMetadata
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIncompleteNavData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasIncompleteNavData = a3;
}

- (void)setHasHasIncompleteNavData:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasIncompleteNavData
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResultIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResultIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setFloorOrdinal:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_floorOrdinal = a3;
}

- (void)setHasFloorOrdinal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFloorOrdinal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAddressRecordID:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_addressRecordID = a3;
}

- (void)setHasAddressRecordID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAddressRecordID
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAddressID:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_addressID = a3;
}

- (void)setHasAddressID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAddressID
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchResultRepr;
  v3 = -[SearchResultRepr description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  NSString *obsoleteName;
  void *v10;
  NSString *obsoleteLocality;
  NSString *obsoleteRegion;
  NSString *obsoletePostalCode;
  NSString *obsoleteCountryCode;
  NSString *obsoleteCountryName;
  NSString *obsoletePhone;
  NSString *obsoleteReferenceURL;
  NSString *mapsURL;
  NSString *obsoleteDependentLocality;
  NSString *obsoleteThoroughfare;
  __int16 has;
  void *v22;
  NSMutableArray *obsoleteAddressLines;
  __int16 v24;
  void *v25;
  void *v26;
  GEOPlace *place;
  void *v28;
  __int16 v29;
  void *v30;
  NSString *syncIdentifier;
  __int16 v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_unusedMapType));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("unusedMapType"));

  v5 = self->_type - 3;
  if (v5 > 9)
    v6 = CFSTR("Default");
  else
    v6 = *(&off_1011E07C0 + (int)v5);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));
  v7 = self->_originalType - 3;
  if (v7 > 9)
    v8 = CFSTR("Default");
  else
    v8 = *(&off_1011E07C0 + (int)v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("originalType"));
  obsoleteName = self->_obsoleteName;
  if (obsoleteName)
    objc_msgSend(v3, "setObject:forKey:", obsoleteName, CFSTR("obsoleteName"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_flags));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("flags"));

  }
  obsoleteLocality = self->_obsoleteLocality;
  if (obsoleteLocality)
    objc_msgSend(v3, "setObject:forKey:", obsoleteLocality, CFSTR("obsoleteLocality"));
  obsoleteRegion = self->_obsoleteRegion;
  if (obsoleteRegion)
    objc_msgSend(v3, "setObject:forKey:", obsoleteRegion, CFSTR("obsoleteRegion"));
  obsoletePostalCode = self->_obsoletePostalCode;
  if (obsoletePostalCode)
    objc_msgSend(v3, "setObject:forKey:", obsoletePostalCode, CFSTR("obsoletePostalCode"));
  obsoleteCountryCode = self->_obsoleteCountryCode;
  if (obsoleteCountryCode)
    objc_msgSend(v3, "setObject:forKey:", obsoleteCountryCode, CFSTR("obsoleteCountryCode"));
  obsoleteCountryName = self->_obsoleteCountryName;
  if (obsoleteCountryName)
    objc_msgSend(v3, "setObject:forKey:", obsoleteCountryName, CFSTR("obsoleteCountryName"));
  obsoletePhone = self->_obsoletePhone;
  if (obsoletePhone)
    objc_msgSend(v3, "setObject:forKey:", obsoletePhone, CFSTR("obsoletePhone"));
  obsoleteReferenceURL = self->_obsoleteReferenceURL;
  if (obsoleteReferenceURL)
    objc_msgSend(v3, "setObject:forKey:", obsoleteReferenceURL, CFSTR("obsoleteReferenceURL"));
  mapsURL = self->_mapsURL;
  if (mapsURL)
    objc_msgSend(v3, "setObject:forKey:", mapsURL, CFSTR("mapsURL"));
  obsoleteDependentLocality = self->_obsoleteDependentLocality;
  if (obsoleteDependentLocality)
    objc_msgSend(v3, "setObject:forKey:", obsoleteDependentLocality, CFSTR("obsoleteDependentLocality"));
  obsoleteThoroughfare = self->_obsoleteThoroughfare;
  if (obsoleteThoroughfare)
    objc_msgSend(v3, "setObject:forKey:", obsoleteThoroughfare, CFSTR("obsoleteThoroughfare"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_obsoleteLatitudeE6Value));
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("obsoleteLatitudeE6Value"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_33:
      if ((has & 0x200) == 0)
        goto LABEL_34;
      goto LABEL_59;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_33;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_obsoleteLongitudeE6Value));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("obsoleteLongitudeE6Value"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_34:
    if ((has & 0x2000) == 0)
      goto LABEL_35;
    goto LABEL_60;
  }
LABEL_59:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_zoomLevel));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("zoomLevel"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_35:
    if ((has & 1) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_60:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_obsoleteInexactPosition));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("obsoleteInexactPosition"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_36:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_obsoleteCid));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("obsoleteCid"));

  }
LABEL_37:
  obsoleteAddressLines = self->_obsoleteAddressLines;
  if (obsoleteAddressLines)
    objc_msgSend(v3, "setObject:forKey:", obsoleteAddressLines, CFSTR("obsoleteAddressLine"));
  v24 = (__int16)self->_has;
  if ((v24 & 0x4000) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_obsoleteUnverifiedListing));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("obsoleteUnverifiedListing"));

    v24 = (__int16)self->_has;
  }
  if ((v24 & 0x1000) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_obsoleteClosedListing));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("obsoleteClosedListing"));

  }
  place = self->_place;
  if (place)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlace dictionaryRepresentation](place, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("place"));

  }
  v29 = (__int16)self->_has;
  if ((v29 & 0x400) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasIncompleteMetadata));
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("hasIncompleteMetadata"));

    v29 = (__int16)self->_has;
    if ((v29 & 0x800) == 0)
    {
LABEL_47:
      if ((v29 & 2) == 0)
        goto LABEL_48;
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_47;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasIncompleteNavData));
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("hasIncompleteNavData"));

  v29 = (__int16)self->_has;
  if ((v29 & 2) == 0)
  {
LABEL_48:
    if ((v29 & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_64:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("timestamp"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_49:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_resultIndex));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("resultIndex"));

  }
LABEL_50:
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  v32 = (__int16)self->_has;
  if ((v32 & 0x20) == 0)
  {
    if ((v32 & 8) == 0)
      goto LABEL_54;
LABEL_67:
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_addressRecordID));
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("addressRecordID"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_floorOrdinal));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("floorOrdinal"));

  v32 = (__int16)self->_has;
  if ((v32 & 8) != 0)
    goto LABEL_67;
LABEL_54:
  if ((v32 & 4) != 0)
  {
LABEL_55:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_addressID));
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("addressID"));

  }
LABEL_56:
  v34 = v3;

  return v34;
}

- (BOOL)readFrom:(id)a3
{
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  int v14;
  unint64_t v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  int v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t String;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  int64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  int *v82;
  int *v83;
  uint64_t v84;
  id v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  unint64_t v110;
  double v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  uint64_t v117;
  void *v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  char v124;
  unsigned int v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  uint64_t v129;
  BOOL v130;
  uint64_t v131;
  _QWORD v133[2];

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    v5 = &OBJC_IVAR___SearchHomeBrowseCategoriesDataProvider__identifier;
    v6 = &OBJC_IVAR___SearchHomeBrowseCategoriesDataProvider__identifier;
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        v11 = v10 + 1;
        if (v10 == -1 || v11 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v12 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v10);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v11;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        v13 = v8++ >= 9;
        if (v13)
        {
          v9 = 0;
          v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v9 = 0;
LABEL_14:
      if (v14 || (v9 & 7) == 4)
        break;
      v16 = v9 >> 3;
      switch((v9 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          while (1)
          {
            v20 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v21 = v20 + 1;
            if (v20 == -1 || v21 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_161;
            v17 += 7;
            v13 = v18++ >= 9;
            if (v13)
            {
              LODWORD(v19) = 0;
              goto LABEL_163;
            }
          }
          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_161:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_163:
          v129 = 188;
          goto LABEL_225;
        case 2u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          while (2)
          {
            v31 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v13 = v30++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_167:
          v129 = 184;
          goto LABEL_225;
        case 3u:
          v34 = 0;
          v35 = 0;
          v19 = 0;
          while (2)
          {
            v36 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v13 = v35++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_171:
          v129 = 152;
          goto LABEL_225;
        case 4u:
        case 7u:
        case 0xFu:
        case 0x10u:
        case 0x14u:
        case 0x1Au:
        case 0x1Cu:
        case 0x20u:
        case 0x21u:
        case 0x24u:
        case 0x25u:
        case 0x26u:
          goto LABEL_35;
        case 5u:
          String = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(String);
          v41 = 104;
          goto LABEL_145;
        case 6u:
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x10u;
          v42 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v42 <= 0xFFFFFFFFFFFFFFFBLL
            && (v43 = v42 + 4, v42 + 4 <= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length)))
          {
            v44 = *(_DWORD *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43;
          }
          else
          {
            v44 = 0;
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          self->_flags = v44;
          goto LABEL_226;
        case 8u:
          v45 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v45);
          v41 = 88;
          goto LABEL_145;
        case 9u:
          v46 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v46);
          v41 = 136;
          goto LABEL_145;
        case 0xAu:
          v47 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v47);
          v41 = 120;
          goto LABEL_145;
        case 0xBu:
          v48 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v48);
          v41 = 56;
          goto LABEL_145;
        case 0xCu:
          v49 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v49);
          v41 = 64;
          goto LABEL_145;
        case 0xDu:
          v50 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v50);
          v41 = 112;
          goto LABEL_145;
        case 0xEu:
          v51 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v51);
          v41 = 128;
          goto LABEL_145;
        case 0x11u:
          v52 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v52);
          v41 = 40;
          goto LABEL_145;
        case 0x12u:
          v53 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v53);
          v41 = 72;
          goto LABEL_145;
        case 0x13u:
          v54 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v54);
          v41 = 144;
          goto LABEL_145;
        case 0x15u:
          v55 = 0;
          v56 = 0;
          v19 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x40u;
          while (2)
          {
            v57 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v58;
              v19 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                v13 = v56++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_175:
          v129 = 80;
          goto LABEL_225;
        case 0x16u:
          v60 = 0;
          v61 = 0;
          v19 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x80u;
          while (2)
          {
            v62 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v63 = v62 + 1;
            if (v62 == -1 || v63 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v62);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v63;
              v19 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                v13 = v61++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_179:
          v129 = 96;
          goto LABEL_225;
        case 0x17u:
          v65 = 0;
          v66 = 0;
          v19 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x200u;
          while (2)
          {
            v67 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v68 = v67 + 1;
            if (v67 == -1 || v68 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v67);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v68;
              v19 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                v13 = v66++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_183:
          v129 = 192;
          goto LABEL_225;
        case 0x18u:
          v70 = 0;
          v71 = 0;
          v72 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x2000u;
          while (2)
          {
            v73 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v74 = v73 + 1;
            if (v73 == -1 || v74 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v73);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v74;
              v72 |= (unint64_t)(v75 & 0x7F) << v70;
              if (v75 < 0)
              {
                v70 += 7;
                v13 = v71++ >= 9;
                if (v13)
                {
                  v72 = 0;
                  goto LABEL_187;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v72 = 0;
LABEL_187:
          v130 = v72 != 0;
          v131 = 199;
          goto LABEL_208;
        case 0x19u:
          v76 = 0;
          v77 = 0;
          v78 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 1u;
          while (2)
          {
            v79 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v79);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v80;
              v78 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                v13 = v77++ >= 9;
                if (v13)
                {
                  v78 = 0;
                  goto LABEL_191;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v78 = 0;
LABEL_191:
          self->_obsoleteCid = v78;
          goto LABEL_226;
        case 0x1Bu:
          v82 = v5;
          v83 = v6;
          v84 = PBReaderReadString(a3);
          v85 = (id)objc_claimAutoreleasedReturnValue(v84);
          if (v85)
            -[SearchResultRepr addObsoleteAddressLine:](self, "addObsoleteAddressLine:", v85);
          goto LABEL_119;
        case 0x1Du:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x4000u;
          while (2)
          {
            v89 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v90 = v89 + 1;
            if (v89 == -1 || v90 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v89);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v90;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                v13 = v87++ >= 9;
                if (v13)
                {
                  v88 = 0;
                  goto LABEL_195;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v88 = 0;
LABEL_195:
          v130 = v88 != 0;
          v131 = 200;
          goto LABEL_208;
        case 0x1Eu:
          v92 = 0;
          v93 = 0;
          v94 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x1000u;
          while (2)
          {
            v95 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v96 = v95 + 1;
            if (v95 == -1 || v96 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v95);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v96;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                v13 = v93++ >= 9;
                if (v13)
                {
                  v94 = 0;
                  goto LABEL_199;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v94 = 0;
LABEL_199:
          v130 = v94 != 0;
          v131 = 198;
          goto LABEL_208;
        case 0x1Fu:
          v82 = v5;
          v83 = v6;
          v85 = objc_alloc_init((Class)GEOPlace);
          objc_storeStrong((id *)&self->_place, v85);
          v133[0] = 0;
          v133[1] = 0;
          if (!PBReaderPlaceMark(a3, v133) || (objc_msgSend(v85, "readFrom:", a3) & 1) == 0)
          {

            LOBYTE(v28) = 0;
            return v28;
          }
          PBReaderRecallMark(a3, v133);
LABEL_119:

          v6 = v83;
          v5 = v82;
          goto LABEL_226;
        case 0x22u:
          v98 = 0;
          v99 = 0;
          v100 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x400u;
          while (2)
          {
            v101 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v102 = v101 + 1;
            if (v101 == -1 || v102 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v101);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v102;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v13 = v99++ >= 9;
                if (v13)
                {
                  v100 = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v100 = 0;
LABEL_203:
          v130 = v100 != 0;
          v131 = 196;
          goto LABEL_208;
        case 0x23u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x800u;
          while (2)
          {
            v107 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v108 = v107 + 1;
            if (v107 == -1 || v108 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v107);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v108;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                v13 = v105++ >= 9;
                if (v13)
                {
                  v106 = 0;
                  goto LABEL_207;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v106 = 0;
LABEL_207:
          v130 = v106 != 0;
          v131 = 197;
LABEL_208:
          self->PBCodable_opaque[v131] = v130;
          goto LABEL_226;
        case 0x27u:
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 2u;
          v110 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v110 <= 0xFFFFFFFFFFFFFFF7 && v110 + 8 <= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v111 = *(double *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v110);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v110 + 8;
          }
          else
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            v111 = 0.0;
          }
          self->_timestamp = v111;
          goto LABEL_226;
        case 0x28u:
          v112 = 0;
          v113 = 0;
          v19 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x100u;
          while (2)
          {
            v114 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v115 = v114 + 1;
            if (v114 == -1 || v115 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v116 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v114);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v115;
              v19 |= (unint64_t)(v116 & 0x7F) << v112;
              if (v116 < 0)
              {
                v112 += 7;
                v13 = v113++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_212;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_212:
          v129 = 168;
          goto LABEL_225;
        case 0x29u:
          v117 = PBReaderReadString(a3);
          v40 = objc_claimAutoreleasedReturnValue(v117);
          v41 = 176;
LABEL_145:
          v118 = *(void **)&self->PBCodable_opaque[v41];
          *(_QWORD *)&self->PBCodable_opaque[v41] = v40;

          goto LABEL_226;
        case 0x2Au:
          v119 = 0;
          v120 = 0;
          v19 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 0x20u;
          while (2)
          {
            v121 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            v122 = v121 + 1;
            if (v121 == -1 || v122 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v123 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v121);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v122;
              v19 |= (unint64_t)(v123 & 0x7F) << v119;
              if (v123 < 0)
              {
                v119 += 7;
                v13 = v120++ >= 9;
                if (v13)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_216;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v19) = 0;
LABEL_216:
          v129 = 36;
          goto LABEL_225;
        default:
          if ((_DWORD)v16 == 101)
          {
            v124 = 0;
            v125 = 0;
            v19 = 0;
            *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 8u;
            while (1)
            {
              v126 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              v127 = v126 + 1;
              if (v126 == -1 || v127 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
                break;
              v128 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v126);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v127;
              v19 |= (unint64_t)(v128 & 0x7F) << v124;
              if ((v128 & 0x80) == 0)
                goto LABEL_222;
              v124 += 7;
              v13 = v125++ >= 9;
              if (v13)
              {
                LODWORD(v19) = 0;
                goto LABEL_224;
              }
            }
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_222:
            if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
              LODWORD(v19) = 0;
LABEL_224:
            v129 = v6[948];
            goto LABEL_225;
          }
          if ((_DWORD)v16 == 102)
          {
            v23 = 0;
            v24 = 0;
            v19 = 0;
            *(_WORD *)&self->PBCodable_opaque[v5[921]] |= 4u;
            while (1)
            {
              v25 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              v26 = v25 + 1;
              if (v25 == -1 || v26 > *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
                break;
              v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26;
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if ((v27 & 0x80) == 0)
                goto LABEL_218;
              v23 += 7;
              v13 = v24++ >= 9;
              if (v13)
              {
                LODWORD(v19) = 0;
                goto LABEL_220;
              }
            }
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_218:
            if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
              LODWORD(v19) = 0;
LABEL_220:
            v129 = 24;
LABEL_225:
            *(_DWORD *)&self->PBCodable_opaque[v129] = v19;
            goto LABEL_226;
          }
LABEL_35:
          v28 = PBReaderSkipValueWithTag(a3);
          if (!v28)
            return v28;
LABEL_226:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_232;
          break;
      }
    }
  }
LABEL_232:
  LOBYTE(v28) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *obsoleteName;
  NSString *obsoleteLocality;
  NSString *obsoleteRegion;
  NSString *obsoletePostalCode;
  NSString *obsoleteCountryCode;
  NSString *obsoleteCountryName;
  NSString *obsoletePhone;
  NSString *obsoleteReferenceURL;
  NSString *mapsURL;
  NSString *obsoleteDependentLocality;
  NSString *obsoleteThoroughfare;
  __int16 has;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  __int16 v22;
  GEOPlace *place;
  __int16 v24;
  NSString *syncIdentifier;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a3;
  PBDataWriterWriteUint32Field(v4, self->_unusedMapType, 1);
  PBDataWriterWriteUint32Field(v4, self->_type, 2);
  PBDataWriterWriteUint32Field(v4, self->_originalType, 3);
  obsoleteName = self->_obsoleteName;
  if (obsoleteName)
    PBDataWriterWriteStringField(v4, obsoleteName, 5);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteFixed32Field(v4, self->_flags, 6);
  obsoleteLocality = self->_obsoleteLocality;
  if (obsoleteLocality)
    PBDataWriterWriteStringField(v4, obsoleteLocality, 8);
  obsoleteRegion = self->_obsoleteRegion;
  if (obsoleteRegion)
    PBDataWriterWriteStringField(v4, obsoleteRegion, 9);
  obsoletePostalCode = self->_obsoletePostalCode;
  if (obsoletePostalCode)
    PBDataWriterWriteStringField(v4, obsoletePostalCode, 10);
  obsoleteCountryCode = self->_obsoleteCountryCode;
  if (obsoleteCountryCode)
    PBDataWriterWriteStringField(v4, obsoleteCountryCode, 11);
  obsoleteCountryName = self->_obsoleteCountryName;
  if (obsoleteCountryName)
    PBDataWriterWriteStringField(v4, obsoleteCountryName, 12);
  obsoletePhone = self->_obsoletePhone;
  if (obsoletePhone)
    PBDataWriterWriteStringField(v4, obsoletePhone, 13);
  obsoleteReferenceURL = self->_obsoleteReferenceURL;
  if (obsoleteReferenceURL)
    PBDataWriterWriteStringField(v4, obsoleteReferenceURL, 14);
  mapsURL = self->_mapsURL;
  if (mapsURL)
    PBDataWriterWriteStringField(v4, mapsURL, 17);
  obsoleteDependentLocality = self->_obsoleteDependentLocality;
  if (obsoleteDependentLocality)
    PBDataWriterWriteStringField(v4, obsoleteDependentLocality, 18);
  obsoleteThoroughfare = self->_obsoleteThoroughfare;
  if (obsoleteThoroughfare)
    PBDataWriterWriteStringField(v4, obsoleteThoroughfare, 19);
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_obsoleteLatitudeE6Value, 21);
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_27:
      if ((has & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_58;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field(v4, self->_obsoleteLongitudeE6Value, 22);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_28:
    if ((has & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field(v4, self->_zoomLevel, 23);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_29:
    if ((has & 1) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_59:
  PBDataWriterWriteBOOLField(v4, self->_obsoleteInexactPosition, 24);
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_30:
    PBDataWriterWriteInt64Field(v4, self->_obsoleteCid, 25);
LABEL_31:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_obsoleteAddressLines;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), 27);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  v22 = (__int16)self->_has;
  if ((v22 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_obsoleteUnverifiedListing, 29);
    v22 = (__int16)self->_has;
  }
  if ((v22 & 0x1000) != 0)
    PBDataWriterWriteBOOLField(v4, self->_obsoleteClosedListing, 30);
  place = self->_place;
  if (place)
    PBDataWriterWriteSubmessage(v4, place, 31);
  v24 = (__int16)self->_has;
  if ((v24 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_hasIncompleteMetadata, 34);
    v24 = (__int16)self->_has;
    if ((v24 & 0x800) == 0)
    {
LABEL_46:
      if ((v24 & 2) == 0)
        goto LABEL_47;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteBOOLField(v4, self->_hasIncompleteNavData, 35);
  v24 = (__int16)self->_has;
  if ((v24 & 2) == 0)
  {
LABEL_47:
    if ((v24 & 0x100) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_63:
  PBDataWriterWriteDoubleField(v4, 39, self->_timestamp);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_48:
    PBDataWriterWriteInt32Field(v4, self->_resultIndex, 40);
LABEL_49:
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    PBDataWriterWriteStringField(v4, syncIdentifier, 41);
  v26 = (__int16)self->_has;
  if ((v26 & 0x20) == 0)
  {
    if ((v26 & 8) == 0)
      goto LABEL_53;
LABEL_66:
    PBDataWriterWriteInt32Field(v4, self->_addressRecordID, 101);
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
  PBDataWriterWriteInt32Field(v4, self->_floorOrdinal, 42);
  v26 = (__int16)self->_has;
  if ((v26 & 8) != 0)
    goto LABEL_66;
LABEL_53:
  if ((v26 & 4) != 0)
LABEL_54:
    PBDataWriterWriteInt32Field(v4, self->_addressID, 102);
LABEL_55:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  _BYTE *v11;
  __int16 v12;
  __int16 v13;
  _DWORD *v14;

  v4 = a3;
  v4[47] = self->_unusedMapType;
  v4[46] = self->_type;
  v4[38] = self->_originalType;
  v14 = v4;
  if (self->_obsoleteName)
  {
    objc_msgSend(v4, "setObsoleteName:");
    v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v4[8] = self->_flags;
    *((_WORD *)v4 + 102) |= 0x10u;
  }
  if (self->_obsoleteLocality)
  {
    objc_msgSend(v14, "setObsoleteLocality:");
    v4 = v14;
  }
  if (self->_obsoleteRegion)
  {
    objc_msgSend(v14, "setObsoleteRegion:");
    v4 = v14;
  }
  if (self->_obsoletePostalCode)
  {
    objc_msgSend(v14, "setObsoletePostalCode:");
    v4 = v14;
  }
  if (self->_obsoleteCountryCode)
  {
    objc_msgSend(v14, "setObsoleteCountryCode:");
    v4 = v14;
  }
  if (self->_obsoleteCountryName)
  {
    objc_msgSend(v14, "setObsoleteCountryName:");
    v4 = v14;
  }
  if (self->_obsoletePhone)
  {
    objc_msgSend(v14, "setObsoletePhone:");
    v4 = v14;
  }
  if (self->_obsoleteReferenceURL)
  {
    objc_msgSend(v14, "setObsoleteReferenceURL:");
    v4 = v14;
  }
  if (self->_mapsURL)
  {
    objc_msgSend(v14, "setMapsURL:");
    v4 = v14;
  }
  if (self->_obsoleteDependentLocality)
  {
    objc_msgSend(v14, "setObsoleteDependentLocality:");
    v4 = v14;
  }
  if (self->_obsoleteThoroughfare)
  {
    objc_msgSend(v14, "setObsoleteThoroughfare:");
    v4 = v14;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_obsoleteLatitudeE6Value;
    *((_WORD *)v4 + 102) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_27:
      if ((has & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_55;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_27;
  }
  v4[24] = self->_obsoleteLongitudeE6Value;
  *((_WORD *)v4 + 102) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_28:
    if ((has & 0x2000) == 0)
      goto LABEL_29;
LABEL_56:
    *((_BYTE *)v4 + 199) = self->_obsoleteInexactPosition;
    *((_WORD *)v4 + 102) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_55:
  v4[48] = self->_zoomLevel;
  *((_WORD *)v4 + 102) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
    goto LABEL_56;
LABEL_29:
  if ((has & 1) != 0)
  {
LABEL_30:
    *((_QWORD *)v4 + 1) = self->_obsoleteCid;
    *((_WORD *)v4 + 102) |= 1u;
  }
LABEL_31:
  if (-[SearchResultRepr obsoleteAddressLinesCount](self, "obsoleteAddressLinesCount"))
  {
    objc_msgSend(v14, "clearObsoleteAddressLines");
    v6 = -[SearchResultRepr obsoleteAddressLinesCount](self, "obsoleteAddressLinesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteAddressLineAtIndex:](self, "obsoleteAddressLineAtIndex:", i));
        objc_msgSend(v14, "addObsoleteAddressLine:", v9);

      }
    }
  }
  v10 = (__int16)self->_has;
  v11 = v14;
  if ((v10 & 0x4000) != 0)
  {
    *((_BYTE *)v14 + 200) = self->_obsoleteUnverifiedListing;
    *((_WORD *)v14 + 102) |= 0x4000u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x1000) != 0)
  {
    *((_BYTE *)v14 + 198) = self->_obsoleteClosedListing;
    *((_WORD *)v14 + 102) |= 0x1000u;
  }
  if (self->_place)
  {
    objc_msgSend(v14, "setPlace:");
    v11 = v14;
  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x400) != 0)
  {
    v11[196] = self->_hasIncompleteMetadata;
    *((_WORD *)v11 + 102) |= 0x400u;
    v12 = (__int16)self->_has;
    if ((v12 & 0x800) == 0)
    {
LABEL_43:
      if ((v12 & 2) == 0)
        goto LABEL_44;
      goto LABEL_60;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_43;
  }
  v11[197] = self->_hasIncompleteNavData;
  *((_WORD *)v11 + 102) |= 0x800u;
  v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_44:
    if ((v12 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_60:
  *((_QWORD *)v11 + 2) = *(_QWORD *)&self->_timestamp;
  *((_WORD *)v11 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_45:
    *((_DWORD *)v11 + 42) = self->_resultIndex;
    *((_WORD *)v11 + 102) |= 0x100u;
  }
LABEL_46:
  if (self->_syncIdentifier)
  {
    objc_msgSend(v14, "setSyncIdentifier:");
    v11 = v14;
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
    if ((v13 & 8) == 0)
      goto LABEL_50;
LABEL_63:
    *((_DWORD *)v11 + 7) = self->_addressRecordID;
    *((_WORD *)v11 + 102) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
  *((_DWORD *)v11 + 9) = self->_floorOrdinal;
  *((_WORD *)v11 + 102) |= 0x20u;
  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
    goto LABEL_63;
LABEL_50:
  if ((v13 & 4) != 0)
  {
LABEL_51:
    *((_DWORD *)v11 + 6) = self->_addressID;
    *((_WORD *)v11 + 102) |= 4u;
  }
LABEL_52:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  __int16 has;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  id v34;
  __int16 v35;
  id v36;
  void *v37;
  __int16 v38;
  id v39;
  void *v40;
  __int16 v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[47] = self->_unusedMapType;
  v5[46] = self->_type;
  v5[38] = self->_originalType;
  v6 = -[NSString copyWithZone:](self->_obsoleteName, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v6;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[8] = self->_flags;
    *((_WORD *)v5 + 102) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_obsoleteLocality, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v8;

  v10 = -[NSString copyWithZone:](self->_obsoleteRegion, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v10;

  v12 = -[NSString copyWithZone:](self->_obsoletePostalCode, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v12;

  v14 = -[NSString copyWithZone:](self->_obsoleteCountryCode, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v14;

  v16 = -[NSString copyWithZone:](self->_obsoleteCountryName, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v16;

  v18 = -[NSString copyWithZone:](self->_obsoletePhone, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v18;

  v20 = -[NSString copyWithZone:](self->_obsoleteReferenceURL, "copyWithZone:", a3);
  v21 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v20;

  v22 = -[NSString copyWithZone:](self->_mapsURL, "copyWithZone:", a3);
  v23 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v22;

  v24 = -[NSString copyWithZone:](self->_obsoleteDependentLocality, "copyWithZone:", a3);
  v25 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v24;

  v26 = -[NSString copyWithZone:](self->_obsoleteThoroughfare, "copyWithZone:", a3);
  v27 = (void *)*((_QWORD *)v5 + 18);
  *((_QWORD *)v5 + 18) = v26;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5[20] = self->_obsoleteLatitudeE6Value;
    *((_WORD *)v5 + 102) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  v5[24] = self->_obsoleteLongitudeE6Value;
  *((_WORD *)v5 + 102) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  v5[48] = self->_zoomLevel;
  *((_WORD *)v5 + 102) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_33:
  *((_BYTE *)v5 + 199) = self->_obsoleteInexactPosition;
  *((_WORD *)v5 + 102) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v5 + 1) = self->_obsoleteCid;
    *((_WORD *)v5 + 102) |= 1u;
  }
LABEL_9:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = self->_obsoleteAddressLines;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v29);
        v34 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend(v5, "addObsoleteAddressLine:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v31);
  }

  v35 = (__int16)self->_has;
  if ((v35 & 0x4000) != 0)
  {
    *((_BYTE *)v5 + 200) = self->_obsoleteUnverifiedListing;
    *((_WORD *)v5 + 102) |= 0x4000u;
    v35 = (__int16)self->_has;
  }
  if ((v35 & 0x1000) != 0)
  {
    *((_BYTE *)v5 + 198) = self->_obsoleteClosedListing;
    *((_WORD *)v5 + 102) |= 0x1000u;
  }
  v36 = -[GEOPlace copyWithZone:](self->_place, "copyWithZone:", a3, (_QWORD)v43);
  v37 = (void *)*((_QWORD *)v5 + 20);
  *((_QWORD *)v5 + 20) = v36;

  v38 = (__int16)self->_has;
  if ((v38 & 0x400) != 0)
  {
    *((_BYTE *)v5 + 196) = self->_hasIncompleteMetadata;
    *((_WORD *)v5 + 102) |= 0x400u;
    v38 = (__int16)self->_has;
    if ((v38 & 0x800) == 0)
    {
LABEL_22:
      if ((v38 & 2) == 0)
        goto LABEL_23;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_22;
  }
  *((_BYTE *)v5 + 197) = self->_hasIncompleteNavData;
  *((_WORD *)v5 + 102) |= 0x800u;
  v38 = (__int16)self->_has;
  if ((v38 & 2) == 0)
  {
LABEL_23:
    if ((v38 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_37:
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_timestamp;
  *((_WORD *)v5 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_24:
    v5[42] = self->_resultIndex;
    *((_WORD *)v5 + 102) |= 0x100u;
  }
LABEL_25:
  v39 = -[NSString copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v40 = (void *)*((_QWORD *)v5 + 22);
  *((_QWORD *)v5 + 22) = v39;

  v41 = (__int16)self->_has;
  if ((v41 & 0x20) == 0)
  {
    if ((v41 & 8) == 0)
      goto LABEL_27;
LABEL_40:
    v5[7] = self->_addressRecordID;
    *((_WORD *)v5 + 102) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v5;
    goto LABEL_28;
  }
  v5[9] = self->_floorOrdinal;
  *((_WORD *)v5 + 102) |= 0x20u;
  v41 = (__int16)self->_has;
  if ((v41 & 8) != 0)
    goto LABEL_40;
LABEL_27:
  if ((v41 & 4) != 0)
  {
LABEL_28:
    v5[6] = self->_addressID;
    *((_WORD *)v5 + 102) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *obsoleteName;
  __int16 v6;
  NSString *obsoleteLocality;
  NSString *obsoleteRegion;
  NSString *obsoletePostalCode;
  NSString *obsoleteCountryCode;
  NSString *obsoleteCountryName;
  NSString *obsoletePhone;
  NSString *obsoleteReferenceURL;
  NSString *mapsURL;
  NSString *obsoleteDependentLocality;
  NSString *obsoleteThoroughfare;
  __int16 has;
  __int16 v18;
  NSMutableArray *obsoleteAddressLines;
  GEOPlace *place;
  NSString *syncIdentifier;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_126;
  if (self->_unusedMapType != *((_DWORD *)v4 + 47))
    goto LABEL_126;
  if (self->_type != *((_DWORD *)v4 + 46))
    goto LABEL_126;
  if (self->_originalType != *((_DWORD *)v4 + 38))
    goto LABEL_126;
  obsoleteName = self->_obsoleteName;
  if ((unint64_t)obsoleteName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](obsoleteName, "isEqual:"))
      goto LABEL_126;
  }
  v6 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_flags != *((_DWORD *)v4 + 8))
      goto LABEL_126;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  obsoleteLocality = self->_obsoleteLocality;
  if ((unint64_t)obsoleteLocality | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](obsoleteLocality, "isEqual:"))
  {
    goto LABEL_126;
  }
  obsoleteRegion = self->_obsoleteRegion;
  if ((unint64_t)obsoleteRegion | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](obsoleteRegion, "isEqual:"))
      goto LABEL_126;
  }
  obsoletePostalCode = self->_obsoletePostalCode;
  if ((unint64_t)obsoletePostalCode | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](obsoletePostalCode, "isEqual:"))
      goto LABEL_126;
  }
  obsoleteCountryCode = self->_obsoleteCountryCode;
  if ((unint64_t)obsoleteCountryCode | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](obsoleteCountryCode, "isEqual:"))
      goto LABEL_126;
  }
  obsoleteCountryName = self->_obsoleteCountryName;
  if ((unint64_t)obsoleteCountryName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](obsoleteCountryName, "isEqual:"))
      goto LABEL_126;
  }
  obsoletePhone = self->_obsoletePhone;
  if ((unint64_t)obsoletePhone | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](obsoletePhone, "isEqual:"))
      goto LABEL_126;
  }
  obsoleteReferenceURL = self->_obsoleteReferenceURL;
  if ((unint64_t)obsoleteReferenceURL | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](obsoleteReferenceURL, "isEqual:"))
      goto LABEL_126;
  }
  mapsURL = self->_mapsURL;
  if ((unint64_t)mapsURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](mapsURL, "isEqual:"))
      goto LABEL_126;
  }
  obsoleteDependentLocality = self->_obsoleteDependentLocality;
  if ((unint64_t)obsoleteDependentLocality | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](obsoleteDependentLocality, "isEqual:"))
      goto LABEL_126;
  }
  obsoleteThoroughfare = self->_obsoleteThoroughfare;
  if ((unint64_t)obsoleteThoroughfare | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](obsoleteThoroughfare, "isEqual:"))
      goto LABEL_126;
  }
  has = (__int16)self->_has;
  v18 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_obsoleteLatitudeE6Value != *((_DWORD *)v4 + 20))
      goto LABEL_126;
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_obsoleteLongitudeE6Value != *((_DWORD *)v4 + 24))
      goto LABEL_126;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0 || self->_zoomLevel != *((_DWORD *)v4 + 48))
      goto LABEL_126;
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x2000) == 0)
      goto LABEL_126;
    if (self->_obsoleteInexactPosition)
    {
      if (!*((_BYTE *)v4 + 199))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 199))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_obsoleteCid != *((_QWORD *)v4 + 1))
      goto LABEL_126;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_126;
  }
  obsoleteAddressLines = self->_obsoleteAddressLines;
  if ((unint64_t)obsoleteAddressLines | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](obsoleteAddressLines, "isEqual:"))
      goto LABEL_126;
    has = (__int16)self->_has;
    v18 = *((_WORD *)v4 + 102);
  }
  if ((has & 0x4000) != 0)
  {
    if ((v18 & 0x4000) == 0)
      goto LABEL_126;
    if (self->_obsoleteUnverifiedListing)
    {
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0)
      goto LABEL_126;
    if (self->_obsoleteClosedListing)
    {
      if (!*((_BYTE *)v4 + 198))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 198))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_126;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOPlace isEqual:](place, "isEqual:"))
      goto LABEL_126;
    has = (__int16)self->_has;
    v18 = *((_WORD *)v4 + 102);
  }
  if ((has & 0x400) != 0)
  {
    if ((v18 & 0x400) == 0)
      goto LABEL_126;
    if (self->_hasIncompleteMetadata)
    {
      if (!*((_BYTE *)v4 + 196))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 196))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0)
      goto LABEL_126;
    if (self->_hasIncompleteNavData)
    {
      if (!*((_BYTE *)v4 + 197))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 197))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_126;
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0 || self->_resultIndex != *((_DWORD *)v4 + 42))
      goto LABEL_126;
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_126;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 22))
  {
    if (-[NSString isEqual:](syncIdentifier, "isEqual:"))
    {
      has = (__int16)self->_has;
      v18 = *((_WORD *)v4 + 102);
      goto LABEL_111;
    }
LABEL_126:
    v22 = 0;
    goto LABEL_127;
  }
LABEL_111:
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_floorOrdinal != *((_DWORD *)v4 + 9))
      goto LABEL_126;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_addressRecordID != *((_DWORD *)v4 + 7))
      goto LABEL_126;
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_addressID != *((_DWORD *)v4 + 6))
      goto LABEL_126;
    v22 = 1;
  }
  else
  {
    v22 = (v18 & 4) == 0;
  }
LABEL_127:

  return v22;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  double timestamp;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t v39;
  NSUInteger v40;
  unsigned int originalType;
  unsigned int type;
  unsigned int unusedMapType;

  unusedMapType = self->_unusedMapType;
  type = self->_type;
  originalType = self->_originalType;
  v40 = -[NSString hash](self->_obsoleteName, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v39 = 2654435761 * self->_flags;
  else
    v39 = 0;
  v38 = -[NSString hash](self->_obsoleteLocality, "hash");
  v35 = -[NSString hash](self->_obsoleteRegion, "hash");
  v37 = -[NSString hash](self->_obsoletePostalCode, "hash");
  v36 = -[NSString hash](self->_obsoleteCountryCode, "hash");
  v34 = -[NSString hash](self->_obsoleteCountryName, "hash");
  v33 = -[NSString hash](self->_obsoletePhone, "hash");
  v32 = -[NSString hash](self->_obsoleteReferenceURL, "hash");
  v31 = -[NSString hash](self->_mapsURL, "hash");
  v30 = -[NSString hash](self->_obsoleteDependentLocality, "hash");
  v29 = -[NSString hash](self->_obsoleteThoroughfare, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v28 = 2654435761 * self->_obsoleteLatitudeE6Value;
    if ((has & 0x80) != 0)
    {
LABEL_6:
      v27 = 2654435761 * self->_obsoleteLongitudeE6Value;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v28 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_6;
  }
  v27 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v26 = 2654435761 * self->_zoomLevel;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_8;
LABEL_13:
    v25 = 0;
    if ((has & 1) != 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_12:
  v26 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_13;
LABEL_8:
  v25 = 2654435761 * self->_obsoleteInexactPosition;
  if ((has & 1) != 0)
  {
LABEL_9:
    v24 = 2654435761 * self->_obsoleteCid;
    goto LABEL_15;
  }
LABEL_14:
  v24 = 0;
LABEL_15:
  v22 = -[NSMutableArray hash](self->_obsoleteAddressLines, "hash");
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    v4 = 2654435761 * self->_obsoleteUnverifiedListing;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_17;
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_17:
      v5 = 2654435761 * self->_obsoleteClosedListing;
      goto LABEL_20;
    }
  }
  v5 = 0;
LABEL_20:
  v6 = (unint64_t)-[GEOPlace hash](self->_place, "hash", v22);
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_22;
LABEL_28:
    v9 = 0;
    if ((v7 & 2) != 0)
      goto LABEL_23;
LABEL_29:
    v14 = 0;
    goto LABEL_32;
  }
  v8 = 2654435761 * self->_hasIncompleteMetadata;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_28;
LABEL_22:
  v9 = 2654435761 * self->_hasIncompleteNavData;
  if ((v7 & 2) == 0)
    goto LABEL_29;
LABEL_23:
  timestamp = self->_timestamp;
  v11 = -timestamp;
  if (timestamp >= 0.0)
    v11 = self->_timestamp;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_32:
  if ((v7 & 0x100) != 0)
    v15 = 2654435761 * self->_resultIndex;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_syncIdentifier, "hash");
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
    v18 = 0;
    if ((v17 & 8) != 0)
      goto LABEL_37;
LABEL_40:
    v19 = 0;
    if ((v17 & 4) != 0)
      goto LABEL_38;
LABEL_41:
    v20 = 0;
    return (2654435761 * type) ^ (2654435761 * unusedMapType) ^ (2654435761 * originalType) ^ v40 ^ v39 ^ v38 ^ v35 ^ v37 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20;
  }
  v18 = 2654435761 * self->_floorOrdinal;
  if ((v17 & 8) == 0)
    goto LABEL_40;
LABEL_37:
  v19 = 2654435761 * self->_addressRecordID;
  if ((v17 & 4) == 0)
    goto LABEL_41;
LABEL_38:
  v20 = 2654435761 * self->_addressID;
  return (2654435761 * type) ^ (2654435761 * unusedMapType) ^ (2654435761 * originalType) ^ v40 ^ v39 ^ v38 ^ v35 ^ v37 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int16 v11;
  GEOPlace *place;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  self->_unusedMapType = *((_DWORD *)v4 + 47);
  self->_type = *((_DWORD *)v4 + 46);
  self->_originalType = *((_DWORD *)v4 + 38);
  if (*((_QWORD *)v4 + 13))
    -[SearchResultRepr setObsoleteName:](self, "setObsoleteName:");
  if ((*((_WORD *)v4 + 102) & 0x10) != 0)
  {
    self->_flags = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 11))
    -[SearchResultRepr setObsoleteLocality:](self, "setObsoleteLocality:");
  if (*((_QWORD *)v4 + 17))
    -[SearchResultRepr setObsoleteRegion:](self, "setObsoleteRegion:");
  if (*((_QWORD *)v4 + 15))
    -[SearchResultRepr setObsoletePostalCode:](self, "setObsoletePostalCode:");
  if (*((_QWORD *)v4 + 7))
    -[SearchResultRepr setObsoleteCountryCode:](self, "setObsoleteCountryCode:");
  if (*((_QWORD *)v4 + 8))
    -[SearchResultRepr setObsoleteCountryName:](self, "setObsoleteCountryName:");
  if (*((_QWORD *)v4 + 14))
    -[SearchResultRepr setObsoletePhone:](self, "setObsoletePhone:");
  if (*((_QWORD *)v4 + 16))
    -[SearchResultRepr setObsoleteReferenceURL:](self, "setObsoleteReferenceURL:");
  if (*((_QWORD *)v4 + 5))
    -[SearchResultRepr setMapsURL:](self, "setMapsURL:");
  if (*((_QWORD *)v4 + 9))
    -[SearchResultRepr setObsoleteDependentLocality:](self, "setObsoleteDependentLocality:");
  if (*((_QWORD *)v4 + 18))
    -[SearchResultRepr setObsoleteThoroughfare:](self, "setObsoleteThoroughfare:");
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x40) != 0)
  {
    self->_obsoleteLatitudeE6Value = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x80) == 0)
    {
LABEL_27:
      if ((v5 & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_47;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_27;
  }
  self->_obsoleteLongitudeE6Value = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x200) == 0)
  {
LABEL_28:
    if ((v5 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_48;
  }
LABEL_47:
  self->_zoomLevel = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x2000) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_48:
  self->_obsoleteInexactPosition = *((_BYTE *)v4 + 199);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 102) & 1) != 0)
  {
LABEL_30:
    self->_obsoleteCid = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_31:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[SearchResultRepr addObsoleteAddressLine:](self, "addObsoleteAddressLine:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v11 = *((_WORD *)v4 + 102);
  if ((v11 & 0x4000) != 0)
  {
    self->_obsoleteUnverifiedListing = *((_BYTE *)v4 + 200);
    *(_WORD *)&self->_has |= 0x4000u;
    v11 = *((_WORD *)v4 + 102);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_obsoleteClosedListing = *((_BYTE *)v4 + 198);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  place = self->_place;
  v13 = *((_QWORD *)v4 + 20);
  if (place)
  {
    if (v13)
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v13)
  {
    -[SearchResultRepr setPlace:](self, "setPlace:");
  }
  v14 = *((_WORD *)v4 + 102);
  if ((v14 & 0x400) != 0)
  {
    self->_hasIncompleteMetadata = *((_BYTE *)v4 + 196);
    *(_WORD *)&self->_has |= 0x400u;
    v14 = *((_WORD *)v4 + 102);
    if ((v14 & 0x800) == 0)
    {
LABEL_54:
      if ((v14 & 2) == 0)
        goto LABEL_55;
      goto LABEL_66;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_54;
  }
  self->_hasIncompleteNavData = *((_BYTE *)v4 + 197);
  *(_WORD *)&self->_has |= 0x800u;
  v14 = *((_WORD *)v4 + 102);
  if ((v14 & 2) == 0)
  {
LABEL_55:
    if ((v14 & 0x100) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_66:
  self->_timestamp = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
LABEL_56:
    self->_resultIndex = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_57:
  if (*((_QWORD *)v4 + 22))
    -[SearchResultRepr setSyncIdentifier:](self, "setSyncIdentifier:");
  v15 = *((_WORD *)v4 + 102);
  if ((v15 & 0x20) == 0)
  {
    if ((v15 & 8) == 0)
      goto LABEL_61;
LABEL_69:
    self->_addressRecordID = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 102) & 4) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
  self->_floorOrdinal = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v15 = *((_WORD *)v4 + 102);
  if ((v15 & 8) != 0)
    goto LABEL_69;
LABEL_61:
  if ((v15 & 4) != 0)
  {
LABEL_62:
    self->_addressID = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_63:

}

- (unsigned)unusedMapType
{
  return self->_unusedMapType;
}

- (void)setUnusedMapType:(unsigned int)a3
{
  self->_unusedMapType = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)originalType
{
  return self->_originalType;
}

- (void)setOriginalType:(unsigned int)a3
{
  self->_originalType = a3;
}

- (NSString)obsoleteName
{
  return self->_obsoleteName;
}

- (void)setObsoleteName:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteName, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)obsoleteLocality
{
  return self->_obsoleteLocality;
}

- (void)setObsoleteLocality:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteLocality, a3);
}

- (NSString)obsoleteRegion
{
  return self->_obsoleteRegion;
}

- (void)setObsoleteRegion:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteRegion, a3);
}

- (NSString)obsoletePostalCode
{
  return self->_obsoletePostalCode;
}

- (void)setObsoletePostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_obsoletePostalCode, a3);
}

- (NSString)obsoleteCountryCode
{
  return self->_obsoleteCountryCode;
}

- (void)setObsoleteCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteCountryCode, a3);
}

- (NSString)obsoleteCountryName
{
  return self->_obsoleteCountryName;
}

- (void)setObsoleteCountryName:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteCountryName, a3);
}

- (NSString)obsoletePhone
{
  return self->_obsoletePhone;
}

- (void)setObsoletePhone:(id)a3
{
  objc_storeStrong((id *)&self->_obsoletePhone, a3);
}

- (NSString)obsoleteReferenceURL
{
  return self->_obsoleteReferenceURL;
}

- (void)setObsoleteReferenceURL:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteReferenceURL, a3);
}

- (NSString)mapsURL
{
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
  objc_storeStrong((id *)&self->_mapsURL, a3);
}

- (NSString)obsoleteDependentLocality
{
  return self->_obsoleteDependentLocality;
}

- (void)setObsoleteDependentLocality:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteDependentLocality, a3);
}

- (NSString)obsoleteThoroughfare
{
  return self->_obsoleteThoroughfare;
}

- (void)setObsoleteThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteThoroughfare, a3);
}

- (int)obsoleteLatitudeE6Value
{
  return self->_obsoleteLatitudeE6Value;
}

- (int)obsoleteLongitudeE6Value
{
  return self->_obsoleteLongitudeE6Value;
}

- (unsigned)zoomLevel
{
  return self->_zoomLevel;
}

- (BOOL)obsoleteInexactPosition
{
  return self->_obsoleteInexactPosition;
}

- (int64_t)obsoleteCid
{
  return self->_obsoleteCid;
}

- (NSMutableArray)obsoleteAddressLines
{
  return self->_obsoleteAddressLines;
}

- (void)setObsoleteAddressLines:(id)a3
{
  objc_storeStrong((id *)&self->_obsoleteAddressLines, a3);
}

- (BOOL)obsoleteUnverifiedListing
{
  return self->_obsoleteUnverifiedListing;
}

- (BOOL)obsoleteClosedListing
{
  return self->_obsoleteClosedListing;
}

- (GEOPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
  objc_storeStrong((id *)&self->_place, a3);
}

- (BOOL)hasIncompleteMetadata
{
  return self->_hasIncompleteMetadata;
}

- (BOOL)hasIncompleteNavData
{
  return self->_hasIncompleteNavData;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (int)floorOrdinal
{
  return self->_floorOrdinal;
}

- (int)addressRecordID
{
  return self->_addressRecordID;
}

- (int)addressID
{
  return self->_addressID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_obsoleteThoroughfare, 0);
  objc_storeStrong((id *)&self->_obsoleteRegion, 0);
  objc_storeStrong((id *)&self->_obsoleteReferenceURL, 0);
  objc_storeStrong((id *)&self->_obsoletePostalCode, 0);
  objc_storeStrong((id *)&self->_obsoletePhone, 0);
  objc_storeStrong((id *)&self->_obsoleteName, 0);
  objc_storeStrong((id *)&self->_obsoleteLocality, 0);
  objc_storeStrong((id *)&self->_obsoleteDependentLocality, 0);
  objc_storeStrong((id *)&self->_obsoleteCountryName, 0);
  objc_storeStrong((id *)&self->_obsoleteCountryCode, 0);
  objc_storeStrong((id *)&self->_obsoleteAddressLines, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
}

@end
