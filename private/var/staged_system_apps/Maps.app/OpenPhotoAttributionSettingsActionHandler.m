@implementation OpenPhotoAttributionSettingsActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v9 = a4;
  v5 = a3;
  v6 = objc_opt_class(OpenPhotoAttributionSettingsAction);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "coordinator"));
    objc_msgSend(v8, "viewControllerPresentUserProfilePreferences:withTabType:", 0, 2);

  }
}

@end
