@implementation PKAccountPhysicalCardStatusUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPhysicalCardStatusUpdate)initWithCoder:(id)a3
{
  id v4;
  PKAccountPhysicalCardStatusUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *updatedPhysicalCards;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPhysicalCardStatusUpdate;
  v5 = -[PKAccountPhysicalCardStatusUpdate init](&v12, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("physicalCards"));
    v9 = objc_claimAutoreleasedReturnValue();
    updatedPhysicalCards = v5->_updatedPhysicalCards;
    v5->_updatedPhysicalCards = (NSArray *)v9;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedPhysicalCards, CFSTR("physicalCards"));

}

- (PKAccountPhysicalCardStatusUpdate)initWithRecord:(id)a3
{
  id v4;
  PKAccountPhysicalCardStatusUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *updatedPhysicalCards;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPhysicalCardStatusUpdate;
  v5 = -[PKAccountPhysicalCardStatusUpdate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = PKAccountPhysicalCardStatusUpdateReasonFromString(v6);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v7, CFSTR("physicalCards"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_arrayByApplyingBlock:", &__block_literal_global_217);
    v9 = objc_claimAutoreleasedReturnValue();
    updatedPhysicalCards = v5->_updatedPhysicalCards;
    v5->_updatedPhysicalCards = (NSArray *)v9;

  }
  return v5;
}

PKPhysicalCard *__52__PKAccountPhysicalCardStatusUpdate_initWithRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCard *v3;

  v2 = a2;
  v3 = -[PKPhysicalCard initWithDictionary:]([PKPhysicalCard alloc], "initWithDictionary:", v2);

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
  if (v5 > 9)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ADBFC8[v5];
  v10 = v4;
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("reason"));
  -[NSArray pk_arrayByApplyingBlock:](self->_updatedPhysicalCards, "pk_arrayByApplyingBlock:", &__block_literal_global_46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("physicalCards"));

}

uint64_t __54__PKAccountPhysicalCardStatusUpdate_encodeWithRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDictionaryRepresentation");
}

+ (id)recordType
{
  return CFSTR("PhysicalCardStatusUpdate");
}

+ (id)recordNamePrefix
{
  return CFSTR("physicalCardStatusUpdate");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *updatedPhysicalCards;
  NSArray *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_reason == v4[1])
  {
    updatedPhysicalCards = self->_updatedPhysicalCards;
    v6 = (NSArray *)v4[2];
    if (updatedPhysicalCards && v6)
      v7 = -[NSArray isEqual:](updatedPhysicalCards, "isEqual:");
    else
      v7 = updatedPhysicalCards == v6;
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
  objc_msgSend(v3, "safelyAddObject:", self->_updatedPhysicalCards);
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
  if (v5 > 9)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ADBFC8[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), v6);
  -[NSArray description](self->_updatedPhysicalCards, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("udpatedPhysicalCards: '%@'; "), v7);

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

- (NSArray)updatedPhysicalCards
{
  return self->_updatedPhysicalCards;
}

- (void)setUpdatedPhysicalCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedPhysicalCards, 0);
}

@end
