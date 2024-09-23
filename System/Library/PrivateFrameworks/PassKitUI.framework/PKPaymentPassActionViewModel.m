@implementation PKPaymentPassActionViewModel

- (PKPaymentPassActionViewModel)initWithAction:(id)a3
{
  id v5;
  PKPaymentPassActionViewModel *v6;
  PKPaymentPassActionViewModel *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassActionViewModel;
  v6 = -[PKPaymentPassActionViewModel init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v7->_isInPreflight = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[PKPaymentPassAction copyWithZone:](self->_action, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_BYTE *)(v5 + 8) = self->_isInPreflight;
  return (id)v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentPassActionViewModel *v4;
  PKPaymentPassActionViewModel *v5;
  PKPaymentPassActionViewModel *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;

  v4 = (PKPaymentPassActionViewModel *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

LABEL_14:
            v12 = 0;
            goto LABEL_15;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_14;
        }
        v12 = v6->_isInPreflight == self->_isInPreflight;
LABEL_15:

        goto LABEL_16;
      }
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (BOOL)isInPreflight
{
  return self->_isInPreflight;
}

- (void)setIsInPreflight:(BOOL)a3
{
  self->_isInPreflight = a3;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
