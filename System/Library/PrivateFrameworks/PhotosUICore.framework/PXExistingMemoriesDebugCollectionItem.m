@implementation PXExistingMemoriesDebugCollectionItem

- (PXExistingMemoriesDebugCollectionItem)initWithMemory:(id)a3
{
  id v5;
  PXExistingMemoriesDebugCollectionItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *name;
  void *v14;
  uint64_t v15;
  NSString *description;
  void **p_description;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXExistingMemoriesDebugCollectionItem;
  v6 = -[PXExistingMemoriesDebugCollectionItem init](&v28, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR(" "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v8, "uuid");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    name = v6->_name;
    v6->_name = v12;

    objc_msgSend(v5, "localizedSubtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR(" "));
    v15 = objc_claimAutoreleasedReturnValue();
    p_description = (void **)&v6->_description;
    description = v6->_description;
    v6->_description = (NSString *)v15;

    -[NSString stringByAppendingString:](v6->_description, "stringByAppendingString:", CFSTR(", "));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_1E5149688;
    objc_storeStrong((id *)&v6->_description, v20);

    v21 = *p_description;
    v22 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v8, "creationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringFromDate:dateStyle:timeStyle:", v23, 1, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *p_description;
    *p_description = (void *)v25;

    objc_storeStrong((id *)&v6->_memory, a3);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (PHMemory)memory
{
  return (PHMemory *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
