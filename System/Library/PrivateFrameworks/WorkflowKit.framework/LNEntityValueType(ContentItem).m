@implementation LNEntityValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryMetadataByAppBundleIdentifier:entityIdentifier:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attributionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortcutsActionMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "shortcutsActionMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributionBundleIdentifierWithDefaultValue:", v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v15 = (id)objc_msgSend(v7, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v10, v4, v11);

  return v15;
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)&off_1EF780968;
  v9 = a3;
  objc_msgSendSuper2(&v15, sel_wf_contentItemFromLinkValue_appBundleIdentifier_displayedBundleIdentifier_teamIdentifier_, v9, a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  objc_msgSend(v9, "displayRepresentation", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDisplayRepresentation:", v13);
  return v10;
}

@end
