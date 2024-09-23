@implementation OpenCommuteEntryActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = objc_opt_class(OpenCommuteEntryAction);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entryID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsEntry archivedDestinationForUniqueID:](MapsSuggestionsEntry, "archivedDestinationForUniqueID:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appStateManager"));
    objc_msgSend(v10, "openCommuteEntry:", v8);

  }
}

@end
