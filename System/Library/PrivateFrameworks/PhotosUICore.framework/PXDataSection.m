@implementation PXDataSection

- (PXDataSection)initWithOutlineObject:(id)a3
{
  id v5;
  PXDataSection *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDataSection;
  v6 = -[PXDataSection init](&v8, sel_init);
  if (v6)
  {
    v6->_identifier = sub_1A7ADF414();
    objc_storeStrong((id *)&v6->_outlineObject, a3);
  }

  return v6;
}

- (PXDataSection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSection.m"), 24, CFSTR("%s is not available as initializer"), "-[PXDataSection init]");

  abort();
}

- (int64_t)count
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSection.m"), 30, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSection count]", v6);

  abort();
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSection.m"), 34, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSection objectAtIndex:]", v7);

  abort();
}

- (id)objectsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PXDataSection *v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__PXDataSection_objectsAtIndexes___block_invoke;
  v10[3] = &unk_1E51460E8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);

  v8 = v7;
  return v8;
}

- (BOOL)containsAnyObjects
{
  return -[PXDataSection count](self, "count") > 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier = %ld, count = %ld>"),
                       objc_opt_class(),
                       self,
                       -[PXDataSection identifier](self, "identifier"),
                       -[PXDataSection count](self, "count"));
}

- (NSString)debugDescription
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[PXDataSection count](self, "count");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier = %ld, count = %ld, items = ("),
    objc_opt_class(),
    self,
    -[PXDataSection identifier](self, "identifier"),
    v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[PXDataSection objectAtIndex:](self, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("\n\t[%ld]%@"), i, v7);

    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("\n)>"));
  return (NSString *)v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSection.m"), 69, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDataSection countByEnumeratingWithState:objects:count:]", v9);

  abort();
}

- (NSObject)outlineObject
{
  return self->_outlineObject;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_outlineObject, 0);
}

void __34__PXDataSection_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)dataSectionForAssetsInAssetContainers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXStackedDataSection *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PXFetchResultDataSection *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPersons:options:", v3, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = v3;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "px_fetchContainedAssets", (_QWORD)v17);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = -[PXFetchResultDataSection initWithFetchResult:]([PXFetchResultDataSection alloc], "initWithFetchResult:", v14);
              objc_msgSend(v7, "addObject:", v15);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v11);
        }

        v8 = -[PXStackedDataSection initWithChildDataSections:outlineObject:]([PXStackedDataSection alloc], "initWithChildDataSections:outlineObject:", v7, 0);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchExclusiveAssetsForSocialGroup:options:", v4, 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    v8 = -[PXFetchResultDataSection initWithFetchResult:]([PXFetchResultDataSection alloc], "initWithFetchResult:", v6);
LABEL_16:
    v5 = v8;

    goto LABEL_17;
  }
  +[PXStackedDataSection dataSectionForAssetsInCollections:](PXStackedDataSection, "dataSectionForAssetsInCollections:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v5;
}

- (id)firstObject
{
  void *v3;

  if (-[PXDataSection containsAnyObjects](self, "containsAnyObjects"))
  {
    -[PXDataSection objectAtIndex:](self, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
