@implementation TVStyleSheetRegistry

- (TVStyleSheetRegistry)init
{
  TVStyleSheetRegistry *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  _TVTemplateTreeNode *v9;
  _TVTemplateTreeNode *v10;
  uint64_t v11;
  NSMutableArray *rootNodes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TVStyleSheetRegistry;
  v2 = -[TVStyleSheetRegistry init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("AppleTV"));

    if (v4 == 2 || v7 == 0)
    {
      -[TVStyleSheetRegistry _createDefaultRootNodes](v2, "_createDefaultRootNodes");
    }
    else
    {
      v9 = [_TVTemplateTreeNode alloc];
      v10 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:abstract:](v9, "initWithTemplateName:styleSheetURLs:abstract:", CFSTR("<baseTemplate>"), MEMORY[0x24BDBD1A8], 1);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      rootNodes = v2->_rootNodes;
      v2->_rootNodes = (NSMutableArray *)v11;

      -[NSMutableArray addObject:](v2->_rootNodes, "addObject:", v10);
    }
    -[TVStyleSheetRegistry commitStyleSheets](v2, "commitStyleSheets");
  }
  return v2;
}

- (void)commitStyleSheets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TVStyleSheetRegistry rootNodes](self, "rootNodes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[TVStyleSheetRegistry _commitTemplateTreeNode:withParentStyleSheetURLs:](self, "_commitTemplateTreeNode:withParentStyleSheetURLs:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSMutableArray)rootNodes
{
  return self->_rootNodes;
}

- (void)_commitTemplateTreeNode:(id)a3 withParentStyleSheetURLs:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *nodesByTemplateName;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  nodesByTemplateName = self->_nodesByTemplateName;
  if (!nodesByTemplateName)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_nodesByTemplateName;
    self->_nodesByTemplateName = v9;

    nodesByTemplateName = self->_nodesByTemplateName;
  }
  objc_msgSend(v6, "templateName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](nodesByTemplateName, "setObject:forKeyedSubscript:", v6, v11);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "templateName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_styleSheetURLForTemplate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15 = objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  v31 = v7;
  objc_msgSend(v6, "styleSheetURLs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  if (v14)
    objc_msgSend(v16, "addObject:", v14);
  v18 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v6, "setFinalURLs:", v18);

  if ((objc_msgSend(v6, "isAbstract") & 1) == 0)
  {
    v19 = objc_msgSend(v16, "count");
    v20 = v19 - 1;
    if (v19 < 1)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectAtIndex:", v20);
    }
    v22 = (void *)MEMORY[0x24BE519F8];
    objc_msgSend(v6, "templateName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerStyleSheetURL:parentStyleSheets:forTemplateName:", v21, v16, v23);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "derivedTemplateNodes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v28);
        objc_msgSend(v6, "finalURLs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVStyleSheetRegistry _commitTemplateTreeNode:withParentStyleSheetURLs:](self, "_commitTemplateTreeNode:withParentStyleSheetURLs:", v29, v30);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v26);
  }

}

- (void)registerStyleSheetURLs:(id)a3 forTemplateName:(id)a4 basedOnTemplateName:(id)a5
{
  id v8;
  id v9;
  _TVTemplateTreeNode *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:]([_TVTemplateTreeNode alloc], "initWithTemplateName:styleSheetURLs:", v8, v9);

  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_nodesByTemplateName, "objectForKeyedSubscript:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addDerivedTemplateNode:", v10);
    objc_msgSend(v11, "finalURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVStyleSheetRegistry _commitTemplateTreeNode:withParentStyleSheetURLs:](self, "_commitTemplateTreeNode:withParentStyleSheetURLs:", v10, v12);

  }
  else
  {
    -[NSMutableArray addObject:](self->_rootNodes, "addObject:", v10);
    -[TVStyleSheetRegistry _commitTemplateTreeNode:withParentStyleSheetURLs:](self, "_commitTemplateTreeNode:withParentStyleSheetURLs:", v10, 0);
  }

}

