@implementation ALSNearbyRequest

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear(&self->_wifiBands, a2);
  -[ALSNearbyRequest setMeta:](self, "setMeta:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyRequest;
  -[ALSNearbyRequest dealloc](&v3, "dealloc");
}

- (void)setNeedCellsTowers:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_needCellsTowers = a3;
}

- (void)setHasNeedCellsTowers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNeedCellsTowers
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)technology
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_technology;
  else
    return 1;
}

- (void)setTechnology:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_technology = a3;
}

- (void)setHasTechnology:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTechnology
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)technologyAsString:(int)a3
{
  id result;

  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 128)
        return CFSTR("kRadioAccessTechnologySCDMA");
      if (a3 == 256)
        return CFSTR("kRadioAccessTechnologyNR5G");
    }
    else
    {
      if (a3 == 32)
        return CFSTR("kRadioAccessTechnologyCDMAHybrid");
      if (a3 == 64)
        return CFSTR("kRadioAccessTechnologyLTE");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  result = CFSTR("kRadioAccessTechnologyGSM");
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = CFSTR("kRadioAccessTechnologyGSMCompact");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    case 4:
      result = CFSTR("kRadioAccessTechnologyUTRAN");
      break;
    case 8:
      result = CFSTR("kRadioAccessTechnologyCDMA1x");
      break;
    default:
      if (a3 != 16)
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      result = CFSTR("kRadioAccessTechnologyCDMAEVDO");
      break;
  }
  return result;
}

- (int)StringAsTechnology:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyGSM")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyGSMCompact")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyUTRAN")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyCDMA1x")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyCDMAEVDO")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyCDMAHybrid")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyLTE")) & 1) != 0)
    return 64;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologySCDMA")) & 1) != 0)
    return 128;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kRadioAccessTechnologyNR5G")))
    return 256;
  return 1;
}

- (int)wifiGranularity
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_wifiGranularity;
  else
    return 1;
}

- (void)setWifiGranularity:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_wifiGranularity = a3;
}

- (void)setHasWifiGranularity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWifiGranularity
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)wifiGranularityAsString:(int)a3
{
  switch(a3)
  {
    case 1:
      return CFSTR("kGranularityFine");
    case 4:
      return CFSTR("kGranularityNearby");
    case 2:
      return CFSTR("kGranularityCoarse");
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsWifiGranularity:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kGranularityFine")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kGranularityCoarse")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kGranularityNearby")))
    return 4;
  return 1;
}

- (void)setRadius:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)wifiBandsCount
{
  return self->_wifiBands.count;
}

- (int)wifiBands
{
  return self->_wifiBands.list;
}

- (void)clearWifiBands
{
  PBRepeatedInt32Clear(&self->_wifiBands, a2);
}

- (void)addWifiBands:(int)a3
{
  PBRepeatedInt32Add(&self->_wifiBands, *(_QWORD *)&a3);
}

- (int)wifiBandsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_wifiBands;
  unint64_t count;

  p_wifiBands = &self->_wifiBands;
  count = self->_wifiBands.count;
  if (count <= a3)
    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_wifiBands->list[a3];
}

- (void)setWifiBands:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_wifiBands, a3, a4);
}

- (id)wifiBandsAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("k2dot4GHZ");
  if (a3 == 2)
    return CFSTR("k5GHZ");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsWifiBands:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("k2dot4GHZ")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("k5GHZ")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (int)wifiAltitudeScale
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_wifiAltitudeScale;
  else
    return 1;
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifiAltitudeScale
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)wifiAltitudeScaleAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("kWifiAltitudeScaleNone");
  if (a3 == 2)
    return CFSTR("kWifiAltitudeScale10toThe2");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsWifiAltitudeScale:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWifiAltitudeScaleNone")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("kWifiAltitudeScale10toThe2")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyRequest;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSNearbyRequest description](&v3, "description"), -[ALSNearbyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_wifiBands;
  NSMutableArray *v6;
  unint64_t v7;
  int v8;
  const __CFString *v9;
  int wifiAltitudeScale;
  const __CFString *v11;
  int technology;
  const __CFString *v13;
  ALSMeta *meta;
  int wifiGranularity;
  const __CFString *v17;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude), CFSTR("Latitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude), CFSTR("Longitude"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_needCellsTowers), CFSTR("needCellsTowers"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingWifis), CFSTR("numberOfSurroundingWifis"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_47;
  }
