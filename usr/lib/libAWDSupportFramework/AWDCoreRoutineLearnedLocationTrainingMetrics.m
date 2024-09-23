@implementation AWDCoreRoutineLearnedLocationTrainingMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLearnedLocationTrainingMetrics setVisits:](self, "setVisits:", 0);
  -[AWDCoreRoutineLearnedLocationTrainingMetrics setPlaces:](self, "setPlaces:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationTrainingMetrics;
  -[AWDCoreRoutineLearnedLocationTrainingMetrics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTrainedVisits:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_trainedVisits = a3;
}

- (void)setHasTrainedVisits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTrainedVisits
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIntervalSinceLastAttempt:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_intervalSinceLastAttempt = a3;
}

- (void)setHasIntervalSinceLastAttempt:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIntervalSinceLastAttempt
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLatency:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatency
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLocationsProcessed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_locationsProcessed = a3;
}

- (void)setHasLocationsProcessed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLocationsProcessed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxIntervalBetweenLocations:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxIntervalBetweenLocations = a3;
}

- (void)setHasMaxIntervalBetweenLocations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxIntervalBetweenLocations
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)clearVisits
{
  -[NSMutableArray removeAllObjects](self->_visits, "removeAllObjects");
}

- (void)addVisits:(id)a3
{
  NSMutableArray *visits;

  visits = self->_visits;
  if (!visits)
  {
    visits = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_visits = visits;
  }
  -[NSMutableArray addObject:](visits, "addObject:", a3);
}

- (unint64_t)visitsCount
{
  return -[NSMutableArray count](self->_visits, "count");
}

- (id)visitsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visits, "objectAtIndex:", a3);
}

+ (Class)visitsType
{
  return (Class)objc_opt_class();
}

- (void)clearPlaces
{
  -[NSMutableArray removeAllObjects](self->_places, "removeAllObjects");
}

- (void)addPlaces:(id)a3
{
  NSMutableArray *places;

  places = self->_places;
  if (!places)
  {
    places = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_places = places;
  }
  -[NSMutableArray addObject:](places, "addObject:", a3);
}

- (unint64_t)placesCount
{
  return -[NSMutableArray count](self->_places, "count");
}

- (id)placesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_places, "objectAtIndex:", a3);
}

+ (Class)placesType
{
  return (Class)objc_opt_class();
}

- (void)setVisitCountDevice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_visitCountDevice = a3;
}

- (void)setHasVisitCountDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasVisitCountDevice
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setVisitCountTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_visitCountTotal = a3;
}

- (void)setHasVisitCountTotal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVisitCountTotal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPlaceCountDevice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_placeCountDevice = a3;
}

- (void)setHasPlaceCountDevice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaceCountDevice
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPlaceCountTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_placeCountTotal = a3;
}

- (void)setHasPlaceCountTotal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPlaceCountTotal
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationTrainingMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLearnedLocationTrainingMetrics description](&v3, sel_description), -[AWDCoreRoutineLearnedLocationTrainingMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSMutableArray *visits;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *places;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int16 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_trainedVisits), CFSTR("trainedVisits"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_intervalSinceLastAttempt), CFSTR("intervalSinceLastAttempt"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_latency), CFSTR("latency"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_locationsProcessed), CFSTR("locationsProcessed"));
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxIntervalBetweenLocations), CFSTR("maxIntervalBetweenLocations"));
LABEL_8:
  if (-[NSMutableArray count](self->_visits, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_visits, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    visits = self->_visits;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(visits);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("visits"));

  }
  if (-[NSMutableArray count](self->_places, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_places, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    places = self->_places;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(places);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("places"));

  }
  v17 = (__int16)self->_has;
  if ((v17 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_visitCountDevice), CFSTR("visitCountDevice"));
    v17 = (__int16)self->_has;
    if ((v17 & 0x100) == 0)
    {
LABEL_28:
      if ((v17 & 0x20) == 0)
        goto LABEL_29;
LABEL_40:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_placeCountDevice), CFSTR("placeCountDevice"));
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        return v3;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_visitCountTotal), CFSTR("visitCountTotal"));
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
    goto LABEL_40;
LABEL_29:
  if ((v17 & 0x40) != 0)
