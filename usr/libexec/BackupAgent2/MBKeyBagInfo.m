@implementation MBKeyBagInfo

+ (id)infoWithID:(unsigned int)a3 uuid:(const char *)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithID:uuid:", *(_QWORD *)&a3, a4);
}

- (MBKeyBagInfo)initWithID:(unsigned int)a3 uuid:(const char *)a4
{
  MBKeyBagInfo *v6;
  MBKeyBagInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MBKeyBagInfo;
  v6 = -[MBKeyBagInfo init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_bagID = a3;
    -[MBKeyBagInfo setUUID:](v6, "setUUID:", a4);
  }
  return v7;
}

- (const)uuid
{
  return (const char *)self->_uuid;
}

- (void)setUUID:(const char *)a3
{
  unsigned __int8 *uuid;

  uuid = self->_uuid;
  if (a3)
  {
    *(_OWORD *)uuid = *(_OWORD *)a3;
  }
  else
  {
    *(_QWORD *)uuid = 0;
    *(_QWORD *)&self->_uuid[8] = 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(MBKeyBagInfo);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
    return 0;
  return *(_QWORD *)self->_uuid == *((_QWORD *)a3 + 1) && *(_QWORD *)&self->_uuid[8] == *((_QWORD *)a3 + 2);
}

- (unint64_t)hash
{
  return *(_QWORD *)&self->_uuid[8] ^ *(_QWORD *)self->_uuid;
}

- (unsigned)bagID
{
  return self->_bagID;
}

- (void)setBagID:(unsigned int)a3
{
  self->_bagID = a3;
}

@end
