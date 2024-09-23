@implementation PKPassShareActivationOptions

- (PKPassShareActivationOptions)init
{

  return 0;
}

- (PKPassShareActivationOptions)initWithOptions:(id)a3
{
  id v5;
  PKPassShareActivationOptions *v6;
  PKPassShareActivationOptions *v7;
  PKPassShareActivationOptions *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassShareActivationOptions;
    v6 = -[PKPassShareActivationOptions init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_options, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassShareActivationOptions)initWithCarKeyIdentifiers:(id)a3
{
  void *v4;
  PKPassShareActivationOptions *v5;

  if (a3)
  {
    objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PKPassShareActivationOptions initWithOptions:](self, "initWithOptions:", v4);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

PKPassShareActivationOption *__58__PKPassShareActivationOptions_initWithCarKeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPassShareActivationOption *v3;

  v2 = a2;
  v3 = -[PKPassShareActivationOption initWithCarKeyIdentifier:]([PKPassShareActivationOption alloc], "initWithCarKeyIdentifier:", v2);

  return v3;
}

- (PKPassShareActivationOptions)initWithDefaultIdentifierForType:(unint64_t)a3
{
  PKPassShareActivationOption *v4;
  void *v5;
  PKPassShareActivationOptions *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = -[PKPassShareActivationOption initWithDefaultIdentifierForType:]([PKPassShareActivationOption alloc], "initWithDefaultIdentifierForType:", a3);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPassShareActivationOptions initWithOptions:](self, "initWithOptions:", v5);

  return v6;
}

+ (id)optionsFromRemoteOptions:(id)a3 localOptions:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  PKPassShareActivationOptions *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  PKPassShareActivationOptions *v16;
  void *v17;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v5 && !v6)
    {
      v6 = v5;
LABEL_8:
      v8 = (PKPassShareActivationOptions *)objc_msgSend((id)v6, "copy");
      goto LABEL_13;
    }
    if (!v5 && v6)
      goto LABEL_8;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v7, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("sharingPasswordActivation"));

    objc_msgSend((id)v5, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", CFSTR("sharingPasswordActivation"));

    objc_msgSend((id)v5, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v14);

    if (v11 && (v13 & 1) == 0)
    {
      objc_msgSend(v7, "optionsExcludingIdentifier:type:", CFSTR("sharingPasswordActivation"), 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v15);

    }
    v16 = [PKPassShareActivationOptions alloc];
    objc_msgSend(v9, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPassShareActivationOptions initWithOptions:](v16, "initWithOptions:", v17);

  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (NSString)activationCode
{
  void *v2;
  void *v3;

  -[NSArray pk_firstObjectPassingTest:](self->_options, "pk_firstObjectPassingTest:", &__block_literal_global_133);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

uint64_t __46__PKPassShareActivationOptions_activationCode__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "type");
  return (v2 < 4) & (6u >> (v2 & 0xF));
}

- (PKPassShareActivationOption)primaryOption
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKPassShareActivationOptions optionOfTypes:](self, "optionOfTypes:", &unk_1E2C3DDE0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSArray firstObject](self->_options, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (PKPassShareActivationOption *)v6;
}

- (NSArray)identifiers
{
  return (NSArray *)-[NSArray pk_arrayByApplyingBlock:](self->_options, "pk_arrayByApplyingBlock:", &__block_literal_global_135);
}

uint64_t __43__PKPassShareActivationOptions_identifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)optionsExcludingIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  NSArray *options;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  v6 = a3;
  options = self->_options;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKPassShareActivationOptions_optionsExcludingIdentifier_type___block_invoke;
  v13[3] = &unk_1E2AC5B48;
  v14 = v6;
  v15 = a4;
  v8 = v6;
  -[NSArray pk_objectsPassingTest:](options, "pk_objectsPassingTest:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v9;

  return v11;
}

BOOL __64__PKPassShareActivationOptions_optionsExcludingIdentifier_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  _BOOL8 v10;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = objc_msgSend(v3, "type") != *(_QWORD *)(a1 + 40);
      goto LABEL_10;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)containsVehicleEnteredPin
{
  return -[NSArray pk_containsObjectPassingTest:](self->_options, "pk_containsObjectPassingTest:", &__block_literal_global_137);
}

BOOL __57__PKPassShareActivationOptions_containsVehicleEnteredPin__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3
    && objc_msgSend(v3, "isEqual:", CFSTR("sharingPasswordActivation"))
    && objc_msgSend(v2, "type") == 2;

  return v5;
}

- (BOOL)containsPinCode
{
  return -[PKPassShareActivationOptions containsOptionOfType:](self, "containsOptionOfType:", 1);
}

