@implementation PKPassTileValue

+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  if ((unint64_t)a3 >= 4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v6 = objc_alloc(*off_1E2ADAA28[a3]);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = v6;
  v11.super_class = (Class)PKPassTileValue;
  v8 = objc_msgSendSuper2(&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    *((_QWORD *)v8 + 2) = a3;
    *((_BYTE *)v8 + 8) = a4;
  }
LABEL_7:

  return v9;
}

+ (id)_createForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKPassTileValueTypeFromString(v6);

    v8 = (void *)objc_msgSend(a1, "_createForType:resolved:", v7, 0);
    v9 = v8;
    if (v8 && objc_msgSend(v8, "_setUpWithDictionary:", v5))
      v10 = v9;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PKPassTileValue)init
{

  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  if (self->_resolved)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileValue attempting double resolution."));
  return +[PKPassTileValue _createForType:resolved:](PKPassTileValue, "_createForType:resolved:", self->_type, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKPassTileValue *v7;
  PKPassTileValue *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKPassTileValueTypeFromString(v5);

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKPassTileValue;
      v7 = -[PKPassTileValue init](&v11, sel_init);
      if (v7)
      {
        v7->_type = v6;
        v7->_resolved = 1;
      }
    }
    else
    {
      v7 = 0;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassTileValueDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v9);

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_resolved)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileValue %@ attempting unresolved XPC transfer."), objc_opt_class());
    v4 = v7;
  }
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("text");
  else
    v6 = off_1E2ADAA48[v5];
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (unint64_t)hash
{
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = -[PKPassTileValue _isEqual:](self, "_isEqual:", v4);

  return v6;
}

- (BOOL)_isEqual:(id)a3
{
  return *((unsigned __int8 *)a3 + 8) == self->_resolved && *((_QWORD *)a3 + 2) == self->_type;
}

- (BOOL)isEqualToUnresolvedValue:(id)a3
{
  return !self->_resolved && -[PKPassTileValue _isEqual:](self, "_isEqual:", a3);
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (PKPassTileValueText)valueTypeText
{
  if (self->_type)
    self = 0;
  return (PKPassTileValueText *)self;
}

- (PKPassTileValueDate)valueTypeDate
{
  if (self->_type != 1)
    self = 0;
  return (PKPassTileValueDate *)self;
}

- (PKPassTileValueNumber)valueTypeNumber
{
  if (self->_type != 2)
    self = 0;
  return (PKPassTileValueNumber *)self;
}

- (PKPassTileValueForeignReference)valueTypeForeignReference
{
  if (self->_type != 3)
    self = 0;
  return (PKPassTileValueForeignReference *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

@end
