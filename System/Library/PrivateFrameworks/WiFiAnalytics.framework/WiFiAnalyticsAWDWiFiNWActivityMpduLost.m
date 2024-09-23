@implementation WiFiAnalyticsAWDWiFiNWActivityMpduLost

- (BOOL)hasBALost
{
  return self->_bALost != 0;
}

- (BOOL)hasNonBALost
{
  return self->_nonBALost != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityMpduLost;
  -[WiFiAnalyticsAWDWiFiNWActivityMpduLost description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityMpduLost dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *bALost;
  void *v5;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *nonBALost;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bALost = self->_bALost;
  if (bALost)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityMpduWME dictionaryRepresentation](bALost, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("BALost"));

  }
  nonBALost = self->_nonBALost;
  if (nonBALost)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityMpduWME dictionaryRepresentation](nonBALost, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nonBALost"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityMpduLostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bALost)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_nonBALost)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bALost)
  {
    objc_msgSend(v4, "setBALost:");
    v4 = v5;
  }
  if (self->_nonBALost)
  {
    objc_msgSend(v5, "setNonBALost:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[WiFiAnalyticsAWDWiFiNWActivityMpduWME copyWithZone:](self->_bALost, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[WiFiAnalyticsAWDWiFiNWActivityMpduWME copyWithZone:](self->_nonBALost, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *bALost;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *nonBALost;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((bALost = self->_bALost, !((unint64_t)bALost | v4[1]))
     || -[WiFiAnalyticsAWDWiFiNWActivityMpduWME isEqual:](bALost, "isEqual:")))
  {
    nonBALost = self->_nonBALost;
    if ((unint64_t)nonBALost | v4[2])
      v7 = -[WiFiAnalyticsAWDWiFiNWActivityMpduWME isEqual:](nonBALost, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[WiFiAnalyticsAWDWiFiNWActivityMpduWME hash](self->_bALost, "hash");
  return -[WiFiAnalyticsAWDWiFiNWActivityMpduWME hash](self->_nonBALost, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *bALost;
  uint64_t v6;
  WiFiAnalyticsAWDWiFiNWActivityMpduWME *nonBALost;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  bALost = self->_bALost;
  v6 = v4[1];
  v9 = v4;
  if (bALost)
  {
    if (!v6)
      goto LABEL_7;
    -[WiFiAnalyticsAWDWiFiNWActivityMpduWME mergeFrom:](bALost, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[WiFiAnalyticsAWDWiFiNWActivityMpduLost setBALost:](self, "setBALost:");
  }
  v4 = v9;
LABEL_7:
  nonBALost = self->_nonBALost;
  v8 = v4[2];
  if (nonBALost)
  {
    if (v8)
    {
      -[WiFiAnalyticsAWDWiFiNWActivityMpduWME mergeFrom:](nonBALost, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityMpduLost setNonBALost:](self, "setNonBALost:");
    goto LABEL_12;
  }

}

- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)bALost
{
  return self->_bALost;
}

- (void)setBALost:(id)a3
{
  objc_storeStrong((id *)&self->_bALost, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)nonBALost
{
  return self->_nonBALost;
}

- (void)setNonBALost:(id)a3
{
  objc_storeStrong((id *)&self->_nonBALost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBALost, 0);
  objc_storeStrong((id *)&self->_bALost, 0);
}

@end
