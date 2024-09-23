@implementation _TVTemplateFactory

- (_TVTemplateFactory)init
{
  _TVTemplateFactory *v2;
  _TVTemplateFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVTemplateFactory;
  v2 = -[_TVTemplateFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_TVTemplateFactory _registerTemplateControllers](v2, "_registerTemplateControllers");
    -[_TVTemplateFactory _registerCustomAnimators](v3, "_registerCustomAnimators");
  }
  return v3;
}

- (void)_registerTemplateControllers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_registerViewControllerCreator:withType:", &__block_literal_global_10, 66);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_registerViewControllerCreator:withType:", &__block_literal_global_11_0, 74);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_registerViewControllerCreator:withType:", &__block_literal_global_13_0, 71);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_registerViewControllerCreator:withType:", &__block_literal_global_15_0, 63);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_registerViewControllerCreator:withType:", &__block_literal_global_17_1, 69);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_registerViewControllerCreator:withType:", &__block_literal_global_19_0, 65);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_registerViewControllerCreator:withType:", &__block_literal_global_21_1, 67);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_registerViewControllerCreator:withType:", &__block_literal_global_23_0, 61);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_registerViewControllerCreator:withType:", &__block_literal_global_25_0, 62);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_registerViewControllerCreator:withType:", &__block_literal_global_26_0, 73);

}

- (void)registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v5 = a5;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v7 = a4;
  v25[0] = CFSTR("BaseStyleSheet");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "addObject:", CFSTR("ProductStyleSheet"));
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v11, "URLForResource:withExtension:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), CFSTR("xml"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x24BE519F8], "registerStyleSheetURL:parentStyleSheets:forTemplateName:", v19, v12, v7);
}

- (void)_registerStyleSheet:(id)a3 forTemplate:(id)a4 parentStyleSheets:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  objc_msgSend(v11, "_styleSheetURLForTemplate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v7;
  objc_msgSend(v10, "URLForResource:withExtension:", v7, CFSTR("xml"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v10, "URLForResource:withExtension:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19), CFSTR("xml"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  if (v12)
  {
    objc_msgSend(v14, "addObject:", v13);
    v21 = v12;

    v13 = v21;
  }
  objc_msgSend(MEMORY[0x24BE519F8], "registerStyleSheetURL:parentStyleSheets:forTemplateName:", v13, v14, v22);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvmlKitBundle, 0);
}

@end
