@implementation PKPassTileStateMetadata

+ (id)_createForType:(int64_t)a3 dictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  if (v5)
  {
    v6 = +[PKPassTileStateMetadata _createWithType:](PKPassTileStateMetadata, "_createWithType:", a3);
    v7 = v6;
    if (v6 && objc_msgSend(v6, "_setUpWithDictionary:", v5))
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_createWithType:(int64_t)a3
{
  void *v4;
  PKPassTileStateMetadataVehicleFunction *v5;
  PKPassTileStateMetadataVehicleFunction *v6;
  _QWORD *v7;
  objc_super v9;

  if ((unint64_t)(a3 - 2) >= 2 && a3 != 0)
  {
    if (a3 == 1)
    {
      v5 = [PKPassTileStateMetadataVehicleFunction alloc];
      v6 = v5;
      if (v5)
      {
        v9.receiver = v5;
        v9.super_class = (Class)PKPassTileStateMetadata;
        v7 = objc_msgSendSuper2(&v9, sel_init);
        v4 = v7;
        if (v7)
          v7[1] = 1;
        goto LABEL_13;
      }
    }
    else
    {
      v6 = 0;
    }
    v4 = 0;
LABEL_13:

    return v4;
  }
  return 0;
}

- (PKPassTileStateMetadata)init
{

  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;
  PKPassTileStateMetadata *v8;
  PKPassTileStateMetadata *v9;
  void *v10;
  int64_t v12;
  objc_super v13;

  v4 = a3;
  v12 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKPassTileTypeFromString(v5, &v12);

  if ((v6 & 1) != 0)
  {
    if (self)
    {
      v7 = v12;
      v13.receiver = self;
      v13.super_class = (Class)PKPassTileStateMetadata;
      v8 = -[PKPassTileStateMetadata init](&v13, sel_init);
      if (v8)
        v8->_type = v7;
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
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassTileStateMetadataDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v10);

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  __CFString *v5;

  type = self->_type;
  if (type > 3)
    v5 = 0;
  else
    v5 = off_1E2AD2BF8[type];
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("type"));
}

- (BOOL)isEqualToUnresolvedMetadata:(id)a3
{
  return *((_QWORD *)a3 + 1) == self->_type;
}

- (PKPassTileStateMetadataVehicleFunction)metadataTypeVehicleFunction
{
  if (self->_type != 1)
    self = 0;
  return (PKPassTileStateMetadataVehicleFunction *)self;
}

- (int64_t)type
{
  return self->_type;
}

@end
