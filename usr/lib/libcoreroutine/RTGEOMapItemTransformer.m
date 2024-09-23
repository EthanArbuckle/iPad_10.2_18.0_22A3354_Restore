@implementation RTGEOMapItemTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFCF8788))
  {
    objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForGEOMapItem:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
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
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271E8]), "initWithData:", v3);
  else
    v4 = 0;

  return v4;
}

@end
