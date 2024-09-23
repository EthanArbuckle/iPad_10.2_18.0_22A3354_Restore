@implementation AEAnnotationGenericTextActivityItemProvider

- (BOOL)supportsActivityType:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMActivity activityTypes](IMActivity, "activityTypes"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1;
}

@end
