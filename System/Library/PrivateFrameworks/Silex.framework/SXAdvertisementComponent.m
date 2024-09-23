@implementation SXAdvertisementComponent

- (SXAdvertisementComponent)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXAdvertisementComponent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("placementIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (!v10)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("placementIdentifier"));

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SXAdvertisementComponent;
  v13 = -[SXJSONObject initWithJSONObject:andVersion:](&v15, sel_initWithJSONObject_andVersion_, v9, v7);

  return v13;
}

- (unint64_t)traits
{
  return 16;
}

- (UIColor)debugColor
{
  return 0;
}

- (unint64_t)placementType
{
  return 0;
}

- (unint64_t)adType
{
  return self->adType;
}

@end
