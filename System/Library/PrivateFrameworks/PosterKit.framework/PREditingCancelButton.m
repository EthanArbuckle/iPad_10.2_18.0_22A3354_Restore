@implementation PREditingCancelButton

+ (id)editingTitledButtonTitle
{
  void *v2;
  void *v3;

  PRBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_1E2186E08, CFSTR("PosterKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

@end
