@implementation AWDCoreRoutineMagicalMomentsFeatureAddon

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsFeatureAddon setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsFeatureAddon;
  -[AWDCoreRoutineMagicalMomentsFeatureAddon dealloc](&v3, sel_dealloc);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsFeatureAddon;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsFeatureAddon description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsFeatureAddon dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_value), CFSTR("value"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsFeatureAddonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_name)
    objc_msgSend(a3, "setName:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_value;
    *((_BYTE *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_value;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *name;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((_QWORD *)a3 + 1)) || (v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) != 0 && self->_value == *((_DWORD *)a3 + 4);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_value;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[AWDCoreRoutineMagicalMomentsFeatureAddon setName:](self, "setName:");
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_value = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int)value
{
  return self->_value;
}

@end
