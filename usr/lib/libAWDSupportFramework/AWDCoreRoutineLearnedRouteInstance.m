@implementation AWDCoreRoutineLearnedRouteInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLearnedRouteInstance setRoadClassHistograms:](self, "setRoadClassHistograms:", 0);
  -[AWDCoreRoutineLearnedRouteInstance setLocationTypeHistograms:](self, "setLocationTypeHistograms:", 0);
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedRouteInstance;
  -[AWDCoreRoutineLearnedRouteInstance dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumberOfInputLocations:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numberOfInputLocations = a3;
}

- (void)setHasNumberOfInputLocations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfInputLocations
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumberOfFilteredLocations:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numberOfFilteredLocations = a3;
}

- (void)setHasNumberOfFilteredLocations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfFilteredLocations
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLength:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLength
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRecoveryTime:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_recoveryTime = a3;
}

- (void)setHasRecoveryTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasRecoveryTime
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setFailureReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatitudeTruncated:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_latitudeTruncated = a3;
}

- (void)setHasLatitudeTruncated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatitudeTruncated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLongitudeTruncated:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_longitudeTruncated = a3;
}

- (void)setHasLongitudeTruncated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLongitudeTruncated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearRoadClassHistograms
{
  -[NSMutableArray removeAllObjects](self->_roadClassHistograms, "removeAllObjects");
}

- (void)addRoadClassHistogram:(id)a3
{
  NSMutableArray *roadClassHistograms;

  roadClassHistograms = self->_roadClassHistograms;
  if (!roadClassHistograms)
  {
    roadClassHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_roadClassHistograms = roadClassHistograms;
  }
  -[NSMutableArray addObject:](roadClassHistograms, "addObject:", a3);
}

- (unint64_t)roadClassHistogramsCount
{
  return -[NSMutableArray count](self->_roadClassHistograms, "count");
}

- (id)roadClassHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_roadClassHistograms, "objectAtIndex:", a3);
}

+ (Class)roadClassHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationTypeHistograms
{
  -[NSMutableArray removeAllObjects](self->_locationTypeHistograms, "removeAllObjects");
}

- (void)addLocationTypeHistogram:(id)a3
{
  NSMutableArray *locationTypeHistograms;

  locationTypeHistograms = self->_locationTypeHistograms;
  if (!locationTypeHistograms)
  {
    locationTypeHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_locationTypeHistograms = locationTypeHistograms;
  }
  -[NSMutableArray addObject:](locationTypeHistograms, "addObject:", a3);
}

- (unint64_t)locationTypeHistogramsCount
{
  return -[NSMutableArray count](self->_locationTypeHistograms, "count");
}

- (id)locationTypeHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locationTypeHistograms, "objectAtIndex:", a3);
}

+ (Class)locationTypeHistogramType
{
  return (Class)objc_opt_class();
}

- (unint64_t)majorGapLengthsCount
{
  return self->_majorGapLengths.count;
}

- (int)majorGapLengths
{
  return self->_majorGapLengths.list;
}

- (void)clearMajorGapLengths
{
  PBRepeatedInt32Clear();
}

- (void)addMajorGapLength:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)majorGapLengthAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_majorGapLengths;
  unint64_t count;

  p_majorGapLengths = &self->_majorGapLengths;
  count = self->_majorGapLengths.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_majorGapLengths->list[a3];
}

