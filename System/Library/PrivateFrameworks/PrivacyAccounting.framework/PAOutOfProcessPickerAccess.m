@implementation PAOutOfProcessPickerAccess

+ (id)eventStreamIdentifier
{
  return CFSTR("com.apple.privacy.accounting.stream.oop");
}

+ (id)accessWithAuditToken:(id *)a3 forType:(int64_t)a4
{
  id v6;
  __int128 v7;
  _OWORD v9[2];

  v6 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v7;
  return (id)objc_msgSend(v6, "initWithAuditToken:forType:", v9, a4);
}

+ (id)accessWithAccessor:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessor:forType:", v6, a4);

  return v7;
}

- (PAOutOfProcessPickerAccess)initWithAuditToken:(id *)a3 forType:(int64_t)a4
{
  __int128 v6;
  void *v7;
  PAOutOfProcessPickerAccess *v8;
  _OWORD v10[2];

  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  +[PAApplication applicationWithAuditToken:](PAApplication, "applicationWithAuditToken:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PAOutOfProcessPickerAccess initWithAccessor:forType:](self, "initWithAccessor:forType:", v7, a4);

  return v8;
}

- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 forType:(int64_t)a4
{
  PAOutOfProcessPickerAccess *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAOutOfProcessPickerAccess;
  result = -[PAAccess initWithAccessor:](&v6, sel_initWithAccessor_, a3);
  if (result)
    result->_pickerType = a4;
  return result;
}

- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forType:(int64_t)a6
{
  PAOutOfProcessPickerAccess *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAOutOfProcessPickerAccess;
  result = -[PAAccess initWithAccessor:identifier:kind:](&v8, sel_initWithAccessor_identifier_kind_, a3, a4, a5);
  if (result)
    result->_pickerType = a6;
  return result;
}

- (id)JSONObject
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  -[PAAccess JSONObject](&v5, sel_JSONObject);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("outOfProcess"));
  return v3;
}

- (id)category
{
  int64_t pickerType;

  pickerType = self->_pickerType;
  if (pickerType == 1)
    return CFSTR("outOfProcessPhotos");
  if (pickerType == 2)
    return CFSTR("outOfProcessContacts");
  return CFSTR("unknown");
}

- (id)descriptionForCategory
{
  int64_t pickerType;
  const __CFString *v3;

  pickerType = self->_pickerType;
  v3 = CFSTR("unknown");
  if (pickerType == 2)
    v3 = CFSTR("contacts");
  if (pickerType == 1)
    return CFSTR("photos");
  else
    return (id)v3;
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAOutOfProcessPickerAccess;
  v4 = -[PAAccess hashWithOptions:](&v6, sel_hashWithOptions_, a3);
  return self->_pickerType - v4 + 32 * v4;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  int64_t pickerType;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAOutOfProcessPickerAccess;
  if (-[PAAccess isEqualToAccess:withOptions:](&v10, sel_isEqualToAccess_withOptions_, v6, a4))
  {
    pickerType = self->_pickerType;
    v8 = pickerType == objc_msgSend(v6, "pickerType");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PAOutOfProcessPickerAccess;
  -[PAAccess description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAOutOfProcessPickerAccess descriptionForCategory](self, "descriptionForCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ pickerType:<%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAOutOfProcessPickerAccess)initWithCoder:(id)a3
{
  id v4;
  PAOutOfProcessPickerAccess *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PAOutOfProcessPickerAccess;
  v5 = -[PAAccess initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_pickerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pickerType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  v4 = a3;
  -[PAAccess encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pickerType, CFSTR("pickerType"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  result = -[PAAccess copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 9) = self->_pickerType;
  return result;
}

- (PAOutOfProcessPickerAccess)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  int64_t v8;
  PAOutOfProcessPickerAccess *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "access");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)PAOutOfProcessPickerAccess;
    self = -[PAAccess initWithProto:](&v11, sel_initWithProto_, v6);

    if (self)
    {
      v7 = objc_msgSend(v5, "pickerType");
      if (v7 == 1)
      {
        v8 = 1;
        goto LABEL_9;
      }
      if (v7 == 2)
      {
        v8 = 2;
LABEL_9:
        self->_pickerType = v8;
        v9 = self;
        goto LABEL_10;
      }
    }
    v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (PAOutOfProcessPickerAccess)initWithProtoData:(id)a3
{
  id v4;
  PAPBOutOfProcessPickerAccess *v5;
  PAOutOfProcessPickerAccess *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBOutOfProcessPickerAccess initWithData:]([PAPBOutOfProcessPickerAccess alloc], "initWithData:", v4);

    v6 = -[PAOutOfProcessPickerAccess initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  int64_t pickerType;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)PAOutOfProcessPickerAccess;
  -[PAAccess proto](&v9, sel_proto);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setAccess:", v4);
    pickerType = self->_pickerType;
    if (pickerType == 1)
    {
      v6 = 1;
      goto LABEL_7;
    }
    if (pickerType == 2)
    {
      v6 = 2;
LABEL_7:
      objc_msgSend(v3, "setPickerType:", v6);
      v7 = v3;
      goto LABEL_8;
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

@end
