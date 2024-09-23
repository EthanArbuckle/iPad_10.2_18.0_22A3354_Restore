@implementation PLResourceIdentityXPC

- (PLResourceIdentityXPC)initWithResourceType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 uti:(id)a6 conformsToTypes:(int64_t)a7
{
  id v11;
  PLResourceIdentityXPC *v12;
  PLResourceIdentityXPC *v13;
  uint64_t v14;
  PLUniformTypeIdentifier *uniformTypeIdentifier;
  objc_super v17;

  v11 = a6;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)PLResourceIdentityXPC;
    v12 = -[PLResourceIdentityXPC init](&v17, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_resourceType = a3;
      v12->_version = a4;
      v12->_recipeID = a5;
      +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      uniformTypeIdentifier = v13->_uniformTypeIdentifier;
      v13->_uniformTypeIdentifier = (PLUniformTypeIdentifier *)v14;

    }
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (PLResourceIdentityXPC)initWithResource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id *v18;
  PLResourceIdentityXPC *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniformTypeIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_5;
    v7 = (void *)v6;
    objc_msgSend(v5, "uniformTypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "uniformTypeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "uniformTypeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = PLResourceConformsToTypesFromUTI(v12);

    }
    else
    {
LABEL_5:
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PLResourceIdentityShortDescription(v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Attempting to create %{public}@ from resource (%{public}@) with missing uniform type identifier, will guess uti from resource type", (uint8_t *)&v21, 0x16u);

      }
      v11 = 0;
      v13 = 0;
      switch(objc_msgSend(v5, "resourceType"))
      {
        case 0u:
        case 4u:
        case 0xAu:
        case 0xFu:
          v18 = (id *)MEMORY[0x1E0CEC520];
          goto LABEL_14;
        case 1u:
        case 3u:
        case 0xBu:
          v18 = (id *)MEMORY[0x1E0CEC568];
          goto LABEL_14;
        case 2u:
          v18 = (id *)MEMORY[0x1E0CEC450];
          goto LABEL_14;
        case 5u:
        case 6u:
        case 8u:
        case 9u:
        case 0xCu:
        case 0xDu:
        case 0xEu:
        case 0x1Fu:
          v18 = (id *)MEMORY[0x1E0CEC528];
          goto LABEL_14;
        case 7u:
          v18 = (id *)MEMORY[0x1E0CEC4A0];
LABEL_14:
          objc_msgSend(*v18, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 0;
          break;
        case 0x10u:
        case 0x11u:
        case 0x12u:
        case 0x13u:
        case 0x14u:
        case 0x15u:
        case 0x16u:
        case 0x17u:
        case 0x18u:
        case 0x19u:
        case 0x1Au:
        case 0x1Bu:
        case 0x1Cu:
        case 0x1Du:
        case 0x1Eu:
          break;
        default:
          v13 = 0;
          break;
      }
    }
    v19 = -[PLResourceIdentityXPC initWithResourceType:version:recipeID:uti:conformsToTypes:](self, "initWithResourceType:version:recipeID:uti:conformsToTypes:", objc_msgSend(v5, "resourceType"), objc_msgSend(v5, "version"), objc_msgSend(v5, "recipeID"), v11, v13);

  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (PLResourceIdentityXPC)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PLResourceIdentityXPC *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceRecipeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceUniformTypeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conformsToTypes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PLResourceIdentityXPC initWithResourceType:version:recipeID:uti:conformsToTypes:](self, "initWithResourceType:version:recipeID:uti:conformsToTypes:", v6, v8, v10, v11, objc_msgSend(v12, "integerValue"));
  return v13;
}

- (BOOL)isOriginalResource
{
  PLResourceIdentityXPC *v2;
  BOOL v3;

  v2 = self;
  if (-[PLResourceIdentityXPC version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PLResourceIdentityXPC recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t resourceType;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLResourceIdentityXPC recipeID](self, "recipeID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  resourceType = self->_resourceType;
  if (resourceType > 0x1F)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E3662240[resourceType];
  v9 = v8;
  -[PLUniformTypeIdentifier identifier](self->_uniformTypeIdentifier, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> %@, recipe: %@, uti: %@"), v6, self, v9, v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

+ (id)imageRequestResourceForDataStoreKey:(id)a3 store:(id)a4 assetObjectID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__90158;
  v31 = __Block_byref_object_dispose__90159;
  v32 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__PLResourceIdentityXPC_imageRequestResourceForDataStoreKey_store_assetObjectID_context___block_invoke;
  v20[3] = &unk_1E36741F8;
  v14 = v12;
  v21 = v14;
  v15 = v13;
  v22 = v15;
  v16 = v10;
  v23 = v16;
  v17 = v11;
  v24 = v17;
  v25 = &v27;
  v26 = a1;
  objc_msgSend(v15, "performBlockAndWait:", v20);
  v18 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v18;
}

+ (id)dictionaryRepresentationFromResourceIdentity:(id)a3
{
  id v3;
  void *v4;
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
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16[0] = CFSTR("resourceType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "resourceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v16[1] = CFSTR("resourceVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    v16[2] = CFSTR("resourceRecipeID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "recipeID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v8;
    v16[3] = CFSTR("resourceUniformTypeIdentifier");
    objc_msgSend(v3, "uniformTypeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v10;
    v16[4] = CFSTR("conformsToTypes");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "uniformTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", PLResourceConformsToTypesFromUTI(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)possibleClassesInDictionaryRepresentation
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
}

void __89__PLResourceIdentityXPC_imageRequestResourceForDataStoreKey_store_assetObjectID_context___block_invoke(uint64_t a1)
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
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inManagedObjectContext:](PLManagedAsset, "assetWithObjectID:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v2, "fetchResourcesForAssetVersions:allowDerivatives:additionalPredicate:relationshipKeyPathsForPrefetching:error:", 0, 1, 0, 0, &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "dataStoreKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToKey:", *(_QWORD *)(a1 + 48)) & 1) != 0)
        {
          objc_msgSend(v9, "dataStore");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 56));

          if (v12)
          {
            v13 = objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithResource:", v9);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v6);
  }
LABEL_12:

}

@end
