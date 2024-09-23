@implementation LNIntentsValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  objc_msgSend(a1, "typeIdentifier");
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(a1, "typeIdentifier");
  if (v14 > 11)
  {
    if (v14 == 14)
    {
      objc_msgSend(v10, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v17 = v26;

      v32 = (void *)MEMORY[0x1E0D13F10];
    }
    else
    {
      if (v14 != 13)
        goto LABEL_11;
      objc_msgSend(v10, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
      }
      else
      {
        v28 = 0;
      }
      v17 = v28;

      v32 = (void *)MEMORY[0x1E0D14040];
    }
LABEL_38:
    objc_msgSend(v32, "itemWithObject:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (!v14)
  {
    objc_msgSend(v10, "value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v33 = v30;

    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D13DF0]), "initWithBundleIdentifier:localizedName:", v33, 0);
    v32 = (void *)MEMORY[0x1E0D13DF8];
    goto LABEL_38;
  }
  if (v14 == 3)
  {
    objc_msgSend(v10, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v31 = v16;

    objc_msgSend(MEMORY[0x1E0D13E68], "cnContactWithINPerson:", v31);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0D13E70];
    goto LABEL_38;
  }
LABEL_11:
  objc_msgSend(v10, "value");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v18 = objc_alloc(MEMORY[0x1E0CBD728]);
    if (v12)
      v19 = v12;
    else
      v19 = v11;
    v20 = (void *)objc_msgSend(v18, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", 0, v19, 0, 0, v13, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(v17, "wf_fileRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "itemWithFile:origin:disclosureLevel:", v23, v21, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
LABEL_39:

  return v24;
}

@end
