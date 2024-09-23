@implementation WFContentItem(UIActivityItemSource)

- (id)activityViewControllerPlaceholderItem:()UIActivityItemSource
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "shouldUseObjectRepresentation"))
  {
    objc_msgSend(a1, "preferredObjectType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForClass:", objc_msgSend(v2, "objectClass"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;

  if (!objc_msgSend(a1, "shouldUseObjectRepresentation"))
    goto LABEL_9;
  objc_msgSend(a1, "preferredObjectType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "conformsToClass:", objc_opt_class()))
  {
    if ((objc_msgSend(v2, "conformsToClass:", objc_opt_class()) & 1) != 0
      || objc_msgSend(v2, "conformsToClass:", objc_opt_class()))
    {
      v3 = (id *)MEMORY[0x24BDF8410];
      goto LABEL_7;
    }

LABEL_9:
    objc_msgSend(a1, "preferredFileType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "string");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v3 = (id *)MEMORY[0x24BDF85F0];
LABEL_7:
  objc_msgSend(*v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v5 = (void *)v4;

  return v5;
}

- (id)activityViewController:()UIActivityItemSource itemForActivityType:
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "shouldUseObjectRepresentation"))
  {
    objc_msgSend(a1, "preferredObjectType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForClass:", objc_msgSend(v2, "objectClass"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "preferredFileType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fileRepresentationForType:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v2, "representationType"))
      objc_msgSend(v2, "fileURL");
    else
      objc_msgSend(v2, "data");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v3;

  return v5;
}

- (__CFString)activityViewController:()UIActivityItemSource subjectForActivityType:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  __CFString *v10;

  v5 = a4;
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7498]);

  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(a1, "string"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasPrefix:", v6),
        v8,
        (v9 & 1) != 0))
  {
    v10 = &stru_24EE26238;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)activityViewControllerLinkMetadata:()UIActivityItemSource
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;

  v2 = (void *)objc_opt_new();
  if (!objc_msgSend(a1, "shouldUseObjectRepresentation"))
  {
    objc_msgSend(a1, "preferredFileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fileRepresentationForType:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    objc_msgSend(v5, "wfName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v10);

    objc_msgSend(v5, "wfType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "utType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setType:", v13);

    objc_msgSend(v9, "setSize:", objc_msgSend(v5, "fileSize"));
    objc_msgSend(v2, "setSpecialization:", v9);

LABEL_12:
    return v2;
  }
  objc_msgSend(a1, "preferredObjectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToClass:", objc_opt_class());

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v6);

    v7 = (id *)MEMORY[0x24BDF8510];
LABEL_11:
    objc_msgSend(*v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setType:", v20);

    objc_msgSend(v2, "setSpecialization:", v5);
    goto LABEL_12;
  }
  objc_msgSend(a1, "preferredObjectType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "conformsToClass:", objc_opt_class());

  if (v15)
  {
    objc_msgSend(a1, "objectForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setURL:", v5);
    goto LABEL_12;
  }
  objc_msgSend(a1, "internalRepresentationType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "conformsToClass:", objc_opt_class()))
  {

LABEL_10:
    v5 = (void *)objc_opt_new();
    objc_msgSend(a1, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v19);

    v7 = (id *)MEMORY[0x24BDF8410];
    goto LABEL_11;
  }
  objc_msgSend(a1, "internalRepresentationType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "conformsToClass:", objc_opt_class());

  if (v18)
    goto LABEL_10;
  return v2;
}

@end
