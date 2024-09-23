@implementation APPBAggregateDistributionMetric

+ (id)options
{
  if (qword_1002697E0 != -1)
    dispatch_once(&qword_1002697E0, &stru_100214A38);
  return (id)qword_1002697D8;
}

- (BOOL)hasMetric
{
  return self->_metric != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAverage:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_average = a3;
}

- (void)setHasAverage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverage
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStandardDeviation:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_standardDeviation = a3;
}

- (void)setHasStandardDeviation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStandardDeviation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAggregateDistributionMetric;
  v3 = -[APPBAggregateDistributionMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAggregateDistributionMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *metric;
  NSString *bundleID;
  char has;
  void *v9;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = v3;
  metric = self->_metric;
  if (metric)
    objc_msgSend(v3, "setObject:forKey:", metric, CFSTR("metric"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v5, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *(float *)&v4 = self->_average;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("average"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v5;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_count));
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("count"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(float *)&v4 = self->_standardDeviation;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("standardDeviation"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAggregateDistributionMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *metric;
  NSString *bundleID;
  char has;
  id v8;

  v4 = a3;
  metric = self->_metric;
  v8 = v4;
  if (metric)
  {
    PBDataWriterWriteStringField(v4, metric, 1);
    v4 = v8;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    PBDataWriterWriteStringField(v8, bundleID, 2);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteFloatField(v8, 101, self->_average);
    v4 = v8;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field(v8, self->_count, 100);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteFloatField(v8, 102, self->_standardDeviation);
    v4 = v8;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_metric)
  {
    objc_msgSend(v4, "setMetric:");
    v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v4 + 2) = LODWORD(self->_average);
    *((_BYTE *)v4 + 44) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v4 + 6) = self->_count;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 10) = LODWORD(self->_standardDeviation);
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_metric, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 2) = LODWORD(self->_average);
    *((_BYTE *)v5 + 44) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 6) = self->_count;
  *((_BYTE *)v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 10) = LODWORD(self->_standardDeviation);
    *((_BYTE *)v5 + 44) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *metric;
  NSString *bundleID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_20;
  metric = self->_metric;
  if ((unint64_t)metric | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](metric, "isEqual:"))
      goto LABEL_20;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_count != *((_DWORD *)v4 + 6))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_average != *((float *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_20;
  }
  v7 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_standardDeviation != *((float *)v4 + 10))
      goto LABEL_20;
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  uint64_t v6;
  float average;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  float standardDeviation;
  float v14;
  float v15;
  float v16;

  v3 = -[NSString hash](self->_metric, "hash");
  v4 = -[NSString hash](self->_bundleID, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6 = 2654435761 * self->_count;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  average = self->_average;
  v8 = -average;
  if (average >= 0.0)
    v8 = self->_average;
  v9 = floorf(v8 + 0.5);
  v10 = (float)(v8 - v9) * 1.8447e19;
  v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    standardDeviation = self->_standardDeviation;
    v14 = -standardDeviation;
    if (standardDeviation >= 0.0)
      v14 = self->_standardDeviation;
    v15 = floorf(v14 + 0.5);
    v16 = (float)(v14 - v15) * 1.8447e19;
    v12 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabsf(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBAggregateDistributionMetric setMetric:](self, "setMetric:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBAggregateDistributionMetric setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_7;
LABEL_11:
    self->_average = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_count = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 4) != 0)
  {
LABEL_8:
    self->_standardDeviation = *((float *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_9:

}

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
  objc_storeStrong((id *)&self->_metric, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int)count
{
  return self->_count;
}

- (float)average
{
  return self->_average;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
