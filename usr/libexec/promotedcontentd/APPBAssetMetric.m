@implementation APPBAssetMetric

+ (id)options
{
  if (qword_1002696D8 != -1)
    dispatch_once(&qword_1002696D8, &stru_100214438);
  return (id)qword_1002696D0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)setTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTime
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
  v8.super_class = (Class)APPBAssetMetric;
  v3 = -[APPBAssetMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAssetMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueIdentifier;
  NSString *uRL;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  uRL = self->_uRL;
  if (uRL)
    objc_msgSend(v4, "setObject:forKey:", uRL, CFSTR("URL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_time));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("time"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *uniqueIdentifier;
  NSString *uRL;
  id v7;

  v4 = a3;
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = v4;
  if (uniqueIdentifier)
  {
    PBDataWriterWriteStringField(v4, uniqueIdentifier, 1);
    v4 = v7;
  }
  uRL = self->_uRL;
  if (uRL)
  {
    PBDataWriterWriteStringField(v7, uRL, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v7, 3, self->_time);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (self->_uRL)
  {
    objc_msgSend(v5, "setURL:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_time;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_time;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueIdentifier;
  NSString *uRL;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_10;
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_time == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double time;
  double v7;
  long double v8;
  double v9;

  v3 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v4 = -[NSString hash](self->_uRL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    time = self->_time;
    v7 = -time;
    if (time >= 0.0)
      v7 = self->_time;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBAssetMetric setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBAssetMetric setURL:](self, "setURL:");
    v4 = v5;
  }
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_time = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (double)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uRL, 0);
}

@end