LABEL_23:
  technology = self->_technology;
  if (technology > 31)
  {
    if (technology > 127)
    {
      if (technology == 128)
      {
        v13 = CFSTR("kRadioAccessTechnologySCDMA");
        goto LABEL_46;
      }
      if (technology == 256)
      {
        v13 = CFSTR("kRadioAccessTechnologyNR5G");
        goto LABEL_46;
      }
    }
    else
    {
      if (technology == 32)
      {
        v13 = CFSTR("kRadioAccessTechnologyCDMAHybrid");
        goto LABEL_46;
      }
      if (technology == 64)
      {
        v13 = CFSTR("kRadioAccessTechnologyLTE");
        goto LABEL_46;
      }
    }
LABEL_41:
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_technology);
    goto LABEL_46;
  }
  v13 = CFSTR("kRadioAccessTechnologyGSM");
  switch(technology)
  {
    case 1:
      break;
    case 2:
      v13 = CFSTR("kRadioAccessTechnologyGSMCompact");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_41;
    case 4:
      v13 = CFSTR("kRadioAccessTechnologyUTRAN");
      break;
    case 8:
      v13 = CFSTR("kRadioAccessTechnologyCDMA1x");
      break;
    default:
      if (technology != 16)
        goto LABEL_41;
      v13 = CFSTR("kRadioAccessTechnologyCDMAEVDO");
      break;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("technology"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_47:
  wifiGranularity = self->_wifiGranularity;
  switch(wifiGranularity)
  {
    case 1:
      v17 = CFSTR("kGranularityFine");
      break;
    case 4:
      v17 = CFSTR("kGranularityNearby");
      break;
    case 2:
      v17 = CFSTR("kGranularityCoarse");
      break;
    default:
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wifiGranularity);
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wifiGranularity"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_radius), CFSTR("radius"));
LABEL_7:
  p_wifiBands = &self->_wifiBands;
  if (self->_wifiBands.count)
  {
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_wifiBands.count)
    {
      v7 = 0;
      do
      {
        v8 = p_wifiBands->list[v7];
        if (v8 == 1)
        {
          v9 = CFSTR("k2dot4GHZ");
        }
        else if (v8 == 2)
        {
          v9 = CFSTR("k5GHZ");
        }
        else
        {
          v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_wifiBands->list[v7]);
        }
        -[NSMutableArray addObject:](v6, "addObject:", v9);
        ++v7;
      }
      while (v7 < self->_wifiBands.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("wifiBands"));
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    wifiAltitudeScale = self->_wifiAltitudeScale;
    if (wifiAltitudeScale == 1)
    {
      v11 = CFSTR("kWifiAltitudeScaleNone");
    }
    else if (wifiAltitudeScale == 2)
    {
      v11 = CFSTR("kWifiAltitudeScale10toThe2");
    }
    else
    {
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wifiAltitudeScale);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("wifiAltitudeScale"));
  }
  meta = self->_meta;
  if (meta)
    objc_msgSend(v3, "setObject:forKey:", -[ALSMeta dictionaryRepresentation](meta, "dictionaryRepresentation"), CFSTR("meta"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F17CD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v6;
  ALSMeta *meta;

  PBDataWriterWriteInt64Field(a3, self->_latitude, 1);
  PBDataWriterWriteInt64Field(a3, self->_longitude, 2);
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField(a3, self->_needCellsTowers, 3);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingWifis, 4);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field(a3, self->_technology, 21);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteInt32Field(a3, self->_wifiGranularity, 31);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field(a3, self->_radius, 32);
LABEL_7:
  if (self->_wifiBands.count)
  {
    v6 = 0;
    do
      PBDataWriterWriteInt32Field(a3, self->_wifiBands.list[v6++], 33);
    while (v6 < self->_wifiBands.count);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field(a3, self->_wifiAltitudeScale, 34);
  meta = self->_meta;
  if (meta)
    PBDataWriterWriteSubmessage(a3, meta, 35);
}

- (unsigned)requestTypeCode
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(ALSNearbyResponse, a2);
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  *((_QWORD *)a3 + 4) = self->_latitude;
  *((_QWORD *)a3 + 5) = self->_longitude;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)a3 + 76) = self->_needCellsTowers;
    *((_BYTE *)a3 + 80) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_numberOfSurroundingWifis;
  *((_BYTE *)a3 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_18:
    *((_DWORD *)a3 + 18) = self->_wifiGranularity;
    *((_BYTE *)a3 + 80) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  *((_DWORD *)a3 + 16) = self->_technology;
  *((_BYTE *)a3 + 80) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_18;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 15) = self->_radius;
    *((_BYTE *)a3 + 80) |= 2u;
  }
