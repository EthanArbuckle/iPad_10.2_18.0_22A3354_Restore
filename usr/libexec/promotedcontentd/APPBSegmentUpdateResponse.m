@implementation APPBSegmentUpdateResponse

+ (id)options
{
  if (qword_100269900 != -1)
    dispatch_once(&qword_100269900, &stru_1002150E0);
  return (id)qword_1002698F8;
}

- (BOOL)hasIdDebug
{
  return self->_idDebug != 0;
}

- (void)setSegmentRefreshIntervalInSeconds:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_segmentRefreshIntervalInSeconds = a3;
}

- (void)setHasSegmentRefreshIntervalInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSegmentRefreshIntervalInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaxSegmentUpdateIntervalInSeconds:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxSegmentUpdateIntervalInSeconds = a3;
}

- (void)setHasMaxSegmentUpdateIntervalInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxSegmentUpdateIntervalInSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBSegmentUpdateResponse;
  v3 = -[APPBSegmentUpdateResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBSegmentUpdateResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idDebug;
  char has;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  idDebug = self->_idDebug;
  if (idDebug)
    objc_msgSend(v3, "setObject:forKey:", idDebug, CFSTR("idDebug"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_segmentRefreshIntervalInSeconds));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("segmentRefreshIntervalInSeconds"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxSegmentUpdateIntervalInSeconds));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("maxSegmentUpdateIntervalInSeconds"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBSegmentUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *idDebug;
  char has;
  id v7;

  v4 = a3;
  idDebug = self->_idDebug;
  v7 = v4;
  if (idDebug)
  {
    PBDataWriterWriteStringField(v4, idDebug, 2);
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v7, 3, self->_segmentRefreshIntervalInSeconds);
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v7, 4, self->_maxSegmentUpdateIntervalInSeconds);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_idDebug)
  {
    v6 = v4;
    objc_msgSend(v4, "setIdDebug:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_segmentRefreshIntervalInSeconds;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_maxSegmentUpdateIntervalInSeconds;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idDebug, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_segmentRefreshIntervalInSeconds;
    *((_BYTE *)v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_maxSegmentUpdateIntervalInSeconds;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *idDebug;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_13;
  idDebug = self->_idDebug;
  if ((unint64_t)idDebug | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](idDebug, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_segmentRefreshIntervalInSeconds != *((double *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_maxSegmentUpdateIntervalInSeconds != *((double *)v4 + 1))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double segmentRefreshIntervalInSeconds;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double maxSegmentUpdateIntervalInSeconds;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSString hash](self->_idDebug, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    segmentRefreshIntervalInSeconds = self->_segmentRefreshIntervalInSeconds;
    v7 = -segmentRefreshIntervalInSeconds;
    if (segmentRefreshIntervalInSeconds >= 0.0)
      v7 = self->_segmentRefreshIntervalInSeconds;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    maxSegmentUpdateIntervalInSeconds = self->_maxSegmentUpdateIntervalInSeconds;
    v12 = -maxSegmentUpdateIntervalInSeconds;
    if (maxSegmentUpdateIntervalInSeconds >= 0.0)
      v12 = self->_maxSegmentUpdateIntervalInSeconds;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  double *v6;

  v4 = (double *)a3;
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[APPBSegmentUpdateResponse setIdDebug:](self, "setIdDebug:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_segmentRefreshIntervalInSeconds = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_maxSegmentUpdateIntervalInSeconds = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)idDebug
{
  return self->_idDebug;
}

- (void)setIdDebug:(id)a3
{
  objc_storeStrong((id *)&self->_idDebug, a3);
}

- (double)segmentRefreshIntervalInSeconds
{
  return self->_segmentRefreshIntervalInSeconds;
}

- (double)maxSegmentUpdateIntervalInSeconds
{
  return self->_maxSegmentUpdateIntervalInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idDebug, 0);
}

@end
