@implementation MFIntentMailboxKindResolutionResult

+ (id)successWithResolvedMFIntentMailboxKind:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxKindResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedValue:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

+ (id)confirmationRequiredWithMFIntentMailboxKindToConfirm:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFIntentMailboxKindResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithValueToConfirm:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

@end
