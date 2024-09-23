@implementation PLUUIDStringFromUUIDDataTransformer

- (id)transformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_opt_class();
    if (v4 == objc_opt_class())
      objc_msgSend(v3, "UUIDData");
    else
      PLUUIDDataFromString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length") == 16)
  {
    v4 = (objc_class *)MEMORY[0x1E0D73308];
    v5 = v3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDData:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
