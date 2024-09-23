@implementation PKPassTileAccessory

+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  if ((unint64_t)a3 >= 3)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v6 = objc_alloc(*off_1E2AC38F0[a3]);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = v6;
  v11.super_class = (Class)PKPassTileAccessory;
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
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKPassTileAccessoryTypeFromString(v6, &v12);

    v8 = 0;
    if (v7)
    {
      v9 = (void *)objc_msgSend(a1, "_createForType:resolved:", v12, 0);
      v10 = v9;
      if (v9 && objc_msgSend(v9, "_setUpWithDictionary:", v5))
        v8 = v10;
      else
        v8 = 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassTileAccessory)init
{

  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  if (self->_resolved)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileAccessory attempting double resolution."));
  return +[PKPassTileAccessory _createForType:resolved:](PKPassTileAccessory, "_createForType:resolved:", self->_type, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  PKPassTileAccessory *v8;
  PKPassTileAccessory *v9;
  void *v10;
  unint64_t v12;
  objc_super v13;

  v4 = a3;
  v12 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKPassTileAccessoryTypeFromString(v5, &v12);

  if ((v6 & 1) != 0 && v12 <= 2 && objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v7 = v12;
      v13.receiver = self;
      v13.super_class = (Class)PKPassTileAccessory;
      v8 = -[PKPassTileAccessory init](&v13, sel_init);
      if (v8)
      {
        v8->_type = v7;
        v8->_resolved = 1;
      }
    }
    else
    {
      v8 = 0;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassTileAccessoryDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v10);

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t type;
  __CFString *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_resolved)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileAccessory %@ attempting unresolved XPC transfer."), objc_opt_class());
    v4 = v7;
  }
  type = self->_type;
  if (type > 2)
    v6 = 0;
  else
    v6 = off_1E2AC3908[type];
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
    v6 = -[PKPassTileAccessory _isEqual:](self, "_isEqual:", v4);

  return v6;
}

- (BOOL)_isEqual:(id)a3
{
  return *((unsigned __int8 *)a3 + 8) == self->_resolved && *((_QWORD *)a3 + 2) == self->_type;
}

- (BOOL)isEqualToUnresolvedAccessory:(id)a3
{
  return !self->_resolved && -[PKPassTileAccessory _isEqual:](self, "_isEqual:", a3);
}

- (PKPassTileAccessoryButton)accessoryTypeButton
{
  if (self->_type)
    self = 0;
  return (PKPassTileAccessoryButton *)self;
}

- (PKPassTileAccessorySpinner)accessoryTypeSpinner
{
  if (self->_type != 1)
    self = 0;
  return (PKPassTileAccessorySpinner *)self;
}

- (PKPassTileAccessoryImage)accessoryTypeImage
{
  if (self->_type != 2)
    self = 0;
  return (PKPassTileAccessoryImage *)self;
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
