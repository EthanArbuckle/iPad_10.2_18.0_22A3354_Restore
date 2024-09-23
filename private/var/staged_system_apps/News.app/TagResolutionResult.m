@implementation TagResolutionResult

+ (id)successWithResolvedTag:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedObject:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)disambiguationWithTagsToDisambiguate:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "disambiguationWithObjectsToDisambiguate:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)confirmationRequiredWithTagToConfirm:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithObjectToConfirm:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
