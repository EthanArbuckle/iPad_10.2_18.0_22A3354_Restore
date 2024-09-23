@implementation PSSpecifier(ScreenTimeAdditions)

+ (id)st_emptyGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupSpecifierWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
