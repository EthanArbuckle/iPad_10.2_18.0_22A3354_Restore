@implementation PSGProactiveTrigger

- (PSGProactiveTrigger)initWithSourceType:(unint64_t)a3 category:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  PSGProactiveTrigger *v11;
  PSGProactiveTrigger *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSGProactiveTrigger;
  v11 = -[PSGProactiveTrigger init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_triggerSourceType = a3;
    objc_storeStrong((id *)&v11->_triggerCategory, a4);
    objc_storeStrong((id *)&v12->_triggerAttributes, a5);
  }

  return v12;
}

- (PSGProactiveTrigger)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PSGProactiveTrigger *v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("cat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1DF0B9950]();
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v8, "initWithObjects:", v5, v9, v10, v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("tas"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v6 && v13)
  {
    self = -[PSGProactiveTrigger initWithSourceType:category:attributes:](self, "initWithSourceType:category:attributes:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("tst")), v6, v13);
    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t triggerSourceType;
  id v5;

  triggerSourceType = self->_triggerSourceType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", triggerSourceType, CFSTR("tst"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_triggerCategory, CFSTR("cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_triggerAttributes, CFSTR("tas"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_opt_class();
  v5 = objc_opt_new();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 8) = self->_triggerSourceType;
    v7 = -[NSString copyWithZone:](self->_triggerCategory, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

    v9 = -[NSDictionary copyWithZone:](self->_triggerAttributes, "copyWithZone:", a3);
    v10 = (void *)v6[3];
    v6[3] = v9;

  }
  return v6;
}

- (BOOL)isEqualToTrigger:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *triggerCategory;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSDictionary *v12;
  NSDictionary *v13;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_triggerSourceType != *((_QWORD *)v4 + 1))
    goto LABEL_5;
  triggerCategory = self->_triggerCategory;
  v7 = (NSString *)*((id *)v4 + 2);
  if (triggerCategory == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = triggerCategory;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_5:
      v11 = 0;
      goto LABEL_11;
    }
  }
  v12 = self->_triggerAttributes;
  v13 = v12;
  if (v12 == (NSDictionary *)v5[3])
    v11 = 1;
  else
    v11 = -[NSDictionary isEqual:](v12, "isEqual:");

LABEL_11:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PSGProactiveTrigger *v4;
  PSGProactiveTrigger *v5;
  BOOL v6;

  v4 = (PSGProactiveTrigger *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGProactiveTrigger isEqualToTrigger:](self, "isEqualToTrigger:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t triggerSourceType;
  NSUInteger v4;

  triggerSourceType = self->_triggerSourceType;
  v4 = -[NSString hash](self->_triggerCategory, "hash") - triggerSourceType + 32 * triggerSourceType;
  return -[NSDictionary hash](self->_triggerAttributes, "hash") - v4 + 32 * v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *triggerAttributes;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGProactiveTrigger tst:%tu cat: %@ tas:{"), self->_triggerSourceType, self->_triggerCategory);
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  triggerAttributes = self->_triggerAttributes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__PSGProactiveTrigger_description__block_invoke;
  v9[3] = &unk_1EA3F0DF8;
  v7 = v5;
  v10 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](triggerAttributes, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v7, "appendString:", CFSTR("}>"));

  return v7;
}

- (unint64_t)triggerSourceType
{
  return self->_triggerSourceType;
}

- (NSString)triggerCategory
{
  return self->_triggerCategory;
}

- (NSDictionary)triggerAttributes
{
  return self->_triggerAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerAttributes, 0);
  objc_storeStrong((id *)&self->_triggerCategory, 0);
}

void __34__PSGProactiveTrigger_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@=%@; "), v7, v6);

  objc_msgSend(v4, "appendString:", v8);
}

+ (id)getGivenNameQualifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D433D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43340]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)getSearchTerm:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SearchTerm"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
