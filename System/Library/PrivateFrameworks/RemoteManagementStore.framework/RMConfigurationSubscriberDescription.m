@implementation RMConfigurationSubscriberDescription

+ (id)descriptionWithEventsDictionary:(id)a3
{
  void *v3;
  char isKindOfClass;
  RMConfigurationSubscriberDescription *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConfigurationSubscriber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMConfigurationSubscriberDescription alloc];
  if ((isKindOfClass & 1) != 0)
    v6 = -[RMConfigurationSubscriberDescription initWithDictionary:](v5, "initWithDictionary:", v3);
  else
    v6 = -[RMConfigurationSubscriberDescription initWithTypes:](v5, "initWithTypes:", 0);
  v7 = (void *)v6;

  return v7;
}

+ (id)descriptionWithServiceDictionary:(id)a3
{
  void *v3;
  char isKindOfClass;
  RMConfigurationSubscriberDescription *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConfigurationSubscriber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMConfigurationSubscriberDescription alloc];
  if ((isKindOfClass & 1) != 0)
    v6 = -[RMConfigurationSubscriberDescription initWithDictionary:](v5, "initWithDictionary:", v3);
  else
    v6 = -[RMConfigurationSubscriberDescription initWithTypes:](v5, "initWithTypes:", 0);
  v7 = (void *)v6;

  return v7;
}

- (RMConfigurationSubscriberDescription)initWithDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  RMConfigurationSubscriberDescription *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Types"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_6);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  else
  {
    v6 = 0;
  }

  v7 = -[RMConfigurationSubscriberDescription initWithTypes:](self, "initWithTypes:", v6);
  return v7;
}

uint64_t __59__RMConfigurationSubscriberDescription_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (RMConfigurationSubscriberDescription)initWithTypes:(id)a3
{
  id v4;
  RMConfigurationSubscriberDescription *v5;
  uint64_t v6;
  NSArray *types;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMConfigurationSubscriberDescription;
  v5 = -[RMConfigurationSubscriberDescription init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    types = v5->_types;
    v5->_types = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
}

@end
