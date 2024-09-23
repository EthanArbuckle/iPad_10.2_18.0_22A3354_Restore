@implementation DirectionsPlanTransitPreferences

- (DirectionsPlanTransitPreferences)initWithGEOTransitOptions:(id)a3
{
  id v4;
  DirectionsPlanTransitPreferences *v5;
  unint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DirectionsPlanTransitPreferences;
  v5 = -[DirectionsPlanTransitPreferences init](&v8, "init");
  if (v5 && objc_msgSend(v4, "avoidedModesCount"))
  {
    v6 = 0;
    do
    {
      switch(*((_DWORD *)objc_msgSend(v4, "avoidedModes") + v6))
      {
        case 1:
        case 3:
          -[DirectionsPlanTransitPreferences setAvoidMetroLightRailRoutes:](v5, "setAvoidMetroLightRailRoutes:", 1);
          break;
        case 2:
          -[DirectionsPlanTransitPreferences setAvoidRailRoutes:](v5, "setAvoidRailRoutes:", 1);
          break;
        case 4:
          -[DirectionsPlanTransitPreferences setAvoidBusRoutes:](v5, "setAvoidBusRoutes:", 1);
          break;
        case 5:
          -[DirectionsPlanTransitPreferences setAvoidFerryRoutes:](v5, "setAvoidFerryRoutes:", 1);
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v6 < (unint64_t)objc_msgSend(v4, "avoidedModesCount"));
  }

  return v5;
}

- (unint64_t)avoidedTransitModes
{
  unint64_t v3;

  v3 = -[DirectionsPlanTransitPreferences avoidBusRoutes](self, "avoidBusRoutes");
  if (-[DirectionsPlanTransitPreferences avoidMetroLightRailRoutes](self, "avoidMetroLightRailRoutes"))
    v3 |= 2uLL;
  if (-[DirectionsPlanTransitPreferences avoidRailRoutes](self, "avoidRailRoutes"))
    v3 |= 4uLL;
  if (-[DirectionsPlanTransitPreferences avoidFerryRoutes](self, "avoidFerryRoutes"))
    return v3 | 8;
  else
    return v3;
}

- (void)setAvoidBusRoutes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_avoidBusRoutes = a3;
}

- (void)setHasAvoidBusRoutes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvoidBusRoutes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAvoidMetroLightRailRoutes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_avoidMetroLightRailRoutes = a3;
}

- (void)setHasAvoidMetroLightRailRoutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAvoidMetroLightRailRoutes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAvoidRailRoutes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_avoidRailRoutes = a3;
}

- (void)setHasAvoidRailRoutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAvoidRailRoutes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAvoidFerryRoutes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_avoidFerryRoutes = a3;
}

- (void)setHasAvoidFerryRoutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvoidFerryRoutes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DirectionsPlanTransitPreferences;
  v3 = -[DirectionsPlanTransitPreferences description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlanTransitPreferences dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidBusRoutes));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("avoidBusRoutes"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidRailRoutes));
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("avoidRailRoutes"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidMetroLightRailRoutes));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("avoidMetroLightRailRoutes"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidFerryRoutes));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("avoidFerryRoutes"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1008E0894((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_avoidBusRoutes, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField(v5, self->_avoidRailRoutes, 3);
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField(v5, self->_avoidMetroLightRailRoutes, 2);
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField(v5, self->_avoidFerryRoutes, 4);
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_avoidBusRoutes;
    v4[12] |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      v4[11] = self->_avoidRailRoutes;
      v4[12] |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_avoidMetroLightRailRoutes;
  v4[12] |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    v4[9] = self->_avoidFerryRoutes;
    v4[12] |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_avoidBusRoutes;
    *((_BYTE *)result + 12) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 10) = self->_avoidMetroLightRailRoutes;
  *((_BYTE *)result + 12) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_BYTE *)result + 11) = self->_avoidRailRoutes;
  *((_BYTE *)result + 12) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_5:
  *((_BYTE *)result + 9) = self->_avoidFerryRoutes;
  *((_BYTE *)result + 12) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_28;
    if (self->_avoidBusRoutes)
    {
      if (!v4[8])
        goto LABEL_28;
    }
    else if (v4[8])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0)
      goto LABEL_28;
    if (self->_avoidMetroLightRailRoutes)
    {
      if (!v4[10])
        goto LABEL_28;
    }
    else if (v4[10])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[12] & 8) == 0)
      goto LABEL_28;
    if (self->_avoidRailRoutes)
    {
      if (!v4[11])
        goto LABEL_28;
    }
    else if (v4[11])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 8) != 0)
  {
    goto LABEL_28;
  }
  v5 = (v4[12] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_avoidFerryRoutes)
      {
        if (!v4[9])
          goto LABEL_28;
      }
      else if (v4[9])
      {
        goto LABEL_28;
      }
      v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_avoidBusRoutes;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_avoidMetroLightRailRoutes;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_avoidRailRoutes;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_avoidFerryRoutes;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[12];
  if (v5)
  {
    self->_avoidBusRoutes = v4[8];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[12];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_avoidRailRoutes = v4[11];
      *(_BYTE *)&self->_has |= 8u;
      if ((v4[12] & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v4[12] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidMetroLightRailRoutes = v4[10];
  *(_BYTE *)&self->_has |= 4u;
  v5 = v4[12];
  if ((v5 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    self->_avoidFerryRoutes = v4[9];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:

}

- (BOOL)avoidBusRoutes
{
  return self->_avoidBusRoutes;
}

- (BOOL)avoidMetroLightRailRoutes
{
  return self->_avoidMetroLightRailRoutes;
}

- (BOOL)avoidRailRoutes
{
  return self->_avoidRailRoutes;
}

- (BOOL)avoidFerryRoutes
{
  return self->_avoidFerryRoutes;
}

@end
