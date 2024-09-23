@implementation TLAlert(UserNotificationsCore)

+ (uint64_t)unc_toneLibraryAlertTypeForSectionID:()UserNotificationsCore
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = unc_toneLibraryAlertTypeForSectionID__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&unc_toneLibraryAlertTypeForSectionID__onceToken, &__block_literal_global_6);
  objc_msgSend((id)unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

@end
