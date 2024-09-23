@implementation AWDCoreRoutineLocationAwarenessIntervalHistogram

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLocationAwarenessIntervalHistogram setLessThan10mIntervalHistograms:](self, "setLessThan10mIntervalHistograms:", 0);
  -[AWDCoreRoutineLocationAwarenessIntervalHistogram setLessThan25mIntervalHistograms:](self, "setLessThan25mIntervalHistograms:", 0);
  -[AWDCoreRoutineLocationAwarenessIntervalHistogram setLessThan55mIntervalHistograms:](self, "setLessThan55mIntervalHistograms:", 0);
  -[AWDCoreRoutineLocationAwarenessIntervalHistogram setLessThan200mIntervalHistograms:](self, "setLessThan200mIntervalHistograms:", 0);
  -[AWDCoreRoutineLocationAwarenessIntervalHistogram setAnyPositiveIntervalHistograms:](self, "setAnyPositiveIntervalHistograms:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessIntervalHistogram;
  -[AWDCoreRoutineLocationAwarenessIntervalHistogram dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearLessThan10mIntervalHistograms
{
  -[NSMutableArray removeAllObjects](self->_lessThan10mIntervalHistograms, "removeAllObjects");
}

- (void)addLessThan10mIntervalHistogram:(id)a3
{
  NSMutableArray *lessThan10mIntervalHistograms;

  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  if (!lessThan10mIntervalHistograms)
  {
    lessThan10mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_lessThan10mIntervalHistograms = lessThan10mIntervalHistograms;
  }
  -[NSMutableArray addObject:](lessThan10mIntervalHistograms, "addObject:", a3);
}

- (unint64_t)lessThan10mIntervalHistogramsCount
{
  return -[NSMutableArray count](self->_lessThan10mIntervalHistograms, "count");
}

- (id)lessThan10mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lessThan10mIntervalHistograms, "objectAtIndex:", a3);
}

+ (Class)lessThan10mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan25mIntervalHistograms
{
  -[NSMutableArray removeAllObjects](self->_lessThan25mIntervalHistograms, "removeAllObjects");
}

- (void)addLessThan25mIntervalHistogram:(id)a3
{
  NSMutableArray *lessThan25mIntervalHistograms;

  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  if (!lessThan25mIntervalHistograms)
  {
    lessThan25mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_lessThan25mIntervalHistograms = lessThan25mIntervalHistograms;
  }
  -[NSMutableArray addObject:](lessThan25mIntervalHistograms, "addObject:", a3);
}

- (unint64_t)lessThan25mIntervalHistogramsCount
{
  return -[NSMutableArray count](self->_lessThan25mIntervalHistograms, "count");
}

- (id)lessThan25mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lessThan25mIntervalHistograms, "objectAtIndex:", a3);
}

+ (Class)lessThan25mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan55mIntervalHistograms
{
  -[NSMutableArray removeAllObjects](self->_lessThan55mIntervalHistograms, "removeAllObjects");
}

- (void)addLessThan55mIntervalHistogram:(id)a3
{
  NSMutableArray *lessThan55mIntervalHistograms;

  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  if (!lessThan55mIntervalHistograms)
  {
    lessThan55mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_lessThan55mIntervalHistograms = lessThan55mIntervalHistograms;
  }
  -[NSMutableArray addObject:](lessThan55mIntervalHistograms, "addObject:", a3);
}

- (unint64_t)lessThan55mIntervalHistogramsCount
{
  return -[NSMutableArray count](self->_lessThan55mIntervalHistograms, "count");
}

- (id)lessThan55mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lessThan55mIntervalHistograms, "objectAtIndex:", a3);
}

+ (Class)lessThan55mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan200mIntervalHistograms
{
  -[NSMutableArray removeAllObjects](self->_lessThan200mIntervalHistograms, "removeAllObjects");
}

- (void)addLessThan200mIntervalHistogram:(id)a3
{
  NSMutableArray *lessThan200mIntervalHistograms;

  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  if (!lessThan200mIntervalHistograms)
  {
    lessThan200mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_lessThan200mIntervalHistograms = lessThan200mIntervalHistograms;
  }
  -[NSMutableArray addObject:](lessThan200mIntervalHistograms, "addObject:", a3);
}

- (unint64_t)lessThan200mIntervalHistogramsCount
{
  return -[NSMutableArray count](self->_lessThan200mIntervalHistograms, "count");
}

- (id)lessThan200mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lessThan200mIntervalHistograms, "objectAtIndex:", a3);
}

+ (Class)lessThan200mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearAnyPositiveIntervalHistograms
{
  -[NSMutableArray removeAllObjects](self->_anyPositiveIntervalHistograms, "removeAllObjects");
}

- (void)addAnyPositiveIntervalHistogram:(id)a3
{
  NSMutableArray *anyPositiveIntervalHistograms;

  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  if (!anyPositiveIntervalHistograms)
  {
    anyPositiveIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_anyPositiveIntervalHistograms = anyPositiveIntervalHistograms;
  }
  -[NSMutableArray addObject:](anyPositiveIntervalHistograms, "addObject:", a3);
}

