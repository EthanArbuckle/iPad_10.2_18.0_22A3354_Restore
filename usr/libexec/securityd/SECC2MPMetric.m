@implementation SECC2MPMetric

- (int)metricType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_metricType;
  else
    return 0;
}

- (void)setMetricType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_metricType = a3;
}

- (void)setHasMetricType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetricType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)metricTypeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("none_type");
    case 201:
      return CFSTR("generic_event_type");
    case 200:
      v3 = CFSTR("network_event_type");
      break;
    default:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      break;
  }
  return v3;
}

- (int)StringAsMetricType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none_type")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("network_event_type")) & 1) != 0)
  {
    v4 = 200;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("generic_event_type")))
  {
    v4 = 201;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (BOOL)hasCloudkitInfo
{
  return self->_cloudkitInfo != 0;
}

- (BOOL)hasServerInfo
{
  return self->_serverInfo != 0;
}

- (void)setTriggers:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggers = a3;
}

- (void)setHasTriggers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggers
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportFrequency = a3;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportFrequencyBase = a3;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0;
}

- (BOOL)hasGenericEvent
{
  return self->_genericEvent != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPMetric;
  v3 = -[SECC2MPMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int metricType;
  __CFString *v5;
  SECC2MPDeviceInfo *deviceInfo;
  void *v7;
  SECC2MPCloudKitInfo *cloudkitInfo;
  void *v9;
  SECC2MPServerInfo *serverInfo;
  void *v11;
  char has;
  void *v13;
  SECC2MPNetworkEvent *networkEvent;
  void *v15;
  SECC2MPGenericEvent *genericEvent;
  void *v17;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    metricType = self->_metricType;
    if (metricType)
    {
      if (metricType == 201)
      {
        v5 = CFSTR("generic_event_type");
      }
      else if (metricType == 200)
      {
        v5 = CFSTR("network_event_type");
      }
      else
      {
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_metricType));
      }
    }
    else
    {
      v5 = CFSTR("none_type");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metric_type"));

  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("device_info"));

  }
  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo dictionaryRepresentation](cloudkitInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cloudkit_info"));

  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPServerInfo dictionaryRepresentation](serverInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("server_info"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_triggers));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("triggers"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportFrequency));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("report_frequency"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_19:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportFrequencyBase));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("report_frequency_base"));

  }
LABEL_20:
  networkEvent = self->_networkEvent;
  if (networkEvent)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPNetworkEvent dictionaryRepresentation](networkEvent, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("network_event"));

  }
  genericEvent = self->_genericEvent;
  if (genericEvent)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEvent dictionaryRepresentation](genericEvent, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("generic_event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  unint64_t v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  SECC2MPNetworkEvent *v24;
  char v25;
  unsigned int v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  unint64_t v31;
  char v32;
  int v33;
  uint64_t v34;
  unint64_t v36;
  unint64_t v37;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        goto LABEL_88;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0)
          goto LABEL_11;
        v5 += 7;
        v10 = v6++ >= 9;
        if (v10)
        {
          v7 = 0;
          v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v7 = 0;
LABEL_13:
      if (v11 || (v7 & 7) == 4)
        goto LABEL_88;
      v13 = v7 >> 3;
      if ((int)(v7 >> 3) <= 100)
        break;
      if ((int)v13 <= 199)
      {
        if ((_DWORD)v13 == 101)
        {
          v29 = 0;
          v30 = 0;
          v21 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v31 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v21 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0)
              goto LABEL_83;
            v29 += 7;
            v10 = v30++ >= 9;
            if (v10)
            {
              v21 = 0;
              goto LABEL_85;
            }
          }
          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_83:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v21 = 0;
LABEL_85:
          v34 = 8;
        }
        else
        {
          if ((_DWORD)v13 != 102)
            goto LABEL_68;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (1)
          {
            v22 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if ((v23 & 0x80) == 0)
              goto LABEL_75;
            v19 += 7;
            v10 = v20++ >= 9;
            if (v10)
            {
              v21 = 0;
              goto LABEL_77;
            }
          }
          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_75:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v21 = 0;
LABEL_77:
          v34 = 16;
        }
        goto LABEL_86;
      }
      if ((_DWORD)v13 == 200)
      {
        v24 = objc_alloc_init(SECC2MPNetworkEvent);
        objc_storeStrong((id *)&self->_networkEvent, v24);
        v36 = 0xAAAAAAAAAAAAAAAALL;
        v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || (sub_1001A1158((uint64_t)v24, (uint64_t)a3) & 1) == 0)
        {
LABEL_89:

          LOBYTE(v33) = 0;
          return v33;
        }
      }
      else
      {
        if ((_DWORD)v13 != 201)
        {
LABEL_68:
          v33 = PBReaderSkipValueWithTag(a3);
          if (!v33)
            return v33;
          goto LABEL_87;
        }
        v24 = objc_alloc_init(SECC2MPGenericEvent);
        objc_storeStrong((id *)&self->_genericEvent, v24);
        v36 = 0xAAAAAAAAAAAAAAAALL;
        v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || (sub_1000B2D70((uint64_t)v24, (uint64_t)a3) & 1) == 0)
          goto LABEL_89;
      }
