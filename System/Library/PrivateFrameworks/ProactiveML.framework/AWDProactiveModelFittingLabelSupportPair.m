@implementation AWDProactiveModelFittingLabelSupportPair

- (void)setLabel:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_label = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLabel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSupport:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_support = a3;
}

- (void)setHasSupport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupport
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingLabelSupportPair;
  -[AWDProactiveModelFittingLabelSupportPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingLabelSupportPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_label);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("label"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_support;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("support"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLabelSupportPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_label;
    *((_BYTE *)v4 + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_support);
    *((_BYTE *)v4 + 20) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_label;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_support);
    *((_BYTE *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_label != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_support != *((float *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  float support;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_label;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    return v7 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  support = self->_support;
  v4 = support;
  if (support < 0.0)
    v4 = -support;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0)
  {
    self->_label = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_support = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)label
{
  return self->_label;
}

- (float)support
{
  return self->_support;
}

@end
