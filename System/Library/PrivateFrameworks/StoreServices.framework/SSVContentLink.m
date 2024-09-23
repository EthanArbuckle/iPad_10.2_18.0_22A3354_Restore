@implementation SSVContentLink

- (NSURL)URL
{
  int64_t v3;
  int64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  const __CFString *v11;
  void *v12;
  NSString *categoryName;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = -[SSVContentLink targetApplication](self, "targetApplication");
  v4 = -[SSVContentLink contentKind](self, "contentKind");
  if (!v3)
  {
    v3 = -[SSVContentLink _targetApplicationWithContentKind:](self, "_targetApplicationWithContentKind:", v4);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Must specify target app or content kind"));
      v16 = 0;
      return (NSURL *)v16;
    }
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  -[SSVContentLink _URLSchemeWithApplication:](self, "_URLSchemeWithApplication:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v6);

  objc_msgSend(v5, "setPath:", CFSTR("/"));
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_itemIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("action"), CFSTR("lookup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = (void *)MEMORY[0x1E0CB39D8];
    -[NSNumber stringValue](self->_itemIdentifier, "stringValue");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("ids");
    v12 = v9;
    categoryName = v10;
  }
  else
  {
    if (self->_searchTerm)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("action"), CFSTR("search"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("term"), self->_searchTerm);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);
      goto LABEL_9;
    }
    -[SSVContentLink _stringForContentKind:](self, "_stringForContentKind:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)v18;
    if (v3 != 3 || !v18)
    {
      if (self->_itemTitle || self->_providerName || self->_categoryName)
      {
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("term"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v23);

      }
      if (!objc_msgSend(v7, "count"))
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("action"), CFSTR("search"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertObject:atIndex:", v14, 0);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("action"), CFSTR("library-link"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("kind"), v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v20);

    if (self->_itemTitle)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v21);

    }
    if (self->_providerName)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("an"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v22);

    }
    categoryName = self->_categoryName;
    if (!categoryName)
      goto LABEL_9;
    v12 = (void *)MEMORY[0x1E0CB39D8];
    v11 = CFSTR("gn");
  }
  objc_msgSend(v12, "queryItemWithName:value:", v11, categoryName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);
LABEL_6:

LABEL_9:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "setQueryItems:", v7);
    objc_msgSend(v5, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return (NSURL *)v16;
}

- (id)_stringForContentKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 6)
    return 0;
  else
    return off_1E47B9478[a3 - 2];
}

- (int64_t)_targetApplicationWithContentKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return qword_1A27A0C60[a3 - 1];
}

- (id)_URLSchemeWithApplication:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E47B94B0[a3 - 1];
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)contentKind
{
  return self->_contentKind;
}

- (void)setContentKind:(int64_t)a3
{
  self->_contentKind = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)targetApplication
{
  return self->_targetApplication;
}

- (void)setTargetApplication:(int64_t)a3
{
  self->_targetApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end