+ (id)_urlForStyleSheetName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("xml"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_createDefaultRootNodes
{
  NSMutableArray *v3;
  NSMutableArray *rootNodes;
  _TVTemplateTreeNode *v5;
  void *v6;
  void *v7;
  _TVTemplateTreeNode *v8;
  _TVTemplateTreeNode *v9;
  void *v10;
  void *v11;
  _TVTemplateTreeNode *v12;
  void *v13;
  void *v14;
  _TVTemplateTreeNode *v15;
  void *v16;
  void *v17;
  _TVTemplateTreeNode *v18;
  void *v19;
  void *v20;
  _TVTemplateTreeNode *v21;
  void *v22;
  void *v23;
  _TVTemplateTreeNode *v24;
  void *v25;
  void *v26;
  _TVTemplateTreeNode *v27;
  void *v28;
  void *v29;
  _TVTemplateTreeNode *v30;
  _TVTemplateTreeNode *v31;
  void *v32;
  void *v33;
  _TVTemplateTreeNode *v34;
  _TVTemplateTreeNode *v35;
  void *v36;
  void *v37;
  _TVTemplateTreeNode *v38;
  _TVTemplateTreeNode *v39;
  void *v40;
  void *v41;
  _TVTemplateTreeNode *v42;
  _TVTemplateTreeNode *v43;
  _TVTemplateTreeNode *v44;
  _TVTemplateTreeNode *v45;
  _TVTemplateTreeNode *v46;
  _TVTemplateTreeNode *v47;
  _TVTemplateTreeNode *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  rootNodes = self->_rootNodes;
  self->_rootNodes = v3;

  v5 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("BaseStyleSheet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:abstract:](v5, "initWithTemplateName:styleSheetURLs:abstract:", CFSTR("<baseTemplate>"), v7, 1);

  -[NSMutableArray addObject:](self->_rootNodes, "addObject:", v8);
  v9 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("ListStyleSheet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v9, "initWithTemplateName:styleSheetURLs:", CFSTR("listTemplate"), v11);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v48);
  v12 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("StackStyleSheet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v12, "initWithTemplateName:styleSheetURLs:", CFSTR("stackTemplate"), v14);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v47);
  v15 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("MenuBarStyleSheet"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v15, "initWithTemplateName:styleSheetURLs:", CFSTR("menuBarTemplate"), v17);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v46);
  v18 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("SearchStyleSheet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v18, "initWithTemplateName:styleSheetURLs:", CFSTR("searchTemplate"), v20);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v45);
  v21 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("ProductStyleSheet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v21, "initWithTemplateName:styleSheetURLs:", CFSTR("productTemplate"), v23);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v44);
  v24 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("DescriptiveAlertStyleSheet"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v24, "initWithTemplateName:styleSheetURLs:", CFSTR("descriptiveAlertTemplate"), v26);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v43);
  v27 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("AlertStyleSheet"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v27, "initWithTemplateName:styleSheetURLs:", CFSTR("alertTemplate"), v29);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v30);
  v31 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("DialogStyleSheet"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v31, "initWithTemplateName:styleSheetURLs:", CFSTR("dialogTemplate"), v33);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v34);
  v35 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("LoadingStyleSheet"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v35, "initWithTemplateName:styleSheetURLs:", CFSTR("loadingTemplate"), v37);

  -[NSMutableArray addObject:](self->_rootNodes, "addObject:", v38);
  v39 = [_TVTemplateTreeNode alloc];
  objc_msgSend((id)objc_opt_class(), "_urlForStyleSheetName:", CFSTR("ModalPageStyleSheet"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[_TVTemplateTreeNode initWithTemplateName:styleSheetURLs:](v39, "initWithTemplateName:styleSheetURLs:", CFSTR("modalPageTemplate"), v41);

  -[_TVTemplateTreeNode addDerivedTemplateNode:](v8, "addDerivedTemplateNode:", v42);
}

- (void)setRootNodes:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodes, a3);
}

- (NSMutableDictionary)nodesByTemplateName
{
  return self->_nodesByTemplateName;
}

- (void)setNodesByTemplateName:(id)a3
{
  objc_storeStrong((id *)&self->_nodesByTemplateName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByTemplateName, 0);
  objc_storeStrong((id *)&self->_rootNodes, 0);
}

@end
