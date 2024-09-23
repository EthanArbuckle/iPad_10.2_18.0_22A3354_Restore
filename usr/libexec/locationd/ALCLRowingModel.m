@implementation ALCLRowingModel

- (void)setStrokeAmp:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_strokeAmp = a3;
}

- (void)setHasStrokeAmp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStrokeAmp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStrokeFrequency:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_strokeFrequency = a3;
}

- (void)setHasStrokeFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStrokeFrequency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLRowingModel;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLRowingModel description](&v3, "description"), -[ALCLRowingModel dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  double v5;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  *(float *)&v4 = self->_strokePower;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("strokePower"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v5 = self->_strokeAmp;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("strokeAmp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v5 = self->_strokeFrequency;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("strokeFrequency"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1009A3604((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteFloatField(a3, 1, self->_strokePower);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField(a3, 2, self->_strokeAmp);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField(a3, 3, self->_strokeFrequency);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = LODWORD(self->_strokePower);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_DWORD *)a3 + 3) = LODWORD(self->_strokeFrequency);
    *((_BYTE *)a3 + 20) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = LODWORD(self->_strokeAmp);
  *((_BYTE *)a3 + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = LODWORD(self->_strokePower);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_strokeAmp);
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_strokeFrequency);
    *((_BYTE *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_strokePower != *((float *)a3 + 4))
    {
LABEL_12:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_strokeAmp != *((float *)a3 + 2))
        goto LABEL_12;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
      goto LABEL_12;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 2) == 0 || self->_strokeFrequency != *((float *)a3 + 3))
        goto LABEL_12;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  float strokePower;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char has;
  unint64_t v13;
  float strokeAmp;
  float v15;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float strokeFrequency;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  strokePower = self->_strokePower;
  v4 = -strokePower;
  if (strokePower >= 0.0)
    v4 = self->_strokePower;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    strokeAmp = self->_strokeAmp;
    v15 = -strokeAmp;
    if (strokeAmp >= 0.0)
      v15 = self->_strokeAmp;
    v16 = floorf(v15 + 0.5);
    v17 = (float)(v15 - v16) * 1.8447e19;
    v18 = fmodf(v16, 1.8447e19);
    v19 = 2654435761u * (unint64_t)v18;
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 = v19 + (unint64_t)v17;
      else
        v13 = 2654435761u * (unint64_t)v18;
      if ((has & 2) == 0)
        goto LABEL_26;
    }
    else
    {
      v13 = v19 - (unint64_t)fabsf(v17);
      if ((has & 2) == 0)
      {
LABEL_26:
        v27 = 0;
        return v13 ^ v11 ^ v27;
      }
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_26;
  }
  strokeFrequency = self->_strokeFrequency;
  v21 = -strokeFrequency;
  if (strokeFrequency >= 0.0)
    v21 = self->_strokeFrequency;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = fmodf(v22, 1.8447e19);
  v25 = 2654435761u * (unint64_t)v24;
  v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0)
    v26 = 2654435761u * (unint64_t)v24;
  v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 >= 0.0)
    v27 = v26;
  return v13 ^ v11 ^ v27;
}

- (void)mergeFrom:(id)a3
{
  self->_strokePower = *((float *)a3 + 4);
  if ((*((_BYTE *)a3 + 20) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) == 0)
      return;
LABEL_5:
    self->_strokeFrequency = *((float *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_strokeAmp = *((float *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 20) & 2) != 0)
    goto LABEL_5;
}

- (float)strokePower
{
  return self->_strokePower;
}

- (void)setStrokePower:(float)a3
{
  self->_strokePower = a3;
}

- (float)strokeAmp
{
  return self->_strokeAmp;
}

- (float)strokeFrequency
{
  return self->_strokeFrequency;
}

@end