LABEL_67:
      PBReaderRecallMark(a3, &v36);

LABEL_87:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        goto LABEL_88;
    }
    switch((int)v13)
    {
      case 1:
        v14 = 0;
        v15 = 0;
        v16 = 0;
        *(_BYTE *)&self->_has |= 8u;
        while (2)
        {
          v17 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v18 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              v10 = v15++ >= 9;
              if (v10)
              {
                LODWORD(v16) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v16) = 0;
LABEL_73:
        self->_metricType = v16;
        goto LABEL_87;
      case 2:
        v24 = objc_alloc_init(SECC2MPDeviceInfo);
        objc_storeStrong((id *)&self->_deviceInfo, v24);
        v36 = 0xAAAAAAAAAAAAAAAALL;
        v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || (sub_1001B650C(v24, (uint64_t)a3) & 1) == 0)
          goto LABEL_89;
        goto LABEL_67;
      case 3:
        v24 = objc_alloc_init(SECC2MPCloudKitInfo);
        objc_storeStrong((id *)&self->_cloudkitInfo, v24);
        v36 = 0xAAAAAAAAAAAAAAAALL;
        v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || (sub_10015720C(v24, (uint64_t)a3) & 1) == 0)
          goto LABEL_89;
        goto LABEL_67;
      case 4:
        v24 = objc_alloc_init(SECC2MPServerInfo);
        objc_storeStrong((id *)&self->_serverInfo, v24);
        v36 = 0xAAAAAAAAAAAAAAAALL;
        v37 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v36) || !sub_1001C1A80((uint64_t)v24, (uint64_t)a3))
          goto LABEL_89;
        goto LABEL_67;
      default:
        if ((_DWORD)v13 != 100)
          goto LABEL_68;
        v25 = 0;
        v26 = 0;
        v21 = 0;
        *(_BYTE *)&self->_has |= 4u;
        break;
    }
    while (1)
    {
      v27 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v28 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
      v21 |= (unint64_t)(v28 & 0x7F) << v25;
      if ((v28 & 0x80) == 0)
        goto LABEL_79;
      v25 += 7;
      v10 = v26++ >= 9;
      if (v10)
      {
        v21 = 0;
        goto LABEL_81;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_79:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v21 = 0;
LABEL_81:
    v34 = 24;
LABEL_86:
    *(_QWORD *)&self->PBCodable_opaque[v34] = v21;
    goto LABEL_87;
  }
LABEL_88:
  LOBYTE(v33) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  SECC2MPDeviceInfo *deviceInfo;
  SECC2MPCloudKitInfo *cloudkitInfo;
  SECC2MPServerInfo *serverInfo;
  char has;
  SECC2MPNetworkEvent *networkEvent;
  SECC2MPGenericEvent *genericEvent;
  id v11;

  v4 = a3;
  v11 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_metricType, 1);
    v4 = v11;
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    PBDataWriterWriteSubmessage(v11, deviceInfo, 2);
    v4 = v11;
  }
  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    PBDataWriterWriteSubmessage(v11, cloudkitInfo, 3);
    v4 = v11;
  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    PBDataWriterWriteSubmessage(v11, serverInfo, 4);
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v11, self->_triggers, 100);
    v4 = v11;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field(v11, self->_reportFrequency, 101);
  v4 = v11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint64Field(v11, self->_reportFrequencyBase, 102);
    v4 = v11;
  }
