@implementation APPBAggregateScalarMetric

+ (id)options
{
  if (qword_100269910 != -1)
    dispatch_once(&qword_100269910, &stru_100215100);
  return (id)qword_100269908;
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
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
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
  v8.super_class = (Class)APPBAggregateScalarMetric;
  v3 = -[APPBAggregateScalarMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAggregateScalarMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *metric;
  NSString *bundleID;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  metric = self->_metric;
  if (metric)
    objc_msgSend(v3, "setObject:forKey:", metric, CFSTR("metric"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_count));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("count"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAggregateScalarMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *metric;
  NSString *bundleID;
  id v7;

  v4 = a3;
  metric = self->_metric;
  v7 = v4;
  if (metric)
  {
    PBDataWriterWriteStringField(v4, metric, 1);
    v4 = v7;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    PBDataWriterWriteStringField(v7, bundleID, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_count, 100);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_metric)
  {
    objc_msgSend(v4, "setMetric:");
    v4 = v5;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v5, "setBundleID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_count;
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
  v6 = -[NSString copyWithZone:](self->_metric, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_count;
    *((_BYTE *)v5 + 32) |= 1u;
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
    goto LABEL_10;
  metric = self->_metric;
  if ((unint64_t)metric | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](metric, "isEqual:"))
      goto LABEL_10;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_count == *((_DWORD *)v4 + 4))
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
  uint64_t v5;

  v3 = -[NSString hash](self->_metric, "hash");
  v4 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_count;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBAggregateScalarMetric setMetric:](self, "setMetric:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[APPBAggregateScalarMetric setBundleID:](self, "setBundleID:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_count = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
