@implementation NSDictionary(MTLMappingAdditions)

+ (id)mtl_identityPropertyMapWithModel:()MTLMappingAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EF72D1A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[NSDictionary(MTLMappingAdditions) mtl_identityPropertyMapWithModel:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSDictionary+MTLMappingAdditions.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLModel)]"));

  }
  objc_msgSend(a3, "propertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