LABEL_13:
  networkEvent = self->_networkEvent;
  if (networkEvent)
  {
    PBDataWriterWriteSubmessage(v11, networkEvent, 200);
    v4 = v11;
  }
  genericEvent = self->_genericEvent;
  if (genericEvent)
  {
    PBDataWriterWriteSubmessage(v11, genericEvent, 201);
    v4 = v11;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[14] = self->_metricType;
    *((_BYTE *)v4 + 80) |= 8u;
  }
  v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    objc_msgSend(v6, "setCloudkitInfo:");
    v4 = v6;
  }
  if (self->_serverInfo)
  {
    objc_msgSend(v6, "setServerInfo:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_triggers;
    *((_BYTE *)v4 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 1) = self->_reportFrequency;
  *((_BYTE *)v4 + 80) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((_QWORD *)v4 + 2) = self->_reportFrequencyBase;
    *((_BYTE *)v4 + 80) |= 2u;
  }
LABEL_13:
  if (self->_networkEvent)
  {
    objc_msgSend(v6, "setNetworkEvent:");
    v4 = v6;
  }
  if (self->_genericEvent)
  {
    objc_msgSend(v6, "setGenericEvent:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char has;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5[14] = self->_metricType;
    *((_BYTE *)v5 + 80) |= 8u;
  }
  v7 = -[SECC2MPDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[SECC2MPCloudKitInfo copyWithZone:](self->_cloudkitInfo, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  v11 = -[SECC2MPServerInfo copyWithZone:](self->_serverInfo, "copyWithZone:", a3);
  v12 = (void *)v6[9];
  v6[9] = v11;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    v6[1] = self->_reportFrequency;
    *((_BYTE *)v6 + 80) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6[3] = self->_triggers;
  *((_BYTE *)v6 + 80) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v6[2] = self->_reportFrequencyBase;
    *((_BYTE *)v6 + 80) |= 2u;
  }
LABEL_7:
  v14 = -[SECC2MPNetworkEvent copyWithZone:](self->_networkEvent, "copyWithZone:", a3);
  v15 = (void *)v6[8];
  v6[8] = v14;

  v16 = -[SECC2MPGenericEvent copyWithZone:](self->_genericEvent, "copyWithZone:", a3);
  v17 = (void *)v6[6];
  v6[6] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SECC2MPDeviceInfo *deviceInfo;
  SECC2MPCloudKitInfo *cloudkitInfo;
  SECC2MPServerInfo *serverInfo;
  SECC2MPNetworkEvent *networkEvent;
  SECC2MPGenericEvent *genericEvent;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_metricType != *((_DWORD *)v4 + 14))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
LABEL_32:
    v10 = 0;
    goto LABEL_33;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((_QWORD *)v4 + 5) && !-[SECC2MPDeviceInfo isEqual:](deviceInfo, "isEqual:"))
    goto LABEL_32;
  cloudkitInfo = self->_cloudkitInfo;
  if ((unint64_t)cloudkitInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[SECC2MPCloudKitInfo isEqual:](cloudkitInfo, "isEqual:"))
      goto LABEL_32;
  }
  serverInfo = self->_serverInfo;
  if ((unint64_t)serverInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[SECC2MPServerInfo isEqual:](serverInfo, "isEqual:"))
      goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_triggers != *((_QWORD *)v4 + 3))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_reportFrequency != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_reportFrequencyBase != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_32;
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((_QWORD *)v4 + 8)
    && !-[SECC2MPNetworkEvent isEqual:](networkEvent, "isEqual:"))
  {
    goto LABEL_32;
  }
  genericEvent = self->_genericEvent;
  if ((unint64_t)genericEvent | *((_QWORD *)v4 + 6))
    v10 = -[SECC2MPGenericEvent isEqual:](genericEvent, "isEqual:");
  else
    v10 = 1;