LABEL_30:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_placeCountTotal), CFSTR("placeCountTotal"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedLocationTrainingMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *visits;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *places;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_7:
    PBDataWriterWriteUint64Field();
LABEL_8:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  visits = self->_visits;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(visits);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  places = self->_places;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(places);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }
  v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v15 = (__int16)self->_has;
    if ((v15 & 0x100) == 0)
    {
LABEL_24:
      if ((v15 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  v15 = (__int16)self->_has;
  if ((v15 & 0x20) == 0)
  {
LABEL_25:
    if ((v15 & 0x40) == 0)
      return;
    goto LABEL_26;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return;
LABEL_26:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  __int16 v12;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 80) = self->_trainedVisits;
  *((_WORD *)a3 + 42) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 1) = self->_intervalSinceLastAttempt;
  *((_WORD *)a3 + 42) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_26:
    *((_DWORD *)a3 + 10) = self->_locationsProcessed;
    *((_WORD *)a3 + 42) |= 0x10u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_25:
  *((_QWORD *)a3 + 2) = self->_latency;
  *((_WORD *)a3 + 42) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_26;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_QWORD *)a3 + 3) = self->_maxIntervalBetweenLocations;
    *((_WORD *)a3 + 42) |= 4u;
  }
LABEL_8:
  if (-[AWDCoreRoutineLearnedLocationTrainingMetrics visitsCount](self, "visitsCount"))
  {
    objc_msgSend(a3, "clearVisits");
    v6 = -[AWDCoreRoutineLearnedLocationTrainingMetrics visitsCount](self, "visitsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addVisits:", -[AWDCoreRoutineLearnedLocationTrainingMetrics visitsAtIndex:](self, "visitsAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineLearnedLocationTrainingMetrics placesCount](self, "placesCount"))
  {
    objc_msgSend(a3, "clearPlaces");
    v9 = -[AWDCoreRoutineLearnedLocationTrainingMetrics placesCount](self, "placesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addPlaces:", -[AWDCoreRoutineLearnedLocationTrainingMetrics placesAtIndex:](self, "placesAtIndex:", j));
    }
  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_visitCountDevice;
    *((_WORD *)a3 + 42) |= 0x80u;
    v12 = (__int16)self->_has;
    if ((v12 & 0x100) == 0)
    {
LABEL_18:
      if ((v12 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)a3 + 17) = self->_visitCountTotal;
  *((_WORD *)a3 + 42) |= 0x100u;
  v12 = (__int16)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_19:
    if ((v12 & 0x40) == 0)
      return;
    goto LABEL_20;
  }
LABEL_30:
  *((_DWORD *)a3 + 11) = self->_placeCountDevice;
  *((_WORD *)a3 + 42) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return;
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_placeCountTotal;
  *((_WORD *)a3 + 42) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *visits;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *places;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int16 v20;
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

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 80) = self->_trainedVisits;
  *(_WORD *)(v5 + 84) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v5 + 8) = self->_intervalSinceLastAttempt;
  *(_WORD *)(v5 + 84) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 16) = self->_latency;
  *(_WORD *)(v5 + 84) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_32:
  *(_DWORD *)(v5 + 40) = self->_locationsProcessed;
  *(_WORD *)(v5 + 84) |= 0x10u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(_QWORD *)(v5 + 24) = self->_maxIntervalBetweenLocations;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_8:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  visits = self->_visits;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(visits);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addVisits:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](visits, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  places = self->_places;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(places);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPlaces:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](places, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }
  v20 = (__int16)self->_has;
  if ((v20 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_visitCountDevice;
    *(_WORD *)(v6 + 84) |= 0x80u;
    v20 = (__int16)self->_has;
    if ((v20 & 0x100) == 0)
    {
LABEL_24:
      if ((v20 & 0x20) == 0)
        goto LABEL_25;
LABEL_36:
      *(_DWORD *)(v6 + 44) = self->_placeCountDevice;
      *(_WORD *)(v6 + 84) |= 0x20u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        return (id)v6;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v6 + 68) = self->_visitCountTotal;
  *(_WORD *)(v6 + 84) |= 0x100u;
  v20 = (__int16)self->_has;
  if ((v20 & 0x20) != 0)
    goto LABEL_36;
LABEL_25:
  if ((v20 & 0x40) != 0)
  {
LABEL_26:
    *(_DWORD *)(v6 + 48) = self->_placeCountTotal;
    *(_WORD *)(v6 + 84) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *visits;
  NSMutableArray *places;
  __int16 v10;
  __int16 v11;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 42);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      goto LABEL_58;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x200) != 0)
      goto LABEL_58;
    goto LABEL_15;
  }
  if ((*((_WORD *)a3 + 42) & 0x200) == 0)
    goto LABEL_58;
  if (self->_trainedVisits)
  {
    if (!*((_BYTE *)a3 + 80))
      goto LABEL_58;
    goto LABEL_15;
  }
  if (*((_BYTE *)a3 + 80))
  {
LABEL_58:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_intervalSinceLastAttempt != *((_QWORD *)a3 + 1))
      goto LABEL_58;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_latency != *((_QWORD *)a3 + 2))
      goto LABEL_58;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_locationsProcessed != *((_DWORD *)a3 + 10))
      goto LABEL_58;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_maxIntervalBetweenLocations != *((_QWORD *)a3 + 3))
      goto LABEL_58;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_58;
  }
  visits = self->_visits;
  if (!((unint64_t)visits | *((_QWORD *)a3 + 9)) || (v5 = -[NSMutableArray isEqual:](visits, "isEqual:")) != 0)
  {
    places = self->_places;
    if (!((unint64_t)places | *((_QWORD *)a3 + 7)) || (v5 = -[NSMutableArray isEqual:](places, "isEqual:")) != 0)
    {
      v10 = (__int16)self->_has;
      v11 = *((_WORD *)a3 + 42);
      if ((v10 & 0x80) != 0)
      {
        if ((v11 & 0x80) == 0 || self->_visitCountDevice != *((_DWORD *)a3 + 16))
          goto LABEL_58;
      }
      else if ((v11 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_visitCountTotal != *((_DWORD *)a3 + 17))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((v10 & 0x20) != 0)
      {
        if ((v11 & 0x20) == 0 || self->_placeCountDevice != *((_DWORD *)a3 + 11))
          goto LABEL_58;
      }
      else if ((v11 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v11 & 0x40) == 0;
      if ((v10 & 0x40) != 0)
      {
        if ((v11 & 0x40) == 0 || self->_placeCountTotal != *((_DWORD *)a3 + 12))
          goto LABEL_58;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_trainedVisits;
      if ((has & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_intervalSinceLastAttempt;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v7 = 2654435761u * self->_latency;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v7 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_locationsProcessed;
  if ((has & 4) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_maxIntervalBetweenLocations;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
LABEL_14:
  v10 = -[NSMutableArray hash](self->_visits, "hash");
  v11 = -[NSMutableArray hash](self->_places, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    v13 = 2654435761 * self->_visitCountDevice;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_16:
      v14 = 2654435761 * self->_visitCountTotal;
      if ((v12 & 0x20) != 0)
        goto LABEL_17;
LABEL_21:
      v15 = 0;
      if ((v12 & 0x40) != 0)
        goto LABEL_18;
LABEL_22:
      v16 = 0;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_16;
  }
  v14 = 0;
  if ((v12 & 0x20) == 0)
    goto LABEL_21;
LABEL_17:
  v15 = 2654435761 * self->_placeCountDevice;
  if ((v12 & 0x40) == 0)
    goto LABEL_22;
LABEL_18:
  v16 = 2654435761 * self->_placeCountTotal;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int16 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)a3 + 42);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_trainedVisits = *((_BYTE *)a3 + 80);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_intervalSinceLastAttempt = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_latency = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_32:
  self->_locationsProcessed = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 42) & 4) != 0)
  {
LABEL_7:
    self->_maxIntervalBetweenLocations = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_8:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 9);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[AWDCoreRoutineLearnedLocationTrainingMetrics addVisits:](self, "addVisits:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[AWDCoreRoutineLearnedLocationTrainingMetrics addPlaces:](self, "addPlaces:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }
  v16 = *((_WORD *)a3 + 42);
  if ((v16 & 0x80) != 0)
  {
    self->_visitCountDevice = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x80u;
    v16 = *((_WORD *)a3 + 42);
    if ((v16 & 0x100) == 0)
    {
LABEL_24:
      if ((v16 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_36;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x100) == 0)
  {
    goto LABEL_24;
  }
  self->_visitCountTotal = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x100u;
  v16 = *((_WORD *)a3 + 42);
  if ((v16 & 0x20) == 0)
  {
LABEL_25:
    if ((v16 & 0x40) == 0)
      return;
    goto LABEL_26;
  }
LABEL_36:
  self->_placeCountDevice = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 42) & 0x40) == 0)
    return;
LABEL_26:
  self->_placeCountTotal = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)trainedVisits
{
  return self->_trainedVisits;
}

- (unint64_t)intervalSinceLastAttempt
{
  return self->_intervalSinceLastAttempt;
}

- (unint64_t)latency
{
  return self->_latency;
}

- (unsigned)locationsProcessed
{
  return self->_locationsProcessed;
}

- (unint64_t)maxIntervalBetweenLocations
{
  return self->_maxIntervalBetweenLocations;
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)visitCountDevice
{
  return self->_visitCountDevice;
}

- (unsigned)visitCountTotal
{
  return self->_visitCountTotal;
}

- (unsigned)placeCountDevice
{
  return self->_placeCountDevice;
}

- (unsigned)placeCountTotal
{
  return self->_placeCountTotal;
}

@end
