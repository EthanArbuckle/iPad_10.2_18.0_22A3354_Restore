@implementation HVInteraction

- (INInteraction)interaction
{
  return self->_interaction;
}

- (double)absoluteTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[INInteraction dateInterval](self->_interaction, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (NSString)bundleId
{
  return self->_bundleIdentifier;
}

- (NSString)uniqueId
{
  void *v2;
  void *v3;

  -[INInteraction identifier](self->_interaction, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HVInteraction uniqueIdForInteractionIdentifier:](HVInteraction, "uniqueIdForInteractionIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)uniqueIdForInteractionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(CFSTR("__ProactiveHarvesting__interactionIdentifier:"), "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (NSString)domainId
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[INInteraction groupIdentifier](self->_interaction, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INInteraction groupIdentifier](self->_interaction, "groupIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HVInteraction domainIdForInteractionGroupId:](HVInteraction, "domainIdForInteractionGroupId:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("__ProactiveHarvesting__.HVInteraction");
  }
  return (NSString *)v5;
}

- (HVInteraction)initWithInteraction:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  HVInteraction *v9;
  HVInteraction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HVInteraction;
  v9 = -[HVInteraction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interaction, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[INInteraction identifier](self->_interaction, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HVInteraction *v4;
  void *v5;
  void *v6;
  HVInteraction *v7;

  v4 = [HVInteraction alloc];
  v5 = (void *)-[INInteraction copy](self->_interaction, "copy");
  v6 = (void *)-[NSString copy](self->_bundleIdentifier, "copy");
  v7 = -[HVInteraction initWithInteraction:bundleIdentifier:](v4, "initWithInteraction:bundleIdentifier:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HVInteraction *v4;
  HVInteraction *v5;
  INInteraction *interaction;
  void *v7;
  NSString *bundleIdentifier;
  void *v9;
  char v10;

  v4 = (HVInteraction *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      interaction = self->_interaction;
      -[HVInteraction interaction](v5, "interaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[INInteraction isEqual:](interaction, "isEqual:", v7))
      {
        bundleIdentifier = self->_bundleIdentifier;
        -[HVInteraction bundleIdentifier](v5, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

+ (id)domainIdForInteractionGroupId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("%."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("__ProactiveHarvesting__.HVInteraction");
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v9;
}

@end
