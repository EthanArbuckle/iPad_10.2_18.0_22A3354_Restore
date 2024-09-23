@implementation NSURL(NSItemProviderUIKitAdditions)

+ (uint64_t)_allowsCreationOfFileURLFromItemProvider
{
  if (qword_1ECD7F4C8 != -1)
    dispatch_once(&qword_1ECD7F4C8, &__block_literal_global_129);
  return _MergedGlobals_1166;
}

+ (void)_setAllowsCreationOfFileURLFromItemProvider:()NSItemProviderUIKitAdditions
{
  if (qword_1ECD7F4C8 != -1)
    dispatch_once(&qword_1ECD7F4C8, &__block_literal_global_129);
  _MergedGlobals_1166 = a3;
}

- (id)_title
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, &kTitleObjKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (void)_setTitle:()NSItemProviderUIKitAdditions
{
  objc_setAssociatedObject(a1, &kTitleObjKey, a3, (void *)3);
}

- (id)_NSItemProviderArchive_customArchiveDictionary
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "_title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  }
  return v2;
}

- (void)_NSItemProviderArchive_didUnarchiveCustomDictionary:()NSItemProviderUIKitAdditions
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "_setTitle:", v4);
  }

}

@end
