@implementation NSError(DataModelAdditions)

+ (uint64_t)pbf_descriptorStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFPosterDescriptorStoreCoordinatorErrorDomain, a3, a4);
}

+ (uint64_t)pbf_extensionStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFPosterDescriptorStoreCoordinatorErrorDomain, a3, a4);
}

+ (uint64_t)pbf_dataStoreErrorWithCode:()DataModelAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFPosterExtensionDataStoreErrorDomain, a3, a4);
}

+ (uint64_t)pbf_generalErrorWithCode:()DataModelAdditions userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFGeneralErrorDomain, a3, a4);
}

- (BOOL)pbf_isGeneralCancelledError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", PBFGeneralErrorDomain))
    v3 = objc_msgSend(a1, "code") == 4;
  else
    v3 = 0;

  return v3;
}

@end
