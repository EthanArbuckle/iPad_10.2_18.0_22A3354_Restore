@implementation RAPUserPathEntry

- (void)setRouteIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRouteIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStepIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_stepIndex = a3;
}

- (void)setHasStepIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStepIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)traversal
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_traversal;
  else
    return 0;
}

- (void)setTraversal:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_traversal = a3;
}

- (void)setHasTraversal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTraversal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)traversalAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1011E0A20 + a3);
}

- (int)StringAsTraversal:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STORED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MISSED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRerouteLocation
{
  return self->_rerouteLocation != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPUserPathEntry;
  v3 = -[RAPUserPathEntry description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserPathEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t traversal;
  void *v8;
  GEOLatLng *rerouteLocation;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_stepIndex));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("stepIndex"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
LABEL_7:
    traversal = self->_traversal;
    if (traversal >= 3)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_traversal));
    else
      v8 = *(&off_1011E0A20 + traversal);
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("traversal"));

    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_routeIndex));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("routeIndex"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_11:
  rerouteLocation = self->_rerouteLocation;
  if (rerouteLocation)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOLatLng dictionaryRepresentation](rerouteLocation, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rerouteLocation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A545B4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  GEOLatLng *rerouteLocation;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_routeIndex, 1);
    v4 = v7;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_stepIndex, 2);
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field(v7, self->_traversal, 3);
    v4 = v7;
  }
LABEL_5:
  rerouteLocation = self->_rerouteLocation;
  if (rerouteLocation)
  {
    PBDataWriterWriteSubmessage(v7, rerouteLocation, 4);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_routeIndex;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_stepIndex;
  *((_BYTE *)v4 + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[6] = self->_traversal;
    *((_BYTE *)v4 + 28) |= 4u;
  }
LABEL_5:
  if (self->_rerouteLocation)
  {
    v6 = v4;
    objc_msgSend(v4, "setRerouteLocation:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 5) = self->_stepIndex;
    *((_BYTE *)v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 4) = self->_routeIndex;
  *((_BYTE *)v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_traversal;
    *((_BYTE *)v5 + 28) |= 4u;
  }
LABEL_5:
  v8 = -[GEOLatLng copyWithZone:](self->_rerouteLocation, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *rerouteLocation;
  unsigned __int8 v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_routeIndex != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_stepIndex != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_traversal != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  rerouteLocation = self->_rerouteLocation;
  if ((unint64_t)rerouteLocation | *((_QWORD *)v4 + 1))
    v6 = -[GEOLatLng isEqual:](rerouteLocation, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ (unint64_t)-[GEOLatLng hash](self->_rerouteLocation, "hash");
  }
  v2 = 2654435761 * self->_routeIndex;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_stepIndex;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_traversal;
  return v3 ^ v2 ^ v4 ^ (unint64_t)-[GEOLatLng hash](self->_rerouteLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  GEOLatLng *rerouteLocation;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 28);
  if ((v6 & 1) != 0)
  {
    self->_routeIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 28);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_stepIndex = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_traversal = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  rerouteLocation = self->_rerouteLocation;
  v8 = v5[1];
  if (rerouteLocation)
  {
    if (v8)
    {
      v9 = v5;
      -[GEOLatLng mergeFrom:](rerouteLocation, "mergeFrom:");
LABEL_13:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[RAPUserPathEntry setRerouteLocation:](self, "setRerouteLocation:");
    goto LABEL_13;
  }

}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (unsigned)stepIndex
{
  return self->_stepIndex;
}

- (GEOLatLng)rerouteLocation
{
  return self->_rerouteLocation;
}

- (void)setRerouteLocation:(id)a3
{
  objc_storeStrong((id *)&self->_rerouteLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerouteLocation, 0);
}

@end
