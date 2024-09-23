@implementation TIUserDictionaryTransaction

- (TIUserDictionaryTransaction)initWithCoder:(id)a3
{
  id v4;
  TIUserDictionaryTransaction *v5;
  uint64_t v6;
  TIUserDictionaryEntryValue *valueToDelete;
  uint64_t v8;
  TIUserDictionaryEntryValue *valueToInsert;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIUserDictionaryTransaction;
  v5 = -[TIUserDictionaryTransaction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueToDelete"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueToDelete = v5->_valueToDelete;
    v5->_valueToDelete = (TIUserDictionaryEntryValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueToInsert"));
    v8 = objc_claimAutoreleasedReturnValue();
    valueToInsert = v5->_valueToInsert;
    v5->_valueToInsert = (TIUserDictionaryEntryValue *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TIUserDictionaryEntryValue *valueToDelete;
  TIUserDictionaryEntryValue *valueToInsert;
  id v7;

  v4 = a3;
  valueToDelete = self->_valueToDelete;
  v7 = v4;
  if (valueToDelete)
  {
    objc_msgSend(v4, "encodeObject:forKey:", valueToDelete, CFSTR("valueToDelete"));
    v4 = v7;
  }
  valueToInsert = self->_valueToInsert;
  if (valueToInsert)
  {
    objc_msgSend(v7, "encodeObject:forKey:", valueToInsert, CFSTR("valueToInsert"));
    v4 = v7;
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIUserDictionaryTransaction valueToDelete](self, "valueToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserDictionaryTransaction valueToInsert](self, "valueToInsert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: valueToDelete = %@, valueToInsert = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TIUserDictionaryEntryValue)valueToDelete
{
  return self->_valueToDelete;
}

- (void)setValueToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_valueToDelete, a3);
}

- (TIUserDictionaryEntryValue)valueToInsert
{
  return self->_valueToInsert;
}

- (void)setValueToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_valueToInsert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToInsert, 0);
  objc_storeStrong((id *)&self->_valueToDelete, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
