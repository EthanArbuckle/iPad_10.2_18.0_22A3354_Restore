@implementation TRANSITPbMacModePair

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbMacModePair setMac:](self, "setMac:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbMacModePair;
  -[TRANSITPbMacModePair dealloc](&v3, "dealloc");
}

- (BOOL)hasMac
{
  return self->_mac != 0;
}

- (void)setMode:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbMacModePair;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbMacModePair description](&v3, "description"), -[TRANSITPbMacModePair dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *mac;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  mac = self->_mac;
  if (mac)
    objc_msgSend(v3, "setObject:forKey:", mac, CFSTR("mac"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mode), CFSTR("mode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1012AA80C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *mac;

  mac = self->_mac;
  if (mac)
    PBDataWriterWriteStringField(a3, mac, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(a3, 2, self->_mode);
}

- (void)copyTo:(id)a3
{
  if (self->_mac)
    objc_msgSend(a3, "setMac:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_mode;
    *((_BYTE *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[2] = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(id *)&self->_mode;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *mac;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    mac = self->_mac;
    if (!((unint64_t)mac | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](mac, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_mode == *((double *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double mode;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_mac, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    mode = self->_mode;
    v6 = -mode;
    if (mode >= 0.0)
      v6 = self->_mode;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[TRANSITPbMacModePair setMac:](self, "setMac:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_mode = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)mode
{
  return self->_mode;
}

@end