LABEL_7:
  if (-[ALSNearbyRequest wifiBandsCount](self, "wifiBandsCount"))
  {
    objc_msgSend(a3, "clearWifiBands");
    v6 = -[ALSNearbyRequest wifiBandsCount](self, "wifiBandsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addWifiBands:", -[ALSNearbyRequest wifiBandsAtIndex:](self, "wifiBandsAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_wifiAltitudeScale;
    *((_BYTE *)a3 + 80) |= 8u;
  }
  if (self->_meta)
    objc_msgSend(a3, "setMeta:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  v5[4] = self->_latitude;
  v5[5] = self->_longitude;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v5 + 76) = self->_needCellsTowers;
    *((_BYTE *)v5 + 80) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 14) = self->_numberOfSurroundingWifis;
  *((_BYTE *)v5 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v5 + 16) = self->_technology;
  *((_BYTE *)v5 + 80) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v5 + 18) = self->_wifiGranularity;
  *((_BYTE *)v5 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 15) = self->_radius;
    *((_BYTE *)v5 + 80) |= 2u;
  }
LABEL_7:
  PBRepeatedInt32Copy(v5 + 1, &self->_wifiBands);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_wifiAltitudeScale;
    *((_BYTE *)v6 + 80) |= 8u;
  }

  *((_QWORD *)v6 + 6) = -[ALSMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int IsEqual;
  ALSMeta *meta;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!IsEqual)
    return IsEqual;
  if (self->_latitude != *((_QWORD *)a3 + 4) || self->_longitude != *((_QWORD *)a3 + 5))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 80) & 0x20) != 0)
      goto LABEL_40;
    goto LABEL_12;
  }
  if ((*((_BYTE *)a3 + 80) & 0x20) == 0)
    goto LABEL_40;
  if (self->_needCellsTowers)
  {
    if (!*((_BYTE *)a3 + 76))
      goto LABEL_40;
    goto LABEL_12;
  }
  if (*((_BYTE *)a3 + 76))
  {
LABEL_40:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 1) == 0 || self->_numberOfSurroundingWifis != *((_DWORD *)a3 + 14))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 80) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 4) == 0 || self->_technology != *((_DWORD *)a3 + 16))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 0x10) == 0 || self->_wifiGranularity != *((_DWORD *)a3 + 18))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 80) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 2) == 0 || self->_radius != *((_DWORD *)a3 + 15))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
    goto LABEL_40;
  }
  IsEqual = PBRepeatedInt32IsEqual(&self->_wifiBands, (char *)a3 + 8);
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 80) & 8) == 0 || self->_wifiAltitudeScale != *((_DWORD *)a3 + 17))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 80) & 8) != 0)
    {
      goto LABEL_40;
    }
    meta = self->_meta;
    if ((unint64_t)meta | *((_QWORD *)a3 + 6))
      LOBYTE(IsEqual) = -[ALSMeta isEqual:](meta, "isEqual:");
    else
      LOBYTE(IsEqual) = 1;
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t latitude;
  int64_t longitude;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_needCellsTowers;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_numberOfSurroundingWifis;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_technology;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v6 = 2654435761 * self->_wifiGranularity;
  else
    v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_radius;
  else
    v7 = 0;
  latitude = self->_latitude;
  longitude = self->_longitude;
  v10 = PBRepeatedInt32Hash(&self->_wifiBands);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_wifiAltitudeScale;
  else
    v11 = 0;
  return (2654435761 * longitude) ^ (2654435761 * latitude) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v10 ^ v11 ^ -[ALSMeta hash](self->_meta, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char *v6;
  char *v7;
  char *i;
  ALSMeta *meta;
  uint64_t v10;

  self->_latitude = *((_QWORD *)a3 + 4);
  self->_longitude = *((_QWORD *)a3 + 5);
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 0x20) != 0)
  {
    self->_needCellsTowers = *((_BYTE *)a3 + 76);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_technology = *((_DWORD *)a3 + 16);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  self->_wifiGranularity = *((_DWORD *)a3 + 18);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
LABEL_6:
    self->_radius = *((_DWORD *)a3 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v6 = (char *)objc_msgSend(a3, "wifiBandsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[ALSNearbyRequest addWifiBands:](self, "addWifiBands:", objc_msgSend(a3, "wifiBandsAtIndex:", i));
  }
  if ((*((_BYTE *)a3 + 80) & 8) != 0)
  {
    self->_wifiAltitudeScale = *((_DWORD *)a3 + 17);
    *(_BYTE *)&self->_has |= 8u;
  }
  meta = self->_meta;
  v10 = *((_QWORD *)a3 + 6);
  if (meta)
  {
    if (v10)
      -[ALSMeta mergeFrom:](meta, "mergeFrom:");
  }
  else if (v10)
  {
    -[ALSNearbyRequest setMeta:](self, "setMeta:");
  }
}

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_longitude = a3;
}

- (BOOL)needCellsTowers
{
  return self->_needCellsTowers;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (int)radius
{
  return self->_radius;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
