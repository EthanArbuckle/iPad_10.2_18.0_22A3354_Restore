@implementation ALCMCoarseElevation

- (int)source
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3)
    return CFSTR("kElevationSourcePhone");
  if (a3 == 1)
    return CFSTR("kElevationSourceWatch");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kElevationSourcePhone")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("kElevationSourceWatch"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMCoarseElevation;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMCoarseElevation description](&v3, "description"), -[ALCMCoarseElevation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int source;
  const __CFString *v5;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended), CFSTR("elevationAscended"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    source = self->_source;
    if (source)
    {
      if (source == 1)
        v5 = CFSTR("kElevationSourceWatch");
      else
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
    }
    else
    {
      v5 = CFSTR("kElevationSourcePhone");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("source"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100954028((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field(a3, self->_elevationAscended, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(a3, self->_source, 2);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_source;
    *((_BYTE *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_source;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
      goto LABEL_7;
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) != 0 && self->_source == *((_DWORD *)a3 + 3))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_source;
  else
    v2 = 0;
  return v2 ^ (2654435761 * self->_elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_source = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
  }
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
