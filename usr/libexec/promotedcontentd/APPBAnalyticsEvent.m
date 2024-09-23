@implementation APPBAnalyticsEvent

+ (id)options
{
  if (qword_100269830 != -1)
    dispatch_once(&qword_100269830, &stru_100214AD8);
  return (id)qword_100269828;
}

- (id)eventAsString:(int)a3
{
  if (a3 >= 9)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214AF8 + a3);
}

- (int)StringAsEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrerollRequested")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidAppear")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidRenderTransparency")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidDisappear")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyUserTransparencyDidLinkOut")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidAppear")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidRenderTransparency")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidDisappear")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidLinkOut")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)APPBAnalyticsEvent;
  v3 = -[APPBAnalyticsEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAnalyticsEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t event;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  event = self->_event;
  if (event >= 9)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_event));
  else
    v5 = *(&off_100214AF8 + event);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("event"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAnalyticsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t event;
  id v5;

  event = self->_event;
  v5 = a3;
  PBDataWriterWriteInt32Field(v5, event, 2);
  PBDataWriterWriteDoubleField(v5, 3, self->_timestamp);

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_event;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timestamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_event;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && self->_event == *((_DWORD *)v4 + 4)
    && self->_timestamp == *((double *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  uint64_t event;
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  event = self->_event;
  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  return v10 ^ (2654435761 * event);
}

- (void)mergeFrom:(id)a3
{
  self->_event = *((_DWORD *)a3 + 4);
  self->_timestamp = *((double *)a3 + 1);
}

- (int)event
{
  return self->_event;
}

- (void)setEvent:(int)a3
{
  self->_event = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