- (BOOL)containsOptionOfType:(unint64_t)a3
{
  NSArray *options;
  _QWORD v5[5];

  options = self->_options;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKPassShareActivationOptions_containsOptionOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e37_B16__0__PKPassShareActivationOption_8l;
  v5[4] = a3;
  return -[NSArray pk_containsObjectPassingTest:](options, "pk_containsObjectPassingTest:", v5);
}

BOOL __53__PKPassShareActivationOptions_containsOptionOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)optionOfType:(unint64_t)a3
{
  NSArray *options;
  _QWORD v5[5];

  options = self->_options;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PKPassShareActivationOptions_optionOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e37_B16__0__PKPassShareActivationOption_8l;
  v5[4] = a3;
  -[NSArray pk_firstObjectPassingTest:](options, "pk_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __45__PKPassShareActivationOptions_optionOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)optionOfTypes:(id)a3
{
  id v4;
  NSArray *options;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  options = self->_options;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKPassShareActivationOptions_optionOfTypes___block_invoke;
  v9[3] = &unk_1E2AC5BB0;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_firstObjectPassingTest:](options, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __46__PKPassShareActivationOptions_optionOfTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)optionsOfTypes:(id)a3
{
  id v4;
  NSArray *options;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  options = self->_options;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PKPassShareActivationOptions_optionsOfTypes___block_invoke;
  v11[3] = &unk_1E2AC5BD8;
  v12 = v4;
  v6 = v4;
  -[NSArray pk_objectsPassingTest:](options, "pk_objectsPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

uint64_t __47__PKPassShareActivationOptions_optionsOfTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)optionsOfType:(unint64_t)a3
{
  NSArray *options;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];

  options = self->_options;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PKPassShareActivationOptions_optionsOfType___block_invoke;
  v8[3] = &__block_descriptor_40_e44_B32__0__PKPassShareActivationOption_8Q16_B24l;
  v8[4] = a3;
  -[NSArray pk_objectsPassingTest:](options, "pk_objectsPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

BOOL __46__PKPassShareActivationOptions_optionsOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (PKPassShareActivationOptions)optionsWithoutValues
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)-[PKPassShareActivationOptions copy](self, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2[1];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "value", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          objc_msgSend(v8, "setValueLength:", objc_msgSend(v9, "length"));
        objc_msgSend(v8, "setValue:", 0);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return (PKPassShareActivationOptions *)v2;
}

- (NSString)localizationKeyPostfix
{
  id v3;
  id v4;
  uint64_t (**v5)(void *, void *);
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke;
  aBlock[3] = &unk_1E2AC5BB0;
  v4 = v3;
  v23 = v4;
  v5 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  -[PKPassShareActivationOptions optionOfType:](self, "optionOfType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5[2](v5, v6);

  if ((v7 & 1) == 0)
  {
    -[PKPassShareActivationOptions optionOfType:](self, "optionOfType:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

    -[PKPassShareActivationOptions optionsOfType:](self, "optionsOfType:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_144);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v5[2](v5, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v13);
    }

  }
  v16 = (void *)objc_msgSend(v4, "copy", (_QWORD)v18);

  return (NSString *)v16;
}

BOOL __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("_"));
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "localizationKeyPostfix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

  }
  return v3 != 0;
}

uint64_t __54__PKPassShareActivationOptions_localizationKeyPostfix__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareActivationOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PKPassShareActivationOptions *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKPassShareActivationOptions initWithOptions:](self, "initWithOptions:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_options, CFSTR("options"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("options: '%@'; "), self->_options);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_options)
    objc_msgSend(v3, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPassShareActivationOptions *v4;
  PKPassShareActivationOptions *v5;
  BOOL v6;

  v4 = (PKPassShareActivationOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassShareActivationOptions isEqualToPassShareActivationOptions:](self, "isEqualToPassShareActivationOptions:", v5);

  return v6;
}

- (BOOL)isEqualToPassShareActivationOptions:(id)a3
{
  NSArray *options;
  NSArray *v4;
  BOOL v5;

  if (!a3)
    return 0;
  options = self->_options;
  v4 = (NSArray *)*((_QWORD *)a3 + 1);
  if (options)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return options == v4;
  else
    return -[NSArray isEqual:](options, "isEqual:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  PKPassShareActivationOptions *v4;

  -[NSArray pk_arrayByApplyingBlock:](self->_options, "pk_arrayByApplyingBlock:", &__block_literal_global_152_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassShareActivationOptions initWithOptions:]([PKPassShareActivationOptions alloc], "initWithOptions:", v3);

  return v4;
}

id __45__PKPassShareActivationOptions_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (NSArray)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