- (void)setMajorGapLengths:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedRouteInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLearnedRouteInstance description](&v3, sel_description), -[AWDCoreRoutineLearnedRouteInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *roadClassHistograms;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *locationTypeHistograms;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numberOfInputLocations), CFSTR("numberOfInputLocations"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numberOfFilteredLocations), CFSTR("numberOfFilteredLocations"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_length), CFSTR("length"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_recoveryTime), CFSTR("recoveryTime"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_failureReason), CFSTR("failureReason"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_latitudeTruncated), CFSTR("latitudeTruncated"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_longitudeTruncated), CFSTR("longitudeTruncated"));
LABEL_10:
  if (-[NSMutableArray count](self->_roadClassHistograms, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_roadClassHistograms, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    roadClassHistograms = self->_roadClassHistograms;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(roadClassHistograms);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("roadClassHistogram"));

  }
  if (-[NSMutableArray count](self->_locationTypeHistograms, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_locationTypeHistograms, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    locationTypeHistograms = self->_locationTypeHistograms;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(locationTypeHistograms);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("locationTypeHistogram"));

  }
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("majorGapLength"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedRouteInstanceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *roadClassHistograms;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *locationTypeHistograms;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_majorGapLengths;
  unint64_t v16;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  roadClassHistograms = self->_roadClassHistograms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(roadClassHistograms);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  locationTypeHistograms = self->_locationTypeHistograms;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(locationTypeHistograms);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }
  p_majorGapLengths = &self->_majorGapLengths;
  if (p_majorGapLengths->count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < p_majorGapLengths->count);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 88) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 18) = self->_numberOfInputLocations;
  *((_BYTE *)a3 + 88) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_numberOfFilteredLocations;
  *((_BYTE *)a3 + 88) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 12) = self->_length;
  *((_BYTE *)a3 + 88) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 19) = self->_recoveryTime;
  *((_BYTE *)a3 + 88) |= 0x80u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_29:
    *((_DWORD *)a3 + 11) = self->_latitudeTruncated;
    *((_BYTE *)a3 + 88) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_28:
  *((_DWORD *)a3 + 10) = self->_failureReason;
  *((_BYTE *)a3 + 88) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_29;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 16) = self->_longitudeTruncated;
    *((_BYTE *)a3 + 88) |= 0x10u;
  }
LABEL_10:
  if (-[AWDCoreRoutineLearnedRouteInstance roadClassHistogramsCount](self, "roadClassHistogramsCount"))
  {
    objc_msgSend(a3, "clearRoadClassHistograms");
    v6 = -[AWDCoreRoutineLearnedRouteInstance roadClassHistogramsCount](self, "roadClassHistogramsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addRoadClassHistogram:", -[AWDCoreRoutineLearnedRouteInstance roadClassHistogramAtIndex:](self, "roadClassHistogramAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineLearnedRouteInstance locationTypeHistogramsCount](self, "locationTypeHistogramsCount"))
  {
    objc_msgSend(a3, "clearLocationTypeHistograms");
    v9 = -[AWDCoreRoutineLearnedRouteInstance locationTypeHistogramsCount](self, "locationTypeHistogramsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addLocationTypeHistogram:", -[AWDCoreRoutineLearnedRouteInstance locationTypeHistogramAtIndex:](self, "locationTypeHistogramAtIndex:", j));
    }
  }
  if (-[AWDCoreRoutineLearnedRouteInstance majorGapLengthsCount](self, "majorGapLengthsCount"))
  {
    objc_msgSend(a3, "clearMajorGapLengths");
    v12 = -[AWDCoreRoutineLearnedRouteInstance majorGapLengthsCount](self, "majorGapLengthsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addMajorGapLength:", -[AWDCoreRoutineLearnedRouteInstance majorGapLengthAtIndex:](self, "majorGapLengthAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *roadClassHistograms;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *locationTypeHistograms;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_numberOfInputLocations;
  *(_BYTE *)(v5 + 88) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 68) = self->_numberOfFilteredLocations;
  *(_BYTE *)(v5 + 88) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 48) = self->_length;
  *(_BYTE *)(v5 + 88) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 76) = self->_recoveryTime;
  *(_BYTE *)(v5 + 88) |= 0x80u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 40) = self->_failureReason;
  *(_BYTE *)(v5 + 88) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_31:
  *(_DWORD *)(v5 + 44) = self->_latitudeTruncated;
  *(_BYTE *)(v5 + 88) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 64) = self->_longitudeTruncated;
    *(_BYTE *)(v5 + 88) |= 0x10u;
  }
