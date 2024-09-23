@implementation BCReadingStatisticsProtoTOCEntry

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCReadingStatisticsProtoTOCEntry;
  v3 = -[BCReadingStatisticsProtoTOCEntry description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoTOCEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *href;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  href = self->_href;
  if (href)
    objc_msgSend(v3, "setObject:forKey:", href, CFSTR("href"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_readProportion));
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("readProportion"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("timestamp"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCReadingStatisticsProtoTOCEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField(v4, 2, self->_readProportion);
  PBDataWriterWriteDoubleField(v4, 3, self->_timestamp);

}

- (void)copyTo:(id)a3
{
  NSString *href;
  double *v5;

  href = self->_href;
  v5 = (double *)a3;
  objc_msgSend(v5, "setHref:", href);
  v5[1] = self->_readProportion;
  v5[2] = self->_timestamp;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_href, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[1] = *(_QWORD *)&self->_readProportion;
  v5[2] = *(_QWORD *)&self->_timestamp;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *href;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((href = self->_href, !((unint64_t)href | *((_QWORD *)v4 + 3)))
     || -[NSString isEqual:](href, "isEqual:"))
    && self->_readProportion == *((double *)v4 + 1)
    && self->_timestamp == *((double *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double readProportion;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double timestamp;
  double v14;
  long double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v3 = -[NSString hash](self->_href, "hash");
  readProportion = self->_readProportion;
  v5 = -readProportion;
  if (readProportion >= 0.0)
    v5 = self->_readProportion;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  timestamp = self->_timestamp;
  v14 = -timestamp;
  if (timestamp >= 0.0)
    v14 = self->_timestamp;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = fmod(v15, 1.84467441e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabs(v16);
  if (v16 >= 0.0)
    v20 = v19;
  return v12 ^ v3 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (*((_QWORD *)v4 + 3))
  {
    v5 = v4;
    -[BCReadingStatisticsProtoTOCEntry setHref:](self, "setHref:");
    v4 = v5;
  }
  self->_readProportion = v4[1];
  self->_timestamp = v4[2];

}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (double)readProportion
{
  return self->_readProportion;
}

- (void)setReadProportion:(double)a3
{
  self->_readProportion = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_href, 0);
}

@end
