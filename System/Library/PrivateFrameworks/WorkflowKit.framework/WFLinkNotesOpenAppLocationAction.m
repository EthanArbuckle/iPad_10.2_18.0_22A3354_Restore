@implementation WFLinkNotesOpenAppLocationAction

- (id)entityName
{
  return CFSTR("notes view");
}

- (id)capitalizedEntityName
{
  return CFSTR("Notes View");
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("NotesSubcategoryApp"), CFSTR("App"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
