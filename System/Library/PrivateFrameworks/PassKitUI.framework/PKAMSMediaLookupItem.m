@implementation PKAMSMediaLookupItem

- (PKAMSMediaLookupItem)init
{

  return 0;
}

- (id)_initWithType:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAMSMediaLookupItem;
  result = -[PKAMSMediaLookupItem init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (PKAMSMediaLookupItemMusic)musicItem
{
  PKAMSMediaLookupItem *v3;

  if (self->_type <= 2)
    v3 = self;
  return (PKAMSMediaLookupItemMusic *)self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (PKAMSMediaLookupItem)initWithCoder:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type"));
  self->_type = v4;
  return (PKAMSMediaLookupItem *)-[PKAMSMediaLookupItem _initWithType:](self, "_initWithType:", v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PKAMSMediaLookupItem _initWithType:](+[PKAMSMediaLookupItem allocWithZone:](PKAMSMediaLookupItem, "allocWithZone:", a3), "_initWithType:", self->_type);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKAMSMediaLookupItem *v4;
  PKAMSMediaLookupItem *v5;
  BOOL v6;

  v4 = (PKAMSMediaLookupItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAMSMediaLookupItem isEqualToItem:](self, "isEqualToItem:", v5);

  return v6;
}

- (BOOL)isEqualToItem:(id)a3
{
  return self->_type == *((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash();
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end
