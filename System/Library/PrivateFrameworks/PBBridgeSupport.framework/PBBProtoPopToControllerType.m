@implementation PBBProtoPopToControllerType

- (void)setIntendedFireDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_intendedFireDate = a3;
}

- (void)setHasIntendedFireDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIntendedFireDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoPopToControllerType;
  -[PBBProtoPopToControllerType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoPopToControllerType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_controllerType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("controllerType"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_intendedFireDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("intendedFireDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoPopToControllerTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_controllerType;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_intendedFireDate;
    *((_BYTE *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_controllerType;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_intendedFireDate;
    *((_BYTE *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_controllerType != *((_DWORD *)v4 + 4))
  {
    goto LABEL_7;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_intendedFireDate == *((double *)v4 + 1))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  unsigned int controllerType;
  unint64_t v3;
  double intendedFireDate;
  double v5;
  long double v6;
  double v7;

  controllerType = self->_controllerType;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    intendedFireDate = self->_intendedFireDate;
    v5 = -intendedFireDate;
    if (intendedFireDate >= 0.0)
      v5 = self->_intendedFireDate;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3 ^ (2654435761 * controllerType);
}

- (void)mergeFrom:(id)a3
{
  self->_controllerType = *((_DWORD *)a3 + 4);
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_intendedFireDate = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)controllerType
{
  return self->_controllerType;
}

- (void)setControllerType:(unsigned int)a3
{
  self->_controllerType = a3;
}

- (double)intendedFireDate
{
  return self->_intendedFireDate;
}

@end
