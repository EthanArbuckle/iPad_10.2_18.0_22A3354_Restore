@implementation TIProactiveTrigger

- (TIProactiveTrigger)initWithSourceType:(unsigned __int8)a3 attributes:(id)a4
{
  id v6;
  TIProactiveTrigger *v7;
  TIProactiveTrigger *v8;
  uint64_t v9;
  NSDictionary *attributes;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIProactiveTrigger;
  v7 = -[TIProactiveTrigger init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_triggerSourceType = a3;
    v9 = objc_msgSend(v6, "copy");
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 8) = self->_triggerSourceType;
    v7 = -[NSDictionary copyWithZone:](self->_attributes, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_attributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  TIProactiveTrigger *v4;
  TIProactiveTrigger *v5;
  NSDictionary **v6;
  NSDictionary *attributes;
  char v8;

  v4 = (TIProactiveTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self->_triggerSourceType == *((unsigned __int8 *)v6 + 8))
    {
      attributes = self->_attributes;
      if (attributes == v6[2])
        v8 = 1;
      else
        v8 = -[NSDictionary isEqual:](attributes, "isEqual:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)triggerSourceType
{
  return self->_triggerSourceType;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