- (unint64_t)anyPositiveIntervalHistogramsCount
{
  return -[NSMutableArray count](self->_anyPositiveIntervalHistograms, "count");
}

- (id)anyPositiveIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_anyPositiveIntervalHistograms, "objectAtIndex:", a3);
}

+ (Class)anyPositiveIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessIntervalHistogram;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLocationAwarenessIntervalHistogram description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessIntervalHistogram dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *lessThan10mIntervalHistograms;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *lessThan25mIntervalHistograms;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *lessThan55mIntervalHistograms;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *lessThan200mIntervalHistograms;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  NSMutableArray *anyPositiveIntervalHistograms;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  if (-[NSMutableArray count](self->_lessThan10mIntervalHistograms, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lessThan10mIntervalHistograms, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(lessThan10mIntervalHistograms);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("LessThan10mIntervalHistogram"));

  }
  if (-[NSMutableArray count](self->_lessThan25mIntervalHistograms, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lessThan25mIntervalHistograms, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(lessThan25mIntervalHistograms);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("LessThan25mIntervalHistogram"));

  }
  if (-[NSMutableArray count](self->_lessThan55mIntervalHistograms, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lessThan55mIntervalHistograms, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(lessThan55mIntervalHistograms);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v20);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("LessThan55mIntervalHistogram"));

  }
  if (-[NSMutableArray count](self->_lessThan200mIntervalHistograms, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lessThan200mIntervalHistograms, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v41;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(lessThan200mIntervalHistograms);
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
      }
      while (v26);
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("LessThan200mIntervalHistogram"));

  }
  if (-[NSMutableArray count](self->_anyPositiveIntervalHistograms, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_anyPositiveIntervalHistograms, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v37;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v37 != v33)
            objc_enumerationMutation(anyPositiveIntervalHistograms);
          objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * n), "dictionaryRepresentation"));
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
      }
      while (v32);
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("AnyPositiveIntervalHistogram"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessIntervalHistogramReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *lessThan10mIntervalHistograms;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *lessThan25mIntervalHistograms;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *lessThan55mIntervalHistograms;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *lessThan200mIntervalHistograms;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  NSMutableArray *anyPositiveIntervalHistograms;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(lessThan10mIntervalHistograms);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(lessThan25mIntervalHistograms);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(lessThan55mIntervalHistograms);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(lessThan200mIntervalHistograms);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(anyPositiveIntervalHistograms);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
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
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan10mIntervalHistogramsCount](self, "lessThan10mIntervalHistogramsCount"))
  {
    objc_msgSend(a3, "clearLessThan10mIntervalHistograms");
    v6 = -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan10mIntervalHistogramsCount](self, "lessThan10mIntervalHistogramsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addLessThan10mIntervalHistogram:", -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan10mIntervalHistogramAtIndex:](self, "lessThan10mIntervalHistogramAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan25mIntervalHistogramsCount](self, "lessThan25mIntervalHistogramsCount"))
  {
    objc_msgSend(a3, "clearLessThan25mIntervalHistograms");
    v9 = -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan25mIntervalHistogramsCount](self, "lessThan25mIntervalHistogramsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addLessThan25mIntervalHistogram:", -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan25mIntervalHistogramAtIndex:](self, "lessThan25mIntervalHistogramAtIndex:", j));
    }
  }
  if (-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan55mIntervalHistogramsCount](self, "lessThan55mIntervalHistogramsCount"))
  {
    objc_msgSend(a3, "clearLessThan55mIntervalHistograms");
    v12 = -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan55mIntervalHistogramsCount](self, "lessThan55mIntervalHistogramsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addLessThan55mIntervalHistogram:", -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan55mIntervalHistogramAtIndex:](self, "lessThan55mIntervalHistogramAtIndex:", k));
    }
  }
  if (-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan200mIntervalHistogramsCount](self, "lessThan200mIntervalHistogramsCount"))
  {
    objc_msgSend(a3, "clearLessThan200mIntervalHistograms");
    v15 = -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan200mIntervalHistogramsCount](self, "lessThan200mIntervalHistogramsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addLessThan200mIntervalHistogram:", -[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan200mIntervalHistogramAtIndex:](self, "lessThan200mIntervalHistogramAtIndex:", m));
    }
  }
  if (-[AWDCoreRoutineLocationAwarenessIntervalHistogram anyPositiveIntervalHistogramsCount](self, "anyPositiveIntervalHistogramsCount"))
  {
    objc_msgSend(a3, "clearAnyPositiveIntervalHistograms");
    v18 = -[AWDCoreRoutineLocationAwarenessIntervalHistogram anyPositiveIntervalHistogramsCount](self, "anyPositiveIntervalHistogramsCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(a3, "addAnyPositiveIntervalHistogram:", -[AWDCoreRoutineLocationAwarenessIntervalHistogram anyPositiveIntervalHistogramAtIndex:](self, "anyPositiveIntervalHistogramAtIndex:", n));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *lessThan10mIntervalHistograms;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *lessThan25mIntervalHistograms;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *lessThan55mIntervalHistograms;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *lessThan200mIntervalHistograms;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *anyPositiveIntervalHistograms;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(lessThan10mIntervalHistograms);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addLessThan10mIntervalHistogram:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan10mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v10);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(lessThan25mIntervalHistograms);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addLessThan25mIntervalHistogram:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan25mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v16);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(lessThan55mIntervalHistograms);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v6, "addLessThan55mIntervalHistogram:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan55mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v22);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(lessThan200mIntervalHistograms);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend(v6, "addLessThan200mIntervalHistogram:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lessThan200mIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v28);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(anyPositiveIntervalHistograms);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend(v6, "addAnyPositiveIntervalHistogram:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](anyPositiveIntervalHistograms, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v34);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *lessThan10mIntervalHistograms;
  NSMutableArray *lessThan25mIntervalHistograms;
  NSMutableArray *lessThan55mIntervalHistograms;
  NSMutableArray *lessThan200mIntervalHistograms;
  NSMutableArray *anyPositiveIntervalHistograms;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 64) & 2) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
      goto LABEL_22;
    }
    lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
    if (!((unint64_t)lessThan10mIntervalHistograms | *((_QWORD *)a3 + 4))
      || (v5 = -[NSMutableArray isEqual:](lessThan10mIntervalHistograms, "isEqual:")) != 0)
    {
      lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
      if (!((unint64_t)lessThan25mIntervalHistograms | *((_QWORD *)a3 + 6))
        || (v5 = -[NSMutableArray isEqual:](lessThan25mIntervalHistograms, "isEqual:")) != 0)
      {
        lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
        if (!((unint64_t)lessThan55mIntervalHistograms | *((_QWORD *)a3 + 7))
          || (v5 = -[NSMutableArray isEqual:](lessThan55mIntervalHistograms, "isEqual:")) != 0)
        {
          lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
          if (!((unint64_t)lessThan200mIntervalHistograms | *((_QWORD *)a3 + 5))
            || (v5 = -[NSMutableArray isEqual:](lessThan200mIntervalHistograms, "isEqual:")) != 0)
          {
            anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
            if ((unint64_t)anyPositiveIntervalHistograms | *((_QWORD *)a3 + 3))
              LOBYTE(v5) = -[NSMutableArray isEqual:](anyPositiveIntervalHistograms, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_duration;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSMutableArray hash](self->_lessThan10mIntervalHistograms, "hash");
  v6 = -[NSMutableArray hash](self->_lessThan25mIntervalHistograms, "hash");
  v7 = v5 ^ v6 ^ -[NSMutableArray hash](self->_lessThan55mIntervalHistograms, "hash");
  v8 = -[NSMutableArray hash](self->_lessThan200mIntervalHistograms, "hash");
  return v7 ^ v8 ^ -[NSMutableArray hash](self->_anyPositiveIntervalHistograms, "hash");
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 64);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        -[AWDCoreRoutineLocationAwarenessIntervalHistogram addLessThan10mIntervalHistogram:](self, "addLessThan10mIntervalHistogram:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v8);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        -[AWDCoreRoutineLocationAwarenessIntervalHistogram addLessThan25mIntervalHistogram:](self, "addLessThan25mIntervalHistogram:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v13);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 7);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        -[AWDCoreRoutineLocationAwarenessIntervalHistogram addLessThan55mIntervalHistogram:](self, "addLessThan55mIntervalHistogram:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v18);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = (void *)*((_QWORD *)a3 + 5);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        -[AWDCoreRoutineLocationAwarenessIntervalHistogram addLessThan200mIntervalHistogram:](self, "addLessThan200mIntervalHistogram:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v23);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = (void *)*((_QWORD *)a3 + 3);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        -[AWDCoreRoutineLocationAwarenessIntervalHistogram addAnyPositiveIntervalHistogram:](self, "addAnyPositiveIntervalHistogram:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSMutableArray)lessThan10mIntervalHistograms
{
  return self->_lessThan10mIntervalHistograms;
}

- (void)setLessThan10mIntervalHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)lessThan25mIntervalHistograms
{
  return self->_lessThan25mIntervalHistograms;
}

- (void)setLessThan25mIntervalHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)lessThan55mIntervalHistograms
{
  return self->_lessThan55mIntervalHistograms;
}

- (void)setLessThan55mIntervalHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)lessThan200mIntervalHistograms
{
  return self->_lessThan200mIntervalHistograms;
}

- (void)setLessThan200mIntervalHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)anyPositiveIntervalHistograms
{
  return self->_anyPositiveIntervalHistograms;
}

- (void)setAnyPositiveIntervalHistograms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
