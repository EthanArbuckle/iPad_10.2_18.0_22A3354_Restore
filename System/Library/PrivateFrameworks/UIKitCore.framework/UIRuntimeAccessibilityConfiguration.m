@implementation UIRuntimeAccessibilityConfiguration

- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 hint:(id)a5 traits:(id)a6 andIsAccessibilityElement:(id)a7
{
  return -[UIRuntimeAccessibilityConfiguration initWithObject:label:identifier:hint:traits:andIsAccessibilityElement:](self, "initWithObject:label:identifier:hint:traits:andIsAccessibilityElement:", a3, a4, 0, a5, a6, a7);
}

- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 identifier:(id)a5 hint:(id)a6 traits:(id)a7 andIsAccessibilityElement:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  UIRuntimeAccessibilityConfiguration *v21;
  UIRuntimeAccessibilityConfiguration *v22;
  uint64_t v23;
  NSString *accessibilityConfigurationHint;
  uint64_t v25;
  NSString *accessibilityConfigurationIdentifier;
  uint64_t v27;
  NSString *accessibilityConfigurationLabel;
  uint64_t v29;
  NSNumber *accessibilityConfigurationTraits;
  uint64_t v31;
  NSNumber *isAccessibilityConfigurationElement;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)UIRuntimeAccessibilityConfiguration;
  v21 = -[UIRuntimeAccessibilityConfiguration init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->object, a3);
    v23 = objc_msgSend(v18, "copy");
    accessibilityConfigurationHint = v22->accessibilityConfigurationHint;
    v22->accessibilityConfigurationHint = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    accessibilityConfigurationIdentifier = v22->accessibilityConfigurationIdentifier;
    v22->accessibilityConfigurationIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v16, "copy");
    accessibilityConfigurationLabel = v22->accessibilityConfigurationLabel;
    v22->accessibilityConfigurationLabel = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    accessibilityConfigurationTraits = v22->accessibilityConfigurationTraits;
    v22->accessibilityConfigurationTraits = (NSNumber *)v29;

    v31 = objc_msgSend(v20, "copy");
    isAccessibilityConfigurationElement = v22->isAccessibilityConfigurationElement;
    v22->isAccessibilityConfigurationElement = (NSNumber *)v31;

  }
  return v22;
}

- (UIRuntimeAccessibilityConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIRuntimeAccessibilityConfiguration *v5;
  uint64_t v6;
  NSObject *object;
  uint64_t v8;
  NSString *accessibilityConfigurationHint;
  uint64_t v10;
  NSString *accessibilityConfigurationIdentifier;
  uint64_t v12;
  NSString *accessibilityConfigurationLabel;
  uint64_t v14;
  NSNumber *accessibilityConfigurationTraits;
  uint64_t v16;
  NSNumber *isAccessibilityConfigurationElement;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIRuntimeAccessibilityConfiguration;
  v5 = -[UIRuntimeAccessibilityConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessibileObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    object = v5->object;
    v5->object = v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessibilityHint"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityConfigurationHint = v5->accessibilityConfigurationHint;
    v5->accessibilityConfigurationHint = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessibilityIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessibilityConfigurationIdentifier = v5->accessibilityConfigurationIdentifier;
    v5->accessibilityConfigurationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessibilityLabel"));
    v12 = objc_claimAutoreleasedReturnValue();
    accessibilityConfigurationLabel = v5->accessibilityConfigurationLabel;
    v5->accessibilityConfigurationLabel = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAccessibilityTraits"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessibilityConfigurationTraits = v5->accessibilityConfigurationTraits;
    v5->accessibilityConfigurationTraits = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIIsAccessibilityElement"));
    v16 = objc_claimAutoreleasedReturnValue();
    isAccessibilityConfigurationElement = v5->isAccessibilityConfigurationElement;
    v5->isAccessibilityConfigurationElement = (NSNumber *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *object;
  NSString *accessibilityConfigurationHint;
  NSString *accessibilityConfigurationIdentifier;
  NSString *accessibilityConfigurationLabel;
  NSNumber *accessibilityConfigurationTraits;
  NSNumber *isAccessibilityConfigurationElement;
  id v11;

  v4 = a3;
  object = self->object;
  v11 = v4;
  if (object)
  {
    objc_msgSend(v4, "encodeObject:forKey:", object, CFSTR("UIAccessibileObject"));
    v4 = v11;
  }
  accessibilityConfigurationHint = self->accessibilityConfigurationHint;
  if (accessibilityConfigurationHint)
  {
    objc_msgSend(v11, "encodeObject:forKey:", accessibilityConfigurationHint, CFSTR("UIAccessibilityHint"));
    v4 = v11;
  }
  accessibilityConfigurationIdentifier = self->accessibilityConfigurationIdentifier;
  if (accessibilityConfigurationIdentifier)
  {
    objc_msgSend(v11, "encodeObject:forKey:", accessibilityConfigurationIdentifier, CFSTR("UIAccessibilityIdentifier"));
    v4 = v11;
  }
  accessibilityConfigurationLabel = self->accessibilityConfigurationLabel;
  if (accessibilityConfigurationLabel)
  {
    objc_msgSend(v11, "encodeObject:forKey:", accessibilityConfigurationLabel, CFSTR("UIAccessibilityLabel"));
    v4 = v11;
  }
  accessibilityConfigurationTraits = self->accessibilityConfigurationTraits;
  if (accessibilityConfigurationTraits)
  {
    objc_msgSend(v11, "encodeObject:forKey:", accessibilityConfigurationTraits, CFSTR("UIAccessibilityTraits"));
    v4 = v11;
  }
  isAccessibilityConfigurationElement = self->isAccessibilityConfigurationElement;
  if (isAccessibilityConfigurationElement)
  {
    objc_msgSend(v11, "encodeObject:forKey:", isAccessibilityConfigurationElement, CFSTR("UIIsAccessibilityElement"));
    v4 = v11;
  }

}

- (void)applyConfiguration
{
  NSNumber *isAccessibilityConfigurationElement;
  NSNumber *accessibilityConfigurationTraits;

  isAccessibilityConfigurationElement = self->isAccessibilityConfigurationElement;
  if (isAccessibilityConfigurationElement)
    -[NSObject setIsAccessibilityElement:](self->object, "setIsAccessibilityElement:", -[NSNumber BOOLValue](isAccessibilityConfigurationElement, "BOOLValue"));
  if (self->accessibilityConfigurationHint)
    -[NSObject setAccessibilityHint:](self->object, "setAccessibilityHint:");
  if (self->accessibilityConfigurationIdentifier)
    -[NSObject setAccessibilityIdentifier:](self->object, "setAccessibilityIdentifier:");
  if (self->accessibilityConfigurationLabel)
    -[NSObject setAccessibilityLabel:](self->object, "setAccessibilityLabel:");
  accessibilityConfigurationTraits = self->accessibilityConfigurationTraits;
  if (accessibilityConfigurationTraits)
    -[NSObject setAccessibilityTraits:](self->object, "setAccessibilityTraits:", -[NSNumber longLongValue](accessibilityConfigurationTraits, "longLongValue"));
}

- (NSString)accessibilityConfigurationHint
{
  return self->accessibilityConfigurationHint;
}

- (void)setAccessibilityConfigurationHint:(id)a3
{
  objc_storeStrong((id *)&self->accessibilityConfigurationHint, a3);
}

- (NSString)accessibilityConfigurationIdentifier
{
  return self->accessibilityConfigurationIdentifier;
}

- (void)setAccessibilityConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->accessibilityConfigurationIdentifier, a3);
}

- (NSString)accessibilityConfigurationLabel
{
  return self->accessibilityConfigurationLabel;
}

- (void)setAccessibilityConfigurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->accessibilityConfigurationLabel, a3);
}

- (NSNumber)accessibilityConfigurationTraits
{
  return self->accessibilityConfigurationTraits;
}

- (void)setAccessibilityConfigurationTraits:(id)a3
{
  objc_storeStrong((id *)&self->accessibilityConfigurationTraits, a3);
}

- (NSNumber)isAccessibilityConfigurationElement
{
  return self->isAccessibilityConfigurationElement;
}

- (void)setIsAccessibilityConfigurationElement:(id)a3
{
  objc_storeStrong((id *)&self->isAccessibilityConfigurationElement, a3);
}

- (NSObject)object
{
  return self->object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->object, 0);
  objc_storeStrong((id *)&self->isAccessibilityConfigurationElement, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationTraits, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationLabel, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationHint, 0);
}

@end
