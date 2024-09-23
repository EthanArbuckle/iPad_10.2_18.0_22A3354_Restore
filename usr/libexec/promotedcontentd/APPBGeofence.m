@implementation APPBGeofence

+ (id)options
{
  if (qword_100269688 != -1)
    dispatch_once(&qword_100269688, &stru_100214308);
  return (id)qword_100269680;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBGeofence;
  v3 = -[APPBGeofence description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBGeofence dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("latitude"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("longitude"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_radius));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("radius"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBGeofenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_latitude;
  v5 = a3;
  PBDataWriterWriteDoubleField(v5, 1, latitude);
  PBDataWriterWriteDoubleField(v5, 2, self->_longitude);
  PBDataWriterWriteDoubleField(v5, 3, self->_radius);

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_latitude;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_longitude;
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_radius;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_latitude;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_longitude;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_radius;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && self->_latitude == v4[1]
    && self->_longitude == v4[2]
    && self->_radius == v4[3];

  return v5;
}

- (unint64_t)hash
{
  double latitude;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double longitude;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double radius;
  double v22;
  long double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  latitude = self->_latitude;
  v4 = -latitude;
  if (latitude >= 0.0)
    v4 = self->_latitude;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  longitude = self->_longitude;
  v13 = -longitude;
  if (longitude >= 0.0)
    v13 = self->_longitude;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = fmod(v14, 1.84467441e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  radius = self->_radius;
  v22 = -radius;
  if (radius >= 0.0)
    v22 = self->_radius;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = fmod(v23, 1.84467441e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabs(v24);
  if (v24 >= 0.0)
    v28 = v27;
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_latitude = *((double *)a3 + 1);
  self->_longitude = *((double *)a3 + 2);
  self->_radius = *((double *)a3 + 3);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end
