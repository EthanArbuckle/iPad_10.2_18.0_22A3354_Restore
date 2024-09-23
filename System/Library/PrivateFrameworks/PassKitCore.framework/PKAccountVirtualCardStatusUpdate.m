@implementation PKAccountVirtualCardStatusUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountVirtualCardStatusUpdate)initWithCoder:(id)a3
{
  id v4;
  PKAccountVirtualCardStatusUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *updatedVirtualCards;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountVirtualCardStatusUpdate;
  v5 = -[PKAccountVirtualCardStatusUpdate init](&v12, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("updatedVirtualCards"));
    v9 = objc_claimAutoreleasedReturnValue();
    updatedVirtualCards = v5->_updatedVirtualCards;
    v5->_updatedVirtualCards = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedVirtualCards, CFSTR("updatedVirtualCards"));

}

- (PKAccountVirtualCardStatusUpdate)initWithRecord:(id)a3
{
  id v4;
  PKAccountVirtualCardStatusUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *updatedVirtualCards;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountVirtualCardStatusUpdate;
  v5 = -[PKAccountVirtualCardStatusUpdate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = PKAccountVirtualCardStatusUpdateReasonFromString(v6);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v7, CFSTR("updatedVirtualCards"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_arrayByApplyingBlock:", &__block_literal_global_197);
    v9 = objc_claimAutoreleasedReturnValue();
    updatedVirtualCards = v5->_updatedVirtualCards;
    v5->_updatedVirtualCards = (NSArray *)v9;

  }
  return v5;
}

PKVirtualCard *__51__PKAccountVirtualCardStatusUpdate_initWithRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKVirtualCard *v3;

  v2 = a2;
  v3 = -[PKVirtualCard initWithDictionary:]([PKVirtualCard alloc], "initWithDictionary:", v2);

  return v3;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_reason - 1;
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD9870[v5];
  v10 = v4;
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("reason"));
  -[NSArray pk_arrayByApplyingBlock:](self->_updatedVirtualCards, "pk_arrayByApplyingBlock:", &__block_literal_global_28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("updatedVirtualCards"));

}

uint64_t __53__PKAccountVirtualCardStatusUpdate_encodeWithRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (id)recordType
{
  return CFSTR("VirtualCardStatusUpdate");
}

+ (id)recordNamePrefix
{
  return CFSTR("virtualCardStatusUpdate");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *updatedVirtualCards;
  NSArray *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_reason == v4[1])
  {
    updatedVirtualCards = self->_updatedVirtualCards;
    v6 = (NSArray *)v4[2];
    if (updatedVirtualCards && v6)
      v7 = -[NSArray isEqual:](updatedVirtualCards, "isEqual:");
    else
      v7 = updatedVirtualCards == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_updatedVirtualCards);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_reason - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_reason - 1;
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD9870[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), v6);
  -[NSArray description](self->_updatedVirtualCards, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("updatedVirtualCards: '%@'; "), v7);

  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSArray)updatedVirtualCards
{
  return self->_updatedVirtualCards;
}

- (void)setUpdatedVirtualCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedVirtualCards, 0);
}

@end
