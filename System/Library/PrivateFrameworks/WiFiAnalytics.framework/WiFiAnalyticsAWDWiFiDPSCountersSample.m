@implementation WiFiAnalyticsAWDWiFiDPSCountersSample

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

- (BOOL)hasControllerStats
{
  return self->_controllerStats != 0;
}

- (BOOL)hasPeerStats
{
  return self->_peerStats != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSCountersSample;
  -[WiFiAnalyticsAWDWiFiDPSCountersSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiDPSCountersSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  void *v6;
  WiFiAnalyticsAWDWiFiNWActivityPeerStats *peerStats;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  controllerStats = self->_controllerStats;
  if (controllerStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("controllerStats"));

  }
  peerStats = self->_peerStats;
  if (peerStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityPeerStats dictionaryRepresentation](peerStats, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("peerStats"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSCountersSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_controllerStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_peerStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_controllerStats)
  {
    objc_msgSend(v4, "setControllerStats:");
    v4 = v5;
  }
  if (self->_peerStats)
  {
    objc_msgSend(v5, "setPeerStats:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats copyWithZone:](self->_controllerStats, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats copyWithZone:](self->_peerStats, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  WiFiAnalyticsAWDWiFiNWActivityPeerStats *peerStats;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  controllerStats = self->_controllerStats;
  if ((unint64_t)controllerStats | *((_QWORD *)v4 + 2)
    && !-[WiFiAnalyticsAWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:"))
  {
    goto LABEL_11;
  }
  peerStats = self->_peerStats;
  if ((unint64_t)peerStats | *((_QWORD *)v4 + 3))
    v7 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats isEqual:](peerStats, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats hash](self->_controllerStats, "hash") ^ v3;
  return v4 ^ -[WiFiAnalyticsAWDWiFiNWActivityPeerStats hash](self->_peerStats, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  uint64_t v7;
  WiFiAnalyticsAWDWiFiNWActivityPeerStats *peerStats;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((v4[4] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  controllerStats = self->_controllerStats;
  v7 = v5[2];
  v10 = v5;
  if (controllerStats)
  {
    if (!v7)
      goto LABEL_9;
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[WiFiAnalyticsAWDWiFiDPSCountersSample setControllerStats:](self, "setControllerStats:");
  }
  v5 = v10;
LABEL_9:
  peerStats = self->_peerStats;
  v9 = v5[3];
  if (peerStats)
  {
    if (v9)
    {
      -[WiFiAnalyticsAWDWiFiNWActivityPeerStats mergeFrom:](peerStats, "mergeFrom:");
LABEL_14:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[WiFiAnalyticsAWDWiFiDPSCountersSample setPeerStats:](self, "setPeerStats:");
    goto LABEL_14;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
  objc_storeStrong((id *)&self->_controllerStats, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityPeerStats)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
  objc_storeStrong((id *)&self->_peerStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerStats, 0);
  objc_storeStrong((id *)&self->_controllerStats, 0);
}

@end
