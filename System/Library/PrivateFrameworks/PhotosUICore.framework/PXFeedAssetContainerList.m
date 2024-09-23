@implementation PXFeedAssetContainerList

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXFeedAssetContainerList containers](self, "containers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXFeedAssetContainerList containers](self, "containers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)containersCount
{
  void *v2;
  unint64_t v3;

  -[PXFeedAssetContainerList containers](self, "containers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXFeedAssetContainerList containers](self, "containers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEmpty"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)canEditContainers
{
  return 0;
}

- (id)managedObjectContext
{
  return 0;
}

- (id)photoLibrary
{
  return 0;
}

- (id)containersRelationshipName
{
  return 0;
}

- (NSString)transientIdentifier
{
  NSString *transientIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  transientIdentifier = self->_transientIdentifier;
  if (!transientIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_transientIdentifier;
    self->_transientIdentifier = v5;

    transientIdentifier = self->_transientIdentifier;
  }
  return transientIdentifier;
}

- (NSOrderedSet)sectionInfos
{
  return self->_sectionInfos;
}

- (void)setSectionInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfos, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

@end
