@implementation SBSApplicationShortcutItem

id __108__SBSApplicationShortcutItem_SBHAdditions__sb_buildIconImageWithApplicationBundleURL_image_systemImageName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v5 = (void *)getCNContactStoreClass_softClass;
    v30 = getCNContactStoreClass_softClass;
    if (!getCNContactStoreClass_softClass)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __getCNContactStoreClass_block_invoke;
      v25 = &unk_1E8D85AF8;
      v26 = &v27;
      __getCNContactStoreClass_block_invoke((uint64_t)&v22);
      v5 = (void *)v28[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v27, 8);
    v7 = objc_alloc_init(v6);
    objc_msgSend(getCNMonogrammerClass(), "descriptorForRequiredKeysIncludingImage:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "monogramForContact:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v12 = (id *)(a1 + 32);
    objc_msgSend(v13, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "lastName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v16 = (void *)getCNMutableContactClass_softClass;
      v30 = getCNMutableContactClass_softClass;
      if (!getCNMutableContactClass_softClass)
      {
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __getCNMutableContactClass_block_invoke;
        v25 = &unk_1E8D85AF8;
        v26 = &v27;
        __getCNMutableContactClass_block_invoke((uint64_t)&v22);
        v16 = (void *)v28[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v27, 8);
      v18 = objc_alloc_init(v17);
      v19 = v18;
      if (v10)
        objc_msgSend(v18, "setGivenName:", v10);
      if (v14)
        objc_msgSend(v19, "setFamilyName:", v14);
      objc_msgSend(v19, "setImageData:", v15);
      objc_msgSend(v3, "monogramForContact:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "monogramForPersonWithFirstName:lastName:", v10, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (!v11)
  {
    objc_msgSend(v3, "silhouetteMonogram");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "imageWithRenderingMode:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
