@implementation SXDocumentController

- (id)additionsForComponents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SXDocumentController *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v18 = self;
  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v9, "additions", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "components");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXDocumentController additionsForComponents:](v18, "additionsForComponents:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v16);

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSArray)requiredResourceURLs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SXDocumentController filterImageResources](self, "filterImageResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentController imageController](self, "imageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allImageResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "URL", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (SXImageController)imageController
{
  return self->_imageController;
}

- (BOOL)requiresLinkedContentForLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  -[SXDocumentController document](self, "document", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "requiresLinkedContent") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (NSArray)additions
{
  NSArray *additions;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  additions = self->_additions;
  if (!additions)
  {
    -[SXDocumentController document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDocumentController additionsForComponents:](self, "additionsForComponents:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_additions;
    self->_additions = v6;

    additions = self->_additions;
  }
  return additions;
}

- (id)filterImageResources
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = objc_opt_class();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(class = %@) OR (class = %@)"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentController document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCEB8];
  -[SXDocumentController document](self, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "removeObjectsInArray:", v9);
  return v14;
}

- (SXDocument)document
{
  return self->_document;
}

- (id)componentLayoutForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXDocumentController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SXDocumentController)initWithDocument:(id)a3 shareURL:(id)a4
{
  id v7;
  id v8;
  SXDocumentController *v9;
  SXJSONObjectMerger *v10;
  SXJSONObjectMerger *componentStyleMerger;
  uint64_t v12;
  NSMutableDictionary *componentStyles;
  SXImageController *v14;
  SXColumnCalculator *v15;
  uint64_t v16;
  SXImageController *imageController;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SXDocumentController;
  v9 = -[SXDocumentController init](&v19, sel_init);
  if (v9)
  {
    v10 = -[SXJSONObjectMerger initWithObjectClass:exclusionKeys:]([SXJSONObjectMerger alloc], "initWithObjectClass:exclusionKeys:", objc_opt_class(), 0);
    componentStyleMerger = v9->_componentStyleMerger;
    v9->_componentStyleMerger = v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    componentStyles = v9->_componentStyles;
    v9->_componentStyles = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v9->_shareURL, a4);
    v14 = [SXImageController alloc];
    v15 = objc_alloc_init(SXColumnCalculator);
    v16 = -[SXImageController initWithDocumentController:columnCalculator:](v14, "initWithDocumentController:columnCalculator:", v9, v15);
    imageController = v9->_imageController;
    v9->_imageController = (SXImageController *)v16;

  }
  return v9;
}

- (id)componentStyleForComponent:(id)a3
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
  void *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "classification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultComponentStyleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  -[SXDocumentController document](self, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentStyles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentController componentStyleMerger](self, "componentStyleMerger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentController mergedObjectsWithIdentifiers:fromDictionary:merger:](self, "mergedObjectsWithIdentifiers:fromDictionary:merger:", v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)resourceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXDocumentController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageResourceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXDocumentController imageController](self, "imageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageResourceForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allResourcesForImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXDocumentController imageController](self, "imageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allResourcesForImageIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)orderedImageIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SXDocumentController imageController](self, "imageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allImageResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "imageIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)requiredNonImageResourceURLs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SXDocumentController filterImageResources](self, "filterImageResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "URL", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "URL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)componentIdentifierUsingThumbnail
{
  void *v3;
  void *v4;
  void *v5;

  -[SXDocumentController document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentController componentIdentifierUsingThumbnailInComponents:](self, "componentIdentifierUsingThumbnailInComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)componentIdentifierUsingThumbnailInComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  __objc2_class **v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v35;
  void *v36;
  id v37;
  SXDocumentController *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = self;
  -[SXDocumentController metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailImageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v8)
    goto LABEL_27;
  v9 = v8;
  v10 = off_24D685000;
  v39 = *(_QWORD *)v41;
  v36 = v6;
  v37 = v7;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v41 != v39)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = v12;
        objc_msgSend(v13, "imageIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v13, "stillImageIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v15 = v14;
        v16 = objc_msgSend(v14, "isEqualToString:", v6);

        if (v16)
        {
          objc_msgSend(v13, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v10;
        v18 = v12;
        objc_msgSend(v18, "items");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v20;
        objc_msgSend(v20, "imageIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v36;
        v23 = objc_msgSend(v22, "isEqualToString:");

        if (v23)
        {
          objc_msgSend(v18, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v37;
          goto LABEL_29;
        }
        v10 = v17;
        v7 = v37;
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v12;
        -[SXDocumentController componentStyleForComponent:](v38, "componentStyleForComponent:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fill");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v21, "fill");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          v10 = off_24D685000;
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v21, "fill");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "imageIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v6);

            if (v30)
            {
              objc_msgSend(v35, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
LABEL_29:

              goto LABEL_30;
            }

            v10 = off_24D685000;
          }
        }
        objc_msgSend(v35, "components");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDocumentController componentIdentifierUsingThumbnailInComponents:](v38, "componentIdentifierUsingThumbnailInComponents:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          goto LABEL_33;

LABEL_25:
LABEL_10:

      }
      ++v11;
    }
    while (v9 != v11);
    v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    v9 = v33;
  }
  while (v33);
LABEL_27:
  v32 = 0;
LABEL_30:

  return v32;
}

- (SXMetadata)metadata
{
  void *v2;
  void *v3;

  -[SXDocumentController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SXMetadata *)v3;
}

- (UIColor)documentBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[SXDocumentController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (UIColor)topBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[SXDocumentController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (id)mergedObjectsWithIdentifiers:(id)a3 fromDictionary:(id)a4 merger:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "mergeObjects:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (void)setImageController:(id)a3
{
  objc_storeStrong((id *)&self->_imageController, a3);
}

- (NSMutableDictionary)componentStyles
{
  return self->_componentStyles;
}

- (void)setComponentStyles:(id)a3
{
  objc_storeStrong((id *)&self->_componentStyles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStyles, 0);
  objc_storeStrong((id *)&self->_imageController, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
