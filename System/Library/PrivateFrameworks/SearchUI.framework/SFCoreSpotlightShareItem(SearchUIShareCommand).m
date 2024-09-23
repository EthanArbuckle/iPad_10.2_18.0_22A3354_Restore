@implementation SFCoreSpotlightShareItem(SearchUIShareCommand)

- (void)searchUI_fetchShareableItemWithCompletionHandler:()SearchUIShareCommand
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "coreSpotlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shareProviderTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__SFCoreSpotlightShareItem_SearchUIShareCommand__searchUI_fetchShareableItemWithCompletionHandler___block_invoke;
  v10[3] = &unk_1EA1F6458;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "provideFileURLForBundle:identifier:type:completionHandler:", v6, v7, v8, v10);

}

@end
