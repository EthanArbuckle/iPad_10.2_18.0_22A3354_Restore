@implementation WFTimeZoneDescriptor

- (WFTimeZoneDescriptor)initWithTimeZone:(id)a3 localizedCityName:(id)a4 alCityIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFTimeZoneDescriptor *v12;
  WFTimeZoneDescriptor *v13;
  uint64_t v14;
  NSString *localizedCityName;
  uint64_t v16;
  NSNumber *alCityIdentifier;
  WFTimeZoneDescriptor *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFTimeZoneDescriptor;
  v12 = -[MTLModel init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timeZone, a3);
    v14 = objc_msgSend(v10, "copy");
    localizedCityName = v13->_localizedCityName;
    v13->_localizedCityName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    alCityIdentifier = v13->_alCityIdentifier;
    v13->_alCityIdentifier = (NSNumber *)v16;

    v18 = v13;
  }

  return v13;
}

- (WFTimeZoneDescriptor)initWithALCity:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  WFTimeZoneDescriptor *v12;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZoneWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayNameIncludingCountry:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v5, "identifier");

  objc_msgSend(v9, "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFTimeZoneDescriptor initWithTimeZone:localizedCityName:alCityIdentifier:](self, "initWithTimeZone:localizedCityName:alCityIdentifier:", v7, v8, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  WFTimeZoneDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (WFTimeZoneDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFTimeZoneDescriptor timeZone](self, "timeZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTimeZoneDescriptor timeZone](v4, "timeZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        LOBYTE(v12) = 0;
        v13 = v10;
        v14 = v9;
        if (!v9 || !v10)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v12 = objc_msgSend(v9, "isEqualToString:", v10);

        if (!v12)
          goto LABEL_18;
      }
      -[WFTimeZoneDescriptor localizedCityName](self, "localizedCityName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTimeZoneDescriptor localizedCityName](v4, "localizedCityName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      v17 = v16;
      v13 = v17;
      if (v14 == v17)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        LOBYTE(v12) = 0;
        if (v14 && v17)
          LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
      }

      goto LABEL_17;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[WFTimeZoneDescriptor timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WFTimeZoneDescriptor localizedCityName](self, "localizedCityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeZoneDescriptor alCityIdentifier](self, "alCityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithTimeZone:localizedCityName:alCityIdentifier:", v6, v7, v8);

  return v9;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)localizedCityName
{
  return self->_localizedCityName;
}

- (NSNumber)alCityIdentifier
{
  return self->_alCityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alCityIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedCityName, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "mtl_identityPropertyMapWithModel:", a1);
}

+ (id)timeZoneJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_34623, &__block_literal_global_116_34624);
}

uint64_t __47__WFTimeZoneDescriptor_timeZoneJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __47__WFTimeZoneDescriptor_timeZoneJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", a2);
}

@end
