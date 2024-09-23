@implementation SBSApplicationShortcutContactIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB8]), "initWithStyle:diameter:", 2, 35.0);
  objc_msgSend(a1, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
  v4 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  objc_msgSend(MEMORY[0x24BDBAEB8], "descriptorForRequiredKeysIncludingImage:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v2, "monogramForContact:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_11:
    objc_msgSend(a1, "imageData");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_6;
    v10 = (void *)v9;
    v11 = objc_alloc_init(MEMORY[0x24BDBAD50]);
    objc_msgSend(v11, "setImageData:", v10);
    objc_msgSend(a1, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGivenName:", v12);

    objc_msgSend(a1, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFamilyName:", v13);

    objc_msgSend(v2, "monogramForContact:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_6:
      objc_msgSend(a1, "firstName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lastName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "monogramForPersonWithFirstName:lastName:", v14, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v2, "silhouetteMonogram");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  objc_msgSend(v8, "imageWithRenderingMode:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
