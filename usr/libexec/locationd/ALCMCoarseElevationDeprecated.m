@implementation ALCMCoarseElevationDeprecated

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMCoarseElevationDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMCoarseElevationDeprecated description](&v3, "description"), -[ALCMCoarseElevationDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended), CFSTR("elevationAscended"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100FF7858((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field(a3, self->_elevationAscended, 1);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
    LOBYTE(v5) = self->_elevationAscended == *((_DWORD *)a3 + 2);
  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_elevationAscended;
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_elevationAscended = a3;
}

@end
