@implementation LNLinkEnumerationValueType(ContentItem)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "wf_contentItemClassWithAppBundleIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  WFLinkEnumerationCase *v18;
  void *v19;
  WFLinkEnumerationCase *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[WFLinkActionProvider sharedProvider](WFLinkActionProvider, "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v13, "cases");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __132__LNLinkEnumerationValueType_ContentItem__wf_contentItemFromLinkValue_appBundleIdentifier_displayedBundleIdentifier_teamIdentifier___block_invoke;
    v30[3] = &unk_1E7AF89A0;
    v16 = v14;
    v31 = v16;
    objc_msgSend(v15, "if_firstObjectPassingTest:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [WFLinkEnumerationCase alloc];
      objc_msgSend(v17, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WFLinkEnumerationCase initWithIdentifier:](v18, "initWithIdentifier:", v19);

      v21 = (void *)MEMORY[0x1E0D13E00];
      v22 = objc_alloc(MEMORY[0x1E0CBD728]);
      if (v9)
        v23 = v9;
      else
        v23 = v8;
      v24 = (void *)objc_msgSend(v22, "initWithBundleIdentifier:", v23);
      objc_msgSend(v21, "locationWithAppDescriptor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:", v8);
      objc_msgSend(MEMORY[0x1E0D13EC8], "configurationWithOrigin:disclosureLevel:", v25, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "itemWithObject:privacyConfiguration:", v20, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {

    v28 = 0;
  }

  return v28;
}

@end
