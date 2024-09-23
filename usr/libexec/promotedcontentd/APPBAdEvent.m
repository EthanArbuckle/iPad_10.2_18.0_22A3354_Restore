@implementation APPBAdEvent

+ (id)options
{
  if (qword_100269970 != -1)
    dispatch_once(&qword_100269970, &stru_100215358);
  return (id)qword_100269968;
}

- (void)setTimestampEvent:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampEvent = a3;
}

- (void)setHasTimestampEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (int)deviceOrientation
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_deviceOrientation;
  else
    return 0;
}

- (void)setDeviceOrientation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceOrientation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)deviceOrientationAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215378 + a3);
}

- (int)StringAsDeviceOrientation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Portrait")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PortraitUpsideDown")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LandscapeLeft")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LandscapeRight")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FaceUp")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FaceDown")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)connectionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setConnectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002153B0 + a3);
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownConnection")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_G")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_5G")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_G")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_5G")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_75G")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_H_Plus")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_4G")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_5G")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_origin;
  else
    return 1;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)originAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Storyboard");
  if (a3 == 2)
    v3 = CFSTR("Banner");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Storyboard")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdEvent;
  v3 = -[APPBAdEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *context;
  char has;
  uint64_t deviceOrientation;
  void *v8;
  uint64_t connectionType;
  void *v10;
  int origin;
  __CFString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestampEvent));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestampEvent"));

  }
  context = self->_context;
  if (context)
    objc_msgSend(v3, "setObject:forKey:", context, CFSTR("context"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    deviceOrientation = self->_deviceOrientation;
    if (deviceOrientation >= 7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceOrientation));
    else
      v8 = *(&off_100215378 + deviceOrientation);
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("deviceOrientation"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        return v3;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  connectionType = self->_connectionType;
  if (connectionType >= 0xB)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType));
  else
    v10 = *(&off_1002153B0 + connectionType);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("connectionType"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_17:
    origin = self->_origin;
    if (origin == 1)
    {
      v12 = CFSTR("Storyboard");
    }
    else if (origin == 2)
    {
      v12 = CFSTR("Banner");
    }
    else
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_origin));
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("origin"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *context;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(v6, 1, self->_timestampEvent);
  context = self->_context;
  if (context)
    PBDataWriterWriteStringField(v6, context, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field(v6, self->_connectionType, 5);
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field(v6, self->_deviceOrientation, 4);
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field(v6, self->_origin, 6);
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestampEvent;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_context)
  {
    v6 = v4;
    objc_msgSend(v4, "setContext:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v4 + 4) = self->_connectionType;
    *((_BYTE *)v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v4 + 8) = self->_deviceOrientation;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 9) = self->_origin;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_timestampEvent;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_context, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v6 + 4) = self->_connectionType;
    *((_BYTE *)v6 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v6;
    goto LABEL_6;
  }
  *((_DWORD *)v6 + 8) = self->_deviceOrientation;
  *((_BYTE *)v6 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 9) = self->_origin;
    *((_BYTE *)v6 + 40) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *context;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timestampEvent != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_24;
  }
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](context, "isEqual:"))
    {
LABEL_24:
      v7 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_connectionType != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  v7 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_origin != *((_DWORD *)v4 + 9))
      goto LABEL_24;
    v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestampEvent;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestampEvent = self->_timestampEvent;
    v5 = -timestampEvent;
    if (timestampEvent >= 0.0)
      v5 = self->_timestampEvent;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_context, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_deviceOrientation;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_connectionType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_origin;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_timestampEvent = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[APPBAdEvent setContext:](self, "setContext:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_7;
LABEL_11:
    self->_connectionType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_deviceOrientation = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 8) != 0)
  {
LABEL_8:
    self->_origin = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_9:

}

- (double)timestampEvent
{
  return self->_timestampEvent;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
