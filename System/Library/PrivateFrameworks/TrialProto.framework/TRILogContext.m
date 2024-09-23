@implementation TRILogContext

- (void)setProjectId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_projectId = a3;
}

- (void)setHasProjectId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProjectId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTrackingId
{
  return self->_trackingId != 0;
}

- (BOOL)hasDeviceLogTime
{
  return self->_deviceLogTime != 0;
}

- (BOOL)hasDeviceTrackingTime
{
  return self->_deviceTrackingTime != 0;
}

- (void)setProcessEventIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_processEventIndex = a3;
}

- (void)setHasProcessEventIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProcessEventIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TRILogContext;
  -[TRILogContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *trackingId;
  TRILogTime *deviceLogTime;
  void *v7;
  TRILogTime *deviceTrackingTime;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_projectId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("project_id"));

  }
  trackingId = self->_trackingId;
  if (trackingId)
    objc_msgSend(v3, "setObject:forKey:", trackingId, CFSTR("tracking_id"));
  deviceLogTime = self->_deviceLogTime;
  if (deviceLogTime)
  {
    -[TRILogTime dictionaryRepresentation](deviceLogTime, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("device_log_time"));

  }
  deviceTrackingTime = self->_deviceTrackingTime;
  if (deviceTrackingTime)
  {
    -[TRILogTime dictionaryRepresentation](deviceTrackingTime, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("device_tracking_time"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_processEventIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("process_event_index"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_trackingId)
    PBDataWriterWriteStringField();
  if (self->_deviceLogTime)
    PBDataWriterWriteSubmessage();
  if (self->_deviceTrackingTime)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_projectId;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  v5 = v4;
  if (self->_trackingId)
  {
    objc_msgSend(v4, "setTrackingId:");
    v4 = v5;
  }
  if (self->_deviceLogTime)
  {
    objc_msgSend(v5, "setDeviceLogTime:");
    v4 = v5;
  }
  if (self->_deviceTrackingTime)
  {
    objc_msgSend(v5, "setDeviceTrackingTime:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_processEventIndex;
    *((_BYTE *)v4 + 48) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_projectId;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_trackingId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  v9 = -[TRILogTime copyWithZone:](self->_deviceLogTime, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  v11 = -[TRILogTime copyWithZone:](self->_deviceTrackingTime, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_processEventIndex;
    *(_BYTE *)(v6 + 48) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *trackingId;
  TRILogTime *deviceLogTime;
  TRILogTime *deviceTrackingTime;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_projectId != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  trackingId = self->_trackingId;
  if ((unint64_t)trackingId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](trackingId, "isEqual:"))
    goto LABEL_17;
  deviceLogTime = self->_deviceLogTime;
  if ((unint64_t)deviceLogTime | *((_QWORD *)v4 + 2))
  {
    if (!-[TRILogTime isEqual:](deviceLogTime, "isEqual:"))
      goto LABEL_17;
  }
  deviceTrackingTime = self->_deviceTrackingTime;
  if ((unint64_t)deviceTrackingTime | *((_QWORD *)v4 + 3))
  {
    if (!-[TRILogTime isEqual:](deviceTrackingTime, "isEqual:"))
      goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_processEventIndex != *((_QWORD *)v4 + 1))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_projectId;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_trackingId, "hash");
  v5 = -[TRILogTime hash](self->_deviceLogTime, "hash");
  v6 = -[TRILogTime hash](self->_deviceTrackingTime, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_processEventIndex;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  TRILogTime *deviceLogTime;
  uint64_t v7;
  TRILogTime *deviceTrackingTime;
  uint64_t v9;
  _DWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((v4[12] & 2) != 0)
  {
    self->_projectId = v4[8];
    *(_BYTE *)&self->_has |= 2u;
  }
  v10 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[TRILogContext setTrackingId:](self, "setTrackingId:");
    v5 = v10;
  }
  deviceLogTime = self->_deviceLogTime;
  v7 = v5[2];
  if (deviceLogTime)
  {
    if (!v7)
      goto LABEL_11;
    -[TRILogTime mergeFrom:](deviceLogTime, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[TRILogContext setDeviceLogTime:](self, "setDeviceLogTime:");
  }
  v5 = v10;
LABEL_11:
  deviceTrackingTime = self->_deviceTrackingTime;
  v9 = v5[3];
  if (deviceTrackingTime)
  {
    if (!v9)
      goto LABEL_17;
    -[TRILogTime mergeFrom:](deviceTrackingTime, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[TRILogContext setDeviceTrackingTime:](self, "setDeviceTrackingTime:");
  }
  v5 = v10;
LABEL_17:
  if ((v5[6] & 1) != 0)
  {
    self->_processEventIndex = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)projectId
{
  return self->_projectId;
}

- (NSString)trackingId
{
  return self->_trackingId;
}

- (void)setTrackingId:(id)a3
{
  objc_storeStrong((id *)&self->_trackingId, a3);
}

- (TRILogTime)deviceLogTime
{
  return self->_deviceLogTime;
}

- (void)setDeviceLogTime:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLogTime, a3);
}

- (TRILogTime)deviceTrackingTime
{
  return self->_deviceTrackingTime;
}

- (void)setDeviceTrackingTime:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTrackingTime, a3);
}

- (unint64_t)processEventIndex
{
  return self->_processEventIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingId, 0);
  objc_storeStrong((id *)&self->_deviceTrackingTime, 0);
  objc_storeStrong((id *)&self->_deviceLogTime, 0);
}

@end