LABEL_10:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  roadClassHistograms = self->_roadClassHistograms;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(roadClassHistograms);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addRoadClassHistogram:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](roadClassHistograms, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  locationTypeHistograms = self->_locationTypeHistograms;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(locationTypeHistograms);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addLocationTypeHistogram:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](locationTypeHistograms, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSMutableArray *roadClassHistograms;
  NSMutableArray *locationTypeHistograms;

  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 0x40) == 0 || self->_numberOfInputLocations != *((_DWORD *)a3 + 18))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 0x40) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 0x20) == 0 || self->_numberOfFilteredLocations != *((_DWORD *)a3 + 17))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 0x20) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 8) == 0 || self->_length != *((_DWORD *)a3 + 12))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 0x80) == 0 || self->_recoveryTime != *((_DWORD *)a3 + 19))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 0x80) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 2) == 0 || self->_failureReason != *((_DWORD *)a3 + 10))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 4) == 0 || self->_latitudeTruncated != *((_DWORD *)a3 + 11))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 88) & 0x10) == 0 || self->_longitudeTruncated != *((_DWORD *)a3 + 16))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 88) & 0x10) != 0)
  {
    return 0;
  }
  roadClassHistograms = self->_roadClassHistograms;
  if (!((unint64_t)roadClassHistograms | *((_QWORD *)a3 + 10))
    || -[NSMutableArray isEqual:](roadClassHistograms, "isEqual:"))
  {
    locationTypeHistograms = self->_locationTypeHistograms;
    if (!((unint64_t)locationTypeHistograms | *((_QWORD *)a3 + 7))
      || -[NSMutableArray isEqual:](locationTypeHistograms, "isEqual:"))
    {
      return PBRepeatedInt32IsEqual();
    }
  }
  return 0;
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
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numberOfInputLocations;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numberOfFilteredLocations;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_length;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_recoveryTime;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_failureReason;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
LABEL_15:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_latitudeTruncated;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_9:
  v10 = 2654435761 * self->_longitudeTruncated;
LABEL_18:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_roadClassHistograms, "hash");
  v12 = -[NSMutableArray hash](self->_locationTypeHistograms, "hash");
  return v11 ^ v12 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
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
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 88);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)a3 + 88) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfInputLocations = *((_DWORD *)a3 + 18);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_numberOfFilteredLocations = *((_DWORD *)a3 + 17);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_length = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_recoveryTime = *((_DWORD *)a3 + 19);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_failureReason = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  self->_latitudeTruncated = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 88) & 0x10) != 0)
  {
LABEL_9:
    self->_longitudeTruncated = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_10:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 10);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        -[AWDCoreRoutineLearnedRouteInstance addRoadClassHistogram:](self, "addRoadClassHistogram:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        -[AWDCoreRoutineLearnedRouteInstance addLocationTypeHistogram:](self, "addLocationTypeHistogram:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }
  v16 = objc_msgSend(a3, "majorGapLengthsCount");
  if (v16)
  {
    v17 = v16;
    for (k = 0; k != v17; ++k)
      -[AWDCoreRoutineLearnedRouteInstance addMajorGapLength:](self, "addMajorGapLength:", objc_msgSend(a3, "majorGapLengthAtIndex:", k));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)numberOfInputLocations
{
  return self->_numberOfInputLocations;
}

- (int)numberOfFilteredLocations
{
  return self->_numberOfFilteredLocations;
}

- (int)length
{
  return self->_length;
}

- (int)recoveryTime
{
  return self->_recoveryTime;
}

- (int)failureReason
{
  return self->_failureReason;
}

- (int)latitudeTruncated
{
  return self->_latitudeTruncated;
}

- (int)longitudeTruncated
{
  return self->_longitudeTruncated;
}

- (NSMutableArray)roadClassHistograms
{
  return self->_roadClassHistograms;
}

- (void)setRoadClassHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)locationTypeHistograms
{
  return self->_locationTypeHistograms;
}

- (void)setLocationTypeHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
