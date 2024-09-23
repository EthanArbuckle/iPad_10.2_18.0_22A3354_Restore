@implementation PXPhotoKitCollectionMenuNode

- (PXPhotoKitCollectionMenuNode)initWithCollection:(id)a3
{
  id v5;
  PXPhotoKitCollectionMenuNode *v6;
  PXPhotoKitCollectionMenuNode *v7;
  __CFString *v8;
  uint64_t v9;
  NSMutableArray *childNodes;
  uint64_t v11;
  NSMutableDictionary *childNodesByLocalIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitCollectionMenuNode;
  v6 = -[PXPhotoKitCollectionMenuNode init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    if (objc_msgSend(v5, "canContainAssets"))
      v8 = CFSTR("rectangle.stack");
    else
      v8 = CFSTR("folder");
    objc_storeStrong((id *)&v7->_symbolName, v8);
    v9 = objc_opt_new();
    childNodes = v7->_childNodes;
    v7->_childNodes = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    childNodesByLocalIdentifier = v7->_childNodesByLocalIdentifier;
    v7->_childNodesByLocalIdentifier = (NSMutableDictionary *)v11;

  }
  return v7;
}

- (PXPhotoKitCollectionMenuNode)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionMenuNode.m"), 66, CFSTR("%s is not available as initializer"), "-[PXPhotoKitCollectionMenuNode init]");

  abort();
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  -[PXPhotoKitCollectionMenuNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)childNodes
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_childNodes, "copy");
}

- (void)addChildNode:(id)a3
{
  NSMutableDictionary *childNodesByLocalIdentifier;
  void *v5;
  void *v6;
  id v7;

  childNodesByLocalIdentifier = self->_childNodesByLocalIdentifier;
  v7 = a3;
  objc_msgSend(v7, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](childNodesByLocalIdentifier, "setObject:forKey:", v7, v6);

  -[NSMutableArray addObject:](self->_childNodes, "addObject:", v7);
}

- (void)sortChildNodes
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *childNodesByLocalIdentifier;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitCollectionMenuNode collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4 && (unint64_t)-[NSMutableDictionary count](self->_childNodesByLocalIdentifier, "count") >= 2)
    {
      objc_msgSend(v4, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "librarySpecificFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0CB3880];
      -[NSMutableDictionary allKeys](self->_childNodesByLocalIdentifier, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "predicateWithFormat:", CFSTR("localIdentifier in (%@)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v9);

      objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v4, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeAllObjects](self->_childNodes, "removeAllObjects");
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v10;
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
            childNodesByLocalIdentifier = self->_childNodesByLocalIdentifier;
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "localIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](childNodesByLocalIdentifier, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableArray addObject:](self->_childNodes, "addObject:", v18);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
  }
  else
  {

    v4 = 0;
  }

}

- (PHCollection)collection
{
  return self->_collection;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_childNodesByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_childNodes, 0);
}

+ (id)rootNodeForAssetCollectionsContainingAsset:(id)a3 excludedAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchRootAlbumCollectionListWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v11;
  v32 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollection:", v11);
  v12 = (void *)objc_opt_new();
  v28 = v7;
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0CD13B8], "px_fetchContainingCollectionsForAsset:excludedAssetCollection:", v6, v7);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v34 = v13;
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        v15 = v32;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v14, "px_fetchAncestryIncludingRoot:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v36;
          do
          {
            v20 = 0;
            v21 = v15;
            do
            {
              if (*(_QWORD *)v36 != v19)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
              if (objc_msgSend(v22, "canContainCollections"))
              {
                objc_msgSend(v22, "localIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", v23);
                v15 = (id)objc_claimAutoreleasedReturnValue();

                if (v15)
                  goto LABEL_16;
                v15 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollection:", v22);
                objc_msgSend(v22, "localIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v24);

              }
              else
              {
                v15 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollection:", v22);
              }
              objc_msgSend(v21, "addChildNode:", v15);
LABEL_16:

              ++v20;
              v21 = v15;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v18);
        }

        v13 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v33);
  }

  return v32;
}

@end