LABEL_33:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_metricType;
  else
    v3 = 0;
  v4 = -[SECC2MPDeviceInfo hash](self->_deviceInfo, "hash");
  v5 = -[SECC2MPCloudKitInfo hash](self->_cloudkitInfo, "hash");
  v6 = -[SECC2MPServerInfo hash](self->_serverInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v7 = 2654435761u * self->_triggers;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v8 = 2654435761u * self->_reportFrequency;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v9 = 2654435761u * self->_reportFrequencyBase;
LABEL_11:
  v10 = v4 ^ v3 ^ v5 ^ v6;
  v11 = v7 ^ v8 ^ v9 ^ -[SECC2MPNetworkEvent hash](self->_networkEvent, "hash");
  return v10 ^ v11 ^ -[SECC2MPGenericEvent hash](self->_genericEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  SECC2MPDeviceInfo *deviceInfo;
  uint64_t v7;
  SECC2MPCloudKitInfo *cloudkitInfo;
  uint64_t v9;
  SECC2MPServerInfo *serverInfo;
  uint64_t v11;
  char v12;
  SECC2MPNetworkEvent *networkEvent;
  uint64_t v14;
  SECC2MPGenericEvent *genericEvent;
  uint64_t v16;
  _QWORD *v17;

  v4 = a3;
  v5 = v4;
  if ((v4[20] & 8) != 0)
  {
    self->_metricType = v4[14];
    *(_BYTE *)&self->_has |= 8u;
  }
  deviceInfo = self->_deviceInfo;
  v7 = v5[5];
  v17 = v5;
  if (deviceInfo)
  {
    if (!v7)
      goto LABEL_9;
    -[SECC2MPDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SECC2MPMetric setDeviceInfo:](self, "setDeviceInfo:");
  }
  v5 = v17;
LABEL_9:
  cloudkitInfo = self->_cloudkitInfo;
  v9 = v5[4];
  if (cloudkitInfo)
  {
    if (!v9)
      goto LABEL_15;
    -[SECC2MPCloudKitInfo mergeFrom:](cloudkitInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[SECC2MPMetric setCloudkitInfo:](self, "setCloudkitInfo:");
  }
  v5 = v17;
LABEL_15:
  serverInfo = self->_serverInfo;
  v11 = v5[9];
  if (serverInfo)
  {
    if (!v11)
      goto LABEL_21;
    -[SECC2MPServerInfo mergeFrom:](serverInfo, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[SECC2MPMetric setServerInfo:](self, "setServerInfo:");
  }
  v5 = v17;
LABEL_21:
  v12 = *((_BYTE *)v5 + 80);
  if ((v12 & 4) != 0)
  {
    self->_triggers = v5[3];
    *(_BYTE *)&self->_has |= 4u;
    v12 = *((_BYTE *)v5 + 80);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v5[10] & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_reportFrequency = v5[1];
  *(_BYTE *)&self->_has |= 1u;
  if ((v5[10] & 2) != 0)
  {
LABEL_24:
    self->_reportFrequencyBase = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_25:
  networkEvent = self->_networkEvent;
  v14 = v5[8];
  if (networkEvent)
  {
    if (!v14)
      goto LABEL_34;
    -[SECC2MPNetworkEvent mergeFrom:](networkEvent, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_34;
    -[SECC2MPMetric setNetworkEvent:](self, "setNetworkEvent:");
  }
  v5 = v17;
LABEL_34:
  genericEvent = self->_genericEvent;
  v16 = v5[6];
  if (genericEvent)
  {
    if (v16)
    {
      -[SECC2MPGenericEvent mergeFrom:](genericEvent, "mergeFrom:");
LABEL_39:
      v5 = v17;
    }
  }
  else if (v16)
  {
    -[SECC2MPMetric setGenericEvent:](self, "setGenericEvent:");
    goto LABEL_39;
  }

}

- (SECC2MPDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (SECC2MPCloudKitInfo)cloudkitInfo
{
  return self->_cloudkitInfo;
}

- (void)setCloudkitInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cloudkitInfo, a3);
}

- (SECC2MPServerInfo)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serverInfo, a3);
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (SECC2MPNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvent, a3);
}

- (SECC2MPGenericEvent)genericEvent
{
  return self->_genericEvent;
}

- (void)setGenericEvent:(id)a3
{
  objc_storeStrong((id *)&self->_genericEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_genericEvent, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_cloudkitInfo, 0);
}

@end
