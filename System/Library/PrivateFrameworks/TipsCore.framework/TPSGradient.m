@implementation TPSGradient

uint64_t __26__TPSGradient_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stops");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

id __26__TPSGradient_na_identity__block_invoke()
{
  if (TPSGradientStopsKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSGradientStopsKey_block_invoke_na_once_token_0, &__block_literal_global_21);
  return (id)TPSGradientStopsKey_block_invoke_na_once_object_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stops, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSGradient;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSGradient stops](self, "stops", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stops"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSGradient;
  v4 = -[TPSSerializableObject copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSGradient stops](self, "stops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStops:", v5);

  return v4;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void)setStops:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TPSGradient)initWithDictionary:(id)a3
{
  id v4;
  TPSGradient *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  TPSGradientStop *v18;
  uint64_t v19;
  NSArray *stops;
  uint64_t v21;
  TPSGradient *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSGradient;
  v5 = -[TPSSerializableObject initWithDictionary:](&v29, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("attrs"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  objc_msgSend(v9, "TPSSafeArrayForKey:", CFSTR("stops"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v24 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = -[TPSGradientStop initWithDictionary:]([TPSGradientStop alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v15);
    }

    v19 = objc_msgSend(v12, "copy");
    stops = v5->_stops;
    v5->_stops = (NSArray *)v19;

    v9 = v24;
  }
  v21 = -[NSArray count](v5->_stops, "count");

  if (!v21)
    v22 = 0;
  else
LABEL_15:
    v22 = v5;

  return v22;
}

- (TPSGradient)initWithColorStrings:(id)a3
{
  id v4;
  TPSGradient *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TPSGradientStop *v14;
  TPSGradientStop *v15;
  uint64_t v16;
  NSArray *stops;
  TPSGradient *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSGradient;
  v5 = -[TPSGradient init](&v24, sel_init);
  if (!v5)
    goto LABEL_12;
  v6 = objc_msgSend(v4, "count");
  if (v6 > 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          v14 = [TPSGradientStop alloc];
          v15 = -[TPSGradientStop initWithColorString:](v14, "initWithColorString:", v13, (_QWORD)v20);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "copy");
    stops = v5->_stops;
    v5->_stops = (NSArray *)v16;

  }
  if (!-[NSArray count](v5->_stops, "count", (_QWORD)v20))
    v18 = 0;
  else
LABEL_12:
    v18 = v5;

  return v18;
}

- (TPSGradient)initWithCoder:(id)a3
{
  id v4;
  TPSGradient *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *stops;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSGradient;
  v5 = -[TPSSerializableObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("stops"));
    v9 = objc_claimAutoreleasedReturnValue();
    stops = v5->_stops;
    v5->_stops = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__TPSGradient_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __26__TPSGradient_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSGradientStopsKey_block_invoke_na_once_object_0;
  TPSGradientStopsKey_block_invoke_na_once_object_0 = v0;

}

id __26__TPSGradient_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_26_0);
  objc_msgSend(v0, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSGradient;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSGradient stops](self, "stops");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("stops"), v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

@end
