@implementation AWDWiFiSlowWiFiReport

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiSlowWiFiReport setSlowNotice:](self, "setSlowNotice:", 0);
  -[AWDWiFiSlowWiFiReport setLinkQualSamples:](self, "setLinkQualSamples:", 0);
  -[AWDWiFiSlowWiFiReport setUsbEvents:](self, "setUsbEvents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSlowWiFiReport;
  -[AWDWiFiSlowWiFiReport dealloc](&v3, sel_dealloc);
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

- (BOOL)hasSlowNotice
{
  return self->_slowNotice != 0;
}

- (void)clearLinkQualSamples
{
  -[NSMutableArray removeAllObjects](self->_linkQualSamples, "removeAllObjects");
}

- (void)addLinkQualSample:(id)a3
{
  NSMutableArray *linkQualSamples;

  linkQualSamples = self->_linkQualSamples;
  if (!linkQualSamples)
  {
    linkQualSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_linkQualSamples = linkQualSamples;
  }
  -[NSMutableArray addObject:](linkQualSamples, "addObject:", a3);
}

- (unint64_t)linkQualSamplesCount
{
  return -[NSMutableArray count](self->_linkQualSamples, "count");
}

- (id)linkQualSampleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_linkQualSamples, "objectAtIndex:", a3);
}

+ (Class)linkQualSampleType
{
  return (Class)objc_opt_class();
}

- (void)clearUsbEvents
{
  -[NSMutableArray removeAllObjects](self->_usbEvents, "removeAllObjects");
}

- (void)addUsbEvent:(id)a3
{
  NSMutableArray *usbEvents;

  usbEvents = self->_usbEvents;
  if (!usbEvents)
  {
    usbEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_usbEvents = usbEvents;
  }
  -[NSMutableArray addObject:](usbEvents, "addObject:", a3);
}

- (unint64_t)usbEventsCount
{
  return -[NSMutableArray count](self->_usbEvents, "count");
}

- (id)usbEventAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_usbEvents, "objectAtIndex:", a3);
}

+ (Class)usbEventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSlowWiFiReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiSlowWiFiReport description](&v3, sel_description), -[AWDWiFiSlowWiFiReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDSlowWiFiNotification *slowNotice;
  void *v5;
  NSMutableArray *linkQualSamples;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *usbEvents;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  slowNotice = self->_slowNotice;
  if (slowNotice)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSlowWiFiNotification dictionaryRepresentation](slowNotice, "dictionaryRepresentation"), CFSTR("slowNotice"));
  if (-[NSMutableArray count](self->_linkQualSamples, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_linkQualSamples, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    linkQualSamples = self->_linkQualSamples;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(linkQualSamples);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("linkQualSample"));

  }
  if (-[NSMutableArray count](self->_usbEvents, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_usbEvents, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    usbEvents = self->_usbEvents;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(usbEvents);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("usbEvent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSlowWiFiReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *linkQualSamples;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *usbEvents;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_slowNotice)
    PBDataWriterWriteSubmessage();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  linkQualSamples = self->_linkQualSamples;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(linkQualSamples);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  usbEvents = self->_usbEvents;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(usbEvents);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_slowNotice)
    objc_msgSend(a3, "setSlowNotice:");
  if (-[AWDWiFiSlowWiFiReport linkQualSamplesCount](self, "linkQualSamplesCount"))
  {
    objc_msgSend(a3, "clearLinkQualSamples");
    v5 = -[AWDWiFiSlowWiFiReport linkQualSamplesCount](self, "linkQualSamplesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addLinkQualSample:", -[AWDWiFiSlowWiFiReport linkQualSampleAtIndex:](self, "linkQualSampleAtIndex:", i));
    }
  }
  if (-[AWDWiFiSlowWiFiReport usbEventsCount](self, "usbEventsCount"))
  {
    objc_msgSend(a3, "clearUsbEvents");
    v8 = -[AWDWiFiSlowWiFiReport usbEventsCount](self, "usbEventsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addUsbEvent:", -[AWDWiFiSlowWiFiReport usbEventAtIndex:](self, "usbEventAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *linkQualSamples;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *usbEvents;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  v6[3] = -[AWDSlowWiFiNotification copyWithZone:](self->_slowNotice, "copyWithZone:", a3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  linkQualSamples = self->_linkQualSamples;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(linkQualSamples);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addLinkQualSample:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkQualSamples, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  usbEvents = self->_usbEvents;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(usbEvents);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addUsbEvent:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usbEvents, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDSlowWiFiNotification *slowNotice;
  NSMutableArray *linkQualSamples;
  NSMutableArray *usbEvents;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    slowNotice = self->_slowNotice;
    if (!((unint64_t)slowNotice | *((_QWORD *)a3 + 3))
      || (v5 = -[AWDSlowWiFiNotification isEqual:](slowNotice, "isEqual:")) != 0)
    {
      linkQualSamples = self->_linkQualSamples;
      if (!((unint64_t)linkQualSamples | *((_QWORD *)a3 + 2))
        || (v5 = -[NSMutableArray isEqual:](linkQualSamples, "isEqual:")) != 0)
      {
        usbEvents = self->_usbEvents;
        if ((unint64_t)usbEvents | *((_QWORD *)a3 + 4))
          LOBYTE(v5) = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
        else
          LOBYTE(v5) = 1;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDSlowWiFiNotification hash](self->_slowNotice, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_linkQualSamples, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_usbEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDSlowWiFiNotification *slowNotice;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  slowNotice = self->_slowNotice;
  v6 = *((_QWORD *)a3 + 3);
  if (slowNotice)
  {
    if (v6)
      -[AWDSlowWiFiNotification mergeFrom:](slowNotice, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiSlowWiFiReport setSlowNotice:](self, "setSlowNotice:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[AWDWiFiSlowWiFiReport addLinkQualSample:](self, "addLinkQualSample:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[AWDWiFiSlowWiFiReport addUsbEvent:](self, "addUsbEvent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDSlowWiFiNotification)slowNotice
{
  return self->_slowNotice;
}

- (void)setSlowNotice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)linkQualSamples
{
  return self->_linkQualSamples;
}

- (void)setLinkQualSamples:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)usbEvents
{
  return self->_usbEvents;
}

- (void)setUsbEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
